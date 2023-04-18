Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61D6E6C24
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77D10E861;
	Tue, 18 Apr 2023 18:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A2910E83E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 18:34:50 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-acs-24-144-188-133.zoominternet.net [24.144.188.133])
 by mailbackend.panix.com (Postfix) with ESMTPSA id 4Q1CJS0Dh5z3vh7;
 Tue, 18 Apr 2023 14:34:47 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681842888; bh=HVoOAOXiW8FIexKIWfy7EdgUgQ8uzlULpDO2G8mraJI=;
 h=From:To:Cc:Subject:Date;
 b=ZYCWUMKCkO+hDrx6755Jtj/I8kTXaA8G5kNO5NjR/stDlUW0YIteInSz3MPoq5Q1T
 zNe6UIXNKeOph1Bolao0DCHHtzFkjp2l6SPCh856BaLFpfNGzbMc5L1QmAe1nNkMqe
 ZdO9peT/rKUnE2Nkg8zmZLWkZj/KuB2yXEcewlc4=
From: Pierre Asselin <pa@panix.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] firmware/sysfb: Fix VESA format selection
Date: Tue, 18 Apr 2023 14:33:25 -0400
Message-Id: <20230418183325.2327-1-pa@panix.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Pierre Asselin <pa@panix.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some legacy BIOSes report no reserved bits in their 32-bit rgb mode,
breaking the calculation of bits_per_pixel in commit f35cd3fa7729
[firmware/sysfb: Fix EFI/VESA format selection].  However they report
lfb_depth correctly for those modes.  Recompute bits_per_pixel from the
color and reserved bit numbers and positions, but also from lfb_depth,
keeping the larger result.

Link: https://lore.kernel.org/r/4Psm6B6Lqkz1QXM@panix3.panix.com
Link: https://lore.kernel.org/r/20230412150225.3757223-1-javierm@redhat.com
Fixes: f35cd3fa7729 [firmware/sysfb: Fix EFI/VESA format selection]
Signed-off-by: Pierre Asselin <pa@panix.com>
---
 drivers/firmware/sysfb_simplefb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..05dc25a524c8 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -51,15 +51,17 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	 *
 	 * It's not easily possible to fix this in struct screen_info,
 	 * as this could break UAPI. The best solution is to compute
-	 * bits_per_pixel here and ignore lfb_depth. In the loop below,
+	 * bits_per_pixel from the color bits, reserved bits and
+	 * reported lfb_depth, whichever is highest.  In the loop below,
 	 * ignore simplefb formats with alpha bits, as EFI and VESA
 	 * don't specify alpha channels.
 	 */
 	if (si->lfb_depth > 8) {
-		bits_per_pixel = max(max3(si->red_size + si->red_pos,
+		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
 					  si->green_size + si->green_pos,
 					  si->blue_size + si->blue_pos),
-				     si->rsvd_size + si->rsvd_pos);
+				     si->rsvd_size + si->rsvd_pos,
+				     si->lfb_depth);
 	} else {
 		bits_per_pixel = si->lfb_depth;
 	}
-- 
2.39.2

