Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C4A9A261
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039810E738;
	Thu, 24 Apr 2025 06:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dtu4qJrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F4C10E738
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:36:52 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54b0d638e86so687734e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745476611; x=1746081411; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VgManF3W+m3EucBE52I+E2k3U4KfqO+q1493Pk/44+o=;
 b=Dtu4qJrt3RfwjGkNzAlH5KOMCDjjelTNPO4XpSRsKPiteGhMMGOc6vPo4D+IYxUDlr
 BcqEIMg2HOeNkTbgwxtNEE5f3F456Tcxb06THJmS5xLMP7tKcCdTPalMzgqJ1IUkbWAb
 V1hfJvz+vq9ihJqYGZl2PAH+kjwleCAkLufEuPsTCgJGPEfnU4JOuRjAFVUu7v4jLUND
 P1kjN1miomEeTANQPMe0mniO8aU1JhvEnBDzkGqIK2pUdUViyZWwJcWpshweAdNjA3+q
 2gryeKt1WR8nbaJGPBbmFcE7J1z8kV8/ghzZf9Hc/ABsr4tRuyYjSOSTXNeaUxlWWyVz
 niEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745476611; x=1746081411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgManF3W+m3EucBE52I+E2k3U4KfqO+q1493Pk/44+o=;
 b=LBG6YKA/hIXK1ytZKV9YJIbMtH7dAXYjIjI4wEgaQCaIQ4+WwhbH6ThFFPPbOiILBG
 OytfCs/5E2UdP/6btl9rgqUrdERnHC6HB5PakIFWqnVWd4AL6YDAfjLXYSNlmys2ZsYB
 bj6mfd9uoC/F9A4I/J3s7LWL2auMYBo0Mv0FPhW3ML59jSqVsM9QW1wCbbWFbuWtz+Wt
 7imo7crZlaXNHsWsDWT/15xXAdxAW0FhaPHGxH8bPhN1nAVW8F6qt3s4cw9386POGVCi
 n45uOJlHO4K58dtTpS9Eb4BwX1xTNjhGXGpxLBVVkdE8H6Vj66uQq7hwekoeGZlVbgPh
 XLJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpCQFeOzSMlsq5xk8NawnIiDbv29PBCl979Tkdki6x+Nf9PlPrN6Af5CnI12xExuev34pXEw//ISw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHyvqTxiV8Z8BG9W0oszIv+nTZj1WxlOl9s+FdvQXfIOB3MTGh
 hHq41fuJq7+kd/vdcYYyEoE6UtAz3OJeZA02WkPD64O5kH3uEGz2
X-Gm-Gg: ASbGncuFpxrcjCpk6bQP/bz+Oy89F47nLDjp/ASrgFw5f0PI8lE/LTGFzIjDyf02oi4
 zDw2ey605IEkOPPwR0FvSb6dQKpog4pVXZ5ceswInWI+DusjFGpZyK7jk1dqfQOKPCRsD3Cru5N
 1KfajOOdqd2puexQ7kzi03VFwZml3ZSK4sa31KHuoIrqgH94ZwCC294lBUGwMtEBrJGhhi6xAEK
 RJV98dHt8/f8ocMbVyXDjOFd1kkGV8hb2yIB164rkFw7O5t+i0w5NpbYDZ+SnehJXeZs7SifTJ+
 OjMChkMVpPdHyFKRaH3OHX/BvPrBuWIxB739lvOSOJk5cWxQbwFxjhPiPNdgvwZPq8UCmOnv/5p
 T/w==
X-Google-Smtp-Source: AGHT+IHG0jMwpWPkpVYMRvWwLynBDuuX4rGAYjKrh3BbGXlEiCCaEKt5ltz3LfLHsRaI5CSLX7agNQ==
X-Received: by 2002:a05:6512:12ce:b0:549:8ed4:fb5c with SMTP id
 2adb3069b0e04-54e7c3fcd69mr447665e87.31.1745476610341; 
 Wed, 23 Apr 2025 23:36:50 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9eb4bsm121756e87.137.2025.04.23.23.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 23:36:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 08:36:47 +0200
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
Message-ID: <aAnb_97kxSDvDcdd@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S7Yr4c6CSMMUOBqv"
Content-Disposition: inline
In-Reply-To: <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
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


--S7Yr4c6CSMMUOBqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >
>=20
> I would structure the driver differently. For example, what was done
> for the Solomon SSD130X display controllers, that also support these
> three interfaces:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/solomon
>=20
> Basically, it was split in a ssd130x.c module that's agnostic of the
> transport interface and implements all the core logic for the driver.
>=20
> And a set of different modules that have the interface specific bits:
> ssd130x-i2c.c and ssd130x-spi.c.
>=20
> That way, adding for example SPI support to your driver would be quite
> trivial and won't require any refactoring. Specially since you already
> are using regmap, which abstracts away the I2C interface bits.
>=20
> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  drivers/gpu/drm/tiny/Kconfig      |  11 +
> >  drivers/gpu/drm/tiny/Makefile     |   1 +
> >  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++=
++++++++
>=20
> I personally think that the tiny sub-directory is slowly becoming a
> dumping ground for small drivers. Instead, maybe we should create a
> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>=20
> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
> your driver. And also have a few more Sitronix drivers in the panel
> sub-directory (although those likely should remain there).
>=20
> I have a ST7565S and plan to write a driver for it. And I know someone
> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
> the reason why I think that a dedicated sub-dir would be more organized.

I'm looking into moving all the (tiny) Sitronix drivers into their own
subdirectory.
When doing that, should I replace the TINYDRM part with DRM for those drive=
rs?
E.g. CONFIG_TINYDRM_ST7735R -> CONFIG_DRM_ST7735R.

Or do we want to keep the config name intact?

Best regards,
Marcus Folkesson






--S7Yr4c6CSMMUOBqv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgJ2/cACgkQiIBOb1ld
UjIIhBAAudyN05XrXX2Whsh+pWT+inxuTM9ECu2URVQ4JqXI16xqAwInW0nSgf5c
vN3mZR+EuIb8wYORU/FgG+1JDXtQGt1X7a0aYC7RkAJxOovF3uTfJPDP3GPp1sQW
cIXyFoantymDoA+KXZ5gt1YYBI1Zq58nkblmlhh+z+w6X1SfyEubK52ifFCQYc0O
91p98iGzpLzbU+fdgEA3ZIvxxl8bWcdCtBLrSXWzUjLTnZEZxMKJQqnPJBZjzYin
3MWmyQIDRvAXFgPswHEN02JJ91zv12+V0ak+k+2OVT3N0+53gW1HPkZuRqzEpoSd
VlI63w5rKxW5VmgH7RPryHsLvT0+tvyNGC9KR6A/wHbdIuYNGyiibmzpMMWESnbY
5b+nYHjInQuwiEMnv6hsCM7GrewTz7O6UfLx2LQn5nSlYWPt+JnCpsTMg83DOgFP
eVXPjCcZ9xxIdP4b3VJxdX0adS2+zfz7Xrbub7abWqbx4xmWBnI0aZM2uhc2Nf9F
PrYqUfa7qCeLw8ZcoYtX3LnuxJURFXdtm0pJtVWb3c9ZbMixA6owFi/D0+2jqDQ4
U30YVe0832ko1HPzMTrgCpa3C9mDCywmYNItd/+sE90K/VfBZ8qiFQRnC1jpiFbB
1RtJEOwoLytRGK7OFS68+yRVEzsBa/vBq6AQuN57NqZFNBtkmnY=
=7lP1
-----END PGP SIGNATURE-----

--S7Yr4c6CSMMUOBqv--
