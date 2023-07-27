Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19817659E0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381E110E1D6;
	Thu, 27 Jul 2023 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F3F10E1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:18:37 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686be28e1a8so878015b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690478317; x=1691083117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKObnOxhKS6BrIWcxa9f6gRD8GnowD5weOErK132RE4=;
 b=TGCEpmBdAiDZzUbKZ1yiuQQF3dg+jtHjEEvyqd5MbrCMqlscwgIoNuqTPWPH2D7y5t
 FULmn5cmb/O9VRm32jjyuq6BpqzsZTk7aVczoiPY2YzCCT9dyPzCCGtlsqRkJGAdgsTU
 2Wsk1Llolg7ggNSfQzMOmLfQxcPq500Jo7ua8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478317; x=1691083117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKObnOxhKS6BrIWcxa9f6gRD8GnowD5weOErK132RE4=;
 b=gFPEek6NZMz2Rxgc0NBnwiQ8ijQoYR64sJF9kX4FzpqysEvPj7aBK92vBtTdRSF9jn
 9pt/Pej+GGAmUP2ekC26K6OUpM9bw+Gbuzn6uukkeQKGavJn9FNXWTHSrUZx30GPVGyK
 xGsTCs3pb/ig7cGrIy5tSLBPu6yMJmNQpuENoSR5jSClWIQcjCAHQkBxfA9GkcpAAh5O
 XfO36AQVt5ywBFBLl6a6z8tYDnMWaga64s/L/oMqH5FcJMQ1RuSnn9/NLIveFQErMIV/
 CIGwUYO7QmbaEUvdSsgXX9kn65/oe7T16JRvsGLr5e/mdSVoMXnOwwKu4z/IC2UXkdAd
 bzqg==
X-Gm-Message-State: ABy/qLb3r9rTm8PGEXxYrnE/ygwGUGQ8BcIkzkc2hvPFD/MT1t7jkhjU
 YChy3ycyBuaGPeSfelz4OeIXbA==
X-Google-Smtp-Source: APBJJlFQol3YftBaC92yIC9CeLfOGhYg3TqHZzs92Jluyld+thUY/3PW8bGu+UCxnkp5uTQktkEK1A==
X-Received: by 2002:a05:6a20:7d89:b0:133:712e:f700 with SMTP id
 v9-20020a056a207d8900b00133712ef700mr6187237pzj.51.1690478317166; 
 Thu, 27 Jul 2023 10:18:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2339:954b:b98f:611a])
 by smtp.gmail.com with ESMTPSA id
 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:18:36 -0700 (PDT)
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
Subject: [PATCH v4 03/11] drm/panel: Add a way for other devices to follow
 panel state
Date: Thu, 27 Jul 2023 10:16:30 -0700
Message-ID: <20230727101636.v4.3.Icd5f96342d2242051c754364f4bee13ef2b986d4@changeid>
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
if you don't power cycle it whenever you stop and restart the video
stream (like during a modeset). The touchscreen keeping the power
rails on causes real problems. One proposal in the homestar timeframe
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

A bit of explaining about why this is a roll-your-own API instead of
using something more standard:
1. In standard APIs in Linux, parent devices are automatically powered
   on when a child needs power. Applying that here, it would mean that
   we'd force the panel on any time someone was listening to the
   touchscreen. That, unfortunately, would have broken homestar's need
   (if we hadn't changed the hardware, as per above) where the panel
   absolutely needs to be able to power cycle itself. While one could
   argue that homestar is broken hardware and we shouldn't have the
   API do backflips for it, _officially_ the eDP timing guidelines
   agree with homestar's needs and the panel power sequencing diagrams
   show power going off. It's nice to be able to support this.
2. We could, conceibably, try to add a new flag to device_link causing
   the parent to be in charge of power. Then we could at least use
   normal pm_runtime APIs. This sounds great, except that we run into
   problems with initial probe. As talked about in the later patch
   ("HID: i2c-hid: Support being a panel follower") the initial power
   on of a panel follower might need to do things (like add
   sub-devices) that aren't allowed in a runtime_resume function.

The above complexities explain why this API isn't using common
functions. That being said, this patch is very small and
self-contained, so if someone was later able to adapt it to using more
common APIs while solving the above issues then that could happen in
the future.

[1] https://lore.kernel.org/r/20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- Add is_panel_follower() as a convenience for clients.

Changes in v2:
- Add even more text to the commit message.
- A few comment cleanups.

 drivers/gpu/drm/drm_panel.c | 173 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     |  80 +++++++++++++++++
 2 files changed, 249 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 4e1c4e42575b..e814020bbcd3 100644
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
 
@@ -342,6 +372,141 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
+/**
+ * drm_is_panel_follower() - Check if the device is a panel follower
+ * @dev: The 'struct device' to check
+ *
+ * This checks to see if a device needs to be power sequenced together with
+ * a panel using the panel follower API.
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: true if we should be power sequenced with a panel; false otherwise.
+ */
+bool drm_is_panel_follower(struct device *dev)
+{
+	/*
+	 * The "panel" property is actually a phandle, but for simplicity we
+	 * don't bother trying to parse it here. We just need to know if the
+	 * property is there.
+	 */
+	return of_property_read_bool(dev->of_node, "panel");
+}
+EXPORT_SYMBOL(drm_is_panel_follower);
+
+/**
+ * drm_panel_add_follower() - Register something to follow panel state.
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
+ * Return: 0 or an error code. Note that -ENODEV means that we detected that
+ *         follower_dev is not actually following a panel. The caller may
+ *         choose to ignore this return value if following a panel is optional.
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
+ * Undo drm_panel_add_follower(). This includes calling the follower's
+ * unprepare function if we're removed from a panel that's currently prepared.
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
index c6cf75909389..5ac67eeb0860 100644
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
@@ -246,6 +301,31 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
 }
 #endif
 
+#if defined(CONFIG_DRM_PANEL)
+bool drm_is_panel_follower(struct device *dev);
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower);
+void drm_panel_remove_follower(struct drm_panel_follower *follower);
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower);
+#else
+static inline bool drm_is_panel_follower(struct device *dev)
+{
+	return false;
+}
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
2.41.0.487.g6d72f3e995-goog

