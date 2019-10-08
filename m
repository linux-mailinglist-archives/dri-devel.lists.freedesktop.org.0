Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F252ECF8A9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 13:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F9C6E115;
	Tue,  8 Oct 2019 11:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7637F6E115
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 11:39:48 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so17148357ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 04:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=J4beejq8o/5JgWyav+dttcLxtnjhbwjwA7Yz0invu3s=;
 b=obC8PdQqbKvaANEMDqFDL/nzJyWCZbyzRfFFxB0AvaqAOI/SDYIar2yuEXuqMW/5Yn
 9ngC8CSPvcyQQgKBKlLRKomEtRJ5MNjKzrTst1Py2jUBfTMl8WbLUDo3KNrrbMNpZhuS
 cX5NI7SzsiZ4Xms33IfIZpVuWbZ52ps+Zmke4RyGe8U6Qi0G4Ddv2+tanCRJsnoA88K5
 QfArAwYJ/3cEnoZvHnYvxRmi5x+Qu1/Pp8NQ5PN42ZIpiVnU86pHx6lj6idP0tvGeu8+
 dJcmtjRBIzrK9d7e2CHZlu6Tw7BkQFDNveUJeTh2uPOaLT4WhBt/fnSN10guTLFjxHEu
 4sSA==
X-Gm-Message-State: APjAAAWnrxnEE+6hXvG/a4pc7olPoVzRKEfTFbu84xzmN9B5EEOgMsXf
 d/0zCJILp0Q7/FxJsCOIaWA=
X-Google-Smtp-Source: APXvYqxEEEanso29qMg4+S8uPqV/geLQoqyOJxUdqW9T3C7AoBFovphItu5ZUgpVmc1VpCrxwEv5Jw==
X-Received: by 2002:a2e:98ce:: with SMTP id s14mr21515381ljj.108.1570534786678; 
 Tue, 08 Oct 2019 04:39:46 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 134sm3584465lfk.70.2019.10.08.04.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 04:39:46 -0700 (PDT)
Date: Tue, 8 Oct 2019 14:39:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <20191008143936.6f49b098@eldfell.localdomain>
In-Reply-To: <20191008095904.GL16989@phenom.ffwll.local>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
 <20191008095904.GL16989@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=J4beejq8o/5JgWyav+dttcLxtnjhbwjwA7Yz0invu3s=;
 b=HviY/krPPgs3pA/EvfB32HlqIUlvELo8ku+jWz6Jefe7yVil1O7bjmxzegrzW+pV7J
 x6snAf3XAnTGgy+yTV7ur3JLyfslXyRN+CQzOod7+r2c4da9N1Nzhw+hXiu7VXFCJZw4
 4bqm0LFNIILXB05IHyKNJX+URk4BRZtlR7dvzt9GrHC6Det7x6h+W9mPjJ/jrDwUXOCf
 ziPeUDAWY0xSvNXzuMIFklpI4xsqXAq4gcurCcV+HLMv1j+m24t72vhxpTqew3Yl1tOO
 YxK/nFFdmoJEt8a5wlc/1q+4c8qt3NyIvlDIaOIK3AG1dgMCZwBAaD7AaoxHpLWNX8oN
 MWXA==
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
Cc: Simon Ser <contact@emersion.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 nd <nd@arm.com>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: multipart/mixed; boundary="===============1052862816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1052862816==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i5SNKftMMeKN4MtpstyKo+C"; protocol="application/pgp-signature"

