Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE0A86B64
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 08:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4682C10E181;
	Sat, 12 Apr 2025 06:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PUefSdHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC7110E181
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 06:56:22 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bee1cb370so22956501fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744440980; x=1745045780; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=okI1oMZoAJl0uNnUw8I5uIoWPFzKiOpsfd4AfgQHT44=;
 b=PUefSdHUGQlaaYHosebdspNFJfDowbdRJBO5BV38X3Fd6rEM3RSSdsPoMIVDScFH73
 I0MDFxBLq8BUZ2KB/q3Kv0Z/xHsOeuzsscxJkV087RrCZYPuBcmOIpC5vGXJ7b2fS5ZP
 mrtzztPwV4TnVccMrqlQT5P8Wdv/v5Iux+A8aW9FStbsxypOMo+Yg0lq3p0NDN5dSGTL
 DuDqc30/JqxFNyo/itrUcJfieTZTBHNELOhASb5ym23ocBQMnyI3udaeO6CEMwuVyK/C
 tBPTa5S5E31NkwLyfi51TjaVm7TvbsNR2p8IsKYQ4QrkjdEKEcab8HNbiKJEdCqKpbD2
 01Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744440980; x=1745045780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okI1oMZoAJl0uNnUw8I5uIoWPFzKiOpsfd4AfgQHT44=;
 b=X5+X3t1wRteTrSOUD8cgLRQkp5jg/T2T93NmF6+g+Up6ctjNghGL05G8ej7IUMCluN
 18rrX48y66yjAKwwfcdZPtAo/Iige1GDSAiShvZ3bWR2c2BmuQX4lN7IGN6rCcaEX3zA
 ellAN0ap1RFIJel3b7L529wavQHdjV4p43zFoHe5lI4agAiXtiVcWz0SA/GOZ+7Hjuma
 iDkUjV32a26uuwHhK/ODQYza6VVNOCPSwr58VVpwZKEMBJahUaQg1fKCYc24YkIGQRvz
 1sbWTz+zlkE6qNhXWVKQjPH1ASlM+O5lyEhLiE8EiqKNvGGzY0VeZkOfcNm4yvKtkH25
 +PbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsTM+r28OyIVa3dVC+j1EKd+fsyfcctWB2Rx+gzLdfq1wilg2zKVMfMMk5cY/En76z1ZSlXbF4+S8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcRcrLMnFwPBeY5kUfc5PQqvjRecU/2b9U/umiGjSK+Ax5PPnr
 GhsQdsEP9K8705vnPLGMjtLT1ZRXNWNGOl0ZkHTcHPjVXgx3hvcs
X-Gm-Gg: ASbGncvReJTQJkkD3vUbqbFoTTHFWZVVr0HJt0Sei6l6Oc+Purh4MmJQjjRoo03KAc9
 yt1tyh6cxVPb6r5XzS5WgKmmHLG6CeCKPvPJCdXP3HFfEHQBURdG+EOcerpui3IfOGMHMovB+8M
 X9hD+8oZZBq2o10XZZr8ZQQByc5H/wc3J/ReR59hUN3p0E3v73tMeESjL4QrEjFY5jayMb36ziC
 aFkzDg2hvWt0xyC/C7V1D0QrKPo2RhRelkaFhkDVnLU6vrWA+qkCyZeottyYxbrBOhTs5E5k7MD
 6o2Hy9YtTJmV50vGfoKZczfk8dvJu8xFuu8iehgnDci9UfFW1UHr3/YH7Eop4Yk7CxRi1Oe+NDf
 OAA==
X-Google-Smtp-Source: AGHT+IGVugW8G8nF9ACQpqPJ8sK7GJ9KkuNywioJrsCnO/nXG+tvSMmegSLyXfF7TWPCIM+UIaFYbw==
X-Received: by 2002:a05:6512:10d4:b0:545:2f0c:a29c with SMTP id
 2adb3069b0e04-54d452ca0cdmr1785017e87.36.1744440980045; 
 Fri, 11 Apr 2025 23:56:20 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d5026d5sm579000e87.155.2025.04.11.23.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 23:56:19 -0700 (PDT)
Date: Sat, 12 Apr 2025 08:56:17 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_oOkb2Lx3HNhnSK@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
 <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a59oPMzr2RlFIqL/"
Content-Disposition: inline
In-Reply-To: <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
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


