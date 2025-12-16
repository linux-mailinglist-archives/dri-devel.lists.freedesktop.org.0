Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45991CC4C3A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 18:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51C610E7EC;
	Tue, 16 Dec 2025 17:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uYmhz63h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0EF10E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 17:59:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2849C4E41C34;
 Tue, 16 Dec 2025 17:59:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECA186071C;
 Tue, 16 Dec 2025 17:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C03FD119A97D5; Tue, 16 Dec 2025 18:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765907969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NPqr5fYrnS8CLbVsYlAAOMPINrx1k7wIo/fj4ildkQw=;
 b=uYmhz63hDysFTP2ZdC5B7bg5N5SyGTrUKhFkZpvYpwMAj2KPZvqH7tPbMLpSBqlEph7Ra3
 t+StPoRWnNDnUtDKMk9XaatE/J3/+rP3sLJ9eKYNRCyGrRW+Ds1ssvVFyxHLDpO0ZUeqX+
 zuXWK/DQ7dmGRjlN1+Jvaq1whtQlK2IT0y9ef5cxY+lpapJQeZq3gWW8UWDgkbHafDTHsI
 jSej3zPzP9+WmEUnthexDvX5wwJdziYiZU6E1z/mkzdKn2+mUrguy7GwCJgrBWd0QrfsGv
 kY4WBP3U/lAdTSCwICo4P+clwcUJbyh85mSJsbhuC0hixYH7PC7jO31C3/B3jg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:35 +0100
Subject: [PATCH v3 02/22] drm/bridge: deprecate of_drm_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-2-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
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

of_drm_find_bridge() does not increment the returned bridge
refcount. of_drm_find_and_get_bridge() is to be used as a replacement.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename

Changes in v2:
- expand comment to mention why this function is dangerous and what users
  should do about refcounting
---
 drivers/gpu/drm/drm_bridge.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0dbc8b59c3be..f612d486cad0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -361,7 +361,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * @bridge: bridge control structure
  *
  * Add the given bridge to the global list of bridges, where they can be
- * found by users via of_drm_find_bridge().
+ * found by users via of_drm_find_and_get_bridge().
  *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
@@ -422,9 +422,9 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  * @bridge: bridge control structure
  *
  * Remove the given bridge from the global list of registered bridges, so
- * it won't be found by users via of_drm_find_bridge(), and add it to the
- * lingering bridge list, to keep track of it until its allocated memory is
- * eventually freed.
+ * it won't be found by users via of_drm_find_and_get_bridge(), and add it
+ * to the lingering bridge list, to keep track of it until its allocated
+ * memory is eventually freed.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
@@ -1510,6 +1510,20 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  *
  * @np: device node
  *
+ * This function is deprecated. Convert to of_drm_find_and_get_bridge()
+ * instead for proper refcounting.
+ *
+ * The bridge returned by this function is not refcounted. This is
+ * dangerous because the bridge might be deallocated even before the caller
+ * has a chance to use it. To use this function you have to do one of:
+ * - get a reference with drm_bridge_get() as soon as possible to
+ *   minimize the race window, and then drm_bridge_put() when no longer
+ *   using the pointer
+ * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
+ *   be the correct practice before dynamic bridge lifetime was introduced
+ * - again, convert to of_drm_find_and_get_bridge(), which is the only safe
+ *   thing to do
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */

-- 
2.52.0

