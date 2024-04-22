Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA18AD42D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EBD10F7A2;
	Mon, 22 Apr 2024 18:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="pWt5zZeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3408C112CD9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:46:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713811560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shxVKbrxy0v2vUv3i82PhMPt5LLErwg9JhDZU0P50jE=;
 b=pWt5zZeOPenMoVfzZgrzuunpn8LEQ723Iegz811HQ70v6dG/aKQk1AAohGTaQ/RokzoAPL
 2qHMTmm2eYsxJLs5LP9OkuhC2P7Hv5wz4hWep7fkCTOXssZTh6UoZscXzXzh9xVib3/ftJ
 kCT+A+J5mMOy/rvHAmO/7n00JEnSmUk=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 01/13] drm: xlnx: Store base pointers in zynqmp_disp
 directly
Date: Mon, 22 Apr 2024 14:45:41 -0400
Message-Id: <20240422184553.3573009-2-sean.anderson@linux.dev>
In-Reply-To: <20240422184553.3573009-1-sean.anderson@linux.dev>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
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
---

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_disp.c | 44 +++++++++++++-----------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..94a3ac046373 100644
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

