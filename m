Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B7A9E8EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5810E37D;
	Mon, 28 Apr 2025 07:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FpsmPSb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7537D10E074
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:11:58 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so4669991e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 00:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745824317; x=1746429117; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nEGD1qOCOZE/6f17Jae6tXR6TvXp3ML70X8oQuCd5xk=;
 b=FpsmPSb/CVrss4C/FJMoxXtSqS7ygl4pM5FBOZ42z1MLEDGyXULl5t16j3rn6olCzN
 h5OjQAGTbYJsRv6hKIKixZJ4R/v5qPtIqyX3/9X/T8v08LCKxvxIwural6Khoq3g/zKS
 BjrXykoe7gzOdmOtdWvtBCZSqJEy7/O5rwwGjMnWqbp+AFmpi9AVyBratOB1SAbO2efh
 CEO6ltHbXvCeWiTZz9Z8JQKYJM8AGoGlydHpOwZDPEveHrwyRt74BgIB3eLUbqzzd9tS
 SzKu+jolB9LgJManIE64T1vR8KNDlvZ15s2l+yqvV4Pl6AJgwOvZaVnoRwKAZMy7PtWH
 tIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745824317; x=1746429117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEGD1qOCOZE/6f17Jae6tXR6TvXp3ML70X8oQuCd5xk=;
 b=h/L37huvsmhWVZfxDh2bMOnUKr+T4FVkbFBkA4dqYAieP1yBCG5M7N6lQdwxXFqx6F
 BntAFZOd+WMX1aNJxNIyB9IDrSNF8FRB+SlTf2Zib1Wc4TsFsnuBtHtqoMd6VfMsbErs
 qsGgkSlr6PlhVEmmsqXVJ8fUq0DPV2qgEkaLZUL529/XLbJzIKgx0RhDr09ae5FXUFg5
 yd1ArA52hv/qC3yGYrBdqt+GEmBB/WOF5+W2S2S9w3pHnYaV3j4PKbUvpce/hFD0pt9W
 0w+rsz06nZCCcHplgGn9ft8DHZo8xo0P+9DkNFZN9fEdZUhdhIAQQyP5wdDKnaf5SCcz
 kcXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6UXQhs/mTzanCUMNWIThtScQqb6i+mK9jkvlG1vz5ZeVaJy01yzoDhgrrfbzTV21bLtx67NL19vg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/YdIHYBrLczf3M0x5Wrs7G4iTc9yzuPMpCLMrA1L0So+eHWhF
 Or9m6ahK8ExGgsDAOkNbcs1ZzAmw2RGjYpbS8wv1eKvYC4DMXKY0PofL4pkUGcA=
X-Gm-Gg: ASbGncslKr9SIzC7CZnm9aOXy9OUwpdjzDuyEqQa1/K2OT3oCqKFOA0G11w+riJSAKF
 +ZyiPAtHDbmjZj1+jK44Coz/rJ458NIJOODJYuw2JrIiAe8wBqisjM4eZAOX+nPpgv4Tooauq8n
 INQQxDN4/XHUiG4MpK/I99UuuF02EDtsC/6JUGzrcfDw1eoFfskow1JanP/F87V+5+GUoRV9Iil
 pKE0OFktY8LyRDlGSe+aZu/7z0kdWeWPshexwvk4I/+/hfAGmkla3yRsTY4QhVLQnBW4cEB0BFB
 w1hDr2/ANoUzjOmB7ssRBJkZ1TwhmjzxnHscS++JrTUz15eldx2wjDlT6HXSFwmMsVjphMQJE7I
 Pfw==
X-Google-Smtp-Source: AGHT+IH5tTNFxT41Ny4rWJ0MhJIPoRHDYLcTSnP3jJ76hpK3f/FRXGQ0PW/C8Wuf5I6K4WGDB4y/ug==
X-Received: by 2002:a05:6512:39d2:b0:549:54f7:e54 with SMTP id
 2adb3069b0e04-54e8cc108a6mr3527956e87.50.1745824316466; 
 Mon, 28 Apr 2025 00:11:56 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9e99asm1595558e87.134.2025.04.28.00.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:11:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:11:53 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aA8qOSOsF1__yoiP@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cqMmL9NJFy0Qntm+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
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


--cqMmL9NJFy0Qntm+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
> Hi Marcus,
>=20

[...]
> > +                       /*
> > +                        * As the display supports grayscale, all pixel=
s must be written as two bits
> > +                        * even if the format is monochrome.
> > +                        *
> > +                        * The bit values maps to the following graysca=
le:
> > +                        * 0 0 =3D White
> > +                        * 0 1 =3D Light gray
> > +                        * 1 0 =3D Dark gray
> > +                        * 1 1 =3D Black
>=20
> That is not R2, but D2?
> include/uapi/drm/drm_fourcc.h:
>=20
>     /* 2 bpp Red (direct relationship between channel value and brightnes=
s) */
>     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>=20
>     /* 2 bpp Darkness (inverse relationship between channel value and
> brightness) */
>     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>=20
> So the driver actually supports D1 and D2, and XRGB8888 should be
> inverted while converting to monochrome (and grayscale, which is not
> yet implemented).

Hrm, that seems right.
I'm up to some rework of the driver, so I will put it into my pipeline.

Thank you for noticing this!

Best regards,
Marcus Folkesson

--cqMmL9NJFy0Qntm+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPKjQACgkQiIBOb1ld
UjJ0dxAAqBB1YfWqzi73/WA9wkKlpSVtUbIqm7o4VJkkJ8SqqIKMmr4xK0IerfN6
265Q+rIbWhCMsoV4gwbclRXth2tq5+CQ7LZQk7+pPzv/YquzhmyR7pN6pvW8zAIC
esbTKzJgk9ozFR1y/UOwdMjojszGQKlEBFfyiqKr5j+HROq1YlCkqFl4lgmflaPc
eH+c87IX5kKKi1c8gl800eGXeL36Lc2rY5eb+7Q//XYaILi4PioxMwxiWUhDiV5h
UJ5To8k44QFyuUnhXluHBQfVr8TTF0wF7pDx3ScIrL7jPEUjQw0Jb14ej2ZFtXPz
P/qXwU/jyZHLVP8El/aaTl/VHiZZuAlFUIMEG6Vsjn+wTKB45+04J5A48j6Sjl0x
V+B0IQADpGbhw7AXKOh1WPymnjfGhgD06GRhnQnOFMPVM7jl89wfUN+eAFHWF9IF
ANPgSBKwcyoa/dPqOYJZYhc9uSUEcFoSYrnOCW1t6es6bUPcklTG2aCG3T/4Gr4v
XZFv7x4EA1lbwt3n3TfneLqNHizpkxf4eN1WDCH71s34JzQcXlZxD1iKliM1TAlP
qCHHhBtWzXp2CLBtmKALQOmNf2HBXXxaPs6gYFQqk1CGQmySNachMzMAWAS2UOWG
UffAfo6wKdZyQh5KrCvTXkgD+Zg4r/u2THyB1RFcWEuHwDIa+Cc=
=22h2
-----END PGP SIGNATURE-----

--cqMmL9NJFy0Qntm+--
