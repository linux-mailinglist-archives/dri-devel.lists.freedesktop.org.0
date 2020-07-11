Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC021E8F3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD3D6E8F4;
	Tue, 14 Jul 2020 07:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A746ED8F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:14 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k18so5895197qtm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxzPCaTd6ix2rNUDdEp4trb+bBoo9P5kKc/CqAcw0Qw=;
 b=BFUWBFXIonsbenr3aucFiuxVOKp5xvf0go4Pag3A+XEn/vT1Vpd0ACBxUqeYikeaA8
 MdQeI9PsPbsLuBNELQdF6S7L8OCzWgsdMVIlr6zP9Eydu/u1t4YjFohH0TWKYWjXMWGl
 JQL7bzdljJsUVZxUL2tUWbNWcCxe3AKIJvM6MuHbtKvq8/9aan8OTvXkBw8/KOXVlxkf
 j2s+3VtgY9mBPf9ZrwY9J1vEX2UwzLttXyEkCKl7E0FThmAvlaPInrKf9dZB0zRTUH/F
 0dA81seykCsLU/15e+qb1aHxBswreoZh8u6yBR5L8a6Qsf3EMMaOJ9ub4gBvGMZvjnef
 uQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxzPCaTd6ix2rNUDdEp4trb+bBoo9P5kKc/CqAcw0Qw=;
 b=Z6Sill/VI3baTynR/FptpcbzO7/vvzmXAowr1NvWFr1PnJrobKzyzGLBfplkd3R94N
 CjrChqVReqkaFX5C0hlMREuA/dQMq+hXaRVjuzzB52kjgG5x4cKDy0GspjTcp+pWit+S
 QdtGyWgtJpAoJrd/pDeEbAm7i97Zrh/LOHzhEQQ2o/fkfFZVvsFnLIvJ5aaefVPvQZBF
 wBrU/jOKeq3NcSvszUDu1FDsSDxcLrs1qif/IWlRmxdReVd0x6ooNhYYXo449S4t0NGo
 HO+BZAtUmWDYvL39UJ5sosLgmb49p4pSFOE6LcqrIHTXMTW2rYZpWhBhRSfUgsrv9ZQ3
 NtOg==
X-Gm-Message-State: AOAM533RJP2lG27SwmG+hMtrp2i3zKM7awWbof8gC8wmIvSWaNrczJ5j
 xsj8UDQFtEy56EJ6xrY5IvcC0Q==
X-Google-Smtp-Source: ABdhPJxW5aneESiExYJHajcYr7sOZLQuk19AS7HjwmKJTS5Gd0wNLOFPBFtz8s89gCBXId2O8eUsdQ==
X-Received: by 2002:ac8:46c9:: with SMTP id h9mr63977805qto.130.1594428613738; 
 Fri, 10 Jul 2020 17:50:13 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:13 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/msm/dpu: move some sspp caps to dpu_caps
Date: Fri, 10 Jul 2020 20:47:26 -0400
Message-Id: <20200711004752.30760-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This isn't something that ever changes between planes, so move it to
dpu_caps struct. Making this change will allow more re-use in the
"SSPP sub blocks config" part of the catalog, in particular when adding
support for SM8150 and SM8250 which have different max_linewidth.

This also sets max_hdeci_exp/max_vdeci_exp to 0 for sc7180, as decimation
is not supported on the newest DPU versions. (note that decimation is not
implemented, so this changes nothing)

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 14 +++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 24 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  6 ++---
 3 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 29d4fde3172b..f4ccbe56a09e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -70,6 +70,10 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -80,6 +84,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
@@ -178,16 +184,9 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
  *************************************************************/
 
 /* SSPP common configuration */
-static const struct dpu_sspp_blks_common sdm845_sspp_common = {
-	.maxlinewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-	.maxhdeciexp = MAX_HORZ_DECIMATION,
-	.maxvdeciexp = MAX_VERT_DECIMATION,
-};
 
 #define _VIG_SBLK(num, sdma_pri, qseed_ver) \
 	{ \
-	.common = &sdm845_sspp_common, \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
@@ -207,7 +206,6 @@ static const struct dpu_sspp_blks_common sdm845_sspp_common = {
 
 #define _DMA_SBLK(num, sdma_pri) \
 	{ \
-	.common = &sdm845_sspp_common, \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.smart_dma_priority = sdma_pri, \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 63512753b369..a6221fdc02d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -301,6 +301,10 @@ struct dpu_qos_lut_tbl {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @max_linewidth      max linewidth for sspp
+ * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
+ * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
+ * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -312,22 +316,11 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
-};
-
-/**
- * struct dpu_sspp_blks_common : SSPP sub-blocks common configuration
- * @maxwidth: max pixelwidth supported by this pipe
- * @pixel_ram_size: size of latency hiding and de-tiling buffer in bytes
- * @maxhdeciexp: max horizontal decimation supported by this pipe
- *				(max is 2^value)
- * @maxvdeciexp: max vertical decimation supported by this pipe
- *				(max is 2^value)
- */
-struct dpu_sspp_blks_common {
-	u32 maxlinewidth;
+	/* SSPP limits */
+	u32 max_linewidth;
 	u32 pixel_ram_size;
-	u32 maxhdeciexp;
-	u32 maxvdeciexp;
+	u32 max_hdeci_exp;
+	u32 max_vdeci_exp;
 };
 
 /**
@@ -353,7 +346,6 @@ struct dpu_sspp_blks_common {
  * @virt_num_formats: Number of supported formats for virtual planes
  */
 struct dpu_sspp_sub_blks {
-	const struct dpu_sspp_blks_common *common;
 	u32 creq_vblank;
 	u32 danger_vblank;
 	u32 maxdwnscale;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3b9c33e694bf..33f6c56f01ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -153,7 +153,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 
 	pdpu = to_dpu_plane(plane);
 	pstate = to_dpu_plane_state(plane->state);
-	fixed_buff_size = pdpu->pipe_sblk->common->pixel_ram_size;
+	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
 	list_for_each_entry(tmp, &pdpu->mplane_list, mplane_list) {
 		if (!tmp->base.state->visible)
@@ -709,7 +709,7 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 		 * So we cannot support more than half of the supported SSPP
 		 * width for tiled formats.
 		 */
-		width_threshold = dpu_plane[i]->pipe_sblk->common->maxlinewidth;
+		width_threshold = dpu_plane[i]->catalog->caps->max_linewidth;
 		if (has_tiled_rect)
 			width_threshold /= 2;
 
@@ -887,7 +887,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.x2 = state->fb->width;
 	fb_rect.y2 = state->fb->height;
 
-	max_linewidth = pdpu->pipe_sblk->common->maxlinewidth;
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	fmt = to_dpu_format(msm_framebuffer_format(state->fb));
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
