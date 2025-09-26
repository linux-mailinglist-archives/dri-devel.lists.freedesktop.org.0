Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AEBA485C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2BA10EA93;
	Fri, 26 Sep 2025 16:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="njWF0wze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5802710EA8F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:00:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3F0D21A0FF6;
 Fri, 26 Sep 2025 16:00:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 14B54606B5;
 Fri, 26 Sep 2025 16:00:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49ED1102F18CE; 
 Fri, 26 Sep 2025 18:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758902444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X30CyVkM0xw62wI5zGHzXspi5omvJPEO7hzdaoEvpdo=;
 b=njWF0wzeKCcuSvmGn/BqLNq6+65Z5Fg3CDWZZPv8jiDY3Khk0TqqaezjGuTcbwUDc061Ve
 QY5AptHP4+G2rd+5sUSeGbwUedEBexBkuk8xqOy74bt+8IWvBBUY2Ue5QR6oUiycRbDISv
 iOvHej2j9Or2mnGczlrh0e/7LbClOJZwfVBK8pSWBBy5DrqzPFz7X8C4XTF5IyLSsOD8vn
 4Ma0xYt37JpeJws0RlID+MEgck554mFs3FZadOMwsJ1+zUOgp+U33QuygO1jkI2GlORmJ3
 7jhQJwaCjCEwLr+NmXXvvN8NUOO+b3B7yDomOMS3YnSWgohvrqft6M4MO9Tf1g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 17:59:42 +0200
Subject: [PATCH 1/7] drm/encoder: add mutex to protect the bridge chain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-1-23b62c47356a@bootlin.com>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
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
 drivers/gpu/drm/drm_encoder.c |  2 ++
 include/drm/drm_encoder.h     | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

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
index 977a9381c8ba943b4d3e021635ea14856df8a17d..6c962de640a345bfbb18308c83076628547c9ab9 100644
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
 
@@ -319,6 +323,20 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 	return mo ? obj_to_encoder(mo) : NULL;
 }
 
+static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_encoder *encoder)
+{
+	if (!WARN_ON_ONCE(!encoder))
+		mutex_lock(&encoder->bridge_chain_mutex);
+
+	return encoder;
+}
+
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

