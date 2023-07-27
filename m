Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD57659DF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0E010E1D1;
	Thu, 27 Jul 2023 17:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69A10E1D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:18:35 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686f8614ce5so717956b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690478315; x=1691083115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQZ8Cw06bentZdl+4zG5W3NqtbC6pKPyy9qdL8J5He4=;
 b=Wtom9MHIMsOHg/Z5VkFflz+bbEfQkzNKAwvEaF2r5kP67rXgwP4lABgDusT6irOTWp
 i+kJfgTKgHTJio8COvmtKItEZCkajdrmWCUQnGqX8I0XsIE2KGhYFYiXLYUuu3PivQ+e
 nssRUDSVXyRXCS49j6EwevNZvfsHtD/m1nATk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478315; x=1691083115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQZ8Cw06bentZdl+4zG5W3NqtbC6pKPyy9qdL8J5He4=;
 b=TEL+m2nP/jMKPL5aR2URKJtpBqlTwnJJkQmjz2JBKjPniVNDII+Y8AsxZGSyfFfJfc
 jInl51l8IFxAAkOY/k24EjUsxmWW4xYMzg8Scwo5espsDZXXGcm947s8510XMNHV2XIN
 U5wZjiDcUCm/szhoISArydMB+gfhAXv3ZT718pIZYKXzTldYWGYUjpsE7UUGR5R+Jy+w
 ebfAYA9yIyjyWSKsY6wzezunG3MF8r6ksL1ctjftlJK/I0CzoEJj8iTVwjtknpYGdOw7
 1FFcbI5fQ1R/GwyXEzT8STZ0mZsZC0Ug8TWHI4l4UCeWxl9ohBotfoTLg37o74vQOGTT
 1+lg==
X-Gm-Message-State: ABy/qLYXZ7UPNsESbUvoOgnqJtkSIFZPS7WtjHH3yX874pRd1setCVAi
 /9+F994nh2s054D5taSy8n0xDQ==
X-Google-Smtp-Source: APBJJlGmZC9borubx3T6e0kzMzxMxJUj+Df+XCqWavB4O4v7bS4lCkgxWXjA17w0bSDBXf5fn5KDug==
X-Received: by 2002:a05:6a20:6a04:b0:133:21c3:115e with SMTP id
 p4-20020a056a206a0400b0013321c3115emr7569088pzk.48.1690478314913; 
 Thu, 27 Jul 2023 10:18:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2339:954b:b98f:611a])
 by smtp.gmail.com with ESMTPSA id
 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:18:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 02/11] drm/panel: Check for already prepared/enabled in
 drm_panel
Date: Thu, 27 Jul 2023 10:16:29 -0700
Message-ID: <20230727101636.v4.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a whole pile of panel drivers, we have code to make the
prepare/unprepare/enable/disable callbacks behave as no-ops if they've
already been called. It's silly to have this code duplicated
everywhere. Add it to the core instead so that we can eventually
delete it from all the drivers. Note: to get some idea of the
duplicated code, try:
  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
  git grep 'if.*>enabled' -- drivers/gpu/drm/panel

NOTE: arguably, the right thing to do here is actually to skip this
patch and simply remove all the extra checks from the individual
drivers. Perhaps the checks were needed at some point in time in the
past but maybe they no longer are? Certainly as we continue
transitioning over to "panel_bridge" then we expect there to be much
less variety in how these calls are made. When we're called as part of
the bridge chain, things should be pretty simple. In fact, there was
some discussion in the past about these checks [1], including a
discussion about whether the checks were needed and whether the calls
ought to be refcounted. At the time, I decided not to mess with it
because it felt too risky.

Looking closer at it now, I'm fairly certain that nothing in the
existing codebase is expecting these calls to be refcounted. The only
real question is whether someone is already doing something to ensure
prepare()/unprepare() match and enabled()/disable() match. I would say
that, even if there is something else ensuring that things match,
there's enough complexity that adding an extra bool and an extra
double-check here is a good idea. Let's add a drm_warn() to let people
know that it's considered a minor error to take advantage of
drm_panel's double-checking but we'll still make things work fine.

