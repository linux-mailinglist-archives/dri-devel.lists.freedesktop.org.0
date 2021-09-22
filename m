Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38841444C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B66EB1C;
	Wed, 22 Sep 2021 08:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B7F6EB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:57:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u18so8883154lfd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=vUIAufvwf8vnKMUzVhZlMQtaB4ti2FNoAcroWNJx8OI=;
 b=WbIA91fzA7t5T8qOKT5ihIm0EsKqb55fbxurO/R+JibqBeoxzjSIPgUPt6hzHkjZVW
 mtDr2YP+gGRLQIR3k5ENSp3iEGB+qW/MCd/wGJ92TaLeyBp5kkJJdhJ6LsKDjBmtzINO
 gAreVa+er0Gx/C66LFsWDKBnn0JGJEtFbGmK94Jl5Lzk2F5uqlRfsK+uDb2pekGJpoMx
 6WjHGJhLYvhc12J/rNUsfGCDhX1Xguvn4TMVhjAt0Z1e1olN5bzv9bDXRHQVWr0r76RW
 4KIdF9hbkft/KnHfdmDZd6p1yFS0HiI+2/ekiQlL07X391gBUaCnZDOYIJpIyWDnje6x
 fSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=vUIAufvwf8vnKMUzVhZlMQtaB4ti2FNoAcroWNJx8OI=;
 b=Fh8+gbdp3ydx9x047nMWWQR/PZ8N4EgzcpWrSbuFi3vgIwfc5VLkk43CKS+YBBCrsW
 YGQmBm+1fpoXtJH+m9ewKQDbGdVuUP1OWEUyMDumfINrz0W1sNP1pNlAO6X8kFyPiJoy
 UxCCDXuoNmvy7p4sBPuvNPHR2dhZgx5VBw50n46BHSJZxtnzWhh6P3NNKjYyDy2A/S/8
 RpnjLxW2hMMPLac6gLDSeKI8EKPb4qX8b10BzqbM1hdLjWyQENN10+FFMqSwIWoOF5K0
 4puPtpjSBoJeunPsx/24xbqMaM4kZjpN5N09FcGOcAAqJAeO3j0bEaeTBKqb6vOAiYI0
 7yrA==
X-Gm-Message-State: AOAM533ZHa66WfrBB1QH7gTg4C1zHHdOZfMZECJdESjVUhy8CM1wGZi9
 bjCb5qKRGhxxJjnEimTR41o=
X-Google-Smtp-Source: ABdhPJwe3lBTvxDto3q0i+mNS0BTdBI5AnNLf6qoBpqKuXaEqcHZB7maSikEJgR6ERJbNbneqcIauQ==
X-Received: by 2002:a05:651c:178e:: with SMTP id
 bn14mr34507290ljb.521.1632301020829; 
 Wed, 22 Sep 2021 01:57:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t135sm124575lff.203.2021.09.22.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:57:00 -0700 (PDT)
Date: Wed, 22 Sep 2021 11:56:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210922115657.17006ed1@eldfell>
In-Reply-To: <YUCncex3woPlAhI6@phenom.ffwll.local>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell>
 <YUCncex3woPlAhI6@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k/JCw6EaEv3Dn7TTiZkajlB";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/k/JCw6EaEv3Dn7TTiZkajlB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Sep 2021 15:45:21 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote:
> > On Wed, 8 Sep 2021 18:27:09 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> w=
rote: =20
> > > >
> > > > On Tue, 7 Sep 2021 14:42:56 +0200
> > > > Hans de Goede <hdegoede@redhat.com> wrote:
> > > >   =20
> > > > > Hi,
> > > > >
> > > > > On 9/7/21 12:07 PM, Pekka Paalanen wrote:   =20
> > > > > > On Fri, 3 Sep 2021 21:08:21 +0200
> > > > > > Dennis Filder <d.filder@web.de> wrote:
> > > > > >   =20
> > > > > >> Hans de Goede asked me to take a topic from a private discussi=
on here.
> > > > > >> I must also preface that I'm not a graphics person and my know=
ledge of
> > > > > >> DRI/DRM is cursory at best.
> > > > > >>
> > > > > >> I initiated the conversation with de Goede after learning that=
 the X
