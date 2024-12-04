Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35849E3EF7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACEC10E4F8;
	Wed,  4 Dec 2024 16:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ie+m3NgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A7F10E4F0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733328050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFso6aGje28aYlvUAUAeCqyq+rGGj8xYfJHCIPFrhf8=;
 b=Ie+m3NgZWdMcWT7zvUr9fxej2DYIqOEEF95JQgRTdluwSVS9dZpWL+QjIEkFJRLu7/63MG
 RSBlAQA/HdGS1MQUfVSAllkIzT4blC+kGxHu34ZX9WrgIs1n0B7V9mLreSu7Fpl0JnKyig
 8p92HfjdvpgGt6t5LOcjuzUNJ9pU/Vk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-zjGwx9hBPnaCeq76xJPzYQ-1; Wed,
 04 Dec 2024 11:00:47 -0500
X-MC-Unique: zjGwx9hBPnaCeq76xJPzYQ-1
X-Mimecast-MFC-AGG-ID: zjGwx9hBPnaCeq76xJPzYQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B0F5419560B5; Wed,  4 Dec 2024 16:00:44 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.255])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9A2FA1955F42; Wed,  4 Dec 2024 16:00:40 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 4/6] drm/log: Color the timestamp, to improve readability
Date: Wed,  4 Dec 2024 16:45:03 +0100
Message-ID: <20241204160014.1171469-5-jfalempe@redhat.com>
In-Reply-To: <20241204160014.1171469-1-jfalempe@redhat.com>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
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

Color the timesamp prefix, similar to dmesg.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index a933da024b1a..5a995742aec5 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -42,6 +42,7 @@ struct drm_log_scanout {
 	u32 format;
 	u32 px_width;
 	u32 front_color;
+	u32 prefix_color;
 };
 
 struct drm_log {
@@ -97,7 +98,7 @@ static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
 }
 
 static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
-			      unsigned int len)
+			      unsigned int len, unsigned int prefix_len)
 {
 	struct drm_framebuffer *fb = scanout->buffer->fb;
 	struct iosys_map map;
@@ -114,9 +115,10 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 
 	iosys_map_incr(&map, r.y1 * fb->pitches[0]);
 	for (i = 0; i < len && i < scanout->columns; i++) {
+		u32 color = (i < prefix_len) ? scanout->prefix_color : scanout->front_color;
 		src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
 		drm_log_blit(&map, fb->pitches[0], src, font_pitch, font->height, font->width,
-			     1, px_width, scanout->front_color);
+			     1, px_width, color);
 		iosys_map_incr(&map, font->width * px_width);
 	}
 
@@ -128,7 +130,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 }
 
 static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
-				  const char *s, unsigned int len)
+				  const char *s, unsigned int len, unsigned int prefix_len)
 {
 	if (scanout->line == 0) {
 		drm_log_clear_line(scanout, 0);
@@ -137,23 +139,35 @@ static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
 	} else if (scanout->line + 2 < scanout->rows)
 		drm_log_clear_line(scanout, scanout->line + 2);
 
-	drm_log_draw_line(scanout, s, len);
+	drm_log_draw_line(scanout, s, len, prefix_len);
 }
 
+/*
+ * Depends on print_time() in printk.c
+ * Timestamp is written with "[%5lu.%06lu]"
+ */
+#define TS_PREFIX_LEN 13
+
 static void drm_log_draw_kmsg_record(struct drm_log_scanout *scanout,
 				     const char *s, unsigned int len)
 {
+	u32 prefix_len = 0;
+
+	if (len > TS_PREFIX_LEN && s[0] == '[' && s[6] == '.' && s[TS_PREFIX_LEN] == ']')
+		prefix_len = TS_PREFIX_LEN + 1;
+
 	/* do not print the ending \n character */
 	if (s[len - 1] == '\n')
 		len--;
 
 	while (len > scanout->columns) {
-		drm_log_draw_new_line(scanout, s, scanout->columns);
+		drm_log_draw_new_line(scanout, s, scanout->columns, prefix_len);
 		s += scanout->columns;
 		len -= scanout->columns;
+		prefix_len = 0;
 	}
 	if (len)
-		drm_log_draw_new_line(scanout, s, len);
+		drm_log_draw_new_line(scanout, s, len, prefix_len);
 }
 
 static u32 drm_log_find_usable_format(struct drm_plane *plane)
@@ -193,6 +207,7 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
 	scanout->rows = height / scanout->font->height;
 	scanout->columns = width / scanout->font->width;
 	scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, format);
+	scanout->prefix_color = drm_draw_color_from_xrgb8888(0x4e9a06, format);
 	return 0;
 }
 
-- 
2.47.1

