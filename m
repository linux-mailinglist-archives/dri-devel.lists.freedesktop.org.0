Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65842AF6FF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2436E165;
	Wed, 11 Sep 2019 07:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9E6E9A2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 07:36:15 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 7so18956519ljw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 00:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=nsYN7Wpu40mp1xfKDKg0z3SYgP7qu5/eSO3VzTtuBRE=;
 b=aSgVmFeNSYI2XEw61QsVFp+fAqUVW6jODKsSg4O4H3okQWaAKIF1DWe8OM8HLlKMur
 E125bJJ8y30rn6w1uhb+cJABRr905MCsMPdxFWeBiy0iCUvVy3CysgELLvT4OHo4ipYT
 bgwWwf1vnsZvDIK3Xq2/zzJnRxY0ZrMrKJ1HXauwgmU6ThyeyvR2iEH9Po1Z7JtZaCqy
 DAYqctIu2Ante7S0tdTTeynJYV+bsWtzXXTaeQRz5Ci5PgAbG5TUktWiO1ZryguNOj3z
 6fzLB/3jR5/t+uO7366Nr8lGu5swDYpk6ByaCELfG7Zm1yNDQ6Luef8ekDiksLCkzXbB
 NSXw==
X-Gm-Message-State: APjAAAWfjcKR8c8JhGRGwLF60aEe3/KYD512fC7fza6HXS7v+BbDLiga
 hmU1bIS9X/6R+x99TyWGXR8=
X-Google-Smtp-Source: APXvYqxiGmpG6CI9cIrTtojlxTi2vRtedim1/F4FubpL/nhx8sQF5pzhKWRi3qeIHZYYaA85QOhDCg==
X-Received: by 2002:a2e:29dc:: with SMTP id p89mr22352664ljp.228.1568187374207; 
 Wed, 11 Sep 2019 00:36:14 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k7sm4488008lji.68.2019.09.11.00.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 00:36:13 -0700 (PDT)
Date: Wed, 11 Sep 2019 10:36:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: two planes with the same zpos have undefined ordering
Message-ID: <20190911103604.4c05ba6b@eldfell.localdomain>
In-Reply-To: <uIh7eDYXe7Cj_3_8V0-WIdUfSrRlIHw8yb91myRQqlv5A7dS8TtfXZTsz0R84_LSQBdqkZvEHc6uWPnGJKIIqa_SnTr6RtmPRwr4d2u13JA=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <uIh7eDYXe7Cj_3_8V0-WIdUfSrRlIHw8yb91myRQqlv5A7dS8TtfXZTsz0R84_LSQBdqkZvEHc6uWPnGJKIIqa_SnTr6RtmPRwr4d2u13JA=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=nsYN7Wpu40mp1xfKDKg0z3SYgP7qu5/eSO3VzTtuBRE=;
 b=ICzrhKacDW26JcXUXebtbc2DComkM4d4Pu9g6C0OROQXdqbykcuCb+VcGU36zjUu08
 4WeMpMvgS/g3OWY0IuTwhTMFJgO3PJuL0nK1GATjO5Hj1fGOjngDhqs68Bb3PuQSVJAu
 jWcZtEmhCJgpQ1Rua6jLPOi7usWpHT5nqRVviLEZs9knty0nUE0Jm1MglUcPnrqk5SYL
 QXJmS7qudmoj/lQ7mohYKvy2kp3wZ4b+RODNIckvtIFWcoGgujQdg33HgLccZsdearsP
 pq1GDink3ug/uEGheRcK74waGNhLs6V1SCgQl+1qSYzEJLwFVub2zmzQoSSIy6L0HMCJ
 E98Q==
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Marius-Cristian Vlad <marius.vlad@collabora.com>
Content-Type: multipart/mixed; boundary="===============1193518415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1193518415==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dj331kd3e13gOp1ShXJ/sJj"; protocol="application/pgp-signature"

--Sig_/dj331kd3e13gOp1ShXJ/sJj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2019 11:20:16 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, September 10, 2019 1:38 PM, Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:
>=20
> > On Tue, 10 Sep 2019 10:09:55 +0000
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
> > > expose the zpos property, choose the latter solution.
> > >
> > > Signed-off-by: Simon Ser contact@emersion.fr
> > >
> > > ---------------------------------------------
> > >
> > > Err, I'm sorry about the double-post. I sent this to intel-gfx by mis=
take.
> > > drivers/gpu/drm/drm_blend.c | 8 ++++----
> > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > > index d02709dd2d4a..51bd5454e50a 100644
> > > --- a/drivers/gpu/drm/drm_blend.c
> > > +++ b/drivers/gpu/drm/drm_blend.c
> > > @@ -132,10 +132,10 @@
> > >
> > > -   planes. Without this property the primary plane is always below t=
he cursor
> > > -   plane, and ordering between all other planes is undefined. The po=
sitive
> > > -   Z axis points towards the user, i.e. planes with lower Z position=
 values
