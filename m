Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFAA74E43
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD08E10EA55;
	Fri, 28 Mar 2025 16:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NdUrU0jZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4710EA55
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743178293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KdeQH6uVc+6jOdbwRNbvHQS0LykD9Jrj0j6reO3thF0=;
 b=NdUrU0jZSvTCzMVJHAule2hrf0TtG34vAHZNtpInWnwHJVmHGx82qhm2XGZxx6siBpu+4T
 cFVWOaRRLM/+FJA91BtTy8SO3+yR2MJn6bWRW9C1RDk99J6Rf+QKvQ1BINHd5dcC3KR9lB
 VsnrxdaWkf9r/cedIVC1EAjYlbpcnKo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-xl1lC2FYOdeiIxK8Zl7Jfw-1; Fri, 28 Mar 2025 12:11:31 -0400
X-MC-Unique: xl1lC2FYOdeiIxK8Zl7Jfw-1
X-Mimecast-MFC-AGG-ID: xl1lC2FYOdeiIxK8Zl7Jfw_1743178290
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so11185665e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743178290; x=1743783090;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdeQH6uVc+6jOdbwRNbvHQS0LykD9Jrj0j6reO3thF0=;
 b=c/DqOPgKD2ycOGYTHz32P9qucrkKLGbNSw0ROdFWDlqIby9IF4NE31/JNIfCmwQKjB
 soQj0/6onznC5S5kq+XB1K8IhTktBM3mowWHx/ALKnB64tv9p0kH1B/xc1jeUQ7gWw1e
 9f5mkoDXErXdiptp9jiSU+0YZxE+FRu6YLhTG3RnnZwFOtmKZHvpliFYFWXbFnWXEmeN
 eRuxYtSv8Ecl839ne9GkMzeNGoiRL8f+RbsTdxEarhZKuZobK5p3522OAlKVj+PJ3RBJ
 +67amvF1nGKhJLBWQrsuHzcIzKWNiGov3bLZodFEikinmN88mJOVRESel6NFJgitjG3H
 bj4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHTGwZ1UnHzO3HBS0SBfKLgCh3FrHKjTaULodZbwINu11KJ0RTaxzqkCLhvfyvm+tzr6IB/j1SY7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3dwUjix3qaNlzoBlPXtHYkCbPqhLT3wgmrQsaEln1+gSDBUgj
 hZEuzfSDkjX5Zr6UJHLf6rzVgOJbmyU1TOwDws2c1Cas0KXtqXub9O6U86rXRKi0NMIZ0Dp3HFa
 QelwyIBtuFGvXGC4AfJzO+4fqm0SoiVL2+ynKxsGBlAwoYHx+E9Wpr/NrFggKvHYo5Q==
X-Gm-Gg: ASbGncuohvUfp2bNYosqqmzRHg9ZdADOKTexfu7+RaLRRmUz9br9xjHk+ybnprzSu5X
 e8LhiRVFEhkiQwbcXCllyIlzIhJdK2MsZ2F441BQ1aDGgErkpl8wZlcteg+4SXIp6hOAme4cBn/
 qlCPq76gTsTRYXVP3isp35Krsjl0mw9jAuB+qI/tV0msJsVOpBi4RrSTTk93qpk6p0BGzGwEimO
 yAEQOuu3o1/BMRJoBv/vw+nIxx/q+lvYUl40fclRn1Nv12s6KJGvvxaVpIOH5/Kdx0=
X-Received: by 2002:a05:600c:c8d:b0:43d:ed:acd5 with SMTP id
 5b1f17b1804b1-43db61d0e8amr1039405e9.10.1743178290107; 
 Fri, 28 Mar 2025 09:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJz5tgdxTohEgr9/vL5EQK4OflnAoAQemAMNchhPjn6NX+3nvJjkhFjSKbTQbJIsqm3SDIig==
X-Received: by 2002:a05:600c:c8d:b0:43d:ed:acd5 with SMTP id
 5b1f17b1804b1-43db61d0e8amr1038695e9.10.1743178289570; 
 Fri, 28 Mar 2025 09:11:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeb11sm75327905e9.22.2025.03.28.09.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:11:28 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:11:28 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Helen Koike <koike@igalia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 helen.fornazier@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: DRM CI
Message-ID: <20250328-gay-jaybird-of-wind-9dcca2@houat>
References: <20250319-greedy-sturgeon-from-avalon-ac758f@houat>
 <ab1d875c-7a1e-47a3-b786-85fb46c42bb2@igalia.com>
 <20250320-benevolent-quokka-of-cubism-c1c0ce@houat>
 <5db038f9-b353-494a-aa11-9e6a95932537@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ojizsxjoupwvmzll"
Content-Disposition: inline
In-Reply-To: <5db038f9-b353-494a-aa11-9e6a95932537@igalia.com>
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


