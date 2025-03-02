Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC998A4B3EA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 19:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346FB10E174;
	Sun,  2 Mar 2025 18:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="h2up08QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8784510E174
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740938533; x=1741543333; i=markus.elfring@web.de;
 bh=MP3CYzbV4SLNXkeRjkm2gxZvCS4zGhZS71CY4NKnxwI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h2up08QIJuNb1Kkw0qGRSRFBUPboD0Ub7SIZPSxUI2KWX2+iPnmaCE2XPGO89HtS
 cNuf2uGnSN+bjQ4yNLYFFjnzWMdk2XOuFPHvkghRARAh89YHYqRkMMX6UmJDMlTAi
 2ZTmR6jBvPYRAs1BmaByCeWOWrs8ug20ZpgsZBq25LwgjVlG4Up2tLkcJ1OPEzcbY
 5U+cdisLvQpkif79YywhvTbI7g6eg03dWQRJ/44cjQrgsAqcbEMHuA3YeX7TIYEQ9
 2dz/sLBQP+XZWbHAaVUF+VdHQ89pzq2xcocye2X3c6a9/VPVmBq+WqQqNK8SzxHFj
 OzxskVb+FjK1sQBudw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.30]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1My6lX-1t4EN01Q23-013zow; Sun, 02
 Mar 2025 19:02:13 +0100
Message-ID: <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
Date: Sun, 2 Mar 2025 19:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] video: au1100fb: Move a variable assignment behind a
 null pointer check in au1100fb_setmode()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@pol.net>,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yihao Han <hanyihao@vivo.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
Content-Language: en-GB
In-Reply-To: <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TA4NVn2grx0TTOq+nzTZct2Bwfp8ZWwFKVUFcX47RfI2TKfL2rK
 /lq1ef8WZ7BXECt83hHAzIbRJxKqvX5etXT8NFjr+BzmG/sxrpz4YLDxfiGW8MYfepISiwY
 4M5F+UHew6eP9V0utctkTURC9D5iH86InNPUrfABaTSVVi8pQtZ/7UDkI/1VmSPRGflRPQU
 rpm7Y05RQfml7v0//HEZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y5CMX5amRq4=;e0gSeyKW42FBSDp3F0Aw8wCZz4N
 55ufKUCo6pZS2keF9nDhZ+jUZ+pqAp40YFIZErcE0e+atIPcI0Te6s30bBbEI91vyNx4F4Bj3
 VPAIw/jHkoay0ILKWb4dLBknnTKTpXfqiOZF2YMx0jKwQwDqSKzfAwitck02QqY8T6vMKO+VJ
 7yYr7YAvjo2OSbBA+J9aeVPQn3nUvJf3YVG09HNZNlxZNolpXhIf5BE+Vak2/SBByLcG/mOb6
 6CILsxh6aabiQgkoOe12nPl4rhVXI1Rul69L6QmN3JPpiWFrajplnWj+vS12sxW4nvWXYZzce
 523/EskMWbDW4AeLXtAzzwgUQgEbx+hFhUFzp8SmWIcCyr5Tonx19TMfE4EiEIY1YrCxRVRS6
 fQq+ODh2blFdmLWb00CyBTDKSqQMd61KK7ofE4wPL4DBD/jybpz+xl9qzX2WL0AOnW53PgCwk
 VQ1XDYyQZyWUKBM3d9ya5spuC4ELmiBIi1R/4qb4Nmxga4McMUzjpFUSrFXFUaUf96WKI3ygQ
 W9iG954K4FJ3k1OK0h5Lwx0Gk+kXV4hQIf9MeSRVnZhDfosQHWB+j7YKs0qPrVW+Ir0rhRRtK
 Vxhe9UJYww6r9fCX+LFi003/vl0w8PExDQYQEZphr5WZvYGXZsjf+nMSvsx9btuFdiSX+6yV8
 FQ7dzunwy58CYH04Mlu8iurU8Tz+1BHA3Xrk21vTGrktMpU14VjvXfJFMb76tWoNlro+6WjQ/
 quRP7zLMVU3aYr1kuU3qpwYY6WszJfkTBu0/K5M0Lf62tDknOfZSRheJD+gHgLvgtm88ZoAiF
 nYYZmf9ri99DUoJkAw8Rhls2YbP6PyE0dbWBgLIPHjVdpS5+/Rb8gmNI6PWpfkK7p8+jp+UOk
 imu2w+q/HIKAabBP2zsQYtXpWgeXtETovhmvt8uMbKES4bl/2NDWQSehMOHcZiq9wvguy+G+9
 D37LxYoQvg4X2nyz1VaiPsTbRuZuuL0CIAc0cO03bAMn4wkoPuJxQJOEdyf/7uJSorfoAUljw
 VE3g2/i4oCDAriLG24lr8nxunrFM5oXLoHk6ZVV16uIt1uKv7rq2x/E/zGvRv8VPOzreh6lkl
 tNWaZFuoWj9tjdxdgXO1FPHSTCGzX329w0ld5I9tehjWAVyxmfpoJLncoxL8kCLPYUSi8S38y
 rw4DdFHBMr+Q3ZgDfz6DP5ai30q+Fm0yuHsG08McZbRhiWaN9LEOC83SxcqKpsTpBoLPIHR/G
 hoCqDmhuRcD4055QzEzE3Tmcr8jR9DlUBUGJkDjW4Xx8F0LrlxxiOSdT3fD7gLhuGE2JVOh8l
 OQA/eWXC36Ycyjt83NR4zJ1uAPC09scM4j3nR7nx85WzKLi5jHv+GpdFN656SNHc03DBWNxZz
 6eXM0S8PA7R4UCbVB+kOTW4bEfQYQYH6EQh7d8xfMalhYu99GFiZ6W3SJFcq3h/t9sGOBk7N7
 ncJpTUg==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2023 21:35:36 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cau1100fb_setmode=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/au1100fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb=
.c
index cb317398e71a..fcb47b350bc9 100644
=2D-- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -137,13 +137,15 @@ static int au1100fb_fb_blank(int blank_mode, struct =
fb_info *fbi)
 	 */
 int au1100fb_setmode(struct au1100fb_device *fbdev)
 {
-	struct fb_info *info =3D &fbdev->info;
+	struct fb_info *info;
 	u32 words;
 	int index;

 	if (!fbdev)
 		return -EINVAL;

+	info =3D &fbdev->info;
+
 	/* Update var-dependent FB info */
 	if (panel_is_active(fbdev->panel) || panel_is_color(fbdev->panel)) {
 		if (info->var.bits_per_pixel <=3D 8) {
=2D-
2.40.0

