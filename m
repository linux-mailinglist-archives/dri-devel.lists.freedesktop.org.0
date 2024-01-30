Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E688420C3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09181112ED7;
	Tue, 30 Jan 2024 10:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA34112EEE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:48 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DC261F842;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0MIrnNKp4evnPiJPNFdaOxVmP0GaXFwoHvhJzl818c=;
 b=aSnCb9YZXSRLcH1lDlRolK2erpMG9jyJNTtwspsKNSUMXNzWCsCQ8jmsiXI7r3wg5Ww5uA
 5h3eu3Z3S0wwoRbdGwIOsF9HQpZmchGlephytVyv4eTMJjZXl2ypDtxn23K2c3u+jXJ2b1
 vs4ysSsszOQ9eFssjIzo3Dr7J9CiiQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0MIrnNKp4evnPiJPNFdaOxVmP0GaXFwoHvhJzl818c=;
 b=PYu9bTD5RIRtT8VRPDR3destiZiT+es1ZgpS8AuVUCt4eRTqFQWpZMOEY83h9DSk922/VC
 5HgQbL+QHmuFIQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0MIrnNKp4evnPiJPNFdaOxVmP0GaXFwoHvhJzl818c=;
 b=aSnCb9YZXSRLcH1lDlRolK2erpMG9jyJNTtwspsKNSUMXNzWCsCQ8jmsiXI7r3wg5Ww5uA
 5h3eu3Z3S0wwoRbdGwIOsF9HQpZmchGlephytVyv4eTMJjZXl2ypDtxn23K2c3u+jXJ2b1
 vs4ysSsszOQ9eFssjIzo3Dr7J9CiiQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0MIrnNKp4evnPiJPNFdaOxVmP0GaXFwoHvhJzl818c=;
 b=PYu9bTD5RIRtT8VRPDR3destiZiT+es1ZgpS8AuVUCt4eRTqFQWpZMOEY83h9DSk922/VC
 5HgQbL+QHmuFIQCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EF68E139E2;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id wK5SOVTKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 03/23] drm/format-helper: Streamline drm_fb_xfrm()
 implementations
Date: Tue, 30 Jan 2024 10:53:38 +0100
Message-ID: <20240130100714.12608-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
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

Make the implementations of drm_fb_xfrm() independent from struct
framebuffer and rename several variables. Done to simplify further
cleanups; no functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 66 ++++++++++++++---------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 593789b7a7be7..d59e38bcb942f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -181,16 +181,15 @@ void drm_pixmap_init_from_framebuffer(struct drm_pixmap *pix, const struct drm_f
 }
 EXPORT_SYMBOL(drm_pixmap_init_from_framebuffer);
 
-/* TODO: Make this function work with multi-plane formats. */
 static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
-			 const void *vaddr, const struct drm_framebuffer *fb,
-			 const struct drm_rect *clip, bool vaddr_cached_hint,
+			 const void *src, unsigned long src_pitch, unsigned long src_pixsize,
+			 const struct drm_rect *src_clip, bool src_cached_hint,
 			 struct drm_format_conv_state *state,
 			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
-	unsigned long linepixels = drm_rect_width(clip);
-	unsigned long lines = drm_rect_height(clip);
-	size_t sbuf_len = linepixels * fb->format->cpp[0];
+	unsigned long pixels = drm_rect_width(src_clip);
+	unsigned long lines = drm_rect_height(src_clip);
+	size_t sbuf_len = pixels * src_pixsize;
 	void *stmp = NULL;
 	unsigned long i;
 	const void *sbuf;
@@ -200,47 +199,46 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 	 * caching, so reads are uncached. Speed up access by fetching
 	 * one line at a time.
 	 */
