Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B5165245C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC72710E0AB;
	Tue, 20 Dec 2022 16:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240DE10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:12:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B0F1A7648D;
 Tue, 20 Dec 2022 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s51YgswsA65k7RqEDaZ5MlIwPUtm27xSFuwQS1tvsxI=;
 b=RHhMXjGc0YQHrdo0n5fJLtaNsejaMrl04/jfZKCB/0hPp8oHbXMjkPrFIPGKOY3jezmRB6
 EtJGOiGxOHsfET7Z9Mz+XEkijLEQnYGw71fUkAuVhJo9letA/CpuC3nzGUmC2rH5J53stS
 4HmS/wac/KrJKHygGsrXtyAPc6IwPOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s51YgswsA65k7RqEDaZ5MlIwPUtm27xSFuwQS1tvsxI=;
 b=aZLBASOKhCrdupL1QHi0JSY+QnDrnT0jK7KmHPZ6R3XEfjQqV9Wbedb6auqcJ+fS3TBhCs
 OMcIhxlzQzEceKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88F9D13910;
 Tue, 20 Dec 2022 16:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oKSzIMXeoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 01/13] firmware/sysfb: Fix EFI/VESA format selection
Date: Tue, 20 Dec 2022 17:11:33 +0100
Message-Id: <20221220161145.27568-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220161145.27568-1-tzimmermann@suse.de>
References: <20221220161145.27568-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Select color format for EFI/VESA firmware scanout buffer from the
number of bits per pixel and the position of the individual color
components. Fixes the selected format for the buffer in several odd
cases. For example, XRGB1555 has been reported as ARGB1555 because
of the different use of depth and transparency in VESA and Linux.

Bits-per-pixel is always the pixel's raw number of bits; including
alpha and filler bits. It is preferred over color depth, which has a
different meaning among various components and standards.

Also do not compare reserved bits and transparency bits to each other.
These values have different meanings, as reserved bits include filler
bits while transparency does not.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb_simplefb.c | 43 ++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index a353e27f83f5..ce9c007ed66f 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -27,25 +27,56 @@ static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 __init bool sysfb_parse_mode(const struct screen_info *si,
 			     struct simplefb_platform_data *mode)
 {
-	const struct simplefb_format *f;
 	__u8 type;
+	u32 bits_per_pixel;
 	unsigned int i;
 
 	type = si->orig_video_isVGA;
 	if (type != VIDEO_TYPE_VLFB && type != VIDEO_TYPE_EFI)
 		return false;
 
+	/*
+	 * The meaning of depth and bpp for direct-color formats is
+	 * inconsistent:
+	 *
+	 *  - DRM format info specifies depth as the number of color
+	 *    bits; including alpha, but not including filler bits.
+	 *  - Linux' EFI platform code computes lfb_depth from the
+	 *    individual color channels, including the reserved bits.
+	 *  - VBE 1.1 defines lfb_depth for XRGB1555 as 16, but later
+	 *    versions use 15.
+	 *  - On the kernel command line, 'bpp' of 32 is usually
+	 *    XRGB8888 including the filler bits, but 15 is XRGB1555
+	 *    not including the filler bit.
+	 *
+	 * It's not easily possible to fix this in struct screen_info,
+	 * as this could break UAPI. The best solution is to compute
+	 * bits_per_pixel here and ignore lfb_depth. In the loop below,
+	 * ignore simplefb formats with alpha bits, as EFI and VESA
+	 * don't specify alpha channels.
+	 */
+	if (si->lfb_depth > 8) {
+		bits_per_pixel = max(max3(si->red_size + si->red_pos,
+					  si->green_size + si->green_pos,
+					  si->blue_size + si->blue_pos),
+				     si->rsvd_size + si->rsvd_pos);
+	} else {
+		bits_per_pixel = si->lfb_depth;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
-		f = &formats[i];
-		if (si->lfb_depth == f->bits_per_pixel &&
+		const struct simplefb_format *f = &formats[i];
+
+		if (f->transp.length)
+			continue; /* transparent formats are unsupported by VESA/EFI */
+
+		if (bits_per_pixel == f->bits_per_pixel &&
 		    si->red_size == f->red.length &&
 		    si->red_pos == f->red.offset &&
 		    si->green_size == f->green.length &&
 		    si->green_pos == f->green.offset &&
 		    si->blue_size == f->blue.length &&
-		    si->blue_pos == f->blue.offset &&
-		    si->rsvd_size == f->transp.length &&
-		    si->rsvd_pos == f->transp.offset) {
+		    si->blue_pos == f->blue.offset) {
 			mode->format = f->name;
 			mode->width = si->lfb_width;
 			mode->height = si->lfb_height;
-- 
2.39.0

