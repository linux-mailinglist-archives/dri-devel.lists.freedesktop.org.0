Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091357DFC37
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007C510E163;
	Thu,  2 Nov 2023 22:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C009610E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 22:13:18 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so11821025ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 15:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698963198; x=1699567998;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y06i8Y7ERebYf/tho68vkzbllD+e/f8ccnIKfy6txBE=;
 b=knUMtKK/FYaxc3wQIt1V6mQsf/JhJZyBg8sECh8nNQjgjRshOgBsNjtAS1/2I9RvEn
 /lzQek+g+ven7CCR5Q3t6FT3s7uISe3KVutxsSulD+FYdE+1FVTPRQBXanK9NpI3bvHL
 FeD6Pal4+3LgOmteLnxKJiK9CGUYnlioSdrn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698963198; x=1699567998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y06i8Y7ERebYf/tho68vkzbllD+e/f8ccnIKfy6txBE=;
 b=nq6prOsqzezepY6W29yufxlD2PR8jgGkquQnZOU6V5M5rfdo43MP/dhHUg3bqNprOW
 9DgVhQxfBKZ7c91KFP70FpHnXs56GYBYUwqsOaL0818+zvqhOvlsFl1EAW6tXCxD9YV8
 cdBzWZZtz4khyGHOER2p8y87/xX2rdUz+PYi7XB94bjrZxhVgpzjWixFXqxQmRKNM1pq
 Ck924HO1dXOUIW/lK2U9ut7W1Y2NFY1xrEv8wsKx2rXHK+zfT52n1Lpv7D0U8mY/alLX
 N0ZoKEHmBB/OqoXHazv/m+/g0Zg1UwUyS00RbZyCdJty6JEksQqVvuGG6KJZGyLGB35Q
 U1qg==
X-Gm-Message-State: AOJu0YxpdmwawqN+p6HbFjK7Vr2v6H7Ka86tdJJWIpaE7DAN/UTo9VCl
 t0T70FTviq+1O6VDLfDwVpXhug==
X-Google-Smtp-Source: AGHT+IFxvrBbUynqP3nk/8eCo9vOCnXrQ0FZ34Q8GJks0qr2eE5qFYbGFGkhUvCT6UKcaouy+LkaTA==
X-Received: by 2002:a17:903:41c6:b0:1cc:55d4:a715 with SMTP id
 u6-20020a17090341c600b001cc55d4a715mr1007326ple.3.1698963198271; 
 Thu, 02 Nov 2023 15:13:18 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:6ec1:79de:6e50:d6fa])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a63ce06000000b00565e96d9874sm196057pgf.89.2023.11.02.15.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:13:17 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/4] drm/modes: Add a function to clear preferred modes
Date: Thu,  2 Nov 2023 14:47:49 -0700
Message-ID: <20231102221309.1971910-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231102221309.1971910-1-hsinyi@chromium.org>
References: <20231102221309.1971910-1-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to clear the preferred bit of a connector's existing modes.
This is useful for edp panel to unset the preferred modes read from edid
if the panel has hard-coded modes.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2:
- fix doc string (reported by kernel test robot).
- split mode and panel patches.
---
 drivers/gpu/drm/drm_modes.c | 16 ++++++++++++++++
 include/drm/drm_modes.h     |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..be3e9e931219 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1933,6 +1933,22 @@ void drm_connector_list_update(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_list_update);
 
+/**
+ * drm_mode_unset_preferred_modes - clear the preferred bit on existing modes.
+ * @connector: the connector to update
+ *
+ * Walk the mode list for connector, clearing the preferred status on existing
+ * modes.
+ */
+void drm_mode_unset_preferred_modes(struct drm_connector *connector)
+{
+	struct drm_display_mode *cur_mode;
+
+	list_for_each_entry(cur_mode, &connector->probed_modes, head)
+		cur_mode->type &= ~DRM_MODE_TYPE_PREFERRED;
+}
+EXPORT_SYMBOL_GPL(drm_mode_unset_preferred_modes);
+
 static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
 				      struct drm_cmdline_mode *mode)
 {
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index c613f0abe9dc..301817e00a15 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -560,6 +560,7 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 			    struct list_head *mode_list, bool verbose);
 void drm_mode_sort(struct list_head *mode_list);
 void drm_connector_list_update(struct drm_connector *connector);
+void drm_mode_unset_preferred_modes(struct drm_connector *connector);
 
 /* parsing cmdline modes */
 bool
-- 
2.42.0.869.gea05f2083d-goog

