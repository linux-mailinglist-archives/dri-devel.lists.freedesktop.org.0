Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13D2D3D40
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB676E15F;
	Wed,  9 Dec 2020 08:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8150A6E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 08:23:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l11so1968226lfg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 00:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9GJs+A48cLVAOQA7wz9aoSL6cXGTqhuIuHYLTtiK6TQ=;
 b=dBtCQeXMk5AUhQebH2DC8RhaDj0q5aMNhdbISlh0UZji8Qu3bVi1AxO+Pcm44LfWjV
 ffAtf8TftV532WZjtJRuvsABXizRYF8d/YrVyoDt9IurMn+8IJVKXRJO2PQlGOjdEy81
 ypEu7BHLgRiAPF1Zy8WjAuvuxC0s3c0/PbA2fsztgYwKFPpmt3ilvex8oAyUaDUxWbmQ
 vYk2AKfN9+2xMUwz2ZNGAfEj3BRSd73BPPJCFrDjcnyNEhsyaE+b20D6FRSi4L6+B1mE
 C9snLbMPp654H2Dw48LOUysQ8bskksg+054YSxORBqL/yhw3IgSCJPDdXBK1alho53i0
 a30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9GJs+A48cLVAOQA7wz9aoSL6cXGTqhuIuHYLTtiK6TQ=;
 b=cZHonG7H9Fd9uJu4GcxVc6Jg8fP7U8Fon6cdshsvDALzhFB8kNAvhjehXzDk0RKEk+
 IuPH2puPV4SDHHJq7iQ2iKtDaxHz2aOdUYpCXBq2YM12po2a74aQ7xx37xSsIYDiCFR6
 PlpJmmetfPg8HzXm3RN+FOdGziF9dzelq0e4aQqQcAkYcpG8fzGnbV7kkn9Zh0Dns89H
 p95bMBJ0SMlP/1bfIpvWI1dRfZQtTACxf+xcu9zXWhdqQj1eCF+vFIKJJirE7MC03fNg
 bhkJVlQOVhYqkGuar5TL+WcAwAIQCFP3Ojf2s/JZ1oMwd8LuWlqRf3m9akMhnRZihvJR
 qt7Q==
X-Gm-Message-State: AOAM532Qbz4K45j4qVvGlfktBrZ8ggI2hMdwM7GheTaBHMIIG9wK7XtV
 tw0Vd+DlQ7FhYdbCQ1M/m0A=
X-Google-Smtp-Source: ABdhPJy+2Yd6C8kyw7xBVl3wnD3G3iLjVGc4n9R4u7gO38xCH4+DPOMHOxo2apvNr4dFf7K+HhqO6w==
X-Received: by 2002:ac2:5d68:: with SMTP id h8mr620896lft.448.1607502203715;
 Wed, 09 Dec 2020 00:23:23 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d18sm133247ljo.49.2020.12.09.00.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 00:23:23 -0800 (PST)
Date: Wed, 9 Dec 2020 10:23:13 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <20201209102313.23a4a000@eldfell>
In-Reply-To: <20201209003637.GK401619@phenom.ffwll.local>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
 <20200807090706.GA2352366@phenom.ffwll.local>
 <20200807123802.6058baca@eldfell>
 <20200807130636.GD2352366@phenom.ffwll.local>
 <1A6pssulTBjmoPioJfGenq9NdbnGjw2dhBoivqmrgraY67Gac7BoUHupkvqc7UBF_q2P5RwEcXP-m-5Jd00vC2hg-QMkGj2Ms_Jh5nLz-os=@emersion.fr>
 <20201207104542.10657acd@eldfell>
 <i1OlhCAio_JRSK_q7z7mpkyiPlrIO1Nszlav03n1LDGZKoEO3lybu-tdg7taxbtnOst4TdpJYCW-S1FAq3t5SEaDcul02W1mil5_sFySrSI=@emersion.fr>
 <20201209003637.GK401619@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1497696496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1497696496==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lYkxJ=pNlNSeA+.R.+r5jZ+"; protocol="application/pgp-signature"