--a59oPMzr2RlFIqL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:26:47AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> [...]
>=20
> >> static const struct of_device_id st7571_of_match[] =3D {
> >> 	/* monochrome displays */
> >> 	{
> >> 		.compatible =3D "sinocrystal,sc128128012-v01",
> >> 		.data =3D monochrome_formats,
> >> 	},
> >> ...
> >>         /* grayscale displays */
> >> 	{
> >> 		.compatible =3D "foo,bar",
> >> 		.data =3D grayscale_formats,
> >> 	},
> >> };
> >
> > A comment for v4:
> >
> > I think I will go for a property in the device tree. I've implemented
> > board entries as above, but I'm not satisfied for two reasons:
> >
> > 1. All other properties like display size and resolution are already
> >    specified in the device tree. If I add entries for specific boards,
> >    these properties will be somehow redundant and not as generic.
> >
> > 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
> >    product.
>=20
> Sure, that makes sense to me.
>=20
> Can I ask if you could still add reasonable default values that could be =
set
> in the device ID .data fields ?
>=20
> As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
> just drop that and use your driver, since AFAICT the expected display data
> RAM format is exactly the same than when using monochrome for the ST7571.
>=20
> But due the ST7567 only supporting R1, it would be silly to always have to
> define a property in the DT node given that does not support other format.

Sure!
I've looked at the ST7567 datasheet and it seems indeed to be a very simila=
r.
Both in pixel format and registers are the same.

I think specify a init-function (as those will differ) and constraints will
be enough to handle both chips.

I will prepare .data with something like this

struct st7571_panel_constraints {
	u32 min_nlines;
	u32 max_nlines;
	u32 min_ncols;
	u32 max_ncols;
	bool support_grayscale;
};

struct st7571_panel_data {
	int (*init)(struct st7571_device *st7571);
	struct st7571_panel_constraints constraints;
};

struct st7571_panel_data st7571_data =3D {
	.init =3D st7571_lcd_init,
	.constraints =3D {
		.min_nlines =3D 1,
		.max_nlines =3D 128,
		.min_ncols =3D 128,
		.max_ncols =3D 128,
		.support_grayscale =3D true,
	},
};

static const struct of_device_id st7571_of_match[] =3D {
	{ .compatible =3D "sitronix,st7571", .data =3D &st7571_data },
	{},
};


I can add an entry for the ST7567 when everything is in place.
The chip does not support the I2C interface, so it has to wait until
I've split up the driver though, which will be right after this series.

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Best regards,
Marcus Folkesson
>=20

--a59oPMzr2RlFIqL/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf6DosACgkQiIBOb1ld
UjLZpw//e8HTYyVwbaasjf+olyexFFC3ePEHHkexM2bisHpFzK0hMD6npqWHkF/n
Ne/hGnfqQux/jqFnZTAI4gfsCZZ6BAhU6ak9jXGez5NxGuYniQ0BegWoDqLVkQS5
NwAky11Cxftxica2om5156VlcMs/WWzjfIQ3QWsLiRa/xAYcoUGbAgB8MBSrmFq1
/vJjaWw/M0eIzMAkpCQKJVfkwbtZ7TzllsNLqeiRjGVLIQbGKFzly9ENY6Ygvozo
VXicfLQKwcjRZqBJDEajT5QzeFvSJLgNAySTYeRcpCeyqym2uNuqdV3sPYl6cn/+
ep7auk9/lh1rR6dtmZiIQ5W4iLsDgOKQRx3I9YifDQ79CliX5GsmKvFDfwGAhB/e
NXZso2ipP2TD5flAwVSz00NV2EHjiLhnIvZle2F8qERAvgPpKNFCnd0wlWBr3nlM
MQ79+w9yHPYkNNTbDOrKXajonf+DaVoc/D0ll1uMtxqlTdMXhmBkRUU4npHdCxp8
LaQGbhsAoC1jy75seD8ajPvlD9kWjvxBwNwSi7IqYX1UHYQixfN6NKE6+HBMiEbG
atb1ePsdOTgbns8n541gbBJ+2wGEYeO9PxHlu9PxH7rlEFyePkrvadjukVVHFjeQ
KU9PcndFRB6/H1EqRl/20eXIeHJ/+ELVs/orOB8aGHjkwOaMGDw=
=elUN
-----END PGP SIGNATURE-----

--a59oPMzr2RlFIqL/--
