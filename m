Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C50CC1890
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0610E774;
	Tue, 16 Dec 2025 08:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LpQIScbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A6A10E773
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765873554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxZuDficpsxht2y5/1g+Ss0ZtX3L7w3OqfgkU4mgrZA=;
 b=LpQIScbPZTc6eYIhEr9CMRiNO0EKCOUFVC174fL4Qb9Ichtju5wot6kA6Z8zBTB0/AuOrz
 4X7lw/OMvS/OnTL2Q6QlkwrN71QpTHCgbFE4kwiDrzsa6PMgzYN0rfPc17jhIWbljMONN8
 fXq/g214EClVgKKFLlzJq4+s4Ae2dSM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-2U7Lqs-IP_eBPMFE3pjlSQ-1; Tue,
 16 Dec 2025 03:25:48 -0500
X-MC-Unique: 2U7Lqs-IP_eBPMFE3pjlSQ-1
X-Mimecast-MFC-AGG-ID: 2U7Lqs-IP_eBPMFE3pjlSQ_1765873547
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C9F6F195608E; Tue, 16 Dec 2025 08:25:46 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.146])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 590AB18004D8; Tue, 16 Dec 2025 08:25:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/panic: Rename draw_panic_static_* to
 draw_panic_screen_*
Date: Tue, 16 Dec 2025 09:20:38 +0100
Message-ID: <20251216082524.115980-2-jfalempe@redhat.com>
In-Reply-To: <20251216082524.115980-1-jfalempe@redhat.com>
References: <20251216082524.115980-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

I called them "static" because the panic screen is drawn only once,
but this can be confused with the static meaning in C.
Also remove some unnecessary braces in draw_panic_dispatch().
No functionnal change.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f42be7f1d8c2..30c615768efe 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -476,7 +476,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
 				   fg_color);
 }
 
-static void draw_panic_static_user(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -545,7 +545,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
  * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
  * and going up until reaching the top of the screen.
  */
-static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -733,7 +733,7 @@ static int drm_panic_get_qr_code(u8 **qr_image)
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
-static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -801,10 +801,10 @@ static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
 	return 0;
 }
 
-static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 {
-	if (_draw_panic_static_qr_code(sb))
-		draw_panic_static_user(sb);
+	if (_draw_panic_screen_qr_code(sb))
+		draw_panic_screen_user(sb);
 }
 #else
 static void drm_panic_qr_init(void) {};
@@ -879,18 +879,18 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 {
 	switch (drm_panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
-		draw_panic_static_kmsg(sb);
+		draw_panic_screen_kmsg(sb);
 		break;
 
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
-		draw_panic_static_qr_code(sb);
+		draw_panic_screen_qr_code(sb);
 		break;
 #endif
 
 	case DRM_PANIC_TYPE_USER:
 	default:
-		draw_panic_static_user(sb);
+		draw_panic_screen_user(sb);
 	}
 }
 
-- 
2.52.0

