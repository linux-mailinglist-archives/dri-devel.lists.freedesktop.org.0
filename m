Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C07070E56D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116A10E4AC;
	Tue, 23 May 2023 19:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C80C10E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:15 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ae52ce3205so207175ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870275; x=1687462275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFceW/w2z029LhdzC0IYfafm6PGMlG52PS9xCNhNQ8M=;
 b=NDPo3+H4Kv40YppQl/vuEC5v6GYuM9qXoPPfSrjCEimIbyLp0HBTPeE3cyp+Tyjnvg
 WhO/Ue/WWj4EPfDSzMoQZGgMc66DIiFaDuSLs//4aWFPNqFTcJWaCOx4TRs52cqj14iM
 V42sqffwzlYSngsrHKPtHHZdmg56zsGGj0i5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870275; x=1687462275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFceW/w2z029LhdzC0IYfafm6PGMlG52PS9xCNhNQ8M=;
 b=HT9IxQz0sBLlH/ChwhTW/zGgfgFZvYpNsKbbx/3+T+yUt5B23vwNngSOTTn1R/UdnG
 gzvgbJfavImQB6WBSM/IZdlwid7SU17ZVSUyYUdAqppvNj6pltOom0IId1RBWaY55fmM
 TSNg6YGXCDws2SZWoTKoSBbd9pqVWLkceN+VJ3wlYW1fRWRrdhHn8no2HZDTvM+oGi26
 lEyZDaa5eXg1m3LaEtutIcJNS/GaGNZmnDYiU86fL23QQno2+k6SWcB3lZNhRmuzvdHT
 kPDsmWu7PmvgjShHAp1cEzUuB/DKZz6IaG3KbJ7vVCbq8+/ZRaLZhsi2ArWN8WtvDcln
 huuA==
X-Gm-Message-State: AC+VfDzu7f5S4yInv2L3zh1d7maSiv7nD/DAC5Dnr1s7bzCLyarOwkbS
 nNnrucCiJBRW/m5KqBM/fNr+EA==
X-Google-Smtp-Source: ACHHUZ7cTIe5ogd2sdNMiYJo8AMlVzFIHTjP77FjtWqzv3s0mkRXvL+1OlLGdykr2Ng8RDE4zsS0nQ==
X-Received: by 2002:a17:902:f549:b0:1aa:fbaa:ee01 with SMTP id
 h9-20020a170902f54900b001aafbaaee01mr19140474plf.48.1684870275204; 
 Tue, 23 May 2023 12:31:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:14 -0700 (PDT)
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
Subject: [PATCH 3/9] drm/panel: Add a way for other devices to follow panel
 state
Date: Tue, 23 May 2023 12:27:57 -0700
Message-ID: <20230523122802.3.Icd5f96342d2242051c754364f4bee13ef2b986d4@changeid>
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

These days, it's fairly common to see panels that have touchscreens
attached to them. The panel and the touchscreen can somewhat be
thought of as totally separate devices and, historically, this is how
Linux has treated them. However, treating them as separate isn't
necessarily the best way to model the two devices, it was just that
there was no better way. Specifically, there is little practical
reason to have the touchscreen powered on when the panel is turned
off, but if we model the devices separately we have no way to keep the
two devices' power states in sync with each other.

The issue described above makes it sound as if the problem here is
just about efficiency. We're wasting power keeping the touchscreen
powered up when the screen is off. While that's true, the problem can
go deeper. Specifically, hardware designers see that there's no reason
to have the touchscreen on while the screen is off and then build
hardware assuming that software would never turn the touchscreen on
while the screen is off.

In the very simplest case of hardware designs like this, the
touchscreen and the panel share some power rails. In most cases, this
turns out not to be terrible and is, again, just a little less
efficient. Specifically if we tell Linux that the touchscreen and the
panel are using the same rails then Linux will keep the rails on when
_either_ device is turned on. That ends to work OK-ish, but now if you
turn the panel off not only will the touchscreen remain powered, but
the power rails for the panel itself won't be switched off, burning
extra power.

