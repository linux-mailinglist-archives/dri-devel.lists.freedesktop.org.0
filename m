Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025B7C8808
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B2110E5E0;
	Fri, 13 Oct 2023 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09AA10E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:24 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by baptiste.telenet-ops.be with bizsmtp
 id xSjN2A00Z56FAx301SjN9S; Fri, 13 Oct 2023 16:43:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwd-Cz;
 Fri, 13 Oct 2023 16:43:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002VpC-Qr;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 1/9] util: improve SMPTE color LUT accuracy
Date: Fri, 13 Oct 2023 16:43:03 +0200
Message-Id: <dbda43685fa4c19b43c872449cc7ed476c2769bd.1697207862.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207862.git.geert@linux-m68k.org>
References: <cover.1697207862.git.geert@linux-m68k.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fill in the LSB when converting color components from 8-bit to 16-bit.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v4:
  - No changes,

v3:
  - Add Acked-by,

v2:
  - New.
---
 tests/util/pattern.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index bd0989e6dbc6aa27..7d4f6610015e7464 100644
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
2.34.1

