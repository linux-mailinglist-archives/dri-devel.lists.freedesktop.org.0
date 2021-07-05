Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF763BB4C5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23C989AF3;
	Mon,  5 Jul 2021 01:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2842489B22
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a18so29464485lfs.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDDr/ms7s6qJaodMAIRwgt/Fq8mdRsGj2OTIZLDVpfY=;
 b=x5PV8WymKLsnuoKJgYOYWmUbMKmRelYIm0jxlXReEpAzipRHB5T3NIVrrieopeGK3c
 NM6rZvr55rkJNsE4AT07O3ahgI4Rw6iNwWHFyw4Ur8Eq0g7LQYXqDjdzOJIXI/z7/zVO
 jaq0BxWvcWZjVbss4mOtTWLqSA2X5zICuE9QEfDuoZ7cCrkq44QRMIPA/Q/WVaQGRhki
 CK0GPtD4Nt5uT6TNqqaKgkXfXE64IZ0o+pLh2ljtpfwz162ORXDcpvDxaMchh2SpniCe
 wwYASKtIJU4AdUsc7TQjQY8gXmWGU9v6ZF0pgLR4Yc9wPuaVrYLzZxdkO6OBLiH8F66Q
 qtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDDr/ms7s6qJaodMAIRwgt/Fq8mdRsGj2OTIZLDVpfY=;
 b=DtkJ+uUdDKe3/YhWec813z1R6ozuQuAhkgJPxPzCZ5OZyBapOI4fyZ4eO4GHZHNql6
 MHgtFK9xln4AdjRr22Gq62Day/V9O5YgsA4LMFX1d/iPzDMnqD9zyBFNV1DaSnzrGAlX
 +nxF04inj2fa1zVfoYC/X+iKP4XU0RgRRstbtRCrBzqQYN0cvZhZ/kiFne4ZXyHB/Imd
 cxdjlDfnVow2cIR/Z4NKqpsGOwNR3c1mXv9F3nmb5SX5GQMDVI94g6BAB5U/B3XqaPPe
 5QbyieZ9rnP5jmbt1uLnHlAIH2Qi6+XNPGrh+CZ92JsawAazZqCJrG/ofJ+jKGaZVvcg
 G7MQ==
X-Gm-Message-State: AOAM532K4ipN+jpHdRBoVlRfx+LAbflsATVS1Hm8gXp9i1KxxNASZt7T
 /f/n318tSC8vuFQkEbv7XQsItg==
X-Google-Smtp-Source: ABdhPJz7z6TO+dNxgW5sz/ajmCRlnqjDjZCwjiSyI3devmmI3GK3y+k8+2/kDZ17Ks1c+C5+ncesFQ==
X-Received: by 2002:a05:6512:ba8:: with SMTP id
 b40mr9212491lfv.588.1625448310523; 
 Sun, 04 Jul 2021 18:25:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 05/22] drm/msm/dpu: rip out master planes support
Date: Mon,  5 Jul 2021 04:20:58 +0300
Message-Id: <20210705012115.4179824-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Master/virtual planes were used for multirect support. In preparation to
reworking DPU planes, drop support for master planes (which was not used
anyway).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 11 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 67 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 13 +---
 6 files changed, 17 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ea678ddd4589..6fe0af9ffc23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -974,17 +974,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	for (i = 1; i < SSPP_MAX; i++) {
-		if (pipe_staged[i]) {
+		if (pipe_staged[i])
 			dpu_plane_clear_multirect(pipe_staged[i]);
-
-			if (is_dpu_plane_virtual(pipe_staged[i]->plane)) {
-				DPU_ERROR(
-					"r1 only virt plane:%d not supported\n",
-					pipe_staged[i]->plane->base.id);
-				rc  = -EINVAL;
-				goto end;
-			}
-		}
 	}
 
 	z_pos = -1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cbafb61404d0..c16832898c51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -708,8 +708,7 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 }
 
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
-		bool is_virtual_pipe)
+		void __iomem *addr, struct dpu_mdss_cfg *catalog)
 {
 	struct dpu_hw_pipe *hw_pipe;
 	const struct dpu_sspp_cfg *cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 27263bc1a1ef..35a848b1fcf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -387,11 +387,9 @@ struct dpu_hw_pipe {
  * @idx:  Pipe index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @catalog : Pointer to mdss catalog data
- * @is_virtual_pipe: is this pipe virtual pipe
  */
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
-		bool is_virtual_pipe);
+		void __iomem *addr, struct dpu_mdss_cfg *catalog);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..b7b73d0de6f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -623,7 +623,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
 
 		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
