Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1347BFAB97
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 09:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BA610E115;
	Wed, 22 Oct 2025 07:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="br8Ajuvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF2910E115
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:59:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-592f22b1e49so76098e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761119945; x=1761724745; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TAuOFmibaRaSmRnnPLTvDUwbdurIRPGvDL2ua9DN0qA=;
 b=br8AjuvwuL2jg4VVv1I+H3XxbyqSpSqWoU0NnMfOR9uKdieJZ56Fyrn5BLHw41l/5M
 ZPB/mI3xDkVNLspQ3mYIbolegWWqen+60ZQxEaKevKi5cNl+PafXA71fmAGo1OOqs+in
 S74gYDAlBoh9T7XYItkeVKph148IRRe+bAwFCkSIlUN89pqk00gpMBLnOS4SZo163y7P
 z7dffLh9qIZTKPOc63Y2O6qNKkayprlMaQFpkZOCSFJ4FhinOFFFtjf92XHPJXMud2qK
 /5bp87cosDILEvO58Yv1pUhUBHHE9txcX/y3fWaKjM6jlhVPSLwuQyn3aWqyBYPwfnzd
 Dj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761119945; x=1761724745;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAuOFmibaRaSmRnnPLTvDUwbdurIRPGvDL2ua9DN0qA=;
 b=qBPfRRQAWpUKkEd+x5nLIDdq0dRrwOwLTXUsq+0ezh8lxlEDuxcfi4MG4lN6093iu5
 TItaR+D/97Hm437e25VX34QoDXyFHzsxvksAcRSxybb4fayhxYgFoyz9QfBvY88BVpIz
 cnaYweJIQTyOFkaiz4r1kkJQho6+Upzlju3gQmGTpXg0HdP4vATEHDjr6dnyXytfg/Vn
 Se3sorwe7eDF3Zn99kgiK3CkV/Mqnrgdx0woEz4g7ydVmzeo714ZB1LJW/VNs3rywWQG
 rZZB3Wufuj3j5jo3/83adP7x8Dvg2riabnbjJVY5a4TELtXSu4hUUXJajywGKF/xkUSm
 nNXA==
X-Gm-Message-State: AOJu0YwEZmn43cE3M9cIoRWU2YXwA7Nejb6JMd9ZnVpThcSGVivz85/a
 3SZ+/+4AOI3Mivcv6oa9DjYzupmo8OBm5r5mELNOogsnSqsJxNICwT4m
X-Gm-Gg: ASbGnctvrgE+1Cug40mguMmfQx2j8WEH9mFE/5maCIzCP/se3oqEosgbYFuNI4OoSXN
 eTMEZw+/m/PzE+gy3HVl/3gdlzBJ5m4vOSEZRMNuBj7H4L2YP1Gb2MeSADkrblPVE4MFjT5M03i
 risyaBnfsscsXYazAr93Fah2JTTP/UoSe9aNCU6LQAkp8Hel5JOphx7E8GsVEIj+XwU9lO06cT9
 64ON861T3taK5djQfQhoZ6v3EIAGegF8cQPmSOBde56V/vmQMQbfKaPTvzil2ukLaOhmLv+wZGV
 Q344dzsAlrOt/ClDirRbxdUFe3t2JnBwcUQls3bfaMib/6UKzs1iwZM3x9XDSrB1YAcszQrTTlw
 yKv9cvwPxKPVIP99Fh126y3VUAh7DIxAJf+vqJ7og4XehHWX+DmgDCMmp3lkj8b1U+wX1yGEKO5
 jYJvdWPez1PHRRTMuF6lcfncNm3RcofGE3UBStMZTicg0RmxE=
X-Google-Smtp-Source: AGHT+IGePF5GY7HyPCsbSDcURO+wThAy6H9Ui6FSBxLQxWZA0e6cTLI1Aee4qoP5LBvWCtthMvh/ew==
X-Received: by 2002:a05:6512:3da1:b0:585:3109:bb93 with SMTP id
 2adb3069b0e04-591d8564b51mr6661830e87.55.1761119944387; 
 Wed, 22 Oct 2025 00:59:04 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591eb0d4be3sm1645800e87.91.2025.10.22.00.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 00:59:03 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:59:01 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: remove unneeded semicolon
Message-ID: <aPiOxYYY_dPkShsW@gmail.com>
References: <20251022-st7571-semicolon-v1-1-83d322618ff4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eTVSVn3PPTE1QalB"
Content-Disposition: inline
In-Reply-To: <20251022-st7571-semicolon-v1-1-83d322618ff4@gmail.com>
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


--eTVSVn3PPTE1QalB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 08:10:57AM +0200, Marcus Folkesson wrote:
> Fix style issue reported by Kernel test robot.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510221125.Cg0sM4xJ-lkp@i=
ntel.com/
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/gpu/drm/sitronix/st7571-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitr=
onix/st7571-i2c.c
> index 32b91d65b768b26caa7dcef42a00d36f236fbc32..4e73c8b415d677dab5b421666=
b56f4bb3697b982 100644
> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
> @@ -322,7 +322,7 @@ static void st7571_prepare_buffer_grayscale(struct st=
7571_device *st7571,
>  		size =3D (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
>  		memcpy(st7571->hwbuf, vmap->vaddr, size);
>  		break;
> -	};
> +	}
>  }
> =20
>  static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, =
struct drm_rect *rect)
>=20
> ---
> base-commit: c1a7cc00cd412505e070eb4e62bc0b0ca85243e0
> change-id: 20251022-st7571-semicolon-bc5287cde264
>=20
> Best regards,
> --=20
> Marcus Folkesson <marcus.folkesson@gmail.com>
>=20

Pushed to drm-misc-fixes.

Best regards,
Marcus Folkesson

--eTVSVn3PPTE1QalB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmj4jsAACgkQiIBOb1ld
UjLMPA//ZQq3SPQ1QOCTlYHoxVF76fxGwzlNFDCNVtE5kkFe2qp6jk6CZBvKRvTy
zx2D/eBt2LRoahlASY9shrwsgSvdCjZcKcscB8VPIXSJlqd74Bq0hCztYq6pIYgk
VZoAmmGIT2LSUbLAYEvj6hz6IgNsYkfzNLzVp/kPCplWs6YS9S+fdS3quChlWuE7
Es88rYmr6X+Fh9JbMiIXg0xXc/yEWR4kNsLNyWb5CBY0edMaWZZbB4HbnHj0PVH4
IRzm6YkbBCfEjGzFmOiYFKQqTm0zgpso/dJUHK0+zZDl6Y39dxZhfvWi0G/goBiY
Sj9GF67P3zoVSOKLul1t4bHiGSIqsm4CP3gdF7DgSBg8zez2ZI5tGtS+s+PeDnpQ
79m5cPu30l8Mu/d+2IViDs2p42Sv01i0nyStkJpH6iRXKCh6d8eM9hL19KO02YdR
a3nT6fmUf9DRP2wu1jezJHZv9+XUXoS1XbmyYePmwtZzMXKWhPjIGuWIBCzyF4w+
BQEHShbfDgg6ZAqpamfY+wo8MyI1mZ+bla4KJk442X4g9W0R7nJLA59AOlRiD4Lu
yj5H+04KQSwjjbOneaZ4DBN/X4kSqmeR9k1U0H7sNfYCgotyUNTxXDN45+SI5bo4
0qAOFK2rYCdAZDtG6K4LMbd9lvHyM2ExSt3CgR6W+F0J4jkn5FA=
=8X8b
-----END PGP SIGNATURE-----

--eTVSVn3PPTE1QalB--
