Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6E8AF533
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C1C113509;
	Tue, 23 Apr 2024 17:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="KOdnL+Ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A9C10F2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 17:19:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713892750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOGt+jSm9xSy5lxg/d3TOjXUukiXICzPkjr8gC7XjPo=;
 b=KOdnL+AcNlkTtmXsQ0E00qcw3EBV6jUTFnCleZG3VMQyVLZnU3XUHrC+JMa6OsJaIedvjA
 slWI6bPqK+DaX3pIX8ujvDS+C0j4UaI/11EXf6KJ4Eg8c6PFajUHWBpPZsKfvsaPVuKU4M
 KH/xQ+y3aKKnNJUqlQj/jD1TRv/3Hxg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v4 01/13] drm: xlnx: Store base pointers in zynqmp_disp
 directly
Date: Tue, 23 Apr 2024 13:18:47 -0400
Message-Id: <20240423171859.3953024-2-sean.anderson@linux.dev>
In-Reply-To: <20240423171859.3953024-1-sean.anderson@linux.dev>
References: <20240423171859.3953024-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The blend, avbuf, and audio members of zynqmp_disp are anonymous structs
with only one member each. This is rather pointless, so move the members
up a level.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_disp.c | 44 +++++++++++++-----------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 8a39b3accce5..ca164a750ee9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -128,24 +128,18 @@ struct zynqmp_disp_layer {
  * struct zynqmp_disp - Display controller
  * @dev: Device structure
  * @dpsub: Display subsystem
- * @blend.base: Register I/O base address for the blender
- * @avbuf.base: Register I/O base address for the audio/video buffer manager
- * @audio.base: Registers I/O base address for the audio mixer
+ * @blend: Register I/O base address for the blender
+ * @avbuf: Register I/O base address for the audio/video buffer manager
+ * @audio: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */
 struct zynqmp_disp {
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
 
-	struct {
-		void __iomem *base;
-	} blend;
-	struct {
-		void __iomem *base;
-	} avbuf;
-	struct {
-		void __iomem *base;
-	} audio;
+	void __iomem *blend;
+	void __iomem *avbuf;
+	void __iomem *audio;
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DPSUB_NUM_LAYERS];
 };
@@ -356,12 +350,12 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
 
 static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
 {
-	return readl(disp->avbuf.base + reg);
+	return readl(disp->avbuf + reg);
 }
 
 static void zynqmp_disp_avbuf_write(struct zynqmp_disp *disp, int reg, u32 val)
 {
-	writel(val, disp->avbuf.base + reg);
+	writel(val, disp->avbuf + reg);
 }
 
 static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
@@ -587,7 +581,7 @@ static void zynqmp_disp_avbuf_disable(struct zynqmp_disp *disp)
 
 static void zynqmp_disp_blend_write(struct zynqmp_disp *disp, int reg, u32 val)
 {
-	writel(val, disp->blend.base + reg);
+	writel(val, disp->blend + reg);
 }
 
 /*
@@ -813,7 +807,7 @@ static void zynqmp_disp_blend_layer_disable(struct zynqmp_disp *disp,
 
 static void zynqmp_disp_audio_write(struct zynqmp_disp *disp, int reg, u32 val)
 {
-	writel(val, disp->audio.base + reg);
+	writel(val, disp->audio + reg);
 }
 
 /**
@@ -1237,21 +1231,21 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 	disp->dev = &pdev->dev;
 	disp->dpsub = dpsub;
 
-	disp->blend.base = devm_platform_ioremap_resource_byname(pdev, "blend");
-	if (IS_ERR(disp->blend.base)) {
-		ret = PTR_ERR(disp->blend.base);
+	disp->blend = devm_platform_ioremap_resource_byname(pdev, "blend");
+	if (IS_ERR(disp->blend)) {
+		ret = PTR_ERR(disp->blend);
 		goto error;
 	}
 
-	disp->avbuf.base = devm_platform_ioremap_resource_byname(pdev, "av_buf");
-	if (IS_ERR(disp->avbuf.base)) {
-		ret = PTR_ERR(disp->avbuf.base);
+	disp->avbuf = devm_platform_ioremap_resource_byname(pdev, "av_buf");
+	if (IS_ERR(disp->avbuf)) {
+		ret = PTR_ERR(disp->avbuf);
 		goto error;
 	}
 
-	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
-	if (IS_ERR(disp->audio.base)) {
-		ret = PTR_ERR(disp->audio.base);
+	disp->audio = devm_platform_ioremap_resource_byname(pdev, "aud");
+	if (IS_ERR(disp->audio)) {
+		ret = PTR_ERR(disp->audio);
 		goto error;
 	}
 
-- 
2.35.1.1320.gc452695387.dirty

