Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C994A901
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBA710E52D;
	Wed,  7 Aug 2024 13:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hblxWrKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F1410E522
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723038578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBNl/uKTb0VAIatCXvsL+x69azoHWXH1eRzKUWOvGQU=;
 b=hblxWrKOnaVItUrcwp7cKepm9oW7l/RkdOIVHOqrKXvYaqRQ41mzBW6gbJY08ns2ytxWSL
 mjDBp64C7ZwRvkcd4Eg/PFIbb8Jmz5exQ/QO6wbANkDEaDF0sGsKEhLCXwr+QhYccJyT0d
 BP2Km71rOHy5XloTZXE5GvLJfOb5eOI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-r1TVruunO5igBRqHYIvCQA-1; Wed,
 07 Aug 2024 09:49:34 -0400
X-MC-Unique: r1TVruunO5igBRqHYIvCQA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 721CE196CDDF; Wed,  7 Aug 2024 13:49:29 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.86])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C708319560AE; Wed,  7 Aug 2024 13:49:24 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 5/5] drm/panic: Add panic description
Date: Wed,  7 Aug 2024 15:36:14 +0200
Message-ID: <20240807134902.458669-6-jfalempe@redhat.com>
In-Reply-To: <20240807134902.458669-1-jfalempe@redhat.com>
References: <20240807134902.458669-1-jfalempe@redhat.com>
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

Now that kmsg dump callback has the description parameter, use it in
the user panic screen.
This is the string passed to panic(), like "VFS: Unable to mount root
fs on xxx" or "Attempted to kill init! exitcode=0xxxx".
It gives a hint on why the panic occurred, without being too cryptic.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

v2:
 * Use a macro PANIC_MSG_LINES, instead of directly using the indice in drm_panic_set_description() (Sima)
 * Add drm_panic_clear_description() to make sure the stack allocated pointer won't be used. (Sima)
 * use the macro PANIC_MSG_LINES also in draw_panic_static_user()

 drivers/gpu/drm/drm_panic.c | 56 ++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 2efede7fa23a..c7d9f3a9e30d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -81,7 +81,10 @@ static struct drm_panic_line panic_msg[] = {
 	PANIC_LINE("KERNEL PANIC!"),
 	PANIC_LINE(""),
 	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+	PANIC_LINE(""), /* will be replaced by the panic description */
 };
+#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
 
 static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE("     .--.        _"),
@@ -92,6 +95,7 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" /'\\_   _/`\\    (_)"),
 	PANIC_LINE(" \\___)=(___/"),
 };
+#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
 
 #if defined(CONFIG_LOGO) && !defined(MODULE)
 static const struct linux_logo *logo_mono;
@@ -487,13 +491,12 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 
 static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 {
-	size_t msg_lines = ARRAY_SIZE(panic_msg);
-	size_t logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
 	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
 	unsigned int logo_width, logo_height;
+	unsigned int msg_width, msg_height;
 
 	if (!font)
 		return;
@@ -504,14 +507,14 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 		logo_width = logo_mono->width;
 		logo_height = logo_mono->height;
 	} else {
-		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
-		logo_height = logo_ascii_lines * font->height;
+		logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * font->width;
+		logo_height = PANIC_LOGO_LINES * font->height;
 	}
-
 	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
-	r_msg = DRM_RECT_INIT(0, 0,
-			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
-			      min(msg_lines * font->height, sb->height));
+
+	msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * font->width, sb->width);
+	msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
+	r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
 
 	/* Center the panic message */
 	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
@@ -525,10 +528,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
 				       fg_color);
 		else
-			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
+			draw_txt_rectangle(sb, font, logo_ascii, PANIC_LOGO_LINES, false, &r_logo,
 					   fg_color);
 	}
-	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
+	draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, &r_msg, fg_color);
 }
 
 /*
@@ -633,7 +636,31 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 	}
 }
 
-static void draw_panic_plane(struct drm_plane *plane)
+static void drm_panic_set_description(const char *description)
+{
+	u32 len;
+
+	if (description) {
+		struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
+
+		desc_line->txt = description;
+		len = strlen(description);
+		/* ignore the last newline character */
+		if (len && description[len - 1] == '\n')
+			len -= 1;
+		desc_line->len = len;
+	}
+}
+
+static void drm_panic_clear_description(void)
+{
+	struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
+
+	desc_line->len = 0;
+	desc_line->txt = NULL;
+}
+
+static void draw_panic_plane(struct drm_plane *plane, const char *description)
 {
 	struct drm_scanout_buffer sb = { };
 	int ret;
@@ -642,6 +669,8 @@ static void draw_panic_plane(struct drm_plane *plane)
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
+	drm_panic_set_description(description);
+
 	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
 
 	if (!ret && drm_panic_is_format_supported(sb.format)) {
@@ -649,6 +678,7 @@ static void draw_panic_plane(struct drm_plane *plane)
 		if (plane->helper_private->panic_flush)
 			plane->helper_private->panic_flush(plane);
 	}
+	drm_panic_clear_description();
 	drm_panic_unlock(plane->dev, flags);
 }
 
@@ -662,7 +692,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
 	struct drm_plane *plane = to_drm_plane(dumper);
 
 	if (detail->reason == KMSG_DUMP_PANIC)
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, detail->description);
 }
 
 
@@ -682,7 +712,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
 	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
 		struct drm_plane *plane = file->private_data;
 
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, "Test from debugfs");
 	}
 	return count;
 }
-- 
2.45.2

