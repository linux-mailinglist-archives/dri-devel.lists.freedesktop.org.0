Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7081A01D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A010E58F;
	Wed, 20 Dec 2023 13:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D97610E579
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:46:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D2641F831;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/4ct0iSeQF0Ky9ZBwzVlmeP0hs7U6lkwZguG+4N5t4=;
 b=BoMCbXoNdxUjaqvUSfqG6L8aRkifyotgB4/PtqKzn0T2sr6FjycRkHoXl01F2kisBDvrkx
 GhhNJIsGLWdnfTEw1s979eB0S7UWnF2uCs5XmdGHy/kiryQjd7cJAXL0jTpXnlTkuEYjB2
 vS1GIVfN+z0iYt9G8ook2LNmJZPojeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/4ct0iSeQF0Ky9ZBwzVlmeP0hs7U6lkwZguG+4N5t4=;
 b=4SuhF5+6tWg8QatyEj2/O3ZJdvJV9Vf81wmgYorFyUEvrmNXGPRDhn45KUIOR3OYn83r//
 sPr10+2M7ozTwFDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/4ct0iSeQF0Ky9ZBwzVlmeP0hs7U6lkwZguG+4N5t4=;
 b=BoMCbXoNdxUjaqvUSfqG6L8aRkifyotgB4/PtqKzn0T2sr6FjycRkHoXl01F2kisBDvrkx
 GhhNJIsGLWdnfTEw1s979eB0S7UWnF2uCs5XmdGHy/kiryQjd7cJAXL0jTpXnlTkuEYjB2
 vS1GIVfN+z0iYt9G8ook2LNmJZPojeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/4ct0iSeQF0Ky9ZBwzVlmeP0hs7U6lkwZguG+4N5t4=;
 b=4SuhF5+6tWg8QatyEj2/O3ZJdvJV9Vf81wmgYorFyUEvrmNXGPRDhn45KUIOR3OYn83r//
 sPr10+2M7ozTwFDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D62513BA9;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sM+hFUfwgmWZJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH 2/4] fbdev/stifb: Allocate fb_info instance with
 framebuffer_alloc()
Date: Wed, 20 Dec 2023 14:22:55 +0100
Message-ID: <20231220134639.8190-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134639.8190-1-tzimmermann@suse.de>
References: <20231220134639.8190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.90
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate stifb's instance of fb_info with framebuffer_alloc(). This
is the preferred way of creating fb_info with associated driver data
stored in struct fb_info.par. Requires several, but minor, changes
through out the driver's code.

The intended side effect of this patch is that the new instance of
struct fb_info now has its device field correctly set to the parent
device of the STI ROM. A later patch can detect if the device is the
firmware's primary output. It is also now correctly located within
the Linux device hierarchy.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/stifb.c | 106 +++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 50 deletions(-)

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 548d992f8cb1..36e6bcab83aa 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -103,7 +103,7 @@ typedef struct {
 } ngle_rom_t;
 
 struct stifb_info {
-	struct fb_info info;
+	struct fb_info *info;
 	unsigned int id;
 	ngle_rom_t ngle_rom;
 	struct sti_struct *sti;
@@ -153,15 +153,15 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS];
 #define REG_44		0x210030
 #define REG_45		0x210034
 
-#define READ_BYTE(fb,reg)		gsc_readb((fb)->info.fix.mmio_start + (reg))
-#define READ_WORD(fb,reg)		gsc_readl((fb)->info.fix.mmio_start + (reg))
+#define READ_BYTE(fb, reg)		gsc_readb((fb)->info->fix.mmio_start + (reg))
+#define READ_WORD(fb, reg)		gsc_readl((fb)->info->fix.mmio_start + (reg))
 
 
 #ifndef DEBUG_STIFB_REGS
 # define  DEBUG_OFF()
 # define  DEBUG_ON()
-# define WRITE_BYTE(value,fb,reg)	gsc_writeb((value),(fb)->info.fix.mmio_start + (reg))
-# define WRITE_WORD(value,fb,reg)	gsc_writel((value),(fb)->info.fix.mmio_start + (reg))
+# define WRITE_BYTE(value, fb, reg)	gsc_writeb((value), (fb)->info->fix.mmio_start + (reg))
+# define WRITE_WORD(value, fb, reg)	gsc_writel((value), (fb)->info->fix.mmio_start + (reg))
 #else
   static int debug_on = 1;
 # define  DEBUG_OFF() debug_on=0
@@ -169,11 +169,11 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS];
 # define WRITE_BYTE(value,fb,reg)	do { if (debug_on) \
 						printk(KERN_DEBUG "%30s: WRITE_BYTE(0x%06x) = 0x%02x (old=0x%02x)\n", \
 							__func__, reg, value, READ_BYTE(fb,reg)); 		  \
