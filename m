Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C9563AE1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF8818B2A5;
	Fri,  1 Jul 2022 20:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33218B2A1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656706928;
 bh=rxU496Ea/xTjK7QokoK/CvWIPeV4p8ucxlEYuQxng1c=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Z59iAmdikPjyNlt3M36ojluNiGW75rOe2JPBiqqZ9S80nOUjatNojljF1wNNtl998
 MzZG2ZlRiVLUBZWwSImL2Lk583wi3cCnQQyyqkcQSEyWCcK3l7L5y70X8YlYe7E1g2
 rJclFSiN998+M1okbjsNPxSgbhzMVRHJVmoj/wgk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hZJ-1o2gBy3gMj-004mLg; Fri, 01
 Jul 2022 22:22:07 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] fbcon: Prevent that screen size is smaller than font
 size
Date: Fri,  1 Jul 2022 22:22:04 +0200
Message-Id: <20220701202206.559518-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701202206.559518-1-deller@gmx.de>
References: <20220701202206.559518-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m51ZFjziku3+nLdNnQ3v0ZjANLYrgX+zAVI4+wqnuo3LHXTKQ3e
 CRtJBTMO9m6eiMHvEKP/jdB5AyhFb+icj6DHkaDzu6u9JLDFBzo9Q+9SHmRG1HAO6iKGQiG
 zt4O39ER4vg/tA9qGwOltKoG83b7MjDAV5R1WCaQhBROb/AMdYTt13f/S4fszb+hCyUe6VB
 fTcmaiupoDbLumxpmVAfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UWS9HLNkmOw=:rsZSHlF7Hce145g3Rp33wk
 IlYjaURMO0XegJLAFpgyfTi4Kpl1jG/e29w4llEIoR3uiHW0BpJJ1/SIzFsy29sELiE/2qMPM
 t1MwubufOIXoLL5HsfCFNtseJrpYCy3ijeyitIAwbxjknt/Q0zJU5WcjU/saPi3c5s0+wFBV8
 ebLdTv9RKR5hjjdEDkUljL3J+ttwgvu1gg6i3u1En7vDwZNlQgzXzzNNtHm7yAACnWAUz57Rv
 BDtoRHBb5lInv219ojTmFI1pkBj3wf75GRs1g4J30unltt8SCThu11Sp0ai2BUVvpDYNcZx3F
 9wsQW8Upj7FSzYlUIwDGc7tBDY4n3dSHpBY0Mk9HBdJOFePf+eK6S9fe8MyP3v89bW8j3qNWW
 cAuNahtBdNQJd+c+DOXzyD0esHFYGClVEd7y0LbLxGCVrUlN4pEG3k6iGdK6RpCDgoAcwCwue
 1m50RqjnmcL4mbW9tIn+pIjsSGR/Mqpx9/IQ2ldfGhXx1Dcdj5UT2q7y42nfNgAFYY7B98Lzv
 Tc978WOl/3O+HycKd0Xkm+Hd5YTYL1DXpXrtYRjCR+kINpxWR9ax04tYRxxC0cvcGJEyQGBQ0
 Dq7vc5xCKnXeEnBQYZgdzCAjn5WrYg/S866Mujk7HH9Ov9PMXKJoaDp7wNXOQuN9A4M1K+Muw
 YOiSmiJkDG1aG69g/mV8SQO1qyibee2n/VotOqrwyalHiDROWSlS2NiUQ9OGJ0jkb0d7uoC+C
 NXfwlhLlde5AO4Tq4VW3VKz3lOLEd4r7N94W0JAbBayIBcKKCfw4HfJ9Ai3Cu3qTbQjuXj3zD
 JgWw0Xb5FedKSXAEuN8+AjRr/TyKh6yy4NAUQa8U4WTlA37E0DoXKxagw0lsIVHY9wwP384W+
 ElirBRACW/2rckdZveTXbg4maVBYbYaQYXSPuaSdFiedb5ASyyP2ADqcjkUTjsHJKnl63iqGA
 zMfkNNCh1qlTfI8BfmV8sS9icKn3F08LZ6gC9jbDLIoFBuQ597a1q7JmdTL/kCWoTrVGMna5a
 qkPOCfBHSxYtKROUyJVsCq7+/1byshkyIeSJDIphn6qTrCOvBrrt4nXYrIUptnFR1S/YC2hTe
 8ILLZR9v7BfcoNZyzLN87J80pXxt7Sw5kGTwen2ZCHeJqgIoO0JgqKquA==
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

We need to prevent that users configure a screen size which is smaller tha=
n the
currently selected font size. Otherwise rendering chars on the screen will
access memory outside the graphics memory region.

This patch adds a new function fbcon_modechange_possible() which
implements this check and which later may be extended with other checks
if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
for a too small screen size.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbcon.c | 28 ++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c |  4 +++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index a33532564393..14b0ab51744f 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2736,6 +2736,34 @@ void fbcon_update_vcs(struct fb_info *info, bool al=
l)
 }
 EXPORT_SYMBOL(fbcon_update_vcs);

+/* let fbcon check if it supports a new screen resolution */
+int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeni=
nfo *var)
+{
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct vc_data *vc;
+	int i;
+
+	WARN_CONSOLE_UNLOCKED();
+
+	if (!ops)
+		return -EINVAL;
+
+	/* prevent setting a screen size which is smaller than font size */
+	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
+		vc =3D vc_cons[i].d;
+		if (!vc || vc->vc_mode !=3D KD_TEXT ||
+			   registered_fb[con2fb_map[i]] !=3D info)
+			continue;
+
+		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
+		    vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xres))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(fbcon_modechange_possible);
+
 int fbcon_mode_deleted(struct fb_info *info,
 		       struct fb_videomode *mode)
 {
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index afa2863670f3..160389365a36 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, unsign=
ed int cmd,
 			return -EFAULT;
 		console_lock();
 		lock_fb_info(info);
-		ret =3D fb_set_var(info, &var);
+		ret =3D fbcon_modechange_possible(info, &var);
+		if (!ret)
+			ret =3D fb_set_var(info, &var);
 		if (!ret)
 			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
 		unlock_fb_info(info);
diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
index ff5596dd30f8..2382dec6d6ab 100644
=2D-- a/include/linux/fbcon.h
+++ b/include/linux/fbcon.h
@@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
 void fbcon_get_requirement(struct fb_info *info,
 			   struct fb_blit_caps *caps);
 void fbcon_fb_blanked(struct fb_info *info, int blank);
+int  fbcon_modechange_possible(struct fb_info *info,
+			       struct fb_var_screeninfo *var);
 void fbcon_update_vcs(struct fb_info *info, bool all);
 void fbcon_remap_all(struct fb_info *info);
 int fbcon_set_con2fb_map_ioctl(void __user *argp);
@@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info *in=
fo) {}
 static inline void fbcon_get_requirement(struct fb_info *info,
 					 struct fb_blit_caps *caps) {}
 static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
+static inline int  fbcon_modechange_possible(struct fb_info *info,
+				struct fb_var_screeninfo *var) { return 0; }
 static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
 static inline void fbcon_remap_all(struct fb_info *info) {}
 static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { return =
0; }
=2D-
2.35.3

