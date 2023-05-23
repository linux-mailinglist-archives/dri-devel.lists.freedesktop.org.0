Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859E70E660
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 22:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988D910E134;
	Tue, 23 May 2023 20:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1C810E134
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684873095; i=markus.elfring@web.de;
 bh=m3QJbalgg7JZn8ypxh1cFSjroTKeCpK66hg6yV7/E5Q=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=eZt3QhNa3iJH1lY8aFqBQf1hHjlhbz1Ps3RtMuKhtOlrzcLMKuCOxW1g2If2R4+Lz
 AShEsnla/KweIALum3wxX0uV223Yj9A33syHDntII5cXd+xw99ugMLujS4kCGpwPwM
 QbuEH0NWYmDNYOUjmx1N70GBu551fgv+pMyI4Slx9lBPSa25Wceu7KGSnb7qQN1Mhh
 +kh0oM/cxPOfTA+jQoZMvkODudsdfVlzxJ4iVOjI86P7kg5kVisz3goBv8HItrXE7f
 4E/UCoir+wPGCBDPEnE54FePYdaFrXoxZE9EexqLrsnXrRIYoCsV5X3SBa+JKRrQ8o
 sWqaOnsCmEIJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyNwm-1qKQh92GNQ-00ylN5; Tue, 23
 May 2023 22:18:15 +0200
Message-ID: <3a44f5a3-3fed-86a6-d862-1da7a201061c@web.de>
Date: Tue, 23 May 2023 22:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 2/2] fbdev: Convert a variable initialisation into a later
 assignment in fb_alloc_cmap_gfp()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
References: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
In-Reply-To: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q4IsZ0zZs8axUh+c+JGQDeH6z6Pc3Bmh7/C3YoMFCV/9u9xv4Bc
 rpGbfr35JeoY7xseECqW+d9O9p+7QZxvRI5mYR2C2ZHpl1nsjdrvuIUvdB2xd26D1Wrbach
 zG1a9wofdEuboBeyEoXY+1VrszQqh8qsCiq/vMqN5eoCIzVpfjjGsox89L65UNQavfbCsiV
 QkJAnppxDElQDRHzSqOSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mQlZ2sxC/HM=;9u5R9R5XH+HK6Rs/T7zpvefD7kI
 gbx5u8Gwf+l+Ev6CN/50v0z6M0Nz1o7P15TlD9olUI3dfIvlWeg/x4X2Da2vuRuomfDlO5kv2
 npQccs+plkWN0nsUo4b96xY3poSAHYLOk5Pllj2fBd8w5xNwJHMNxoum2R/HwClmsddKjB65u
 s2e1q4+eCJtvzV+UjQu8/M+wOoQi3lo+DnfedYPG/IavxWkrHKb23GVo+iNStT133Sdla+oNN
 psqtKgGg/5dYfYYTnZDdSOIcwItVJomhj8Rurg6VEHwiCNip97OZkCCkenBEJcsuFbH5hetry
 Dk6xf43eibjHcMEfFSM1t5zbinFcXLWo82fbScP5kUQ7QMdwoiEqUmEDMAt6JmMis/jD6//lq
 MLrLsPrtYRUJJTocyxJ0g5TulbVknEDRdbqUgYW1rk7zwXyCcLE4VQpgDGEjuc3/8KceGB+on
 mPpGQsJeCcLznIzq+Lu1uZuu1eADSQgy7jh9Mc9vbN0PryziSxvZBskIGt/C7zAHRothRBoyz
 fzi9PFMiS7Nb6fWTClWjRs2OpFUKij8CO/owVoUZs4971CJ2vgA7laiASNRO0VssErMdhl3IK
 a4EPt7wQF/8K1tqJiDxB3xOdbHHjdJRVsUiMo85hf+ZeN3AhQ9gjoIwYPY+5Vs7mFa0c6cIci
 zeS4U/fJGWlivPiv84eL7Gv+ixPzUi9uiMMrJerAj3zUazgH10ZPTYzikodkdnG7YQtmAzasR
 551fBY8QcRumFJJ2O98mxDAIfm/tIMPMk15zVhWOpt00X9Xutzka0uUGTCAtUkPWJYzWK00BJ
 h6PnDxolGj6hUk66oAAOAnyZ/+QDoY1AIru4HaHttQ8bLFRhj2heGP/mREHQyDMynJMDJmHOm
 +N6vDjsiWSZKiEEqr+NuNYyP4WRduY8VUdj2DiTypTfsA4OIIwGSHqAx9SrItLqKWTemkZwsj
 kERldg==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 21:56:55 +0200

* Assign the value =E2=80=9C-ENOMEM=E2=80=9D to the local variable =E2=80=
=9Cret=E2=80=9D only for
  the exception handling.

* Use an additional label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/core/fbcmap.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/=
fbcmap.c
index 5c1075ed28ab..fbe82a64cf73 100644
=2D-- a/drivers/video/fbdev/core/fbcmap.c
+++ b/drivers/video/fbdev/core/fbcmap.c
@@ -91,7 +91,7 @@ static const struct fb_cmap default_16_colors =3D {

 int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t fl=
ags)
 {
-	int ret =3D -ENOMEM;
+	int ret;

 	if (cmap->len !=3D len) {
 		int size;
@@ -104,17 +104,20 @@ int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len,=
 int transp, gfp_t flags)
 		flags |=3D __GFP_NOWARN;
 		cmap->red =3D kzalloc(size, flags);
 		if (!cmap->red)
-			goto fail;
+			goto e_nomem;
+
 		cmap->green =3D kzalloc(size, flags);
 		if (!cmap->green)
-			goto fail;
+			goto e_nomem;
+
 		cmap->blue =3D kzalloc(size, flags);
 		if (!cmap->blue)
-			goto fail;
+			goto e_nomem;
+
 		if (transp) {
 			cmap->transp =3D kzalloc(size, flags);
 			if (!cmap->transp)
-				goto fail;
+				goto e_nomem;
 		} else {
 			cmap->transp =3D NULL;
 		}
@@ -126,6 +129,8 @@ int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, i=
nt transp, gfp_t flags)
 		goto fail;
 	return 0;

+e_nomem:
+	ret =3D -ENOMEM;
 fail:
 	fb_dealloc_cmap(cmap);
 	return ret;
=2D-
2.40.1

