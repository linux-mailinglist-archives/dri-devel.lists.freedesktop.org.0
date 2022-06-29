Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5313D560AC9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5080810F0A1;
	Wed, 29 Jun 2022 20:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069510EE6E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656532825;
 bh=Yo9x+xyc6xZ2zGoLj5NjKMYXlhkATJyeZPsLInYBb20=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=dvVp3kNpO/IR/dxokmUrCaQSSzs5XkFka1VF1TUhO39+er1OBASGijOVojlAuwC1i
 pvWM+nqyDPUWi6mN5AeaDtEjythIONOkDc6aRuC5Bu2PU5oLrvMRqR06/uo354rVCB
 8d6iksNDd6Ii5sHimsvAID9wm/OdoJ0JRj64Eg+I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1nQzRY2lGD-00gLRn; Wed, 29
 Jun 2022 22:00:25 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH 3/5] fbcon: Prevent that screen size is smaller than font size
Date: Wed, 29 Jun 2022 22:00:22 +0200
Message-Id: <20220629200024.187187-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220629200024.187187-1-deller@gmx.de>
References: <20220629200024.187187-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bl3RSVmsYeWfaAlrxG4FeQ7RezTKNvntfDSkQxCjYBRfyztVqM/
 yJs0zoZCxjNcnfisFItrY62+xdKDE0/CpFy/UcIjC8qPzsFgBDltaKhwDzSqwa8RUCcKFFU
 kXG4hFi//Mdr15Q44zVoNH+ndfOyax+he3Gg7ZJwDaUeEETOLFJIaoOmVeUjkXzZMkOTuPH
 x5G/BzZ0Oqouo01mcCp2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jttVGFRovNU=:0eCDD+4gxJPzImCSj+edVB
 P8PInVlsapq/WSkcAsDPqwVZ+1rSl2cgFEg9qh+JA14jILAuwXNhkpu3pDDYYCo4IZxm5Gp2F
 JX7fUGGXYXQkk7T+Z+Xe6D8LvM2qHz4ke/oi1vzydG/TE2b4R+o+v4r8XrSLCVOh2AjtRjUzb
 WMMrNfZNReRnZ8anTbOiRCMywW9caMTsh3U21XLqT3aVuar5iqyZEnbVBEAr4Hsn28SY2hRJ+
 YqvvyBZFTp2+BABew9hirDcH8v5vVSBTCyOH9kMIBVaRZ3di0xlGs6Azu6fJZHDqOKyAG7PwY
 Zkhb61GBBZNKo2EQZ2P0ZZdkpE0M4Do68MQBCRSMHY5sUrcZer0lxWmhGzRubyMgg9hfUAJuw
 K6n0WwuTnwByoc4ItEMbX2mYD7x0v4u2CUkxjOXsltQOO/k7oYJyahFC2ENqkLqEE9rCNudSt
 PDm/4KEyIUuw7K1iQT//DiA8vjWtr7CpnO+cs9/MTS0avYRdEBMnOs+QvLKpcS+OwLyCjkRra
 OhuFylRA10EBBqPpmq/i3FXDFxeB0f2MJk53FaqRKMAUz7/pJY5ZaQA6iQqOZMdEjn/mciRdQ
 Ni2Bjqgc1Rvf1MQ/zA0KPp8KsJrP/6TM242rBx4wztJJxl5TXQCgekMAp1YjPHfOKFPBBxKVO
 cMfekoDc+r/A+LkqvoP4IhDV1wf1eCHn/YbItzQkp6PuSZn/OEAcuW5o4MYuR7kP80knYAH5w
 tWVRDGO/MP+NV1Xh1e9PInwhEJy7Wub3vwEM8rkRhoUrer78kubhD0bMVQkFo5O8IRV+5VngM
 kDjVc19pRP9nt2YW9BNDfCght01Qyo8kjrS7GcA9LHS3JMoeE3BZNbPuhxHrJc7KRBNqtzNm6
 mmz4ki2qUhDMIu8vYOyDmgFwujuqlt5IY5wLKBQs8NAGRx8yzaHrU9SyP0fd8BVfXaX897oSc
 gwAV+ya10bmHpV+hkdGyZEjXt834VxGMqt3iNP0WjjytlFzBZ8NtTEJ0d71F5KLqDIAR2gRS4
 vyq1PrRY682RHqR5WXzLHsa2HBZY8IjO+wRH1ykyCGNtA0OYJQtOwcS7ozYCgmHdNDLl1J0Ky
 8QGIeNfYAN5U0UMNSv3ogBRDL5r6V3eGJSxgsdkSt52sVnFZ9tCYYVIjg==
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
index e162d5e753e5..278c065722b7 100644
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
+	if (!ops || ops->currcon < 0)
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
index e645b96d2700..324f726739c4 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1111,7 +1111,9 @@ static long do_fb_ioctl(struct fb_info *info, unsign=
ed int cmd,
 			var.xres_virtual =3D var.xres;
 		if (var.yres_virtual < var.yres)
 			var.yres_virtual =3D var.yres;
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

