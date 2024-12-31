Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F49FEED1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE8B10E644;
	Tue, 31 Dec 2024 10:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YVHsRKu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F5B10E648
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:40:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C459FF809;
 Tue, 31 Dec 2024 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735641626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5spdtsuPp+u1VNzPSbXTjsRuHOgdZOi+G4vXrmIfO38=;
 b=YVHsRKu1ZmAMCJF6LBakIfnJ0Zun+wi3LyZY2btFOmM7UcqeVYJxBNuTZn7UQb2mDIOpaP
 VJWlUxzMrSk+b7swGgczM6rbm0aAzhaKaanocbIUpgMbjEzBADifFNrvg2LPh7RbsxX6p5
 ZJ2MlWslDXYZUUROvaI1BjtgPfk95A2z0OCLni7rq9WF+aRr/uXwgiFVpg6+tUn0dPMw4l
 U2O0ddK1gUoLSNUq43u1emYf/cCG/SVHhg2jjabcahPdDqT3JzyvEh1itFeY7Pd7qN6Beq
 8sgFFw0MrWiSluebylysYjkHfYOXhIkeBk0KZ1/MVfUCMnwU0sCVVo18EnOt4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:39:58 +0100
Subject: [PATCH v5 04/10] drm/bridge: add documentation of refcounted bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Document in detail the new refcounted bridges as well as the "legacy" way.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 Documentation/gpu/drm-kms-helpers.rst |   6 ++
 drivers/gpu/drm/drm_bridge.c          | 122 ++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8cf2f041af4704875910ce8228ae04615d0f21bd..ca2cfef2101988933e1464fe146997c1a661a117 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Bridge lifecycle
+----------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge lifecycle
+
 Display Driver Integration
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926..e9f138aa5b3270b4e3a1a56dc8d4b7e5f993c929 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -60,6 +60,128 @@
  * encoder chain.
  */
 
+/**
+ * DOC: bridge lifecycle
+ *
+ * Allocation, initializion and teardown of a bridge can be implemented in
+ * one of two ways: *refcounted* mode and *legacy* mode.
+ *
+ * In **refcounted** mode:
+ *
+ * - each &struct drm_bridge is reference counted since its instantiation
+ * - any code taking a pointer to a bridge has get and put APIs to refcount
+ *   it and so ensure the bridge won't be deallocated while using it
+ * - deallocation is done when the last put happens and the refcount drops
+ *   to zero
+ * - the driver instantiating the bridge also holds a reference, but the
+ *   allocated struct can survive it
+ *
+ * A bridge using refcounted mode is called a *refcounted bridge*.
+ *
+ * In **legacy** mode the &struct drm_bridge lifetime is tied to the device
+ * instantiating it: it is allocated on probe and freed on removal. Any
+ * other kernel entities holding a pointer to the bridge could incur in
+ * use-after-free in case the bridge is deallocated at runtime.
+ *
+ * Legacy mode used to be the only one until refcounted bridges were
+ * introduced, hance the name. It is still fine in case the bridges are a
+ * fixed part of the pipeline, i.e. if the bridges are removed only when
+ * tearing down the entire card. Refcounted bridges support both that case
+ * and the case of more dynamic hardware with bridges that can be removed
+ * at runtime without tearing down the entire card.
+ *
+ * Usage of refcounted bridges happens in two sides: the driver
+ * implementing the bridge and the code using the bridge.
+ *
+ * For *drivers implemeting the bridge*, in both refcounted and legacy
+ * modes the common and expected pattern is that the driver declares a
+ * driver-specific struct embedding a &struct drm_bridge. E.g.::
+ *
+ *   struct my_bridge {
+ *       ...
+ *       struct drm_bridge bridge;
+ *       ...
+ *   };
+ *
+ * When using refcounted mode, the driver should allocate ``struct
+ * my_bridge`` using regular allocation (as opposed to ``devm_`` or
+ * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
+ * transfer lifecycle management to the DRM bridge core, and implement a
+ * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
+ * example::
+ *
+ *     static void my_bridge_destroy(struct drm_bridge *bridge)
+ *     {
+ *         kfree(container_of(bridge, struct my_bridge, bridge));
+ *     }
+ *
+ *     static const struct drm_bridge_funcs my_bridge_funcs = {
+ *         .destroy = my_bridge_destroy,
+ *         ...
+ *     };
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct my_bridge *mybr;
+ *         int err;
+ *
+ *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
+ *         if (!mybr)
+ *             return -ENOMEM;
+ *
+ *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
+ *         if (err)
+ *             return err;
+ *
+ *         ...
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // ... NO kfree here!
+ *     }
+ *
+ * In legacy mode, the driver can either use ``devm_`` allocation or
+ * equivalently free ``struct my_bridge`` in their remove function::
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct my_bridge *mybr;
+ *
+ *         mybr = devm_kzalloc(dev, sizeof(*mybr), GFP_KERNEL);
+ *         if (!mybr)
+ *             return -ENOMEM;
+ *
+ *         ...
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // kfree(mybr) if not using devm_*() for allocation
+ *     }
+ *
+ * The *code using the bridge* is all the code taking a &struct drm_bridge
+ * pointer, including other bridges, encoders and the DRM core. As the
+ * bridge could be removed at any time, such code can incur in
+ * use-after-free. To void that, it has to call drm_bridge_get() when
+ * taking a pointer and drm_bridge_put() after it has done using it. This
+ * will extend the allocation lifetime of the bridge struct until the last
+ * reference has been put, potentially after the bridge device has been
+ * removed from the kernel.
+ *
+ * Calling drm_bridge_get() and drm_bridge_put() on a bridge that is not
+ * refcounted does nothing, so code using these two APIs will work both on
+ * refcounted bridges and non-refcounted ones.
+ */
+
 /**
  * DOC:	display driver integration
  *

-- 
2.34.1

