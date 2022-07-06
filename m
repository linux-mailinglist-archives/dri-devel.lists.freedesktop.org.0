Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC349568C23
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807A11A09B;
	Wed,  6 Jul 2022 15:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77EB113AA6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657119775;
 bh=GW3DuzvuRwI9vrVmC4KBb72tQNP4bGts663a3KHyz1E=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=jH9/YzGPaAQs+tsZZ8+r+xjhooK8hqOEe8lnkh5xAOUlP5h3eb6MYq2PQHcghJQgY
 dbHnrJMqCZC/0Hwvimt0gdBY52AvmFS/7+iA/vkdc9Z2qU/YsBHSaHrM3GdYqGTuHw
 hsFYZ85gnP57ZjSdomJqmKjdgXav+IokXoXmPcoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.134.81]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1nRHdk18aJ-010gSt; Wed, 06
 Jul 2022 17:02:55 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH v3 4/4] fbcon: Use fbcon_info_from_console() in
 fbcon_modechange_possible()
Date: Wed,  6 Jul 2022 17:02:53 +0200
Message-Id: <20220706150253.2186-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220706150253.2186-1-deller@gmx.de>
References: <20220706150253.2186-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rUXKDA1xr8he6K5j9xAxoe7qDkUxoxuinplCAnha+ol3fcZKoNA
 KZFd2GNFt4m2nT3+Fjti3DIC0M4sVCkMtd5MQa2lb7y7nCxmXgDg3M/as2E2UbcJaPbABJt
 /j96dX3Jv2oE+XnVdYgc8GcinxTo/NVSex9GjD5JP1SnF+WPjJELkg9qkTFsmWyfNV2w3ln
 nwRN09sIKCPFgpPhB/mYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EdIxMJLWgBk=:M9O/jsXDnOyzwBMYog6RLv
 y7+AAgmBZYIcokNw1zmVZT05NsgRYCu18tfCv4Omt8sScQI03EKYe03fLvAHznzEoUz48Z6SG
 sgMgJ7asdKlNnffO022fOadrZfEy93zj6VlEtIohvR5wXYI9cScVfdwpKeYB0WRJtnjYoG8vf
 jwqDvRq5R71j4cIji61EkB8bBVfnCWdyKkVQNGFOU7kg8fjnoFWWGvX7wtu/GeTnwYMxxDYGv
 yYm6QyTEuWfDEzOt8a2l9A+7ej5M2eXnKMdRGfAm5TLDw0EOqc2Q3BOIRa3eu7LJDakycu+nR
 9DZOcaqzScegmvAQzUpHIxAcMVx9Nb2DEuv0gVD9HgQhgnYrxjNH3vYz2F2H2LeXL/ALbe6oM
 0b0uV+99x8V+vlPGbj89WkDOC78T6EIZYcpHoYLPChQVN3Sh+X3+ljaAmeiu/kOUqTiVHrL4q
 W3mhzrUpsuXcrsorL9uqA4ukRwm2iQKAah1mw89vU5qcGTRRkgAn/R3rqTVItY416cM/4gvdf
 dvyP5Or8KtKkUDt8/lZtBTSdOBZdMqd0894MglP7Wgp30I8L9/b/ETChv+EVfzoYM8Af+o+s5
 32yT8BIjmEyQVxfSBJNX1nQUJwx1Z6ffIA37VcU7+yOLGuwjZP1IUpCfp8FWVSbQG+c7lEeFa
 hN0S5uhz+QUx04eKJbQIuvfJVSJg2taBFTXDIGkSca5Rd+ygL8RWRrGXmto55ZwQII4Y+CGBB
 tBeHVBcJCYCAyPSwzKsZbpSOIiY83z+LIYwS3rykKdgSKdqRo6+VpVLo3Qhsv4MYgM0DFqLm8
 kY5Y22fpIsnS26LmEcp7CgHStQaN5FUKtwV56qLRGQzIa9OAnHCp5ROGxGUJhYG5k7S8z14hY
 OApXbrXzxuBTnc+k/JsDswqZ8aAd9QrUb8F+FHay3g5X655lEgIkKaqfdS3wJbR8r94xcCTTf
 ox3v/ZY+fGHSqlTa7QRVEKDs5HWWfSvuoSOuI7LimYpO2e4jNu7EGCvdmhafqZpSut/IRmb0U
 8qkrgx6VInZg5w1Q5aZZZsiymSZUkUa7klL8ELYBY7o8TilFEiNrgrumz1hekjWtbHM+cr9Pj
 sh4HTCM6WI+t1SMXv/YQQofMhIddk2QREn6qn9V0AXHX3ns+vpij/S17w==
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

Use the fbcon_info_from_console() wrapper which was added to kernel
v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_=
info lookup").

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
=2D--
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 5632870a9aeb..1a9aa12cf886 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2752,7 +2752,7 @@ int fbcon_modechange_possible(struct fb_info *info, =
struct fb_var_screeninfo *va
 	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
 		vc =3D vc_cons[i].d;
 		if (!vc || vc->vc_mode !=3D KD_TEXT ||
-			   registered_fb[con2fb_map[i]] !=3D info)
+			   fbcon_info_from_console(i) !=3D info)
 			continue;

 		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
=2D-
2.35.3

