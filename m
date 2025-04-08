Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C8A80F0B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82BE10E66A;
	Tue,  8 Apr 2025 14:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S2ALkx/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395010E6CD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:58:06 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54af20849bbso3216927e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744124285; x=1744729085; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0jIrA3mx6C6mZy2tnJofkxitpjJevE8nbzOCRz8TRh8=;
 b=S2ALkx/J3ahRUIBr7Cb/Yp71p2k0xF4661yhh013fefcri4Dzl4+zSG7w1QGTbimkL
 yE2Ntz0rqB9lQ3NS0THj4/X0hTEo3qs0LBa8ZCtbd/z0+rM+mma7fYV/AK6zdkjzYZY0
 U35vG9JZc9O3YfZXgVCCk9gyFIwOoYGb5gvR2Cl3ldkdPT7CIihEVl2bkpOi8UlM8s8k
 2rlr1xzaJpTRKR2lI6+KopX9d+v2ZoMY5Xr3r6oTvosReXt48NH7I4KYCoOfFOt8aE/2
 1d4szU7v9TQ0prkq6fvcjrVtirWCxyQhNVvhcq3Hv+Poh5Yd/ii4zj+FEQQ7xH8Y805y
 AyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744124285; x=1744729085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jIrA3mx6C6mZy2tnJofkxitpjJevE8nbzOCRz8TRh8=;
 b=YMwYq1RZQ5ehGu1w4O9xVuZs6bIiIIvPvxgDdrLxIYZXU0uUU5QUEcCO91u3GZHjxR
 3XEB9dBgoVpLkX9cR1RTyA/jqcS5X84PvFcBu6MA3f0FdlGz7JzKnaZWQhAA6pz08GUR
 ThT2Q976RvDLXE2kFjlqkFFIxGy+H4b2AE3dBwAj2iQ0r74BdQMLPEtuNOcF8ecxslxy
 fPc0KuGnaaZytDcDcDnkTbmDnUNYbrRCw8Ws9/zIakiAPN7cPoTvUHXKvJfJiyQJux9y
 RGDq3A72TPSKDli017sfy2cDsd2SORBLZ1NOgPmWq7bQBXjDk3wA/uo1reotkYdzlTnR
 Fqww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4SSR5AcTEkKtGILTpSpUb31sRa4GSyADgmZ2nLa+q6r9vRDNzLCY0w1c9AppSG/jNlc0JE6kl2ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgjoR9KYzXZ+JNkQRr/Injvdll3eqIvviiWQE3ZF4QqbUiWiLS
 6QyHZdVfwOvuDqv7gjVTTOxgUHBZ2hI/aIIMvQYSTVU9BR/nl88l
X-Gm-Gg: ASbGnct+x5rI7kEvKqbmcud8W5s99GiHt5VtEbAYgYfW2cPH4EGLXtgnRhRbY7rtqjN
 7VuTBAN8zlKPqISR234I2T2B94r0mTiTkF3nbM9cY1VDh7Z8Inwgf7HI4pdWizH2wBxL4lel3uv
 fib/kG8/zeqPeLtJ6c1tS/LEfkU7kG0hZL39tDlyWEYlLYPq0gCHsLtNWxyAdNDKGAIDhBkyj00
 5d7qi3K5QG4j7Z0hG/D7/Nm/ivLQT3Pg+PM3ITN42zsX0Co1aQQ1JCAN+vuxEeULcjzgkKdZh28
 vD/aI+uUi2FRtNkQwhXvJYHuWHdOYxKNyicmJY1o7nefa/a0QA2xfjhZJkyT5jE13VRNZhQ3+SB
 BKsoZUg==
X-Google-Smtp-Source: AGHT+IH7AfCDvYI4ulQvJiioz+8wMgXMRFnMBvJTApo51eq7l+wLWCNH4RztQpIl6uGPT7+sa6FzgA==
X-Received: by 2002:a05:6512:e92:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-54c2276aba5mr4772259e87.10.1744124284349; 
 Tue, 08 Apr 2025 07:58:04 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e65d6d5sm1510577e87.181.2025.04.08.07.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 07:58:02 -0700 (PDT)