We'll also add an entry to the official DRM todo list to remove the
now pointless check from the panels after this patch lands and,
eventually, fixup anyone who is triggering the new warning.

[1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This has Neil's Ack and Maxime's review and I could commit it to
drm-misc-next, but for now I'm holding off to land with the rest of
this series since the second drm patch in my series depends on this
one.

Once this lands somewhere, I'll take the action item to post patches
to delete the now pointless checks in the individual panels.

Changes in v4:
- Document further cleanup in the official DRM todo list.

 Documentation/gpu/todo.rst  | 24 ++++++++++++++++++
 drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_panel.h     | 14 +++++++++++
 3 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 68bdafa0284f..e3b272c97758 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -452,6 +452,30 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Clean up checks for already prepared/enabled in panels
+------------------------------------------------------
+
+In a whole pile of panel drivers, we have code to make the
+prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
+been called. To get some idea of the duplicated code, try:
+  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
+  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
+
+In the patch ("drm/panel: Check for already prepared/enabled in drm_panel")
+we've moved this check to the core. Now we can most definitely remove the
+check from the individual panels and save a pile of code.
+
+In adition to removing the check from the individual panels, it is believed
+that even the core shouldn't need this check and that should be considered
+an error if other code ever relies on this check. The check in the core
+currently prints a warning whenever something is relying on this check with
+dev_warn(). After a little while, we likely want to promote this to a
+WARN(1) to help encourage folks not to rely on this behavior.
+
+Contact: Douglas Anderson <dianders@chromium.org>
+
+Level: Starter/Intermediate
+
 
 Core refactorings
 =================
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..4e1c4e42575b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
+	int ret;
+
 	if (!panel)
 		return -EINVAL;
 
-	if (panel->funcs && panel->funcs->prepare)
-		return panel->funcs->prepare(panel);
+	if (panel->prepared) {
+		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		return 0;
+	}
+
+	if (panel->funcs && panel->funcs->prepare) {
+		ret = panel->funcs->prepare(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->prepared = true;
 
 	return 0;
 }
@@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
+	int ret;
+
 	if (!panel)
 		return -EINVAL;
 
-	if (panel->funcs && panel->funcs->unprepare)
-		return panel->funcs->unprepare(panel);
+	if (!panel->prepared) {
+		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
+		return 0;
+	}
+
+	if (panel->funcs && panel->funcs->unprepare) {
+		ret = panel->funcs->unprepare(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->prepared = false;
 
 	return 0;
 }
@@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	if (panel->enabled) {
+		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		return 0;
+	}
+
 	if (panel->funcs && panel->funcs->enable) {
 		ret = panel->funcs->enable(panel);
 		if (ret < 0)
 			return ret;
 	}
+	panel->enabled = true;
 
 	ret = backlight_enable(panel->backlight);
 	if (ret < 0)
@@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	if (!panel->enabled) {
+		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		return 0;
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
 			     ret);
 
-	if (panel->funcs && panel->funcs->disable)
-		return panel->funcs->disable(panel);
+	if (panel->funcs && panel->funcs->disable) {
+		ret = panel->funcs->disable(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->enabled = false;
 
 	return 0;
 }
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 432fab2347eb..c6cf75909389 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -198,6 +198,20 @@ struct drm_panel {
 	 * the panel is powered up.
 	 */
 	bool prepare_prev_first;
+
+	/**
+	 * @prepared:
+	 *
+	 * If true then the panel has been prepared.
+	 */
+	bool prepared;
+
+	/**
+	 * @enabled:
+	 *
+	 * If true then the panel has been enabled.
+	 */
+	bool enabled;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.41.0.487.g6d72f3e995-goog

