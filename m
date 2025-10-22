Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD0FBFAE83
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE410E3B0;
	Wed, 22 Oct 2025 08:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+hRzNtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B9310E023
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:32:40 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3761e5287c9so71847721fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761121958; x=1761726758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kiGCLbh/3HzTe3/7IQ4t3TrShEZTnb9ow4sr5HYnYBI=;
 b=S+hRzNtBD5aDJL/7PJOnwJGE6DpccLEMS8409xTu2EZEPtnVcsHw6D5P9PJkHrznM/
 PyeKleariBAdO/fvd1XLac7PsqcokPL6jywp1LLnqc6LQDKyRrlLQRg+6OMbwikFCXrB
 nD3mfxTMDXrk6pRSjxROBkZ2SmFEksu5lAizZweRYnBjSoUgX3LJZfdZV+BfMRFl5cYA
 D+6Zv9v0eV8fGMgcKGc0jq0IgBxgvNYAehGCL4tCE/l3CIuJmGTnd18a0DeLfisplnWd
 hpZNnQjQF/PBFTRJNQUodM5EPT9+H9JbMvRktbpWbCQI4Hi5ILNgm3zcAIYyb9FHaQHa
 lA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761121958; x=1761726758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiGCLbh/3HzTe3/7IQ4t3TrShEZTnb9ow4sr5HYnYBI=;
 b=Rk2XX9RR4UfBBLJvVjlzHH5Uw5AJwpkgbEpqw/tnNKqnBDlD8tmi6Jgp42EdsSD0QZ
 pk7h7diuI/mO2I54A8GS+DvIjttyQutZ/xg29/eSe/pGcKmXwMpR/4p7pXrT0iXrnPzW
 dxWCLAvTWEgqfPo0af9YSxdoeLo/VehD2gblUvEkL8sgl2gUMESIyHK9QZZMxoCK51kM
 A+2IR3ULmVi2UV0IHDD3Y2QpVqIJ2X+SaF/HLAGUe9lzQm6fLH+yDHxvl3BpYO8owCW2
 +4jkgCknAXhru9eeYExmIsMzFH920B6g2joIF80xjQGIaQHJX2hSnWrOVUi+G16JP9xg
 jJ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAVgMokvUBrU4OWthruCnwRpoUT01fmugHMLGPdtr2at4D/TX+KTAbBZT4tKvQKW1VB7pySN9LGq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/NPqeLC5cVis1HXb8Jlb+HSOPHtRhdJQqTD9yTDrQ7qw+8f/M
 4/IFgQV/EsCwZ5EaBmqTL6BHDJFwV5rLPyTYdlljZJgIrgmI/ZvJkavr
X-Gm-Gg: ASbGnct2NlpF1PgzUnchJcboXZv3+2Sgblgbrvbb1usFM2Wxsp34K9J8KTqHx+LxOUI
 HMlsuzv9x1uZvLkCIHhaljXxbnas3ZICUW+b134J1j7iimW/nA4zZpfWRbJxscyq/xHpZomeRQn
 N1NcTi5x7NcEJtROULkL42fpV/nbO87Wgcu132DmvSiL5g8yO9prwprLLIHxasT1rLUw18nSeiN
 uvR9BAwmhdvIo1T2g1dnUyIQY1Z+TUtA3ZutMveLb2NjUpjC4on88sKoXqr7jCQs9bcHJHxwuuD
 ipYvb+tOLK58CKTtVAAZMrPI1GOJNgSEJ7rJe4fOuJn3Bt8gyzHpYKJ4iRE5+I/IDgcjRwVFKif
 bYgpotrOqRL2IRxpHhL73NpV2w2M8I6oqYxn94JkFYlfHOoDxYfaiDdEteFJrh9fiZ8rulPWZHP
 bDKLI8/81qEQiRwh6b17zqmcizjUucNcieROIeQaBUxMsbGHM=
X-Google-Smtp-Source: AGHT+IH1CNRr/4ibi1Eb3pAQaaEXOhfp7nk1oRCJbI999kaD84S4h59XYsCeji1Qhx2DPQklnIr3XA==
X-Received: by 2002:a2e:b8cb:0:b0:372:8e26:a4d4 with SMTP id
 38308e7fff4ca-37797a83656mr54737371fa.42.1761121957872; 
 Wed, 22 Oct 2025 01:32:37 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a950a284sm34810371fa.36.2025.10.22.01.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 01:32:37 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:32:35 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: remove unneeded semicolon
