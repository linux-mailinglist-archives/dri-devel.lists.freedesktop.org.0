Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867A5224CA
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE45E10E69F;
	Tue, 10 May 2022 19:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FFA10E505
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 19:30:01 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 7so15418296pga.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hX2NewzlW7IU1O5s8q9Vhm6e+LNQcR0Drq+oVtmujQU=;
 b=cj32nqZSsJRGZh1wN1Z0n+mCsrWiCEunfbj6m1gbZ+O3gP/NW4fhcWh972e3YkO6pS
 syBNPR/Wbq3utSCiOclZrKRHvGbfxe39vkPbHnQVat1S+YZA7ciMzLkVIa7ewTNm79pN
 4epvL3QwK+82kBQPHssVGnKxl/e0JxpVziSA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hX2NewzlW7IU1O5s8q9Vhm6e+LNQcR0Drq+oVtmujQU=;
 b=myu17eCOz2j/Ixpio4kFi8yVoOeCREJX6IfbYqIbc84wG1dfILVfEkFxUWfifO/SU6
 oJ6ruHicRcMzbBPrBSVN1XBVFQIioU6OOg2ME7FvsjsYVSxfqBMxO/KmXVSv7lkFHmZU
 PDupjNRYGvutye+XKmlJhv+UYE2Pzy7E7upQRzbtNyLuTqCP6UBIwCvFhEdVcwi5Alqo
 H4vfTd2sNjSVfcDF6eQ1A61oeuPW8s8rqGjq9qMpCGcHDM05nvB+NqXU0owS8u6qoDyV
 Yiefb+ZVHspT1Ji9gIoEyG6R6u0epGv1iyjCCR8ehGrt8gbsIgSq2KtWUEnISGxiRHaq
 lAZA==
X-Gm-Message-State: AOAM533anAOnqjGJs89HnOdFpON1w8h0DqApsEWUVS0ItOl6BuRSWmdI
 IrFqu8TODpsDKuLR2RV7/J2aMbvyTsPlLrFLUZ8=
X-Google-Smtp-Source: ABdhPJz8IHQupfUCCUpYD9mi5YoUF5MFYXxWAhPrYc7w6E3mBHGt1ig81P6c4QGtDV7+7YE6qx0CJw==
X-Received: by 2002:a63:90c7:0:b0:3c6:2bba:a5c0 with SMTP id
 a190-20020a6390c7000000b003c62bbaa5c0mr18409517pge.3.1652211000500; 
 Tue, 10 May 2022 12:30:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 12:30:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/dp: Add callbacks to make using DP AUX bus
 properly easier
Date: Tue, 10 May 2022 12:29:42 -0700
Message-Id: <20220510122726.v3.2.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in this patch in the kerneldoc of
of_dp_aux_populate_ep_device() and also in the past in commit
a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel to
its own sub-dev"), it can be difficult for eDP controller drivers to
know when the panel has finished probing when they're using
of_dp_aux_populate_ep_devices().

The ti-sn65dsi86 driver managed to solve this because it was already
broken up into a bunch of sub-drivers. That means we could solve the
problem there by adding a new sub-driver to get the panel. We could
use the traditional -EPROBE_DEFER retry mechansim to handle the case
where the panel hadn't probed yet.

In parade-ps8640 we didn't really solve this. The code just expects
the panel to be ready right away. While reviewing the code originally
I had managed to convince myself it was fine to just expect the panel
right away, but additional testing has shown that not to be the
case. We could fix parade-ps8640 like we did ti-sn65dsi86 but it's
pretty cumbersome (since we're not already broken into multiple
drivers) and requires a bunch of boilerplate code.

After discussion [1] it seems like the best solution for most people
is:
- Accept that there's always at most one device that will probe as a
  result of the DP AUX bus (it may have sub-devices, but there will be
  one device _directly_ probed).
- When that device finishes probing, we can just have a call back.

This patch implements that idea. We'll now take a callback as an
argument to the populate function. To make this easier to land in
pieces, we'll make wrappers for the old functions. The functions with
the new name (which make it clear that we only have one child) will
take the callback and the functions with the old name will temporarily
wrap.

[1] https://lore.kernel.org/r/CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Don't call done_probing() if there are no children; return -ENODEV.
- Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
- Used Dmitry's proposed name: of_dp_aux_populate_bus()

Changes in v2:
- Change to assume exactly one device.
- Have a probe callback instead of an extra sub device.

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 209 +++++++++++++++--------
 include/drm/display/drm_dp_aux_bus.h     |  34 +++-
 2 files changed, 168 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 552f949cff59..f5741b45ca07 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -3,10 +3,10 @@
  * Copyright 2021 Google Inc.
  *
  * The DP AUX bus is used for devices that are connected over a DisplayPort
