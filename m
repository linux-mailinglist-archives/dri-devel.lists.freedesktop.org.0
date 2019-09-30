Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A6C1BE8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 09:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7176E39C;
	Mon, 30 Sep 2019 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4606E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 07:07:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 7so8226067ljw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 00:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Dk7QucIHco7O5Oz3S/jjOXN4H5K6s7MI0o/vTt+X5fQ=;
 b=i9+s5u4VFhbMwfo5T7lnuGfZLGNJvYsumvqZ4XeQOIpJYfUyrO8NuEdSTjHLU5cxcx
 vt9SnMYq6DjvuamsVWnDjnTIeseSrtAv8myYc4ZKSv/mD8cipeTATTItA4OS9XrWxjNb
 UnbUpH0ECbnVPRAxoyiZ7OHbP5+DBsGfI/y4/N7IPDRYKq3oL5BXZEd0P7FihwuXRYHO
 G7x+vlTJCf3Kq8C2q+4o+62MRuvbzhRlz+dVe1zj5y2Wn9Xdek6Y+klmt1LnyXjMYtGV
 eBbP1yU+FEfVMpXlfX2m4Pxm8WNfjENQpM/ECHbEjvyGEhYT6yppvi+E1rfpz+t0PmNs
 Vdhw==
X-Gm-Message-State: APjAAAX1HN7E4V6zmm28PTfPXPNGI0msSVfp2NaZ6EAA4Ndb2WDTL3nU
 bezW+MG0yg45mD9z25JOVxw=
X-Google-Smtp-Source: APXvYqz9V3Anyvo0biCKGLnDvzIi4/sAsoqDhPEjvAajmFLfcCryzqtSBO29ckih/PIwxqWQS9yS3A==
X-Received: by 2002:a2e:141c:: with SMTP id u28mr11105483ljd.44.1569827237568; 
 Mon, 30 Sep 2019 00:07:17 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v26sm3749191lfg.27.2019.09.30.00.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 00:07:17 -0700 (PDT)
Date: Mon, 30 Sep 2019 10:07:07 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <20190930100707.178723d1@eldfell.localdomain>
In-Reply-To: <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Dk7QucIHco7O5Oz3S/jjOXN4H5K6s7MI0o/vTt+X5fQ=;
 b=uj2pldpGaBaQzO3Uo+EjOI5NWoGvzkFwLNwYYvuuyY8HUk3TBXUQgE28qEXGT4jspf
 USATlTJKJbkM9gACr9mHt86SAK8Bf4LGet0u+uOVPi5alyHhngk0Jp78DN+LR5Zjtj9U
 uCQDaLIWi2BqHLXMmjEnxITc+DbzOEGuUeK5GjrSb8toP5hYJVwrqRWfkCl2fBLa5gWU
 sFkrBxP7hCA/Hfq8riMPIFR0yCo9N9KDLkZWREdb6QN2mXDpBTzJxPIL8gMdkypDzGW6
 0KfVuFtdYVElFjTF7JQz6RW4AkYyYtjlcGLHDYnQ2ebU3C0y5zQnkErHwYp99bWOe9cv
 37qg==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0823914889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0823914889==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oVo5t_edWjzGJBISpbemci0"; protocol="application/pgp-signature"

--Sig_/oVo5t_edWjzGJBISpbemci0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 29 Sep 2019 20:30:44 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi,
>=20
> > On Mon, Sep 23, 2019 at 12:39:20PM +0000, Simon Ser wrote: =20
> > > Currently the property docs don't specify whether it's okay for two p=
lanes to
> > > have the same zpos value and what user-space should expect in this ca=
se.
> > >
> > > The rule mentionned in the past was to disambiguate with object IDs. =
However
> > > some drivers break this rule (that's why the ordering is documented as
> > > unspecified in case the zpos property is missing). Additionally it do=
esn't
> > > really make sense for a driver to user identical zpos values if it kn=
ows their
> > > relative position: the driver can just pick different values instead.
> > >
> > > So two solutions would make sense: either disallow completely identic=
al zpos
> > > values for two different planes, either make the ordering unspecified=
. To allow
> > > drivers that don't know the relative ordering between two planes to s=
till
> > > expose the zpos property, choose the latter solution. =20
> >
> > Some Arm's usage cases about two planes with same zpos.
> >
> > - "Smart layer"
> > which can accepts 4 different fbs with different src/display rect,
> > but this smart layer has one restriction:
> >
> > 4 display rects must have no overlaps in V direction
> > (A optimization for android window like Toolbar/Navigation bar)
> >
> > So when map this Smart-layer to drm world, it might be 4 different
> > drm-planes, but with same zorder to indicate that these 4 planes are
> > smart-laye planes.
> >
> > - "VR-Layer"
> > One VR-layer comprises two different viewports which can be configured
> > with totoally different fbs, src/display rect.
> > we use two differernt drm-planes to drive on HW "VR-Layer", and these
> > two drm-planes must be configured with same zpos. =20
>=20
> Thanks a lot for your feedback James, that's exactly what I was looking f=
or.
> Both of these use-cases make sense to me.
>=20
> I think user-space should be prepared to handle identical immutable zpos =
values.
> Pekka and Daniel, thoughts?

Hi,

given those explained use cases, sure, I agree.

> In any case, this doesn't change the patch itself. Probably something wor=
th
> mentionning in the commit message.

Yes, recording these use cases would be very nice.


Thanks,
pq

--Sig_/oVo5t_edWjzGJBISpbemci0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2RqZsACgkQI1/ltBGq
qqcbCBAAmiAa9qRbAvu1U1KxzJTiFKqPGLOThStx4iJKCFXALm4WSNJQSKx/Vhu9
8JtsoZgQWAa83pF7798PzodeXjWh4tk+6eyEewTFKyIGXCVq9iZDoxQJCwwnlWJU
gUjSbMyr7SaWHoLaQ8ROehqG1GLOYLi598Pnk3oNChWkVTxe6pGI91NxR2RptHUD
Dq7G0c3bUehiWJ0GtQOlZlxClzKhc30zzwXqRP0H1MVb5k1Cugqo5X+DNLlwXpkr
cXcsjUSATFfAkmobr3JmxRChrao3QVI1HVcDV5VEp375FG6hHpxFJyOTDkQo2kNs
foU+VnwKZtz0tBm9tm8DUBBjoCc4OD5U9Ww7lK5f7EqIu2zvQ+huwJfj0nyVMNU2
NrNGjx+b8rWX1P8Iq436fPgtDOV6FhuQTZovnUxfKYtYHHMt2YtwwDSIDwoYbVfo
HWzr/P+F1YhsddzgH9p3xv2a8KaumZNmUor5iRbuwwjm9KmPxkjDxqMaG5bB5/M6
Mky/BGRu6MbmX7DXbDvlNyzlSASaqHQUHlyOR2Ub1LxtxPK5VsXT2rtMyaQ/3ELm
lv7E1GMEH3EEigfcB1O411CmrSbJmk9NJwg87D/tiev9eqy3+3KE05NVC+P365oE
7ytISelll2u5KVUXL10qTGkDinF7dHe1LXe+l12Sf3ioO9rswBE=
=utOA
-----END PGP SIGNATURE-----

--Sig_/oVo5t_edWjzGJBISpbemci0--

--===============0823914889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0823914889==--