Message-ID: <aPiWo9UaK7N6SaVZ@gmail.com>
References: <20251022-st7571-semicolon-v1-1-83d322618ff4@gmail.com>
 <aPiOxYYY_dPkShsW@gmail.com>
 <b2021d28-63d9-415c-89d8-2beac80aab94@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="saWeArvJSS/fJjUF"
Content-Disposition: inline
In-Reply-To: <b2021d28-63d9-415c-89d8-2beac80aab94@suse.de>
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


--saWeArvJSS/fJjUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 22, 2025 at 10:19:13AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 22.10.25 um 09:59 schrieb Marcus Folkesson:
> > On Wed, Oct 22, 2025 at 08:10:57AM +0200, Marcus Folkesson wrote:
> > > Fix style issue reported by Kernel test robot.
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202510221125.Cg0sM4xJ-l=
kp@intel.com/
> > > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > > ---
> > >   drivers/gpu/drm/sitronix/st7571-i2c.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/=
sitronix/st7571-i2c.c
> > > index 32b91d65b768b26caa7dcef42a00d36f236fbc32..4e73c8b415d677dab5b42=
1666b56f4bb3697b982 100644
> > > --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
> > > +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
> > > @@ -322,7 +322,7 @@ static void st7571_prepare_buffer_grayscale(struc=
t st7571_device *st7571,
> > >   		size =3D (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
> > >   		memcpy(st7571->hwbuf, vmap->vaddr, size);
> > >   		break;
> > > -	};
> > > +	}
> > >   }
> > >   static int st7571_fb_update_rect_monochrome(struct drm_framebuffer =
*fb, struct drm_rect *rect)
> > >=20
> > > ---
> > > base-commit: c1a7cc00cd412505e070eb4e62bc0b0ca85243e0
> > > change-id: 20251022-st7571-semicolon-bc5287cde264
> > >=20
> > > Best regards,
> > > --=20
> > > Marcus Folkesson <marcus.folkesson@gmail.com>
> > >=20
> > Pushed to drm-misc-fixes.

s/drm-misc-fixes/drm-misc-next/
>=20
> This does not belong into -fixes as it's not a bug fix, just a style issu=
e.
> Also misses the Fixes tag. No need to revert, but please keep in mind for
> next time.

Ooops, it was pushed to drm-misc-next, not drm-misc-fixes.
Sorry for the typo and thanks for pointing it out.

Best regards,
Marcus Folkesson








>=20
> Best regards
> Thomas
>=20
> >=20
> > Best regards,
> > Marcus Folkesson
>=20
> --=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>=20
>=20

--saWeArvJSS/fJjUF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmj4lp4ACgkQiIBOb1ld
UjKX/Q/+OetKvifMK/UwdNGuydJFstcdXYk85idcyVnVJUfExv0EHlqXSCS71zkh
ouX0a2rBD1xjfzdwf5gYIOU+Drx1jpaNGTLMnW+e4PCzWAFpB6VbZxdSASsZfvvq
VMzBmL5uSH2jVA/mz7Wc7oVwBLXrSdXAVo9rXaqCjr47U476ITiAGJjJQIGaoRX5
3iW4Pj8K6lcWoDJSlXFgZ9xBCxKmi428yv7P2bEXbaG+RQK7u8a8ZiRxh4wKmzPv
yf7RO0dni4YbeKAZ90yO9OgBsFTjDKINhaegVV77zClnEoKM8AVELExyghgGIC7t
J7yyICFnVXc3dTNUjHCYU5HwyaoFU3v77/AeyazvQxnTNwvlSWQ8phN9Vj1I6uRd
XRzFfO9Wqu4jdBt3EE2UTrk/lVUxMl8Khi4G9WEADKVjlpVZH+RfoUgEIe5dvGKM
84BnyRXpouxFYOjuGaRJjkm0gMOEk37Nx6MyT0ewWNc3yMWPgiqln2P4yIZldaI6
CwKB+yJUMI13M1Q6UFHFujQ42GSFPzAeGFHoxbivbtrHOIv1AqPBP5oAU/kuqBHk
T0vm9i/ctmGhAc6jPoebO8PVZPZ61pPrwWon0/KCp2XWvGJaM2ONjjWWcJEOATcI
V1lCOePlCMMqyBfkFcko+4evPf5n7oHBMWCIV+/fZhDwoAEoHaI=
=Ct9G
-----END PGP SIGNATURE-----

--saWeArvJSS/fJjUF--