- * AUX bus. The devices on the far side of the bus are referred to as
- * endpoints in this code.
+ * AUX bus. The device on the far side of the bus is referred to as an
+ * endpoint in this code.
  *
- * Commonly there is only one device connected to the DP AUX bus: a panel.
+ * There is only one device connected to the DP AUX bus: an eDP panel.
  * Though historically panels (even DP panels) have been modeled as simple
  * platform devices, putting them under the DP AUX bus allows the panel driver
  * to perform transactions on that bus.
@@ -22,6 +22,11 @@
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 
+struct dp_aux_ep_device_with_data {
+	struct dp_aux_ep_device aux_ep;
+	int (*done_probing)(struct drm_dp_aux *aux);
+};
+
 /**
  * dp_aux_ep_match() - The match function for the dp_aux_bus.
  * @dev: The device to match.
@@ -48,6 +53,8 @@ static int dp_aux_ep_probe(struct device *dev)
 {
 	struct dp_aux_ep_driver *aux_ep_drv = to_dp_aux_ep_drv(dev->driver);
 	struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(dev);
+	struct dp_aux_ep_device_with_data *aux_ep_with_data =
+		container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
 	int ret;
 
 	ret = dev_pm_domain_attach(dev, true);
@@ -56,7 +63,32 @@ static int dp_aux_ep_probe(struct device *dev)
 
 	ret = aux_ep_drv->probe(aux_ep);
 	if (ret)
-		dev_pm_domain_detach(dev, true);
+		goto err_attached;
+
+	if (aux_ep_with_data->done_probing) {
+		ret = aux_ep_with_data->done_probing(aux_ep->aux);
+		if (ret) {
+			/*
+			 * The done_probing() callback should not return
+			 * -EPROBE_DEFER to us. If it does, we treat it as an
+			 * error. Passing it on as-is would cause the _panel_
+			 * to defer.
+			 */
+			if (ret == -EPROBE_DEFER) {
+				dev_err(dev,
+					"DP AUX done_probing() can't defer\n");
+				ret = -EINVAL;
+			}
+			goto err_probed;
+		}
+	}
+
+	return 0;
+err_probed:
+	if (aux_ep_drv->remove)
+		aux_ep_drv->remove(aux_ep);
+err_attached:
+	dev_pm_domain_detach(dev, true);
 
 	return ret;
 }
@@ -122,7 +154,11 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
  */
 static void dp_aux_ep_dev_release(struct device *dev)
 {
-	kfree(to_dp_aux_ep_dev(dev));
+	struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(dev);
+	struct dp_aux_ep_device_with_data *aux_ep_with_data =
+		container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
+
+	kfree(aux_ep_with_data);
 }
 
 static struct device_type dp_aux_device_type_type = {
@@ -136,12 +172,14 @@ static struct device_type dp_aux_device_type_type = {
  * @dev: The device to destroy.
  * @data: Not used
  *
- * This is just used as a callback by of_dp_aux_depopulate_ep_devices() and
+ * This is just used as a callback by of_dp_aux_depopulate_bus() and
  * is called for _all_ of the child devices of the device providing the AUX bus.
  * We'll only act on those that are of type "dp_aux_bus_type".
  *
- * This function is effectively an inverse of what's in the loop
- * in of_dp_aux_populate_ep_devices().
+ * This function is effectively an inverse of what's in
+ * of_dp_aux_populate_bus(). NOTE: since we only populate one child
+ * then it's expected that only one device will match all the "if" tests in
+ * this function and get to the device_unregister().
  *
  * Return: 0 if no error or negative error code.
  */
@@ -164,123 +202,150 @@ static int of_dp_aux_ep_destroy(struct device *dev, void *data)
 }
 
 /**
- * of_dp_aux_depopulate_ep_devices() - Undo of_dp_aux_populate_ep_devices
- * @aux: The AUX channel whose devices we want to depopulate
+ * of_dp_aux_depopulate_bus() - Undo of_dp_aux_populate_bus
+ * @aux: The AUX channel whose device we want to depopulate
  *
- * This will destroy all devices that were created
- * by of_dp_aux_populate_ep_devices().
+ * This will destroy the device that was created
+ * by of_dp_aux_populate_bus().
  */
-void of_dp_aux_depopulate_ep_devices(struct drm_dp_aux *aux)
+void of_dp_aux_depopulate_bus(struct drm_dp_aux *aux)
 {
 	device_for_each_child_reverse(aux->dev, NULL, of_dp_aux_ep_destroy);
 }
-EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_devices);
+EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_bus);
 
 /**
- * of_dp_aux_populate_ep_devices() - Populate the endpoint devices on the DP AUX
- * @aux: The AUX channel whose devices we want to populate. It is required that
+ * of_dp_aux_populate_bus() - Populate the endpoint device on the DP AUX
+ * @aux: The AUX channel whose device we want to populate. It is required that
  *       drm_dp_aux_init() has already been called for this AUX channel.
+ * @done_probing: Callback functions to call after EP device finishes probing.
+ *                Will not be called if there are no EP devices and this
+ *                function will return -ENODEV.
  *
- * This will populate all the devices under the "aux-bus" node of the device
- * providing the AUX channel (AKA aux->dev).
+ * This will populate the device (expected to be an eDP panel) under the
+ * "aux-bus" node of the device providing the AUX channel (AKA aux->dev).
  *
  * When this function finishes, it is _possible_ (but not guaranteed) that
- * our sub-devices will have finished probing. It should be noted that if our
- * sub-devices return -EPROBE_DEFER that we will not return any error codes
- * ourselves but our sub-devices will _not_ have actually probed successfully
- * yet. There may be other cases (maybe added in the future?) where sub-devices
- * won't have been probed yet when this function returns, so it's best not to
- * rely on that.
+ * our sub-device will have finished probing. It should be noted that if our
+ * sub-device returns -EPROBE_DEFER or is probing asynchronously for some
+ * reason that we will not return any error codes ourselves but our
+ * sub-device will _not_ have actually probed successfully yet.
+ *
+ * In many cases it's important for the caller of this function to be notified
+ * when our sub device finishes probing. Our sub device is expected to be an
+ * eDP panel and the caller is expected to be an eDP controller. The eDP
+ * controller needs to be able to get a reference to the panel when it finishes
+ * probing. For this reason the caller can pass in a function pointer that
+ * will be called when our sub-device finishes probing.
  *
  * If this function succeeds you should later make sure you call
- * of_dp_aux_depopulate_ep_devices() to undo it, or just use the devm version
+ * of_dp_aux_depopulate_bus() to undo it, or just use the devm version
  * of this function.
  *
- * Return: 0 if no error or negative error code.
+ * Return: 0 if no error or negative error code; returns -ENODEV if there are
+ *         no children. The done_probing() function won't be called in that
+ *         case.
  */
