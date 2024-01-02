Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B08821ACB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 12:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815110E178;
	Tue,  2 Jan 2024 11:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643D410E178
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704194368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qoJsvoq0DDDLxrsVvT9v5nXIRGXNDW8rEpKhzHpyXgI=;
 b=KeVS/0zKOmBWtQXRyzl1F1fKxrbyQT4tQ8JZf2e4oCDXmGSzzdq48y6dfc73WkCy0nfBc3
 EjIuPn1dz+XYl64yyCj83+39vihJcLPzPJXzX8fVWOSoaVWxlKKl04TaB2BjscTqFVjyKW
 YpjXzS9wl9zuzNRRfY2m1tWgmhFEi4E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-iLBggPodNc-t4v3F41LeUA-1; Tue, 02 Jan 2024 06:19:27 -0500
X-MC-Unique: iLBggPodNc-t4v3F41LeUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40d85858180so15066435e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 03:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704194366; x=1704799166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qoJsvoq0DDDLxrsVvT9v5nXIRGXNDW8rEpKhzHpyXgI=;
 b=wd8y0G1QwEr70V7lMf+FrBJSJjGgBxfZKoo70y6aDkXXXMofCDCkASWFyDI95cOJXm
 iB0nfQ406yfwg01qBNREWox3ar9Q0Q9fLI1glkveQ535UnO9Ag46Flg93ixZdXn4AZJ0
 x5F+0bGjr/l3LVEZ+auNvjimNbILbkOMlUlrcXqg6oKaMbFr5ROLW+wNv0pe3gpFkr+h
 Sn9bCcqBriqC6k6voIIn9HuoLJ8lnftfvwLq2LlXDBt73x21ENaZ9rgiQZ8y0YZY2pQr
 cVbH5HtMMTmQl/XW+PVyxsPThvz7YR5x7Eoz3S+gAe+sqBa1JStYq2oC3W1j64PR7atb
 ow7g==
X-Gm-Message-State: AOJu0Yz/Dz8OXV2XhBa3xjWuJp0bEdk1iBJqQwCVsySSkhzq/ruAQxsI
 +miVJZKmsWUlAAZIKdjv2680BcFCf+GDLAcbJJo07wsCAmN3PA0xy9ixTnwd7xspMlXT0bi3y+G
 bmAWohMvl2nAjIrwNhlFjG2lr5B7A3fOZ5Bzp
X-Received: by 2002:a05:600c:21c3:b0:40c:32bf:20f with SMTP id
 x3-20020a05600c21c300b0040c32bf020fmr8670401wmj.147.1704194366136; 
 Tue, 02 Jan 2024 03:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdjCeS38gsGIEYkKTsmvgLDiYT1Gj00fEhKA72AEg+8H/QbXlRJtmItinsd+orroi24KHMnw==
X-Received: by 2002:a05:600c:21c3:b0:40c:32bf:20f with SMTP id
 x3-20020a05600c21c300b0040c32bf020fmr8670393wmj.147.1704194365857; 
 Tue, 02 Jan 2024 03:19:25 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b0040d725a9967sm16395607wmo.11.2024.01.02.03.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 03:19:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Move drm_set_preferred_mode() helper from drm_edid to
 drm_modes
Date: Tue,  2 Jan 2024 12:18:59 +0100
Message-ID: <20240102111921.3057255-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The helper is generic and doesn't use the opaque EDID type struct drm_edid
and is also used by drivers that only support non-probeable displays, such
as fixed panels.

These drivers add a list of modes using drm_mode_probed_add() and then set
a preferred mode using the drm_set_preferred_mode() helper.

It seems more logical to have the helper definition in drm_modes.o instead
of drm_edid.o, since the former contains modes helper while the latter has
helpers to manage the EDID information.

Since both drm_edid.o and drm_modes.o object files are built-in the drm.o
object, there are no functional changes. But besides being a more logical
place for this helper, it could also allow to eventually make drm_edid.o
optional and not included in drm.o if only fixed panels must be supported
in a given system.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_edid.c  | 23 +----------------------
 drivers/gpu/drm/drm_modes.c | 22 ++++++++++++++++++++++
 include/drm/drm_edid.h      |  2 --
 include/drm/drm_modes.h     |  2 ++
 4 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index cb4031d5dcbb..48dd2a0a0395 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -43,6 +43,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -6989,28 +6990,6 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_add_modes_noedid);
 
-/**
- * drm_set_preferred_mode - Sets the preferred mode of a connector
- * @connector: connector whose mode list should be processed
- * @hpref: horizontal resolution of preferred mode
- * @vpref: vertical resolution of preferred mode
- *
- * Marks a mode as preferred if it matches the resolution specified by @hpref
- * and @vpref.
- */
-void drm_set_preferred_mode(struct drm_connector *connector,
-			   int hpref, int vpref)
-{
-	struct drm_display_mode *mode;
-
-	list_for_each_entry(mode, &connector->probed_modes, head) {
-		if (mode->hdisplay == hpref &&
-		    mode->vdisplay == vpref)
-			mode->type |= DRM_MODE_TYPE_PREFERRED;
-	}
-}
-EXPORT_SYMBOL(drm_set_preferred_mode);
-
 static bool is_hdmi2_sink(const struct drm_connector *connector)
 {
 	/*
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..01aa44e87534 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2754,3 +2754,25 @@ bool drm_mode_is_420(const struct drm_display_info *display,
 		drm_mode_is_420_also(display, mode);
 }
 EXPORT_SYMBOL(drm_mode_is_420);
+
+/**
+ * drm_set_preferred_mode - Sets the preferred mode of a connector
+ * @connector: connector whose mode list should be processed
+ * @hpref: horizontal resolution of preferred mode
+ * @vpref: vertical resolution of preferred mode
+ *
+ * Marks a mode as preferred if it matches the resolution specified by @hpref
+ * and @vpref.
+ */
+void drm_set_preferred_mode(struct drm_connector *connector,
+			   int hpref, int vpref)
+{
+	struct drm_display_mode *mode;
+
+	list_for_each_entry(mode, &connector->probed_modes, head) {
+		if (mode->hdisplay == hpref &&
+		    mode->vdisplay == vpref)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+	}
+}
+EXPORT_SYMBOL(drm_set_preferred_mode);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 54cc6f04a708..5bd6b6eb6c57 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -426,8 +426,6 @@ enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
 			 int hdisplay, int vdisplay);
-void drm_set_preferred_mode(struct drm_connector *connector,
-			    int hpref, int vpref);
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index c613f0abe9dc..b9bb92e4b029 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -467,6 +467,8 @@ bool drm_mode_is_420_also(const struct drm_display_info *display,
 			  const struct drm_display_mode *mode);
 bool drm_mode_is_420(const struct drm_display_info *display,
 		     const struct drm_display_mode *mode);
+void drm_set_preferred_mode(struct drm_connector *connector,
+			    int hpref, int vpref);
 
 struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
 					    enum drm_connector_tv_mode mode,
-- 
2.43.0

