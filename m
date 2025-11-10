Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FFCC4581A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A389E10E324;
	Mon, 10 Nov 2025 09:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZZFabM7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A749310E324
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:05:16 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59052926cf9so2309175e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762765515; x=1763370315; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nqciFDSqnLy9jkuBMsgahobg3NxRSzw/2FJr1jOeUsg=;
 b=ZZFabM7Sh4IeMMyZSBBelxzDM5giIvBYfkKTQOi2fW9e0isQ9u+IoqpqnXKPbXY8tU
 2A1jp5ix70VXeKHYAixKdQId5nq3bcrFypJaW75XrIfFy8aRlsA0RjGPGkD24ZIbR/w/
 1Y6qODkYPXrF26vOd0Owl5JnCYrNZHL65bGOXrUKBV6Z9DPaO1prjPzKyIn53NDXnZB3
 XaFcdbBiQR4n+r+k0fuzIj8/ydgmvXCVXmYFeTUc7MAZcgyrYrsG6EiFtmTQy93Q3+E9
 FryOZvZMI8rJx3L+3+WqybyhKqdElmCxfhzmZIf/vfN6rT3RFLeh/SWfVEj0Vr+epfDV
 kxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762765515; x=1763370315;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqciFDSqnLy9jkuBMsgahobg3NxRSzw/2FJr1jOeUsg=;
 b=g1V9m8ZhIMQFxDh0VFvbcT35JLvo3Lqs7Msnh0LenWmDAqElPLQnAn8BPtXsrhnOS8
 hO8mmeuf6C4Z+Rb3pEYzTgAwWYYNZGWyeALC39g3m8j1e0AP6B4m03bKYyqA5bfH49rM
 Vr/FzX58gX/5m9zJJ90rRuFpHb68qoxv82mXFpE4xojo2tW7fKkhzTys/Eu59nrmLM9k
 RCQsu93dpzvG6XnsvTP1jvfa66q70uHEWIqvcbHD6SCQLgpSsMd98nbd48CKxoON6Wlv
 JQL0GLWbQIghSrWKVz+9AQfrHOLvwkyicgTwhQHU7wpr4TdlSKFoRTUnn+lGnPR7LMk3
 372A==
X-Gm-Message-State: AOJu0Yzd2xiU5hXy8Oeiwa/1s6KmbxIO74cMK/QewXtog1O/z3O3WNPx
 4cm/Lxu3kcirPcRu2RTX/cl3OA2ODKi4l6suGbGtPWHmQoeqDbkMLnKd
X-Gm-Gg: ASbGncsIyAhJku7uk7V9RKBXZ+mH8oF3V1v8/pM/6HNfJrXXfG30T6myrx2ejFzzJ8F
 plqJQufqE1I9Vjy6C3GLcfLak+xiDAb0uLZAxIA4w8JCnPWLdhKaQO84v+4yrzZ+nvUVRCX6CJo
 aplJ+H5ACnDT3xLE1QkD9txPHcfn5yPYegUDOvFhUXXTu9TPbHlbzY3qdblzA1Hh108h+5wLdi6
 sbIrkFaXoCxS2+owbZKKkfiGTDwc0amhCs9l6RZWbbwNyWQ/0hr7C6NNGoNRdnkzdKwGdOPB+8/
 b1C6LPMRukt1CO9TEdozrzGOiryv3ynrWSZQdbOFUEHxqwuiTl7ysey4eCtTSq+T3oKNGaun5Me
 rU8phqVf18Iayv0VEApcI22BIe2b7J3hTvdvC99Xj5sZit8OGMLzjwYr10UJUb4e+D9A5QiL93Q
 O98wYlBtarUQ+/0Z89HqdTRwYaxTBL0GUUnS+J
X-Google-Smtp-Source: AGHT+IHlT7p1xPZPwDzNrMkeYdBcwqrNZRMnOg07nKvN1/mHuyt/BB9fEQpcBJ5qJ7azHTuwvrCc8g==
X-Received: by 2002:a05:6512:318f:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-5945f1dba9bmr2218203e87.31.1762765514601; 
 Mon, 10 Nov 2025 01:05:14 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594549b4cc6sm3148451e87.15.2025.11.10.01.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:05:13 -0800 (PST)
