Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDB158B03
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3889F19;
	Tue, 11 Feb 2020 08:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780A789F19
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:06:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v17so10475867ljg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=WkZY1nEkHI5hrTSxuy0NQwTF53PmWe0fVC3cwv6RRww=;
 b=hyarMOlmeYW3kR4uN4KM2cG+CIrzjBIsOfe8z7yNNqQbdbO0ozeuFsW4b/L8A+FKWd
 GsyWpjl1kpFEhXVQ8YCWCXSI+9U1c7UeQ3TrAyi2LmxRnYnYTZNOBrMo4Nn+LX3scS3E
 gdLdy4UdNZS4pKZQfN9fLl26X8RHEnZZJ09ZVPT2WpLBUhs5/VMryRjOOoTELDKzf6Ta
 iT59w2DaatTTCXINs0JvXRm3k3hVTmgbzRz3IKtE+h2DXNCUEtnwwvGG0cGsz5BP6v56
 /B5VIkgfoixX+wz8yqmoscEgMF83je8QVD6s9+Rj+bBhfeaUIdxCLJWx10MueftFFX8S
 Ti7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=WkZY1nEkHI5hrTSxuy0NQwTF53PmWe0fVC3cwv6RRww=;
 b=f7FW5zPClO9zHlE+N7GTaxkI1S5mWJQrNgaPXNIq83SNyX7tdnY+1/vVkNbkjALETl
 kfaxKS20lPZyfmYvNS6IXJJ050hUeSNOUNjrGNCZ21sJMUb3/q8QolWW7fmAMZj7lbpO
 YZ4/NtMlcuWQEUBEjLDJ/z2NlUREL79QhOhrJ4FXlSe1pNeR9oTJNiO29BzC5kurMus+
 igZac4KDc7VkKhwIVDjKPv9BklhvaamVU2woYhgcjSWCK9S+o0a5SHc3OpZ9FG+x5kQD
 9kryfEYD7VWXHwHksokUZBwpyl9HrkjEduMXKVjtE24PNoFyIM2sMPYEwSVMBzG2OqkR
 Q6OQ==
X-Gm-Message-State: APjAAAVhBQJgzy0gkF3QYwfKZXyZgSK+80Ou0nZG9/232BeZ2vYBGoxV
 Q1hJhm9Ow0HDe9gZIDIw0MU=
X-Google-Smtp-Source: APXvYqz6MBuWKX8tOj9jcgZCEcfzIq8Ju23MrHV0+KviEgqePDpF95F5N2YWsknXnp4gZ339wUZ5hg==
X-Received: by 2002:a2e:9b52:: with SMTP id o18mr3409915ljj.270.1581408417849; 
 Tue, 11 Feb 2020 00:06:57 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j7sm1643326ljg.25.2020.02.11.00.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:06:57 -0800 (PST)
Date: Tue, 11 Feb 2020 10:06:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
Message-ID: <20200211100648.5d876d43@eldfell.localdomain>
In-Reply-To: <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
References: <20200205174839.374658-1-emil.l.velikov@gmail.com>
 <20200207132942.GY43062@phenom.ffwll.local>
 <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0464714695=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0464714695==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q0tY4z3VLfRpyAG4eu3uaJL"; protocol="application/pgp-signature"

--Sig_/q0tY4z3VLfRpyAG4eu3uaJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Feb 2020 19:01:06 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> Thanks for having a look Daniel.
>=20
> On Fri, 7 Feb 2020 at 13:29, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Feb 05, 2020 at 05:48:39PM +0000, Emil Velikov wrote: =20
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > This commit reworks the permission handling of the two ioctls. In
> > > particular it enforced the CAP_SYS_ADMIN check only, if:
> > >  - we're issuing the ioctl from process other than the one which open=
ed
> > > the node, and
> > >  - we are, or were master in the past
> > >
> > > This allows for any application which cannot rely on systemd-logind
> > > being present (for whichever reason), to drop it's master capabilities
> > > (and regain them at later point) w/o being ran as root.
> > >
> > > See the comment above drm_master_check_perm() for more details.
> > >
> > > Cc: Adam Jackson <ajax@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > ---
> > > This effectively supersedes an earlier patch [1] incorporating ajax's
> > > feedback (from IRC ages ago).
> > >
> > > [1] https://patchwork.freedesktop.org/patch/268977/
> > > ---
> > >  drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> > >  include/drm/drm_file.h      | 11 +++++++
> > >  3 files changed, 72 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index cc9acd986c68..01d9e35c0106 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c

> > > +static int
> > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_=
priv)
> > > +{
> > > +     if (file_priv->pid !=3D task_pid(current) && file_priv->was_mas=
ter) =20
> >
> > Isn't this a typo? Why should we only allow this if the opener is someo=
ne
> > else ... that looks like the logind approach? Or is my bolean logic par=
ser
> > broken again.
> > =20
> Thanks for spotting it. Indeed that should be:
>=20
> if (file_priv->pid =3D=3D task_pid(current) && file_priv->was_master)
>     return 0;

Hi,

I'm mostly just curious, why is comparing pids safe here? Maybe the
'pid' member is not what userspace calls PID?

What if a malicious process receives a DRM fd from something similar to
logind, then the logind equivalent process dies, and the malicious
process starts forking new processes attempting to hit the same pid the
logind equivalent had, succeeds in that, and passes the DRM fd to that
fork. Is the fork then effectively in control of DRM master?


Thanks,
pq

--Sig_/q0tY4z3VLfRpyAG4eu3uaJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5CYJgACgkQI1/ltBGq
qqeCbg//WJG3vPhaDvc4yXEPalIJxJVON1jcSPy+3o0M3QNaBMmkk5hakRAD2MTN
SJ+c/JD+9d8H6zgYBmKPATKV2Gmbw/Du66pVz8eS35fjeE4DAWm1jOhqiMW+xtaU
otUM4fmxqx8oGwO2ZRThR6QpHNACfpKQ/vvdbOQhK5DsMT7unrGKgKkh9dzUcScN
AmiJPvhdOphqYOX6fjIoPgambGnLFhokec4oSDYntPhPYv8C09spzcPl5WQRUMMe
JnGWaa/NzHkQ8uUOEyyeJN6HJfRK7razWUKrGOUDaO8n8jH76dkIsEBlwstJk7BT
hjx5w+owcznd17c7js77DiLuIIUM3vMKU5JTP+YT7nFxM39sGTIjaPpoxXAi1qGl
wKfHd9oOGf7IGoMNxH+77m4pZkB3uKxzeVOYoWKrJbfxQp5gakst1UlzZBU2zNe6
8HJO6wjEy35hrDhbkIniNEgZWQrIVlZotEkIXbeJ1sq0t8kFArMiQW2QD1ilbyhd
FaKlIrhQPZdpzEYnf5/2Ac/mNAhixcT58Acay8QIDFFYu77vZC0s386swkm8BwuZ
ts9FXggmd+jyGHA8ya86+Itq9kB2E8gbu4JyBB1iDxRrWBWzei+PpZ4IOO6LQ6MW
H661s5wiq7JN8bWrKWS/cHIJ9hApwPR2Y7SHS1SQBlzYxNi7/yM=
=2hgB
-----END PGP SIGNATURE-----

--Sig_/q0tY4z3VLfRpyAG4eu3uaJL--

--===============0464714695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0464714695==--
