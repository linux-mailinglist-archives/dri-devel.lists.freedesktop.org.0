Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A717DB32
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22F89F85;
	Mon,  9 Mar 2020 08:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1964489F85
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 08:38:36 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s1so6956210lfd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=p+mK4ApxlT/152DBHxDDvsReymBQ1pcxclh/oE9z0Q4=;
 b=PxFV2vD6nFBkjzU4jqrmos8TgrAztacNaEib67Hbk4pmJy7leku9ml3C8XRDGS01G+
 Ym6ssekqrd7kybzUai3FFeo7GC1Irjoe0UsCjFD1dlfth0L5Sa96ZG5RozPHsjofvJqM
 MY09k5gzuklQ1A/YMYRSvjq4yXWUcVD+nbHr4xpAiT7lSggUpPbmm+z8NAD0Fa+8EMCA
 3Q/IVe9nXlMkYOzPYMpbhj9CnZZBDjNPIyP2rwohsPN+n3njY8zAPbf8w/1GwipLlJc1
 N2/HUrxx+pR+djmKE1lx3gPx1wNrsIqzZkj6CCGd5fNfxwFYLE3rm+Y/HlM+ksTse3K0
 I1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=p+mK4ApxlT/152DBHxDDvsReymBQ1pcxclh/oE9z0Q4=;
 b=jmYc24A4Agj2NPwLGHf1RCtefW5bRbfYUpvys/OGwXK3MSWw3iefje3QTBSG7HwSzC
 psiUu1jhWLnZhpuirFv4ADhPg5G7/eZUZYtJh9SOIeUcQ4saH3+h6ig3iUcxhCsEPC/t
 5z/g069zt/mBwUBgaj3ehSMtJMNK7ymqwJbtYoT1mEEawTXsM2UdJGUUxiqKCGMIYUqD
 UW2pALVq3wPQ0zmS5oRMt008Ci4lnH54ConMvz3n1W6NYPCDQgSiBxwNuilTt5xocKWP
 GscB3mdQemiQ0dCE6Talg7y5zIz8Jmq9uL/UAoQ9XbyF7xpZieYsRxc7fkzN3atmZykO
 vIQA==
X-Gm-Message-State: ANhLgQ3T/HOeNH7m369uhsT7BBgoDAo1N+Sv35edaTkbXe/gQ0d9x5vG
 AjzRxVCS1C9Cpit6QKn8lQU=
X-Google-Smtp-Source: ADFU+vsjBtaE4iG7o5ntQqKh9ikK7wiQ4KWwWGSYIAksRdXe7HU42O0gydhHM9W8xjMqrhDhEvm3+w==
X-Received: by 2002:a19:7907:: with SMTP id u7mr2823554lfc.18.1583743114070;
 Mon, 09 Mar 2020 01:38:34 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y9sm12927019ljm.49.2020.03.09.01.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:38:33 -0700 (PDT)
Date: Mon, 9 Mar 2020 10:38:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
Message-ID: <20200309103824.7d106671@eldfell.localdomain>
In-Reply-To: <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <20200306160012.42274b9a@eldfell.localdomain>
 <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0576863908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0576863908==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zrxu_okADlMfN9edJcn5Fc5"; protocol="application/pgp-signature"

