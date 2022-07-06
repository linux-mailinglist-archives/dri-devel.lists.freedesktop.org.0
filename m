Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3449568C22
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F1113E37;
	Wed,  6 Jul 2022 15:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986451136C4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657119774;
 bh=rQmS4yIj+Kq0oK+U8Ryv32tYGBvhOaSYofJZQWpZKAg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=A+/0m88zrK6qAQaR6+7pIQQl2Y215QcZPWHe5boyZ6Uhh+WC4eQ2EXGwf5SD8EUbg
 5SHbuFc8RvoYxZDVF9JPNNFhmJY3Mr0iD9tfzKXpizWlPT02sT+fve+82Inr4SnfnJ
 34kkCRR2Q4Iqe7aMHbXrO+z/duaEFoOP+0D00XDE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.134.81]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1nlqck3BAq-00nfeK; Wed, 06
 Jul 2022 17:02:54 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH v3 1/4] fbcon: Disallow setting font bigger than screen size
Date: Wed,  6 Jul 2022 17:02:50 +0200
Message-Id: <20220706150253.2186-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220706150253.2186-1-deller@gmx.de>
References: <20220706150253.2186-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oShNuyil0feMp05hW2usMgSVD8rYb4p7RsxBj5uoROaM4CEahi2
 ObJSydSfqHH9gpBYSMpoHZ81lxTTlZXIjj0QZfiBnOClixGqysk4XfH8A4kkjFRuwddzltb
 cPCfeTRJpdMCW8dKifc/BTiW06FhPKOj14TaOZbN9OGVaBi4pCrTuEovbV0iAuoPZh4WH31
 MuFku7YedEI6j0GwQRnLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:inpeYIvy66s=:wOGmewbp7/ITwMjRoMhaDq
 UYND07/RmKGB/2fbsIeNJ29LYTpM9Bf2AIEcuTJPCkXITcAUaFcA4Zos68L+oKO/NylOr9ydm
 EKcmYClfpLatQ4kEnq0gP7CWqOCs0cKtGi+96i1+vCqzj8zzNM/MvVLY0L6Fnyklswk2seDzg
 d15rkIFG1SmkMFqTrGxlLJEDx83kZgb4JKNs2TZC/gNqdm5I1G7+nl9E/Tmkq2MYfBWZtfy4l
 yw5Tn9XMLdBejacOktrsw4k9eeAGAdNv2LLS2c/VrVrNdKz0nYyn5wziYQGsWLB2SW5UNc9X7
 NFb0JdFg6DZPlmYdoaGNVXHeJ0JsRCsSNtLUl+Yv07viH08LaqOxVHMHqWrnCdWLCSAOxlfQf
 JORWtQIWLehGCdw3vaEthVcLH3ZeGZVttaJt2rHlz+yW1kUv4OkLdecWLibpO7h42CNa3bE0k
 auOffFoZ+LsQTSVufg6xvYB9v2283lL8hcrt7NVu6L0rdtTlvVEaxPAPbimBB03ATme95KP5Y
 wpzGlm0qzJlyhH37BGt1P5QEoJZn9DCVi8dFVFcaMoVeSdFQubF2HOW0aJ2MWOg7rbk395Cq+
 ocWoHyA1izw/VFzVAbXIWKdWNKNTh5PyWXUgsdw9y1J10d85KtwgptY8MVp3XW1mKnbeFB+u3
 VsN/z6t+OxN7uE6BRup3GdxxhuNPDQeHmLu7h8pgRRS/mYWq2tuwDLWNmI6zP0O2+vhp97JlB
 xUw/DTfqMkTWl3Ej2sYwUdv91PqexzmLNUuBipXInzdwEy7WWV5o2QPw4YFQm4G3pQaQL5KQw
 M6mqwkQdbKLVssEOc6BWRpLKAV2ysGTbNXnvbjyrzABmnJ+7XJmWQ2ZInmnqblFpXISv5CnNz
 Mxw9g5lHVZclRYO46rqiTa7seDse0mBj3v41Pij1e/YWeT3vb6JdU7hIW8lKUBa2GgC2cw0tI
 WIp9KaJwhZ84tXMk4HkF0+9OOm7BH2xSvtWM/jvanQvG1HvTBc0PMLSMYAIXccKUYc4idGFTL
 IqwJdS5Vw5Hc29K3oSjOLY+rCIx+by/gyi71fXT88BDwTMSyZAoIAq39LiEu5wg1KKMxWFxSw
 Yt9lZzmxhcyOa48XBm0qOL4Ax222IOG3wz/CC/UcHSQIFe/FoyptyEZtA==
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

Prevent that users set a font size which is bigger than the physical scree=
n.
It's unlikely this may happen (because screens are usually much larger tha=
n the
fonts and each font char is limited to 32x32 pixels), but it may happen on
smaller screens/LCD displays.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@vger.kernel.org # v4.14+
=2D--
 drivers/video/fbdev/core/fbcon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index c4e91715ef00..a33532564393 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struc=
t console_font *font,
 	if (charcount !=3D 256 && charcount !=3D 512)
 		return -EINVAL;

+	/* font bigger than screen resolution ? */
+	if (w > FBCON_SWAP(info->var.rotate, info->var.xres, info->var.yres) ||
+	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
+		return -EINVAL;
+
 	/* Make sure drawing engine can handle the font */
 	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
 	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
=2D-
2.35.3

