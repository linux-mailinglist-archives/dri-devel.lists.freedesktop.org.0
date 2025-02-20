Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF1A3D17B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 07:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF4710E8D4;
	Thu, 20 Feb 2025 06:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187510E8D4;
 Thu, 20 Feb 2025 06:43:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-03 (Coremail) with SMTP id rQCowADHzg71zrZnPHzTDg--.57290S2;
 Thu, 20 Feb 2025 14:43:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/radeon: Add error handlings for r420 CP errata
 initialization
Date: Thu, 20 Feb 2025 14:42:44 +0800
Message-ID: <20250220064244.733-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADHzg71zrZnPHzTDg--.57290S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW3KrWUKFyktryUWFW5Awb_yoW5Jr45pa
 1kKa90yrZrKayIyr9rGay7J3W5Cw48Ka17Wry7Gw1Fkw1rJFs8JFyfGryUGrykGrZ2k3Wj
 yryvk3ykuw4vv3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VCY1x0262k0Y48FwI0_Jr
 0_Gr1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0E
 wIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxV
 Aaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
 c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
 CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
 MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
 4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
 vfC2KfnxnUUI43ZEXa7sRWrWwDUUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4TA2e2jPzMJwABsc
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

