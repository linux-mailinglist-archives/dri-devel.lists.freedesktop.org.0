Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6067FFD3
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 16:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B2210E0D0;
	Sun, 29 Jan 2023 15:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4E10E0D0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 15:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9241720101;
 Sun, 29 Jan 2023 16:17:41 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuEAmnVOOigS; Sun, 29 Jan 2023 16:17:41 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 69BB6200F3;
 Sun, 29 Jan 2023 16:17:41 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pM9R7-00GylW-03;
 Sun, 29 Jan 2023 16:17:41 +0100
Date: Sun, 29 Jan 2023 16:17:40 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Subject: [PATCHv2] fbcon: Check font dimension limits
Message-ID: <20230129151740.x5p7jj2pbuilpzzt@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

blit_x and blit_y are u32, so fbcon currently cannot support fonts
larger than 32x32.

The 32x32 case also needs shifting an unsigned int, to properly set bit
31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
as reported on:

http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com
Kernel Branch: 6.2.0-rc5-next-20230124
Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing

Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Fixes: 2d2699d98492 ("fbcon: font setting should check limitation of driver")
Cc: stable@vger.kernel.org

---
v1 -> v2:
- Use BIT macro instead of fixing bit test by hand.
- Add Fixes and Cc: stable headers.

Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
===================================================================
--- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
+++ linux-6.0/drivers/video/fbdev/core/fbcon.c
@@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
 	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
 		return -EINVAL;
 
+	if (font->width > 32 || font->height > 32)
+		return -EINVAL;
+
 	/* Make sure drawing engine can handle the font */
-	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
-	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
+	if (!(info->pixmap.blit_x & BIT(font->width - 1)) ||
+	    !(info->pixmap.blit_y & BIT(font->height - 1)))
 		return -EINVAL;
 
 	/* Make sure driver can handle the font length */
