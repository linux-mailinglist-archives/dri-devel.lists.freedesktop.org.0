Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE07B73EC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89D66F990;
	Thu, 19 Sep 2019 07:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A6B6F990
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:18:48 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u3so1533167lfl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 00:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0i9uimCzshbY226yaUdoXKgkfWsyx5wJbGXzYjTgtTA=;
 b=m3NNOf5Z9bV3n3uP/fVPpIxvxepPlHaudXrn7y+VVERQr29hECcFTJzTBUR/yZJRvZ
 xItGrZ4lnszhY3xYrf688h3zFVij2IX+rrb6A9nlLxW+OhIEaBYQHGI9Rv05N3g3MR6d
 kC34A6h6czyJC1RxyLE6Q19YZJjG0XhOBtMJL2Zfm/KNz8iS3mUzuSkmn1t3Epnnde+N
 chbkFFLNV/qDjiiq/XvAK1pEs/KITy0e15+giASVel2vwD9+McOgpAHjvAdf1S982Cd2
 xtxHOZzDB81qPaInF2+DQHFU+1lILy1qQVu8GP02OJMGAcID32sAh7KyQNayYYefRqU2
 oZLg==
X-Gm-Message-State: APjAAAV/Asfqtn7OctQe4ABQMbtI76kMdGhzqQsYHy7dK179wGOafdFu
 KXKbEDXmE65tUA8ZgVu56GM=
X-Google-Smtp-Source: APXvYqxS16JsYTDyPQnskqGDVsMVyr2Pu+ABkEAMwTbdA559lsDaP+qQrf5PldsuxEwJHXgm4pL+FQ==
X-Received: by 2002:a19:f204:: with SMTP id q4mr4108689lfh.29.1568877526467;
 Thu, 19 Sep 2019 00:18:46 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k28sm1389562lfj.33.2019.09.19.00.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 00:18:46 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:18:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: two planes with the same zpos have undefined ordering
Message-ID: <20190919101836.76d735ba@eldfell.localdomain>
In-Reply-To: <fNZQmqVgMDGSK8zIcxQHCsbo-z5GPhcd6GxIEVrpt6ubbauLhe9IbPo77ilXH0SccjutcCbq3iym-DnBQ5Q3wyY1WGPiDxwz3_Pj9--fgZY=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <uIh7eDYXe7Cj_3_8V0-WIdUfSrRlIHw8yb91myRQqlv5A7dS8TtfXZTsz0R84_LSQBdqkZvEHc6uWPnGJKIIqa_SnTr6RtmPRwr4d2u13JA=@emersion.fr>
 <20190911103604.4c05ba6b@eldfell.localdomain>
 <fNZQmqVgMDGSK8zIcxQHCsbo-z5GPhcd6GxIEVrpt6ubbauLhe9IbPo77ilXH0SccjutcCbq3iym-DnBQ5Q3wyY1WGPiDxwz3_Pj9--fgZY=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=0i9uimCzshbY226yaUdoXKgkfWsyx5wJbGXzYjTgtTA=;
 b=tUSFf5CTVDEW9zc9FKe2gjZyMtQDr8ZVbRidja4x7FFb40PnOJtN+asTyFWxeVfTGS
 fLTakThjxFZ/J2ljJ846Cx+Tpi0wKqdMXLjbIzsPKD+J9qTXa1uW8rpGtdBZ110Rfdbo
 QhT4V7K5ZkRSZ+EgjRdkflmaL9+8l6dAgB3Mnfk38CYqJr6cLL0eYyTfsabyDMW3QX26
 Lfw5f5g8FsMgefbcJ3gFJHU+Z8kahCmU8Vf4CrHOrI/6OcnJ6SeibmF0hJV/RLgC0qq3
 J2XhPZIXjn+k0NIgeLl6753DFSDHy8a6CkUk+KsWLR5sntRZ1r/05n6ajUoVkDrlZC4D
 JMnQ==
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
Content-Type: multipart/mixed; boundary="===============1759174689=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1759174689==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gAccgzkUdV8ahqR7MZ29=pJ"; protocol="application/pgp-signature"

--Sig_/gAccgzkUdV8ahqR7MZ29=pJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Sep 2019 09:19:09 +0000
Simon Ser <contact@emersion.fr> wrote:

