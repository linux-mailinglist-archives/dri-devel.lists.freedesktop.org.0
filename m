Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92255AD6E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1518410EF62;
	Sat, 25 Jun 2022 23:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61510E95F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656199624;
 bh=+UUHAoLGglrFmQ1D3PopMLV9eHPVTbS6pQ95MJjQz8E=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=aFGFieeK+xy/S1PqFRCeV7CE4yN+krnXDIPo7rdihu6FU7amdsZyQDJusb15DkENo
 VXym5PcDvwhw4X+GgBNzM1oujL+JpfoaU3iirMR1V91RIAf+LTxNxOU32kftbzXC7C
 MbUSsbfk8Ur1R2hDbhGbLEOuDfGNqQ//og3tR1dQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1ni3xs2zjA-00wVts; Sun, 26
 Jun 2022 01:27:04 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 3/3] fbmem: Prevent invalid virtual screen sizes
Date: Sun, 26 Jun 2022 01:27:03 +0200
Message-Id: <20220625232703.401821-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625232703.401821-1-deller@gmx.de>
References: <20220625232703.401821-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fhlHNLJqCM8ds5xK1fcv/hiPhHSL0WEc42VnZ3Zz9O3Fq+GF2oB
 sS4s6a5HZLoKlKinhvMqcaPZq9z6uL+rpDAE37N+Hgewr0bYjPnATJ8Y00z7RQ0tC4Jq4/D
 oBKHrAp4349nlgbn3CDE3fLvo5ZxC5vuEMrL9eaQNqfVVEeBAV6b9pXJGqJG0OdYeOtGx5l
 CMzmoyW5eRXTTrrMD1Q0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fqsV0Ly/PLQ=:Ditle9gpB0CrEsfqZurQEa
 7H0kBf2eKyzZwdxq0mzZV3bovG5ouiT+OYSPcVlY2A/AA45bG6bzhm/WaYu94ke8ihPRHbVt7
 JGaztrXlGCAubLdXpRDT/5tQo+NRtrru2jspvtEXcBJkE4nqBF4MU8YKOVqQ+DVWNbOtFne+/
 wA8gUl5y1+WK3w2Lh9WgseeQyEdO/eAJpECjuG25jkjM1LKLG5Hakx9R0UyV3463SwOdSrzs+
 Oz0JS7NuVTCiMCN5zzoOGc2VAshvb0HU0d33MzXaa13/MfAYEzHZAy7rgA5HuyFywtkyczWuB
 n1h6ULaByE92hOLcf5ZESI3BMAVGxhxao2s9ZW+s3mSdkM0m8mibo6PR8pxs3Z8IBJs6LK1to
 wwCX+1WknvmFCEjF2Mgd0rFCOdreB+i0RF8Dgckpf3jz2iJ9ezqEtQvuU8r+nOUPORuipfHtK
 iT229ZR+YJ0+Z/fAqbvkWkiwg9Zjp+1RJkd4/4jeprCcY1oD0MiSWmCbU+NDI9818RJ5jHcjA
 4bmJ/huGxpbAYjuRvEzyxjCYLsx/Q1tzTaKxsut0dUTjccJkt2K6m+a4zSbrLLtfuwXpuTVOH
 BJflmnJCuA3zGGGCz97naTffBp4j9dmGKccteoFBSe/KryDh2ZzQ3sN0wxI2OUW4lIFt/a6cw
 FGHi1t0Bjh5+MEkaqz0WAJep+20W4NafDPQleSgpF42DyB3Z692ejqTTNriorQRAU1T+FA/Ox
 E1KA7WaSAnHdypRFPguyfm3A3VjzHb0eeIgJ2jCAFdm7Vx4uuH68wfKvW/cCrdPe+aTMd6MiX
 3Umc6PUyRrVTLFvb6oOR0Daf+0fMcD/Xj5tgJk8c0YR+7JD848J7XBTr2Cn5ficbJoInJD0y7
 YdLPpREWnsDLzWXniCMe+R5liIf2QBBYmZBKq+46Mh/bnfWxPcRQCeWxSHfZReirFj7KSy5/r
 Clw4n6XixDf1sBocBQ3ZlkcaTSbzAN+dnpWtrVH2bvB7v5zIcAJh/pBZQfC/ExcMARUuYtwZ7
 0AzQLzU4Vi89GS4kGeOohQdMkQdwMawayRTG+CJHxNQ5Sc4TUBxwYBb41fAEwC0mNBLSzpOYc
 s9gHlJzSa9F7cexg5+lX5KkoNNE/RnieyfoZ9ZcHYU3Nd/Vk2mV0hwGQg==
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

Prevent that drivers or the user sets the virtual screen resolution
smaller than the physical screen resolution.  This is important, because
otherwise we may access memory outside of the graphics memory area.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..b6e1d0f2b974 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (var->xres_virtual < var->xres)
+		return -EINVAL;
+	if (var->yres_virtual < var->yres)
+		return -EINVAL;
+
 	/* Too huge resolution causes multiplication overflow. */
 	if (check_mul_overflow(var->xres, var->yres, &unused) ||
 	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
=2D-
2.35.3