-					gsc_writeb((value),(fb)->info.fix.mmio_start + (reg)); } while (0)
+					gsc_writeb((value), (fb)->info->fix.mmio_start + (reg)); } while (0)
 # define WRITE_WORD(value,fb,reg)	do { if (debug_on) \
 						printk(KERN_DEBUG "%30s: WRITE_WORD(0x%06x) = 0x%08x (old=0x%08x)\n", \
 							__func__, reg, value, READ_WORD(fb,reg)); 		  \
-					gsc_writel((value),(fb)->info.fix.mmio_start + (reg)); } while (0)
+					gsc_writel((value), (fb)->info->fix.mmio_start + (reg)); } while (0)
 #endif /* DEBUG_STIFB_REGS */
 
 
@@ -210,13 +210,13 @@ SETUP_FB(struct stifb_info *fb)
 			reg10_value = 0x13601000;
 			break;
 		case S9000_ID_A1439A:
-			if (fb->info.var.bits_per_pixel == 32)
+			if (fb->info->var.bits_per_pixel == 32)
 				reg10_value = 0xBBA0A000;
 			else
 				reg10_value = 0x13601000;
 			break;
 		case S9000_ID_HCRX:
-			if (fb->info.var.bits_per_pixel == 32)
+			if (fb->info->var.bits_per_pixel == 32)
 				reg10_value = 0xBBA0A000;
 			else
 				reg10_value = 0x13602000;
@@ -254,7 +254,7 @@ static void
 FINISH_IMAGE_COLORMAP_ACCESS(struct stifb_info *fb)
 {
 	WRITE_WORD(0x400, fb, REG_2);
-	if (fb->info.var.bits_per_pixel == 32) {
+	if (fb->info->var.bits_per_pixel == 32) {
 		WRITE_WORD(0x83000100, fb, REG_1);
 	} else {
 		if (fb->id == S9000_ID_ARTIST || fb->id == CRT_ID_VISUALIZE_EG)
@@ -503,7 +503,7 @@ static void
 ngleSetupAttrPlanes(struct stifb_info *fb, int BufferNumber)
 {
 	SETUP_ATTR_ACCESS(fb, BufferNumber);
-	SET_ATTR_SIZE(fb, fb->info.var.xres, fb->info.var.yres);
+	SET_ATTR_SIZE(fb, fb->info->var.xres, fb->info->var.yres);
 	FINISH_ATTR_ACCESS(fb);
 	SETUP_FB(fb);
 }
@@ -526,9 +526,9 @@ rattlerSetupPlanes(struct stifb_info *fb)
 	SETUP_FB(fb);
 	fb->id = saved_id;
 
-	for (y = 0; y < fb->info.var.yres; ++y)
-		fb_memset_io(fb->info.screen_base + y * fb->info.fix.line_length,
-			     0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
+	for (y = 0; y < fb->info->var.yres; ++y)
+		fb_memset_io(fb->info->screen_base + y * fb->info->fix.line_length,
+			     0xff, fb->info->var.xres * fb->info->var.bits_per_pixel/8);
 
 	CRX24_SET_OVLY_MASK(fb);
 	SETUP_FB(fb);
@@ -607,7 +607,7 @@ setHyperLutBltCtl(struct stifb_info *fb, int offsetWithinLut, int length)
 	lutBltCtl.fields.lutType = HYPER_CMAP_TYPE;
 
 	/* Expect lutIndex to be 0 or 1 for image cmaps, 2 or 3 for overlay cmaps */
-	if (fb->info.var.bits_per_pixel == 8)
+	if (fb->info->var.bits_per_pixel == 8)
 		lutBltCtl.fields.lutOffset = 2 * 256;
 	else
 		lutBltCtl.fields.lutOffset = 0 * 256;
@@ -688,7 +688,7 @@ ngleResetAttrPlanes(struct stifb_info *fb, unsigned int ctlPlaneReg)
 					       DataDynamic, MaskOtc,
 					       BGx(0), FGx(0)));
 	packed_dst = 0;
-	packed_len = (fb->info.var.xres << 16) | fb->info.var.yres;
+	packed_len = (fb->info->var.xres << 16) | fb->info->var.yres;
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 2);
 	NGLE_SET_DSTXY(fb, packed_dst);
 	SET_LENXY_START_RECFILL(fb, packed_len);
@@ -738,7 +738,7 @@ ngleClearOverlayPlanes(struct stifb_info *fb, int mask, int data)
         NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, mask);
 
         packed_dst = 0;
