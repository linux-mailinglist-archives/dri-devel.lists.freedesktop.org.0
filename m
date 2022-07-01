Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD3563AE5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1918B2F3;
	Fri,  1 Jul 2022 20:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8895618B2F1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656707034;
 bh=rxU496Ea/xTjK7QokoK/CvWIPeV4p8ucxlEYuQxng1c=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=GyqwgUOV836pRDoRizlIXluIsdOvu32xv5SDibU8jYsvUhfHQYOgdaluGwsNTpX8a
 Qm9eg3TlKLm47nwbCMhu5LsHJEo2tlO+BS0y8/iB9iz0TWlPjiLcOg1xr2dINLAmU5
 zFOmkfkR3FWJrGNs9YFerOsGY9nuxq2qMkYTgn5c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1nIO2d3Nd4-00pN1a; Fri, 01
 Jul 2022 22:23:53 +0200
From: Helge Deller <deller@gmx.de>
To: geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 2/4] fbcon: Prevent that screen size is smaller than font
 size
Date: Fri,  1 Jul 2022 22:23:50 +0200
Message-Id: <20220701202352.559808-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701202352.559808-1-deller@gmx.de>
References: <20220701202352.559808-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZHYTlOGKyFeiwiZa2YYz4S0Wnm6R1fmU1XmicS4cmLNG0W7rv4T
 G/QJb0lvetmDVHjRM1rmOMzXWnWvwdsRas3Wc/l6o7mLiyztK1U8cPeDtLZyDOJDSCGuqIf
 Pc0bYbHR8MfUfsSWK7V7oK6FOyapwC/HYjjgzmyHqB85DJyoEkmXkHqeynFzJ6vdqvyuu12
 03zLzYgcWQhfM/QGnQr5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TQhVhJaK0ks=:ZoWst0gtGN1bRV5t8yived
 vle+ooyvJswph8i1Re1hTZ3fahmnvv3uL5VKPXOrAGuBaIypBUDfhzO6T85x4Po1RzVGOreFp
 32jGIpEtzBoUxCimNOMs0m7mXF62gU69gxB9c11NB58pnS9Q+Ta8TznMVhOD/Gh/msFYMEPjp
 rB7vtAREmwmyAVbsBccd2vjIiN1Rx1cCgzpSqor6Lk/pN15ecYfmgHUAwgHqS7NM2QacBkHyj
 jJHqfKHi+/Sxn72QrdYNDsx5Bm1Vy6MD9MoFW5lgTRqvGWccrK7n2TeiXDX/adZmCxItdI7xB
 WZ7fxSifXCDBZuCYHdoWl9Zpa1LY81Ws74ZBwoeeMCvGaK8QhAhZJ+UpkIndyZ85mn8TIJJAB
 dnDpKPuL9OySs2UbJNtFA+4kKGPR8pyvzcZ77qzfakQgZnq3JBKZMds6khKYb1mN+BKK0vZME
 P1K4LzB91zo3sm0hVupLzR2onwdJv8jLFWxxoxNt1mr8NttTq39nkU9sza2kJyfCCOy6tAfSf
 UWrv7QyBvjJ1SgysScXTw56jJWtwu2nZsgEuQ/kQd9lhpVRJaeTZImlZjKuEzjF1PGGLKN81G
 3hYqdqXp7KSAWz/sK7QCBgC6ywF/11w3S2miw0wfVht0VK5FJn+kalEzLtQGImELvrblTCiYl
 1u3TA4GtmSJ1sfpE8Q8uW+tcJP1sDKrb8+xOOuenz+KrbADQKI44Vp+ae7BfE6imPLtu4BEqu
 JSa83FeMsSEEi9vEIPQHmPXFNk9W3PJ6EIERf4GJl/G+xCuWBnaP4ukr/ttKPIpWlrDjFBLDj
 qdE4Kx3HcUgDGZ/EGJaHz0qcjcQ7cYsfJ4gHIx6Dq5UeewNYbxBItPYEGDdpx8LNFpCP0B2Fm
 8Zn2SYqHDgPycEpNldyR9EZCEaEOp0hWvu1ysu2r+BMEtgStiP82sKz/LACxveaYXcCxTo0il
 Kf7S3ZAvZOXB8/L1FDFPfQTSePSs68am8uHjCEHrNCIz84Siz1Uq2KuHU8oMjfWf/fpG2+cYb
 yrEuE+e6a3Kt0J8OqU3Zv8zxLpu5k5JsxNjsARbWdsYDftOHifRzbFCLPZwSJAS/CHnFlXe3k
 q4ZCYb0ht4xVJh2u3+NYA/6HO4bpZZ5d1fIq+QkYN1fFJ9x6JIktBgi1w==
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