--Sig_/lYkxJ=pNlNSeA+.R.+r5jZ+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Dec 2020 01:36:37 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Dec 07, 2020 at 09:10:00AM +0000, Simon Ser wrote:
> > On Monday, December 7th, 2020 at 9:45 AM, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
> >  =20
> > > > > > > > - * Cursor and overlay planes are optional. All drivers sho=
uld provide one
> > > > > > > > - * primary plane per CRTC to avoid surprising userspace to=
o much. See enum
> > > > > > > > + * Cursor and overlay planes are optional. All drivers sho=
uld provide at least
> > > > > > > > + * one primary plane per CRTC to avoid surprising userspac=
e too much. See enum =20
> > > > > > >
> > > > > > > I think that's even more confusing, since this reads like the=
re could be
> > > > > > > multiple primary planes for a specific CRTC. That's not the c=
ase, there'
> > > > > > > only one pointer going from drm_crtc->primary to a drm_plane =
in the
> > > > > > > kernel. =20

So this comment from Daniel is actually wrong, because possible_crtcs
mask for a primary plane can have more than one bit set, and Simon's
wording is accurate.

Except "should" should be "must", see below.

> > > > > >
> > > > > > There could be multiple primary planes *usable* for a specific =
CRTC but
> > > > > > just one used at a time, right? =20
> > > > >
> > > > > I'm not sure what you mean here, the crtc->primary link is invari=
ant over
> > > > > the lifetime of a driver load. You can't pick a different one, th=
at's set
> > > > > at driver init before drm_dev_register (and hence before userspac=
e ever
> > > > > sees anything). =20
> > > >
> > > > OK. I'm personally not very interested in documenting legacy bits, =
so I'll skip
> > > > that. I'm mainly interested here in making it clear possible_crtcs =
for a
> > > > primary plane can have more than one bit set. Because of the paragr=
aph in the
> > > > current docs, some user-space developers have understood "more than=
 one bit set
> > > > in possible_crtcs for a primary plane is a kernel bug".
> > > >
> > > > I'll send a v2 that makes it clear these pointers are for legacy uA=
PI. =20
> > >
> > > Right, so this and what danvet said seem to be in direct conflict in
> > > atomic uAPI, repeating above:
> > > =20
> > > > > I'm not sure what you mean here, the crtc->primary link is invari=
ant over
> > > > > the lifetime of a driver load. You can't pick a different one, th=
at's set
> > > > > at driver init before drm_dev_register (and hence before userspac=
e ever
> > > > > sees anything). =20
> > >
> > > But still, it is considered not a kernel bug that a primary plane has
> > > more than one bit set in its possible_crtcs.
> > >
> > > If a primary plane has more than one bit set in possible_crtcs, and it
> > > is not a kernel bug, then userspace expects to be able to choose any
> > > of the multiple indicated possible CRTCs for this primary plane.
> > >
> > > Which way is it?
> > >
> > > Or, is there a different limitation that for each CRTC, there must be
> > > exactly one primary plane with that CRTCs bit set in its possible_crt=
cs?
> > >
> > > IOW, you can have more CRTCs than primary planes in total, and you can
> > > activate each CRTC alone, but you cannot activate all CRTCs
> > > simultaneously because there are not enough primary planes for them?
> > >
> > > Representing it mathematically, the possible assignments according to
> > > possible_crtcs while ignoring all other limitations are:
> > > N CRTCs <-> M primary planes
> > >
> > > - Is N one or greater than one?
> > > - Is M one or greater than one? =20
> >=20
> > I think the current situation is that:
> >=20
> > - It's perfectly fine for a driver to expose multiple bits in possible_=
crtcs.
> >   User-space can attach the primary plane to any of these CRTCs (of cou=
rse, a
> >   primary plane still can only be attached to a single CRTC at a time).=
 Drivers
> >   should provide as many primary planes as there are CRTCs.
> > - The legacy API doesn't expose primary planes. Some legacy IOCTLs like
> >   drmModeSetCrtc allow user-space to attach a FB directly to a CRTC. Th=
e driver
> >   needs to implicitly select a primary plane for this operation. That's=
 the
> >   only case where the internal CRTC =E2=86=92 primary plane link is use=
d in the kernel.
> >=20
> > Is this correct, Daniel? =20
>=20
> Yup. atomic doesn't use crtc->primary link at all.
>=20
> Pekka, where did you see an indication that this crtc->primary link is
> used for atomic?

