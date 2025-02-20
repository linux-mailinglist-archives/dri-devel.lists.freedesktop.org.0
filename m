Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2CCA3D174
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 07:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C14910E8D5;
	Thu, 20 Feb 2025 06:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EB110E8D5;
 Thu, 20 Feb 2025 06:41:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-03 (Coremail) with SMTP id rQCowABXPTCCzrZnmmLTDg--.47725S2;
 Thu, 20 Feb 2025 14:41:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/radeon: Add error handlings for r420 cp errata initiation
Date: Thu, 20 Feb 2025 14:40:49 +0800
Message-ID: <20250220064050.686-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXPTCCzrZnmmLTDg--.47725S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW3KrWUKFyktryUWFW5Awb_yoW5Jr45pa
 1kKa90yrZrKayIyr9rGay7J3W5Cw48Ka17Wry7Gw1Fkw1rJFs8JFyfGryUGrykGrZ2k3Wj
 yryvk3ykuw4vv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxV
 WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS
 5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIec
 xEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjOJ
 57UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRATA2e2jPzMJgAAsC
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In r420_cp_errata_init(), the RESYNC information is stored even
when the Scratch register is not correctly allocated.

Change the return type of r420_cp_errata_init() from void to int
to propagate errors to the caller. Add error checking after
radeon_scratch_get() to ensure RESYNC information is stored
to an allocated address. Log an error message and return the
error code immediately when radeon_scratch_get() fails.
Additionally, handle the return value of r420_cp_errata_init() in
r420_startup() to log an appropriate error message and propagate
the error if initialization fails.

Fixes: 62cdc0c20663 ("drm/radeon/kms: Workaround RV410/R420 CP errata (V3)")
Cc: stable@vger.kernel.org # 2.6.33+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/r420.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 9a31cdec6415..67c55153cba8 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -204,7 +204,7 @@ static void r420_clock_resume(struct radeon_device *rdev)
 	WREG32_PLL(R_00000D_SCLK_CNTL, sclk_cntl);
 }
 
-static void r420_cp_errata_init(struct radeon_device *rdev)
+static int r420_cp_errata_init(struct radeon_device *rdev)
 {
 	int r;
 	struct radeon_ring *ring = &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
@@ -215,7 +215,11 @@ static void r420_cp_errata_init(struct radeon_device *rdev)
 	 * The proper workaround is to queue a RESYNC at the beginning
 	 * of the CP init, apparently.
 	 */
-	radeon_scratch_get(rdev, &rdev->config.r300.resync_scratch);
+	r = radeon_scratch_get(rdev, &rdev->config.r300.resync_scratch);
+	if (r) {
+		DRM_ERROR("failed to get scratch reg (%d).\n", r);
+		return r;
+	}
 	r = radeon_ring_lock(rdev, ring, 8);
 	WARN_ON(r);
 	radeon_ring_write(ring, PACKET0(R300_CP_RESYNC_ADDR, 1));
@@ -290,8 +294,11 @@ static int r420_startup(struct radeon_device *rdev)
 		dev_err(rdev->dev, "failed initializing CP (%d).\n", r);
 		return r;
 	}
-	r420_cp_errata_init(rdev);
-
+	r = r420_cp_errata_init(rdev);
+	if (r) {
+		dev_err(rdev->dev, "failed initializing CP errata workaround (%d).\n", r);
+		return r;
+	}
 	r = radeon_ib_pool_init(rdev);
 	if (r) {
 		dev_err(rdev->dev, "IB initialization failed (%d).\n", r);
-- 
2.42.0.windows.2

