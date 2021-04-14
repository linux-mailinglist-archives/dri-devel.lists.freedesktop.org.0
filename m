Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CB35F071
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF9389AB5;
	Wed, 14 Apr 2021 09:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C768F89ABE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:08:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b136-20020a1c1b8e0000b029012c69da2040so2747379wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqP0gjc1UtzViswayeYBkOIxC7p7CX3JMgXUxI4EqHg=;
 b=Z39Tk6cgvlEBKWP6Pf8Z2uwQ1uIHGiZ+MDCeZrewJYcl6YLP9pBFb6ATh693ldXE6g
 OCfUxipyXvl8JWXHfP1WFNwA9AICHF8Cx+Pg4QXgxnGFiU5mpgtkyfYGVYcCV8KZVbEr
 ZVAjC8rZ2rVZiR3tlbV93PpE8V8X35HEIRjE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqP0gjc1UtzViswayeYBkOIxC7p7CX3JMgXUxI4EqHg=;
 b=hyqIueKM0o8cxiQh/2HFw8CRJRiwpg8XEk7+aoBgCb4R6ipXV7LjjDcKIWnotle+y6
 y4vYVFdIKKDaZDUhsTjwH6BFt958Eq5URZcp4dHC2fawHen1jHotQo0zqFtXJjkjONps
 CyuRyJn+QKUZJ6Mad19WQCZ200R4JkLdLJ8OBb2n/i7m+jeE4q6eD/cUJ1FoKtVX6UoY
 81J8001SAz2/QohJVvwQQz7Y+1ZqveVTrxpMAHA8iqIrVOs14hTGwybFXRVfzWsCkqrm
 cry2x9KTWtZxxq75CVwtJr1srlYekyXTRuQ41RY6iglTFV6nciyJhs/FL65NWHb9NpHL
 0XAQ==
X-Gm-Message-State: AOAM532Q6Y177U3FemOVYH/rUEbQ6ANhQWYfJ6ta66dwK+9xG/MhWPxt
 ifnNyyqqk2ZTZ6uLALDJPtijsMBSl0ahxw==
X-Google-Smtp-Source: ABdhPJxAKcgn4iWmh9nkzPW5Xend/PiBUZhhxoqeRO9taKoFJVUrqETADHv7ktmUZT3JQlzu/mqcVQ==
X-Received: by 2002:a05:600c:3397:: with SMTP id
 o23mr1934817wmp.26.1618391301436; 
 Wed, 14 Apr 2021 02:08:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y15sm6022588wrh.8.2021.04.14.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:08:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
Date: Wed, 14 Apr 2021 11:08:15 +0200
Message-Id: <20210414090815.453744-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's very confusing for userspace to have to deal with inconsistencies
here, and some drivers screwed this up a bit. Most just ommitted the
format list when they meant to say that only linear modifier is
allowed, but some also meant that only implied modifiers are
acceptable (because actually none of the planes registered supported
modifiers).

Now that this is all done consistently across all drivers, document
the rules and enforce it in the drm core.

v2:
- Make the capability a link (Simon)
- Note that all is lost before 5.1.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Cc: Simon Ser <contact@emersion.fr>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_plane.c   | 18 +++++++++++++++++-
 include/drm/drm_mode_config.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 0dd43882fe7c..20c7a1665414 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -128,6 +128,13 @@
  *     pairs supported by this plane. The blob is a struct
  *     drm_format_modifier_blob. Without this property the plane doesn't
  *     support buffers with modifiers. Userspace cannot change this property.
+ *
+ *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS driver
+ *     capability for general modifier support. If this flag is set then every
+ *     plane will have the IN_FORMATS property, even when it only supports
+ *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
+ *     various bugs in this area with inconsistencies between the capability
+ *     flag and per-plane properties.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
@@ -277,8 +284,14 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 			format_modifier_count++;
 	}
 
-	if (format_modifier_count)
+	/* autoset the cap and check for consistency across all planes */
+	if (format_modifier_count) {
+		WARN_ON(!config->allow_fb_modifiers &&
+			!list_empty(&config->plane_list));
 		config->allow_fb_modifiers = true;
+	} else {
+		WARN_ON(config->allow_fb_modifiers);
+	}
 
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
@@ -360,6 +373,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
  * drm_universal_plane_init() to let the DRM managed resource infrastructure
  * take care of cleanup and deallocation.
  *
+ * Drivers supporting modifiers must set @format_modifiers on all their planes,
+ * even those that only support DRM_FORMAT_MOD_LINEAR.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index ab424ddd7665..1ddf7783fdf7 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -909,6 +909,8 @@ struct drm_mode_config {
 	 * @allow_fb_modifiers:
 	 *
 	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
+	 * Note that drivers should not set this directly, it is automatically
+	 * set in drm_universal_plane_init().
 	 *
 	 * IMPORTANT:
 	 *
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
