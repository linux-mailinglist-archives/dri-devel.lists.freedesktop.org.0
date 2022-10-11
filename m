Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2264E5FB897
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA7110E8A5;
	Tue, 11 Oct 2022 16:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14510E836
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665507121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaCOI9UDHObilr/FfRutdJn/+dgOSqkCuyMJ4ENmaOs=;
 b=HOiO+GCmCiH/+4A/hOwWiX7Hh6NqOKmUtALSb+0Zjh+AAfU2r7cBh9HHC+GcPbZn1ZTrN/
 t25SYIJtf5OGToy/DI9J4TKfKWxrS0yUw5+mr6wdc0GzQbjx74UHi4U726C9stFIu3Tqa6
 D2f5wuzBWJ3L+VeNgp7W7aOK845xtfY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-ZQ-rw7qfOaKpndDicOPtoQ-1; Tue, 11 Oct 2022 12:51:58 -0400
X-MC-Unique: ZQ-rw7qfOaKpndDicOPtoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so8705597wmq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 09:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaCOI9UDHObilr/FfRutdJn/+dgOSqkCuyMJ4ENmaOs=;
 b=fGzfKptlR0Ma83WUMDAHH2xrZXXrkzO+s0nTvPgqlzMiyXrvtRu8X2544ZsUblNkDE
 oU/oJznXJpX56RYsK+amLSCovBYwOFLTrPsrf6lirB0/vy+o1qcnRsltKBAx2HoKq+mJ
 4GOUzGVMPDKFjDLsSF1baGX29BrOEv5YmDnI3C2N0q0ox1ScnDuqNOyYy+cWa3jg+WCX
 U24tPp4R+1QaNniL/mV7HRTtA11/ZF5V7kQLKxasoAhxgwPeDVzac3eOTPCOkSoH1iyN
 +S6nI/nV0O10gAB9e7aclxHk68xsgJSlNGiX/9VLOYZgKrZ+Nxon1DfUIHyG0MaWPY5v
 VZsA==
X-Gm-Message-State: ACrzQf1oUF73ydU9vOemut4qe+KV5dctMqysT9+g/MbFPhkB5MpQCngh
 3MipkFinTMmtJ+5vbTi7qCS6e04hExMryZBM1PBnL9/FdtJ51i+efozBRENA+8hjllL55xta3tF
 cQItiWBM+aFiKaENplAuZt+ZhfopQ
X-Received: by 2002:a5d:588e:0:b0:22e:5601:f6d with SMTP id
 n14-20020a5d588e000000b0022e56010f6dmr15751892wrf.207.1665507117032; 
 Tue, 11 Oct 2022 09:51:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PmArjh64UHPJejX+ohWlZL4spASdLrxYeMDilCiSbo8QeLZylP8y7c2Z1G8l0Ownm8AjByA==
X-Received: by 2002:a5d:588e:0:b0:22e:5601:f6d with SMTP id
 n14-20020a5d588e000000b0022e56010f6dmr15751873wrf.207.1665507116611; 
 Tue, 11 Oct 2022 09:51:56 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c6c76b43a1sm2025629wmq.13.2022.10.11.09.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 09:51:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/crtc-helper: Add a drm_crtc_helper_atomic_check()
 helper
Date: Tue, 11 Oct 2022 18:51:36 +0200
Message-Id: <20221011165136.469750-5-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011165136.469750-1-javierm@redhat.com>
References: <20221011165136.469750-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provides a default CRTC state check handler for CRTCs that only have one
primary plane attached.

There are some drivers that duplicate this logic in their helpers, such as
simpledrm and ssd130x. Factor out this common code into a CRTC helper and
make drivers use it.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- Reference drm_plane_helper_atomic_check() from drm_crtc_atomic_check()
  kernel doc comments and viceversa (Thomas Zimmermann).

 drivers/gpu/drm/drm_crtc_helper.c  | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane_helper.c |  4 +++-
 drivers/gpu/drm/solomon/ssd130x.c  | 14 ++------------
 drivers/gpu/drm/tiny/simpledrm.c   | 14 ++------------
 include/drm/drm_crtc_helper.h      |  2 ++
 5 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 457448cc60f7..1f0a270ac984 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -421,6 +421,32 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_helper_set_mode);
 
+/**
+ * drm_crtc_helper_atomic_check() - Helper to check CRTC atomic-state
+ * @crtc: CRTC to check
+ * @state: atomic state object
+ *
+ * Provides a default CRTC-state check handler for CRTCs that only have
+ * one primary plane attached to it.
+ *
+ * This is often the case for the CRTC of simple framebuffers. See also
+ * drm_plane_helper_atomic_check() for the respective plane-state check
+ * helper function.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	if (!new_crtc_state->enable)
+		return 0;
+
+	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
+}
+EXPORT_SYMBOL(drm_crtc_helper_atomic_check);
+
 static void
 drm_crtc_helper_disable(struct drm_crtc *crtc)
 {
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 865bd999b187..ba6a9136a065 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -298,7 +298,9 @@ EXPORT_SYMBOL(drm_plane_helper_destroy);
  * scale and positioning are not expected to change since the plane is always
  * a fullscreen scanout buffer.
  *
- * This is often the case for the primary plane of simple framebuffers.
+ * This is often the case for the primary plane of simple framebuffers. See
+ * also drm_crtc_helper_atomic_check() for the respective CRTC-state check
+ * helper function.
  *
  * RETURNS:
  * Zero on success, or an errno code otherwise.
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0d4ab65233db..f2795f90ea69 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
@@ -645,17 +646,6 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
-static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					    struct drm_atomic_state *new_state)
-{
-	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-
-	if (!new_crtc_state->enable)
-		return 0;
-
-	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-}
-
 /*
  * The CRTC is always enabled. Screen updates are performed by
  * the primary plane's atomic_update function. Disabling clears
@@ -663,7 +653,7 @@ static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
  */
 static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
 	.mode_valid = ssd130x_crtc_helper_mode_valid,
-	.atomic_check = ssd130x_crtc_helper_atomic_check,
+	.atomic_check = drm_crtc_helper_atomic_check,
 };
 
 static void ssd130x_crtc_reset(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f03f17f62a56..cbb100753154 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -11,6 +11,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -545,17 +546,6 @@ static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *cr
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sdev->mode);
 }
 
-static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					      struct drm_atomic_state *new_state)
-{
-	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-
-	if (!new_crtc_state->enable)
-		return 0;
-
-	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-}
-
 /*
  * The CRTC is always enabled. Screen updates are performed by
  * the primary plane's atomic_update function. Disabling clears
@@ -563,7 +553,7 @@ static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
  */
 static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
 	.mode_valid = simpledrm_crtc_helper_mode_valid,
-	.atomic_check = simpledrm_crtc_helper_atomic_check,
+	.atomic_check = drm_crtc_helper_atomic_check,
 };
 
 static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
index a6d520d5b6ca..1840db247f69 100644
--- a/include/drm/drm_crtc_helper.h
+++ b/include/drm/drm_crtc_helper.h
@@ -50,6 +50,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 			      struct drm_display_mode *mode,
 			      int x, int y,
 			      struct drm_framebuffer *old_fb);
+int drm_crtc_helper_atomic_check(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state);
 bool drm_helper_crtc_in_use(struct drm_crtc *crtc);
 bool drm_helper_encoder_in_use(struct drm_encoder *encoder);
 
-- 
2.37.3

