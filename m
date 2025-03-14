Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78270A60EED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1947210E9B1;
	Fri, 14 Mar 2025 10:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NjwGvzAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD710E985
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:31:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD3F0432F7;
 Fri, 14 Mar 2025 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741948299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfRPWuvb7XwDn1wjwYTv1b67JZJwwNQzIu9o3d0A1bw=;
 b=NjwGvzADe5ggxDIFTBrgYQSMg+wxXKvEAfso47jw3wTlz0BfgWFG6K0ve6as9JXKYFEtQJ
 6W3a/aNFQC5D9TfrOkTqW8J0XaHoGx/Bd7U8q9qXwwoDc0+4EheOmLd8OkpdBWRGLLkKa3
 GMvuYQSuJf+C8D3ZsZfJmt35QrAuAeaEp6CeqzR+sac5L1yvYMC7gzSPui5xAi6NmXpIcE
 RwHKofDTKqIMzqrYi232lm36Gv9YGJIC172UFe7xBEPic5ysWwcUyQjdTNVP7hyn1SgqD4
 lNphdQ+L78eMB6igxh+Uz1yyA78aHT9Zt+wlpawYQFhMnsRLneLD36bJ1RRSbA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 14 Mar 2025 11:31:15 +0100
Subject: [PATCH v7 02/11] drm/bridge: add support for refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehjvghrn
 hgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

DRM bridges are currently considered as a fixed element of a DRM card, and
thus their lifetime is assumed to extend for as long as the card
exists. New use cases, such as hot-pluggable hardware with video bridges,
require DRM bridges to be added to and removed from a DRM card without
tearing the card down. This is possible for connectors already (used by DP
MST), it is now needed for DRM bridges as well.

As a first preliminary step, make bridges reference-counted to allow a
struct drm_bridge (along with the private driver structure embedding it) to
stay allocated even after the driver has been removed, until the last
reference is put.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v7:
 - export drm_bridge_put_void
 - struct drm_bridge: use container pointer instead of container_offset
 - remove drm_bridge_is_refcounted()
 - remove all DRM_DEBUG()s
 - drm_bridge_get/put: accept NULL pointer and return the bridge pointer to
   allow pass-through calls
 - extract to separate patches:
    - the addition of drm_bridge_alloc
    - the addition of drm_bridge_get/put() to drm_bridge_add/remove()
    - the addition of drm_bridge_get/put() to drm_bridge_attach/detach()
 - fix a typo, slightly improve kerneldoc

Changes in v6:
 - use drm_warn, not WARN_ON (Jani Nikula)
 - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
   drmm_encoder_alloc)
 - Remove .destroy func: deallocation is done via the struct offset
   computed by the devm_drm_bridge_alloc() macro
 - use fixed free callback, as the same callback is used in all cases
   anyway (remove free_cb, add bool is_refcounted)
 - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
   to a list)
 - make some DRM_DEBUG() strings more informative

This patch was added in v5.
---
 drivers/gpu/drm/drm_bridge.c | 33 +++++++++++++++-
 include/drm/drm_bridge.h     | 91 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 96df717b2caeb41d45346ded576eaeb2806fd051..2ba0dac9bfc2dfd709d5e2457d69067c7324972c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -199,23 +199,54 @@
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
+void __drm_bridge_free(struct kref *kref)
+{
+	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
+
+	kfree(bridge->container);
+}
+EXPORT_SYMBOL(__drm_bridge_free);
+
+/**
+ * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void pointer
+ *
+ * @data: pointer to @struct drm_bridge, cast to a void pointer
+ *
+ * Wrapper of drm_bridge_put() to be used when a function taking a void
+ * pointer is needed, for example as a devm action.
+ */
+void drm_bridge_put_void(void *data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)data;
+
+	drm_bridge_put(bridge);
+}
+EXPORT_SYMBOL(drm_bridge_put_void);
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs)
 {
 	void *container;
 	struct drm_bridge *bridge;
+	int err;
 
 	if (!funcs) {
 		dev_warn(dev, "Missing funcs pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	container = kzalloc(size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	bridge->container = container;
 	bridge->funcs = funcs;
+	kref_init(&bridge->refcount);
+
+	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
+	if (err)
+		return ERR_PTR(err);
 
 	return container;
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index dae463b30542d586a595b67f7bdf5a5e898e9572..5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -840,6 +840,17 @@ struct drm_bridge {
 	const struct drm_bridge_timings *timings;
 	/** @funcs: control functions */
 	const struct drm_bridge_funcs *funcs;
+
+	/**
+	 * @container: Pointer to the private driver struct embedding this
+	 * @struct drm_bridge.
+	 */
+	void *container;
+	/**
+	 * @refcount: reference count of users referencing this bridge.
+	 */
+	struct kref refcount;
+
 	/** @driver_private: pointer to the bridge driver's internal context */
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
@@ -941,6 +952,82 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+void __drm_bridge_free(struct kref *kref);
+
+/**
+ * drm_bridge_get - Acquire a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function increments the bridge's refcount.
+ *
+ * Returns:
+ * Pointer to @bridge.
+ */
+static inline struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
+{
+	if (!bridge)
+		return bridge;
+
+	kref_get(&bridge->refcount);
+
+	return bridge;
+}
+
+/**
+ * drm_bridge_put - Release a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function decrements the bridge's reference count and frees the
+ * object if the reference count drops to zero.
+ *
+ * See also drm_bridge_put_and_clear() which is more handy in many cases.
+ *
+ * Returns:
+ * Pointer to @bridge.
+ */
+static inline struct drm_bridge *drm_bridge_put(struct drm_bridge *bridge)
+{
+	if (!bridge)
+		return bridge;
+
+	kref_put(&bridge->refcount, __drm_bridge_free);
+
+	return bridge;
+}
+
+void drm_bridge_put_void(void *data);
+
+/**
+ * drm_bridge_put_and_clear - Given a bridge pointer, clear the pointer
+ *                            then put the bridge
+ *
+ * @bridge_pp: pointer to pointer to a struct drm_bridge
+ *
+ * Helper to put a DRM bridge (whose pointer is passed), but only after
+ * setting its pointer to NULL. Useful for drivers having struct drm_bridge
+ * pointers they need to dispose of, without leaving a use-after-free
+ * window where the pointed bridge might have been freed while still
+ * holding a pointer to it.
+ *
+ * For example a driver having this private struct::
+ *
+ *     struct my_bridge {
+ *         struct drm_bridge *remote_bridge;
+ *         ...
+ *     };
+ *
+ * can dispose of remote_bridge using::
+ *
+ *     drm_bridge_put_and_clear(&my_bridge->remote_bridge);
+ */
+static inline void drm_bridge_put_and_clear(struct drm_bridge **bridge_pp)
+{
+	struct drm_bridge *bridge = *bridge_pp;
+
+	*bridge_pp = NULL;
+	drm_bridge_put(bridge);
+}
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs);
 
@@ -951,6 +1038,10 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
  * @member: the name of the &drm_bridge within @type
  * @funcs: callbacks for this bridge
  *
+ * The returned refcount is initialized to 1. This reference will be
+ * automatically dropped via devm (by calling drm_bridge_put()) when @dev
+ * is removed.
+ *
  * Returns:
  * Pointer to new bridge, or ERR_PTR on failure.
  */

-- 
2.48.1

