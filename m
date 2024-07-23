Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D4939D60
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F7110E501;
	Tue, 23 Jul 2024 09:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oe0IzYVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244210E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721726189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4Aiz0OWR2v2XuVbT9aw5lELLi/JCZElHyeF6wJfdk8=;
 b=Oe0IzYVHlon0JrqaHNJNER9bWSr1JmimuEBb3d1HmgGzfzCMAxRUul+Zw7jzCRIN+ZHhg+
 XB4e0hCyV2uC8JaM9BbsNWcXJfaRXZ7oF0Hl7bReRPKA99jPZdrqlQgyMFmhMxTxyRfFnD
 2cmbTF/X2oCMmYPRsnGkOrMLKqujhAg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-OM3RpahIOgmi4UW5j1LUPQ-1; Tue,
 23 Jul 2024 05:16:24 -0400
X-MC-Unique: OM3RpahIOgmi4UW5j1LUPQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D38601955D4C; Tue, 23 Jul 2024 09:16:22 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.165])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5CF21195605A; Tue, 23 Jul 2024 09:16:19 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 3/5] drm/panic: Move drm_panic_register prototype to
 drm_crtc_internal.h
Date: Tue, 23 Jul 2024 11:11:32 +0200
Message-ID: <20240723091553.286844-4-jfalempe@redhat.com>
In-Reply-To: <20240723091553.286844-1-jfalempe@redhat.com>
References: <20240723091553.286844-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_panic_[un]register() are only used by the core drm, and are not
intended to be called by other drm drivers, so move their prototypes
to drm_crtc_internal.h.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  4 ++++
 include/drm/drm_panic.h             | 12 ------------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 4314274c5e40..3090f8ce92fe 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -320,8 +320,12 @@ drm_edid_load_firmware(struct drm_connector *connector)
 /* drm_panic.c */
 #ifdef CONFIG_DRM_PANIC
 bool drm_panic_is_enabled(struct drm_device *dev);
+void drm_panic_register(struct drm_device *dev);
+void drm_panic_unregister(struct drm_device *dev);
 #else
 static inline bool drm_panic_is_enabled(struct drm_device *dev) { return false; }
+static inline void drm_panic_register(struct drm_device *dev) {}
+static inline void drm_panic_unregister(struct drm_device *dev) {}
 #endif
 
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 73bb3f3d9ed9..a4bd3681920d 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -146,16 +146,4 @@ struct drm_scanout_buffer {
 #define drm_panic_unlock(dev, flags) \
 	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
 
-#ifdef CONFIG_DRM_PANIC
-
-void drm_panic_register(struct drm_device *dev);
-void drm_panic_unregister(struct drm_device *dev);
-
-#else
-
-static inline void drm_panic_register(struct drm_device *dev) {}
-static inline void drm_panic_unregister(struct drm_device *dev) {}
-
-#endif
-
 #endif /* __DRM_PANIC_H__ */
-- 
2.45.2

