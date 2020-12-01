Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA92CB6BF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9E6EA2F;
	Wed,  2 Dec 2020 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B2B6E8D6;
 Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 71A26E0711;
 Tue,  1 Dec 2020 20:35:44 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tiPaO2CeI9fH; Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id C0A36E0714;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4EAlXu_6aPnQ; Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 92344E0713;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 3/3] tests/etnaviv_2d_test: check whether the rendering
 is correct
Date: Tue,  1 Dec 2020 21:38:29 +0100
Message-Id: <20201201203829.1735559-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201203829.1735559-1-lkundrak@v3.sk>
References: <20201201203829.1735559-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of always dumping the rendered picture, check whether it matches
the expectations. This makes more sense for automated testing.

Retain the ability to dump the picture instead of checking it when a
file name is given as an argument. This also removes use of a hardcoded
file name in a world writable directory, which is an unsafe thing to
do anyway.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 tests/etnaviv/etnaviv_2d_test.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
index a75a4a89..9fcdae18 100644
--- a/tests/etnaviv/etnaviv_2d_test.c
+++ b/tests/etnaviv/etnaviv_2d_test.c
@@ -147,6 +147,27 @@ static void gen_cmd_stream(struct etna_cmd_stream *stream, struct etna_bo *bmp,
 	etna_set_state(stream, VIVS_GL_FLUSH_CACHE, VIVS_GL_FLUSH_CACHE_PE2D);
 }
 
+int etna_check_image(uint32_t *p, int width, int height)
+{
+	int i;
+	uint32_t expected;
+
+	for (i = 0; i < width * height; i++) {
+		if (i%8 < 4 && i%(width*8) < width*4 && i%width < 8*16 && i < width*8*16)
+			expected = 0xff40ff40;
+		else
+			expected = 0x00000000;
+
+		if (p[i] != expected) {
+			fprintf(stderr, "Offset %d: expected: 0x%08x, got: 0x%08x\n",
+				i, expected, p[i]);
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	const int width = 256;
@@ -165,7 +186,7 @@ int main(int argc, char *argv[])
 	int core = 0;
 
 	if (argc < 2) {
-		fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
+		fprintf(stderr, "Usage: %s /dev/dri/<device> [<etna.bmp>]\n", argv[0]);
 		return 1;
 	}
 
@@ -242,7 +263,11 @@ int main(int argc, char *argv[])
 
 	etna_cmd_stream_finish(stream);
 
-	bmp_dump32(etna_bo_map(bmp), width, height, false, "/tmp/etna.bmp");
+	if (argc > 2)
+		bmp_dump32(etna_bo_map(bmp), width, height, false, argv[2]);
+
+	if (etna_check_image(etna_bo_map(bmp), width, height))
+		ret = 7;
 
 	etna_cmd_stream_del(stream);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