Date: Mon, 10 Nov 2025 10:05:11 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] drm/sitronix/st7571: split up driver to support
 both I2C and SPI
Message-ID: <aRGqx6BDCYw_z206@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lzylSUmEWLw12z5/"
Content-Disposition: inline
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
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


--lzylSUmEWLw12z5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Friendly ping on this series.

Best regards,
Marcus Folkesson


On Mon, Oct 27, 2025 at 09:05:40AM +0100, Marcus Folkesson wrote:
> This series splits up the driver and finally implements
> support for ST7571/ST7561 connected to a SPI bus.
>=20
> I've not tested the SPI interface myself as I lack HW, but the
> implementation should be okay from what I've read in the datasheet.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v2:
> - Add MODULE_IMPORT_NS to st7571-i2c.c st7571-spi.c (Kernel test robot)
> - Link to v1: https://lore.kernel.org/r/20251024-st7571-split-v1-0-d3092b=
98130f@gmail.com
>=20
> ---
> Marcus Folkesson (6):
>       drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
>       drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
>       drm/sitronix/st7571-i2c: move common structures to st7571.h
>       drm/sitronix/st7571-i2c: make probe independent of hw interface
>       drm/sitronix/st7571: split up the driver into a common and an i2c p=
art
>       drm/sitronix/st7571-spi: add support for SPI interface
>=20
>  MAINTAINERS                           |    3 +
>  drivers/gpu/drm/sitronix/Kconfig      |   38 +-
>  drivers/gpu/drm/sitronix/Makefile     |    2 +
>  drivers/gpu/drm/sitronix/st7571-i2c.c | 1003 ++-------------------------=
------
>  drivers/gpu/drm/sitronix/st7571-spi.c |   76 +++
>  drivers/gpu/drm/sitronix/st7571.c     |  918 +++++++++++++++++++++++++++=
+++
>  drivers/gpu/drm/sitronix/st7571.h     |   91 +++
>  7 files changed, 1162 insertions(+), 969 deletions(-)
> ---
> base-commit: 07a4844f2ef49f352ef46d0a4774ad63576a6694
> change-id: 20251024-st7571-split-c734b06106a4
>=20
> Best regards,
> --=20
> Marcus Folkesson <marcus.folkesson@gmail.com>
>=20

--lzylSUmEWLw12z5/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmkRqsMACgkQiIBOb1ld
UjLp/g//Wx8Zi8J9ICoijzYuUwNfbXTHvgCr93+F4ailefBExI9+zdkZW7BhG+05
6Gy5wbhj62B5uOQDW7OCqZnkNoky80cir5MrL+340kiBM7GBVTgdYLQhxi4MaW2+
ekcpY3hvm5gtADlp1pwt1Uzm75sC2mQmUlJY3Ld0F4ycdmKDiBRf5ErpbS5U499A
AEXXuoo6cMU0rETR+fgwkP+zzM24OIwD52AukXnwdQ/bSkQc85fhcnYO8f2tll5D
DdMsNdH7JTQNXbLzk4VBkwAokbepRGVEHCO4tHtDKwTsU4bMgocPBD8XANYu3xsS
gfhzVcTEi9HUy5ZMZPZ6RrUL3COCLt/v4Hxrs3CHtjccEmTzJqHVGl7pOaKtHxgM
k4jHvqHUb15LuTraDirkIehgS11AGjhJ1r01SmEM9jp8v5AbpaqMh4ifTDpJHJK5
MR0T7F/pWvE5EkxlkT7SdT0bJP5PgS1EGyVUX+sFNz5hYOJNAIkU8CseXzBwunAB
fq4gfwbOmDbzywDim+sxoKccDDn6nTuGV26X86seadGDmA6fhdtqVkvjbxSnICkL
N+SJzSySyjd8lFD4+oONJ3AASfBwQ6EA8M867v738rJh97hNYI8Y2HgdZme0SHGu
I995QZGM284vJ2Wkel/kUKhpJYFvChkwjA1zEXcPnckMiO4FoCU=
=DbrE
-----END PGP SIGNATURE-----

--lzylSUmEWLw12z5/--
