Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FEE5FA260
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF51610E68C;
	Mon, 10 Oct 2022 17:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315410E688
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUvuSJvCKaC4wzR9m0+Cm+eAjqQDPWwMTFGQwXn6Lfs=;
 b=HD7m+IXzAuF9tmuFA811bn+Oj/BfmU1cxYQnlQf1TFiArT1EQC+3rKjQnLSvIHx003oEZt
 Alcu5fr4jeUWoNz/pneGRsxIdAl/SghcdgR9VmOGVjMhomsDsAmkbkfwJ6SteVavqs3RaI
 GEVeNzaeCdQ8ckj+Uw10VyorTSzOa0I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-OS1eKrkONm-7lk_vI-pRhA-1; Mon, 10 Oct 2022 13:02:16 -0400
X-MC-Unique: OS1eKrkONm-7lk_vI-pRhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso3235231wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YUvuSJvCKaC4wzR9m0+Cm+eAjqQDPWwMTFGQwXn6Lfs=;
 b=OALw0qDKVd4pDslZdr8l5qtE52oZljQFdy0IjtQS9xleGQr5fKU7P3NsB87u3EdXOx
 EASqY4tZ5vpEnkoWzRhs9j+M0JIdTc/M1b8IxEw0kqWCJ0RUX7+oovsGmZDLB42+ftAn
 5Vv3GARCvVMWEJMZH5G6L1xVYxGLLJxVjJir3cofqCCsVQ/tHY++om0yGTeet9ixwz4D
 AhF8FAMdsVVAEF8cmU7GObx9+NOZtJ9HvMLa1vINry/obK6OchAwOvsJBHrjlHRS8ggi
 g77QeAtmulx1PnkxK204qmdej8DURdN+Dr++qtqP/JGst/PvVggOMKf7vdv75DncgTT3
 yDlw==
X-Gm-Message-State: ACrzQf2AwHutatHm3zCxYzWQihjgkQa1E6y82v53oRJG6zbBaNvw8GjM
 VkL+mWb8vPS4sJwq3J3Kj1kesnRi93E+G69h1W2eqfDn6plPb/3OyktNyieIIRZbt/1VRjiIxjg
 HQHArUnWAAcFSyYcdQSq5r3TC6YL9
X-Received: by 2002:adf:e64a:0:b0:22c:db6c:5b72 with SMTP id
 b10-20020adfe64a000000b0022cdb6c5b72mr13112295wrn.356.1665421335416; 
 Mon, 10 Oct 2022 10:02:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pVLFc/Zjx0wEtIfD8w+Dsx1klKtaRxVvzYBAj1jOqK5N5Un3lUp2LkATHQInMjHJVBVWfpQ==
X-Received: by 2002:adf:e64a:0:b0:22c:db6c:5b72 with SMTP id
 b10-20020adfe64a000000b0022cdb6c5b72mr13112264wrn.356.1665421335125; 
 Mon, 10 Oct 2022 10:02:15 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056000110500b0022b11a27e39sm9160551wrw.1.2022.10.10.10.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:02:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/crtc-helper: Add a drm_crtc_helper_atomic_check()
 helper
Date: Mon, 10 Oct 2022 19:02:03 +0200
Message-Id: <20221010170203.274949-4-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010170203.274949-1-javierm@redhat.com>
References: <20221010170203.274949-1-javierm@redhat.com>
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
---

 drivers/gpu/drm/drm_crtc_helper.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c | 14 ++------------
 drivers/gpu/drm/tiny/simpledrm.c  | 14 ++------------
 include/drm/drm_crtc_helper.h     |  2 ++
 4 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 457448cc60f7..4ad3abaa98f4 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -421,6 +421,30 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
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
+ * This is often the case for the CRTC of simple framebuffers.
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

