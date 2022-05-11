Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089A524078
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 00:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC8910E226;
	Wed, 11 May 2022 22:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5BA10E2DE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 22:58:30 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id n10so3528134pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOtUBAROt8+wSZqck5ELJgqyUVB2vFhXIURSscRlUY4=;
 b=DvS+M4uoPyOP2cGbinXkmJFSQjV7jAHY/pFLgs8BVJNOUo0IhmEtaQJDeZHy7n0lI9
 oJRkHDmPw+hhwekGiNi5e1/y3wX4HUtf9Ex8LYcFQqLfrCZDwVhYeN9JeMQ6Mf705WIW
 DutFGsRV7NOEn10hg2nVrhHFue4sJs80E8JkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOtUBAROt8+wSZqck5ELJgqyUVB2vFhXIURSscRlUY4=;
 b=UgWI++xgYVY8DTmYtPVwp9qmqkCNQZXk6P3fv/9sE4mtCffjoP4sRodae78K30Bnzs
 MPKI+zXWbiljtZBR2D98PB5b1GPbbmmDjejciT8pmMlN6em0C9n8W3lkaTjK+6Dg0AHJ
 ttMp9WSHi4ubjiZk4eSh41dOILARwJkdeI4zXIesUX2UiLa8fQtodg7iqtkmuaocJT3w
 VDNgmNVkcMfbssrnSLGw8P9tCCGcaSqA0WmsaX7itccuFBxoPXTS+BE16xAkH/SfMDOx
 wU2LVC+kC7l0fjTepzVJq/fLG/tVSXYYqpeDY7xrpltAhG+MVqu07CA89YqweghwDPTZ
 L6Nw==
X-Gm-Message-State: AOAM533D32pIW8lQjHWF06+dZFKyLkyiYJ/Vx7MC2kArH5aFu33fTHUE
 xST13JdlGfNkjsdGMFAeFbXo+Jetnmj3GtQ7qWo=
X-Google-Smtp-Source: ABdhPJz/rySupxeHwGcIIPekwo8CUfSHZrQcTijT7+Ndv2m0tuN4p9CM6EMMOqwz7W+WeipOlPBNkw==
X-Received: by 2002:a17:903:18c:b0:15e:be98:90ef with SMTP id
 z12-20020a170903018c00b0015ebe9890efmr27017500plg.129.1652309909866; 
 Wed, 11 May 2022 15:58:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:504e:720d:de58:4f66])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902968500b0015e8d4eb1easm2399714plp.52.2022.05.11.15.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:58:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
Date: Wed, 11 May 2022 15:58:07 -0700
Message-Id: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
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
Cc: quic_sbillaka@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, tzimmermann@suse.de, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_helper_probe_single_connector_modes() is a bit long. Let's
break a chunk off to update and validate modes. This helps avoid one
goto and also will allow us to more easily call the helper a second
time in a future patch without adding looping or another goto.

This change is intended to be a no-op change--just code movement.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v3:
- Removed WARN_ON

Changes in v2:
- Two underscores for __drm_helper_update_and_validate().
- Return err and use WARN_ON instead of returning a bool.

 drivers/gpu/drm/drm_probe_helper.c | 106 ++++++++++++++++-------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..2570d47e7eab 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -354,6 +354,61 @@ drm_helper_probe_detect(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
+static int __drm_helper_update_and_validate(struct drm_connector *connector,
+					    uint32_t maxX, uint32_t maxY,
+					    struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode;
+	int mode_flags = 0;
+	int ret;
+
+	drm_connector_list_update(connector);
+
+	if (connector->interlace_allowed)
+		mode_flags |= DRM_MODE_FLAG_INTERLACE;
+	if (connector->doublescan_allowed)
+		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
+	if (connector->stereo_allowed)
+		mode_flags |= DRM_MODE_FLAG_3D_MASK;
+
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_driver(dev, mode);
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_size(mode, maxX, maxY);
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_flag(mode, mode_flags);
+		if (mode->status != MODE_OK)
+			continue;
+
+		ret = drm_mode_validate_pipeline(mode, connector, ctx,
+						 &mode->status);
+		if (ret) {
+			drm_dbg_kms(dev,
+				    "drm_mode_validate_pipeline failed: %d\n",
+				    ret);
+
+			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK))
+				mode->status = MODE_ERROR;
+			else
+				return -EDEADLK;
+		}
+
+		if (mode->status != MODE_OK)
+			continue;
+		mode->status = drm_mode_validate_ycbcr420(mode, connector);
+	}
+
+	return 0;
+}
+
 /**
  * drm_helper_probe_single_connector_modes - get complete set of display modes
  * @connector: connector to probe
@@ -421,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	const struct drm_connector_helper_funcs *connector_funcs =
 		connector->helper_private;
 	int count = 0, ret;
-	int mode_flags = 0;
 	bool verbose_prune = true;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
@@ -519,52 +573,12 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			   connector->status == connector_status_unknown))
 		count = drm_add_modes_noedid(connector, 1024, 768);
 	count += drm_helper_probe_add_cmdline_mode(connector);
-	if (count == 0)
-		goto prune;
-
-	drm_connector_list_update(connector);
-
-	if (connector->interlace_allowed)
-		mode_flags |= DRM_MODE_FLAG_INTERLACE;
-	if (connector->doublescan_allowed)
-		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
-	if (connector->stereo_allowed)
-		mode_flags |= DRM_MODE_FLAG_3D_MASK;
-
-	list_for_each_entry(mode, &connector->modes, head) {
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_driver(dev, mode);
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_size(mode, maxX, maxY);
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_flag(mode, mode_flags);
-		if (mode->status != MODE_OK)
-			continue;
-
-		ret = drm_mode_validate_pipeline(mode, connector, &ctx,
-						 &mode->status);
-		if (ret) {
-			drm_dbg_kms(dev,
-				    "drm_mode_validate_pipeline failed: %d\n",
-				    ret);
-
-			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK)) {
-				mode->status = MODE_ERROR;
-			} else {
-				drm_modeset_backoff(&ctx);
-				goto retry;
-			}
+	if (count != 0) {
+		ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&ctx);
+			goto retry;
 		}
-
-		if (mode->status != MODE_OK)
-			continue;
-		mode->status = drm_mode_validate_ycbcr420(mode, connector);
 	}
 
 prune:
-- 
2.36.0.550.gb090851708-goog

