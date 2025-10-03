Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F56BB6753
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B36410E328;
	Fri,  3 Oct 2025 10:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="upwAZc38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A43610E091
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:39:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AF14F4E40E90;
 Fri,  3 Oct 2025 10:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 84F6760683;
 Fri,  3 Oct 2025 10:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12F32102F1C67; 
 Fri,  3 Oct 2025 12:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759487980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Qfu3JgcIsjrYY7+XbEdTvSNI3rVgt39kSDML/1Ac/9c=;
 b=upwAZc38H/sjoI9c8mcboj6oeXPAJsQPew3TzYvjqR+/+DCQJwSLAKqGKNyNWl756zzr49
 szwqN8H2FHqMLIev5WxWCl6dT+Wwz6ciHofzvk1iB8weZj+lBuM0NmH+ws2oFdnYk/j7BN
 HzNerP9hTrCEbPd7JD5cpY7FUpMnRL358Z9SYCmjyZg+wK7ZYh2vvFzrRbpLplUIbSpFur
 TAAQfT9x6VmEUUTX4ZESiiqEW1o3inCegiUwVczkpuU1YdHUfhC6fkp64ocqe4fpPb87iX
 PAp5jgCBjTqcovr1HSJPLjoOFNCjjSdXH33jTGxuDYlJRKsGCSGugzpZotDUxg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 12:39:23 +0200
Subject: [PATCH v2 1/7] drm/encoder: add mutex to protect the bridge chain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-1-78bf61580a06@bootlin.com>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
In-Reply-To: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

The per-encoder bridge chain is currently assumed to be static once it is
fully initialized. Work is in progress to add hot-pluggable bridges,
breaking that assumption.

With bridge removal, the encoder chain can change without notice, removing
tail bridges. This can be problematic while iterating over the chain.

Add a mutex to be taken whenever looping or changing the encoder chain.

Also add two APIs to lock/unlock the mutex without the need to manipulate
internal struct drm_encoder fields.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- Added documentation to new APIs
---
 drivers/gpu/drm/drm_encoder.c |  2 ++
 include/drm/drm_encoder.h     | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 8f2bc6a28482229fd0b030a1958f87753ad7885f..3261f142baea30c516499d23dbf8d0acf5952cd6 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -129,6 +129,7 @@ static int __drm_encoder_init(struct drm_device *dev,
 	}
 
 	INIT_LIST_HEAD(&encoder->bridge_chain);
+	mutex_init(&encoder->bridge_chain_mutex);
 	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
 	encoder->index = dev->mode_config.num_encoder++;
 
@@ -202,6 +203,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 	kfree(encoder->name);
 	list_del(&encoder->head);
 	dev->mode_config.num_encoder--;
+	mutex_destroy(&encoder->bridge_chain_mutex);
 
 	memset(encoder, 0, sizeof(*encoder));
 }
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 977a9381c8ba943b4d3e021635ea14856df8a17d..449281c37e39f67a0037603762f347f5086df983 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -25,6 +25,7 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+#include <linux/mutex.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_mode_object.h>
@@ -189,6 +190,9 @@ struct drm_encoder {
 	 */
 	struct list_head bridge_chain;
 
+	/** @bridge_chain_mutex: protect bridge_chain from changes while iterating */
+	struct mutex bridge_chain_mutex;
+
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
 
@@ -319,6 +323,41 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 	return mo ? obj_to_encoder(mo) : NULL;
 }
 
+/**
+ * drm_encoder_chain_lock - lock the encoder bridge chain
+ * @encoder: encoder whose bridge chain must be locked
+ *
+ * Locks the mutex protecting the bridge chain from concurrent access.
+ * To be called by code modifying ot iterating over the bridge chain to
+ * prevent the list from changing while iterating over it.
+ * Call drm_encoder_chain_unlock() when done to unlock the mutex.
+ *
+ * Returns:
+ * Pointer to @encoder. Useful to lock the chain and then operate on the
+ * in the same statement, e.g.:
+ * list_first_entry_or_null(&drm_encoder_chain_lock(encoder)->bridge_chain)
+ */
+static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_encoder *encoder)
+{
+	if (!WARN_ON_ONCE(!encoder))
+		mutex_lock(&encoder->bridge_chain_mutex);
+
+	return encoder;
+}
+
+/**
+ * drm_encoder_chain_unlock - unlock the encoder bridge chain
+ * @encoder: encoder whose bridge chain must be unlocked
+ *
+ * Unlocks the mutex protecting the bridge chain from concurrent access,
+ * matching drm_encoder_chain_lock().
+ */
+static inline void drm_encoder_chain_unlock(struct drm_encoder *encoder)
+{
+	if (!WARN_ON_ONCE(!encoder))
+		mutex_unlock(&encoder->bridge_chain_mutex);
+}
+
 void drm_encoder_cleanup(struct drm_encoder *encoder);
 
 /**

-- 
2.51.0

