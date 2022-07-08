Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25756BEA5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC710EBD0;
	Fri,  8 Jul 2022 18:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6910EBD9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:47 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id siMn270014C55Sk06iMnbr; Fri, 08 Jul 2022 20:21:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-002fMM-JH; Fri, 08 Jul 2022 20:21:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-00BtSJ-0r; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 01/10] util: Improve SMPTE color LUT accuracy
Date: Fri,  8 Jul 2022 20:21:31 +0200
Message-Id: <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302034.git.geert@linux-m68k.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fill in the LSB when converting color components from 8-bit to 16-bit.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 tests/util/pattern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 178aee8341a38920..3753ebc1eeae6c9a 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -646,9 +646,9 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
 	memset(lut, 0, size * sizeof(struct drm_color_lut));
 
 #define FILL_COLOR(idx, r, g, b) \
-	lut[idx].red = (r) << 8; \
-	lut[idx].green = (g) << 8; \
-	lut[idx].blue = (b) << 8
+	lut[idx].red = (r) * 0x101; \
+	lut[idx].green = (g) * 0x101; \
+	lut[idx].blue = (b) * 0x101
 
 	FILL_COLOR( 0, 192, 192, 192);	/* grey */
 	FILL_COLOR( 1, 192, 192, 0  );	/* yellow */
-- 
2.25.1

