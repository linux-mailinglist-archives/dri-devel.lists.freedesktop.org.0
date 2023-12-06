Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBD80713F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CFE10E723;
	Wed,  6 Dec 2023 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C0E10E723
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:51:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9CEC1FD10;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701870716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtSb+GHm49vGXRBTa9iiwuA5gsatovU4Rk3wWkhJi+Y=;
 b=Z27BKLGPeiagG8Ldxmum/a+KPBX+EKBKwdqO0I73C+Xsp2kgE+CKm/r7BurZ+b8cD4yIQN
 kIpfcSovlJq7Ch0ry+Y+Myf+D9i+bJ0SywYVG4O5ikNPJDIRwetXSnrGbF9h7e+sw7Zi0y
 2usS7rlqS9SD62u9u6shR2nXdLR66II=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701870716;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtSb+GHm49vGXRBTa9iiwuA5gsatovU4Rk3wWkhJi+Y=;
 b=mHmAeiLoYKEHZ9NsUJUFnXfEE/XfwnoolwxIwthLJzqZOGFlckWzeQMdKVYoZ6CT94+iOg
 i6AhlFPuIpROWlDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B3993133DD;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YHiOKnx8cGWVBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 13:51:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Subject: [PATCH v3 3/4] fbdev/vesafb: Replace references to global screen_info
 by local pointer