> > >
> > > -   -   are underneath planes with higher Z position values. Note tha=
t the Z
> > > -   -   position value can also be immutable, to inform userspace abo=
ut the
> > > -   -   hard-coded stacking of overlay planes, see
> > > -   -   drm_plane_create_zpos_immutable_property().
> > >
> > > -   -   are underneath planes with higher Z position values. Two plan=
es with the
> > > -   -   same Z position value have undefined ordering. Note that the =
Z position
> > > -   -   value can also be immutable, to inform userspace about the ha=
rd-coded
> > > -   -   stacking of overlay planes, see drm_plane_create_zpos_immutab=
le_property().
> > >     -
> > >     -   pixel blend mode:
> > >     -   Pixel blend mode is set up with drm_plane_create_blend_mode_p=
roperty(). =20
> >
> > Hi,
> >
> > this seems to contradict what the docs say in another place: =20
>=20
> Except this comment is about drm_plane_state.zpos, an internal DRM
> property. This is not about the zpos property itself.

Hi,

then I'm very confused. What's the difference?

The text you are changing was specifically added to explain uAPI
behaviour, that is, what the userspace sees and does with the zpos
property in uAPI.

Having two conflicting pieces of documentation is confusing, especially
when it is not absolutely clear which one is for driver implementors
and which one for uAPI consumers, or that one must ignore the other doc
depending on who you are.

> The comment was introduced in v2 of [1], although the motivation for
> the change isn't documented.
>=20
> [1]: https://patchwork.freedesktop.org/series/13528/#rev2

That does not look like the comment you are changing.

Wait, which one is "this comment"?

> > zpos
> >
> > Priority of the given plane on crtc (optional).
> >
> > Note that multiple active planes on the same crtc can have an
> > identical zpos value. The rule to solving the conflict is to
> > compare the plane object IDs; the plane with a higher ID must be
> > stacked on top of a plane with a lower ID.
> >
> > See drm_plane_create_zpos_property() and
> > drm_plane_create_zpos_immutable_property() for more details.
> >
> > from https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-f=
unctions-reference

Me and others have taken the above to document uAPI. How could that not
be the case?

Is it wrong for userspace to assume that plane object ID order reflects
the plane stacking order? Weston does not do this yet, but since we just
recently found the above comment, we planned to make use of it.

Actually, if the ID ordering is true, then the DRM core could always
expose the zpos property as immutable to userspace, just manufacture it
from object IDs if nothing is set by a driver explicitly.

Or is the comment about object IDs wrong and should be changed to say
the opposite?


Thanks,
pq

--Sig_/dj331kd3e13gOp1ShXJ/sJj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl14o+QACgkQI1/ltBGq
qqc3Rg/+PyPVvWehtnq24UK4WiR3DV+OaUjJ2sZREc0eIBSAWpmp6MfMc/QcicfY
LbieyfxLrbRLc3EZHwyQkJay+ndv1jrz6Di8+zt77bWc9aijRRCt/MYfrDynyZpP
UbrwOHm+lwd1OtjRPCT3AxRq+mxxyCyI0cp1aaLMEJwGJmXoULs202n1HQawncza
AS6F1OsKA6IUpkMoU8EpSEXlTpE0gDaF8SIutHqSgWcetAbhDQbkjCWTly902kmp
YYeP54e79xbTOEZOFNdgcmCCUB2gd2kdQJZxZChIO58t0sSkg0E1E8uNQjcOw5Lo
EnMKlZv3rGLofpz6HJeXCbPM48h3lPdy3hhYLRU0L5O5Uz0f9zzDNNPAJ6rRGm0p
JXduzqY1fhI2QezrWg3hKrU9o7QNKbKGdVrPraYKfL4dYMaBmkQzW0Tqz6VCWvG5
eZWFvSmelr4+RabNdpBWzq8xvpzTQ87N3bkxS1HT9yoMLtqlXbqPxKZo38hYAV15
NqANp53qSsLDMMWgxeb60RhbUTQnJcWP5HNLk2cvsTlJezsgFa4WreX72vOTrG1z
MOjciLhMJ8MgCPCohASyzUXGxVyi8pghNsaOLo/Sp4PwhdmlsL3Y/BNGPkauaw2c
X3hBCqmLKzFZf39VOfJCHAaSatiq0bmUFO+hY8oYtb/O8e8x3Zs=
=65r6
-----END PGP SIGNATURE-----

--Sig_/dj331kd3e13gOp1ShXJ/sJj--

--===============1193518415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1193518415==--
