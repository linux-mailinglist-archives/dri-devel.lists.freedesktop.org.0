Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477009F3648
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E510410E6F8;
	Mon, 16 Dec 2024 16:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TfXKhGw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537B610E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:41:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB879E0003;
 Mon, 16 Dec 2024 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734367271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J90J1NyXaKoXccZe2X72ycchhXTtGFZ2PH6GpQkBJsQ=;
 b=TfXKhGw1Xu1kMTIPHWCUs8aLwUWzuTKGvJ4j91Qfd6r0hlmwy9jqbDGUa3nK9YjKpnJnwP
 cK53r5KYTSI9yx8tH/zjuFZhBWgUTpbaJX8x06dQO4fSlDokEEimr5TcZHmb5krbdJ60hL
 FMAd7Z8uS7G/ROKDCzU156r1kC6R8C231T1QzABHhYsQA1nX8PrulSaGWMogyY1wzibSjU
 bsqZCDq+mHrv4t5A5dfbxYfHsK4DAh9lOKJ4L7A9IPeve9fYNtC6WAmruHJSg/a8cPNZhk
 8lp0QQaqPShbNAC1lTe4zRpFQxtsqtF9rE8Ajky47TvAs297yqgUvcnumi+Jgw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 16 Dec 2024 17:40:50 +0100
Subject: [PATCH RESEND v3 3/4] drm/mode_object: add
 drm_mode_object_read_refcount()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-drm-small-improvements-v3-3-78bbc95ac776@bootlin.com>
References: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
In-Reply-To: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
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

Add a wrapper to kref_read() just like the ones already in place for
kref_get() and kref_put(). This will be used for sanity checks on object
lifetime.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v3:

 * use conventions for 'Returns' doc syntax
 * ditch DRM_DEBUG() and as a consequence rework and simplify the entire
   function
 * fix function name in kerneldoc
---
 drivers/gpu/drm/drm_mode_object.c | 17 +++++++++++++++++
 include/drm/drm_mode_object.h     |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index df4cc0e8e263d5887a799cf1a61d998234be7158..b9a16aceb926782eb033434eb6967ce9fd2e94f7 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -217,6 +217,23 @@ void drm_mode_object_get(struct drm_mode_object *obj)
 }
 EXPORT_SYMBOL(drm_mode_object_get);
 
+/**
+ * drm_mode_object_read_refcount - read the refcount for a mode object
+ * @obj: DRM mode object
+ *
+ * Returns:
+ * The current object refcount if it is a refcounted modeset object, or 0
+ * for any other object.
+ */
+unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj)
+{
+	if (obj->free_cb)
+		return kref_read(&obj->refcount);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_object_read_refcount);
+
 /**
  * drm_object_attach_property - attach a property to a modeset object
  * @obj: drm modeset object
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c68edbd126d04d51221f50aa2b4166475543b59f..3d2c739e703888bf4520c61594d480f128d50e56 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -123,6 +123,7 @@ struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 					     uint32_t id, uint32_t type);
 void drm_mode_object_get(struct drm_mode_object *obj);
 void drm_mode_object_put(struct drm_mode_object *obj);
+unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj);
 
 int drm_object_property_set_value(struct drm_mode_object *obj,
 				  struct drm_property *property,

-- 
2.34.1

