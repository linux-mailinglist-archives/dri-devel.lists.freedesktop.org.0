Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B701BC06E3
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 08:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FC310E56A;
	Tue,  7 Oct 2025 06:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x78mibpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796FC10E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 06:57:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so10629012a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759820240; x=1760425040;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kQBr1iLVFNtqeaNs6yJ80+xGl4WT5Nt3T8RxbNCflzM=;
 b=x78mibplUkRqINloy9a3ZrHZwx9Tn15OZ7Lapz7wzlv8cPo48mZWJW6sDPMiM1Wjml
 TtvzV7kdCNjgPTgGungUJsLQSM0pEmCchqq99Ji0nWyC5M6KiCDxdV/Hk9RIQ/Qp966z
 4FGWwmvUXYS7pNxai0CkGJrgVj8Vz4zs+yvWJa8r8vajej2oLCQMMpggF9PMOXiGNmum
 Rq7F+2XyMIBeGtCluBBv2MWXDrii16EkuvvB3HBVgQhxr0dLew1bxCIlVI8UBQGUQ+R9
 wNB9dYGixdVevQdUmjZDuex7w8uYuJUnLjkPXkrsVVxT4OUdbY9Q12Pbr8Q3Z7nhtjPs
 YgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759820240; x=1760425040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQBr1iLVFNtqeaNs6yJ80+xGl4WT5Nt3T8RxbNCflzM=;
 b=WU08k72TiS2JMnqTT7mTKktp0qNHm7zxxjM4VqZbpT3floiTvrOMo7WLY8Usc6PVLh
 yxGORtXPHOSrcuzZPsiqA9Ize4Jmfhl/poREx5IkKM5DUteu6An/1G1/pffGJlSJR3Z4
 4QZF9bg8qAYtZbyLqHjGuzDAyPEdBVNf/ZjpBfh+bxeZLHyvCkAr103lM+jOmzW67YbV
 bCi5LvK85k/kkY+EZcvKOhsKVWyR6/FvTKfVljO5cX2nG7/zGNEUVCuBnzN+JT9WDUZc
 d7G/Dw6XZcDdwbrvQ9B/H1trMYeqNyUjb0Jaxx6kmudSsT2jOIqRcqN8LFyUaATbGC7c
 ybPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYBcvCHY/iPE0igFseXgxYPewgKvFceCLV3yZzveywfdngfndmxqlCjljndupN8pmloLW269C2tdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzLjg/I8fkKbZOQWpPfcGvXg5oJZu972CyfaXWawEPcXU8FEoF
 OFieg3JWMsy48SHLbEam5TEazlmjnSQIgwnSE9gVZ/+1hF5ajpFxHl2grlUFrPGE/30=
X-Gm-Gg: ASbGncv2vDTDY0JPE2voMkKaauerWlDfUpGBtiWwnGg3wwhys143xO2lHtShUiwdg2z
 dSuICygfVk6j9x3UZ/kYhXtZhoOK9vCsKy3YkVDW4k1yzVi6gi1CcPI7Oyi4xS9+tiT9h82nzpr
 zHDeV2GdSwaDJZt2ME6q7gXiHrr8zMMaAfRHcl+51bBykpfbfEy3VxmHHKr953Q1AnFn+ROGnq9
 2hjl5GEPEqMS2nDwVFBvdGrfIAeC/lSFWyo91oddmRK7ckSTHY+IIB4J0XB6/dW9q/3UGCJa8Iu
 ot0yfNiAkfYJT1SQ9tU/VQO3/z1KZK35pmuBb7vjIo7p4JRv/7f5tP4L+BBPLLaow2YbvvfmQH9
 4u8Sgec4Hyh6mmyUhIQudCigcxBtave2A9kZ62Rw+nabMWVsX842r6UDtCSndql7659C3YMPHFd
 BEXeYRVHOTxXlPbwhCk6mAHfg=
X-Google-Smtp-Source: AGHT+IH+x4rvNU4JaZu7YZXVaGBVLRKK1beKwvljFVhpKQF3G9mDqkXPfemHJ//E1ME4YBbm97oUxQ==
X-Received: by 2002:a17:906:9fcf:b0:b41:e675:95e3 with SMTP id
 a640c23a62f3a-b49c20531d6mr2080358366b.16.1759820239882; 
 Mon, 06 Oct 2025 23:57:19 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b486970a60dsm1302323866b.63.2025.10.06.23.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 23:57:19 -0700 (PDT)
Date: Tue, 7 Oct 2025 08:57:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Javier Garcia <rampxxxx@gmail.com>
Cc: deller@gmx.de, tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v2] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Message-ID: <i63463tzmzyjwqvqgduwakdx26zzftj43yay5ytit6ll2hvg72@3azlq2glpmos>
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xmvirqnkodsp7h45"
Content-Disposition: inline
In-Reply-To: <20251006164143.1187434-1-rampxxxx@gmail.com>
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


--xmvirqnkodsp7h45
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
MIME-Version: 1.0

On Mon, Oct 06, 2025 at 06:41:43PM +0200, Javier Garcia wrote:
> This patch wraps the relevant code blocks with `IS_ENABLED(ifdef CONFIG_F=
B_DEVICE)`,

stray "ifdef "

> allowing the driver to be built and used even if CONFIG_FB_DEVICE is not =
selected.

The driver built fine without FB_DEVICE already before, doesn't it?

> The sysfs only give access to show some controller and cursor registers so
> it's not needed to allow driver works correctly.
>=20
> This align with Documentation/drm/todo.rst
> "Remove driver dependencies on FB_DEVICE"

Given the above, I still don't understand that. (But maybe this can be
fixed by Helge's request to improve the commit message.)

> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v2:
>       * Fix error and improvement , thanks Uwe Kleine-Koenig.
>       * v1 https://lore.kernel.org/lkml/20251005173812.1169436-1-rampxxxx=
@gmail.com
>=20
>=20
>  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/f=
bdev/mb862xx/mb862xxfbdrv.c
> index ade88e7bc760..dc99b8c9ff0f 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include "linux/kconfig.h"

I didn't need that during my build tests, also don't use "" here, but
<>.

>  #include <linux/pci.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> [...]

Best regards
Uwe

--xmvirqnkodsp7h45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjkucoACgkQj4D7WH0S
/k4C1Af/WV9h/qgYbP/3+qXNhC1BXfM3TuwVm+Sff8RZnlO741v4wQpli3yGXbi9
KcG2h9XY0lwvH/VMa67XES7Mndveqbrc129IdezMXfpXxskJpUgvhtSaEdpWf8wL
QfjmYKi3YchT4zMmtqzr5rSePQpfqEbxXN+Bo/FRofoQkrKLIslEo9xYzbUExm0t
WUMwiK4+Den2I8Km5fTZoCp4z5RXxARQ4yc+/8hCE4KQ912dNSoIde2pFzxo/25C
vzuO/UINyYqPt4F1AHY/7tfrP5cgO3z3jbdtjLvEIk6m/UYCwnkfpJXsEteOVgJx
kYSTrHFuIq1enwL31Vxj10PYMgEwcQ==
=zm7i
-----END PGP SIGNATURE-----

--xmvirqnkodsp7h45--