-        packed_len = (fb->info.var.xres << 16) | fb->info.var.yres;
+	packed_len = (fb->info->var.xres << 16) | fb->info->var.yres;
         NGLE_SET_DSTXY(fb, packed_dst);
 
 	/* Write zeroes to overlay planes */
@@ -760,7 +760,7 @@ hyperResetPlanes(struct stifb_info *fb, int enable)
 	NGLE_LOCK(fb);
 
 	if (IS_24_DEVICE(fb))
-		if (fb->info.var.bits_per_pixel == 32)
+		if (fb->info->var.bits_per_pixel == 32)
 			controlPlaneReg = 0x04000F00;
 		else
 			controlPlaneReg = 0x00000F00;   /* 0x00000800 should be enough, but lets clear all 4 bits */
@@ -890,7 +890,7 @@ SETUP_HCRX(struct stifb_info *fb)
 	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 7);
 
 	if (IS_24_DEVICE(fb)) {
-		hyperbowl = (fb->info.var.bits_per_pixel == 32) ?
+		hyperbowl = (fb->info->var.bits_per_pixel == 32) ?
 			HYPERBOWL_MODE01_8_24_LUT0_TRANSPARENT_LUT1_OPAQUE :
 			HYPERBOWL_MODE01_8_24_LUT0_OPAQUE_LUT1_OPAQUE;
 
@@ -924,21 +924,21 @@ SETUP_HCRX(struct stifb_info *fb)
 static int
 stifb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
-	struct stifb_info *fb = container_of(info, struct stifb_info, info);
+	struct stifb_info *fb = info->par;
 
-	if (var->xres != fb->info.var.xres ||
-	    var->yres != fb->info.var.yres ||
-	    var->bits_per_pixel != fb->info.var.bits_per_pixel)
+	if (var->xres != fb->info->var.xres ||
+	    var->yres != fb->info->var.yres ||
+	    var->bits_per_pixel != fb->info->var.bits_per_pixel)
 		return -EINVAL;
 
 	var->xres_virtual = var->xres;
 	var->yres_virtual = var->yres;
 	var->xoffset = 0;
 	var->yoffset = 0;
-	var->grayscale = fb->info.var.grayscale;
-	var->red.length = fb->info.var.red.length;
-	var->green.length = fb->info.var.green.length;
-	var->blue.length = fb->info.var.blue.length;
+	var->grayscale = fb->info->var.grayscale;
+	var->red.length = fb->info->var.red.length;
+	var->green.length = fb->info->var.green.length;
+	var->blue.length = fb->info->var.blue.length;
 
 	return 0;
 }
