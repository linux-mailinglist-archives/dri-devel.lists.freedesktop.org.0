Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CA92652F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F8D10E99C;
	Wed,  3 Jul 2024 15:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xx1CW4Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9710E99C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720021489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJb+p9Ujbqk0LELEdIF/W40rBpskZlax/n/YCULwTs4=;
 b=Xx1CW4KlAiE1s05jgE/q5LmYKrwWjKFCOBeKKFSABjJlgV6jr7JGrMaY9lOZDCK09IV9ip
 zK4yOiW3JA3YxA5fzQiMP7B4DghBwACldZDcyH63ybdLgo+15ON50kOulT4C4dESgdB34g
 51zCbARLWYoKp3DXZcVe56KBVTN0QU4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-HiG4em4qM-i8KpkratoEjA-1; Wed,
 03 Jul 2024 11:44:43 -0400
X-MC-Unique: HiG4em4qM-i8KpkratoEjA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8CCD31955F4A; Wed,  3 Jul 2024 15:44:40 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.208])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 206DF1955BC1; Wed,  3 Jul 2024 15:44:34 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "Bjorn Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 3/4] drm/panic: simplify logo handling
Date: Wed,  3 Jul 2024 17:34:00 +0200
Message-ID: <20240703154309.426867-4-jfalempe@redhat.com>
In-Reply-To: <20240703154309.426867-1-jfalempe@redhat.com>
References: <20240703154309.426867-1-jfalempe@redhat.com>
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

Move logo rectangle initialisation, and logo drawing in separate
functions, so they can be re-used by different panic screens.
It prepares the introduction of the QR-code panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 57 +++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 9e06609e1799..450585374ca9 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -80,6 +80,7 @@ static struct drm_panic_line panic_msg[] = {
 	PANIC_LINE(""),
 	PANIC_LINE("Please reboot your computer."),
 };
+static const int panic_msg_lines = ARRAY_SIZE(panic_msg);
 
 static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE("     .--.        _"),
@@ -90,6 +91,7 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" /'\\_   _/`\\    (_)"),
 	PANIC_LINE(" \\___)=(___/"),
 };
+static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 
 #if defined(CONFIG_LOGO) && !defined(MODULE)
 static const struct linux_logo *logo_mono;
@@ -488,33 +490,45 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 	}
 }
 
+static void drm_panic_logo_rect(struct drm_rect *rect, const struct font_desc *font)
+{
+	if (logo_mono)
+		drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
+	else {
+		int logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
+
+		drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * font->height);
+	}
+}
+
+static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *rect,
+				const struct font_desc *font, u32 fg_color)
+{
+	if (logo_mono)
+		drm_panic_blit(sb, rect, logo_mono->data,
+			       DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
+	else
+		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, rect,
+				   fg_color);
+}
+
 static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 {
-	size_t msg_lines = ARRAY_SIZE(panic_msg);
-	size_t logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
 	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
-	unsigned int logo_width, logo_height;
+	unsigned int panic_msg_width;
 
 	if (!font)
 		return;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
-
-	if (logo_mono) {
-		logo_width = logo_mono->width;
-		logo_height = logo_mono->height;
-	} else {
-		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
-		logo_height = logo_ascii_lines * font->height;
-	}
-
-	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
+	drm_panic_logo_rect(&r_logo, font);
+	panic_msg_width = get_max_line_len(panic_msg, panic_msg_lines) * font->width;
 	r_msg = DRM_RECT_INIT(0, 0,
-			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
-			      min(msg_lines * font->height, sb->height));
+			      min(panic_msg_width, sb->width),
+			      min(panic_msg_lines * font->height, sb->height));
 
 	/* Center the panic message */
 	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
@@ -522,15 +536,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if (!drm_rect_overlap(&r_logo, &r_msg)) {
-		if (logo_mono)
-			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
-				       fg_color);
-		else
-			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
-					   fg_color);
-	}
-	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
+	if (!drm_rect_overlap(&r_logo, &r_msg))
+		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
+
+	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
 }
 
 /*
-- 
2.45.2

