Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41EAD30CD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F92C10E0D3;
	Tue, 10 Jun 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBe4ACAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4210E0D3;
 Tue, 10 Jun 2025 08:48:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-742af84818cso3606908b3a.1; 
 Tue, 10 Jun 2025 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749545333; x=1750150133; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Adyab7mK7y8FZTFYvCFrgwqWEigHl5r5FcCXAv987E=;
 b=MBe4ACAObCBt2TSOtCKdiOgbMYBC9DqEUu28mpVc9XNXn6HWq6G6tSPVevZXR8S3W2
 igmZ5plsP2yH8FC4ewF2CYUl08WwA5Sdw9057HC9P7Zm5pI25+kEVelyT5TfvDB6luvq
 kgb6EyXNfBViOPdEjcIC+rjr1CiHGJygq2lEpCsyX96K5IwmDqCaDm/tenUEOGxgzj0+
 nCyJ3+AIgz/cFv7GzzqxgUonuJu3oNKNolOwjOvhc43sPxIv8BPsurDZgw4OWxtRZelf
 jtxEZ1FTvMs/kktLsLdZ+E7nu5GERytGAQWulfmyrF0jyRaQSnj8B/X0NERI+CRKJ4Qr
 2ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749545333; x=1750150133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Adyab7mK7y8FZTFYvCFrgwqWEigHl5r5FcCXAv987E=;
 b=mJ88smU4A25+mYigu5hAsJFZ0KnhSi7I+sMipsITdcoE7ojmjY3TUz6SLr54kehgp0
 SbtLskhgvnI/vULRHxe6sFLE02xSa9M2JGBrlLxvuWOGbeWUb+uvGLosd1PiufwD2P/8
 yC8KdKSj4EZZRyXTQbxZBx/S+2jzf2rZMJb5mMDm83NQAYrzqNKustGb710A8Rl60zsl
 KE+mRQySHNBLH+nY9Mk5HkKJ42wbQ3SZL3+QayD4fchImhU2mcPVg4WWUhjJQs7EhcQX
 hDbjYkKPccxg4lvl5LOchZVcdY6jfYrjn3MY0Rks0r9cdDPYSKHkvouZG/hxpoaU5xWZ
 Q5Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqe2LsAK+ZFJR5KtHnPF3KBBx0Ub57J0YMEKtsqBMw3y3D03NAv2VKf3wKqZbIIHGSGdv0Pc8wFA==@lists.freedesktop.org,
 AJvYcCXISpifbvN6yxdvFFHzRUpvnZR/dqM1QKW37RxajPiEjxZJ7qEvi9+4hDE3BzUwRgTu6YF+Twv39z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Um2q/v5d+Ak46vL10Q5MrKfmmwWY5FtcI8901ftzbKcn8J4F
 k+TfU1mc/33R24Y1d511uU2VPIciZkJIUPz8tkrS0usmBsHxuihvgeTd
X-Gm-Gg: ASbGnctgkB40tHUGH4kFxGsa58ccc89eNIC5yGr1iwqRLIJqw9c3+zmkX1BxjUmWZ3g
 JickbaVueCtSeSfdYSJgDrGxFMIlzt/Bg5RJt7c94mvIqfRokRYC8bEyLAL0oh5erwK5+HhCChe
 sdwA10xXj6KHs0Pip7iMM5sT2RXaWrkYfaqRGUOJbZi0Mnun4yNVRNtnGoHZXTBAhLQ2B7whZYV
 +lK/bquaXqJEmHaDbSE9wj0zgbAAEUbuoopdpa8izVQ4jPwCMKOSNPaXMoxtZ2dGQNhAKB6Dbbe
 ue0OaUKEHQJ17/S8gKXAitmSGQEeeL2DDnBoIHydbAvaU2YNOmFBs7/HeH/1Ag==
X-Google-Smtp-Source: AGHT+IFp/a3BJUfZ11EtegJLCPwKpNZ2/owGoOb3Tq08bJgJCCkw3iG0UF0qdzi7S7gLYdonMEMPwA==
X-Received: by 2002:a05:6a00:806:b0:737:9b:582a with SMTP id
 d2e1a72fcca58-74827f3dab7mr23442739b3a.24.1749545332268; 
 Tue, 10 Jun 2025 01:48:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af38307sm7205070b3a.14.2025.06.10.01.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:48:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 33DBB4209E8C; Tue, 10 Jun 2025 15:48:49 +0700 (WIB)
Date: Tue, 10 Jun 2025 15:48:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
Message-ID: <aEfxcKv7pJ5L6wiP@archie.me>
References: <20250610065258.41467-1-bagasdotme@gmail.com>
 <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y8RoNhFPCm0EIgnk"
Content-Disposition: inline
In-Reply-To: <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>
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


--Y8RoNhFPCm0EIgnk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:34:06AM -0700, Randy Dunlap wrote:
>=20
>=20
> On 6/9/25 11:52 PM, Bagas Sanjaya wrote:
> > Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
> > subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
> > update kernel-doc reference in nouveau docs, hence triggers htmldocs
> > warnings:
> >=20
> > ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/g=
sp/r535.c
> >=20
> > Update the reference.
> >=20
> > Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subd=
ev/gsp/rm/r535/")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >  Documentation/gpu/nouveau.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.=
rst
> > index b8c801e0068cb0..878fb1ade31e4c 100644
> > --- a/Documentation/gpu/nouveau.rst
> > +++ b/Documentation/gpu/nouveau.rst
> > @@ -25,7 +25,7 @@ providing a consistent API to upper layers of the dri=
ver stack.
> >  GSP Support
> >  ------------------------
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > +.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
>=20
> Are you sure?  Did that work for you?
>=20
> I see
> /**
>  * DOC: GSP message queue element
>=20
> in drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c but not in the
> file that you referenced.  Maybe it just keeps moving around...

Indeed, the same GSP docs as in v6.15.

>=20
>=20
> This works for me. Please send a v2 if you see the need to.

OK. I will send v2 tomorrow.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Y8RoNhFPCm0EIgnk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEfxawAKCRD2uYlJVVFO
o2kRAP9CJA+u5eZWn1qw86oxaYpm5u/xyz/pc+6HFOmnzwlzUQEAjpmbsMGbxIGC
fShVOwx9gI6Zig+qYWmiMGOve5PQYQ8=
=g2xs
-----END PGP SIGNATURE-----

--Y8RoNhFPCm0EIgnk--
