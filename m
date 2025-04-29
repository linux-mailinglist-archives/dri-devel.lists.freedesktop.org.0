Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BAAA3C31
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71EC10E47B;
	Tue, 29 Apr 2025 23:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aSJSkMdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F9F10E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3BDB18D7;
 Wed, 30 Apr 2025 01:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969356;
 bh=n/ByvwRWyn3E0+OXF4ONfIzKFiaT4RPmzY9bLKKb7tE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aSJSkMdM7ZaSCS+vkyOQn0lMSJ65sHcM2uPJbkNQx6F7VdtijKZ+SmEiqaOJpKh2A
 0lklLXMM310EJHwU6ByOCpX+xbwOFcK72smiQshBlDIEB2GBk329nbkirD1ZwqHRE2
 aSLgS/4yQENCvJoDa7D2LTAQnXeA3dXCVWF0ytkU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 7/9] media: renesas: vsp1: Name nested structure in vsp1_drm
Date: Wed, 30 Apr 2025 02:29:02 +0300
Message-ID: <20250429232904.26413-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
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

The vsp1_drm structure defines an anonymous nested structure to store
per-input data. In preparation for extending that structure, give it a
name and is it through the driver. This improves code readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 18 +++++++++---------
 drivers/media/platform/renesas/vsp1/vsp1_drm.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index f8a575f6188a..e5339fda5941 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -118,24 +118,22 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 				      struct vsp1_entity *uif,
 				      unsigned int brx_input)
 {
+	const struct vsp1_drm_input *input = &vsp1->drm->inputs[rpf->entity.index];
 	struct v4l2_subdev_selection sel = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	const struct v4l2_rect *crop;
 	int ret;
 
 	/*
 	 * Configure the format on the RPF sink pad and propagate it up to the
 	 * BRx sink pad.
 	 */
-	crop = &vsp1->drm->inputs[rpf->entity.index].crop;
-
 	format.pad = RWPF_PAD_SINK;
-	format.format.width = crop->width + crop->left;
-	format.format.height = crop->height + crop->top;
+	format.format.width = input->crop.width + input->crop.left;
+	format.format.height = input->crop.height + input->crop.top;
 	format.format.code = rpf->fmtinfo->mbus;
 	format.format.field = V4L2_FIELD_NONE;
 
@@ -151,7 +149,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 
 	sel.pad = RWPF_PAD_SINK;
 	sel.target = V4L2_SEL_TGT_CROP;
-	sel.r = *crop;
+	sel.r = input->crop;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_selection, NULL,
 			       &sel);
@@ -826,12 +824,14 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 {
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe = &vsp1->drm->pipe[pipe_index];
+	struct vsp1_drm_input *input;
 	struct vsp1_rwpf *rpf;
 	int ret;
 
 	if (rpf_index >= vsp1->info->rpf_count)
 		return -EINVAL;
 
+	input = &vsp1->drm->inputs[rpf_index];
 	rpf = vsp1->rpf[rpf_index];
 
 	if (!cfg) {
@@ -873,9 +873,9 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 
 	rpf->format.flags = cfg->premult ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
 
-	vsp1->drm->inputs[rpf_index].crop = cfg->src;
-	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
-	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
+	input->crop = cfg->src;
+	input->compose = cfg->dst;
+	input->zpos = cfg->zpos;
 
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index 3fd95b53f27e..7234737cc464 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -59,7 +59,7 @@ struct vsp1_drm {
 	struct vsp1_drm_pipeline pipe[VSP1_MAX_LIF];
 	struct mutex lock;
 
-	struct {
+	struct vsp1_drm_input {
 		struct v4l2_rect crop;
 		struct v4l2_rect compose;
 		unsigned int zpos;
-- 
Regards,

Laurent Pinchart