Date: Tue, 8 Apr 2025 16:58:00 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_U5eGy3vLgHZmz1@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <05fa4ac7-db09-401d-8680-0d71112d2239@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lMPor8puCNzndVuT"
Content-Disposition: inline
In-Reply-To: <05fa4ac7-db09-401d-8680-0d71112d2239@suse.de>
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


--lMPor8puCNzndVuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 08, 2025 at 03:57:22PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 08.04.25 um 15:20 schrieb Marcus Folkesson:
> [...]
> > >=20
> > > > +static int st7571_set_pixel_format(struct st7571_device *st7571,
> > > > +				   u32 pixel_format)
> > > > +{
> > > > +	switch (pixel_format) {
> > > > +	case DRM_FORMAT_C1:
> > > > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHIT=
E);
> > > > +	case DRM_FORMAT_C2:
> > > > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The f=
ormer
> > > is for displays have a single color (i.e: grey) while the latter is w=
hen a
> > > pixel can have different color, whose values are defined by a CLUT ta=
ble.
> > >=20
> > I see.
> > Does fbdev only works with CLUT formats? I get this error when I switch
> > to DRM_FORMAT_R{1,2}:
> >=20
> > [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> > st7571 0-003f: [drm] format C1   little-endian (0x20203143) not support=
ed
> > st7571 0-003f: [drm] No compatible format found
> > st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=3D-2=
2)
>=20
> For testing purposes, you can add the _R formats to the switch case at
>=20
> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/drm_fb_he=
lper.c#L1246
>=20
> and see how it goes.

Still no penguin (same error as above).

The problem is that drm_mode_legacy_fb_format(), which is called from
drm_fbdev_shmem_driver_fbdev_probe -> drm_driver_legacy_fb_format -> drm_mo=
de_legacy_fb_format

Sets the pixel format DRM_FORMAT_C{1,2} when bpp is 1 or 2.
So I don't think it is possible to use the _R formats with fbdev.
But I'm not sure?

>=20
> Best regards
> Thomas

Best regards,
Marcus Folkesson

--lMPor8puCNzndVuT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf1OXQACgkQiIBOb1ld
UjITCBAAnmJ67WKzefUaDAR0UVVZ3Bc/0DD0kDE1HD0PNw44h8PIW3Tw+fQB0OQP
LqPs0Vi33D4Zf81iutlO/hfS2L57bkdPBVFvQckWyeA6fomaQYIprdi4U9bE9T/x
0/e1IfZQ1+AkgjuXaba6Hw4t8P8fDCqSFIqvZ+PEuizgJEA+aLrk2Sav1+xucRhi
R0vAzjmJk4MKIONG1ZhHMxCP1WgduGfwA9z7rpB2sMkT/sAg2+ydrTXIEEBZAe1C
7ippzhsChYflIiAG5VWqS5WetIZOumzvxe5lbPEiQa22n6D8lgtTXnxOEt8H3254
lDeOCuklGlC6zNr6vr7B6I2AhkKxHI60tNM9C2ZzRZCx7fgmjh32XZTqlS9Ux9CF
UdP5bmSJwn0I1KgwfCTouCNtAK4OwPHeqRipT6/0ADPcAL4Cvs39CdwErBmpEkQk
KsdrZ4ALHHVrSX7mTMNQKQnpgByZqJep4/y2Y5aTd63x3+UC8Kabnob46xgDlMJq
pIaV0qsoshSHxyF2xDqQBWSCfC4L4WDbQzuhZhQZ8E7pAInv72MC/l7tvFTk3OSK
pOdCim/LJ8p3wF0bpBQb54uaV0S72lL65CIJ2qOoZvZSrF1sm7Y2PDKwridY3Spi
IPNO8mHiN8BIRcVtigKkSS0aAoCYmRbWwIUAPws4c4kw2TXeE2o=
=fljt
-----END PGP SIGNATURE-----

--lMPor8puCNzndVuT--