> > On Tue, 10 Sep 2019 11:20:16 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > =20
> > > On Tuesday, September 10, 2019 1:38 PM, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
> > > =20
> > > > On Tue, 10 Sep 2019 10:09:55 +0000
> > > > Simon Ser contact@emersion.fr wrote:
> > > > =20
> > > > > Currently the property docs don't specify whether it's okay for t=
wo planes to
> > > > > have the same zpos value and what user-space should expect in thi=
s case.
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
> > > > > So two solutions would make sense: either disallow completely ide=
ntical zpos
> > > > > values for two different planes, either make the ordering unspeci=
fied. To allow
> > > > > drivers that don't know the relative ordering between two planes =
to still
> > > > > expose the zpos property, choose the latter solution.
> > > > >
> > > > > Signed-off-by: Simon Ser contact@emersion.fr
> > > > >
> > > > > ---------------------------------------------
> > > > >
> > > > > Err, I'm sorry about the double-post. I sent this to intel-gfx by=
 mistake.
> > > > > drivers/gpu/drm/drm_blend.c | 8 ++++----
> > > > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_bl=
end.c
> > > > > index d02709dd2d4a..51bd5454e50a 100644
> > > > > --- a/drivers/gpu/drm/drm_blend.c
> > > > > +++ b/drivers/gpu/drm/drm_blend.c
> > > > > @@ -132,10 +132,10 @@
> > > > >
> > > > > -   planes. Without this property the primary plane is always bel=
ow the cursor
> > > > > -   plane, and ordering between all other planes is undefined. Th=
e positive
> > > > > -   Z axis points towards the user, i.e. planes with lower Z posi=
tion values
> > > > >
> > > > > -   -   are underneath planes with higher Z position values. Note=
 that the Z
> > > > > -   -   position value can also be immutable, to inform userspace=
 about the
> > > > > -   -   hard-coded stacking of overlay planes, see
> > > > > -   -   drm_plane_create_zpos_immutable_property().
> > > > >
> > > > > -   -   are underneath planes with higher Z position values. Two =
planes with the
> > > > > -   -   same Z position value have undefined ordering. Note that =
the Z position
> > > > > -   -   value can also be immutable, to inform userspace about th=
e hard-coded
> > > > > -   -   stacking of overlay planes, see drm_plane_create_zpos_imm=
utable_property().
> > > > >     -
> > > > >     -   pixel blend mode:
> > > > >     -   Pixel blend mode is set up with drm_plane_create_blend_mo=
de_property(). =20
> > > >
> > > > Hi,
> > > >
> > > > this seems to contradict what the docs say in another place: =20
> > >
> > > Except this comment is about drm_plane_state.zpos, an internal DRM
> > > property. This is not about the zpos property itself. =20
> >
> > Hi,
> >
> > then I'm very confused. What's the difference?
> >
> > The text you are changing was specifically added to explain uAPI
> > behaviour, that is, what the userspace sees and does with the zpos
> > property in uAPI.
> >
> > Having two conflicting pieces of documentation is confusing, especially
> > when it is not absolutely clear which one is for driver implementors
> > and which one for uAPI consumers, or that one must ignore the other doc
> > depending on who you are. =20
>=20
> Yes, I agree that this is confusing.
>=20
> To be completely honest, I don't really care what the outcome of this
> discussion is, as long as there are no conflicting documentation comments.

Hi,

that is exactly what I want too.

> So, my interpretation of the docs is that there are:
>=20
> 1. Some documentation for KMS properties, that is, what is exposed to
>    user-space via DRM ioctls. This is the KMS uAPI.
> 2. Some documentation for kernel drivers, that is, internal DRM state tha=
t can
>    be set by kernel developers. This includes helper functions and common
>    structs.
>=20
> Obviously as user-space developers we only care about (1).

Theoretically yes, but the problem is that one cannot make that
distinction. I'm pretty sure both categories of comments are not
complete, and answers to some questions in one must be dug up from the
other, if documented at all.

So you cannot use wording that looks conflicting between the two. If
the wording is correct nevertheless, it needs more explaining on how it
doesn't actually conflict, so that people randomly reading just one
side or the other don't get the wrong idea.

