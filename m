Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16CBC440
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 10:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF36E91E;
	Tue, 24 Sep 2019 08:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A366E91E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 08:48:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m7so1035951lji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 01:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=59MM8ydYY1BSksBcnb9EAapu5zj4/J6fFoU30tYm3UI=;
 b=Ygr7gX7O4nUECLUUxEC/DtSKJKYp1kNTh8VdCbwVz9zx/PewKCTv2j2LgbWl2t3mF3
 D6tN4987zrC5XweRWRtT4ST49iNVyqDCi9NiyvaP9+uWJr495cKSW94pavuTRqNpViUC
 Yf0OlUakRMhXifpPPxQps8ox8Pg4D6928jIZgHbVTOGNq8diGdOQ/jjJ6FmublpoFrVC
 WZujTvbpmjT8ApELSIc9UzrbqA++gQQfB/2862bXmnibeFu7C9TG2sZh2lv0D/1QWKY2
 peBtPbfN6WQz5NfpuArAX/k4Imy5ipFA3UILaZpVuaEPCTuiynFKGzFTodGiyguNRab3
 ahNg==
X-Gm-Message-State: APjAAAX1Ut8Iclmo0p9KIyTEA6XhTeZpk8JpNg6vQP0q70bWChEKZEJU
 S4uKyAqVTJLljPpVNugIXVQ=
X-Google-Smtp-Source: APXvYqz2tx0bde+Fd4vQBtinuNGNfAKszghM/LyLo+0MCn/zYkY8A5R9UivcRwyxmJoTsCinGwNDHg==
X-Received: by 2002:a2e:3015:: with SMTP id w21mr1193353ljw.165.1569314937661; 
 Tue, 24 Sep 2019 01:48:57 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r6sm303114lfn.29.2019.09.24.01.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 01:48:57 -0700 (PDT)
Date: Tue, 24 Sep 2019 11:48:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] drm: two planes with the same zpos have undefined
 ordering
Message-ID: <20190924114847.3f1d5a3c@eldfell.localdomain>
In-Reply-To: <Wlf2FCm5ef90dlnnXYnVGII1Q3nVX2hs-NdCNkzbNQzQqQfZrfMLuqYG1CTedcQCwsBOxrnRtlJFqn3fE8fR8ydYZWjC_pwnkJ9FbqkqPi0=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
 <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
 <CAKMK7uG1uXU5sO81VCN7zeNn62D-JHEW1QSSoJ695AULGt3zSQ@mail.gmail.com>
 <WHzXxgNIkxb4Mn1hdeAAwutlt0P-G2onwFr4FpA083VEVh1nIcstHOBRataUD7skpgtWd7BMDPF4v0GHJmQcLrnicVF1hpaUz_5WeSBUTWk=@emersion.fr>
 <20190919103414.08f81fda@eldfell.localdomain>
 <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190924102639.6d8a334b@eldfell.localdomain>
 <Wlf2FCm5ef90dlnnXYnVGII1Q3nVX2hs-NdCNkzbNQzQqQfZrfMLuqYG1CTedcQCwsBOxrnRtlJFqn3fE8fR8ydYZWjC_pwnkJ9FbqkqPi0=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=59MM8ydYY1BSksBcnb9EAapu5zj4/J6fFoU30tYm3UI=;
 b=jcqYXj6fARb7t944h7dlWz8GDVJmnr1kr8PwYVgmL4b5q3zVbrwOsYMxmFORbH2UUa
 JUNvCzudYpXcOVzUypmi/115xm0pP9+g1oKfGU4GiBV+debDf5XTMbBYzzrOwAaiOcgv
 ULhoEdVXZo3M3f/8txaRMfHDIGqU8eueBOywMwyFGD3ummV9DOoRxW9FjwlNgwaaivEs
 1CF56iu6wy/BnMKxpcl+yXhGajLgAlmX3/p87bfvAa6s+UtSEhqyYJCrjFwUtN35O9qI
 WxAOJiEL7saC5lJeg9Oxq7Y2DnH38c6HNVRIQO/FJoSWORK9hWKcSrFmrsuhrQIPFAPH
 bYjA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1717073382=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1717073382==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dMHQJ1Wu6af2jmiG=LJOUuE"; protocol="application/pgp-signature"

