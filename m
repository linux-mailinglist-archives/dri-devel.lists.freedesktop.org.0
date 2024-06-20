Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451639115A1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 00:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF88710E8A3;
	Thu, 20 Jun 2024 22:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q/GGr8D0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559C710E8A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718922158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tUSKu5yoE2oDKyklqI6xQEXezvoLd1vxGEsotZZ2hLI=;
 b=Q/GGr8D0VPksSaZXyujI+tzFDZBVJ0AjhqExqA/zFgfLid59I9FLXbye5PT6QNeqR0WYY2
 upqp56Isl5YjOKrLqOTz/xVd4TIHrLrg6LTs37rBmFdpFF0vWsDQsBMb4JIRdsWAZPnFX7
 pHiIQPYtZsnIf0XCDTSXIdkgfKqsdck=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221--XIpfEORMn2rko7Dj60UeQ-1; Thu, 20 Jun 2024 18:22:37 -0400
X-MC-Unique: -XIpfEORMn2rko7Dj60UeQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-362c8b9a09cso756771f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718922156; x=1719526956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUSKu5yoE2oDKyklqI6xQEXezvoLd1vxGEsotZZ2hLI=;
 b=MT4yasrCdb21yYeNRMagfBJAMNgMnQ3JLvYk6ilQvuSkS5O5ybaH11yCws+4wk4dHX
 U3+yeOCWkav5fHLAvQhuHSqbN+tCvfgu4P+Clz77ycQT2vQIf3Isy5mp3Y34yzrj9eu1
 ABByTfCvrpre9pKUjeXsWHFbe/AwZkY4JPAzmAxAi4nmD1rsnnseFe4zV2qR0w65f35p
 P5wfxVGLUk+QrDgkiEViw84L/wHg62R6P+xjIRUMWcj+3JBFTn0hpNQuJUw4lTAb7x/C
 3CKnwRsgRXnxYcqMeAbZEKR+1nMAwYAHQUgziRarzkUc+8vBgtWy5EQDPjxOg0hjIRuM
 yiXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKBr9f3UDSLL3iAodoqBz60DJUC2hoCxo/4kCtovRj+8XPd9YET55bFu+g64tRkSM+1kpPETv5ppZG6gmPz0WOKbLqvxLaqrp+2kS2jDQD
X-Gm-Message-State: AOJu0YyqRSCLIaAeTtNdL6PdACQAfLj37YIyvt0tnI5Mh1FS0oKkz0g5
 ymaCmqSt5XUcrSW75Si4nBRawIo6KSH35BEbbOXN3fas/V3ZyceSw/yZA9LMW2Wmj3+mo8Ad2mc
 cTngQWfz9aYgqCafjioz92cOHZqgGTLsC1lGOrmTC6sTXgvUYPpt3C9RtlrGo4JWfpqsQLCaORA
 ==
X-Received: by 2002:a05:6000:1108:b0:360:9c4f:1fe with SMTP id
 ffacd0b85a97d-363193c6376mr4975806f8f.43.1718922155840; 
 Thu, 20 Jun 2024 15:22:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcr7BSscA9WVORAeOG6Ti0XGGWuSfyV7L9iwJsVVVKPQm49qFce+vH/jcri9ZqNmEamqB97w==
X-Received: by 2002:a05:6000:1108:b0:360:9c4f:1fe with SMTP id
 ffacd0b85a97d-363193c6376mr4975790f8f.43.1718922155343; 
 Thu, 20 Jun 2024 15:22:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be818sm41577315e9.15.2024.06.20.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:22:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ssd130x: Add drm_panic support
Date: Fri, 21 Jun 2024 00:22:16 +0200
Message-ID: <20240620222222.155933-1-javierm@redhat.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic infrastructure, which allows to display
a user friendly message on the screen when a Linux kernel panic occurs.

The display controller doesn't scanout the framebuffer, but instead the
pixels are sent to the device using a transport bus. For this reason, a
.panic_flush handler is needed to flush the panic image to the display.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 6f51bcf774e2..0bac97bd39b9 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -32,6 +32,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ssd130x.h"
@@ -1386,6 +1387,63 @@ static void ssd133x_primary_plane_atomic_disable(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
+static int ssd130x_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+							   struct drm_scanout_buffer *sb)
+{
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state;
+
+	if (!plane_state || !plane_state->fb || !plane_state->crtc)
+		return -EINVAL;
+
+	shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+
+	sb->format = plane->state->fb->format;
+	sb->width = plane->state->fb->width;
+	sb->height = plane->state->fb->height;
+	sb->pitch[0] = plane->state->fb->pitches[0];
+	sb->map[0] = shadow_plane_state->data[0];
+
+	return 0;
+}
+
+static void ssd130x_primary_plane_helper_panic_flush(struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state = plane->state;
+	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
+
+	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
+			     ssd130x_plane_state->buffer, ssd130x_crtc_state->data_array,
+			     &shadow_plane_state->fmtcnv_state);
+}
+
+static void ssd132x_primary_plane_helper_panic_flush(struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state = plane->state;
+	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
+
+	ssd132x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
+			     ssd130x_plane_state->buffer, ssd130x_crtc_state->data_array,
+			     &shadow_plane_state->fmtcnv_state);
+}
+
+static void ssd133x_primary_plane_helper_panic_flush(struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
+
+	ssd133x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
+			     ssd130x_crtc_state->data_array, &shadow_plane_state->fmtcnv_state);
+}
+
 /* Called during init to allocate the plane's atomic state. */
 static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 {
@@ -1442,18 +1500,24 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]
 		.atomic_check = ssd130x_primary_plane_atomic_check,
 		.atomic_update = ssd130x_primary_plane_atomic_update,
 		.atomic_disable = ssd130x_primary_plane_atomic_disable,
+		.get_scanout_buffer = ssd130x_primary_plane_helper_get_scanout_buffer,
+		.panic_flush = ssd130x_primary_plane_helper_panic_flush,
 	},
 	[SSD132X_FAMILY] = {
 		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 		.atomic_check = ssd132x_primary_plane_atomic_check,
 		.atomic_update = ssd132x_primary_plane_atomic_update,
 		.atomic_disable = ssd132x_primary_plane_atomic_disable,
+		.get_scanout_buffer = ssd130x_primary_plane_helper_get_scanout_buffer,
+		.panic_flush = ssd132x_primary_plane_helper_panic_flush,
 	},
 	[SSD133X_FAMILY] = {
 		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 		.atomic_check = ssd133x_primary_plane_atomic_check,
 		.atomic_update = ssd133x_primary_plane_atomic_update,
 		.atomic_disable = ssd133x_primary_plane_atomic_disable,
+		.get_scanout_buffer = ssd130x_primary_plane_helper_get_scanout_buffer,
+		.panic_flush = ssd133x_primary_plane_helper_panic_flush,
 	}
 };
 
-- 
2.45.1

