Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CC4550BA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 23:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2494B6E154;
	Wed, 17 Nov 2021 22:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E66E154
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 22:49:07 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id p17so3563063pgj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jas5Tr1JiB/SoUHal8S3Y4kBEi23oxdNkc4xorlYI00=;
 b=IWTc7bgRvrEcHTa4YD8tGWPNVsvghUJb4RtRMZBp/FEUwaUtRimFwOv9oTM+ZYi+Dy
 bzez/qw64wH0bW216fisndzmwIjeEviz5W/BRKxHTnZN6gwzwM9UtB6tyRZfTDW5GtBp
 fW0gqp3NI3f25xgw4LgLZnVefkzFDq0TbzXYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jas5Tr1JiB/SoUHal8S3Y4kBEi23oxdNkc4xorlYI00=;
 b=yHCUY6vqaqmMUnP0Rdguh/fqlZ9BBgauEMseecAePtNTvHjSgzs+WOb4nPZL/lILAb
 Q5QXLaJiG7dSZJZdZplllisWjnG7yXl6ZaKcRQmCTAruNXR14CTqzwyVT16vIwTretKM
 kmUPLfATYGcmz2DJi+zfX1gaVPy2f633F5ocSji72wD+e+8m+RJulFw/GLDZoARKsoJ0
 UJCTMeGyFTK6NnGW+psdSQR+pI2KwJ1zMtYDVhe7UhMSFomYMqE3Ni1tIWqyuLnGf0Xo
 sJ9a6WMDbdw4PtPWigtCMf7AlnDR9f+2MFWTWmeRyZJayHl5q+XvRz/rtlG6Rkc/GmrB
 qKJA==
X-Gm-Message-State: AOAM532nlvpTSTFDE+014oNqoNkt/v0A1JBRlvTGDJJCoB1NxYYpNg6+
 pn41CVhcOpqM6vLBhhxeSyxQhw==
X-Google-Smtp-Source: ABdhPJztI4eJrdjEiTlm8rUjgfXf5/4Qc114lhcWrXp9mjpk7Yh3dGAXK36pBleEvWp2B+BMVwSwzA==
X-Received: by 2002:a63:5257:: with SMTP id s23mr7781806pgl.473.1637189347245; 
 Wed, 17 Nov 2021 14:49:07 -0800 (PST)
Received: from localhost ([2620:15c:202:201:896b:df38:4eae:c568])
 by smtp.gmail.com with UTF8SMTPSA id ip6sm6676844pjb.42.2021.11.17.14.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 14:49:06 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Date: Wed, 17 Nov 2021 14:48:40 -0800
Message-Id: <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117224841.3442482-1-briannorris@chromium.org>
References: <20211117224841.3442482-1-briannorris@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Norris <briannorris@chromium.org>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A variety of applications have found it useful to listen to
user-initiated input events to make decisions within a DRM driver, given
that input events are often the first sign that we're going to start
doing latency-sensitive activities:

 * Panel self-refresh: software-directed self-refresh (e.g., with
   Rockchip eDP) is especially latency sensitive. In some cases, it can
   take 10s of milliseconds for a panel to exit self-refresh, which can
   be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
   with an input_handler boost, that preemptively exits self-refresh
   whenever there is input activity.

 * GPU drivers: on GPU-accelerated desktop systems, we may need to
   render new frames immediately after user activity. Powering up the
   GPU can take enough time that it is worthwhile to start this process
   as soon as there is input activity. Many Chrome OS systems also ship
   with an input_handler boost that powers up the GPU.

This patch provides a small helper library that abstracts some of the
input-subsystem details around picking which devices to listen to, and
some other boilerplate. This will be used in the next patch to implement
the first bullet: preemptive exit for panel self-refresh.

Bits of this are adapted from code the Android and/or Chrome OS kernels
have been carrying for a while.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - Honor CONFIG_INPUT dependency, via new CONFIG_DRM_INPUT_HELPER
 - Remove void*; users should use container_of()
 - Document the callback context

 drivers/gpu/drm/Kconfig            |   6 ++
 drivers/gpu/drm/Makefile           |   2 +
 drivers/gpu/drm/drm_input_helper.c | 143 +++++++++++++++++++++++++++++
 include/drm/drm_input_helper.h     |  41 +++++++++
 4 files changed, 192 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_input_helper.c
 create mode 100644 include/drm/drm_input_helper.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fb144617055b..381476b10a9d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
 
 	  If in doubt, say "N".
 
+config DRM_INPUT_HELPER
+	def_bool y
+	depends on DRM_KMS_HELPER
+	depends on INPUT
+
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select DRM_INPUT_HELPER if INPUT
 	help
 	  CRTC helpers for KMS drivers.
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1c41156deb5f..9a6494aa45e6 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -56,6 +56,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
 		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
 