Date: Wed,  6 Dec 2023 14:50:28 +0100
Message-ID: <20231206135153.2599-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>
References: <20231206135153.2599-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: -2.10
X-Spamd-Result: default: False [-2.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the global screen_info's address once and access the data via
this pointer. Limits the use of global state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/vesafb.c | 66 +++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index c0edceea0a79..ea89accbec38 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -243,6 +243,7 @@ static int vesafb_setup(char *options)
 
 static int vesafb_probe(struct platform_device *dev)
 {
+	struct screen_info *si = &screen_info;
 	struct fb_info *info;
 	struct vesafb_par *par;
 	int i, err;
@@ -255,17 +256,17 @@ static int vesafb_probe(struct platform_device *dev)
 	fb_get_options("vesafb", &option);
 	vesafb_setup(option);
 
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_VLFB)
+	if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
 		return -ENODEV;
 
-	vga_compat = (screen_info.capabilities & 2) ? 0 : 1;
-	vesafb_fix.smem_start = screen_info.lfb_base;
-	vesafb_defined.bits_per_pixel = screen_info.lfb_depth;
+	vga_compat = (si->capabilities & 2) ? 0 : 1;
+	vesafb_fix.smem_start = si->lfb_base;
+	vesafb_defined.bits_per_pixel = si->lfb_depth;
 	if (15 == vesafb_defined.bits_per_pixel)
 		vesafb_defined.bits_per_pixel = 16;
-	vesafb_defined.xres = screen_info.lfb_width;
-	vesafb_defined.yres = screen_info.lfb_height;
-	vesafb_fix.line_length = screen_info.lfb_linelength;
+	vesafb_defined.xres = si->lfb_width;
+	vesafb_defined.yres = si->lfb_height;
+	vesafb_fix.line_length = si->lfb_linelength;
 	vesafb_fix.visual   = (vesafb_defined.bits_per_pixel == 8) ?
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_TRUECOLOR;
 
@@ -277,7 +278,7 @@ static int vesafb_probe(struct platform_device *dev)
 	/*   size_total -- all video memory we have. Used for mtrr
 	 *                 entries, resource allocation and bounds
 	 *                 checking. */
-	size_total = screen_info.lfb_size * 65536;
+	size_total = si->lfb_size * 65536;
 	if (vram_total)
 		size_total = vram_total * 1024 * 1024;
 	if (size_total < size_vmode)
@@ -297,7 +298,7 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_fix.smem_len = size_remap;
 
 #ifndef __i386__
-	screen_info.vesapm_seg = 0;
+	si->vesapm_seg = 0;
 #endif
 
 	if (!request_mem_region(vesafb_fix.smem_start, size_total, "vesafb")) {
@@ -317,23 +318,26 @@ static int vesafb_probe(struct platform_device *dev)
 	par = info->par;
 	info->pseudo_palette = par->pseudo_palette;
 
-	par->base = screen_info.lfb_base;
+	par->base = si->lfb_base;
 	par->size = size_total;
 
 	printk(KERN_INFO "vesafb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
-	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel, vesafb_fix.line_length, screen_info.pages);
+	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel,
+	       vesafb_fix.line_length, si->pages);
 
-	if (screen_info.vesapm_seg) {
+	if (si->vesapm_seg) {
 		printk(KERN_INFO "vesafb: protected mode interface info at %04x:%04x\n",
-		       screen_info.vesapm_seg,screen_info.vesapm_off);
+		       si->vesapm_seg, si->vesapm_off);
 	}
 
-	if (screen_info.vesapm_seg < 0xc000)
+	if (si->vesapm_seg < 0xc000)
 		ypan = pmi_setpal = 0; /* not available or some DOS TSR ... */
 
 	if (ypan || pmi_setpal) {
+		unsigned long pmi_phys;
 		unsigned short *pmi_base;
-		pmi_base  = (unsigned short*)phys_to_virt(((unsigned long)screen_info.vesapm_seg << 4) + screen_info.vesapm_off);
+		pmi_phys  = ((unsigned long)si->vesapm_seg << 4) + si->vesapm_off;
+		pmi_base  = (unsigned short *)phys_to_virt(pmi_phys);
 		pmi_start = (void*)((char*)pmi_base + pmi_base[1]);
 		pmi_pal   = (void*)((char*)pmi_base + pmi_base[2]);
 		printk(KERN_INFO "vesafb: pmi: set display start = %p, set palette = %p\n",pmi_start,pmi_pal);
@@ -377,14 +381,14 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_defined.left_margin  = (vesafb_defined.xres / 8) & 0xf8;
 	vesafb_defined.hsync_len    = (vesafb_defined.xres / 8) & 0xf8;
 
-	vesafb_defined.red.offset    = screen_info.red_pos;
-	vesafb_defined.red.length    = screen_info.red_size;
-	vesafb_defined.green.offset  = screen_info.green_pos;
-	vesafb_defined.green.length  = screen_info.green_size;
-	vesafb_defined.blue.offset   = screen_info.blue_pos;
-	vesafb_defined.blue.length   = screen_info.blue_size;
-	vesafb_defined.transp.offset = screen_info.rsvd_pos;
-	vesafb_defined.transp.length = screen_info.rsvd_size;
+	vesafb_defined.red.offset    = si->red_pos;
+	vesafb_defined.red.length    = si->red_size;
+	vesafb_defined.green.offset  = si->green_pos;
+	vesafb_defined.green.length  = si->green_size;
+	vesafb_defined.blue.offset   = si->blue_pos;
+	vesafb_defined.blue.length   = si->blue_size;
+	vesafb_defined.transp.offset = si->rsvd_pos;
+	vesafb_defined.transp.length = si->rsvd_size;
 
 	if (vesafb_defined.bits_per_pixel <= 8) {
 		depth = vesafb_defined.green.length;
@@ -399,14 +403,14 @@ static int vesafb_probe(struct platform_device *dev)
 	       (vesafb_defined.bits_per_pixel > 8) ?
 	       "Truecolor" : (vga_compat || pmi_setpal) ?
 	       "Pseudocolor" : "Static Pseudocolor",
-	       screen_info.rsvd_size,
-	       screen_info.red_size,
-	       screen_info.green_size,
-	       screen_info.blue_size,
-	       screen_info.rsvd_pos,
-	       screen_info.red_pos,
-	       screen_info.green_pos,
-	       screen_info.blue_pos);
+	       si->rsvd_size,
+	       si->red_size,
+	       si->green_size,
+	       si->blue_size,
+	       si->rsvd_pos,
+	       si->red_pos,
+	       si->green_pos,
+	       si->blue_pos);
 
 	vesafb_fix.ypanstep  = ypan     ? 1 : 0;
 	vesafb_fix.ywrapstep = (ypan>1) ? 1 : 0;
-- 
2.43.0

