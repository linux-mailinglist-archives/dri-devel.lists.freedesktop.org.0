Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1967B44D86D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 15:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A46F6E093;
	Thu, 11 Nov 2021 14:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457CC6E093
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 14:37:40 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id i63so12338710lji.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 06:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=fzNZLICvJaYHwb2gUPCpDvbugY0UEuX2trIm8MPKJ/k=;
 b=SiaHqt16NjCaUaNRnHVNYOceKP0YYSvQ5OU32I1Ogt1sAvAA0UlKtJ3dTCXbH6Tysv
 bmjAdZFclPc+hHci3yBAKkCwOHGV+Dp8xVz4NUteSmMQpv7O4Uxnb3oVB1PuFDkSiPty
 6x1cEYzNOQXEgOOBMnDMefZ8SQ1zZ2Ok1pJNJ6awxdCJ68HjWlHZJifVfo3Et8wOrILO
 3yEC8U8+ZeYspKlD8EXK4h1nNsaOArjeLl7Ac9lgkJn9LRxYqxXm5XZh1+gi2GJcbB/+
 CTKdP5mPCUNRkfZasztafV2NuaZfMC4vkG1dUwLEOZ6Uag5unaRPl3KXoiUiogRcF7qZ
 1ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=fzNZLICvJaYHwb2gUPCpDvbugY0UEuX2trIm8MPKJ/k=;
 b=FXxw4Oz04yCTUQtwFCiLXlJTkbYqqfTxDnbvFJIAp5LfKC4EA0M8s6u4CLVgKHIIym
 Jx62nUYSmAfXtq/5QfJxErntfOOhpYL884wGRZq25uP9hKk+chVpFAVjtqc+rkrPySj5
 j2+aryalya/fZJpFhKqVoPAijhHu8YfVYN4tpSwFMCaWaoTK5IaWOp6smpXYWBUPhsR3
 aKC6TNCp1PboPP/4+mcOgv25vXDaPv4xdDEByPqk4CejcZ2WwRQcxrBtL5O0eO2680VN
 VHdtsZMZ8fcsLTxSaKVm/7OwwdPcsWtBKBcBkMo1b43VVjIUm3a8uZqahbUNcCFESqlt
 inYQ==
X-Gm-Message-State: AOAM533Fnrv0LCEO3US3DSjfoskllNV+lmFQLtJFLCwdfLarvgtK3Kpt
 AJGoA4WFTOs1WADn1S3dPa0=
X-Google-Smtp-Source: ABdhPJxPD4kMdRCz46OdnonK6MyhrUvDNd3bRau/wfro9otaZ5jsALq/DSFgEAnlmrQ1f8XNTX9brQ==
X-Received: by 2002:a2e:9a5a:: with SMTP id k26mr7490071ljj.9.1636641458414;
 Thu, 11 Nov 2021 06:37:38 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 80sm282248ljf.4.2021.11.11.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:37:38 -0800 (PST)
Date: Thu, 11 Nov 2021 16:37:34 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20211111163734.0a6aefa6@eldfell>
In-Reply-To: <CAOA8r4H-=NAxuMzJumDDHxgq2_opg6509sJN-W7EM3+LNsey2g@mail.gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-7-igormtorrente@gmail.com>
 <20211109134017.09e71c77@eldfell>
 <CAOA8r4FHpmu0ZPjTj+qM0rV5jyQ2vt467uX1vhnqUbmBUMm3dA@mail.gmail.com>
 <20211111113337.0fd68f75@eldfell>
 <CAOA8r4H-=NAxuMzJumDDHxgq2_opg6509sJN-W7EM3+LNsey2g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_A4soY1ayjqJihXPNsCd8rv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_A4soY1ayjqJihXPNsCd8rv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Nov 2021 11:07:21 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On Thu, Nov 11, 2021 at 6:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Wed, 10 Nov 2021 13:56:54 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> > =20
