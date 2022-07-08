Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DB56BEAC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5053A10EBE5;
	Fri,  8 Jul 2022 18:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC710EBDE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siMt270014C55Sk01iMtsN; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-002fNh-KH; Fri, 08 Jul 2022 20:21:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtVL-4i; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 05/10] modetest: Fix printing of big-endian fourcc
 values
Date: Fri,  8 Jul 2022 20:21:44 +0200
Message-Id: <0cd09c0b07e14a7e594bd86eaacbbeadb6c8f198.1657302103.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302103.git.geert@linux-m68k.org>
References: <cover.1657302103.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Big-endian fourcc values have the MSB set, as that is the
DRM_FORMAT_BIG_ENDIAN flag.  Hence printing the last byte unmodified
leads to weird characters.

Fix this by stripping the DRM_FORMAT_BIG_ENDIAN flag, and appending "be"
for big-endian formats.

Sample impact:

     Planes:
     id     crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
     32     34      36      0,0             0,0     0               0x00000001
    -  formats: C1   C2   C4   C8   RG16 RG1� XR24
    +  formats: C1   C2   C4   C8   RG16 RG16be XR24
       props:
            8 type:
                    flags: immutable enum
                    enums: Overlay=0 Primary=1 Cursor=2
                    value: 1
            30 IN_FORMATS:
                    flags: immutable blob
                    blobs:

                    value:
                            00000001000000000000000700000018
                            00000001000000382020314320203243
                            202034432020384336314752b6314752
                            3432525800000000000000000000007f
                            00000000000000000000000000000000
                    in_formats blob decoded:
                             C1  :  LINEAR
                             C2  :  LINEAR
                             C4  :  LINEAR
                             C8  :  LINEAR
                             RG16:  LINEAR
    -                        RG1�:  LINEAR
    +                        RG16be:  LINEAR
                             XR24:  LINEAR

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 tests/modetest/modetest.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 1d87046f0fdfaf24..f70043d1e6815497 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -198,11 +198,15 @@ static bit_name_fn(mode_flag)
 
 static void dump_fourcc(uint32_t fourcc)
 {
-	printf(" %c%c%c%c",
+	bool be = fourcc & DRM_FORMAT_BIG_ENDIAN;
+
+	fourcc &= ~DRM_FORMAT_BIG_ENDIAN;
+	printf(" %c%c%c%c%s",
 		fourcc,
 		fourcc >> 8,
 		fourcc >> 16,
-		fourcc >> 24);
+		fourcc >> 24,
+		be ? "be" : "");
 }
 
 static void dump_encoders(struct device *dev)
-- 
2.25.1

