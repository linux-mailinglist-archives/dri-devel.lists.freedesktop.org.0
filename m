Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43F8420C4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C110F1A3;
	Tue, 30 Jan 2024 10:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC7112EEE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:52 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CAE51FD06;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F61DSN93u6sD3MSPybi43XJWnke1g5DZJEpa8UtK7cw=;
 b=hgVEkDlLInzH4H2UVnEX6iBNPthGyJK3z9kN3TwstCfu4LDJXHPoJ5ulJJBTZKu7VU5okC
 FTvc4G97M8L5r0v0F7YGCzxw5JRbnHlhNmBIPZ9PsysS7dz+rUxlPTE9Zuyr4MirbuRs50
 QawsKic5yY3KHegTrOSIoG5hG59aYrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F61DSN93u6sD3MSPybi43XJWnke1g5DZJEpa8UtK7cw=;
 b=5ZBgNKIpDdRt01JTwOMlNYOQmAF0xYiOEbsKxYxI14yJdknG4aI22E7Hj6+OzBvLA5GsZ9
 A59NJS99OlHnNIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F61DSN93u6sD3MSPybi43XJWnke1g5DZJEpa8UtK7cw=;
 b=hgVEkDlLInzH4H2UVnEX6iBNPthGyJK3z9kN3TwstCfu4LDJXHPoJ5ulJJBTZKu7VU5okC
 FTvc4G97M8L5r0v0F7YGCzxw5JRbnHlhNmBIPZ9PsysS7dz+rUxlPTE9Zuyr4MirbuRs50
 QawsKic5yY3KHegTrOSIoG5hG59aYrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F61DSN93u6sD3MSPybi43XJWnke1g5DZJEpa8UtK7cw=;
 b=5ZBgNKIpDdRt01JTwOMlNYOQmAF0xYiOEbsKxYxI14yJdknG4aI22E7Hj6+OzBvLA5GsZ9
 A59NJS99OlHnNIAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D286139E1;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id aDSQGVjKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 23/23] [DO NOT MERGE] drm/format-helper: Add drm_fb_fill() to
 fill screen with color
Date: Tue, 30 Jan 2024 10:53:58 +0100
Message-ID: <20240130100714.12608-24-tzimmermann@suse.de>
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

Add drm_fb_fill(), which fills areas with a single static color, and
implement support for XRGB888 and RGB565. There's common infrastructure
code to move over the destination area and a per-line draw function for
each color format.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 150 ++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  11 ++
 2 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a61f45636a111..60c17febb3c20 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1413,3 +1413,153 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 	return fourccs - fourccs_out;
 }
 EXPORT_SYMBOL(drm_fb_build_fourcc_list);
