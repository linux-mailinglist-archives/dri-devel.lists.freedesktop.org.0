Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8063E70E2D3
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FA10E48A;
	Tue, 23 May 2023 17:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6753D10E109
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684863524; i=markus.elfring@web.de;
 bh=vdGIrfGbI4fUpNb7F4YLU0TiyBkiH6frHykp16SFXvw=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=eEhcPfc/jeMIL38oZCfDZvOfw0CBo/QgRj1/IUtlmeFD78OA/p9fg/BD/aAgzSrJY
 CuMK8yQcCFK8YThsHf/K6ieaVpeJjfRmRFwVl9EEcu8KP/B0CgHkLXvIf3gWEN8aGT
 m0y6HfJwDRgJ2zCw3Sch/c8RIn1j+VliwpUdMMtT7Ls6KcvWK3AZzvkFtBC/IM8jEh
 y+Avs6f+vdQ0bK88h+9xog4/qJLstTAeE39NCYki//uxUgMWDms0CsjekiqzubhoPD
 Dyn1YCx3HVdcWqShdoYIKq2ischKaGn9qOzNI/tv+NfSue1NeTHM9N7hHnN7g1UgBH
 AmCE4jxWvThSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1McZnl-1qXY0E3dT3-00cx6f; Tue, 23
 May 2023 19:38:43 +0200
Message-ID: <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
Date: Tue, 23 May 2023 19:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 1/4] fbdev: imsttfb: Fix error handling in init_imstt()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
In-Reply-To: <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e+SVAKZDjUgV2jhbo4iX+NViHhtDIPBuRJ1Z8q1WnjWuYLIeQph
 hAtq3iVkBUzNapFSjzuBt2ttNKuE7ypwM3IFtjWILbQ9Y4gHuG8V4wqxslnCaY6OXXGBaUU
 hmr8paOJXIKrEjql4iSL32cVSHD5kf47zgv6HaGIU6OU0+U1WeXC+Y3VNqlKEXPw7R4yyIm
 6qdxCmeeWlmapdFJs8/ZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7Yzt70kqrtw=;iYfceZoq2vuPTPpC4WfnawjTkJX
 ZZEiHjk7/8OaoTvvlPSvY1zv5b3UAAmORwi80H0wdZMHWvHmxUhS4STK5VX1Er7i5sJjaE+xS
 XPIBpUAxsQ/RRC/QyNwaUMW7wYnkaVVcFKQv3+Z0m0wErGIYzXRoP7BMoE6cmAvC9vshMyVhs
 PehItICtU83OqFgEJ+rrdMUO+J8PZAZkG9n+g1i1HmyuBaGdcK69S8ZzahgdH7vxg0Q/oDGq8
 685AwrecSrchksseVD73Zi9fCRpD3ziKdx1S8Ou3ACqhPTnTLViz4W0UbCjcJ569HNawZ7T8i
 wbQPQmy6J6/OKD1FJ51dGlzn3MO5qeeQYfjPcgc+aiWD+nyTiYoxo13/0t47eCptvHBfAer0s
 Tuy27+H3bUHedPVGh1t9pbxbxrf8vn90xxOtiKNVKMED4ZTfCpt0vBEs3hXO4nDkqoZqN699t
 8vjrCMtS/jX1bJeTFTWSM7JVDBpkebTHpTeJOm517xnphpLk3nllNHi84QRYnCRu5vAZd7knU
 TomMDS9I3LJ7Xob4JRGZ4zdC3Q5JfB67yVg8vrGptJUO1hQbV580//DKkR6NijldCQ377UnDR
 V1N6vJ5Mj8BGG/dFwX5zZjBoaTT2+tJc2Mh1VavR1uzK5xI6NztelFTHmGd039amoi1ijkUHG
 4wlHwdO8l7qLvfL9opwaMxhWIlHL3gL5x9QsPZt5YeQF5H50s7KfiwJe6nvTiYpTvnYLXKQRt
 bCjkCldbksfyM7M3fK8B7rK1jYYfwEp28cMPZ41689MNlWJeQp3RvV95wG2okw/sBmvRvmzH0
 +PuzZiJNeVXdb+kabVaMd7noVp2lI/2HeRmhTlR3jPTD6BXi8I5ASJU9hnF40PcOz0F/Ipgkq
 zgtGFKYiBP7FBdJAR6/FOsz6yPSm4KaDl1a2xWwReKDoJ4Krj57L1QjA1jRUYn6YUPIpRHsYK
 eNuTGQ==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 14:32:39 +0200

The return value was overlooked from a call of
the function =E2=80=9Cfb_alloc_cmap=E2=80=9D.

* Thus use a corresponding error check.

* Add two jump targets so that a bit of exception handling
  can be better reused at the end of this function.


Reported-by: Helge Deller <deller@gmx.de>
Link: https://lore.kernel.org/dri-devel/069f2f78-01f3-9476-d860-2b695c1226=
49@gmx.de/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: c75f5a550610 ("fbdev: imsttfb: Fix use after free bug in imsttfb_pr=
obe")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/imsttfb.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 975dd682fae4..d3532def4707 100644
=2D-- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1351,6 +1351,7 @@ static int init_imstt(struct fb_info *info)
 {
 	struct imstt_par *par =3D info->par;
 	__u32 i, tmp, *ip, *end;
+	int ret;

 	tmp =3D read_reg_le32(par->dc_regs, PRC);
 	if (par->ramdac =3D=3D IBM)
@@ -1419,8 +1420,7 @@ static int init_imstt(struct fb_info *info)
 	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) =
> info->fix.smem_len
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
 		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.y=
res, info->var.bits_per_pixel);
-		framebuffer_release(info);
-		return -ENODEV;
+		goto e_nodev;
 	}

 	sprintf(info->fix.id, "IMS TT (%s)", par->ramdac =3D=3D IBM ? "IBM" : "T=
VP");
@@ -1452,17 +1452,25 @@ static int init_imstt(struct fb_info *info)
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;

-	fb_alloc_cmap(&info->cmap, 0, 0);
+	ret =3D fb_alloc_cmap(&info->cmap, 0, 0);
+	if (ret)
+		goto release_framebuffer;

 	if (register_framebuffer(info) < 0) {
-		framebuffer_release(info);
-		return -ENODEV;
+		fb_dealloc_cmap(&info->cmap);
+		goto e_nodev;
 	}

 	tmp =3D (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
 	fb_info(info, "%s frame buffer; %uMB vram; chip version %u\n",
 		info->fix.id, info->fix.smem_len >> 20, tmp);
 	return 0;
+
+e_nodev:
+	ret =3D -ENODEV;
+release_framebuffer:
+	framebuffer_release(info);
+	return ret;
 }

 static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id=
 *ent)
=2D-
2.40.1

