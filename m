Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997A1553DD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 09:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CB26FBC5;
	Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976E6EA0A;
 Fri,  7 Feb 2020 08:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80922B05C;
 Fri,  7 Feb 2020 08:41:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 1/6] drm: Move initialization of encoder into an internal
 function
Date: Fri,  7 Feb 2020 09:41:30 +0100
Message-Id: <20200207084135.4524-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207084135.4524-1-tzimmermann@suse.de>
References: <20200207084135.4524-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving encoder init code into an internal function, so it can be reused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_encoder.c | 78 +++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index e555281f43d4..ffe691a1bf34 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -91,6 +91,47 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	}
 }
 
+static int __drm_encoder_init(struct drm_device *dev,
+			      struct drm_encoder *encoder,
+			      const struct drm_encoder_funcs *funcs,
+			      int encoder_type, char *name)
+{
+	int ret;
+
+	/* encoder index is used with 32-bit bitmasks */
+	if (WARN_ON(dev->mode_config.num_encoder >= 32))
+		return -EINVAL;
+
+	ret = drm_mode_object_add(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
+	if (ret)
+		return ret;
+
+	encoder->dev = dev;
+	encoder->encoder_type = encoder_type;
+	encoder->funcs = funcs;
+	if (name) {
+		encoder->name = name;
+	} else {
+		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
+					  drm_encoder_enum_list[encoder_type].name,
+					  encoder->base.id);
+		if (!encoder->name) {
+			ret = -ENOMEM;
+			goto out_put;
+		}
+	}
+
+	INIT_LIST_HEAD(&encoder->bridge_chain);
+	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
+	encoder->index = dev->mode_config.num_encoder++;
+
+out_put:
+	if (ret)
+		drm_mode_object_unregister(dev, &encoder->base);
+
+	return ret;
+}
+
 /**
  * drm_encoder_init - Init a preallocated encoder
  * @dev: drm device
@@ -111,43 +152,28 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...)
 {
+	char *namestr = NULL;
 	int ret;
 
-	/* encoder index is used with 32bit bitmasks */
-	if (WARN_ON(dev->mode_config.num_encoder >= 32))
-		return -EINVAL;
-
-	ret = drm_mode_object_add(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
-	if (ret)
-		return ret;
-
-	encoder->dev = dev;
-	encoder->encoder_type = encoder_type;
-	encoder->funcs = funcs;
 	if (name) {
 		va_list ap;
 
 		va_start(ap, name);
-		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
+		namestr = kvasprintf(GFP_KERNEL, name, ap);
 		va_end(ap);
-	} else {
-		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
-					  drm_encoder_enum_list[encoder_type].name,
-					  encoder->base.id);
-	}
-	if (!encoder->name) {
-		ret = -ENOMEM;
-		goto out_put;
+		if (!namestr)
+			return -ENOMEM;
 	}
 
-	INIT_LIST_HEAD(&encoder->bridge_chain);
-	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
-	encoder->index = dev->mode_config.num_encoder++;
-
-out_put:
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, namestr);
 	if (ret)
-		drm_mode_object_unregister(dev, &encoder->base);
+		goto err_kfree;
+
+	return 0;
 
+err_kfree:
+	if (name)
+		kfree(namestr);
 	return ret;
 }
 EXPORT_SYMBOL(drm_encoder_init);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
