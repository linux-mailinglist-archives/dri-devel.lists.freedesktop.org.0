Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B38420C1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426A5112EEA;
	Tue, 30 Jan 2024 10:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85C7112EC2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17E011F847;
 Tue, 30 Jan 2024 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMycMLQZ/H1LM0SxDxDKhapi33VGP8svS3AQi+kiqA8=;
 b=vonZ3l61W11gE+9fg59DTfdXRQF7ynbR68v6pmdDtupNqd5o/vMMQMh65QIyNZIYV18Yco
 t8mX1ZxvyAvlUM8JvbureufDaZF3TvNbJulSI6d9v/l+gI6oIxc5b5xhcS1BZ0Q1Wa2VWt
 XTSOc4ITRK96iT6qfo8MqR74EYLFnZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMycMLQZ/H1LM0SxDxDKhapi33VGP8svS3AQi+kiqA8=;
 b=lbvbtgUu6DoZdOhPccx1iLsvKKym/IzL/Csu4YiRitSbhGeqhUfYxQCbFxcma/JeeukB1G
 8yByyUDZRDia0IDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMycMLQZ/H1LM0SxDxDKhapi33VGP8svS3AQi+kiqA8=;
 b=vonZ3l61W11gE+9fg59DTfdXRQF7ynbR68v6pmdDtupNqd5o/vMMQMh65QIyNZIYV18Yco
 t8mX1ZxvyAvlUM8JvbureufDaZF3TvNbJulSI6d9v/l+gI6oIxc5b5xhcS1BZ0Q1Wa2VWt
 XTSOc4ITRK96iT6qfo8MqR74EYLFnZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMycMLQZ/H1LM0SxDxDKhapi33VGP8svS3AQi+kiqA8=;
 b=lbvbtgUu6DoZdOhPccx1iLsvKKym/IzL/Csu4YiRitSbhGeqhUfYxQCbFxcma/JeeukB1G
 8yByyUDZRDia0IDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EAE45139E1;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 6LpHOFXKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 09/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_xrgb8888_to_argb1555()
Date: Tue, 30 Jan 2024 10:53:44 +0100
Message-ID: <20240130100714.12608-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vonZ3l61;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lbvbtgUu
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 17E011F847
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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

Store the source-buffer parameters of drm_fb_xrgb8888_to_argb1555()
in struct drm_pixmap. Update the function's interface and all of its
callers.

Callers of drm_fb_xrgb8888_to_argb1555() initialize the pixmap's
instance from a pre-existing instance of struct drm_framebuffer.
There's potential to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 19 +++++++------------
 .../gpu/drm/tests/drm_format_helper_test.c    |  5 ++++-
 include/drm/drm_format_helper.h               |  4 ++--
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a7356bfc04bf3..7f203e3d0d605 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -607,15 +607,13 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  * @dst: Array of ARGB1555 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of XRGB8888 source buffer
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
- * the color format during the process. The parameters @dst, @dst_pitch and
- * @src refer to arrays. Each array must have at least as many entries as
- * there are planes in @fb's format. Each entry stores the value for the
+ * the color format during the process. The parameters @dst and @dst_pitch refer
+ * to arrays. Each array must have at least as many entries as there are planes
+ * in the pixmap's format. Each entry stores the value for the
  * format's respective color plane at the same index.
  *
  * This function does not apply clipping on @dst (i.e. the destination is at the
@@ -625,15 +623,12 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  * XRGB8888 natively. It sets an opaque alpha channel as part of the conversion.
  */
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
-				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip, struct drm_format_conv_state *state)
+				 const struct drm_pixmap *src_pix,
+				 struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_argb1555_line);
@@ -1097,7 +1092,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src_pix, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB1555) {
-			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip, state);
+			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src_pix, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_RGBA5551) {
 			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip, state);
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 0277e27790c3c..fe8e89a6c01bb 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -786,6 +786,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	u16 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -807,7 +808,9 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src_pix, &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8852c5e7fe116..885b2b9d68cc3 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -112,8 +112,8 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_
 				 const struct drm_pixmap *src_pix,
 				 struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
-				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip, struct drm_format_conv_state *state);
+				 const struct drm_pixmap *src_pix,
+				 struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip, struct drm_format_conv_state *state);
-- 
2.43.0

