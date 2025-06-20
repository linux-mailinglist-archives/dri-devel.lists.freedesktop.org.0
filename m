Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC4AE181E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 11:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC1E10EB2E;
	Fri, 20 Jun 2025 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HoS/sXln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4610EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 09:48:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1370521f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750412883; x=1751017683;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yv3qJdLc6eiPUjiU7hglwuzXEOH35/Jx3j5Wzop4tAM=;
 b=HoS/sXlnoxZnKv3cTEKjewKzADgvNZ6fESgiMCdu9mHK3//SmZ4XFtyaX9YCKY/2N+
 O+9TIk0UVFcn5xPsBwYjyL6PWYYGaHJaS0CKBaLB4l/NwpKed1ebZYoOQyXiF/5BXtin
 6TP90t90UFzqw3X9OswiKtAySWhHuuzkCABXdm+KQHB9DvagePeY9+ZPUmCNur/xhMIi
 NbSH/phs3Sgj4WTwqUa5k5bxYDW73Ra9/N1mGuG19Ve7Sm2dLHcZDzhLRDSN6f5mgAVm
 glPXiGAlv/FPJQQdGB0KaP2FSqF36ooJQGvA/9CMnxP+NsslR45NrTStkA/XbJGsnm/K
 YXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750412883; x=1751017683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yv3qJdLc6eiPUjiU7hglwuzXEOH35/Jx3j5Wzop4tAM=;
 b=qqwy2y149CnDpfn3HSzA0mRm3ieCqyipsoliXrLb7wDpDuqpdnL4b4vOtP0Le1Poyg
 BB+VqUxsttlbGNuQYREgPRHmdU5t0kT2iMJgs3i7DzPXlGdxYVD5tIuf2BmRl2rn8tQ+
 fYhALlXvM5H0F7Jo31MyX+H6A5u6RxyjZfnoS6t5I5qJSySktSLc2RQX2Znbjvo1WMgK
 pwx5i6lfPlkevZ1gdD8qKsd5Tn94XNvdodUxAU3ja7Hh3US0v28c65qKSWZK6r1FaT6f
 H031nltqUXm5Sc1pgppgg0ybuVlWfJrfAC5lkLiWr9whO2cn2cIlsci4iH4rsjXsqO85
 1dww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR0mk8LvblRAvEXiy40cGYz3mYMFzaQ49XjyjOb/23CZeW+AtaKmLUT6wQlGbJ4KSRuoM0UbMH6H8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWrVMjpPUZ2Agi4hAvSaRazK0GV/l8IrP5mtlCWVm03r3BZ/NS
 2p+1QDe9ARmM37x/q8HF1SFIgVlA4YT251w6roInaHndKykNFILQs+PP25wBnZrOauc=
X-Gm-Gg: ASbGncsCgO9/NPWNzQKiHD9B92TZ0OtGAzqjacjQoQMEfAkzWpFvjE868AQM2guEcf9
 AHD88jED0c0gLA8FmyHwHi5MBThRTOQ3Lg6Y7M2dz6PjEtT//M1nsE6YS3JYwTmictXkkng8zK9
 Wo9GUdscJwLR196YL58j6csN5y0i3YXTS/nfN5Qa+IuOS6DBgYg3CJ3eU9R6QEp1VMk6WcMVBM8
 ExDxyflPO1Qj4Sc52JFpMcXEmvta1Lh4MGXFdNpFvG89mgP2Qnfc5hsmyyqWNXZMbWHwKS+yx+E
 F9yJzfZPEqFDAPSd0X70gAh6BFCPoHvo0QwemLmg76+V9Ts+5pwNWLZwJZFL08hZO4gpXIoutIF
 JIf5QswgY8SYNjonJCVZjtc9xJNZE
X-Google-Smtp-Source: AGHT+IEi/eQAc+jPAGUmY6NshIYofesxFiYoxjwNbPHfeOyMnse341s37kI5SpI1B28seCiCJSd7mw==
X-Received: by 2002:a05:6000:25ca:b0:3a3:6e85:a529 with SMTP id
 ffacd0b85a97d-3a6d1325e94mr1827752f8f.51.1750412883088; 
 Fri, 20 Jun 2025 02:48:03 -0700 (PDT)