+
+/*
+ * FILL
+ */
+
+static int __drm_fill(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
+		      unsigned int src_color, unsigned long npixels, unsigned long lines,
+		      struct drm_format_conv_state *state,
+		      void (*fill_line)(void *dbuf, unsigned int npixels,
+					const struct drm_color_lut *color))
+{
+	const struct drm_color_lut *color = &state->palette[src_color];
+	unsigned long i;
+
+	if (!dst_pitch)
+		dst_pitch = npixels * dst_pixsize;
+
+	for (i = 0; i < lines; ++i) {
+		fill_line(dst, npixels, color);
+		dst += dst_pitch;
+	}
+
+	return 0;
+}
+
+static int __drm_fill_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
+			   unsigned int src_color, unsigned long npixels, unsigned long lines,
+			   struct drm_format_conv_state *state,
+			   void (*fill_line)(void *dbuf, unsigned int npixels,
+					     const struct drm_color_lut *color))
+{
+	const struct drm_color_lut *color = &state->palette[src_color];
+	size_t dbuf_len = npixels * dst_pixsize;
+	unsigned long i;
+	void *dbuf;
+
+	dbuf = drm_format_conv_state_reserve(state, dbuf_len, GFP_KERNEL);
+	if (!dbuf)
+		return -ENOMEM;
+
+	if (!dst_pitch)
+		dst_pitch = npixels * dst_pixsize;
+
+	for (i = 0; i < lines; ++i) {
+		fill_line(dbuf, npixels, color);
+		memcpy_toio(dst, dbuf, dbuf_len);
+		dst += dst_pitch;
+	}
+
+	return 0;
+}
+
+static int drm_fill(struct iosys_map *dst,
+		    const unsigned int *dst_pitch, const u8 *dst_pixsize,
+		    unsigned int src_color, unsigned long pixels, unsigned long lines,
+		    struct drm_format_conv_state *state,
+		    void (*fill_line)(void *dbuf, unsigned int npixels,
+				      const struct drm_color_lut *color))
+{
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	/* TODO: handle src in I/O memory here */
+	if (dst[0].is_iomem)
+		return __drm_fill_toio(
+			dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+			src_color, pixels, lines, state, fill_line);
+	else
+		return __drm_fill(
+			dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+			src_color, pixels, lines, state, fill_line);
+}
+
+static void drm_fill_rgb565_line(void *dbuf, unsigned int pixels,
+				 const struct drm_color_lut *color)
+{
+
+	__le32 *dbuf16 = dbuf;
+	unsigned int x;
+	u16 pix = ((color->red   >> 11) << 11) |
+		  ((color->green >> 10) << 5) |
+		  ((color->blue  >> 11));
+
+	for (x = 0; x < pixels; x++)
+		*dbuf16++ = cpu_to_le16(pix);
+}
+
+void drm_fb_fill_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			unsigned int src_color, unsigned long pixels, unsigned long lines,
+			struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fill(dst, dst_pitch, dst_pixsize, src_color, pixels, lines,
+		 state, drm_fill_rgb565_line);
+}
+EXPORT_SYMBOL(drm_fb_fill_rgb565);
+
+static void drm_fill_xrgb8888_line(void *dbuf, unsigned int pixels,
+				   const struct drm_color_lut *color)
+{
+
+	__le32 *dbuf32 = dbuf;
+	unsigned int x;
+	u32 pix = GENMASK(31, 24) | /* fill unused bits */
+		  ((color->red   >> 8) << 16) |
+		  ((color->green >> 8) << 8) |
+		  ((color->blue  >> 8));
+
+	for (x = 0; x < pixels; x++)
+		*dbuf32++ = cpu_to_le32(pix);
+}
+
+void drm_fb_fill_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			  unsigned int src_color, unsigned long pixels, unsigned long lines,
+			  struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fill(dst, dst_pitch, dst_pixsize, src_color, pixels, lines,
+		 state, drm_fill_xrgb8888_line);
+}
+EXPORT_SYMBOL(drm_fb_fill_xrgb8888);
+
+int drm_fb_fill(struct drm_device *dev,
+		struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
+		unsigned int src_color, unsigned long pixels, unsigned long lines,
+		struct drm_format_conv_state *state)
+{
+	if (dst_format == DRM_FORMAT_RGB565) {
+		drm_fb_fill_rgb565(dst, dst_pitch, src_color, pixels, lines, state);
+		return 0;
+	} else if (dst_format == DRM_FORMAT_XRGB8888) {
+		drm_fb_fill_xrgb8888(dst, dst_pitch, src_color, pixels, lines, state);
+		return 0;
+	}
+
+	drm_warn_once(dev, "No fill helper for %p4cc found.\n", &dst_format);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_fb_fill);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index d5ee8bdb0f619..283b6b349675e 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -155,4 +155,15 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
 				u32 *fourccs_out, size_t nfourccs_out);
 
+void drm_fb_fill_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			unsigned int src_color, unsigned long pixels, unsigned long lines,
+			struct drm_format_conv_state *state);
+void drm_fb_fill_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			  unsigned int src_color, unsigned long pixels, unsigned long lines,
+			  struct drm_format_conv_state *state);
+int drm_fb_fill(struct drm_device *dev,
+		struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
+		unsigned int src_color, unsigned long pixels, unsigned long lines,
+		struct drm_format_conv_state *state);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.43.0