> > > On Tue, Nov 9, 2021 at 8:40 AM Pekka Paalanen <ppaalanen@gmail.com> w=
rote: =20
> > > >
> > > > Hi Igor,
> > > >
> > > > again, that is a really nice speed-up. Unfortunately, I find the co=
de
> > > > rather messy and hard to follow. I hope my comments below help with
> > > > re-designing it to be easier to understand.
> > > >
> > > >
> > > > On Tue, 26 Oct 2021 08:34:06 -0300
> > > > Igor Torrente <igormtorrente@gmail.com> wrote:
> > > > =20
> > > > > Currently the blend function only accepts XRGB_8888 and ARGB_8888
> > > > > as a color input.
> > > > >
> > > > > This patch refactors all the functions related to the plane compo=
sition
> > > > > to overcome this limitation.
> > > > >
> > > > > Now the blend function receives a struct `vkms_pixel_composition_=
functions`
> > > > > containing two handlers.
> > > > >
> > > > > One will generate a buffer of each line of the frame with the pix=
els
> > > > > converted to ARGB16161616. And the other will take this line buff=
er,
> > > > > do some computation on it, and store the pixels in the destinatio=
n.
> > > > >
> > > > > Both the handlers have the same signature. They receive a pointer=
 to
> > > > > the pixels that will be processed(`pixels_addr`), the number of p=
ixels
> > > > > that will be treated(`length`), and the intermediate buffer of th=
e size
> > > > > of a frame line (`line_buffer`).
> > > > >
> > > > > The first function has been totally described previously. =20
> > > >
> > > > What does this sentence mean? =20
> > >
> > > In the sentence "One will generate...", I give an overview of the two=
 types of
> > > handlers. And the overview of the first handler describes the full be=
havior of
> > > it.
> > >
> > > But it doesn't look clear enough, I will improve it in the future.
> > > =20
> > > > =20
> > > > >
> > > > > The second is more interesting, as it has to perform two roles de=
pending
> > > > > on where it is called in the code.
> > > > >
> > > > > The first is to convert(if necessary) the data received in the
> > > > > `line_buffer` and write in the memory pointed by `pixels_addr`.
> > > > >
> > > > > The second role is to perform the `alpha_blend`. So, it takes the=
 pixels
> > > > > in the `line_buffer` and `pixels_addr`, executes the blend, and s=
tores
> > > > > the result back to the `pixels_addr`.
> > > > >
> > > > > The per-line implementation was chosen for performance reasons.
> > > > > The per-pixel functions were having performance issues due to ind=
irect
> > > > > function call overhead.
> > > > >
> > > > > The per-line code trades off memory for execution time. The `line=
_buffer`
> > > > > allows us to diminish the number of function calls.
> > > > >
> > > > > Results in the IGT test `kms_cursor_crc`:
> > > > >
> > > > > |                     Frametime                       |
> > > > > |:---------------:|:---------:|:----------:|:--------:|
> > > > > |  implmentation  |  Current  |  Per-pixel | Per-line |
> > > > > | frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
> > > > > |     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |
> > > > >
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > > > ---
> > > > > V2: Improves the performance drastically, by perfoming the operat=
ions
> > > > >     per-line and not per-pixel(Pekka Paalanen).
> > > > >     Minor improvements(Pekka Paalanen).
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++-----=
------
> > > > >  drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
> > > > >  2 files changed, 342 insertions(+), 134 deletions(-)
> > > > >  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> > > > >
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/d=
rm/vkms/vkms_composer.c
> > > > > index 383ca657ddf7..69fe3a89bdc9 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c

...

