Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560B3DCAF5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 11:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DB76E49D;
	Sun,  1 Aug 2021 09:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211596E49D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627811531;
 bh=2wkNneBgVy8D17kOJv1WptkFOFx7B1lNw8niqyN7lq4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lCiEDO7esfxNSmSQtUQc7eh6lyfAkd5ZOwvPDcyPS8MQYmp8TNqsKAkfuyAv/leMX
 p2dDgieAGSxyvHrbYxDt5++YW6uJlLb98H1k9RI5py9epyuJJ24a8H90EGnSfWWn0K
 Ts0ltthd/kMyUIzndfe+PCcTpbbH+uVmgWK1mcuU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MKbkM-1mSkNz2TG8-00L0ux; Sun, 01 Aug 2021 11:52:11 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] staging/fbtft: Remove all strcpy() uses
Date: Sun,  1 Aug 2021 10:51:53 +0200
Message-Id: <20210801085155.3170-2-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801085155.3170-1-len.baker@gmx.com>
References: <20210801085155.3170-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3DBDs+sfwC8IiyfEd0c3v9UOisAbafQS6Js2T1gtq0wcmsF5j83
 8qLxZYy5rn2cjuCG7PAv9TkRlCbaEL62aP2MawsHZhM7KBEuJZq1oB8yMHp6OldMFVTbR2D
 R1D0svvBp1nzlxlajhaGYOmFALUMOoq6DHdnuy17JGauSIK/2hoDicOyotL5vvjlFNt/Cny
 HR8WWsy468LRkit8AbEuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKuE47COflc=:yESy/JNUZZefZ4o26Myjax
 mOvj9kIcubXwPKwLq2YDzJFAxuJ3HWUZ4h0f/6ft2e32x1vMgtHv0KL8Qhi3dvrQak7tDi5im
 TQsjyWX1VXZE80DnnFz9wccybE6SiDb32KhlqahCmCriofwTsP7YtBvSWW3bMQ20KaXyy9yL1
 3RhHvTSb7Vt8oaQxZ62Su8D4s0mo5sqn/mSkgT9tfm0pQysL3uzWpGRF154n6omx3nqQil+CK
 ZU6lNRAcEIXfuaVsB3AWTsCWFCYdmEEO6+0mGxxWUFfDIZ/wc/OswGpr7MuASbDHONODMNpfN
 4vwcZKyz/vmuJNKvlyEgpJcLdg3i5uWNxjuMp3vpUKlvIs3kr8O3V1u02mpNLvq6DYyIwOcbu
 SC9obBRVEPZOTnTURfjHNvmRkbmlOdsI5r0R9/Gf+iSPkZBn7jcXXa1NJGVQnB4I9A7WhdLlE
 QmLh67oIRbfO/k7iXJJIQIJbLIMjoe4LFANGKcrm3j7Nk9ylv0gqHUGozRC+I8qj//ntQBnCG
 Y1vbMwiLQqmoZk8516LVnWYa7Pq+tvJzKEnpIz4yAy3PzuVFra+r0eMKlWPq0f8mhO3r2gbam
 kzg/xFS0cmXb/ArmTvw+5sXZOoTc9AHj4RzBYQAu92e7/SsUibs3+rMb5nHP5EtHy7W7+6Beq
 7FMjgy7JniYQHiyLDzWMoRq53UICksLLN3UHJ7TJakfrxTe5nKaBCwrVnYOmJTbxqB9I72jqZ
 YfqRM2MpRE0XFwSJSF61NBC6fI9++uBTeT05OKYXDQPBJVeQmZl9rKPYwc4VlzuPt9AtivozG
 Dsd6jroJ8ouxQ+tHDykAZ1491if96b0SRAqlSB92rJhk8FU15NKGN/om0fLteeZob2PK+C5Nt
 ApzVGzgFooGJtBhoAQpJrs0a6VddXAD8SYs+uvcwG4hGCc5hcRpNVuMVGz7b+NasF2BrffHXG
 NsUKXjT+bo4nOPMl/UJGo+VunjGYv3mYAEx/l9TV8v+XFvDY2erbRR+VASTpc9ACzDIkNa1ii
 isGUM8w0MH96M0CmdM+UakBJn7qwMDdPht8T0LiaG0TtuVw+rZGXPoFLeyDLeXGMF0ybUwkJf
 D0Zu409qxBwUkOaINBNYFjt1LYi2b3teArS
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

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy() but in
this case it is simpler to use the "%*ph" format specifier.

Moreover, with the "0x%02X " in the sprintf followed by the strcat, the
msg buffer (now removed) can print 128/5 values (25 hex values). So, the
"%*ph" replacement won't cut output earlier than requested since this
format specifier can print up to 64 bytes.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/staging/fbtft/fbtft-core.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fb=
tft-core.c
index 3723269890d5..e6286043bff7 100644
=2D-- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -992,8 +992,6 @@ static int fbtft_init_display_from_property(struct fbt=
ft_par *par)
 int fbtft_init_display(struct fbtft_par *par)
 {
 	int buf[64];
-	char msg[128];
-	char str[16];
 	int i =3D 0;
 	int j;

@@ -1036,17 +1034,14 @@ int fbtft_init_display(struct fbtft_par *par)
 		switch (par->init_sequence[i]) {
 		case -1:
 			i++;
+
 			/* make debug message */
-			strcpy(msg, "");
-			j =3D i + 1;
-			while (par->init_sequence[j] >=3D 0) {
-				sprintf(str, "0x%02X ", par->init_sequence[j]);
-				strcat(msg, str);
-				j++;
-			}
+			for (j =3D 0; par->init_sequence[i + 1 + j] >=3D 0; j++);
+
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
-				      "init: write(0x%02X) %s\n",
-				      par->init_sequence[i], msg);
+				      "init: write(0x%02X) %*ph\n",
+				      par->init_sequence[i], j,
+				      &par->init_sequence[i + 1]);

 			/* Write */
 			j =3D 0;
=2D-
2.25.1

