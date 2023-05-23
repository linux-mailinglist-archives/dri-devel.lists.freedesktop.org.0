Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A570E56C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC98610E4AB;
	Tue, 23 May 2023 19:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096F10E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:13 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a516fb6523so253875ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870273; x=1687462273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKRK4xfTer6o8sAg3PoM2xcqa0uawxE5nHuVWKhZwR0=;
 b=F+RFRAAVkb14F3v0JkgcAWWjh6tAt8ecJgxOH0c24t+NptgnNpm3yQZQ4chcrhs6tm
 PmNunCCzD43Hl4JOutjqj+OkMvfjL9s/Hy5YtWhcfZCwQP+UezJfVTMEClILyKcpUTXP
 hSME9ktlQEYrUZ+NXyBfWVdcr5AxjahHC70oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870273; x=1687462273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKRK4xfTer6o8sAg3PoM2xcqa0uawxE5nHuVWKhZwR0=;
 b=ISz6Diza0/WM3waJEtzlxNdqu4h8p0/+13aGxchzanDUzgND+pJVN2gdtXj+hzzQRn
 bNJ9kiCd6CIIp06vA5fN6N1BTLpw4WeLsrEcEpn4GCTgzqXkT+aHoP4K5LQZuLjsll6J
 5h5A3COtxIvtIAneHIlT7S2JKDIvSfC0X7AcTTrYn0Lj14H3mRYjT4ALaXh/rxyulc1x
 02T2k4iiVLjGaM7Wz5puUls3usVLuFuRs7KO3dvPuGxuaBgj4tWxB+jVUV/InetBnbpk
 2SDMNGsreTEXEFo5bG+WP3MnAOzXMITEgTwj14YKpcTZiOM7emfwxjY/okGeVGmJZ62i
 rK+A==
X-Gm-Message-State: AC+VfDxMdjsB54cpOt+UXP6vY0scfP5Kfyz02L8M9AHmPIHJVMipsWVS
 zI5DJPdlL2uUXzOtpBmqBIFVbw==
X-Google-Smtp-Source: ACHHUZ6+R5dtBFK1umveld97BEXM7URbVt+ovbFLPIhv1kkW0xyJu3i7kIBJg1vLIb01UTdBgQqzTg==
X-Received: by 2002:a17:902:d2c2:b0:1ac:4412:bd9 with SMTP id
 n2-20020a170902d2c200b001ac44120bd9mr14843362plc.3.1684870272940; 
 Tue, 23 May 2023 12:31:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] drm/panel: Check for already prepared/enabled in drm_panel
Date: Tue, 23 May 2023 12:27:56 -0700
Message-ID: <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.40.1.698.g37aff9b760-goog

