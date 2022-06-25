Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9355ACD2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366010E391;
	Sat, 25 Jun 2022 22:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778C10E391
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656194792;
 bh=mfIE/8o3iwMRsFJsNJhA3Pd2VIEUX0hccvso4RX5yvg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=WJHoAeSPlSYPNGbfAMaOlN2IUpzuW4qmkwj1Z6BCOzN4csh8I1mO/qYr3mJl3qDk7
 bOUWdLXnzHGD+UYHBvOTMS+Lda34lPhe0RAvqA7kxRLQiHaPa1gPE8l8Hu+hiRvfB2
 xVQmhCex9vEBx5CsjT0jMOFc82uSdHBN9UDzmLII=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1nLkDS3m45-00jYPm; Sun, 26
 Jun 2022 00:06:31 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v3 2/4] fbcon: Add fbcon_modechange_possible() check
Date: Sun, 26 Jun 2022 00:06:28 +0200
Message-Id: <20220625220630.333705-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625220630.333705-1-deller@gmx.de>
References: <20220625220630.333705-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e+aos6YQxRDiH+Yn5SqvV3sqRII1FoViM9WVKEVVgoLWnKZVYm4
 d9N3mCqhC8Sz6QnEvBFpLwuShwHoqsJNX/CpxCj7yG92vTX7nYOYPpk6rY/rW1Zjlo3dJza
 2xYiVBlAA3Sjzt1IHIiIDUjNQ+kEvQZWdziWMyAAi6A/GtqqckgnlHOmwy7B/9hVVCpCqoP
 B3FDFfd2V46GU8RtB54TA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ShdSY/THac=:FbquMf56hrvbvSPduWiwHz
 nTPQZuAPtdClfucIggVA9/mBNDnddtrD/iSeKWLTs256Qk5wZyLNrdOQbgH52DGioPijiFDNG
 aa0YbN2cIneptduIkW3n2GqxZwhZpz620SGV19j6vQdKEUM/F3us7WwxQa7zU5+yrurp5peC+
 Xgzv/kh7I/1UgB6FTA8SB5mQcB9BQ4gvIdN6MEmwml7jplOulrSe2azdWviAPObmyNYLV//Sb
 MEhx3+iM7DbQkQcAOD/LJ6A6y5M1XMmb1wXbEY2mkIUARKkKNT7pxv7ph/73L/gQyEYRwRZ99
 PAZUlXXpX+byOrADBjTGfN4tU8A0XoLjrOF89EUbV/x6Nk/16sPy2cAnHeyCCYBj+M/5ceEbc
 aw8fqnwZWurFN/VmiNUxHXGIYV6/lfUAwjmI1RE9SgHHDClOPJa64Mhpxku9xELIAFZj/l+N1
 V/TvsMtiGKj31uo+upJ34MAXp0EYhZ2Cg9vfKj1cvPQP/qWOwyB51fgCc/qFacNvsKDy0jmft
 WwsZqJ0NEalnfd7Vouqq+TUUUc9YOBX7/ApDXW6xAW/mDM8UvGSM1QQ6onkJ90tMTkXXAAvJT
 uCq+dBjAoKTVfAEqK3kJBevvq5j+B+jzNkifpTU7NT1mW8Vu6fPfgsQ74pRrVpzBBz+xddJhj
 gBMXoBjbrjUbOhZz263vxAwdd/wKeODcgEVdAgb5HZYPJXOlsJeZ2du+l+hWZ+hQsDDiCcRma
 rdg52IwWGlYmIaj3ziO78MlP9kIZfc3eCrNt+23td+YuZFJ3lBRpfnkc9NGo+5WKmW5tWBLGm
 zOcplZtmJcluivq16JwT2Q0KZ0WsmHST4W9PQe9+/A2v2ZaH9Ds+Yd/P0fB3OPVT7d5xmuihA
 s2xtFVnMVph5Ahz6nFQ65p9aSfWY6gUmg/8roo80ywnpjIBy2PbHqcObSdtuRR3Ux9u9Bq5dN
 JUnV5wjmRVU/49j+T7UWBRW8ileuV7xx6fJWH/QE+ei46OchdvAQm11TpdU8/aaDQgRFUgwnq
 8I5REr5gCrj0VNcAtN17A9mKHDmvA6RdCPbP8ToteEBSWMTCZ7IBK9G9zOtHxM9eQOGdE7t+i
 Tw+qaIxXCkOoLdv9kCLzKmu8kTgYmfJgylJBv77RS8k8bl91UDwfK3+yA==
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

This patch adds a new function fbcon_modechange_possible() which implement=
s
this check and which may be extended with other checks later if necessary.=
  The
new function will be called from the FBIOPUT_VSCREENINFO ioctl handler in
fbmem.c, which will then return -EINVAL to the user if the new screen size=
 is
too small.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
 include/linux/fbcon.h            |  4 ++++
 2 files changed, 31 insertions(+)

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

