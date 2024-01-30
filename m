Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB48420C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681E0112ECD;
	Tue, 30 Jan 2024 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687E112EF2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:50 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33390222DF;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yi0afbT3Cc0YM88CI+p91do+yt0/9Sc9oNu0NouNp8=;
 b=cUybfltUi6wodCmq25TfOYtiRKcIXw1YsmlDHwpId8UKx1SsvARY2T7xOfe+njGGPyl2zp
 PpVtkCj5u5g7q07d7e3WbU/l5woN7ijALqqjM39G9OV6O1rOsl2Q4FLtSd8NvPdY9DL61D
 M/duQmYC918B5YSxq5ue5Z23ZYn1oUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yi0afbT3Cc0YM88CI+p91do+yt0/9Sc9oNu0NouNp8=;
 b=XyJM7cGHpy26KUJreHhJrflaqjXf1MSqElZUoN+vbdsagpOcyQWhSusqrXwJBfveonxhri
 MzSpvSun0GbOAMDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yi0afbT3Cc0YM88CI+p91do+yt0/9Sc9oNu0NouNp8=;
 b=cUybfltUi6wodCmq25TfOYtiRKcIXw1YsmlDHwpId8UKx1SsvARY2T7xOfe+njGGPyl2zp
 PpVtkCj5u5g7q07d7e3WbU/l5woN7ijALqqjM39G9OV6O1rOsl2Q4FLtSd8NvPdY9DL61D
 M/duQmYC918B5YSxq5ue5Z23ZYn1oUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yi0afbT3Cc0YM88CI+p91do+yt0/9Sc9oNu0NouNp8=;
 b=XyJM7cGHpy26KUJreHhJrflaqjXf1MSqElZUoN+vbdsagpOcyQWhSusqrXwJBfveonxhri
 MzSpvSun0GbOAMDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 125F013462;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kI9kA1fKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 16/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_xrgb8888_to_argb2101010()
Date: Tue, 30 Jan 2024 10:53:51 +0100
Message-ID: <20240130100714.12608-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cUybfltU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XyJM7cGH
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 33390222DF
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

Store the source-buffer parameters of drm_fb_xrgb8888_to_argb2101010()
in struct drm_pixmap. Update the function's interface and all of its
callers.

Callers of drm_fb_xrgb8888_to_argb2101010() initialize the pixmap's
instance from a pre-existing instance of struct drm_framebuffer.
There's potential to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c            | 18 ++++++------------
 drivers/gpu/drm/tests/drm_format_helper_test.c |  5 ++++-
 include/drm/drm_format_helper.h                |  3 +--
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 779371c2d23c5..c77915df0b9a3 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -915,15 +915,13 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  * @dst: Array of ARGB2101010 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of XRGB8888 source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
- * the color format during the process. The parameters @dst, @dst_pitch and
- * @src refer to arrays. Each array must have at least as many entries as
- * there are planes in @fb's format. Each entry stores the value for the
+ * the color format during the process. The parameters @dst and @dst_pitch
+ * refer to arrays. Each array must have at least as many entries as
+ * there are planes in the pixmap's format. Each entry stores the value for the
  * format's respective color plane at the same index.
  *
  * This function does not apply clipping on @dst (i.e. the destination is at the
@@ -933,16 +931,12 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  * natively.
  */
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
-				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip,
+				    const struct drm_pixmap *src_pix,
 				    struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_argb2101010_line);
@@ -1082,7 +1076,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src_pix, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB2101010) {
-			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip, state);
+			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src_pix, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_BGRX8888) {
 			drm_fb_swab(dev, dst, dst_pitch, src_pix, false, state);
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 9a4834584398f..c5f1d0634492e 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1035,6 +1035,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	u32 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -1056,7 +1057,9 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src_pix, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 6f857f1066a75..497878d6da1de 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -127,8 +127,7 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 				    const struct drm_pixmap *src_pix,
 				    struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
-				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip,
+				    const struct drm_pixmap *src_pix,
 				    struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-- 
2.43.0