--Sig_/zrxu_okADlMfN9edJcn5Fc5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2020 18:51:22 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> On Fri, 6 Mar 2020 at 14:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Wed, 19 Feb 2020 13:27:28 +0000
> > Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > =20
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > > =20
> >
> > ...
> > =20
> > > +/*
> > > + * In the olden days the SET/DROP_MASTER ioctls used to return EACCE=
S when
> > > + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applica=
tions
> > > + * from becoming master and/or failing to release it.
> > > + *
> > > + * At the same time, the first client (for a given VT) is _always_ m=
aster.
> > > + * Thus in order for the ioctls to succeed, one had to _explicitly_ =
run the
> > > + * application as root or flip the setuid bit.
> > > + *
> > > + * If the CAP_SYS_ADMIN was missing, no other client could become ma=
ster...
> > > + * EVER :-( Leading to a) the graphics session dying badly or b) a c=
ompletely
> > > + * locked session.
> > > + * =20
> >
> > Hi,
> >
> > sorry I had to trim this email harshly, but Google did not want to
> > deliver it otherwise.
> >
> > I agree that being able to drop master without CAP_SYS_ADMIN sounds
> > like a good thing.
> > =20
> > > + *
> > > + * As some point systemd-logind was introduced to orchestrate and de=
legate
> > > + * master as applicable. It does so by opening the fd and passing it=
 to users
> > > + * while in itself logind a) does the set/drop master per users' req=
uest and
> > > + * b)  * implicitly drops master on VT switch.
> > > + *
> > > + * Even though logind looks like the future, there are a few issues:
> > > + *  - using it is not possible on some platforms
> > > + *  - applications may not be updated to use it,
> > > + *  - any client which fails to drop master* can DoS the application=
 using
> > > + * logind, to a varying degree.
> > > + *
> > > + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MAS=
TER.
> > > + *
> > > + *
> > > + * Here we implement the next best thing:
> > > + *  - ensure the logind style of fd passing works unchanged, and
> > > + *  - allow a client to drop/set master, iff it is/was master at a g=
iven point
> > > + * in time. =20
> >
> > I understand the drop master part, because it is needed to get rid of
> > apps that accidentally gain DRM master because they were the first one
> > to open the DRM device (on a particular VT?). It could happen e.g. if a
> > Wayland client is inspecting DRM devices to figure what it wants to
> > lease while the user has VT-switched to a text-mode VT, I guess. E.g.
> > starting a Wayland VR compositor from a VT for whatever reason.
> >
> > The set master without CAP_SYS_ADMIN part I don't understand.
> > =20
> As you point out application can drop master for various reasons. One
> of which may be to say spawn another program which requires master for
> _non_ modeset reasons. For example:
>  - amdgpu: create a renderer and use the context/process priority overrid=
e IOCTL
>  - vmwgfx: stream claim/unref (amongst others).

Hi,

if none of that is about KMS resources specifically, then to me it
seems like a mis-design that should be avoided if still possible. DRM
master is all about modeset, and in my option should be about nothing
else.

Are those needed to keep existing userspace working?


> Another case to consider is classic X or Wayland compositor. With
> CAP_SYS_ADMIN for DROP_MASTER removed, yet retained in SET_MASTER, the
> IOCTL will fail. Thus:
>  - weston results in frozen session and session switching (have to
> force kill weston or sudo loginctl kill-session)
>  - depending on the driver, X will work or crash
>=20
> To make this clearer I'll include //comment sections in the code.
>=20
> // comment
> To ensure the application can reclaim its master status, the tweaked
> CAP_SYS_ADMIN handling is needed for both IOCTLs. Otherwise X or
> Wayland compositors may freeze or crash as SET_MASTER fails.
> // comment

A Wayland compositor or Xorg that got DRM master by first-opener up to
now has not been able to drop DRM master, which means VT switching away
does not work - does it? If drop-master succeeded, then VT-switch back
doesn't work, which in my opinion is VT-switching failing again just in
a different way.

OTOH, if applications exist that rely on drop-master failing in this
specific case, making drop-master succeed would break them. That might
include a buggy set-master path that was written, but does not actually
work because it was never tested since drop-master never worked.

So I do not fully buy this argument yet, but I also cannot name any
explicit examples that would break.


> > > + *
> > > + * As a result this fixes, the following when using root-less build =
w/o logind =20
> >
> > Why is non-root without any logind-equivalent a use case that should
> > work?
> > =20
> // comment
> Some platforms don't have equivalent (Android, CrOS, some BSDs), yet
> root is required _solely_ for DROP/SET MASTER. So tweaking the
> requirement sounds perfectly reasonable.
> // comment

For those that use a Linux kernel, I disagree. For those that do not
use a Linux kernel, how is this relevant?


> > Why did DRM set/drop master use to require CAP_SYS_ADMIN in the first
> > place?
> > =20
> I imagine something else could have been introduced instead. Although
> I cannot find any details or discussion on the topic.
>=20
> > What else happens if we allow DRM set master more than just for
> > CAP_SYS_ADMIN?
> > =20
> If we're talking about removing CAP_SYS_ADMIN all together:
>  - screen scraping by any random application
>  - dead trivial way to DoS your compositor

No, I am asking about your specific proposal here. This is the question
about which neither of us can see more than we already wrote, so it
needs someone else to think hard.


> > Does this interact with DRM leasing?
> >
> > Looks like drmIsMaster() should be unaffected at least:
> > https://patchwork.kernel.org/patch/10776525/
> > =20
> Correct, both are unaffected. All the leasing IOCTLs happen by the
> active true (aka non-lease) master.

Do you assume that DRM leasing clients (lessee) will not or cannot call
set-master/drop-master ioctls?

What happens if they do call set/drop master ioctls on a leased DRM file
description?

After all, the leased DRM file description must be good for modeset
operations that normally need the real DRM master.


> > > + * - startx - some drivers work fine regardless
> > > + * - weston
> > > + * - various compositors based on wlroots
> > > + */
> > > +static int
> > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_=
priv)
> > > +{
> > > +     if (file_priv->pid =3D=3D task_pid(current) && file_priv->was_m=
aster)
> > > +             return 0; =20
> >
> > In case a helper e.g. logind opens the device, is file_priv->pid then
> > referring to logind regardless of what happens afterwards?
> > =20
> Correct.
>=20
> > > +
> > > +     if (!capable(CAP_SYS_ADMIN))
> > > +             return -EACCES;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> > >                       struct drm_file *file_priv)
> > >  {
> > >       int ret =3D 0;
> > >
> > >       mutex_lock(&dev->master_mutex);
> > > +
> > > +     ret =3D drm_master_check_perm(dev, file_priv);
> > > +     if (ret)
> > > +             goto out_unlock;
> > > +
> > >       if (drm_is_current_master(file_priv))
> > >               goto out_unlock;
> > >
> > > @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev,=
 void *data,
> > >       int ret =3D -EINVAL;
> > >
> > >       mutex_lock(&dev->master_mutex);
> > > +
> > > +     ret =3D drm_master_check_perm(dev, file_priv); =20
> >
> > Why does drop-master need any kind of permission check? Why could it
> > not be free for all?
> > =20
> Consider the arbitrator usecase - be that logind, Xorg (in ancient
> times) or otherwise.
>=20
> // comment
> DROP_MASTER cannot be free for all, as any (say logind) user can:
>  - can DoS/crash the arbitrator

How would this happen?


>  - open the node, become master implicitly and cause issues

How would this follow? Is this not already the case and also remain the
case even with your changes?


Thanks,
pq

> // comment
>=20
> I've added an IGT subtest to ensure this does not happen.
>=20
> Let me know if I should include anything more to the commit, than the
> above comment sections.
>=20
> Thanks
>=20
> -Emil


--Sig_/zrxu_okADlMfN9edJcn5Fc5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5mAIEACgkQI1/ltBGq
qqei2w//Z8Jo4IttGARNI16RO/18FoYl5yWd/hRPHHyFl9X6/ZffrIN5x88FzP6O
eIs61+vPvJ9EtzCbC2dVFm1gaNKoSNCOonQiL18clXxvmKHt+G4JsBnIrm5pEYo2
1fmkaNo2NFIP24sCPrHiSFXUoUpoyHr1WOridvHWqecoR1sHe5B/GrKuLm+Pcio0
4DpZqTnDJcceO94ekJ9CqhOV8dMyU9L486gsIwG1DVtD0JknDluo8J5lNTDCwVqb
svFsRAKKukVTvVDAzAsdu7zuMSy3F82bvSLJXxUuCF0TX5QnpTWFqepHwEP7Bzr5
Y6ZGfGfIstx080Qs+QrAQerWrcMoNKafVUllT6p8L4UrKlnLyC/JsBMlUf4A5uNw
+DlH5HVrlbP9zUJTATmslQxnsYNuIWaYkeKbwafcMuieQO3jIjYnxJHHFfBQE3W8
Hzv/4vdVxri+VW9K6IpIW6o7M7uyCBmh2/pKX5SpocZHUSaO+CyJPdCK190Ee1xc
N3JA/e4eyB5mmY4Yvb4Ii5k2GDaZG/Wj5IjNh+/YxvB+1D8ywVzssSYY9pdQ0ThV
w5YYvqS3WHBB6ZrEXLB2+q6oUOJYhxMsRmTwJLpwZX0ZLzRjgH+dbpK+2ojm9okz
j7oCmtGK7TXAe3LSxZ5Rbn0hC+TdK/Ts4Q3z1/NIY7TbPYmiljo=
=q16i
-----END PGP SIGNATURE-----

--Sig_/zrxu_okADlMfN9edJcn5Fc5--

--===============0576863908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0576863908==--
