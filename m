Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B340A55A9E9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77941127E7;
	Sat, 25 Jun 2022 12:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3117810E5AD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656159903;
 bh=t70CimBb6l0u6Vi+5r/ENmuEcpUumwWJgoX4WVhyEoY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=JPXjueRtIxX258BdSHZGmjSATpFL5jaeP8TrejOaLpr393j5cS8Qr07+fitDDQLde
 y/iRGzaAs+1AKkp7RQErSDWRXS6l5Lhcd00Bfkbu9+6Y7LoAEoEUPS8G3w2whNOnLj
 WdnNrVDLjypI4kRSD/JAJ4FlB0rW5Lm7UlctJY0M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1nTn9C2Ubx-00gLVY; Sat, 25
 Jun 2022 14:25:03 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, deller@gmx.de
Subject: [PATCH v2 2/4] fbcon: Add fbcon_modechange_possible() check
Date: Sat, 25 Jun 2022 14:25:00 +0200
Message-Id: <20220625122502.68095-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625122502.68095-1-deller@gmx.de>
References: <20220625122502.68095-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/OqXbgSKppxYJ14/66zoTizZ5YPaKvTHBEl5XxSwlIgfQXYMDMy
 Bv+DemUpypzr7LFLGGKMzor+whYSILThX7mEbNw3TW+Y2uLRBNzbM7tslBa/9Lx3xEDsRGo
 Rs5h439dIfODbN3zabcsB0g608dQ5xrCQgJVDKi+PavNzhkXMJQgi+Tkb7ydaJts3Oa4/VI
 v1xBKgR4Cb24o4dllVLrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OCxPORhHytI=:qCj7g7MTEZ1/GMuxQ+Yway
 EoXjAGXIi/skgHA6xHfqpLnUYwVMXHtyrRTeTIvm9mkpa4W2dwzcsrykLBCBZXp/GyQTXZWz1
 IVMykoiS2Csjf6b+8wgmwGkmRshRLgFiVStoqL0rN21ZiOSuYaSsepLe+lyr7Rku6Iza2VwxJ
 htiniCEruXseXO/JGEw3l3WwfTwgl4fiIFilWJkKh6Tp75BvLY9tE6LYt9H4OBnpyWuh3uQhe
 BBo6dGAYBFxKQOY6ozJsIBZYpZRquAckSOOqQPgmQYvRhOWA4Oju6P5v2NJPRsRG0RmaIW5Ap
 +utuLdGEvnxAg9TL+faIIuUN5bXxExGNuZdUx0plr5TzXbJoXQkx6xGZumQfxdfNmI4EASh5K
 d0vXup/tyTHCKLsi55wEBgv+EG3+uf/rBYYS9tX0qfB5klfMcgHpHkPkT9Z5ZqIgvCtg+og6D
 w/1quD45/umqYkr75J/fDdeDpE+kUC6gzxeCnaSdK/fdrqQ/ozhmZkDBN7LK2Y0RJOeRSX8vB
 FkTjFWXMXRqfOKbSEPY0BiAf9AzgN8fCHCQDqmz53OtBygKrCTjMCEfEftPfgsJdlylhhqiwz
 sebCXbpmtkfi2x3GS9RAObB+QWdLvtajG80bglrQvd3M/ZXcoC4y7lBLys6xW+CUzki1uW9AU
 slMmCtB3q736cz8pMPHl2m/47XUVsHTQ1i3R1tWocrwcM5o5oSkGMP5r9bDyUp1zsI4sp0TzQ
 nfpn63yb2pvAcvmdq9p4im1ErYVDOEpaiiusbHqcJ1PqL1XY/oZ+M20oXRZUj+gUEleGp+cxg
 souVeqo8c8PF6bUUQXI32T1d6FOZQk6/rKJoJRjGzn99iYYQrZ1IP0p2he6XLG5qdSEU5966i
 jXnie0ggPftpDbbJzAlMi/BCmnuxCB07EbN+1wuEWpgZX73zVAJpSlRWtXHU5ul6Rp7OBDhWz
 bsjwU3w7h07VuyLheAAkulkSibc8AK0rioIaR17oA3zKiAod3ik/dV/gI0Uj9gRmrRpgfVq9g
 79INSZI07sgpNGk05+YQ7uVV35pEzYqhrT420eCtDZFcVFEnUE2Rc0RL+VmLq3P8Hi7VIu/q/
 /uq5YsRwhroJ0cE7fKhCuXt8MwywWQkSyMXFe5thxM60qYpYyxDeygi4g==
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
 drivers/video/fbdev/core/fbcon.c | 26 ++++++++++++++++++++++++++
 include/linux/fbcon.h            |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index e162d5e753e5..e4cc4841ed7f 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2736,6 +2736,32 @@ void fbcon_update_vcs(struct fb_info *info, bool al=
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
+	if (!ops || ops->currcon < 0)
+		return -EINVAL;
+
+	/* prevent setting a screen size which is smaller than font size */
+	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
+		vc =3D vc_cons[i].d;
+		if (!vc || vc->vc_mode !=3D KD_TEXT ||
+		    fbcon_info_from_console(i) !=3D info)
+			continue;
+
+		if (FBCON_SWAP(var->rotate, var->xres, var->yres) < vc->vc_font.width |=
|
+		    FBCON_SWAP(var->rotate, var->yres, var->xres) < vc->vc_font.height)
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

