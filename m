Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC3A8502D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D310EA7D;
	Thu, 10 Apr 2025 23:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hr8lmWj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BED10EA7F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:43:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FE16D52;
 Fri, 11 Apr 2025 01:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744328471;
 bh=JW8R+ouKfZDbf21xsY26yAdEIf0xJhExWbz+oLvI4WA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hr8lmWj+6cUulhARcVZJtljzucl3uBSBwYTvrJQbxeCcpp7hALvdo0vFrozcp0Twe
 p25eJ3scChvfJs/hYFDwYkcQMhYyir3/PD13B9KI/xPMS5GSHKhqPwUVDqOHHs8198
 e2khCeZL/HGEiXL3OPWmk7rT5hdwA/jU8337B7cI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/3] media: renesas: vsp1: Expose color space through the DRM
 API
Date: Fri, 11 Apr 2025 02:42:40 +0300
Message-ID: <20250410234241.28123-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the VSP1 driver supports color spaces, expose them through the
API used by the DU driver. This allows configuring the YCbCr encoding
and quantization used by each plane, ensuring correct color rendering.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 4 ++++
 drivers/media/platform/renesas/vsp1/vsp1_drm.h | 6 ++++--
 include/media/vsp1.h                           | 4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index e5339fda5941..fe55e8747b05 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -136,6 +136,8 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	format.format.height = input->crop.height + input->crop.top;
 	format.format.code = rpf->fmtinfo->mbus;
 	format.format.field = V4L2_FIELD_NONE;
+	format.format.ycbcr_enc = input->ycbcr_enc;
+	format.format.quantization = input->quantization;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
 			       &format);
@@ -876,6 +878,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	input->crop = cfg->src;
 	input->compose = cfg->dst;
 	input->zpos = cfg->zpos;
+	input->ycbcr_enc = cfg->color_encoding;
+	input->quantization = cfg->color_range;
 
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index 7234737cc464..07a5d0adbd08 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -52,8 +52,8 @@ struct vsp1_drm_pipeline {
  * struct vsp1_drm - State for the API exposed to the DRM driver
  * @pipe: the VSP1 DRM pipeline used for display
  * @lock: protects the BRU and BRS allocation
- * @inputs: source crop rectangle, destination compose rectangle and z-order
- *	position for every input (indexed by RPF index)
+ * @inputs: source crop rectangle, destination compose rectangle, z-order
+ *	position and colorspace for every input (indexed by RPF index)
  */
 struct vsp1_drm {
 	struct vsp1_drm_pipeline pipe[VSP1_MAX_LIF];
@@ -63,6 +63,8 @@ struct vsp1_drm {
 		struct v4l2_rect crop;
 		struct v4l2_rect compose;
 		unsigned int zpos;
+		enum v4l2_ycbcr_encoding ycbcr_enc;
+		enum v4l2_quantization quantization;
 	} inputs[VSP1_MAX_RPF];
 };
 
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 48f4a5023d81..4ea6352fd63f 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -52,6 +52,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
  * @premult: true for premultiplied alpha
+ * @color_encoding: color encoding (valid for YUV formats only)
+ * @color_range: color range (valid for YUV formats only)
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -62,6 +64,8 @@ struct vsp1_du_atomic_config {
 	unsigned int alpha;
 	unsigned int zpos;
 	bool premult;
+	enum v4l2_ycbcr_encoding color_encoding;
+	enum v4l2_quantization color_range;
 };
 
 /**
-- 
Regards,

Laurent Pinchart