+drm_kms_helper-$(CONFIG_DRM_INPUT_HELPER) += drm_input_helper.o
+
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
diff --git a/drivers/gpu/drm/drm_input_helper.c b/drivers/gpu/drm/drm_input_helper.c
new file mode 100644
index 000000000000..470f90865c7c
--- /dev/null
+++ b/drivers/gpu/drm/drm_input_helper.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Google, Inc.
+ */
+#include <linux/input.h>
+#include <linux/slab.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_input_helper.h>
+
+/**
+ * DOC: overview
+ *
+ * This helper library provides a thin wrapper around input handles, so that
+ * DRM drivers can easily perform domain-specific actions in response to user
+ * activity. e.g., if someone is moving a mouse, we're likely to want to
+ * display something soon, and we should exit panel self-refresh.
+ */
+
+static void drm_input_event(struct input_handle *handle, unsigned int type,
+			    unsigned int code, int value)
+{
+	struct drm_input_handler *handler = handle->handler->private;
+
+	handler->callback(handler);
+}
+
+static int drm_input_connect(struct input_handler *handler,
+			     struct input_dev *dev,
+			     const struct input_device_id *id)
+{
+	struct input_handle *handle;
+	int error;
+
+	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = dev;
+	handle->handler = handler;
+	handle->name = "drm-input-helper";
+
+	error = input_register_handle(handle);
+	if (error)
+		goto err2;
+
+	error = input_open_device(handle);
+	if (error)
+		goto err1;
+
+	return 0;
+
+err1:
+	input_unregister_handle(handle);
+err2:
+	kfree(handle);
+	return error;
+}
+
+static void drm_input_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(handle);
+}
+
+static const struct input_device_id drm_input_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_ABSBIT,
+		.evbit = { BIT_MASK(EV_ABS) },
+		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
+			    BIT_MASK(ABS_MT_POSITION_X) |
+			    BIT_MASK(ABS_MT_POSITION_Y) },
+	}, /* multi-touch touchscreen */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_ABS) },
+		.absbit = { [BIT_WORD(ABS_X)] = BIT_MASK(ABS_X) }
+
+	}, /* stylus or joystick device */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) },
+	}, /* pointer (e.g. trackpad, mouse) */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(KEY_ESC)] = BIT_MASK(KEY_ESC) },
+	}, /* keyboard */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = {[BIT_WORD(BTN_JOYSTICK)] = BIT_MASK(BTN_JOYSTICK) },
+	}, /* joysticks not caught by ABS_X above */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(BTN_GAMEPAD)] = BIT_MASK(BTN_GAMEPAD) },
+	}, /* gamepad */
+	{ },
+};
+
+int drm_input_handle_register(struct drm_device *dev,
+			      struct drm_input_handler *handler)
+{
+	int ret;
+
+	if (!handler->callback)
+		return -EINVAL;
+
+	handler->handler.event = drm_input_event;
+	handler->handler.connect = drm_input_connect;
+	handler->handler.disconnect = drm_input_disconnect;
+	handler->handler.name = kasprintf(GFP_KERNEL, "drm-input-helper-%s",
+					  dev_name(dev->dev));
+	if (!handler->handler.name)
+		return -ENOMEM;
+
+	handler->handler.id_table = drm_input_ids;
+	handler->handler.private = handler;
+
+	ret = input_register_handler(&handler->handler);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	kfree(handler->handler.name);
+	return ret;
+}
+EXPORT_SYMBOL(drm_input_handle_register);
+
+void drm_input_handle_unregister(struct drm_input_handler *handler)
+{
+	input_unregister_handler(&handler->handler);
+	kfree(handler->handler.name);
+}
+EXPORT_SYMBOL(drm_input_handle_unregister);
diff --git a/include/drm/drm_input_helper.h b/include/drm/drm_input_helper.h
new file mode 100644
index 000000000000..7904f397b934
--- /dev/null
+++ b/include/drm/drm_input_helper.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Google, Inc.
+ */
+#ifndef __DRM_INPUT_HELPER_H__
+#define __DRM_INPUT_HELPER_H__
+
+#include <linux/input.h>
+
+struct drm_device;
+
+struct drm_input_handler {
+	/*
+	 * Callback to call for input activity. Will be called in an atomic
+	 * context.
+	 */
+	void (*callback)(struct drm_input_handler *handler);
+
+	struct input_handler handler;
+};
+
+#if defined(CONFIG_DRM_INPUT_HELPER)
+
+int drm_input_handle_register(struct drm_device *dev,
+			      struct drm_input_handler *handler);
+void drm_input_handle_unregister(struct drm_input_handler *handler);
+
+#else /* !CONFIG_DRM_INPUT_HELPER */
+
+static inline int drm_input_handle_register(struct drm_device *dev,
+					    struct drm_input_handler *handler)
+{
+	return 0;
+}
+
+static inline void
+drm_input_handle_unregister(struct drm_input_handler *handler) {}
+
+#endif /* CONFIG_DRM_INPUT_HELPER */
+
+#endif /* __DRM_INPUT_HELPER_H__ */
-- 
2.34.0.rc1.387.gb447b232ab-goog

