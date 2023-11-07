Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74447E3CBE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D467C10E520;
	Tue,  7 Nov 2023 12:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78410E527;
 Tue,  7 Nov 2023 12:19:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1E0861005;
 Tue,  7 Nov 2023 12:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B36C433D9;
 Tue,  7 Nov 2023 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359580;
 bh=Q6YYRvqRyl++sOeRzoU6OTGe8lg1e6BT3F7TEeVdgxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nd/Pk/F0YLDc0RBg2YWCH2ICD9kWUdyGb7Qygs5RIoDggA08chcfbqeheeeQXjHVv
 k6Tjcrk3ADvRh6aapm0nGw2LCWT/9kjmzReKjjOVVdqcpzHhg4qIExYOQ/5EQ9cRaU
 zEZN9hdyyUZlfUMnCWnBNuR/pbWclypqnn02vjjV9p/QD1/0p0WAtzXSXghC+uMvdm
 ENlBJVwVijKJMO3be/jjoU3EQu0ISJA7AMSdWC2EA4Hozli0PI/rtpUoro/PwMz2pg
 C2n9GuAicqRIIPf/3u0ovnza5c1F9ArRdEBI2AJ25+SajmhZ7gft7Oln3rlBzuV0Yl
 5xsPZI27TbgXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 11/40] drm/amdgpu: update retry times for psp vmbx
 wait
Date: Tue,  7 Nov 2023 07:16:13 -0500
Message-ID: <20231107121837.3759358-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tao Zhou <tao.zhou1@amd.com>, asad.kamal@amd.com, lijo.lazar@amd.com,
 YiPeng.Chai@amd.com, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

[ Upstream commit fc598890715669ff794b253fdf387cd02b9396f8 ]

Increase the retry loops and replace the constant number with macro.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index 469eed084976c..52d80f286b3dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -59,6 +59,9 @@ MODULE_FIRMWARE("amdgpu/psp_14_0_0_ta.bin");
 /* Read USB-PD from LFB */
 #define GFX_CMD_USB_PD_USE_LFB 0x480
 
+/* Retry times for vmbx ready wait */
+#define PSP_VMBX_POLLING_LIMIT 20000
+
 /* VBIOS gfl defines */
 #define MBOX_READY_MASK 0x80000000
 #define MBOX_STATUS_MASK 0x0000FFFF
@@ -138,7 +141,7 @@ static int psp_v13_0_wait_for_vmbx_ready(struct psp_context *psp)
 	struct amdgpu_device *adev = psp->adev;
 	int retry_loop, ret;
 
-	for (retry_loop = 0; retry_loop < 70; retry_loop++) {
+	for (retry_loop = 0; retry_loop < PSP_VMBX_POLLING_LIMIT; retry_loop++) {
 		/* Wait for bootloader to signify that is
 		   ready having bit 31 of C2PMSG_33 set to 1 */
 		ret = psp_wait_for(
-- 
2.42.0