The above two inefficiencies are _extra_ minor when you consider the
fact that laptops rarely spend much time with the screen off. The main
use case would be when an external screen (and presumably a power
supply) is attached.

Unfortunately, it gets worse from here. On sc7180-trogdor-homestar,
for instance, the display's TCON (timing controller) sometimes crashes
if you didn't power cycle it whenever you stopp and restart the video
stream (like during a modeset). The touchscreen keeping the power
rails on caused real problems. One proposal in the homestar timeframe
was to move the touchscreen to an always-on rail, dedicating the main
power rail to the panel. That caused _different_ problems as talked
about in commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the
reset line to the regulator"). The end result of all of this was to
add an extra regulator to the board, increasing cost.

Recently, Cong Yang posted a patch [1] where things are even worse.
The panel and touch controller on that system seem even more
intimately tied together and really can't be thought of separately.

To address this issue, let's start allowing devices to register
themselves as "panel followers". These devices will get called after a
panel has been powered on and before a panel is powered off. This
makes the panel the primary device in charge of the power state, which
matches how userspace uses it.

The panel follower API should be fairly straightforward to use. The
current code assumes that panel followers are using device tree and
have a "panel" property pointing to the panel to follow. More
flexibility and non-DT implementations could be added as needed.

Right now, panel followers can follow the prepare/unprepare functions.
There could be arguments made that, instead, they should follow
enable/disable. I've chosen prepare/unprepare for now since those
functions are guaranteed to power up/power down the panel and it seems
better to start the process earlier.

[1] 20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_panel.c | 149 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     |  75 ++++++++++++++++++
 2 files changed, 220 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 4e1c4e42575b..c4d9db435f15 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -58,6 +58,8 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs, int connector_type)
 {
 	INIT_LIST_HEAD(&panel->list);
+	INIT_LIST_HEAD(&panel->followers);
+	mutex_init(&panel->follower_lock);
 	panel->dev = dev;
 	panel->funcs = funcs;
 	panel->connector_type = connector_type;
@@ -105,6 +107,7 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -115,14 +118,27 @@ int drm_panel_prepare(struct drm_panel *panel)
 		return 0;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
 	if (panel->funcs && panel->funcs->prepare) {
 		ret = panel->funcs->prepare(panel);
 		if (ret < 0)
-			return ret;
+			goto exit;
 	}
 	panel->prepared = true;
 
-	return 0;
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -139,6 +155,7 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -149,14 +166,27 @@ int drm_panel_unprepare(struct drm_panel *panel)
 		return 0;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+
 	if (panel->funcs && panel->funcs->unprepare) {
 		ret = panel->funcs->unprepare(panel);
 		if (ret < 0)
-			return ret;
+			goto exit;
 	}
 	panel->prepared = false;
 
-	return 0;
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
@@ -342,6 +372,117 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
+/**
+ * drm_panel_add_follower() - Register something to follow panel enable state.
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * A panel follower is called right after preparing the panel and right before
+ * unpreparing the panel. It's primary intention is to power on an associated
+ * touchscreen, though it could be used for any similar devices. Multiple
+ * devices are allowed the follow the same panel.
+ *
+ * If a follower is added to a panel that's already been turned on, the
+ * follower's prepare callback is called right away.
+ *
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: 0 or an error code.
+ */
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower)
+{
+	struct device_node *panel_np;
+	struct drm_panel *panel;
+	int ret;
+
+	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
+	if (!panel_np)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(panel_np);
+	of_node_put(panel_np);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
+	get_device(panel->dev);
+	follower->panel = panel;
+
+	mutex_lock(&panel->follower_lock);
+
+	list_add_tail(&follower->list, &panel->followers);
+	if (panel->prepared) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	mutex_unlock(&panel->follower_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_add_follower);
+
+/**
+ * drm_panel_remove_follower() - Reverse drm_panel_add_follower().
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Undo drm_panel_add_follower(). This includes calling the follower's disable
+ * function if we're removed from a panel that's currently enabled.
+ *
+ * Return: 0 or an error code.
+ */
+void drm_panel_remove_follower(struct drm_panel_follower *follower)
+{
+	struct drm_panel *panel = follower->panel;
+	int ret;
+
+	mutex_lock(&panel->follower_lock);
+
+	if (panel->prepared) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+	list_del_init(&follower->list);
+
+	mutex_unlock(&panel->follower_lock);
+
+	put_device(panel->dev);
+}
+EXPORT_SYMBOL(drm_panel_remove_follower);
+
+static void drm_panel_remove_follower_void(void *follower)
+{
+	drm_panel_remove_follower(follower);
+}
+
+/**
+ * devm_drm_panel_add_follower() - devm version of drm_panel_add_follower()
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Handles calling drm_panel_remove_follower() using devm on the follower_dev.
+ *
+ * Return: 0 or an error code.
+ */
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower)
+{
+	int ret;
+
+	ret = drm_panel_add_follower(follower_dev, follower);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(follower_dev,
+					drm_panel_remove_follower_void, follower);
+}
+EXPORT_SYMBOL(devm_drm_panel_add_follower);
+
 #if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 /**
  * drm_panel_of_backlight - use backlight device node for backlight
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c6cf75909389..e0a4d2f6f7fb 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -27,12 +27,14 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 
 struct backlight_device;
 struct dentry;
 struct device_node;
 struct drm_connector;
 struct drm_device;
