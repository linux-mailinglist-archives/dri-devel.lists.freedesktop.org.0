Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83255AD6B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4CB10E40D;
	Sat, 25 Jun 2022 23:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E089510E7F6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656199624;
 bh=nfABXp4+4Nirl11sxz+LuJ8G0460lBsNCoiDTu/FQT8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=RNxzvEfkKBXioLdUqcCbzQXsHLs+ViVgfhiDCTbVbca6S1Q/EidBqj6hpo7OPcuPB
 bX2kAyVyG/soQtIvcog9QzcsfIQvB05ePZufsk3UhGfU+2/4JaFy1mYiGT2s13b2j9
 dTXjW+gocryUUJGYhJFauuF+U2oEGTGCCrhd9lGI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU0k-1nUoQu2QoG-00aSns; Sun, 26
 Jun 2022 01:27:04 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 2/3] fbcon: Prevent that screen size is smaller than font
 size
Date: Sun, 26 Jun 2022 01:27:02 +0200
Message-Id: <20220625232703.401821-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625232703.401821-1-deller@gmx.de>
References: <20220625232703.401821-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wkuZk46WpVrZtroQJngQJ56MT8kBhZUkpKEwH0MihMZLa3la8eY
 c88p54UrCwJZ2vo6KLnTBzkuU02KKxr1xvlF8EtvpGHEaP7kk1+7+r7tCAq+zOX1LQjZyhx
 HxcHT3zyAp34+aZNb6Z11TC3I6bZewvBg6e8SM9g2TJOvrY9YbTCPM/5kcK4Svm0IZETsol
 J6tmz/hx9l5JNPrMw2txQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tt+6iidaFxo=:Uf8yC0Lrwlb/Uym78a7o+H
 xi30oinsHXhpB8Lqx8xjWUSXouEoTLrMgGKJQyFPxQkr2QTo4YFatb5JRaNzBB8XC9+bCFVB1
 SPtz63DkwsRQF1Bb9UJWmelzHq5LKewzB9uo7yPLCyyUS2i7REicn6aB5PGYDLSfnhjlPcLzv
 NwUj4KWnHbcUmG/YqDAgwJrcekHzrCLL5fdmI5zlUMP5byuDoKhsB7zJddf+cc5xWfTnH/NbA
 N+tvW8yJKyC7z7xNN201n0KHC4nDRx1HYt/MWDv801rYOntMBU437nh5f+ss+/zldqlF2jqOX
 7ER5o6jhk6LVPEq/fKcdFaHj3I0d6Jq5pUfYINkOXa1H8Lr/gJp6eP6LjqZI52x/C6OfCfZ+p
 YaDx+uqzmKCvDHopatfKaEtO79Xzz3W61UhtZyUXIoNiB5Ms+KyVMxtWvrU7/jKOSz1mMxSON
 0+S9BnNR9qVqZUmvZmS/mCeb2e+Kl96Z6DqxhTkydAdobmp8FpYFe9vqT1XryLhzCE/1SzU3+
 6u6xnHUxG2BzUEnoZGQEj08WmeVuiC3rOOU+qbDIVVvb1xmoyk5ennRd3R5LPM+aOujXgw+je
 g3qFbQurRLoozwKnZEzxnHTUXhelzRFPp4ciMaLcSJU4xSLSWPpkiDNggLZo5AzRy5dqTqLXn
 Q7JGIlyF4zlTaflf4La7HO2MUCjFoEByqVNM2Ov+NY7VHPON2rkqEcadOflUax/4jNQfnX12f
 2HyWDXzKJAXlDlWM6VS/q78a51t5ixSuszMyn2VS/D2edFLpEdsb5s/3SFkuhYRk1hknIBbbJ
 2Ur9kojDD1VwEFl0F4eesr90aau5K8q/LUbPDFNO+9CSvAJuv7nKn8XzaTSeQbmej6EROMaNL
 wN2YnukILbaEld/sgTvWiO9s4SKWsE7em35RqqyP7tt1pWCiWdsnsInvFJ8RSHZIgVRKe0kbF
 QQMS/VOJUGEKmLP102yw9qJf9dhcEZrrY+d1e8OuYHTvKwrM19PuAeLPXKdICjTSY/QvTNWsZ
 KHEnXuN3PzZGpYEV9VG28RgVoimWHA8b5CBq6qiv4ff/EIaQuLMHour8TeSpysTQvXEsBJlxu
 c3/dLL5M6Dd8Ci839pY8/GHa7bcX+SCFBg4XKQ9WTmqZoZuftRFm2elUw==
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

This patch depends on commit 409d6c95f9c6 ("fbcon: Introduce wrapper for c=
onsole->fb_info lookup"),
so it needs to be backported as well.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c |  4 +++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index e162d5e753e5..2ab7515ac842 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2736,6 +2736,33 @@ void fbcon_update_vcs(struct fb_info *info, bool al=
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
+		if (!vc || fbcon_info_from_console(i) !=3D info)
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

