Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF955B070
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9089514AD9D;
	Sun, 26 Jun 2022 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF5614ADA8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233776;
 bh=GVwAU6WKhe8S6vd1VeXMuut4rnt9i8o8SJSS9oquiaE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=R6XKwTyRQHkJ86rmkkLu23u16LWOhcM1V70X8i73d0B8i9c11P2JyrSmOdLaOJgMD
 e6b42ZUs60PUSeqBqbC+PMQ88mrp97HFOpNP2n+MMRc79efr66+ziTU89ecegqmUoi
 Z3civmqaz03TG6Tvj82vdZQEdy0LmhxAJUdwMFbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1oGyfC2SKY-00Op9Y; Sun, 26
 Jun 2022 10:56:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v5 3/4] fbcon: Prevent that screen size is smaller than font
 size
Date: Sun, 26 Jun 2022 10:56:14 +0200
Message-Id: <20220626085615.53728-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626085615.53728-1-deller@gmx.de>
References: <20220626085615.53728-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SuX2yOZiuPtU7JYAiTcg364dh4uVVWqPPo9OE9S4tlAiXJ/YREK
 s6c+snpSuu2mXq1Kp1emoiCBUJSjQjZp2h1O82PPRuM/9aDEwz/aX7ZDptD9ENlGUWB9tra
 2NmMMluVVX6hUCi7sgejZC9oM1z5iotRc7hMg350olnjPpiEKrS7Hjswq2/aLM76p5Fm9kw
 HTWsz3xEBkMX7vrzZitPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MeSoyM6YPHk=:oWeY/G4fZCoo6TWyvw8YGl
 J2RMq0gOsbVkPf5pSsouduhNy1WpxZCDRrKgk4Maunc0O88/u88oCN72gpJmruYOEbItGnH3g
 Vm6bAvB98ZQ12evQWFCA4da1pLErA7e5m6NqHoyYXpd/wpLyZU4yaox2i7hf23JpzBewmaWpY
 sh0S0hfTcp7XpvA67YSqPC50/IYgprm0hGEtQ4lCu7GfVZM4omDzcMPvTbVrUeQwl1T4VOdb+
 4/qY8z8W88xyDaPKGgvuFIg8VRwnUSPe8W6Xs6iPEPS1Yy4y5odLBVmnCFHrL51OEd0lOqUza
 y3d0ejCpNU/LBn0XaNhwPOJBCleErjj2fs8m8GQy2V2+p8SKXqk9aRWvgLZHN/9Acc6YpkR7U
 cUutiuSk9Iy7PzTOU1vT2jr4dDxAOh0Am7F8czYVYMIPNuPwHI4xZsiLR8Tawc2sPhhwoxlWn
 +DnzKJyYnwZHLxMs1oQdCgqWCeag+IpL3es36PsvEx0D1jp0cvt/IMjbeGdY+REuKBhr7K2et
 R7gJuwkuwb6rwkOn1/rcCTlo5nNmidKhZ23S9lkd/h7eyT9psGKGbBCS/heNgcjRYSwg7HqNz
 INiOCyGevt2mY2C0jkZniQNXAsU+mlo/8eq95cZSm/a5FX+v3qrm8SDQWB1bjiYVtC/62P/hu
 fnVMSzIwGRn0VxVP3f40VzlYxIxWfexEfhiiugTcAs0EKzqxMuFF7pmeWLnAzoEeVtbba0V6c
 IyORGRgo6FC5rj9wJSSW6sdFIyoP4ey0MzmT3vG3GVjVSAkpmRo0AgBa9dpogj56O5jX3eRxF
 Rh8cE+yWqjGRhr2kSWYVIvuwbyX+LdAjTVN+a7ukDL/TDr5zkT/Vs8KAAB3uEFjYClvL4H+gT
 AFja8gSILvzl1SsuJWK/MB4zb2G+lOYRtU/1XVSouoyftLkAMMqjL+hWiX8/Ldk0ebTXWC9uS
 kVN08NFcDy6iWxvo/BVJ6Athyiw1HEodCSw8tKxGQ/gJyszkKnW8uubXJiAakuPS9S8b1R4T0
 ZIuRcpRH72WafsjhJIwnsizdnSn8SQd/Vi6n7UlZaZWiqCZ5PorIu7gWf5Mc3lbojM68y5NiK
 YhFvR0TnzltUTvP39eBWLd1TWTPxqvw/B8e1vT5tkdDtEha74lKnNoqkQ==
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
 drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c |  4 +++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index e162d5e753e5..69c7261ac334 100644
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
+		if (!vc || registered_fb[con2fb_map[i]] !=3D info)
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
index 5dfa4bbee642..b6e1d0f2b974 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, unsign=
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

