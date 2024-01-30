Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A28420BF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AA9112EE8;
	Tue, 30 Jan 2024 10:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2355D112ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:22 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F5B71F84C;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WGahCQUDp1ZkOyyYePP/5ROViRutJVHHUFSpVTIMRw=;
 b=QKv+BhNuVoD+83ZMA8mxA/WjFfShyvm69rKZ5QypE5x8zPI4VKgfY+d8v6yA1jhuFrX/gc
 psAZz2O5S/ku6GIP7u6d+3lPdlMf3cVo3tHKvDL4C3aoBmfCtRqL1U0Y5je8PNUBlCnldr
 KOGk1i0bsgcpY6k2rL/kc5yzP0LWOhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WGahCQUDp1ZkOyyYePP/5ROViRutJVHHUFSpVTIMRw=;
 b=OrWMNh85d/moaRjfHvxHrpqocriHCkczlpYIaTUbd7o86a7kaJEn55NhT8htuh6h0lWeVY
 s/eOQ0auAPTcoeAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WGahCQUDp1ZkOyyYePP/5ROViRutJVHHUFSpVTIMRw=;
 b=QKv+BhNuVoD+83ZMA8mxA/WjFfShyvm69rKZ5QypE5x8zPI4VKgfY+d8v6yA1jhuFrX/gc
 psAZz2O5S/ku6GIP7u6d+3lPdlMf3cVo3tHKvDL4C3aoBmfCtRqL1U0Y5je8PNUBlCnldr
 KOGk1i0bsgcpY6k2rL/kc5yzP0LWOhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WGahCQUDp1ZkOyyYePP/5ROViRutJVHHUFSpVTIMRw=;
 b=OrWMNh85d/moaRjfHvxHrpqocriHCkczlpYIaTUbd7o86a7kaJEn55NhT8htuh6h0lWeVY
 s/eOQ0auAPTcoeAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E6EE413462;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mJhHN1fKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 20/23] [DO NOT MERGE] drm/format-helper: Add font-support for
 DRM pixmap
Date: Tue, 30 Jan 2024 10:53:55 +0100
Message-ID: <20240130100714.12608-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLson8px8pywph8mow9a7f4xe8)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for blitting characters. An instance of struct font_desc
stores the the character shapes. The blitting source pixmap contains
a reference to a character's glyph, which can then be blitted to the
destination. drm_pixmap_init_from_font_desc() sets up the pixmap.

  struct drm_pixmap;

  drm_pixmap_init_from_font_desc(&drm_pixmap, font_desc, font_data, 'c');
  drm_fb_blit(..., &pixmap, ...); // blits the character 'c'

To blit a string of characters, drm_pixmap_set_font_char() updates
the character's value.

  struct drm_pixmap;
  const char *str = "Hello world!"

  drm_pixmap_init_from_font_desc(&drm_pixmap, font_desc, font_data, '\0');

  while (*str) {
    drm_pixmap_set_font_char(&pixmap, font_data, *str);
    drm_fb_blit(..., &pixmap, ...); // blits *str
    ++str;
  }

Further helpers can be build from these primitives.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6b80be55cc5c0..ed90745f4d9fb 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -8,6 +8,7 @@
  * (at your option) any later version.
  */
 
+#include <linux/font.h>
 #include <linux/io.h>
 #include <linux/iosys-map.h>
 #include <linux/module.h>
@@ -181,6 +182,32 @@ void drm_pixmap_init_from_framebuffer(struct drm_pixmap *pix, const struct drm_f
 }
 EXPORT_SYMBOL(drm_pixmap_init_from_framebuffer);
 
+void drm_pixmap_init_from_font_desc(struct drm_pixmap *pix, const struct font_desc *font,
+				    const struct iosys_map *data, int c)
+{
+	const struct drm_rect clip = DRM_RECT_INIT(0, 0, font->width, font->height);
+	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_C1);
+	const unsigned int pitches[DRM_FORMAT_MAX_PLANES] = {
+		drm_format_info_min_pitch(format, 0, font->width),
+	};
+	struct iosys_map cdata[DRM_FORMAT_MAX_PLANES] = {
+		IOSYS_MAP_INIT_OFFSET(&data[0], c * font->height * pitches[0]),
+	};
+
+	drm_pixmap_init(pix, format, cdata, pitches, &clip);
+}
+EXPORT_SYMBOL(drm_pixmap_init_from_font_desc);
+
+void drm_pixmap_set_font_char(struct drm_pixmap *pix, const struct iosys_map *data, int c)
+{
+	unsigned int height = drm_rect_height(&pix->clip);
+	size_t i;
+
+	for (i = 0; i < pix->format->num_planes; ++i)
+		pix->data[i] = IOSYS_MAP_INIT_OFFSET(&data[i], c * height * pix->pitches[i]);
+}
+EXPORT_SYMBOL(drm_pixmap_set_font_char);
+
 static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			 const void *src, unsigned long src_pitch, unsigned long src_pixsize,
 			 const struct drm_rect *src_clip, bool src_cached_hint,
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index a78360e229a45..098e6f8412465 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -14,6 +14,7 @@
 
 struct drm_device;
 struct drm_framebuffer;
+struct font_desc;
 
 /**
  * struct drm_format_conv_state - Stores format-conversion state
@@ -93,6 +94,9 @@ struct drm_pixmap {
 
 void drm_pixmap_init_from_framebuffer(struct drm_pixmap *pix, const struct drm_framebuffer *fb,
 				      const struct iosys_map *data, const struct drm_rect *clip);
+void drm_pixmap_init_from_font_desc(struct drm_pixmap *pix, const struct font_desc *font,
+				    const struct iosys_map *data, int c);
+void drm_pixmap_set_font_char(struct drm_pixmap *pix, const struct iosys_map *data, int c);
 
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
-- 
2.43.0