-int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+			   int (*done_probing)(struct drm_dp_aux *aux))
 {
-	struct device_node *bus, *np;
+	struct device_node *bus = NULL, *np = NULL;
 	struct dp_aux_ep_device *aux_ep;
+	struct dp_aux_ep_device_with_data *aux_ep_with_data;
 	int ret;
 
 	/* drm_dp_aux_init() should have been called already; warn if not */
 	WARN_ON_ONCE(!aux->ddc.algo);
 
 	if (!aux->dev->of_node)
-		return 0;
-
+		return -ENODEV;
 	bus = of_get_child_by_name(aux->dev->of_node, "aux-bus");
 	if (!bus)
-		return 0;
+		return -ENODEV;
 
-	for_each_available_child_of_node(bus, np) {
-		if (of_node_test_and_set_flag(np, OF_POPULATED))
-			continue;
+	np = of_get_next_available_child(bus, NULL);
+	of_node_put(bus);
+	if (!np)
+		return -ENODEV;
 
-		aux_ep = kzalloc(sizeof(*aux_ep), GFP_KERNEL);
-		if (!aux_ep)
-			continue;
-		aux_ep->aux = aux;
+	if (of_node_test_and_set_flag(np, OF_POPULATED)) {
+		dev_err(aux->dev, "DP AUX EP device already populated\n");
+		ret = -EINVAL;
+		goto err_did_get_np;
+	}
 
-		aux_ep->dev.parent = aux->dev;
-		aux_ep->dev.bus = &dp_aux_bus_type;
-		aux_ep->dev.type = &dp_aux_device_type_type;
-		aux_ep->dev.of_node = of_node_get(np);
-		dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
+	aux_ep_with_data = kzalloc(sizeof(*aux_ep_with_data), GFP_KERNEL);
+	if (!aux_ep_with_data) {
+		ret = -ENOMEM;
+		goto err_did_set_populated;
+	}
 
-		ret = device_register(&aux_ep->dev);
-		if (ret) {
-			dev_err(aux->dev, "Failed to create AUX EP for %pOF: %d\n", np, ret);
-			of_node_clear_flag(np, OF_POPULATED);
-			of_node_put(np);
+	aux_ep_with_data->done_probing = done_probing;
 
-			/*
-			 * As per docs of device_register(), call this instead
-			 * of kfree() directly for error cases.
-			 */
-			put_device(&aux_ep->dev);
+	aux_ep = &aux_ep_with_data->aux_ep;
+	aux_ep->aux = aux;
+	aux_ep->dev.parent = aux->dev;
+	aux_ep->dev.bus = &dp_aux_bus_type;
+	aux_ep->dev.type = &dp_aux_device_type_type;
+	aux_ep->dev.of_node = of_node_get(np);
+	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
 
-			/*
-			 * Following in the footsteps of of_i2c_register_devices(),
-			 * we won't fail the whole function here--we'll just
-			 * continue registering any other devices we find.
-			 */
-		}
-	}
+	ret = device_register(&aux_ep->dev);
+	if (ret) {
+		dev_err(aux->dev, "Failed to create AUX EP for %pOF: %d\n", np, ret);
 
-	of_node_put(bus);
+		/*
+		 * As per docs of device_register(), call this instead
+		 * of kfree() directly for error cases.
+		 */
+		put_device(&aux_ep->dev);
+
+		goto err_did_set_populated;
+	}
 
 	return 0;
+
+err_did_set_populated:
+	of_node_clear_flag(np, OF_POPULATED);
+
+err_did_get_np:
+	of_node_put(np);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
+EXPORT_SYMBOL_GPL(of_dp_aux_populate_bus);
 
-static void of_dp_aux_depopulate_ep_devices_void(void *data)
+static void of_dp_aux_depopulate_bus_void(void *data)
 {
-	of_dp_aux_depopulate_ep_devices(data);
+	of_dp_aux_depopulate_bus(data);
 }
 
 /**
- * devm_of_dp_aux_populate_ep_devices() - devm wrapper for of_dp_aux_populate_ep_devices()
- * @aux: The AUX channel whose devices we want to populate
+ * devm_of_dp_aux_populate_bus() - devm wrapper for of_dp_aux_populate_bus()
+ * @aux: The AUX channel whose device we want to populate
+ * @done_probing: Callback functions to call after EP device finishes probing.
+ *                Will not be called if there are no EP devices and this
+ *                function will return -ENODEV.
  *
  * Handles freeing w/ devm on the device "aux->dev".
  *
- * Return: 0 if no error or negative error code.
+ * Return: 0 if no error or negative error code; returns -ENODEV if there are
+ *         no children. The done_probing() function won't be called in that
+ *         case.
  */
-int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+				int (*done_probing)(struct drm_dp_aux *aux))
 {
 	int ret;
 
-	ret = of_dp_aux_populate_ep_devices(aux);
+	ret = of_dp_aux_populate_bus(aux, done_probing);
 	if (ret)
 		return ret;
 
 	return devm_add_action_or_reset(aux->dev,
-					of_dp_aux_depopulate_ep_devices_void,
-					aux);
+					of_dp_aux_depopulate_bus_void, aux);
 }
-EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_ep_devices);
+EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_bus);
 
 int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *drv, struct module *owner)
 {
diff --git a/include/drm/display/drm_dp_aux_bus.h b/include/drm/display/drm_dp_aux_bus.h
index 4f19b20b1dd6..8a0a486383c5 100644
--- a/include/drm/display/drm_dp_aux_bus.h
+++ b/include/drm/display/drm_dp_aux_bus.h
@@ -44,9 +44,37 @@ static inline struct dp_aux_ep_driver *to_dp_aux_ep_drv(struct device_driver *dr
 	return container_of(drv, struct dp_aux_ep_driver, driver);
 }
 
-int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux);
-void of_dp_aux_depopulate_ep_devices(struct drm_dp_aux *aux);
-int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux);
+int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+			   int (*done_probing)(struct drm_dp_aux *aux));
+void of_dp_aux_depopulate_bus(struct drm_dp_aux *aux);
+int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+				int (*done_probing)(struct drm_dp_aux *aux));
+
+/* Deprecated versions of the above functions. To be removed when no callers. */
+static inline int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+{
+	int ret;
+
+	ret = of_dp_aux_populate_bus(aux, NULL);
+
+	/* New API returns -ENODEV for no child case; adapt to old assumption */
+	return (ret != -ENODEV) ? ret : 0;
+}
+
+static inline int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+{
+	int ret;
+
+	ret = devm_of_dp_aux_populate_bus(aux, NULL);
+
+	/* New API returns -ENODEV for no child case; adapt to old assumption */
+	return (ret != -ENODEV) ? ret : 0;
+}
+
+static inline void of_dp_aux_depopulate_ep_devices(struct drm_dp_aux *aux)
+{
+	of_dp_aux_depopulate_bus(aux);
+}
 
 #define dp_aux_dp_driver_register(aux_ep_drv) \
 	__dp_aux_dp_driver_register(aux_ep_drv, THIS_MODULE)
-- 
2.36.0.550.gb090851708-goog

