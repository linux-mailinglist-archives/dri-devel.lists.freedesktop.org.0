Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFC43226
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 04:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97DC892A8;
	Thu, 13 Jun 2019 02:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470389274;
 Thu, 13 Jun 2019 02:11:03 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so25404960edq.3;
 Wed, 12 Jun 2019 19:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=0cVvTv62Az1HTrl8FUiIHyxSc2jG6hN8Hla75BR5w4M=;
 b=icivoTmYlkzsyniDAT9m2aiAKy9H/hbo2/j6AaMLWA06uRJcLg+ghmXBRVpi+WOJ5c
 O8T/C9EHDGplksE1bOqDpQbeiVa1JXaQ0BwybUDhMUC/G6R3YmYIkaqOQl17xf+LIOM+
 f/LzaBLpaR+341J6ErkDuadYuCKzgREI3rfksn1yx10P1eQTV1VEP1w8GO6tbB0Ncy3I
 Z28cJsLjkJt5F2VLRIR8yUn3pJN73mcyrk//jfAzP40o7HGvGOxegXHSHBvhhIIR3C7O
 Ijw1GDuYC7QJwsgkd+6gMjbFuaagbwXc0Cw6WdFw3AFWY9wF23hMOG35GdBD6UHf6kBR
 2/6A==
X-Gm-Message-State: APjAAAXg1TZyhz1/HUPp+JDr/gKwIQ36p+CKnHKOgxDqhbUsAQNYHNEv
 DXQbTAVfxxb4vJXAAjl0P0c=
X-Google-Smtp-Source: APXvYqzLd3ifguWITMiOZcgmncv5B0deo4wOLKQDnv7+CdbJeThnYCTF1jdNVtCFDE3yxhQCAIzN6g==
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr1902254ejb.42.1560391861842; 
 Wed, 12 Jun 2019 19:11:01 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id d22sm267726ejm.83.2019.06.12.19.10.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 19:11:00 -0700 (PDT)
Date: Wed, 12 Jun 2019 23:10:54 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RESEND PATCH V3] drm/drm_vblank: Change EINVAL by the correct errno
Message-ID: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=0cVvTv62Az1HTrl8FUiIHyxSc2jG6hN8Hla75BR5w4M=;
 b=QOaYprUy58aYx9mi4m91RPw+yTHHislGhUo783bCLgkBVWrShDTV6jY+zsCkdfCoqG
 eoauFxtYTWaOLjk5v68w7R1+0tVLBVRIGyEym6CgAfE5xjo+ZYn4i6532sT3AU3kseBw
 HoQYm9G+7u8HQjuPgvFyM5uitbZ3Ql+z37/l5YxAHXcJo1mkDgw54jy5iF6igvpJbclj
 b/OevCFYu83pizJrTwDy0DUaW89ilAnz4TvTdtnsSKkSOLrUowI7PvNQ+KC8FZkaXJhq
 KnU1FkSDXQXkmzOvDqXzkDwWFJ2gkAjRToM8IR/QdReoloeJTV+XiCeMMvUxeMVn++Tu
 aMUA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1424841709=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1424841709==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jmacjpd643vk5d4c"
Content-Disposition: inline


--jmacjpd643vk5d4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For historical reason, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace make detailed verification of the problem and take
some action. In particular, the validation of =E2=80=9Cif (!dev->irq_enable=
d)=E2=80=9D
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL which does not represent
the real issue; this patch changes this behavior by return EOPNOTSUPP.
Additionally, some operations are unsupported by this function, and
returns EINVAL; this patch also changes the return value to EOPNOTSUPP
in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
libdrm, which is used by many compositors; because of this, it is
important to check if this change breaks any compositor. In this sense,
the following projects were examined:

* Drm-hwcomposer
* Kwin
* Sway
* Wlroots
* Wayland-core
* Weston
* Xorg (67 different drivers)

For each repository the verification happened in three steps:

* Update the main branch
* Look for any occurrence "drmWaitVBlank" with the command:
  git grep -n "drmWaitVBlank"
* Look in the git history of the project with the command:
  git log -SdrmWaitVBlank

Finally, none of the above projects validate the use of EINVAL which
make safe, at least for these projects, to change the return values.

Change since V2:
 Daniel Vetter and Chris Wilson
 - Replace ENOTTY by EOPNOTSUPP
 - Return EINVAL if the parameters are wrong

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
Update:
  Now IGT has a way to validate if a driver has vblank support or not.
  See: https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/2d244aed6916=
5753f3adbbd6468db073dc1acf9A

 drivers/gpu/drm/drm_vblank.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 0d704bddb1a6..d76a783a7d4b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1578,10 +1578,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
 	unsigned int flags, pipe, high_pipe;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
--=20
2.21.0

--jmacjpd643vk5d4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BsK0ACgkQWJzP/com
vP/4gA/7Biiupy7WhSPymKnZ+eYD/VkGhQ4xZ5o56UC7EC2582d/qLV3AGUW5R0C
syX2HCKmxfNdpOBOa/75VOVjl9w6NS+Le/gnuVL07H9uW7zUefwWCEXNR7l1o22Z
htFjEkqX8CYCzm9WMA+iUqgcpp0Em+/6FkTqLcTIBQqXsBFNOdnK1UNG8H1yI0jY
r/Zl2a1Me6B3JtS3vLmBSRLh7xez+fOiX2pXbT1t+WZUlC+TGcIqn14WVaAXgJuw
XKYzQxl+FJadL291ezbozPXNy29ljZ5PNOvxnhcG4SA9b55WGWM4Zh6GjeLcQqgY
LaogzlZpe/QfTyk23C0efRUoXEFLhvB92IDWoeGo+brZG3y6ynQkGY7Xra0q1tem
i0u9QGoFmfbAvlNXvJwZ7Q1ZOHqUGxKvfg0AZO3S0hwV0wb/lFAN2INT2uRMCapj
VBipChDqv/9q+BLvMfyIMmpeAguVgA21iVtHHS61GvtBkj3tZVUFqlKcicQVe9rL
nyemMYkrzoeozU+6gVShDJXDonB8Vf7tWB0tqKIsrtfqQsIQ0avY/IMl/Bo++gV3
9EstV2YuONvhuL6ad2V5tq+ErwrQC0jaya8GWeO0TFGfiEO8XqvWmlnSvaw3+nuw
UEtMVj3H7eM4zJpUPNm0NoQwUpy6meETdn9pqbmn0JzEeQzs1Xs=
=Oj71
-----END PGP SIGNATURE-----

--jmacjpd643vk5d4c--

--===============1424841709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1424841709==--
