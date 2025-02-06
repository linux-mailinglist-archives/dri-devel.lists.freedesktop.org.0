Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10CA2B020
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B0410E90C;
	Thu,  6 Feb 2025 18:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y+b0DGvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8110E90C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AA68442CD;
 Thu,  6 Feb 2025 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhgEt87E7UIGCThpFWjahsK9oH1YxL7v6qfXLrIRhII=;
 b=Y+b0DGvBc4nAYsoODrTUxn9MyMTDEc0v4mnKcGvD3TkfbOxASNOfpU9EATuQwbJysCzcPu
 9Q04YED3EIuj8i1aShXqd2h9pO+2K+eVSQs2AtzASC7k5rYSf/qSyce/l5WPdlO15jIzkM
 RDOJiE1D2d8bviu68z0pQJmH7LtOd/OuIPz0JigjbZKVQ18paUeu5fj7nYq9RCiXGsY3bD
 n6dH2aD5S0OW3O5q4LQErN9axJvxN9VZzdUdaIdKbe7E+1fT1LRo5Wv3VvCBecwpnYcaon
 zBq3AoP8uTK7vVQda9ELLzvG5yX1f4iahvi+xavgd19r2WF+dXeVots3+ZjiZQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:33 +0100
Subject: [PATCH v6 18/26] drm/bridge: add documentation of refcounted bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-18-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
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
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Document in detail the new refcounted bridges as well as the "legacy"
bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6:
 - update to the new devm_drm_bridge_alloc() API
 - rewrite and improve various sentences for clarity
 - fix typos (Randy Dunlap)

This patch was added in v5.
---
 Documentation/gpu/drm-kms-helpers.rst |   6 ++
 drivers/gpu/drm/drm_bridge.c          | 118 ++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 79c8d3e63f7e06136440ed38972697b5f057d5d1..027c6ab65aa5c3848c4afab6fbc8ab93f9a285ba 100644
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
index 92ce40adfaa59a278a972ac862bebee06970ff83..fc44a5d227a89a12b5c3299a29776cfddb36ce27 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -62,6 +62,124 @@
  * encoder chain.
  */
 
+/**
+ * DOC: bridge lifecycle
+ *
+ * Allocation, initialization and teardown of a bridge can be implemented
+ * in one of two ways: *refcounted* mode and *legacy* mode.
+ *
+ * In **refcounted** mode:
+ *
+ * - each &struct drm_bridge is reference counted since its allocation
+ * - any code taking a pointer to a bridge has get and put APIs to refcount
+ *   it and so ensure the bridge won't be deallocated while there is still
+ *   a reference to it
+ * - the driver implementing the bridge also holds a reference, but the
+ *   allocated struct can survive it
+ * - deallocation is done when the last put happens, dropping the refcount
+ *   to zero
+ *
+ * A bridge using refcounted mode is called a *refcounted bridge*.
+ *
+ * In **legacy** mode the &struct drm_bridge lifetime is tied to the device
+ * instantiating it: it is allocated on probe and freed on removal. Any
+ * other kernel code holding a pointer to the bridge could incur in
+ * use-after-free in case the bridge is deallocated at runtime.
+ *
+ * Legacy mode used to be the only one until refcounted bridges were
+ * introduced, hence the name. It is still fine in case the bridges are a
+ * fixed part of the pipeline, i.e. if the bridges are removed only when
+ * tearing down the entire card. Refcounted bridges support both that case
+ * and the case of more dynamic hardware with bridges that can be removed
+ * at runtime without tearing down the entire card.
+ *
+ * Usage of refcounted bridges happens in two sides: the bridge *provider*
+ * and the bridge *consumers*. The bridge provider is the driver
+ * implementing the bridge. The bridge consumers are all parts of the
+ * kernel taking a &struct drm_bridge pointer, including other bridges,
+ * encoders and the DRM core.
+ *
+ * For bridge **providers**, in both refcounted and legacy modes the common
+ * and expected pattern is that the bridge driver declares a
+ * driver-specific struct embedding a &struct drm_bridge. E.g.::
+ *
+ *   struct my_bridge {
+ *       ...
+ *       struct drm_bridge bridge;
+ *       ...
+ *   };
+ *
+ * When using refcounted mode, the driver should allocate and initialize
+ * ``struct my_bridge`` using devm_drm_bridge_alloc(), as in this example::
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct device *dev = ...;
+ *         struct my_bridge *mybr;
+ *
+ *         mybr = devm_drm_bridge_alloc(dev, struct my_bridge, bridge, &my_bridge_funcs);
+ *         if (IS_ERR(mybr))
+ *             return PTR_ERR(mybr);
+ *
+ *         // Get resources, initialize my_bridge members...
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // Free resources
+ *         // ... NO kfree here!
+ *     }
+ *
+ * In legacy mode, the driver can either use ``devm_`` allocation or
+ * equivalently free ``struct my_bridge`` in their remove function::
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct device *dev = ...;
+ *         struct my_bridge *mybr;
+ *
+ *         mybr = devm_kzalloc(dev, sizeof(*mybr), GFP_KERNEL);
+ *         if (!mybr)
+ *             return -ENOMEM;
+ *
+ *         // Get resources, initialize my_bridge members...
+ *         mybr->funcs = &my_bridge_funcs;
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // Free resources
+ *         // kfree(mybr) if not using devm_*() for allocation
+ *     }
+ *
+ * Bridge **consumers** need to handle the case of a bridge being removed
+ * while they have a pointer to it. As this can happen at any time, such
+ * code can incur in use-after-free. To avoid that, consumers have to call
+ * drm_bridge_get() when taking a pointer and drm_bridge_put() after they
+ * are done using it. This will extend the allocation lifetime of the
+ * bridge struct until the last reference has been put, potentially a long
+ * time after the bridge device has been removed from the kernel.
+ *
+ * Functions that return a pointer to a bridge, such as
+ * of_drm_find_bridge(), internally call drm_bridge_get() on the bridge
+ * they are about to return, so in this case the consumers do not have to
+ * do it.
+ *
+ * Calling drm_bridge_get() and drm_bridge_put() on a bridge that is not
+ * refcounted does nothing, so code using these two APIs will work both on
+ * refcounted bridges and legacy bridges.
+ */
+
 /**
  * DOC:	display driver integration
  *

-- 
2.34.1

