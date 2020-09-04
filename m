Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B353625DF59
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6326EC91;
	Fri,  4 Sep 2020 16:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293A6EC8E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c18so7248466wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYcbS/BGUkcKeuDYBYex/vdwEFwAErmYUsc7aVF5z7o=;
 b=OSTewJ7lss6uloOfkMIXld1WWdfZNX/rP0Hb0Gpuv049zPOwjBifqhWjfK0XR+TVG8
 R75GPKoPkU/euwSw6ZP1cQ/mPQ2peC6PaXdZeTs2l07GNUMbwTp14Y6nEvnCvPOSyWz7
 GpFRvA1gh+bqlKeVwB4JYgAGXr/7JrllUcsB8xw0qP0EnO9pLGn91t+5Upi4Br4qPtP9
 vIx/NfJq2Dku7cAjZmsM0DWodQN4Lk3IR9WO8aQbOofr7REd1LjXQincBlVjCToNh1W4
 YFjskAxgCWa4YIbZrrFdiS+hg+vYKmQYwqhHCAM0N8ZcF++NW0CAXxEsqhQP3k1zvaMl
 CnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYcbS/BGUkcKeuDYBYex/vdwEFwAErmYUsc7aVF5z7o=;
 b=skDp32oWAsKaV6/GUxHLpLbMBKVXS+WjfSHJVsy4I8TMIFLRHT7m6+H1wXEeB9GuKO
 tono8ar52usq/c2DczpP+HQvC7eBcm7wUgYi0f01AotLhel9cu0p8keyFK2dgo3HVe5E
 258G84wQUoYLc7LpGH2J3nOBvNCMu3jXOphaf5ds/t+eCsM7zw+WK8rsqGFrQIc8S05i
 jdGa3MDwcwTkExEmdczegOJ8araebnaw9Kmi/0z6nRmpzuTuqtOq5tcxnMAfbQCELGPg
 8ziBuO8xDxKYFPLJQnZIVCBezDi/8UMCgEwr6HF4ce3W3W4QGuImRH6gBW2YKh3whKz4
 A/EA==
X-Gm-Message-State: AOAM531X6/UKx76rpWQCliusd/y3XmTRz8FeZV5f1p3WDJ9LslOJeAJ+
 GtpSpKM12AzfcnxT41iPJE96IQ==
X-Google-Smtp-Source: ABdhPJytBzvOQINw8KMdxTkvzCUrLyZXcVAHGcHk9QZkD36RtqanWgbE+NFl3GwFXySJq3nJTfYVFg==
X-Received: by 2002:a5d:6784:: with SMTP id v4mr3044671wru.215.1599235638250; 
 Fri, 04 Sep 2020 09:07:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:17 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/amd/display: Add formats for DCC with 2/3 planes.
Date: Fri,  4 Sep 2020 18:07:07 +0200
Message-Id: <20200904160709.123970-10-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DCC we will use 2/3 planes to avoid X rendering to the frontbuffer
with DCC compressed images. To make this work with the core KMS
validation we need to add extra formats with the extra planes.

However, due to flexibility we set bpp = 0 for the extra planes and
do the validation ourselves.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 545d177bf703..ceb92a0dccdc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -173,6 +173,9 @@ static bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream);
 static bool amdgpu_dm_psr_disable(struct dc_stream_state *stream);
 static bool amdgpu_dm_psr_disable_all(struct amdgpu_display_manager *dm);
 
+static const struct drm_format_info *
+amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
+
 /*
  * dm_vblank_get_counter
  *
@@ -2021,6 +2024,7 @@ const struct amdgpu_ip_block_version dm_ip_block =
 
 static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
+	.get_format_info = amd_get_format_info,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = amdgpu_dm_atomic_check,
 	.atomic_commit = amdgpu_dm_atomic_commit,
@@ -3855,6 +3859,98 @@ modifier_gfx9_swizzle_mode(uint64_t modifier)
 	return AMD_FMT_MOD_GET(TILE, modifier);
 }
 
+static const struct drm_format_info dcc_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	 { .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	   .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_BGRA8888, .depth = 32, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_XRGB2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR2101010, .depth = 30, .num_planes = 2,
+	  .cpp = { 4, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_RGB565, .depth = 16, .num_planes = 2,
+	  .cpp = { 2, 0, }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+};
+
+static const struct drm_format_info dcc_retile_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	 { .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	   .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_BGRA8888, .depth = 32, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_XRGB2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_ABGR2101010, .depth = 30, .num_planes = 3,
+	  .cpp = { 4, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1,
+	  .has_alpha = true, },
+	{ .format = DRM_FORMAT_RGB565, .depth = 16, .num_planes = 3,
+	  .cpp = { 2, 0, 0 }, .block_w = {1, 1, 1}, .block_h = {1, 1, 1}, .hsub = 1, .vsub = 1, },
+};
+
+
+static const struct drm_format_info *
+lookup_format_info(const struct drm_format_info formats[],
+		  int num_formats, u32 format)
+{
+	int i;
+
+	for (i = 0; i < num_formats; i++) {
+		if (formats[i].format == format)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct drm_format_info *
+amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+{
+	uint64_t modifier = cmd->modifier[0];
+
+	if (!IS_AMD_FMT_MOD(modifier))
+		return NULL;
+
+	if (AMD_FMT_MOD_GET(DCC_RETILE, modifier))
+		return lookup_format_info(dcc_retile_formats,
+					  ARRAY_SIZE(dcc_retile_formats),
+					  cmd->pixel_format);
+
+	if (AMD_FMT_MOD_GET(DCC, modifier))
+		return lookup_format_info(dcc_formats, ARRAY_SIZE(dcc_formats),
+					  cmd->pixel_format);
+
+	/* returning NULL will cause the default format structs to be used. */
+	return NULL;
+}
+
 static void
 fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
 				    union dc_tiling_info *tiling_info,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
