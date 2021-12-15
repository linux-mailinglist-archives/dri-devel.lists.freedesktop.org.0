Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9947559A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DBB10E1F5;
	Wed, 15 Dec 2021 09:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336A210E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:56:40 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id 207so32430841ljf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/SKAYMrs/GzMLA7d2JR/TcXPA0mR6BvhD9+t/8AH8Q=;
 b=itc9kjxlMhXQBPC8jrx+gv6j8zRYhwg2VuUiLV+Bh3vupyXh/O008OW493tQET3jDX
 lj0kUSadknD5LkmknTU/rzElj13rvPstPnaOUK8U5FJdurdlyq4c32SxhxkuoxPANLhn
 tzvU5Gqc06jrqOlltJSAjHToVRt0fB7iwVHgK0yaoUveO30kbcL/265rmut737K1h0v3
 3Ljk9KPQhVOmTMafnSkuZ3LR/SQ6/DD2U/xC5xFYC2BuU7M476J3JrDMUnCy6PWkHXdd
 5nqusR+mSaIGEyE+x+8r3y1ypsEpPyYei99WfRjiCdCHGRpLVMKg1vZ21vWpiS3iS+bu
 sRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/SKAYMrs/GzMLA7d2JR/TcXPA0mR6BvhD9+t/8AH8Q=;
 b=vPfLbGE9aXDQfxvQJFD21yLrr1KlSkOm6TpiaJjvYAqZ6y5d2/6+Lh5guDaK1B24id
 3n57VSaResuiyZTpOV8RkkmfxK04r+gPJWaD1l2pJXIJ8d06myyBgU3LIREMKT12Km+e
 P/n78xAhMzk1r//krD2KutBEJ+uSRQheYC9VUlRvOvUmrKbOzXSTsWTvw1bXvvL2GnhB
 psFzIkIEBu0gWRLsp78nRjQjpS4FNzsfQeD5H0yv7w70G39XtNC21iuysYRkwJ0adCDF
 UHrJQkoeqpI3VC6JEvwE/hum97okcvayucaxHPsApc3ZC6ZXxXcHk2UJ9fhgJm8K8ly/
 rByA==
X-Gm-Message-State: AOAM533mRda5y6az5flfzx5cRYeJMHiVLieDBIHfX6LfVuy2hso0pv1T
 YLMR1B6orm7NlZQ5DOpSI9Z2ZA==
X-Google-Smtp-Source: ABdhPJzVOkMT9FzjByx/A3OwyLhbgyfAKWE2Jhkkebxkaa5n5h/HbOL+R3t7S+OrpxFG14Y2a6RRgg==
X-Received: by 2002:a2e:9510:: with SMTP id f16mr9592237ljh.409.1639562198497; 
 Wed, 15 Dec 2021 01:56:38 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id j20sm242085lfu.84.2021.12.15.01.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 01:56:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/plane: add alpha and blend_mode to atomic_print_state
Date: Wed, 15 Dec 2021 12:56:36 +0300
Message-Id: <20211215095636.2330563-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When dumping plane state also output plane's alpha and blending mode
values to ease debugging of complex composition cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        |  3 +++
 drivers/gpu/drm/drm_blend.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..e2e715b5aaa8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -709,6 +709,9 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+	drm_printf(p, "\talpha=%x\n", state->alpha);
+	drm_printf(p, "\tblend_mode=%s\n",
+		   drm_get_pixel_blend_mode_name(state->pixel_blend_mode));
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..e3971758ec53 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -616,3 +616,24 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+static const char * const pixel_blend_mode_name[] = {
+	[DRM_MODE_BLEND_PIXEL_NONE] = "None",
+	[DRM_MODE_BLEND_PREMULTI] = "Pre-multiplied",
+	[DRM_MODE_BLEND_COVERAGE] = "Coverage",
+};
+
+/**
+ * drm_get_pixel_blend_mode_name - return a string for color encoding
+ * @encoding: color encoding to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_pixel_blend_mode_name(uint16_t blend_mode)
+{
+	if (WARN_ON(blend_mode >= ARRAY_SIZE(pixel_blend_mode_name)))
+		return "unknown";
+
+	return pixel_blend_mode_name[blend_mode];
+}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 63279e984342..0794307191cf 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -289,3 +289,6 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 void drm_reset_display_info(struct drm_connector *connector);
 u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid);
 void drm_update_tile_info(struct drm_connector *connector, const struct edid *edid);
+
+/* drm_blend.c */
+const char *drm_get_pixel_blend_mode_name(uint16_t blend_mode);
-- 
2.33.0

