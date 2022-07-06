Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0541568C1A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2546E113AC0;
	Wed,  6 Jul 2022 15:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E4E113A0D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657119775;
 bh=aAI6MGei57ToZnfqLXmEk6O8X9Iu9nKAw4TPGrJ+zZw=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=UQXCk9VOh8MC38U13YmRH+oDLIyYbYMoekcu6/SxDmxCsto16359rHFgfHUYYGTv3
 AdHyP55AmuY1Iq+YJz5odwDHBy4reKbKzcpUMNfmer9cGd6pItwHE+QM1WMTxqjV82
 awr8vZNX5y2suon5GUj6b9t5uH9AI6X/mso40CfQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.134.81]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUosT-1o04A33uEr-00QngL; Wed, 06
 Jul 2022 17:02:55 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH v3 2/4] fbcon: Prevent that screen size is smaller than font
 size
Date: Wed,  6 Jul 2022 17:02:51 +0200
Message-Id: <20220706150253.2186-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220706150253.2186-1-deller@gmx.de>
References: <20220706150253.2186-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l9wU75eBVCDkKqJs43pST5O/nc3vpHLDYyS4OlJ07y+DJXOGTUL
 mpIrzg2dP4h6jSvvWS3Ne/TMB0tGRZ4ljuHN9zVQULfvEGhiVHlvG+6GFtDynQN5Cb8DIKx
 3ytIk0BCdhCRO0Z3xrbPEDaVPvbiC9qjTvXGzFhTVAFINLlSEjrIv5YcbvACVtbD7O9F6JN
 RgQEg6eyqAUapMdt3wubQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:totCYmyAkIs=:vWWIR74FuHGdFURhBJcwPf
 gu/sd0u5bz7wTzfK9r0GS87wvaU+CQ/ueO6ru9yDZ5gS5rDg3gOE6Q/sfN7yNXqc/4sajL4Vd
 SwxGTr6kAzajx4aPxssuqL4YY7neV8S5MhI+VHxnzB8/CFKoHoAw4JFMwCgO4IkwblBAM6260
 dbxBnCPw5sP/Ay98SXSrjyjg6ToUPPLXGY9wziKIeEVBOfLOPIN3MpjKo0n75hhNJe8pV1fx5
 cfTS0vR9sLcvrXiuEUViqkCduEAGYHkwOJmQyUZLKOPFKJze2ZjByHc641N+rpLC6H3dC6nfs
 DbDlwP59aeJENf8XbZTk1XdwOnLMzYcVQN/4OAdpwd9Tu/6ysVhvS0YzaF1HZG38KsEWv6sci
 j967a9HdQLKKdOxt4rXmAXGE6IrmrbBIBoRXJLnDBO69WSCjoIlWpU1MmUMqE5NQT/UA7S8q7
 oCjnFPBz5ZkFDQR5p5ucVh2136EUK0M9vXPEJnKMY+cZyrZ28WbQ78Og6EeMSndpyjTrJfzTn
 hVPKOD0N+0xMTL/tKm40Hf7QKPzZT0fsIk2/Y/tJgfqbGR83LfJ8jkvQ2MQUt7aoPOoTYSzwz
 NKDD6C78o/lcEKgSVFJv/xLdNObqkxOf4fuY1Kf5R6F0yFG60L1J/8WJ+c4t46gZOXan4oeGH
 SKrVct0nvpap/hwGPlmJpXXkepAXk/wArpvX7sjlsTLtES2VVSoxb3e/hlKBYqHMqnYD5pSWY
 DPpc2waJeHVCVthrdYODy8UaMlVbPWbFWUhsafavTgEGDbnwAbV/vV4oK2pCIYvL53ufFsWgk
 VBhTb7O9JuWnDazDSe7WxIs47kxhaZe9sbk0/SBvhNuIGTUm/EfM417jBfqR3CBJvBDC1tzFa
 2xH9al8OVXvmZqCRqJK2+v1p5yxX/WV97QHO0Fq8UJpVCzpkXg3UqKNH/BZ/VTjlCbp0hBZWX
 ePX4X7qaWNZd/bl2/MeH4nuijqlK//jzVV8YKxw6KyzaRaBBXxOud7OfuZ99f++6bkryBHqaE
 m1Vy+bRrSpm2DHAeCYtcl9zAoicQOqG2Y0TcdYgpE/agUi+Rkmw0/IHbAIKV3wBx3MNT8oNL6
 2SqN39t6iIm1VtIG3yXbRxEz4GyxrwyHDA00wl3tlbMG8I90hSBBwrpaw==
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
index a33532564393..5632870a9aeb 100644
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
+	unsigned int i;
+
+	WARN_CONSOLE_UNLOCKED();
+
+	if (!ops)
+		return 0;
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
+EXPORT_SYMBOL_GPL(fbcon_modechange_possible);
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

