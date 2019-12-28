Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712D12BD34
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2019 11:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00DF6E12B;
	Sat, 28 Dec 2019 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Sat, 28 Dec 2019 01:14:44 UTC
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245B989336
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 01:14:43 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D94C672DA993BA82B74C;
 Sat, 28 Dec 2019 09:14:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Sat, 28 Dec 2019 09:14:29 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Added three new resolutions and changed the
 alignment to 128 Bytes
Date: Sat, 28 Dec 2019 09:14:40 +0800
Message-ID: <1577495680-28766-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 28 Dec 2019 10:07:14 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the three new resolution 1440x900 and 1600x900, 640x480 for hibmc
and Set the FB Offset of the display hardware to 128 Byte alignment

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 11 +++++------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index f1ce6cb..69389b0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -40,6 +40,7 @@ struct hibmc_dislay_pll_config {
 };
 
 static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
+	{640, 480, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ},
 	{800, 600, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ},
 	{1024, 768, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MHZ},
 	{1152, 864, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS_80MHZ},
@@ -47,6 +48,8 @@ static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
 	{1280, 720, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MHZ},
 	{1280, 960, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
 	{1280, 1024, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
+	{1440, 900, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106MHZ},
+	{1600, 900, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
 	{1600, 1200, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_162MHZ},
 	{1920, 1080, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_148MHZ},
 	{1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
@@ -102,14 +105,12 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	s64 gpu_addr = 0;
 	unsigned int line_l;
 	struct hibmc_drm_private *priv = plane->dev->dev_private;
-	struct hibmc_framebuffer *hibmc_fb;
 	struct drm_gem_vram_object *gbo;
 
 	if (!state->fb)
 		return;
 
-	hibmc_fb = to_hibmc_framebuffer(state->fb);
-	gbo = drm_gem_vram_of_gem(hibmc_fb->obj);
+	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
 
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (WARN_ON_ONCE(gpu_addr < 0))
@@ -118,11 +119,9 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
 
 	reg = state->fb->width * (state->fb->format->cpp[0]);
-	/* now line_pad is 16 */
-	reg = PADDING(16, reg);
 
 	line_l = state->fb->width * state->fb->format->cpp[0];
-	line_l = PADDING(16, line_l);
+	line_l = PADDING(128, line_l);
 	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
 	       HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_OFFS, line_l),
 	       priv->mmio + HIBMC_CRT_FB_WIDTH);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
index 9b7e859..17b30c3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
@@ -179,6 +179,7 @@
 #define CRT_PLL1_HS_74MHZ			0x23941dc2
 #define CRT_PLL1_HS_80MHZ			0x23941001
 #define CRT_PLL1_HS_80MHZ_1152			0x23540fc2
+#define CRT_PLL1_HS_106MHZ			0x237C1641
 #define CRT_PLL1_HS_108MHZ			0x23b41b01
 #define CRT_PLL1_HS_162MHZ			0x23480681
 #define CRT_PLL1_HS_148MHZ			0x23541dc2
@@ -191,6 +192,7 @@
 #define CRT_PLL2_HS_78MHZ			0x50E147AE
 #define CRT_PLL2_HS_74MHZ			0x602B6AE7
 #define CRT_PLL2_HS_80MHZ			0x70000000
+#define CRT_PLL2_HS_106MHZ			0x0075c28f
 #define CRT_PLL2_HS_108MHZ			0x80000000
 #define CRT_PLL2_HS_162MHZ			0xA0000000
 #define CRT_PLL2_HS_148MHZ			0xB0CCCCCD
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