Received: from localhost
 (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f13:c804::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453646dc66fsm19404005e9.18.2025.06.20.02.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 02:48:02 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:48:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexdeucher@gmail.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
Message-ID: <kegij3u3ehv7b6kapbxfqnfhvqpzzhoaemhfiedjkqmnv2ejx5@y6pwl35l7wns>
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
 <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
 <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
 <2025060410-skinning-unguided-a3de@gregkh>
 <od2jpxazsa6ee6fqom7owcgh53lz3wjjjk4scoe2mxjzrytl7f@jwwwxfuo4pkj>
 <CADnq5_OdFQhokdysSHdeBca=UViCcqKWmfbedMAadWFWBiNE=Q@mail.gmail.com>
 <ziq6dniodo5zgnf427btbyafaxdx3kt6rym2gupuiymvpwnmcy@fh76ssxyirmw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ptu5vnlv7n7jd633"
Content-Disposition: inline
In-Reply-To: <ziq6dniodo5zgnf427btbyafaxdx3kt6rym2gupuiymvpwnmcy@fh76ssxyirmw>
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


--ptu5vnlv7n7jd633
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
MIME-Version: 1.0

Hello,

On Thu, Jun 05, 2025 at 07:44:19AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Jun 04, 2025 at 11:09:15AM -0400, Alex Deucher wrote:
> > On Wed, Jun 4, 2025 at 10:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > Hello Alex,
> > >
> > > On Wed, Jun 04, 2025 at 03:29:58PM +0200, Greg KH wrote:
> > > > On Wed, Jun 04, 2025 at 09:15:14AM -0400, Alex Deucher wrote:
> > > > > On Wed, Jun 4, 2025 at 5:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > > <u.kleine-koenig@baylibre.com> wrote:
> > > > > > On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> > > > > > > Already included in my -fixes PR for this week:
> > > > > > > https://lists.freedesktop.org/archives/amd-gfx/2025-May/12535=
0.html
> > > > > >
> > > > > > Note the way this was done isn't maximally friendly to our stab=
le
> > > > > > maintainers though.
> > > > > >
> > > > > > The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce=
02) is a
> > > > > > tad better than the patch that Aurabindo sent as it has:
> > > > > >
> > > > > >         This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5=
dfa0d ...
> > > > > >
> > > > > > which at least is a known commit and has Cc: stable.
> > > > > >
> > > > > > However this is still a bit confusing as commit cfb2d41831ee ha=
s no Cc:
> > > > > > stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: =
stable.
> > > > > >
> > > > > > So f1c6be3999d2 was backported to 6.14.7 (commit
> > > > > > 4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
> > > > > > 468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
> > > > > > c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be =
obvious
> > > > > > that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting=
 to trees
> > > > > > that don't contain cfb2d41831ee (or a backport of it).
> > > > > >
> > > > > > Please keep an eye on that change that it gets properly backpor=
ted.
> > >
> > > I'm not sure if my mail was already enough to ensure that
> > > 1b824eef269db44d068bbc0de74c94a8e8f9ce02 will be backported to stable,
> > > so that request still stands.
> > >
> > > > > DRM patches land in -next first since that is where the developers
> > > > > work and then bug fixes get cherry-picked to -fixes.  When a patc=
h is
> > > > > cherry-picked to -fixes, we use cherry-pick -x to keep the refere=
nce
> > > > > to the original commit and then add stable CC's as needed.  See t=
his
> > > > > thread for background:
> > > > > https://lore.kernel.org/dri-devel/871px5iwbx.fsf@intel.com/T/#t
> > >
> > > Yeah I thought so. The problem isn't per se that there are duplicates,
> > > but that they are not handled with the needed care. I don't know about
> > > Greg's tooling, but my confusion would have been greatly reduced if y=
ou
> > > reverted f1c6be3999d2 instead of cfb2d41831ee. That is the older comm=
it
> > > (with POV =3D mainline) and the one that has the relevant information=
 (Cc:
> > > stable and the link to cfb2d41831ee).
> >=20
> > The revert cc'd stable so it should go to stable.  You can check the
> > cherry-picked commits to see what patches they were cherry-picked from
> > to see if you need to apply them to stable kernels.
>=20
> Yes, and I'd expect that the scripts used by stable maintainers looking
> at 1b824eef269d will apply that to all stable branches that contain
> cfb2d41831ee or a backport of it.
> Given that that cfb2d41831ee wasn't backported to any stable kernel and
> the commit itself will only be in 6.16-rc1 the set of kernels to
> backport the revert to, will be the empty set.
>=20
> (In git commands:
>=20
> 	$ git log --oneline --source stable/linux-{5.{4,10,15},6.{6,12,14,15}}.y=
 ^1b824eef269db44d068bbc0de74c94a8e8f9ce02 --grep=3D"commit cfb2d41831ee564=
7a4ae0ea7c24971a92d5dfa0d upstream"
> 	<void>
> =09
> If however you look for cfb2d41831ee's twin, there is:
>=20
> 	$ git log --oneline --source stable/linux-{5.{4,10,15},6.{6,12,14,15}}.y=
 ^1b824eef269db44d068bbc0de74c94a8e8f9ce02 --grep=3D"commit f1c6be3999d2be2=
673a51a9be0caf9348e254e52 upstream"
> 	4ec308a4104b    stable/linux-6.14.y drm/amd/display: more liberal vmin/v=
max update for freesync
> 	468034a06a6e    stable/linux-6.12.y drm/amd/display: more liberal vmin/v=
max update for freesync
> 	c8a91debb020    stable/linux-6.6.y drm/amd/display: more liberal vmin/vm=
ax update for freesync

TL;DR; These backports are cared for, this thread can be considered
done.

Update to the situation:

The patch to be reverted wasn't added to further stable branches since
last time we looked:
=09
	$ git log --oneline --source stable/linux-{5.{4,10,15},6.{6,12,14,15}}.y ^=
1b824eef269db44d068bbc0de74c94a8e8f9ce02 --grep=3D"commit cfb2d41831ee5647a=
4ae0ea7c24971a92d5dfa0d upstream"
	$ git log --oneline --source stable/linux-{5.{4,10,15},6.{6,12,14,15}}.y ^=
1b824eef269db44d068bbc0de74c94a8e8f9ce02 --grep=3D"commit f1c6be3999d2be267=
3a51a9be0caf9348e254e52 upstream"
	4ec308a4104b    stable/linux-6.14.y drm/amd/display: more liberal vmin/vma=
x update for freesync
	468034a06a6e    stable/linux-6.12.y drm/amd/display: more liberal vmin/vma=
x update for freesync
	c8a91debb020    stable/linux-6.6.y drm/amd/display: more liberal vmin/vmax=
 update for freesync

So 6.6.y, 6.12.y and 6.14.y need a fix, as do all releases that contain
f1c6be3999d2be2673a51a9be0caf9348e254e52 or
cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d but not the revert
1b824eef269db44d068bbc0de74c94a8e8f9ce02. That would be v6.15.

The revert was backported to the following branches:

	$ git log --oneline --source stable/linux-6.{6,12,14,15}.y ^1b824eef269db4=
4d068bbc0de74c94a8e8f9ce02 --grep=3D"commit 1b824eef269db44d068bbc0de74c94a=
8e8f9ce02 upstream"
	e9019e2214fa    stable/linux-6.6.y Revert "drm/amd/display: more liberal v=
min/vmax update for freesync"
	c1c52720bb0f    stable/linux-6.15.y Revert "drm/amd/display: more liberal =
vmin/vmax update for freesync"
	dc86041f8d31    stable/linux-6.14.y Revert "drm/amd/display: more liberal =
vmin/vmax update for freesync"
	80fe1ebc1fbc    stable/linux-6.12.y Revert "drm/amd/display: more liberal =
vmin/vmax update for freesync"

So all four affected branches are fixed now.

So there is nothing further to be done (unless
cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d or it's twin gets backported to
older versions).

Best regards
Uwe

--ptu5vnlv7n7jd633
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhVLk4ACgkQj4D7WH0S
/k7Xowf/VND1yijnXCsxJV0FBbglFEg/vadFRssmykO8ApfU6rTwaHP8xI88dx09
lEJYbovG23EzQrwO+jA+TNSijefhHQfqvToSAbz1EfjZkO78z+hoQVSe+hOhyoZ+
x25Egybn2apbhxECkHzAMJigDDAwqbkUOng2HyUobwf9XPwJJ1SzaYRXn287Qe50
kCt+kjwnRHP1/7eBIAFGUGb+6Ltluxt0KFCExcwi1YswLAB6HKtQjWAnrB/+lqbH
69Ay9dXio6fYX3y2Qkxl+Kt6jzaNrATdhdDirRy1xqo92xtDFFevUNnUz2xR5DtK
LyNmTLa4gJX6StIykEp+axAnwwnpIA==
=ti2w
-----END PGP SIGNATURE-----

--ptu5vnlv7n7jd633--