> > > > > +struct vkms_pixel_composition_functions {
> > > > > +     void (*get_src_line)(void *pixels_addr, int length, u64 *li=
ne_buffer);
> > > > > +     void (*set_output_line)(void *pixels_addr, int length, u64 =
*line_buffer); =20
> > > >
> > > > I would be a little more comfortable if instead of u64 *line_buffer=
 you
> > > > would have something like
> > > >
> > > > struct line_buffer {
> > > >         u16 *row;
> > > >         size_t nelem;
> > > > }
> > > >
> > > > so that the functions to be plugged into these function pointers co=
uld
> > > > assert that you do not accidentally overflow the array (which would
> > > > imply a code bug in kernel).
> > > >
> > > > One could perhaps go even for:
> > > >
> > > > struct line_pixel {
> > > >         u16 r, g, b, a;
> > > > };
> > > >
> > > > struct line_buffer {
> > > >         struct line_pixel *row;
> > > >         size_t npixels;
> > > > }; =20
> > >
> > > If we decide to follow this representation, would it be possible
> > > to calculate the crc in the similar way that is being done currently?
> > >
> > > Something like that:
> > >
> > > crc =3D crc32_le(crc, line_buffer.row, w * sizeof(line_pixel)); =20
> >
> > Hi Igor,
> >
> > yes. I think the CRC calculated does not need to be reproducible in
> > userspace, so you can very well compute it from the internal
> > intermediate representation. It also does not need to be portable
> > between architectures, AFAIU. =20
>=20
> Great! This will make things easier.
>=20
> > =20
> > > I mean, If the compiler can decide to put a padding somewhere, it
> > > would mess with the crc value. Right? =20
> >
> > Padding could mess it up, yes. However, I think in kernel it is a
> > convention to define structs (especially UAPI structs but this is not
> > one) such that there is no implicit padding. So there must be some
> > recommended practises on how to achieve and ensure that.
> >
> > The size of struct line_pixel as defined above is 8 bytes which is a
> > "very round" number, and every field has the same type, so there won't
> > be gaps between fields either. So I think the struct should already be
> > fine and have no padding, but how to make sure it is, I'm not sure what
> > you would do in kernel land.
> >
> > In userspace I would put a static assert to ensure that
> > sizeof(struct line_pixel) =3D 8. That would be enough, because sizeof
> > counts not just internal implicit padding but also the needed size
> > extension for alignment in an array of those. The accumulated size of
> > the fields individually is 8 bytes, so if the struct size is 8, there
> > cannot be padding.
> > =20
>=20
> Apparently the kernel uses a compiler extension in a macro to do this
> kind of struct packing.
>=20
> include/linux/compiler_attributes.h
> 265:#define __packed                        __attribute__((__packed__))

Hi Igor,

we do not actually want to force packing, though.

If there would be padding without packing, then packing may incur a
noticeable speed penalty in accessing the fields. We don't want to risk
that.

So I think it's better to just assert that no padding exists instead.
There would be something quite strange going on if there was padding in
this case, but better safe than sorry, because debugging that would be
awful.


Thanks,
pq

--Sig_/_A4soY1ayjqJihXPNsCd8rv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGNKq4ACgkQI1/ltBGq
qqeM0w//VuTC+zPravHSPXD6/RGltJ/bW8EQZfXVMqqYh0KMraKYvr5nIAL3Dhon
0N7fbr90wPsh7NWVlqi9IXI+g1s2j2yZXcuN+4LS6N2BB2gu5d76AJNrvok65iz4
q68/AiO8ViItbXR5h/B4WjOBjLx9aCMOgyuSQZxYfdaTd9eeulYlzdkUBAE4T12m
MSyHW9veuYFEWk2XMYXEvtMPZwcNKf2y55GkXOHC8PLNif91FmGmT+4opcPnx27f
azkvcOxauZE9LaUsnDoKmOZwf5GEudohbrMNAq4XSKRD1IHaHErAYtfsfMPxZ5gv
y/CMzFM1RNUjM3WB+leq7n6x45hxSPjwyxerb94f0jXsuDxjJHST0KgXY4HQPPue
4/VBvCMeLVpEZ/ilj5opJVCWYGqDqe0MEwamKp3N5W2TIw43aoHw9VhPKCd8ebJ+
8cLSRC+aad0GsJESysBw8314/O6q7ryNJm3B9BijjUGjMv0932cusYmQAPeHFNYJ
K9EhtkQ9tcqnPlUlNRh9x3DZ7/sQZxuPlZvJ126qUfetjnCLV68kaVCHsWnnaqx3
vHWxElrd9abWPVkIZIiOttBPbjkezDLYdItOD5c+tX0G+LgCAqNlWWB9hl80ieJx
5oDgv8WamXXPK78L5Y4/mi0yKlqV6LZtVz7W71rhYuzO2Fp5Ito=
=woYr
-----END PGP SIGNATURE-----

--Sig_/_A4soY1ayjqJihXPNsCd8rv--