+struct drm_panel_follower;
 struct drm_panel;
 struct display_timing;
 
@@ -144,6 +146,45 @@ struct drm_panel_funcs {
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
 };
 
+struct drm_panel_follower_funcs {
+	/**
+	 * @panel_prepared:
+	 *
+	 * Called after the panel has been powered on.
+	 */
+	int (*panel_prepared)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_unpreparing:
+	 *
+	 * Called before the panel is powered off.
+	 */
+	int (*panel_unpreparing)(struct drm_panel_follower *follower);
+};
+
+struct drm_panel_follower {
+	/**
+	 * @funcs:
+	 *
+	 * Dependent device callbacks; should be initted by the caller.
+	 */
+	const struct drm_panel_follower_funcs *funcs;
+
+	/**
+	 * @list
+	 *
+	 * Used for linking into panel's list; set by drm_panel_add_follower().
+	 */
+	struct list_head list;
+
+	/**
+	 * @panel
+	 *
+	 * The panel we're dependent on; set by drm_panel_add_follower().
+	 */
+	struct drm_panel *panel;
+};
+
 /**
  * struct drm_panel - DRM panel object
  */
@@ -189,6 +230,20 @@ struct drm_panel {
 	 */
 	struct list_head list;
 
+	/**
+	 * @followers:
+	 *
+	 * A list of struct drm_panel_follower dependent on this panel.
+	 */
+	struct list_head followers;
+
+	/**
+	 * @followers_lock:
+	 *
+	 * Lock for followers list.
+	 */
+	struct mutex follower_lock;
+
 	/**
 	 * @prepare_prev_first:
 	 *
@@ -246,6 +301,26 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
 }
 #endif
 
+#if defined(CONFIG_DRM_PANEL)
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower);
+void drm_panel_remove_follower(struct drm_panel_follower *follower);
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower);
+#else
+static inline int drm_panel_add_follower(struct device *follower_dev,
+					 struct drm_panel_follower *follower)
+{
+	return -ENODEV;
+}
+static inline void drm_panel_remove_follower(struct drm_panel_follower *follower) { }
+static inline int devm_drm_panel_add_follower(struct device *follower_dev,
+					      struct drm_panel_follower *follower)
+{
+	return -ENODEV;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
 	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
 int drm_panel_of_backlight(struct drm_panel *panel);
-- 
2.40.1.698.g37aff9b760-goog