> > > > > >> server now supports being started with an open DRM file descri=
ptor
> > > > > >> (this was added for Keith Packard's xlease project).  I wonder=
ed if
> > > > > >> that could be used to smoothen the Plymouth->X transition some=
how and
> > > > > >> asked de Goede if there were any such plans.  He denied, but m=
entioned
> > > > > >> that a new ioctl is in the works to prevent the kernel from wi=
ping the
> > > > > >> contents of a frame buffer after a device is closed, and that =
this
> > > > > >> would help to keep transitions smooth.   =20
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I believe the kernel is not wiping anything on device close. If
> > > > > > something in the KMS state is wiped, it originates in userspace:
> > > > > >
> > > > > > - Plymouth doing something (e.g. RmFB on an in-use FB will turn=
 the
> > > > > >   output off, you need to be careful to "leak" your FB if you w=
ant a
> > > > > >   smooth hand-over)   =20
> > > > >
> > > > > The "kernel is not wiping anything on device close" is not true,
> > > > > when closing /dev/dri/card# any remaining FBs from the app closing
> > > > > it will be dealt with as if they were RmFB-ed, causing the screen
> > > > > to show what I call "the fallback fb", at least with the i915 dri=
ver.   =20
> > > >
> > > > No, that's not what should happen AFAIK.
> > > >
> > > > True, all FBs that are not referenced by active CRTCs or planes will
> > > > get freed, since their refcount drops to zero, but those CRTCs and
> > > > planes that are active will remain active and therefore keep their
> > > > reference to the respective FBs and so the FBs remain until replace=
d or
> > > > turned off explicitly (by e.g. fbcon if you switch to that rather t=
han
> > > > another userspace KMS client). I believe that is the whole reason w=
hy
> > > > e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS cl=
ient
> > > > would not have anything to scrape.
> > > >
> > > > danvet, what is the DRM core intention?   =20
> > >=20
> > > Historical accidents mostly. There's two things that foil easy
> > > handover to the next compositor:
> > > - RMFB instead of CLOSEFB semantics, especially when closing the
> > > drmfd. This is uapi, so anything we change needs to be opt-in =20
> >=20
> > What does this mean and refer to?
> >=20
> > Are you trying to say, that closing the DRM device fd (freeing the file
> > description) causes an implicit RmFB on all the FBs tied to that DRM
> > device file description?
> >=20
> > I never realised that before. =20
>=20
> Yes, final close does iterate over fb and do an RMFB. Which is why we've
> had this discussion whether closefb semantics should be an ADDFB2 flag at
> creation time instead.

Hi Daniel,

such flag would make sense to me.

> > > - Forced fbdev restore on final close of all drm fd. This is only
> > > prevented if there's a drm master left around (systemd-logind can keep
> > > that instead of forcing the compositor to survive until the other has
> > > taken over, which it needs to do anyway to prevent the drm master
> > > handover from going sideways). This can be fixed by simply disabling
> > > fbdev completely, which you really want to do anyway. Again it's uabi,
> > > people will complain if we break this I think. =20
> >=20
> > Do you mean that it is not enough to leave the tty in KD_GRAPHICS mode
> > to stop fbcon/fbdev from taking over? =20
>=20
> Nope. You need an open drm master.
>=20
> This is because we do actually support /dev/fb clients rendering in
> KD_GRAPHICS mode for backwards compat with the fbdev subsystem.
>=20
> > Is it really fbdev on its own rather than fbcon (poking at fbdev) that
> > will change the KMS state?
> >=20
> > That is, it's not enough to disable fbcon? =20
>=20
> fbcon doesn't disable fbdev, and the only way to block fbdev is to have a
> drm master around.

Thanks for pointing this out.

> I guess we could try and make this smarter by creating some kind of weak
> master status for fbdev, but only when either fbcon or fbdev is opened.
> Maybe this would help?

It would make sense to me if we wanted a bandaid, but do we? I don't
know.

> fbdev already keep track of this open count, so wouldn't be too onerous to
> wire that up into drm_client.
>=20
> The problem there is then that not yet all drivers use the drm_client
> stuff for fbdev emulation, so you'd need to either convert more, or hack
> up a few more things to make this consistent.
>=20
> > > > Or am I confused because display servers do not tend to close the D=
RM
> > > > device fd on switch-out but Plymouth does (too early)?   =20
> > >=20
> > > Yeah, that stops both forced restore/disable from kicking in. =20
> >=20
> > Which "that"? =20
>=20
> that =3D open drm master. Open drm master alwasy wins agains fbdev/fbcon,
> and with latest patches it's guaranteed to be race free.
>=20
> > > > If so, why can't Plymouth keep the device open longer and quit only
> > > > when the hand-off is complete? Not quitting too early would be a
> > > > prerequisite for any explicit hand-off protocol as well.   =20
> > >=20
> > > With closefb semantics and fbdev disabled plymouth could quit early,
> > > and things still work. =20
> >=20
> > What is "closefb semantics"? =20
>=20
> closefb semantics =3D no forced plane/crtc disable, active plane keeps a
> drm_fb reference
>=20
> rmfb semantics =3D forced plane/crtc disable, the drm_fb is guaranteed to=
 be
> forcefully removed from the system

Very good.


Thanks,
pq

--Sig_/k/JCw6EaEv3Dn7TTiZkajlB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFK79kACgkQI1/ltBGq
qqcg8w/9ETYCHfYlGPd56Z7vIT1/r40uUR/fZEi9jKeFh039+LYxhds3S5gqJjCk
f+sDrcId/ipkAYWhaTt91bKOBmtFPaN6D/zJpORwY27b5n32QaXhJ2zRE8SVyoqu
ozvGqc/YSTdWQ1CnwQRD73WFrNzp7otCXBR1ShIO+428r2xj0s6Au+MtNJRyYj5U
Lzm4u55xSBET1K15lmCQeoLutxjn2WlnhmdSymESf05OcLPGya4CoTnusPvSGKRL
85qE136LZ1gQb9g7oZ5EDosj+mUoPPkLK00S7lqQ87akVz1BNvimsQVewYk0Rdrj
w8jzaWZxGwQ8+78+eEnHr2LdAF9HAgIDzLlKLmVY8zS6A1zxb0+LMCUY95RqsjP7
RsnwagLkfJM34yiQ3EQUBDJn0JDTencRrcTGByAJnWXaN+Yepr7M3PwWr42e4VB4
ZVhfpH8lPvX9rY4dICzriUWlanJgZnoskMh1jCO3SDeUCMVN+ZBJq7DUDNHs+ZqK
oVa70skV4XczXUAeKRE5+2Ice56vbGFzZBCtVWG5gvJMTLVaLyvv8IaGeTSerZN8
FprPuRkPE0qVKXKenWm9kFyMaepddFJzVPqOlbGAajfrc2aY0GFZ8WJx5GZ+zCL+
Ehy0j0TLW8ZpoDV3Nlr9n21P/H5AwU30bGJxuVNmzfy0yIISVJY=
=5MKM
-----END PGP SIGNATURE-----

--Sig_/k/JCw6EaEv3Dn7TTiZkajlB--