--Sig_/i5SNKftMMeKN4MtpstyKo+C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Oct 2019 11:59:04 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Sep 30, 2019 at 10:07:07AM +0300, Pekka Paalanen wrote:
> > On Sun, 29 Sep 2019 20:30:44 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > Hi,
> > >  =20
> > > > On Mon, Sep 23, 2019 at 12:39:20PM +0000, Simon Ser wrote:   =20
> > > > > Currently the property docs don't specify whether it's okay for t=
wo planes to
> > > > > have the same zpos value and what user-space should expect in thi=
s case.
> > > > >
> > > > > The rule mentionned in the past was to disambiguate with object I=
Ds. However
> > > > > some drivers break this rule (that's why the ordering is document=
ed as
> > > > > unspecified in case the zpos property is missing). Additionally i=
t doesn't
> > > > > really make sense for a driver to user identical zpos values if i=
t knows their
> > > > > relative position: the driver can just pick different values inst=
ead.
> > > > >
> > > > > So two solutions would make sense: either disallow completely ide=
ntical zpos
> > > > > values for two different planes, either make the ordering unspeci=
fied. To allow
> > > > > drivers that don't know the relative ordering between two planes =
to still
> > > > > expose the zpos property, choose the latter solution.   =20
> > > >
> > > > Some Arm's usage cases about two planes with same zpos.
> > > >
> > > > - "Smart layer"
> > > > which can accepts 4 different fbs with different src/display rect,
> > > > but this smart layer has one restriction:
> > > >
> > > > 4 display rects must have no overlaps in V direction
> > > > (A optimization for android window like Toolbar/Navigation bar)
> > > >
> > > > So when map this Smart-layer to drm world, it might be 4 different
> > > > drm-planes, but with same zorder to indicate that these 4 planes are
> > > > smart-laye planes.
> > > >
> > > > - "VR-Layer"
> > > > One VR-layer comprises two different viewports which can be configu=
red
> > > > with totoally different fbs, src/display rect.
> > > > we use two differernt drm-planes to drive on HW "VR-Layer", and the=
se
> > > > two drm-planes must be configured with same zpos.   =20
> > >=20
> > > Thanks a lot for your feedback James, that's exactly what I was looki=
ng for.
> > > Both of these use-cases make sense to me.
> > >=20
> > > I think user-space should be prepared to handle identical immutable z=
pos values.
> > > Pekka and Daniel, thoughts? =20
> >=20
> > Hi,
> >=20
> > given those explained use cases, sure, I agree.
> >  =20
> > > In any case, this doesn't change the patch itself. Probably something=
 worth
> > > mentionning in the commit message. =20
> >=20
> > Yes, recording these use cases would be very nice. =20
>=20
> There's a lot more hw that does the same tricks (qualcom is one for sure).
> Imo before we encode this we should make sure that:
> a) everyone is happy with this new uapi

Sorry, what new UAPI?

We're just trying to make the documentation match what currently
happens, right?


Thanks,
pq


> b) drivers are consistent
> c) maybe even testcases in igt
> d) definitely an open source user
> e) no breaking of existing userspace
>=20
> I.e. definitely a separate patch.
> -Daniel


--Sig_/i5SNKftMMeKN4MtpstyKo+C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2cdXgACgkQI1/ltBGq
qqe6WQ//Vz2JLwg9bSi8qjCALxnTT1IQxLY/fSIB7sDUJCSQObZRq99+pQC4OnsI
gKrueoUnbdPhvwEWY1bKGPCn6koggJkIJutpZ36OZ+yBBNHHE0Mt6ynE0url0/hO
4cT5uqXVK/x5DHGZQVm+HSpgTlnmasUm+pu577dYalomnKLHXbEu9bQ+/7lWzHky
1ISd1lpOF19r0ouRFxeEUqvr3KtFhjHWazYs4syUHtuiKZueywlgKQNyNd3E2Ixd
V4HZY/GFbfN8fzkXP/WNfCT26qBfB/HlaPhLsm7+YQ30wBJymstpKuFRX8QNv0+t
lMq7b02K5EoUxxdbLe+xl26Exzhkp/6l9C6GGzKPKE7iHz/uLwrBrLBJ4DzDsIyY
kUwRsgvhrKr3imzH/pu6bKfBB0kJ34HKlEHX0xBjswPXzSQlescGE+MSRnzrczTc
vajoP6zhpCvzPounmqL2MwoJzxtBdffsIvP9ClFc5BnKHSnVXMR5xbadnle0UmqU
E00H4ZYhsXhb6jUQ31wWP3Pkp7u6PHi+2iLKg5eFETK1lKo+rGU8yTeWAP7aFVRw
e6WFLsYax72PBDGiFe35SXg/DC0/k+FXPnATeKtgfGluIGYp25cr2ickqKI122A2
5Otb2QEsKeVwmEzM/EGjxK4E568SwdQya+OZ4W5OUkySX0k84K4=
=BuXl
-----END PGP SIGNATURE-----

--Sig_/i5SNKftMMeKN4MtpstyKo+C--

--===============1052862816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1052862816==--
