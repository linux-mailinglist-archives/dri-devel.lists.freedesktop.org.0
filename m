Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489EA78C9C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1D810E749;
	Wed,  2 Apr 2025 10:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKf6xvvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212AD10E747;
 Wed,  2 Apr 2025 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743590753; x=1775126753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E3E4jrkcgKZP+jtjSakxEt2gRARF4Mml1mpUxLd9sNk=;
 b=lKf6xvvgpzMT2q0ut5X5cArO08e/TgV9h/N7bBWnetflsse9BxSRWj2b
 +Pn/MFaHGAhaLjnNCTe4b5+bFJiawOdpWfnA5IL/y+7ICR1QDShaHDXmz
 yVrxfXfFkTw/kLbYZ39EF+PSkNnW/kAVTzE2a1ved7qWsG6U3PX3eqpcH
 GRtFX9LaWKa7TDhbtk9OUYV7uYXHxJGWQR4OjEKO2AiTYvD2m9JsAhIa8
 S2Y30sYhWfdfQyPeVHBOW/324gKNHRLxKYiEjJ3nJf16m7W0IUsGqMt78
 HIZuRMr5L3e2B/EZj4IPLQQeHoeVETaA/kyCn4YnmEDoI2oee/QudJehG A==;
X-CSE-ConnectionGUID: Oty3odmzTgaECjSPPb7XWg==
X-CSE-MsgGUID: 9VYTMB5OTeitJnsYJlnyPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62348221"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="62348221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:45:52 -0700
X-CSE-ConnectionGUID: O8MvlnMiRJyXBdYlm7SsHg==
X-CSE-MsgGUID: FnclYePlROqkNk64cyCcVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="126914074"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.252])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:45:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/format-helper: fix build
Date: Wed,  2 Apr 2025 11:44:31 +0100
Message-ID: <20250402104430.142398-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Build fails with:

error: multiple unsequenced modifications to 'sbuf32'
[-Werror,-Wunsequenced]
  264 |                         le32_to_cpup(sbuf32++),
      |                                            ^
  265 |                         le32_to_cpup(sbuf32++),
      |                                            ~~

With that move the increment of the sbuf32 pointer to the end of the
loop, instead of inside the array list initializer, where the
order/sequence of the sbuf32 pointer modifications is not defined.

Fixes: 58523a25cbf7 ("drm/format-helper: Optimize 32-to-24-bpp conversion")
Fixes: 3f31a017ddbc ("drm/format-helper: Optimize 32-to-16-bpp conversion")
Fixes: 65931bbc5177 ("drm/format-helper: Optimize 32-to-8-bpp conversion")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 32 ++++++++++++++++-------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index fc7347caf600..d36e6cacc575 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -261,10 +261,10 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
 	/* write 4 pixels at once */
 	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
 		u32 pix[4] = {
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32),
+			le32_to_cpup(sbuf32 + 1),
+			le32_to_cpup(sbuf32 + 2),
+			le32_to_cpup(sbuf32 + 3),
 		};
 		/* write output bytes in reverse order for little endianness */
 		u32 val32 = xfrm_pixel(pix[0]) |
@@ -272,6 +272,7 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
 			   (xfrm_pixel(pix[2]) << 16) |
 			   (xfrm_pixel(pix[3]) << 24);
 		*dbuf32++ = cpu_to_le32(val32);
+		sbuf32 += ARRAY_SIZE(pix);
 	}
 
 	/* write trailing pixels */
@@ -294,10 +295,10 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
 	/* write 4 pixels at once */
 	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
 		u32 pix[4] = {
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32),
+			le32_to_cpup(sbuf32 + 1),
+			le32_to_cpup(sbuf32 + 2),
+			le32_to_cpup(sbuf32 + 3),
 		};
 		/* write output bytes in reverse order for little endianness */
 		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
@@ -305,6 +306,7 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
 			    ((u64)xfrm_pixel(pix[2]) << 32) |
 			    ((u64)xfrm_pixel(pix[3]) << 48);
 		*dbuf64++ = cpu_to_le64(val64);
+		sbuf32 += ARRAY_SIZE(pix);
 	}
 #endif
 
@@ -312,13 +314,14 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
 	dbuf32 = (__le32 __force *)dbuf64;
 	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 2)) {
 		u32 pix[2] = {
-			le32_to_cpup(sbuf32++),
-			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32),
+			le32_to_cpup(sbuf32 + 1),
 		};
 		/* write output bytes in reverse order for little endianness */
 		u32 val32 = xfrm_pixel(pix[0]) |
 			   (xfrm_pixel(pix[1]) << 16);
 		*dbuf32++ = cpu_to_le32(val32);
+		sbuf32 += ARRAY_SIZE(pix);
 	}
 
 	/* write trailing pixel */
@@ -339,10 +342,10 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
 	/* write pixels in chunks of 4 */
 	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
 		u32 val24[4] = {
-			xfrm_pixel(le32_to_cpup(sbuf32++)),
-			xfrm_pixel(le32_to_cpup(sbuf32++)),
-			xfrm_pixel(le32_to_cpup(sbuf32++)),
-			xfrm_pixel(le32_to_cpup(sbuf32++)),
+			xfrm_pixel(le32_to_cpup(sbuf32)),
+			xfrm_pixel(le32_to_cpup(sbuf32 + 1)),
+			xfrm_pixel(le32_to_cpup(sbuf32 + 2)),
+			xfrm_pixel(le32_to_cpup(sbuf32 + 3)),
 		};
 		u32 out32[3] = {
 			/* write output bytes in reverse order for little endianness */
@@ -363,6 +366,7 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
 		*dbuf32++ = cpu_to_le32(out32[0]);
 		*dbuf32++ = cpu_to_le32(out32[1]);
 		*dbuf32++ = cpu_to_le32(out32[2]);
+		sbuf32 += ARRAY_SIZE(val24);
 	}
 
 	/* write trailing pixel */
-- 
2.49.0

