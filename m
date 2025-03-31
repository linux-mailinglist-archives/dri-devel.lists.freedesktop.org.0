Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24581A76B79
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E31A10E43F;
	Mon, 31 Mar 2025 15:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6CD10E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 082891F74C;
 Mon, 31 Mar 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C046B13A56;
 Mon, 31 Mar 2025 15:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2A43Lce76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 13/18] firmware: sysfb: Move bpp-depth calculation into
 screen_info helper
Date: Mon, 31 Mar 2025 17:52:16 +0200
Message-ID: <20250331155538.1173333-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 082891F74C
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Move the calculation of the bits per pixels for screen_info into a
helper function. This will make it available to other callers besides
the firmware code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb_simplefb.c   | 31 +------------------------
 drivers/video/screen_info_generic.c | 36 +++++++++++++++++++++++++++++
 include/linux/screen_info.h         |  2 ++
 3 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 75a186bf8f8ec..592d8a6446192 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -35,36 +35,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	if (type != VIDEO_TYPE_VLFB && type != VIDEO_TYPE_EFI)
 		return false;
 
-	/*
-	 * The meaning of depth and bpp for direct-color formats is
-	 * inconsistent:
-	 *
-	 *  - DRM format info specifies depth as the number of color
-	 *    bits; including alpha, but not including filler bits.
-	 *  - Linux' EFI platform code computes lfb_depth from the
-	 *    individual color channels, including the reserved bits.
-	 *  - VBE 1.1 defines lfb_depth for XRGB1555 as 16, but later
-	 *    versions use 15.
-	 *  - On the kernel command line, 'bpp' of 32 is usually
-	 *    XRGB8888 including the filler bits, but 15 is XRGB1555
-	 *    not including the filler bit.
-	 *
-	 * It's not easily possible to fix this in struct screen_info,
-	 * as this could break UAPI. The best solution is to compute
-	 * bits_per_pixel from the color bits, reserved bits and
-	 * reported lfb_depth, whichever is highest.  In the loop below,
-	 * ignore simplefb formats with alpha bits, as EFI and VESA
-	 * don't specify alpha channels.
-	 */
-	if (si->lfb_depth > 8) {
-		bits_per_pixel = max(max3(si->red_size + si->red_pos,
-					  si->green_size + si->green_pos,
-					  si->blue_size + si->blue_pos),
-				     si->rsvd_size + si->rsvd_pos);
-		bits_per_pixel = max_t(u32, bits_per_pixel, si->lfb_depth);
-	} else {
-		bits_per_pixel = si->lfb_depth;
-	}
+	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
 
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		const struct simplefb_format *f = &formats[i];
diff --git a/drivers/video/screen_info_generic.c b/drivers/video/screen_info_generic.c
index 64117c6367abb..900e9386ecebd 100644
--- a/drivers/video/screen_info_generic.c
+++ b/drivers/video/screen_info_generic.c
@@ -144,3 +144,39 @@ ssize_t screen_info_resources(const struct screen_info *si, struct resource *r,
 	return pos - r;
 }
 EXPORT_SYMBOL(screen_info_resources);
+
+/*
+ * The meaning of depth and bpp for direct-color formats is
+ * inconsistent:
+ *
+ *  - DRM format info specifies depth as the number of color
+ *    bits; including alpha, but not including filler bits.
+ *  - Linux' EFI platform code computes lfb_depth from the
+ *    individual color channels, including the reserved bits.
+ *  - VBE 1.1 defines lfb_depth for XRGB1555 as 16, but later
+ *    versions use 15.
+ *  - On the kernel command line, 'bpp' of 32 is usually
+ *    XRGB8888 including the filler bits, but 15 is XRGB1555
+ *    not including the filler bit.
+ *
+ * It is not easily possible to fix this in struct screen_info,
+ * as this could break UAPI. The best solution is to compute
+ * bits_per_pixel from the color bits, reserved bits and
+ * reported lfb_depth, whichever is highest.
+ */
+
+u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si)
+{
+	u32 bits_per_pixel = si->lfb_depth;
+
+	if (bits_per_pixel > 8) {
+		bits_per_pixel = max(max3(si->red_size + si->red_pos,
+					  si->green_size + si->green_pos,
+					  si->blue_size + si->blue_pos),
+				     si->rsvd_size + si->rsvd_pos);
+		bits_per_pixel = max_t(u32, bits_per_pixel, si->lfb_depth);
+	}
+
+	return bits_per_pixel;
+}
+EXPORT_SYMBOL(__screen_info_lfb_bits_per_pixel);
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index 6a4a3cec4638b..ab3cffbb58b7f 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -128,6 +128,8 @@ static inline unsigned int screen_info_video_type(const struct screen_info *si)
 
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
+u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
+
 #if defined(CONFIG_PCI)
 void screen_info_apply_fixups(void);
 struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
-- 
2.49.0

