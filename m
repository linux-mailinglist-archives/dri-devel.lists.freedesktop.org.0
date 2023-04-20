Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BB6E98DC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530410E2D9;
	Thu, 20 Apr 2023 15:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2710E2D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:57:19 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-acs-24-144-188-133.zoominternet.net [24.144.188.133])
 by mailbackend.panix.com (Postfix) with ESMTPSA id 4Q2Mjm2J1Hz4DyN;
 Thu, 20 Apr 2023 11:57:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1682006237; bh=1bK3beiIYMDkKAWr24JOp3R+9BScfdHQ8MGrq6E9XVU=;
 h=From:To:Cc:Subject:Date;
 b=HVK5R5D1YC85Uuj7e8cp2RBxrGJw1djsuQJX3r0PRcbWIhasbviD5bXG0h9y4D1ZF
 25vS8oJMAqNsMELbrgWrc5guDsdyjqZs54W0YHR9WsbNbQiXcr9xnkUQqDq14aKBaS
 9vXxafcHsX9ZOxC28p0G76LHpVcBb060D8HkhFwU=
From: Pierre Asselin <pa@panix.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] firmware/sysfb: Fix VESA format selection
Date: Thu, 20 Apr 2023 11:57:05 -0400
Message-Id: <20230420155705.21463-1-pa@panix.com>
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
("firmware/sysfb: Fix EFI/VESA format selection").  However they report
lfb_depth correctly for those modes.  Keep the computation but
set bits_per_pixel to lfb_depth if the latter is larger.

v2 fixes the warnings from a max3() macro with arguments of different
types;  split the bits_per_pixel assignment to avoid uglyfing the code
with too many casts.

v3 fixes space and formatting blips pointed out by Javier, and change
the bit_per_pixel assignment back to a single statement using two casts.

Link: https://lore.kernel.org/r/4Psm6B6Lqkz1QXM@panix3.panix.com
Link: https://lore.kernel.org/r/20230412150225.3757223-1-javierm@redhat.com
Link: https://lore.kernel.org/dri-devel/20230418183325.2327-1-pa@panix.com/T/#u
Link: https://lore.kernel.org/dri-devel/20230419044834.10816-1-pa@panix.com/T/#u
Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
Signed-off-by: Pierre Asselin <pa@panix.com>
---
 drivers/firmware/sysfb_simplefb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..6f7c5d0c5090 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -51,15 +51,18 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
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
-					  si->green_size + si->green_pos,
-					  si->blue_size + si->blue_pos),
-				     si->rsvd_size + si->rsvd_pos);
+		/* max() macros args should be of the same type */
+		bits_per_pixel = max3((u16)max3(si->red_size + si->red_pos,
+					si->green_size + si->green_pos,
+					si->blue_size + si->blue_pos),
+				(u16)(si->rsvd_size + si->rsvd_pos),
+				si->lfb_depth);
 	} else {
 		bits_per_pixel = si->lfb_depth;
 	}

base-commit: 6a8f57ae2eb07ab39a6f0ccad60c760743051026
-- 
2.39.2

