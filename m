Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441EAF8DCE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF2810E9A7;
	Fri,  4 Jul 2025 09:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EsHiCEod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A4E10E04D;
 Fri,  4 Jul 2025 09:12:12 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c8cso1076939a12.2; 
 Fri, 04 Jul 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751620331; x=1752225131; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
 b=EsHiCEodEA12bJ4F9C0ixfFSmDBNO4c7L3NoLqvRXiGGzn5WEuGXFya0d1hF0tdlsj
 V/CpQrSrZdAjlLYzqnOfqjxoAA/G9kimLa7YrewO1SaCAbhyGDw2pyR9uMQul0IQ7gDj
 c4fPoRlrRwmDze2vF8jA5FPlPxlaTTbTmlG5syL4qwigMQqQCZRIff9Zig641TkQMi5o
 fvmAoRIgaBGPZHshx95Nx9+EG6dUxJqWM2tNbj7B63iH5BqcDLmmCxFnP3D7JBKDvOw/
 7i6UTPBerxQi+dIsBMSHY/Ce+MGXWJWqdfnZc3z9+94NLqeU58D7RUt1umyWOq38kdf8
 RfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751620331; x=1752225131;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
 b=QPVRNbSs6f4oIKP9KQ5HFUIR2n4yIk+INxM2O16SaQedV0JZnCLhG25TxsgI1vFna+
 NKCh1aW6mC6OLhaKPfq6L3DZDhEbB8zXTgZ1hnGjzEef613rHeR9EugE/Tf8Dx7mI8GM
 iY9d0LPDAHXIPBQfGxh0wTUwRANB4EJZFt98P9mqHxb2VwKkARkVGw1iLcP07xBAr4dH
 O+8X/bVGwztvQsdopyu9+cjXn5JYfWTHcn8M236higRvO/Ccuw/hZttyXyr2XzdXq5GI
 g7D68jbyvwhTOoKF3NzDbNtdgVDpYLOWUybjaPYQOQnv03tPSe9YhixRd14or5rCqeCJ
 84uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG/EiHo7GbuZzGxEwFG35FjpDUQWjIPCiaD/h9n/VdtYV27bAuHsmMoBhVtyHieNC8O0vcz9V4OC0=@lists.freedesktop.org,
 AJvYcCW78C73cXtbzrZK2IXDq+sD6n7WYk87mdAix4fBljvbMoQgozwa3u+KhmBFG+EUERc+GBjj3A==@lists.freedesktop.org,
 AJvYcCWeR1KJRk00mTOkqaVXa4cuIbtmtVUzFMLzj/iWV5rCVwzLMGZv72kETK0eVR8uEJw5PP05xJ9POyjo@lists.freedesktop.org,
 AJvYcCXbIdunikt4nTDfqyhEYX37D4ht3iwMRCFNGvrgin2KDvgUZm896BCBmowy3hNVIJ0ChjtlcHFoIQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrx5vVt9+phRQ+atAYUmyR//xMNrnP1ApekOjCSGVMMVyppTNy
 TzxcMRptE4bdaiWFb87bEk3nz9sukOK3F/xK7mvrUMhxmZVWuo80MjDv
X-Gm-Gg: ASbGncsnIb+rN0F53ZJ0B5kBLXE6GTu9RCYLlfU++qxQSzVTsu95t6tfDmR/m7CWgKn
 2CGhofmoMVVdtcyJNSEOc7kr7x6YHDlS8ewObLaudQVhF8idtcBRH1GwAPxxjCjpVsbrhRC059r
 Gm+0lFGwHUl6Rk2rQgC2xZuUBc4zSEmSoP5gERxSyF6DpS1eUJHuqfes2uLh4pHI9wo1yupH3kC
 x4kyrNbzoWbmfMv7urZ9f+RHqoc6ZeFvpwHzUecTI6sQ8v9pMBKI26ae6RH+G6Jc7ZkPDoLpke3
 6ob+x9rueEVXtHTy/C0GTB9vfuwXl2JCLcaDOOcUuFHYkFev4iBX4LsOAKyWSVSXbwNBThy+Fhd
 gebxPvxTQOaXCU+6gjZWxWGUv3cl1/sd1KYLynurYU9wCekACLqxsz1fyNbk=
X-Google-Smtp-Source: AGHT+IFdp3dnaPNX2K9juktcKvt9T7MKTZPR3ZqZ1DcevNm+PpERG7zIx/J5e+1Xs4SiNQ/M23vBdQ==
X-Received: by 2002:a05:6402:50ce:b0:607:f431:33f8 with SMTP id
 4fb4d7f45d1cf-60fd6d90e62mr978981a12.24.1751620331153; 
 Fri, 04 Jul 2025 02:12:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb8c80c4sm1016517a12.75.2025.07.04.02.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 02:12:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:12:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Damon Ding <damon.ding@rock-chips.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, 
 lima@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <gh6mdzdl4gzs22zxfigdpbep3xcaf37fhjis5bvuvrjbxyxhkt@53hdnb53m32p>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="73fi2dtgof2ecl74"
Content-Disposition: inline
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
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


--73fi2dtgof2ecl74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:13AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submi=
t.c
> index 2430fcc97448..5e0e76ebc5be 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -502,7 +502,6 @@ static void release_job(struct host1x_job *job)
>  	kfree(job_data->used_mappings);
>  	kfree(job_data);
> =20
> -	pm_runtime_mark_last_busy(client->base.dev);
>  	pm_runtime_put_autosuspend(client->base.dev);
>  }
> =20

Acked-by: Thierry Reding <treding@nvidia.com>

--73fi2dtgof2ecl74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmucACgkQ3SOs138+
s6EwIA/+Lm7/OgfvX+wbCwmhCbQp5/BVsRO878lwGCmlqPoYL2WYHH/eSzmXSvUK
xb7ZYOHW0fzKZGrQhw4CoKbIEoD5so8k56hh1QQ0y0nlSTnW1QGrQjINcBXXen12
xKQLm3Iim4xi+haF9Bo2v0tpjEQynVvV2rsLqtanwUoo2ZUioMdNfDGVRtm+xShI
HAqxFVcL+aJEkbX1Z/3H4Nb1UKYe8tqXo8KurA3XuWDPGpCBPfUhgm61rWnq7DGu
OqKFeqdRAhEL1SMd5Ptl4qNV5vQHpjdhgpnUWL24Sj+DCSh9SrRAeZA5svDx/pVW
gFYa7SGUyHxt8GXmUM7RAJwTD2+DK1NaUWD5LtvjYFZ703AavEfPJcUULNZj25Lk
zCUs5TJkF9xOaJeosrm97c0515FHwcX/bRD90PTuzcvtXTpSPIR6NcGTvIzEV2gU
McLf0pU3g7TSh4VRi14oBS8mjPeEgFpnWbYc9VT2JwkE4WTzx3FBtC1k3auDQel4
s00mGYbkG+5LLz0SBCWnDdRB4tPYzytyAfnhv0MOBHhAO4EQ1GN6WeNlnqQJed5m
f5j4zUjT5xCp7d/ADR6ZqKH0OrxA1zTlZliRsxW44FPl5QHhozZKNP0Wqa7F1HQ+
mAr8c/EP9BLSaE2mF6jelG8TDZfTyTraHew1D/JwRkgK53rNmHY=
=z+c+
-----END PGP SIGNATURE-----

--73fi2dtgof2ecl74--
