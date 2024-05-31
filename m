Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B228D5C59
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B873710E386;
	Fri, 31 May 2024 08:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NhfH0xkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E51113249
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717142905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQ+6H8/ksuGqaatIJSB6x2l2hNP0z56ovJDtUaraPg4=;
 b=NhfH0xkHMVgWP4KtU8AQOtW02p0ZFpb0q9/DP6qqZxbyhMd/ZJAb5ti4VJ5qm3eNOHB8NO
 nZdEIvPUcvEXLOmYc4w3cqqjUmZPf6JpLYfQ6Lfbl+v7ZZuS0SswuXpiatCpuhkZEwCmnI
 u7/PFVHdItVNQ748sLo6/8SqFZJI1LM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-BXynmbHQOkW_q80cnnZlow-1; Fri,
 31 May 2024 04:08:21 -0400
X-MC-Unique: BXynmbHQOkW_q80cnnZlow-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDAB1C0512B;
 Fri, 31 May 2024 08:08:21 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78AF840EFD4;
 Fri, 31 May 2024 08:08:20 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 3/3] drm/panic: Add a kmsg dump screen
Date: Fri, 31 May 2024 10:06:34 +0200
Message-ID: <20240531080750.765982-4-jfalempe@redhat.com>
In-Reply-To: <20240531080750.765982-1-jfalempe@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Add a kmsg dump option, which will display the last lines of kmsg,
and should be similar to fbcon.
Add a Kconfig choice for the panic screen, so that the user can
choose between this new kmsg dump, or the userfriendly option.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  21 +++++
 drivers/gpu/drm/drm_panic.c | 151 +++++++++++++++++++++++++++---------
 2 files changed, 136 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..78d401b55102 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -137,6 +137,27 @@ config DRM_PANIC_DEBUG
 	  This is unsafe and should not be enabled on a production build.
 	  If in doubt, say "N".
 
+choice
+	prompt "Panic screen formater"
+	default DRM_PANIC_SCREEN_USERFRIENDLY
+	depends on DRM_PANIC
+	help
+	  This option enable to choose what will be displayed when a kernel
+	  panic occurs.
+
+	config DRM_PANIC_SCREEN_USERFRIENDLY
+		bool "Default user friendly message"
+		help
+		  Only a short message telling the user to reboot the system.
+
+	config DRM_PANIC_SCREEN_KMSG
+		bool "Display the last lines of kmsg"
+		help
+		  Display kmsg last lines on panic.
+		  Enable if you are a kernel developer, and want to debug a
+		  kernel panic.
+endchoice
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 27e26b9d842c..71f6f566d64b 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -63,24 +63,6 @@ struct drm_panic_line {
 	const char *txt;
 };
 
-#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
-
-static struct drm_panic_line panic_msg[] = {
-	PANIC_LINE("KERNEL PANIC !"),
-	PANIC_LINE(""),
-	PANIC_LINE("Please reboot your computer."),
-};
-
-static const struct drm_panic_line logo[] = {
-	PANIC_LINE("     .--.        _"),
-	PANIC_LINE("    |o_o |      | |"),
-	PANIC_LINE("    |:_/ |      | |"),
-	PANIC_LINE("   //   \\ \\     |_|"),
-	PANIC_LINE("  (|     | )     _"),
-	PANIC_LINE(" /'\\_   _/`\\    (_)"),
-	PANIC_LINE(" \\___)=(___/"),
-};
-
 /*
  * Color conversion
  */
@@ -385,16 +367,6 @@ static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t fo
 	return font->data + (c * font->height) * font_pitch;
 }
 
-static unsigned int get_max_line_len(const struct drm_panic_line *lines, int len)
-{
-	int i;
-	unsigned int max = 0;
-
-	for (i = 0; i < len; i++)
-		max = max(lines[i].len, max);
-	return max;
-}
-
 /*
  * Draw a text in a rectangle on a framebuffer. The text is truncated if it overflows the rectangle
  */
@@ -431,24 +403,48 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 	}
 }
 
