Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686B55B128
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 12:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6F113099;
	Sun, 26 Jun 2022 10:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407F410F07D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656239334;
 bh=3Sw82lkSjqZxNWiIpejvkxhMJNaG76mq4c20F06FLKg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=DcZBE6Qsmeu2qj9Ym9F0Du83AHMv5/5hKzJu4nFeFhpK3Dx2mPljLQut6dtKOE8Ig
 +6iwL7S2F4iy4z/QJyngcVWsGhIEfd++gZTJwHFOy9TJrGIIAvlYXnqGSj8C5TeVUZ
 P6fZV/ZpJM+snBeCUyjXxoKwnjRFbtBCGF1gUMKI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1nVFoQ2Ws8-00cjxr; Sun, 26
 Jun 2022 12:28:54 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 3/4] fbcon: Prevent that screen size is smaller than font
 size
Date: Sun, 26 Jun 2022 12:28:52 +0200
Message-Id: <20220626102853.124108-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
References: <20220626102853.124108-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R0ceq7+ogNGriXAIO0YtnBZPcu3UIWlsE4GLFTzJx2CtDdNn2DV
 CyuXHD3UAZUULPpTVO4DNYrBx/iobK8uLl+GHcagOvx/mMzfy0Z+6zJr/2+EBSKuHu9tuXz
 ZhpYhDXWNMJ9sPTH2UxHMfuKFm6XpqjINT8BKEIX8ZahGxH8tJfJMC0R8j4IcxWzha97Xeo
 ZtK5QU7Fs9cGMH1ThNsaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EyQ8h8phWkM=:ciNnxDzP8Po0Mfh3RR2C4N
 mP7Y/bST5N4D4f3QN7XXgWYnhfLeQq/fWtyQfzHwXKUi49mivy1kPCFyu3jNNqxt2XQRQZdDP
 9nMQMe69JTM5D92TAJsjMcsOnbaUb0xqyUK56PR88RK4nqn1jzbVeNs+6GWAD/2db9HZfH3X5
 ufUYq7GhzphbRi9Qy0vOXt+K38J8iqcNkYHkbI2S6kZeTKf8x9pAnSASEcP/hFHtJ42tDzuvi
 lVPBwxmE0xrZScFeeeJp0lODDZ1ua8706PRE4YWkELKHs4tckUfbN6Ac5Ky64zNHRPBQyGyum
 AlQR7bHRQfFKVIo9qqNeM6WA4S2XV/X6XGtGTYrIZHuoD0YOe7Co5VwcIiqX6Sh94XqV3GATQ
 UPUNvnWL6n3ycj7veSuvoZQx3v4N76GY3KPspb68Oh40d/vA9453Ib1VGTuBykR5pQ5iaMJ3E
 em4tCHpk/pEcQ1JmLLl00ofIS2kcNpdq12V1myC599cU2dzC5o2OIeoQHMsm0wzlBifcqIY0E
 +WtzUo82X4ZjvVLYXP/nZ9PirQE6i3aOozfUZEu7Jrr5E+haXibP1K5l4IcPPb0nwTVvEL+03
 QiiKeXXvu2mepUfCBz7hKZrbIJseMd+tW5pqybI7l68gmM5sH8oY06/eeffY61ajmJMaQptX2
 FUZ/cWAd6X/CAGXQpMyrBBI5rCYmkVrKCORILyXmPmsO04wuH9gG90HFy6Mru8vIJMBd/GKJa
 CqFEUhZdrbTlHbX39N7hPtTGkXmxOqyIs91aT/Q3+eRawZLwFQDMyNMAkWG7SVkg39TWLlFvA
 828coDs36dnlk5DIeOeJIAnHRJXVFJLRmtPOwFVYyw001pjyZxSmyzwPa1Bk5onu3vnODDeer
 h/OCUkd4mThK1+rOYq/YbvYjjhA6SdrUK39z1QXmjN/23Uqo1eCQq5SWGmj4I696QKYZPyEb0
 xqD6aio+jU224gWkou1auBIJizuPUZxJVb3lhJT5eYq+a9SiSq/9ml9R5kMAPodsMTbZPWenW
 uuJn75Il4zhcXEvWWgpFdUG3kVnvlAP02RUsIFXjQgaRVJhH93hYgZnGf8OA0aURTTKa/VT6t
 D2/NtPZHsDcgnG2PlZFoDpMDn5tYlmeDNtcZs0VC4NMo0pcIGsrrAv79w==
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

