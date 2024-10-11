Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4026C99A21E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BA810EAC1;
	Fri, 11 Oct 2024 10:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QGNJ77Q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81010EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728644176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvqoNQoCBK9gj/IJ1E++Q+I3Hd5/1m/NZeNUHiOJE8E=;
 b=QGNJ77Q6s0jK14haPvTjboVagginMZCEnJuDCndM4pkZX1VKYmyYyoywxak0GAsxe+kEXq
 ++kCD85LJAeBD3JJqm84TDbSviD6Nwe5nrUaXviRcGrIQiqOusiWjuteNxCihAZgPDfs49
 wY8RQrom5vM99nJnNF41idrd1xTuEyg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-9anfNptEMWSbv5teTupM-A-1; Fri,
 11 Oct 2024 06:56:13 -0400
X-MC-Unique: 9anfNptEMWSbv5teTupM-A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C7D1C1955EAD; Fri, 11 Oct 2024 10:56:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.224])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4609F19560AA; Fri, 11 Oct 2024 10:56:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 7/7] drm/log: Add integer scaling support
Date: Fri, 11 Oct 2024 12:50:04 +0200
Message-ID: <20241011105526.615812-8-jfalempe@redhat.com>
In-Reply-To: <20241011105526.615812-1-jfalempe@redhat.com>
References: <20241011105526.615812-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Add a module parameter, to increase the font size for HiDPI screen.
Even with CONFIG_FONT_TER16x32, it can still be a bit small to read.
In this case, adding drm_log.scale=2 to your kernel command line will
double the character size.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_log.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
index 07d151300146..e44c10819bd0 100644
--- a/drivers/gpu/drm/drm_log.c
+++ b/drivers/gpu/drm/drm_log.c
@@ -25,6 +25,10 @@ MODULE_AUTHOR("Jocelyn Falempe");
 MODULE_DESCRIPTION("DRM boot logger");
 MODULE_LICENSE("GPL");
 
+static uint scale = 1;
+module_param(scale, uint, 0444);
+MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 1");
+
 /**
  * DOC: overview
  *
@@ -38,6 +42,8 @@ struct drm_log_scanout {
 	const struct font_desc *font;
 	u32 rows;
 	u32 columns;
+	u32 scaled_font_h;
+	u32 scaled_font_w;
 	u32 line;
 	u32 format;
 	u32 px_width;
@@ -67,7 +73,7 @@ static struct drm_log *console_to_drm_log(struct console *con)
 
 static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
 			 const u8 *src, unsigned int src_pitch,
-			 u32 height, u32 width, u32 scale, u32 px_width, u32 color)
+			 u32 height, u32 width, u32 px_width, u32 color)
 {
 	switch (px_width) {
 	case 2:
@@ -87,7 +93,7 @@ static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
 static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
 {
 	struct drm_framebuffer *fb = scanout->buffer->fb;
-	unsigned long height = scanout->font->height;
+	unsigned long height = scanout->scaled_font_h;
 	struct iosys_map map;
 	struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, height);
 
@@ -107,8 +113,8 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
 	const u8 *src;
 	u32 px_width = fb->format->cpp[0];
-	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
-					  fb->width, (scanout->line + 1) * font->height);
+	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * scanout->scaled_font_h,
+					  fb->width, (scanout->line + 1) * scanout->scaled_font_h);
 	u32 i;
 
 	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
@@ -118,9 +124,10 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 	for (i = 0; i < len && i < scanout->columns; i++) {
 		u32 color = (i < prefix_len) ? scanout->prefix_color : scanout->front_color;
 		src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
-		drm_log_blit(&map, fb->pitches[0], src, font_pitch, font->height, font->width,
-			     1, px_width, color);
-		iosys_map_incr(&map, font->width * px_width);
+		drm_log_blit(&map, fb->pitches[0], src, font_pitch,
+			     scanout->scaled_font_h, scanout->scaled_font_w,
+			     px_width, color);
+		iosys_map_incr(&map, scanout->scaled_font_w * px_width);
 	}
 
 	scanout->line++;
@@ -205,8 +212,10 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
 		return -ENOMEM;
 	}
 	mode_set->fb = scanout->buffer->fb;
-	scanout->rows = height / scanout->font->height;
-	scanout->columns = width / scanout->font->width;
+	scanout->scaled_font_h = scanout->font->height * scale;
+	scanout->scaled_font_w = scanout->font->width * scale;
+	scanout->rows = height / scanout->scaled_font_h;
+	scanout->columns = width / scanout->scaled_font_w;
 	scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, format);
 	scanout->prefix_color = drm_draw_color_from_xrgb8888(0x4e9a06, format);
 	return 0;
-- 
2.46.2