-	if (!vaddr_cached_hint) {
+	if (!src_cached_hint) {
 		stmp = drm_format_conv_state_reserve(state, sbuf_len, GFP_KERNEL);
 		if (!stmp)
 			return -ENOMEM;
 	}
 
 	if (!dst_pitch)
-		dst_pitch = drm_rect_width(clip) * dst_pixsize;
-	vaddr += clip_offset(clip, fb->pitches[0], fb->format->cpp[0]);
+		dst_pitch = pixels * dst_pixsize;
+	src += clip_offset(src_clip, src_pitch, src_pixsize);
 
 	for (i = 0; i < lines; ++i) {
 		if (stmp)
-			sbuf = memcpy(stmp, vaddr, sbuf_len);
+			sbuf = memcpy(stmp, src, sbuf_len);
 		else
-			sbuf = vaddr;
-		xfrm_line(dst, sbuf, linepixels);
-		vaddr += fb->pitches[0];
+			sbuf = src;
+		xfrm_line(dst, sbuf, pixels);
+		src += src_pitch;
 		dst += dst_pitch;
 	}
 
 	return 0;
 }
 
-/* TODO: Make this function work with multi-plane formats. */
 static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
-			      const void *vaddr, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip, bool vaddr_cached_hint,
+			      const void *src, unsigned long src_pitch, unsigned long src_pixsize,
+			      const struct drm_rect *src_clip, bool src_cached_hint,
 			      struct drm_format_conv_state *state,
 			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
-	unsigned long linepixels = drm_rect_width(clip);
-	unsigned long lines = drm_rect_height(clip);
-	size_t dbuf_len = linepixels * dst_pixsize;
+	unsigned long npixels = drm_rect_width(src_clip);
+	unsigned long lines = drm_rect_height(src_clip);
+	size_t dbuf_len = npixels * dst_pixsize;
 	size_t stmp_off = round_up(dbuf_len, ARCH_KMALLOC_MINALIGN); /* for sbuf alignment */
-	size_t sbuf_len = linepixels * fb->format->cpp[0];
+	size_t sbuf_len = npixels * src_pixsize;
 	void *stmp = NULL;
 	unsigned long i;
 	const void *sbuf;
 	void *dbuf;
 
-	if (vaddr_cached_hint) {
+	if (src_cached_hint) {
 		dbuf = drm_format_conv_state_reserve(state, dbuf_len, GFP_KERNEL);
 	} else {
 		dbuf = drm_format_conv_state_reserve(state, stmp_off + sbuf_len, GFP_KERNEL);
@@ -250,17 +248,17 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 		return -ENOMEM;
 
 	if (!dst_pitch)
-		dst_pitch = linepixels * dst_pixsize;
-	vaddr += clip_offset(clip, fb->pitches[0], fb->format->cpp[0]);
+		dst_pitch = npixels * dst_pixsize;
+	src += clip_offset(src_clip, src_pitch, src_pixsize);
 
 	for (i = 0; i < lines; ++i) {
 		if (stmp)
-			sbuf = memcpy(stmp, vaddr, sbuf_len);
+			sbuf = memcpy(stmp, src, sbuf_len);
 		else
-			sbuf = vaddr;
-		xfrm_line(dbuf, sbuf, linepixels);
+			sbuf = src;
+		xfrm_line(dbuf, sbuf, npixels);
 		memcpy_toio(dst, dbuf, dbuf_len);
-		vaddr += fb->pitches[0];
+		src += src_pitch;
 		dst += dst_pitch;
 	}
 
@@ -284,13 +282,15 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 
 	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
-		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					  src[0].vaddr, fb, clip, vaddr_cached_hint, state,
-					  xfrm_line);
+		return __drm_fb_xfrm_toio(
+			dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+			src[0].vaddr, fb->pitches[0], fb->format->cpp[0],
+			clip, vaddr_cached_hint, state, xfrm_line);
 	else
-		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				     src[0].vaddr, fb, clip, vaddr_cached_hint, state,
-				     xfrm_line);
+		return __drm_fb_xfrm(
+			dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+			src[0].vaddr, fb->pitches[0], fb->format->cpp[0],
+			clip, vaddr_cached_hint, state, xfrm_line);
 }
 
 /**
-- 
2.43.0

