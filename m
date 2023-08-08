Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BC7743B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 20:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9EF10E3E5;
	Tue,  8 Aug 2023 18:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (e10edge.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6510E3E5;
 Tue,  8 Aug 2023 18:08:46 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 8 Aug
 2023 21:04:22 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 8 Aug 2023
 21:04:21 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/radeon: check return value of radeon_ring_lock()
Date: Tue, 8 Aug 2023 11:04:16 -0700
Message-ID: <20230808180416.7567-1-n.zhandarovich@fintech.ru>
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
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the unlikely event of radeon_ring_lock() failing, its errno return
value should be processed. This patch checks said return value and
prints a debug message in case of an error.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 48c0c902e2e6 ("drm/radeon/kms: add support for CP setup on SI")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/radeon/si.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 8d5e4b25609d..df1b2ebc37c2 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -3611,6 +3611,10 @@ static int si_cp_start(struct radeon_device *rdev)
 	for (i = RADEON_RING_TYPE_GFX_INDEX; i <= CAYMAN_RING_TYPE_CP2_INDEX; ++i) {
 		ring = &rdev->ring[i];
 		r = radeon_ring_lock(rdev, ring, 2);
+		if (r) {
+			DRM_ERROR("radeon: cp failed to lock ring (%d).\n", r);
+			return r;
+		}
 
 		/* clear the compute context state */
 		radeon_ring_write(ring, PACKET3_COMPUTE(PACKET3_CLEAR_STATE, 0));
-- 
2.25.1

