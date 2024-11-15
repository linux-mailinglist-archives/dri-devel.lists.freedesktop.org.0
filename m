Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0039CE140
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB2410E86D;
	Fri, 15 Nov 2024 14:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cSz1mz4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094A310E86D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731681037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vCovO2BLu0s5flh7lxOQTtfiE/OLRdWhdT/meUOByo=;
 b=cSz1mz4yxSCQQ37+yVAHeAeQjP8g5cYfz/IY5k8fiEV7UsFulfHF3nk3aW3xUOVlQ46z+v
 bIYzPJQSI3s7fs9TD+h0fZkRiy6keS2z50gYzn1U8OlpDaVfabOJxIBy9VfyZaXZiJuF1n
 mkP6B7rVGDKVDkPy+3DunVRyAMeMB6U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-Z7rV39D9O6a7eFiexq__lg-1; Fri,
 15 Nov 2024 09:30:34 -0500
X-MC-Unique: Z7rV39D9O6a7eFiexq__lg-1
X-Mimecast-MFC-AGG-ID: Z7rV39D9O6a7eFiexq__lg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB3A01955EE8; Fri, 15 Nov 2024 14:30:31 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.181])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A09BC1956089; Fri, 15 Nov 2024 14:30:27 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 4/6] drm/log: Color the timestamp, to improve readability
Date: Fri, 15 Nov 2024 14:40:41 +0100
Message-ID: <20241115142950.1758007-5-jfalempe@redhat.com>
In-Reply-To: <20241115142950.1758007-1-jfalempe@redhat.com>
References: <20241115142950.1758007-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
---
 drivers/gpu/drm/clients/drm_log.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 8eca8044f1f08..615396e7b3739 100644
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
2.47.0