-/*
- * Draw the panic message at the center of the screen
- */
+#if defined(CONFIG_DRM_PANIC_SCREEN_USERFRIENDLY)
+
+#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
+
+static struct drm_panic_line panic_msg[] = {
+	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE(""),
+	PANIC_LINE("Please reboot your computer."),
+};
+
+static const struct drm_panic_line logo[] = {
+	PANIC_LINE("     .--.        _"),
+	PANIC_LINE("    |o_o |      | |"),
+	PANIC_LINE("    |:_/ |      | |"),
+	PANIC_LINE("   //   \\ \\     |_|"),
+	PANIC_LINE("  (|     | )     _"),
+	PANIC_LINE(" /'\\_   _/`\\    (_)"),
+	PANIC_LINE(" \\___)=(___/"),
+};
+
+static unsigned int get_max_line_len(const struct drm_panic_line *lines, int len)
+{
+	int i;
+	unsigned int max = 0;
+
+	for (i = 0; i < len; i++)
+		max = max(lines[i].len, max);
+	return max;
+}
+
 static void draw_panic_static(struct drm_scanout_buffer *sb)
 {
 	size_t msg_lines = ARRAY_SIZE(panic_msg);
 	size_t logo_lines = ARRAY_SIZE(logo);
-	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
-	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
+	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
+	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
 
 	if (!font)
 		return;
 
-	fg_color = convert_from_xrgb8888(fg_color, sb->format->format);
-	bg_color = convert_from_xrgb8888(bg_color, sb->format->format);
-
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
 	r_logo = DRM_RECT_INIT(0, 0,
@@ -471,6 +467,89 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
 }
 
+#elif defined(CONFIG_DRM_PANIC_SCREEN_KMSG)
+
+#include <linux/kmsg_dump.h>
+#include <linux/printk.h>
+
+/*
+ * Draw one line of kmsg, and handle wrapping if it won't fit in the screen width.
+ * Return the y-offset of the next line.
+ */
+static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_desc *font,
+			       struct drm_panic_line *line, int yoffset, u32 fg_color)
+{
+	int chars_per_row = sb->width / font->width;
+	struct drm_rect r_txt = DRM_RECT_INIT(0, yoffset, sb->width, sb->height);
+	struct drm_panic_line line_wrap;
+
+	if (line->len > chars_per_row) {
+		line_wrap.len = line->len % chars_per_row;
+		line_wrap.txt = line->txt + line->len - line_wrap.len;
+		draw_txt_rectangle(sb, font, &line_wrap, 1, false, &r_txt, fg_color);
+		r_txt.y1 -= font->height;
+		if (r_txt.y1 < 0)
+			return r_txt.y1;
+		while (line_wrap.txt > line->txt) {
+			line_wrap.txt -= chars_per_row;
+			line_wrap.len = chars_per_row;
+			draw_txt_rectangle(sb, font, &line_wrap, 1, false, &r_txt, fg_color);
+			r_txt.y1 -= font->height;
+			if (r_txt.y1 < 0)
+				return r_txt.y1;
+		}
+	} else {
+		draw_txt_rectangle(sb, font, line, 1, false, &r_txt, fg_color);
+		r_txt.y1 -= font->height;
+	}
+	return r_txt.y1;
+}
+
+/*
+ * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
+ * and going up until reaching the top of the screen.
+ */
+static void draw_panic_static(struct drm_scanout_buffer *sb)
+{
+	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
+	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
+	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
+	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
+	struct kmsg_dump_iter iter;
+	char kmsg_buf[512];
+	size_t kmsg_len;
+	struct drm_panic_line line;
+	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
+
+	if (!font)
+		return;
+
+	/* Fill with the background color, and draw text on top */
+	drm_panic_fill(sb, &r_screen, bg_color);
+
+	kmsg_dump_rewind(&iter);
+	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+		char *start;
+		char *end;
+
+		/* ignore terminating NUL and newline */
+		start = kmsg_buf + kmsg_len - 2;
+		end = kmsg_buf + kmsg_len - 1;
+		while (start > kmsg_buf && yoffset >= 0) {
+			while (start > kmsg_buf && *start != '\n')
+				start--;
+			/* don't count the newline character */
+			line.txt = start + (start == kmsg_buf ? 0 : 1);
+			line.len = end - line.txt;
+
+			yoffset = draw_line_with_wrap(sb, font, &line, yoffset, fg_color);
+			end = start;
+			start--;
+		}
+	}
+}
+#endif
+
 /*
  * drm_panic_is_format_supported()
  * @format: a fourcc color code
-- 
2.45.1

