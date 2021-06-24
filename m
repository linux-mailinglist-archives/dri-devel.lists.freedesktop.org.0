Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B83B31FC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7B6EC1C;
	Thu, 24 Jun 2021 14:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13846EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j2so10751608lfg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwCX2sP+0U2a5GatYHIEUMkfFfS/xQl+/uAE4M8pDy8=;
 b=tmZ1vTA641TI4vw7sfeY4oAwZ4Eels1YbTwRcopFvzA6Ygb9t35FS/NnVRXm8IKaaX
 fqxVqn2ytn2ZQ5ijD44CsGp4bfkzzslBj62MLl0ra1vq4PqiPTntMC8Gs361YSD5LZog
 o/e/PZgEVcs7K1q1D5jK9E2dsD0cZrRVM4Zwc1a6hORdLAK9KsnWVglV7P45c12VXnfQ
 oR2GbkB7soTD2vtr4evOyQUsayA7/Dc4hkhg4nVge/7Es34EDiu5ATDB122EWsMB2LCs
 Um9W8BdAzL2+5Gg5BIbhxGCUjjlsy+nxtF6Rdt/qadjwq6UE0VjvoPAaC+QT5nJY9Kcq
 /CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwCX2sP+0U2a5GatYHIEUMkfFfS/xQl+/uAE4M8pDy8=;
 b=GlSXgKjqxaqkXMKYQOrxeid3LtQ2+9fTfqTsml1HEmT6xZhc7f5803rbqREhpdbTwv
 zN20JLP357YmygTn7kRLytdpQuqNuBgJ4+FgjTYBi5uXPR7h8nK/ZY+XadZE3nNhXy3u
 d0fVK6r/lsjV88fQAsJjGnrrCNGMkTlJpwVofiniNZuKrgKf2qjemI2lvQed8vDjfxRz
 k3SXKuDAyBp9OgwlsqL9cOXPNlKy8l2I1ZOvUPZTcfltaEpP7woFaFO2RL/sIoAjuy6S
 JMgPGqVFis2c0EwtairEhFXZgZOZt5Mm6kB1KtWVlrrVq4sukSuBuTkMfjYrqjYB/DEt
 xsrA==
X-Gm-Message-State: AOAM531HlNTZlu7kfLl4aGvDI0SNELqHvxcy0k0JLJmqfcSoZA0ewOFP
 w0wqZDXzDekefLwRqtilayyZSg==
X-Google-Smtp-Source: ABdhPJxlZLA7exN7CfAuqbdb9KN0K3ohLiUFlslt0AWxUi1BexpAMRwb8RDhUWoUIUL8D4AZdbG8Bg==
X-Received: by 2002:a05:6512:36d8:: with SMTP id
 e24mr4242055lfs.8.1624546662113; 
 Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 05/17] drm/msm/dpu: rip out master planes support
Date: Thu, 24 Jun 2021 17:57:21 +0300
Message-Id: <20210624145733.2561992-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 67 ++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 13 +----
 4 files changed, 15 insertions(+), 78 deletions(-)

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
index 97507e25f4f3..dbc9c2c28ae0 100644
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
+	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog, false);
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

