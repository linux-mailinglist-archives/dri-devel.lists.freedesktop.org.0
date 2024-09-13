Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE49779AB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2F410E0BF;
	Fri, 13 Sep 2024 07:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0YpFTLjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEB210E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:32:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso240669066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726212730; x=1726817530;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zCD8LaN0kjsKdIM6ZRCopPXn4g4+foguZouvDF3CqkU=;
 b=0YpFTLjxSNZRhy4j1UQpywpU6pHYDzQKXX+3YpqDQSB0WNDgdyCkpvlTuHJPZTVrx8
 URed0emDEb70v4InlPpRBiZRMEkW48IFDDPbotFkN0p6rfERF+hhsKIaWoHSSzmVIZpc
 7mNdKQgPaXNPpA4l7eJd3WnB0KjvTrJDwNekyR+Q43Xj57PqrX8Mum9uOfxrCabcklOP
 65N4f6zkdYjIn06CrHyg+nbu4lRxDs7Vq5oKxrB+NznTpUzJtIpzJRO7zqjSDoE9mxcx
 TwgNw+m+70QzEDRY+ZnvGDW8yPbKzLA07lys8hyWm2AnY2LUu4RAgwyaqi3w0krRl5lJ
 GS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726212730; x=1726817530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCD8LaN0kjsKdIM6ZRCopPXn4g4+foguZouvDF3CqkU=;
 b=e5srA1Dk5LDAhuMbO2QsRggxherDaR85EbxrAZZhkSMy8s/YyLD2EJXmS+xM/xUE7f
 9dKy2BLo5ywz83wVGAVSw+PwgxUXKApnYWDXTxSdCww60ZEtM7yVonks4vJZDrpdMsdC
 F6JTEaWRQIb8/fMAVHX9X2GU4oH29FbRruAadlipduIcop7GkGrn4mudAem9+mcBIsTd
 SLYwFr7XHgljA+sDNHL4+cx4vTIzkzr7cm7j5+Hc7Qe8w/93/sFTdT6JPNfooM5bqX9A
 76uAAOKp1QHAEXYhcvMaJ8UteYRKlTkdrBBkCnidJvt7wUJsx0Vq+4OUUwRa9X7c+rmE
 Jl8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCiNoqmaj/iZo7SLY6ejaVtdnrWWkE5ZVi6EBQVeqv7T89MMLBoiGn7hlN6ggSmv09BIHikgJE3g8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze9SnWt96yva2+sOiOpsAB7tEY6icE5hPzA3OIDgCUD7vjcwm/
 sF3gUKB3kc2JQ7nEFnS+ZUAbOfzWpCGXB//rbXa5FRO0BDzJOGbS3N//MVdwvsA=
X-Google-Smtp-Source: AGHT+IHssm2URqE1gS4gVcn6Nj0DllldqANqwzd6oBjRAAhdE80d1B5MN/NDiKEsCAH6AylUactzuQ==
X-Received: by 2002:a17:906:fe47:b0:a7a:3928:3529 with SMTP id
 a640c23a62f3a-a90293b188cmr601509866b.13.1726212730074; 
 Fri, 13 Sep 2024 00:32:10 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf371bsm842411966b.175.2024.09.13.00.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:32:09 -0700 (PDT)
Date: Fri, 13 Sep 2024 09:32:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, jyri.sarha@iki.fi, 
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, praneeth@ti.com,
 nm@ti.com, vigneshr@ti.com, r-ravikumar@ti.com, j-choudhary@ti.com,
 grandmaster@al2klimov.de, 
 caihuoqing@baidu.com, ahalaney@redhat.com, cai.huoqing@linux.dev, 
 colin.i.king@gmail.com, javierm@redhat.com, dmitry.baryshkov@linaro.org, 
 geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, robh@kernel.org, 
 sam@ravnborg.org, simona.vetter@ffwll.ch, ville.syrjala@linux.intel.com, 
 wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Message-ID: <3y4pqlazkuofc37s6zlw7waqzmtdl5iydhm4i3i45n6d6pnflc@osyocv7wxtif>
References: <20240912171142.3241719-1-devarsht@ti.com>
 <c501c5d3-d715-4ac5-98be-35d23ad1cfbe@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fwomuhf5lvybpujn"
Content-Disposition: inline
In-Reply-To: <c501c5d3-d715-4ac5-98be-35d23ad1cfbe@kernel.org>
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


--fwomuhf5lvybpujn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 12, 2024 at 10:47:31PM +0200, Danilo Krummrich wrote:
> On 9/12/24 7:11 PM, Devarsh Thakkar wrote:
> > Modify license to include dual licensing as GPL-2.0-only OR MIT license=
 for
> > tidss display driver. This allows other operating system ecosystems suc=
h as
> > Zephyr and also the commercial firmwares to refer and derive code from =
this
> > display driver in a more permissive manner.
> >=20
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>=20
> My only contribution to this driver was through DRM refactorings,
> but anyways:
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Similar for me. I only touched one of the affected files with a
refactoring change (34cdd1f691ade28abd36ce3cab8f9d442f43bf3f). I don't
assume this gives me any copyright to that driver, but to simplify
things:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--fwomuhf5lvybpujn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbj6nUACgkQj4D7WH0S
/k6Vowf/SMe2WNrVNQ5D0QME7lNXR9gfCQBxgUOR1uEijmytgCZX6K8s8KmQRPd+
m6GRlpvCWOkFDA/0l4cKexh7gkMG/K94hY0pBGlgCDgu0O+4Nhtx/XTo/MRBDZRx
yDtWz3YS1LJyOmzt5ogOea1ZxANsYDVKnoLZ737p1oOTrXGqeOJiVxhl4qzpS2Dq
jhIw+wntbT6Ea0SsGKoFaKFkbiYa8/Demkgd39Kpb/OEXgAnTDlgLhBPGi+PjlX2
Jdo2G2TsHCuOLBe4J9OgcLSUkKM8STnGjX4tMMA4mjxXUZrxbwXZ+GSENcDNRJ/z
BFLRA5gh7qOuYJsECveGW/1huoN3Tg==
=BVdJ
-----END PGP SIGNATURE-----

--fwomuhf5lvybpujn--
