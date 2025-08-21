Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E86B2F49D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260C610E90B;
	Thu, 21 Aug 2025 09:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B233x0Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132DD10E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755769964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5iAm/zvI0Eff2wE9jd/ydPFKoAPLPkgSyf/zQO1N1E4=;
 b=B233x0Ipcy+iFU8pSrBx0W+tFuiIdVer5VszWj1CLWOidDNkVWyp1QhTzLQdMZZ7Gkq1RJ
 skSCze22gVmmvRI+PBfYQdBuP1TWCqiLy6U6cPH+s+wt5xFAo9FEqRZYh6YVJyXp0AZlq1
 INZtgOUjIgYxTrFEm0pZPJJOKImVAfE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-i8PxERLhON2CMRY71zdtwQ-1; Thu,
 21 Aug 2025 05:52:41 -0400
X-MC-Unique: i8PxERLhON2CMRY71zdtwQ-1
X-Mimecast-MFC-AGG-ID: i8PxERLhON2CMRY71zdtwQ_1755769959
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8810919560B0; Thu, 21 Aug 2025 09:52:39 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.118])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5D41B197768D; Thu, 21 Aug 2025 09:52:36 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/panic: Rename draw_panic_static_* to
 draw_panic_screen_*
Date: Thu, 21 Aug 2025 11:49:05 +0200
Message-ID: <20250821095228.648156-2-jfalempe@redhat.com>
In-Reply-To: <20250821095228.648156-1-jfalempe@redhat.com>
References: <20250821095228.648156-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
 drivers/gpu/drm/drm_panic.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 1d6312fa1429..1e06e3a18d09 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -437,7 +437,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
 				   fg_color);
 }
 
-static void draw_panic_static_user(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -506,7 +506,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
  * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
  * and going up until reaching the top of the screen.
  */
-static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -694,7 +694,7 @@ static int drm_panic_get_qr_code(u8 **qr_image)
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
-static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -759,15 +759,15 @@ static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
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
-static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 {
-	draw_panic_static_user(sb);
+	draw_panic_screen_user(sb);
 }
 
 static void drm_panic_qr_init(void) {};
@@ -790,13 +790,12 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 
 static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 {
-	if (!strcmp(drm_panic_screen, "kmsg")) {
-		draw_panic_static_kmsg(sb);
-	} else if (!strcmp(drm_panic_screen, "qr_code")) {
-		draw_panic_static_qr_code(sb);
-	} else {
-		draw_panic_static_user(sb);
-	}
+	if (!strcmp(drm_panic_screen, "kmsg"))
+		draw_panic_screen_kmsg(sb);
+	else if (!strcmp(drm_panic_screen, "qr_code"))
+		draw_panic_screen_qr_code(sb);
+	else
+		draw_panic_screen_user(sb);
 }
 
 static void drm_panic_set_description(const char *description)
-- 
2.50.1

