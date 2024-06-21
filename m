Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35294912EC5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB01910E1E3;
	Fri, 21 Jun 2024 20:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m7UrdR11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACE410E268
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:45:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1f4a0050b9aso20018035ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719002726; x=1719607526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iVIU6GRHS/gZCTZAeludJKE1JPkgTaxBngcKV21xUpY=;
 b=m7UrdR11azW0w13J3pOoNlCViIHIlXMGoaGeBICCxuM7V3hmGdeOloHti6xnd0BoqN
 X+YSRBtaXRbdJ2AmZNTfTG4lTP4GtM4vP93GKlQZZ/xE6tqjGtXRKr8xQJaiaZtlqg8J
 h6D7IMOY6EI+M9pc9U3WPdalBW9We+nxIeSVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719002726; x=1719607526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iVIU6GRHS/gZCTZAeludJKE1JPkgTaxBngcKV21xUpY=;
 b=HHCMIAaE2V3DaMiushzgFTNjozPg3QohbErgkbrzDV9GHkaIJZEsJzVxC5w64LtCJb
 uqBGF+6BMjGCHEG02rN86zvX2Bx+p1fW0qTou3X031GjFO21Lm4HvSJuYQT2pVfdvHos
 ElVHrtApW70OFBQ6TgyOj1/toG/JDDEb90aZvGLZ2a8/4Pmg/31qj1QJS9WjCJbWVgJW
 tkCBDcDb33X5I3jMD5+r2wwC9HZotyv7XgcfmyXhJREOXjOChl5per/dQpRt2Xx7EofK
 gZrSNmQm7Mm0OCtvDNcVuae7dDjVkYxHUw+2sC9PxmfkTBZIhonYJEBLP9xv+5AL+Cgw
 fRZg==
X-Gm-Message-State: AOJu0YzarqpLxDa5F7Jpqc5Jds0WGFWLeGVxTRbk9F4vTt0cDe+w8KLP
 wZrqEXSA3EMtAridslZHcupCwEcpIn8yi+lQD2bQaDOfycDKtu54btUMJkA8YfOLt07AMF8Z290
 =
X-Google-Smtp-Source: AGHT+IGc5lFqy825QUrUnhdu5/F6soEBlI4c8S4/mkbvE8LxAatpYoO1AAaeGDcuQqq7HtpQ9m5vcg==
X-Received: by 2002:a17:902:ec83:b0:1f6:fcca:12dc with SMTP id
 d9443c01a7336-1f9aa3e893cmr115474975ad.28.1719002726284; 
 Fri, 21 Jun 2024 13:45:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:7abd:666f:1067:fa35])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f271esm18746215ad.38.2024.06.21.13.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:45:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Date: Fri, 21 Jun 2024 13:44:29 -0700
Message-ID: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
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

At shutdown if you've got a _properly_ coded DRM modeset driver then
you'll get these two warnings at shutdown time:

  Skipping disable of already disabled panel
  Skipping unprepare of already unprepared panel

These warnings are ugly and sound concerning, but they're actually a
sign of a properly working system. That's not great.

We're not ready to get rid of the calls to drm_panel_disable() and
drm_panel_unprepare() because we're not 100% convinced that all DRM
modeset drivers are properly calling drm_atomic_helper_shutdown() or
drm_helper_force_disable_all() at the right times. However, having the
warning show up for correctly working systems is bad.

As a bit of a workaround, add some "if" tests to try to avoid the
warning on correctly working systems. Also add some comments and
update the TODO items in the hopes that future developers won't be too
confused by what's going on here.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch came out of discussion on dri-devel on 2024-06-21
[1]. NOTE: I have put all changes into one patch since it didn't seem
to add anything to break up the updating of the TODO or the comments
in the core into separate patches since the patch is all about one
topic and all code is expected to land in the same tree.

Previous versions:
v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid/
v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2024-06-21

 Documentation/gpu/todo.rst           | 35 +++++++++++++---------------
 drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
 4 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2ea6ffc9b22b..96c453980ab6 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -475,25 +475,22 @@ Remove disable/unprepare in remove/shutdown in panel-simple and panel-edp
 As of commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
 drm_panel"), we have a check in the drm_panel core to make sure nobody
 double-calls prepare/enable/disable/unprepare. Eventually that should probably
