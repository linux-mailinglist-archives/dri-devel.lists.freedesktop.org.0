Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34785A828AE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1573110E926;
	Wed,  9 Apr 2025 14:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oxbfpY5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917AB10E916
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:50:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D19E44282;
 Wed,  9 Apr 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744210247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEmrM0VCU/J7ievAToNUp1p2V609oJSHGiAFe/2zZVo=;
 b=oxbfpY5dUtHCfmiSZUJRPZhC7MQhoIcZO80cG6DM6IRXATITV5jtCO2kv1+TjPCMGu9pnS
 f4CRqoyhzKukNQV1CRr7QmImhUhmOBwVts/npK4qxw2rNiJH9EZM+lt32/a/cHMhKX0PE5
 Fl/tNJhC4u+vNj3hH4++3Rjv5XYOY7keVTNx1+jaJ2CQshTbtKNiNCFYNhjvw4edJ7qwc/
 b6vUx3zgwRGZzyEFzNQHZhvThiX3Fvv5/gYtQzD0aYgtJiT70geAik+CDgHbB6JiAaGGoO
 7bSJzOygCisM5MLX9FXSZHaOFjSIrkvYIrfxFeS+Xth8rZPDknywUGBfsXlyLA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Apr 2025 16:50:34 +0200
Subject: [PATCH v7 1/2] drm/bridge: documentat bridge allocation and lifecycle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-drm-bridge-alloc-doc-test-v7-1-a3ca4b97597f@bootlin.com>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
In-Reply-To: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
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

Document in detail the DRM bridge allocation and refcounting process based
on the recently introduced devm_drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v7:
 - remove mention of "legacy mode", we now support only refcounted
   bridges
 - rename patch title from "drm/bridge: add documentation of refcounted
   bridges", we now support only refcounted bridges

Changes in v6:
 - update to the new devm_drm_bridge_alloc() API
 - rewrite and improve various sentences for clarity
 - fix typos (Randy Dunlap)

This patch was added in v5.
---
 Documentation/gpu/drm-kms-helpers.rst |  6 +++
 drivers/gpu/drm/drm_bridge.c          | 73 +++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 5139705089f200b189876a5a61bf2a935cec433a..393cd0e4cb5af3fe98674e7a96c853ffb2556c97 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Bridge allocation and lifecycle
+-------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge lifecycle
+
 Display Driver Integration
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b4c89ec01998b849018ce031c7cd84614e65e710..b7e1ad761dad52bdb2ec09d425e69ee23a18fd36 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -61,6 +61,79 @@
  * encoder chain.
  */
 
+/**
+ * DOC: bridge lifecycle
+ *
+ * In some use cases such as hot-plugging a DRM bridge device can
+ * physically disappear and reappear at runtime. To handle such cases
+ * without destroying and recreating the entire DRM pipeline, DRM bridge
+ * lifetime is managed using reference counting:
+ *
+ * - each &struct drm_bridge is reference counted since its allocation
+ * - any code taking a pointer to a bridge has APIs to get a reference and
+ *   put it when done, to ensure the memory allocated for the bridge won't
+ *   be deallocated while there is still a reference to it
+ * - the driver implementing the bridge also holds a reference, but the
+ *   allocated struct can survive the driver in case other references still
+ *   exist
+ * - deallocation is done when the last put happens, dropping the refcount
+ *   to zero
+ *
+ * Usage of refcounted bridges happens in two sides: the bridge *provider*
+ * and the bridge *consumers*. The bridge provider is the driver
+ * implementing the bridge. The bridge consumers are all parts of the
+ * kernel taking a &struct drm_bridge pointer, including other bridges,
+ * encoders and the DRM core.
+ *
+ * For bridge **providers**, the bridge driver declares a driver-specific
+ * struct embedding a &struct drm_bridge. E.g.::
+ *
+ *   struct my_bridge {
+ *       ...
+ *       struct drm_bridge bridge;
+ *       ...
+ *   };
+ *
+ * The driver must allocate and initialize ``struct my_bridge`` using
+ * devm_drm_bridge_alloc(), as in this example::
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
+ *         drm_bridge_add(&mybr->bridge);
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove(...)
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // Free resources
+ *         // ... NO kfree here!
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
+ * they are about to return, so users using such functions to get a bridge
+ * pointer only have to take care of calling drm_bridge_put().
+ */
+
 /**
  * DOC:	display driver integration
  *

-- 
2.49.0