--ojizsxjoupwvmzll
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: DRM CI
MIME-Version: 1.0

On Thu, Mar 20, 2025 at 09:32:36AM -0300, Helen Koike wrote:
> Hi Maxime,
>=20
> Thanks for your reply.
>=20
> On 20/03/2025 06:33, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Mar 19, 2025 at 02:39:59PM -0300, Helen Koike wrote:
> > > Hi Maxime,
> > >=20
> > > On 19/03/2025 11:11, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > At last Plumbers, we agreed with Dave that a good first step to ram=
p up
> > > > CI for DRM trees would be to enable build and kunit testing in the =
main
> > > > DRM tree.
> > > >=20
> > > > I played around with it last week and wrote a good first iteration =
of
> > > > the gitlab-ci file.
> > > >=20
> > > > https://gitlab.freedesktop.org/mripard/gitlab/-/blob/main/.gitlab-c=
i.yml?ref_type=3Dheads
> > >=20
> > > How about improving and using the current DRM-CI instead of creating a
> > > new one?
> >=20
> > Thanks for the suggestion, and I did try. I don't think it's a good
> > option though, at first at least.
> >=20
> > There's several layers to it:
> >=20
> >    - The most important one is I don't really see much to share at this
> >      point, really. The containers creation is a good example of
> >      something useful, reusable, and that I did use. However, drm-ci us=
es
> >      different defconfigs, its own set of hardcoded compilers, etc.
>
> This is the effort kci-gitlab is doing (see last patch with a drm-ci
> proposal), to simplify things and remove the dependency of mesa-ci.

Do you have a link to that patch?

> >      I guess we could try to improve and consolidate it, but for a scri=
pt
> >      that simple, I don't think it's worth it.
>=20
> Well, we are splitting our community in some way...

I don't think so? In KMS, we tend to provide a default behaviour with
helpers, but any driver is free to deviate from that if it makes sense.
One of these reasons is that there's no point in trying to make
something specific to a driver generic until there is multiple users for
it. So we have plenty of drivers that don't use the helpers and the
"default" solution.

A community isn't a single codebase, it's a single set of people working
on the same set of problems. If anything, allowing deviation is better
for a community, because then we can have the discussion we have right
now, and we don't work in silos.

Now, if we start saying "ok, any CI in DRM must be done on Debian, with
bleeding edge mesa and igt", then we're splitting the community, because
it just won't work for some people, and they'll still have to make it
work.

> >      Similarly, I don't think it makes sense to try to come up with a
> >      super generic implementation of kunit, when there's only one user.
>=20
> No need to a super generic implementation. At least in kci-gitlab, there =
is
> room to very specific implementations.
>=20
> >=20
> >      That, of course, can and should be reevaluated as we test more
> >      features and the script does indeed become more complicated.
> >=20
> >    - We discussed it during the thread with Linus, but I also don't thi=
nk
> >      a one-size-fits-all approach is going to work. drm-ci at the moment
> >      has plenty of reasonable policies, but which people are still going
> >      to have different opinions on. Like, whether you want to
> >      aggressively update IGT or mesa. Or whether or not you are willing
> >      to disable KASAN to accomodate db410c and db820c. The choices made
> >      in drm-ci so far are reasonable, but choosing something else is ju=
st
> >      as reasonable. That's why I thought at the time that providing
> >      common scripts to include is a better way forward than a gitlab-ci
> >      file everybody is supposed to use.
> >=20
> >    - To some extent, the complaints Rob had last week about drm-ci
> >      expectations not being updated fast enough in drm-misc are related
> >      as well. It could also easily be solved by drm/msm having the
> >      gitlab-ci script and its expectations in a separate repo, under the
> >      msm maintainers control. And then it could go as fast as they want,
> >      under their terms, without creating any impedance mismatch with the
> >      rest of DRM.
>=20
> (I confess I'm not following that thread, I'm guilty on that)
>=20
> If we are going this way, maybe it is better to remove DRM-CI completely
> from the kernel code?
>=20
> Just to be clear, I'm not opposing anything, I just want to understand how
> everything would fit together.

I think it really has value as a "library" or repo, kind of how github
actions work for example. Providing something that would, say, configure
and build the kernel and report the status as a comment on a PR would be
awesome. And there's no reason not to share that. But I believe every
maintainer will need to glue the whole thing together how they see fit.

Maxime

--ojizsxjoupwvmzll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+bKLwAKCRDj7w1vZxhR
xeLIAP0drO3aRODsr8FMBAjBVZDbFIBc4u4WvGqutfMq8UZqHwD/WXVKx0ZeYmKJ
lTu4jJPLeAxOb9diFlAwf3tuCswc3AA=
=W+3e
-----END PGP SIGNATURE-----

--ojizsxjoupwvmzll--

