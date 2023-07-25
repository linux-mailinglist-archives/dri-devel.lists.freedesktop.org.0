Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151C76236C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F67C10E3F7;
	Tue, 25 Jul 2023 20:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D76A10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:37:00 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-563c7aabf38so187188a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690317419; x=1690922219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iP077J8EmgyqkeILX2Yz7pVClwWU9gA5lNNcugVIOYM=;
 b=GZtIAhgpfRM6/PPCpYhDawEQ6STVkqSIEtcARCGIslDV0E2Oz5EubU2sXZt7Y5WysZ
 nKHRRDgxz+IHkbiAD+r0tr3hYj9QMJNtPXWKWcYKUibKzK1RlYALHKuldQpyQ+rjq2tC
 vqm+0xJeEEXyQUwsjDBcku/nb5WAuu2nfu6Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317419; x=1690922219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iP077J8EmgyqkeILX2Yz7pVClwWU9gA5lNNcugVIOYM=;
 b=GmFZ0kn6+9boRo8r9M9P9RiUeLuvE+1xJrDZcoOdFoD7+BiskBld6AI64Fdoyjyfhw
 bevYcju4poZ6RqhyFBeEz07/jwepwEEOVMfu4KyfxojcvD4hCs6eMAPLaAquFmEuRq1R
 X5sBCzjLyyn12PmBA0fodUSosxS1ketBuBIyh71GdeNPRREpvc4bufiYaAMgzu16UloM
 5Pnxa5f781gn+OLWi9zrGu4fvflAbbdpW8K77pybJHnWn8tooK+AdKgohJXOr7RlvpZ5
 OrBknYKtQjb9BEZ86JsT3+/jchzbvlzC5ZjZ3LIgj84TV1qXqKbrp93p1guwcFF8ow97
 manQ==
X-Gm-Message-State: ABy/qLbFsPtv2YjmG7s2peEU1Xc6k5NU32m9hLoklxQxF/Za+hHidnFa
 mbDsADYz0xbvdH1zy5E2SuPE/w==
X-Google-Smtp-Source: APBJJlGIYTwndwxiNhy3tq6Tp8y0sx+SY03ysIcCBnr6qkE2JXCztECD/+Fst0vDsbRKfMcVyfODkg==
X-Received: by 2002:a17:90a:4a8e:b0:268:e3d:1251 with SMTP id
 f14-20020a17090a4a8e00b002680e3d1251mr269480pjh.20.1690317419541; 
 Tue, 25 Jul 2023 13:36:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 13:36:58 -0700 (PDT)
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
Subject: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled in
 drm_panel
Date: Tue, 25 Jul 2023 13:34:37 -0700
Message-ID: <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
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

[1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This has Neil's Ack and I could commit it to drm-misc-next, but for
now I'm holding off to see where this series ends up. If the series
ends up looking good we'll have to coordinate landing the various bits
between the drm and the hid trees and the second drm patch in my
series depends on this one.

If my series implodes I'll land this one on its own. In any case, once
this lands somewhere I'll take an AI to cleanup the panels.

(no changes since v1)

 drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_panel.h     | 14 +++++++++++
 2 files changed, 57 insertions(+), 6 deletions(-)

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