-				       (1UL << max_crtc_count) - 1, 0);
+				       (1UL << max_crtc_count) - 1);
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 97507e25f4f3..8095afdb4385 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -91,7 +91,6 @@ enum dpu_plane_qos {
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
  * @csc_ptr: Points to dpu_csc_cfg structure to use for current
- * @mplane_list: List of multirect planes of the same pipe
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
  */
@@ -108,8 +107,6 @@ struct dpu_plane {
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
-	bool is_virtual;
-	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
 
 	struct dpu_csc_cfg *csc_ptr;
@@ -237,7 +234,7 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		const struct dpu_format *fmt, u32 src_width)
 {
-	struct dpu_plane *pdpu, *tmp;
+	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
 	u32 fixed_buff_size;
 	u32 total_fl;
@@ -251,16 +248,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 	pstate = to_dpu_plane_state(plane->state);
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
-	list_for_each_entry(tmp, &pdpu->mplane_list, mplane_list) {
-		if (!tmp->base.state->visible)
-			continue;
-		DPU_DEBUG("plane%d/%d src_width:%d/%d\n",
-				pdpu->base.base.id, tmp->base.base.id,
-				src_width,
-				drm_rect_width(&tmp->pipe_cfg.src_rect));
-		src_width = max_t(u32, src_width,
-				  drm_rect_width(&tmp->pipe_cfg.src_rect));
-	}
+	/* FIXME: in multirect case account for the src_width of all the planes */
 
 	if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
 		if (fmt->chroma_sample == DPU_CHROMA_420) {
@@ -836,13 +824,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	}
 
 done:
-	if (dpu_plane[R0]->is_virtual) {
-		pstate[R0]->multirect_index = DPU_SSPP_RECT_1;
-		pstate[R1]->multirect_index = DPU_SSPP_RECT_0;
-	} else {
-		pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
-		pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
-	}
+	pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
+	pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
 
 	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
 		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
@@ -1218,19 +1201,13 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 
-	trace_dpu_plane_disable(DRMID(plane), is_dpu_plane_virtual(plane),
+	trace_dpu_plane_disable(DRMID(plane), false,
 				pstate->multirect_mode);
 
 	pstate->pending = true;
-
-	if (is_dpu_plane_virtual(plane) &&
-			pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_multirect)
-		pdpu->pipe_hw->ops.setup_multirect(pdpu->pipe_hw,
-				DPU_SSPP_RECT_SOLO, DPU_SSPP_MULTIRECT_NONE);
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
@@ -1556,17 +1533,12 @@ enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
 	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
 }
 
-bool is_dpu_plane_virtual(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->is_virtual : false;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs, u32 master_plane_id)
+		unsigned long possible_crtcs)
 {
-	struct drm_plane *plane = NULL, *master_plane = NULL;
+	struct drm_plane *plane = NULL;
 	const uint32_t *format_list;
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -1586,18 +1558,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* cache local stuff for later */
 	plane = &pdpu->base;
 	pdpu->pipe = pipe;
-	pdpu->is_virtual = (master_plane_id != 0);
-	INIT_LIST_HEAD(&pdpu->mplane_list);
-	master_plane = drm_plane_find(dev, NULL, master_plane_id);
-	if (master_plane) {
-		struct dpu_plane *mpdpu = to_dpu_plane(master_plane);
-
-		list_add_tail(&pdpu->mplane_list, &mpdpu->mplane_list);
-	}
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog,
-							master_plane_id != 0);
+	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
 	if (IS_ERR(pdpu->pipe_hw)) {
 		DPU_ERROR("[%u]SSPP init failed\n", pipe);
 		ret = PTR_ERR(pdpu->pipe_hw);
@@ -1615,14 +1578,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	if (pdpu->is_virtual) {
-		format_list = pdpu->pipe_sblk->virt_format_list;
-		num_formats = pdpu->pipe_sblk->virt_num_formats;
-	}
-	else {
-		format_list = pdpu->pipe_sblk->format_list;
-		num_formats = pdpu->pipe_sblk->num_formats;
-	}
+	format_list = pdpu->pipe_sblk->format_list;
+	num_formats = pdpu->pipe_sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
@@ -1657,8 +1614,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	mutex_init(&pdpu->lock);
 
-	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
-					pipe, plane->base.id, master_plane_id);
+	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
+					pipe, plane->base.id);
 	return plane;
 
 clean_sspp:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 34e03ac05f4a..d5b7f5876e64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -67,14 +67,6 @@ struct dpu_multirect_plane_states {
  */
 enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
 
-/**
- * is_dpu_plane_virtual - check for virtual plane
- * @plane: Pointer to DRM plane object
- * returns: true - if the plane is virtual
- *          false - if the plane is primary
- */
-bool is_dpu_plane_virtual(struct drm_plane *plane);
-
 /**
  * dpu_plane_get_ctl_flush - get control flush mask
  * @plane:   Pointer to DRM plane object
@@ -102,14 +94,11 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error);
  * @pipe:  dpu hardware pipe identifier
  * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
  * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
- * @master_plane_id: primary plane id of a multirect pipe. 0 value passed for
- *                   a regular plane initialization. A non-zero primary plane
- *                   id will be passed for a virtual pipe initialization.
  *
  */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs, u32 master_plane_id);
+		unsigned long possible_crtcs);
 
 /**
  * dpu_plane_validate_multirecti_v2 - validate the multirect planes
-- 
2.30.2