Hi Daniel,

I was asking about KMS in general, atomic included, and you were
talking about that variable, so I got really confused. I do not care
about kernel internals, only uAPI.

> My statement was only about legacy ioctl impact of
> ->primary. Atomic userspace can pick any plane it wants and consider that=
 =20
> the "primary" one (the hw/driver might reject that, but that's a different
> issue).

Even from non-primary planes?

Ok.

But to keep things simpler in userspace, userspace will probably settle
to always use exactly one primary type KMS plane for any CRTC it is
using.

> > So I believe M > 1 and N > 1 is possible and isn't a kernel bug. For in=
stance
> > some drivers hardcode possible_crtcs to 0xFF (although it might be nice=
r to
> > user-space to set the bitmask depending on the number of CRTCs, to avoid
> > setting bits for non-existing CRTCs). =20
>=20
> possible_crtcs for a primary plane has exactly the same constraints as
> possible_crtcs for any other plane. The only additional constraint there
> is that:
> - first primary plane you iterate must have the first bit set in
>   possible_crtcs, and it is the primary plane for that crtc
> - 2nd primary plane has the 2nd bit set in possible_crtcs, and it is the
>   primary plane for that crtc
>=20
> and so on. That's all. I'm not sure all drivers get this right, so I think
> it'd be good to check that at drm_dev_register time (we check a few other
> things about these possible_crtcs masks already, so it's a good fit).

That seems to create a 1:1 relationship between CRTCs and primary
planes, but additionally allowing other associations as well.

This means that there cannot be two primary planes that are *only*
possible with the same CRTC.

Also, there cannot be two CRTCs that could *only* be possible with the
same primary plane.

In other words, enabling a CRTC never fails because you run out of
primary planes, assuming you use one plane in total for each CRTC.

I understand that the answer to my question "There could be multiple
primary planes *usable* for a specific CRTC but just one used at a
time, right?" is largely "Yes." because possible_crtcs mask for any
plane can have more than one bit set. Whether it is actually possible
to use two KMS planes of type primary simultaneously on the same CRTC
is up to a driver, I guess, but not forbidden, yet unlikely to work.


Thanks,
pq

--Sig_/lYkxJ=pNlNSeA+.R.+r5jZ+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/QiXEACgkQI1/ltBGq
qqe6dw/7BHdSRT0Z6X54kaBr2aDF3hwsd7uTxoepSiXJzWKWIqNUyZT1bvpiFNus
VwpqI9m3Avgto/qYR8fIbfxPM6kl6wcYN+URv9XctvS0fxBLpLbOe5mjppe1qkG2
Xy11MTCT1SF6B9a9gPRgtfSw1BYt4muvQZzwH3ihgMab7KYINN2OIT/bTfLYSZVn
muxYGpbiv/xEdQHmPCE9Gkkh0y4IJETwfgi23ZxX7fiBj65zvaNfwbvgZ21ZmT3I
zDuDWLHwJk1ac8FCR7mmb4AuSAPxc6ESeH738X/YTdfETGw12Mpm1jJ+ZX/lmfK+
u5mjuyTJJha2Bbsgj+Lm21sDmyG3gJOnEFUDnm3T4Q1iEIP+d8HUOqf8cfBxo6ia
Q5ZwAvYg0LBNjhDKk9jt6r3Ge7HcERr6Rf4ig92OQlB01Qaxtgu6zpR8TSIsmhiJ
iegdnTkPakX5ATa6OqaEO5u0GFqSKkVQeTNebkihdy9lDaIBwrpKsSKr9cjuwCVW
6JN5ON3o2hvI/3CMONMAI8SCGcQwQnFoO+87+yh9PLx3/6JMngLUYYuXfSzcWmP6
wwqQLMs5nChxGiuQxBW1SUuA6m9UEqM7tb9c/Md3EDahk+EhP+Wau2HpkBBCrO5C
S/nRJpApEiovTTm6vjnWShdcPt2vNhqedpGtZWQA5wooGpINXJg=
=YoCy
-----END PGP SIGNATURE-----

--Sig_/lYkxJ=pNlNSeA+.R.+r5jZ+--

--===============1497696496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1497696496==--