--Sig_/dMHQJ1Wu6af2jmiG=LJOUuE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Sep 2019 07:34:30 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, September 24, 2019 10:26 AM, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
>=20
> > On Mon, 23 Sep 2019 12:39:20 +0000
> > Simon Ser contact@emersion.fr wrote:
> > =20
> > > Currently the property docs don't specify whether it's okay for two p=
lanes to
> > > have the same zpos value and what user-space should expect in this ca=
se.
> > > The rule mentionned in the past was to disambiguate with object IDs. =
However
> > > some drivers break this rule (that's why the ordering is documented as
> > > unspecified in case the zpos property is missing). Additionally it do=
esn't
> > > really make sense for a driver to user identical zpos values if it kn=
ows their
> > > relative position: the driver can just pick different values instead.
> > > So two solutions would make sense: either disallow completely identic=
al zpos
> > > values for two different planes, either make the ordering unspecified=
. To allow
> > > drivers that don't know the relative ordering between two planes to s=
till
> > > expose the zpos property, choose the latter solution. =20
> >
> > Hi Simon,
> >
> > the commit message still talks about the drivers only, and I think that
> > is what lead me astray in the first place until I realized the
> > duplicate zpos value issue concerns only stupid userspace, not that
> > drivers were allowed to use duplicate zpos values which userspace then
> > needs to untangle with ID ordering. =20
>=20
> > Drivers never have undefined plane
> > ordering themselves - if they do, that's a broken driver that doesn't
> > know what hardware it is driving. If the driver doesn't know, then
> > userspace definitely cannot know any better - if some userspace does,
> > that's a gfx driver stack misdesign. So there is no reason for a driver
> > to use ambiguous zpos values. =20
>=20
> This patch in fact explains why duplicate plane IDs are allowed. The
> two alternatives are mentioned: either disallow duplicate plane zpos
> values, or either make ordering undefined.
>=20
> I chose to allow duplicate values because some HW might not know the
> zpos ordering between e.g. some overlay planes, but might know primary
> is under overlays.

Ok, seems like we are still crossing some streams here. There are two
different and independent cases:
- zpos set by drivers
- zpos set by userspace

Zpos set by drivers into nonsensical (duplicate) values is a driver
bug to me. Drivers do have the opportunity to not advertise zpos at all
if they don't know, even if that makes no sense to me.

I assumed that zpos set by userspace must be allowed to have duplicate
zpos values, because such broken userspace already exists. But do they
exist? If probably not, then atomic check failing on duplicate zpos
would be nice. But there must be some reason why the doc already
mentions that ID ordering rule for making sense of ambiguous userspace.

> If that doesn't make sense at all, I'd be happy to change the spec to
> say that duplicate zpos values are a kernel bug. We'll need to make
> sure this doesn't happen, e.g. with a check in the function creating
> the property.

I thought that was already the case.

> Note that user-space needs to handle undefined order between planes
> anyway in case zpos isn't advertised.

Of course.


Thanks,
pq

--Sig_/dMHQJ1Wu6af2jmiG=LJOUuE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2J2G8ACgkQI1/ltBGq
qqdInQ//UDxzhGqWceyCFk8Rzo21awdZf68nuNla33ZhP6QJXnypCXjMX4qxvUZM
auwjtK1rncQR/VD4ylYHv4h4DDJgay15WW0JfbKMkFTiMOtYshjVhQ1J1lJXd+a7
EcxRsrW5kwPI00oHAKYyVY73TMo61Y2EZterDvpbqBjRSvFW264ibOGmlnvBmrLO
Ckqk99NaE36xoAUTcTTj+i7ANPCy8bbkgWkpFupgavCWqSEBgITp3kaUJcuc08Jb
sx2nKqvkJn3wCIB+uec2ibCyVXCHsuSm8XmoN3LyNav+6fAOMFDQbe3E8/bbg7NW
xHymXZ+zqkNKprLQ/iUVvhLaSfz8JbVXOUJL2yEHSDPim1KvASY9JGfbOzK+p+aK
S8j8dhMkTzCBaHatSBaVk1YAmy16rJqCfoVC7cQbQjo7Kain6g5z9RjdIHyyXkOR
8NVOYTO51bsZ8ebxYXYdEJiQShqTidqoJpySP+7Gt6KAFT6hHbhwwlAWehHL85i1
CMLj2Cl4atGJaTUcZUXR05LFL2aybTHVLkJKqNJEwV523wdWBBxKN+mJZbtDprMk
mb6Qbx6cSyIA/vYCkY2swnUwOQtiqr750l3ZNcsN7igFnYgBZ14L1oT7jaCFXorY
2C54INvs6Re1ZReamoQk9EK3YTZ/7Nl8OW1AWzYo90kGKmgX2us=
=MmAf
-----END PGP SIGNATURE-----

--Sig_/dMHQJ1Wu6af2jmiG=LJOUuE--

--===============1717073382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1717073382==--