> Now, back to zpos' case: there are two doc comments about zpos.
>=20
> The first one is [1], the one this patch changes:
>=20
> > zpos:
> > Z position is set up with drm_plane_create_zpos_immutable_property() and
> > drm_plane_create_zpos_property(). It controls the visibility of overlap=
ping
> > planes. Without this property the primary plane is always below the cur=
sor
> > plane, and ordering between all other planes is undefined. The positive=
 Z
> > axis points towards the user, i.e. planes with lower Z position values =
are
> > underneath planes with higher Z position values. Note that the Z positi=
on
> > value can also be immutable, to inform userspace about the hard-coded
> > stacking of overlay planes, see drm_plane_create_zpos_immutable_propert=
y(). =20
>=20
> This is in the "Plane Composition Properties". I believe this paragraph
> documents the standard plane properties (standard as in not driver-specif=
ic).
> So I'd say this documents the KMS uAPI.
>=20
> The second one is [2], the one you've quoted:
>=20
> > zpos
> >
> > Priority of the given plane on crtc (optional).
> >
> > Note that multiple active planes on the same crtc can have an identical=
 zpos
> > value. The rule to solving the conflict is to compare the plane object =
IDs;
> > the plane with a higher ID must be stacked on top of a plane with a low=
er ID.
> >
> > See drm_plane_create_zpos_property() and
> > drm_plane_create_zpos_immutable_property() for more details. =20
>=20
> This is in the "Plane Functions Reference" section, more precisely in the
> "struct drm_plane_state" docs. I believe this is really just about the co=
mmon
> DRM struct that can be used by all drivers. This struct isn't exposed to
> user-space. It's just an implementation detail of DRM.
>=20
> (We can see that even without this patch, these two comments already
> kind of conflict. The first one says that without zpos ordering is
> undefined. The second one says that two identical zpos values means the
> plane ID should be used. However drm_plane_state is zero-filled, so a
> driver not supporting zpos would have all drm_plane_state.zpos fields
> set to zero? Since they are all equal, is the object ID ordering rule
> relevant?)

Right, and we are suffering from that confusion already. Should
userspace use ID order if zpos property is not there or not? I have no
idea.

> [1]: https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-com=
position-properties
> [2]: https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-fun=
ctions-reference


Thanks,
pq

--Sig_/gAccgzkUdV8ahqR7MZ29=pJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2DK8wACgkQI1/ltBGq
qqd+Jw/8CdOmJbn7rKRrk/BUuevENZs5+tbI4f1sxMeLpHIq6eiU1usXz9e1FKr6
jP5Ly+VTMgNe0GSHMCsyFn3/WazatfrSyCx1R+az49gK8i7YznJQoDFLPtHqGP30
hOFhT9YUuHCcbjgR8RRhhiFaNWO8Bg7nIYrXeDS7WcIlR9PU/BAaFaNofL0ZNoHW
rSeeMB1i8A0VSQE3oEqB9Xzpcx3R0RDYq1UCsX9bqUT4ENvQUutdfiQgpUxBMyuv
V2yh9eZwDaeLPUDmaS6FlL0EoHbK3kq69UCrfjIggguIfLFKPsQaxSDBXfMoFmML
02ftQDHVs25tCtB+c21ywOI8Kp24qtBdHIGPjSSLIW+9k7VOGxJhN17hQFfWTSGp
iWMB5lT8sy3beff3/yLq4BODe3RtdPskrBoCg3crGhaUGxJZIrNvDTgQtltqToA4
5eZw9BwmNy/y7Xi0cPvnU9UKmT2VBRQBHKR27chvuK3h/FTb12mOyIBmoIpEaHAE
44v05MEEAYbfaQ9N207o6yWtOpER6Vi4ReZ3lOeNJLOnzuxf1mEO5lCNGkESOWR+
cr56jisrmTeQQkeiDVjPIv2JqUbEjUW+dCp92DCUX8ZHka5DIAktpvxCieyr2FHN
fmrdcDj2CSvMyhhajtHyt6ui7A5JdmJXK2y/fMbaB5LY2SRZMR0=
=LjEs
-----END PGP SIGNATURE-----

--Sig_/gAccgzkUdV8ahqR7MZ29=pJ--

--===============1759174689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1759174689==--
