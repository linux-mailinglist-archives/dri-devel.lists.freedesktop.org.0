Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72683088A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC410E6A0;
	Wed, 17 Jan 2024 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 14:50:10 UTC
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D52110E121;
 Wed, 17 Jan 2024 14:50:10 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 17 Jan
 2024 17:44:39 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 17 Jan
 2024 17:44:39 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/radeon: remove dead code in ni_mc_load_microcode()
Date: Wed, 17 Jan 2024 06:44:36 -0800
Message-ID: <20240117144436.10930-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside the if block with (running == 0), the checks for 'running'
possibly being non-zero are redundant. Remove them altogether.

This change is similar to the one authored by Heinrich Schuchardt
<xypron.glpk@gmx.de> in commit
ddbbd3be9679 ("drm/radeon: remove dead code, si_mc_load_microcode (v2)")

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool Svace.

Fixes: 0af62b016804 ("drm/radeon/kms: add ucode loader for NI")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/radeon/ni.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
index 927e5f42e97d..8eac8c090433 100644
--- a/drivers/gpu/drm/radeon/ni.c
+++ b/drivers/gpu/drm/radeon/ni.c
@@ -624,7 +624,7 @@ static const u32 cayman_io_mc_regs[BTC_IO_MC_REGS_SIZE][2] = {
 int ni_mc_load_microcode(struct radeon_device *rdev)
 {
 	const __be32 *fw_data;
-	u32 mem_type, running, blackout = 0;
+	u32 mem_type, running;
 	u32 *io_mc_regs;
 	int i, ucode_size, regs_size;
 
@@ -659,11 +659,6 @@ int ni_mc_load_microcode(struct radeon_device *rdev)
 	running = RREG32(MC_SEQ_SUP_CNTL) & RUN_MASK;
 
 	if ((mem_type == MC_SEQ_MISC0_GDDR5_VALUE) && (running == 0)) {
-		if (running) {
-			blackout = RREG32(MC_SHARED_BLACKOUT_CNTL);
-			WREG32(MC_SHARED_BLACKOUT_CNTL, 1);
-		}
-
 		/* reset the engine and set to writable */
 		WREG32(MC_SEQ_SUP_CNTL, 0x00000008);
 		WREG32(MC_SEQ_SUP_CNTL, 0x00000010);
@@ -689,9 +684,6 @@ int ni_mc_load_microcode(struct radeon_device *rdev)
 				break;
 			udelay(1);
 		}
-
-		if (running)
-			WREG32(MC_SHARED_BLACKOUT_CNTL, blackout);
 	}
 
 	return 0;
