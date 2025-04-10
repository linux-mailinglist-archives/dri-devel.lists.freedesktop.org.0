Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014DA85032
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F87410EA81;
	Thu, 10 Apr 2025 23:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SeW3htL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909810EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:43:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A99AA57;
 Fri, 11 Apr 2025 01:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744328470;
 bh=n/ByvwRWyn3E0+OXF4ONfIzKFiaT4RPmzY9bLKKb7tE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SeW3htL94+3Y0CrkDnUK99+gUnwBbUmI+aU1tKDdvNSWKFAR1m+1fu1uXpEx8c3O6
 ubHFKGnAfPR7jsmyOuxDhNTVDHAAuo1mlmF6oqNhvPFYPAHt4l5bcSV1T+Z74YGVx1
 SHpAXRTfJW1lfnTSfiERpY1o3Q1pYn01m2Wp6HIw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/3] media: renesas: vsp1: Name nested structure in vsp1_drm
Date: Fri, 11 Apr 2025 02:42:39 +0300
Message-ID: <20250410234241.28123-2-laurent.pinchart+renesas@ideasonboard.com>
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