@@ -947,7 +947,7 @@ static int
 stifb_setcolreg(u_int regno, u_int red, u_int green,
 	      u_int blue, u_int transp, struct fb_info *info)
 {
-	struct stifb_info *fb = container_of(info, struct stifb_info, info);
+	struct stifb_info *fb = info->par;
 	u32 color;
 
 	if (regno >= NR_PALETTE)
@@ -961,7 +961,7 @@ stifb_setcolreg(u_int regno, u_int red, u_int green,
 
 	START_IMAGE_COLORMAP_ACCESS(fb);
 
-	if (unlikely(fb->info.var.grayscale)) {
+	if (unlikely(fb->info->var.grayscale)) {
 		/* gray = 0.30*R + 0.59*G + 0.11*B */
 		color = ((red * 77) +
 			 (green * 151) +
@@ -972,10 +972,10 @@ stifb_setcolreg(u_int regno, u_int red, u_int green,
 			 (blue));
 	}
 
-	if (fb->info.fix.visual == FB_VISUAL_DIRECTCOLOR) {
-		struct fb_var_screeninfo *var = &fb->info.var;
+	if (fb->info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
+		struct fb_var_screeninfo *var = &fb->info->var;
 		if (regno < 16)
-			((u32 *)fb->info.pseudo_palette)[regno] =
+			((u32 *)fb->info->pseudo_palette)[regno] =
 				regno << var->red.offset |
 				regno << var->green.offset |
 				regno << var->blue.offset;
@@ -1007,7 +1007,7 @@ stifb_setcolreg(u_int regno, u_int red, u_int green,
 static int
 stifb_blank(int blank_mode, struct fb_info *info)
 {
-	struct stifb_info *fb = container_of(info, struct stifb_info, info);
+	struct stifb_info *fb = info->par;
 	int enable = (blank_mode == 0) ? ENABLE : DISABLE;
 
 	switch (fb->id) {
@@ -1036,12 +1036,12 @@ stifb_blank(int blank_mode, struct fb_info *info)
 static void
 stifb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 {
-	struct stifb_info *fb = container_of(info, struct stifb_info, info);
+	struct stifb_info *fb = info->par;
 
 	SETUP_COPYAREA(fb);
 
 	SETUP_HW(fb);
-	if (fb->info.var.bits_per_pixel == 32) {
+	if (fb->info->var.bits_per_pixel == 32) {
 		WRITE_WORD(0xBBA0A000, fb, REG_10);
 
 		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xffffffff);
@@ -1075,15 +1075,15 @@ stifb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 static void
 stifb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 {
-	struct stifb_info *fb = container_of(info, struct stifb_info, info);
+	struct stifb_info *fb = info->par;
 
 	if (rect->rop != ROP_COPY ||
-	    (fb->id == S9000_ID_HCRX && fb->info.var.bits_per_pixel == 32))
+	    (fb->id == S9000_ID_HCRX && fb->info->var.bits_per_pixel == 32))
 		return cfb_fillrect(info, rect);
 
 	SETUP_HW(fb);
 
-	if (fb->info.var.bits_per_pixel == 32) {
+	if (fb->info->var.bits_per_pixel == 32) {
 		WRITE_WORD(0xBBA0A000, fb, REG_10);
 
 		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xffffffff);
@@ -1141,7 +1141,7 @@ stifb_init_display(struct stifb_info *fb)
         switch (id) {
 	 case S9000_ID_A1659A:
 	 case S9000_ID_A1439A:
-	    if (fb->info.var.bits_per_pixel == 32)
+	    if (fb->info->var.bits_per_pixel == 32)
 		ngleSetupAttrPlanes(fb, BUFF1_CMAP3);
 	    else {
 		ngleSetupAttrPlanes(fb, BUFF1_CMAP0);
@@ -1151,7 +1151,7 @@ stifb_init_display(struct stifb_info *fb)
 	    break;
 	 case S9000_ID_ARTIST:
 	 case CRT_ID_VISUALIZE_EG:
-	    if (fb->info.var.bits_per_pixel == 32)
+	    if (fb->info->var.bits_per_pixel == 32)
 		ngleSetupAttrPlanes(fb, BUFF1_CMAP3);
 	    else {
 		ngleSetupAttrPlanes(fb, ARTIST_CMAP0);
@@ -1193,11 +1193,11 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 	char *dev_name;
 	int bpp, xres, yres;
 
-	fb = kzalloc(sizeof(*fb), GFP_ATOMIC);
-	if (!fb)
+	info = framebuffer_alloc(sizeof(*fb), sti->dev);
+	if (!info)
 		return -ENOMEM;
-
-	info = &fb->info;
+	fb = info->par;
+	fb->info = info;
 
 	/* set struct to a known state */
 	fix = &info->fix;
@@ -1390,10 +1390,10 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 
 	/* save for primary gfx device detection & unregister_framebuffer() */
 	sti->info = info;
-	if (register_framebuffer(&fb->info) < 0)
+	if (register_framebuffer(fb->info) < 0)
 		goto out_err4;
 
-	fb_info(&fb->info, "%s %dx%d-%d frame buffer device, %s, id: %04x, mmio: 0x%04lx\n",
+	fb_info(fb->info, "%s %dx%d-%d frame buffer device, %s, id: %04x, mmio: 0x%04lx\n",
 		fix->id,
 		var->xres,
 		var->yres,
@@ -1402,6 +1402,8 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 		fb->id,
 		fix->mmio_start);
 
+	dev_set_drvdata(sti->dev, info);
+
 	return 0;
 
 
@@ -1414,7 +1416,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
 out_err1:
 	iounmap(info->screen_base);
 out_err0:
-	kfree(fb);
+	framebuffer_release(info);
 	sti->info = NULL;
 	return -ENXIO;
 }
@@ -1480,15 +1482,19 @@ stifb_cleanup(void)
 		sti = sti_get_rom(i);
 		if (!sti)
 			break;
-		if (sti->info) {
-			struct fb_info *info = sti->info;
-			unregister_framebuffer(sti->info);
+		if (sti->dev) {
+			struct fb_info *info = dev_get_drvdata(sti->dev);
+
+			if (!info)
+				continue;
+			unregister_framebuffer(info);
 			release_mem_region(info->fix.mmio_start, info->fix.mmio_len);
 		        release_mem_region(info->fix.smem_start, info->fix.smem_len);
 				if (info->screen_base)
 					iounmap(info->screen_base);
 		        fb_dealloc_cmap(&info->cmap);
 		        framebuffer_release(info);
+			dev_set_drvdata(sti->dev, NULL);
 		}
 		sti->info = NULL;
 	}
-- 
2.43.0