-be turned into a WARN_ON() or somehow made louder, but right now we actually
-expect it to trigger and so we don't want it to be too loud.
-
-Specifically, that warning will trigger for panel-edp and panel-simple at
-shutdown time because those panels hardcode a call to drm_panel_disable()
-and drm_panel_unprepare() at shutdown and remove time that they call regardless
-of panel state. On systems with a properly coded DRM modeset driver that
-calls drm_atomic_helper_shutdown() this is pretty much guaranteed to cause
-the warning to fire.
-
-Unfortunately we can't safely remove the calls in panel-edp and panel-simple
-until we're sure that all DRM modeset drivers that are used with those panels
-properly call drm_atomic_helper_shutdown(). This TODO item is to validate
-that all DRM modeset drivers used with panel-edp and panel-simple properly
-call drm_atomic_helper_shutdown() and then remove the calls to
-disable/unprepare from those panels. Alternatively, this TODO item could be
-removed by convincing stakeholders that those calls are fine and downgrading
-the error message in drm_panel_disable() / drm_panel_unprepare() to a
-debug-level message.
+be turned into a WARN_ON() or somehow made louder.
+
+At the moment, we expect that we may still encounter the warnings in the
+drm_panel core when using panel-simple and panel-edp. Since those panel
+drivers are used with a lot of different DRM modeset drivers they still
+make an extra effort to disable/unprepare the panel themsevles at shutdown
+time. Specifically we could still encounter those warnings if the panel
+driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
+driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
+callback. Warnings could be avoided in such a case by using something like
+device links to ensure that the panel gets shutdown() after the DRM modeset
+driver.
+
+Once all DRM modeset drivers are known to shutdown properly, the extra
+calls to disable/unprepare in remove/shutdown in panel-simple and panel-edp
+should be removed and this TODO item marked complete.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index cfbe020de54e..19ab0a794add 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -161,6 +161,15 @@ int drm_panel_unprepare(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	/*
+	 * If you are seeing the warning below it likely means one of two things:
+	 * - Your panel driver incorrectly calls drm_panel_unprepare() in its
+	 *   shutdown routine. You should delete this.
+	 * - You are using panel-edp or panel-simple and your DRM modeset
+	 *   driver's shutdown() callback happened after the panel's shutdown().
+	 *   In this case the warning is harmless though ideally you should
+	 *   figure out how to reverse the order of the shutdown() callbacks.
+	 */
 	if (!panel->prepared) {
 		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
 		return 0;
@@ -245,6 +254,15 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	/*
+	 * If you are seeing the warning below it likely means one of two things:
+	 * - Your panel driver incorrectly calls drm_panel_disable() in its
+	 *   shutdown routine. You should delete this.
+	 * - You are using panel-edp or panel-simple and your DRM modeset
+	 *   driver's shutdown() callback happened after the panel's shutdown().
+	 *   In this case the warning is harmless though ideally you should
+	 *   figure out how to reverse the order of the shutdown() callbacks.
+	 */
 	if (!panel->enabled) {
 		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
 		return 0;
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3a574a9b46e7..8723cd190913 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -954,16 +954,24 @@ static void panel_edp_shutdown(struct device *dev)
 	 * drm_atomic_helper_shutdown() at shutdown time and that should
 	 * cause the panel to be disabled / unprepared if needed. For now,
 	 * however, we'll keep these calls due to the sheer number of
-	 * different DRM modeset drivers used with panel-edp. The fact that
-	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
-	 * will try to disable/unprepare means that we can get a warning about
-	 * trying to disable/unprepare an already disabled/unprepared panel,
-	 * but that's something we'll have to live with until we've confirmed
-	 * that all DRM modeset drivers are properly calling
-	 * drm_atomic_helper_shutdown().
+	 * different DRM modeset drivers used with panel-edp. Once we've
+	 * confirmed that all DRM modeset drivers using this panel properly
+	 * call drm_atomic_helper_shutdown() we can simply delete the two
+	 * calls below.
+	 *
+	 * TO BE EXPLICIT: THE CALLS BELOW SHOULDN'T BE COPIED TO ANY NEW
+	 * PANEL DRIVERS.
+	 *
+	 * FIXME: If we're still haven't figured out if all DRM modeset
+	 * drivers properly call drm_atomic_helper_shutdown() but we _have_
+	 * managed to make sure that DRM modeset drivers get their shutdown()
+	 * callback before the panel's shutdown() callback (perhaps using
+	 * device link), we could add a WARN_ON here to help move forward.
 	 */
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	if (panel->base.enabled)
+		drm_panel_disable(&panel->base);
+	if (panel->base.prepared)
+		drm_panel_unprepare(&panel->base);
 }
 
 static void panel_edp_remove(struct device *dev)
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8345ed891f5a..022ffab2324a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -726,16 +726,24 @@ static void panel_simple_shutdown(struct device *dev)
 	 * drm_atomic_helper_shutdown() at shutdown time and that should
 	 * cause the panel to be disabled / unprepared if needed. For now,
 	 * however, we'll keep these calls due to the sheer number of
-	 * different DRM modeset drivers used with panel-simple. The fact that
-	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
-	 * will try to disable/unprepare means that we can get a warning about
-	 * trying to disable/unprepare an already disabled/unprepared panel,
-	 * but that's something we'll have to live with until we've confirmed
-	 * that all DRM modeset drivers are properly calling
-	 * drm_atomic_helper_shutdown().
+	 * different DRM modeset drivers used with panel-simple. Once we've
+	 * confirmed that all DRM modeset drivers using this panel properly
+	 * call drm_atomic_helper_shutdown() we can simply delete the two
+	 * calls below.
+	 *
+	 * TO BE EXPLICIT: THE CALLS BELOW SHOULDN'T BE COPIED TO ANY NEW
+	 * PANEL DRIVERS.
+	 *
+	 * FIXME: If we're still haven't figured out if all DRM modeset
+	 * drivers properly call drm_atomic_helper_shutdown() but we _have_
+	 * managed to make sure that DRM modeset drivers get their shutdown()
+	 * callback before the panel's shutdown() callback (perhaps using
+	 * device link), we could add a WARN_ON here to help move forward.
 	 */
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	if (panel->base.enabled)
+		drm_panel_disable(&panel->base);
+	if (panel->base.prepared)
+		drm_panel_unprepare(&panel->base);
 }
 
 static void panel_simple_remove(struct device *dev)
-- 
2.45.2.741.gdbec12cfda-goog

