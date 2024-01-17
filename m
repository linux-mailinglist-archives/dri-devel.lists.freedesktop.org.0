Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F608301A7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 09:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98910E626;
	Wed, 17 Jan 2024 08:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B688010E626;
 Wed, 17 Jan 2024 08:56:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2cdeb80fdfdso6784401fa.2; 
 Wed, 17 Jan 2024 00:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705481721; x=1706086521; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dBhzqek/6fd7CREjB7gj0PgcE8vXqoFMHvhu7g1QD50=;
 b=hApjHyTXyfd6djcZY0N8F+VJH+tvxWFIN6aZAB5sl40kzDtyngnfcgIVRrUFqK6lPc
 DHbh/jWypi/hROmeiMidfwGSO18uGA37nWrBFSClJIyagV2+uf/4ycPLymRFIjxL1SOy
 A7FTxPrLqEc+kvRXlDHACQcfsaTGJtQ2+n67tdiD6l3E3/96joN+A00jsJpx9CPO/sGU
 b/VNVzD+Kn8+g8KJ4iWIn6PoeHIyjAGojWCjSz4FVVoJOahRh0WvPyHmdEfS38e8tQ5M
 m3+8387PYfnAz8f3GGH4LfdxMQEdg997+fT7otikvme1YAG1IHVFAzZn9OMZWWq49p0Q
 hSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705481721; x=1706086521;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dBhzqek/6fd7CREjB7gj0PgcE8vXqoFMHvhu7g1QD50=;
 b=nMBVp4DD7intN715pfQCGTkuLXcjIuGAnljW4edMNQGiMFV6bhHWx86X+VQDO0eG2p
 bKhhoB/rn8fideMVGPYkfnLOiPA2XA/hvCb+k2jCeTCMaUUHe6a1TS0ObSu3lKlyxyx6
 2P/6Dgcpv4iNxrmfWmqb+bDfW6s2Lwi5YoyzQZB9iszKgCntLHSAko4hSTcOlPicx7rN
 elCDgPeClyFlmAFt9FQk30Qt+5ePXEVuq/65kkS+nznDCoZ9ww6BLFM7oi9SMzUrsqSG
 6pOOFUSBoUqjwF+2d06Kz8xjV9ZCbUI4vYHJ2Ev4eZWD5hV/Zyabf2AkvdXTSJZ+ih6K
 FZbA==
X-Gm-Message-State: AOJu0YyycWfntwrrNu4B73Fk4ALoOPk5tqxg8XUIXctC17Ip26pkmaEU
 8yaGHq5L3DVC8bNI1Ddh9Tc=
X-Google-Smtp-Source: AGHT+IHhkXxluDe4N7YGLtu2N2AxQtwIH8y92VnGpUGxrLimI7QLF2GoeO0C1Wyx2JopwGlhJsASaQ==
X-Received: by 2002:ac2:5d23:0:b0:50e:6332:8083 with SMTP id
 i3-20020ac25d23000000b0050e63328083mr1775703lfb.183.1705481720786; 
 Wed, 17 Jan 2024 00:55:20 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 dx5-20020a0565122c0500b0050e7741f582sm180895lfb.161.2024.01.17.00.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 00:55:20 -0800 (PST)
Date: Wed, 17 Jan 2024 10:55:09 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Xaver Hugl <xaver.hugl@gmail.com>
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Message-ID: <20240117105509.1984837f@eldfell>
In-Reply-To: <CAFZQkGyOQ5Tfu++-cHqgZ9NOJxqxm8cAF5XT18LmisuPAUbXAg@mail.gmail.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
 <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
 <20240116151414.10b831e6@eldfell>
 <47c6866a-34d6-48b1-a977-d21c48d991dc@igalia.com>
 <CAFZQkGyOQ5Tfu++-cHqgZ9NOJxqxm8cAF5XT18LmisuPAUbXAg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uaSCk2iCuPC2HhY2IGqSpLb";
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
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, daniel@ffwll.ch,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Joshua Ashton <joshua@froggi.es>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uaSCk2iCuPC2HhY2IGqSpLb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jan 2024 17:10:18 +0100
Xaver Hugl <xaver.hugl@gmail.com> wrote:

> My plan is to require support for IN_FENCE_FD at least. If the driver
> doesn't
> allow tearing with that, then tearing just doesn't happen.

That's an excellent point. I think this is important enough in its own
right, that it should be called out in the patch series.

Is it important enough to be special-cased, e.g. to be always allowed
with async commits?

Now that I think of it, if userspace needs to wait for the in-fence
itself before kicking KMS async, that would defeat much of the async's
point, right? And cases where in-fence is not necessary are so rare
they might not even exist?

So if driver/hardware cannot do IN_FENCE_FD with async, is there any
use of supporting async to begin with?

> For overlay planes though, it depends on how the compositor prioritizes
> things.
> If the compositor prioritizes overlay planes and would like to do tearing
> if possible,
> then this patch works.

Ok, I can see that.

> If the compositor prioritizes tearing and would like to do overlay planes
> if possible,
> it would have to know that switching to synchronous commits for a single
> frame,
> setting up the overlay planes and then switching back to async commits
> works, and
> that can't be figured out with TEST_ONLY commits.

I had to ponder a bit why. So I guess the synchronous commit in between
is because driver/hardware may not be able to enable/disable extra
planes in async, so you need a synchronous commit to set them up, but
afterwards updates can tear.

The comment about Intel needing one more synchronous commit when
switching from sync to async updates comes to mind as well, would that
be a problem?

> So I think having a CAP or immutable plane property to signal that async
> commits
> with overlay and/or cursor planes is supported would be useful.

Async cursor planes a good point, particularly moving them around. I'm
not too informed about the prior/on-going efforts to allow cursor
movement more often than refresh rate, I recall something about
amending atomic commits? How would these interact?

I suppose the kernel still prevents any new async commit while a
previous commit is not finished, so amending commits would still be
necessary for cursor plane motion? Or would it, if you time "big
commits" to finish quickly and then spam async "cursor commits" in the
mean time?


Thanks,
pq

> Am Di., 16. Jan. 2024 um 14:35 Uhr schrieb Andr=C3=A9 Almeida <
> andrealmeid@igalia.com>: =20
>=20
> > + Joshua
> >
> > Em 16/01/2024 10:14, Pekka Paalanen escreveu: =20
> > > On Tue, 16 Jan 2024 08:50:59 -0300
> > > Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> > > =20
> > >> Hi Pekka,
> > >>
> > >> Em 16/01/2024 06:45, Pekka Paalanen escreveu: =20
> > >>> On Tue, 16 Jan 2024 01:51:57 -0300
> > >>> Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> > >>> =20
> > >>>> Hi,
> > >>>>
> > >>>> AMD hardware can do more on the async flip path than just the prim=
ary =20
> > plane, so =20
> > >>>> to lift up the current restrictions, this patchset allows drivers =
to =20
> > write their =20
> > >>>> own check for planes for async flips. =20
> > >>>
> > >>> Hi,
> > >>>
> > >>> what's the userspace story for this, how could userspace know it co=
uld =20
> > do more? =20
> > >>> What kind of userspace would take advantage of this and in what =20
> > situations? =20
> > >>>
> > >>> Or is this not meant for generic userspace? =20
> > >>
> > >> Sorry, I forgot to document this. So the idea is that userspace will
> > >> query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls,
> > >> instead of having capabilities for each prop. =20
> > >
> > > That's the theory, but do you have a practical example?
> > >
> > > What other planes and props would one want change in some specific use
> > > case?
> > >
> > > Is it just "all or nothing", or would there be room to choose and pick
> > > which props you change and which you don't based on what the driver
> > > supports? If the latter, then relying on TEST_ONLY might be yet anoth=
er
> > > combinatorial explosion to iterate through.
> > > =20
> >
> > That's a good question, maybe Simon, Xaver or Joshua can share how they
> > were planning to use this on Gamescope or Kwin.
> > =20
> > >
> > > Thanks,
> > > pq
> > > =20
> > >>>> I'm not sure if adding something new to drm_plane_funcs is the rig=
ht =20
> > way to do, =20
> > >>>> because if we want to expand the other object types (crtc, connect=
or) =20
> > we would =20
> > >>>> need to add their own drm_XXX_funcs, so feedbacks are welcome!
> > >>>>
> > >>>>    Andr=C3=A9
> > >>>>
> > >>>> Andr=C3=A9 Almeida (2):
> > >>>>     drm/atomic: Allow drivers to write their own plane check for a=
sync
> > >>>>       flips
> > >>>>     drm/amdgpu: Implement check_async_props for planes
> > >>>>
> > >>>>    .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
> > >>>>    drivers/gpu/drm/drm_atomic_uapi.c             | 62 =20
> > ++++++++++++++----- =20
> > >>>>    include/drm/drm_atomic_uapi.h                 | 12 ++++
> > >>>>    include/drm/drm_plane.h                       |  5 ++
> > >>>>    4 files changed, 92 insertions(+), 17 deletions(-)
> > >>>> =20
> > >>> =20
> > > =20
> > =20


--Sig_/uaSCk2iCuPC2HhY2IGqSpLb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWnle0ACgkQI1/ltBGq
qqc0zRAAmsYLm9QbFAy7oGFE5ESCY1Ws0GyM7zBZ9ZbDTOGpyvJT5ShZzao3l/j2
sDO1wxeC7xW9KhHQGEmJlWMlG+dWv1pXimYEKV0DY5+6e+6WfGA1sGODtn9xKJKd
hFBnZqMnfvKLeowHBIt/00aJoyqwBXovoWyH59kAqSsh8TIKsyp7G5uwFtSHrJl7
wiOysCWzlY8db9onusa9LMBgLG+2K/wDm1PDpjUqKDGidY23CMvz+L2afZf92Hl9
zglYB4UrR9JAVBH88Bi6rhGVMKsidnLpNsPK07ZIvTU8dxlqU5Bxp6zKZmWIOSMF
weCqzq1CatqKo1WvMKU92rS8wQSSEa+TN0/9JIN8TbOb0k6UJwv3yxJ8VjjRPiV3
5L3TjjJOqLxzM4j5K4wS6UQvzY/lpecydBiTNesdniMdCpuNcX3TmAlF8zxJin/G
olK37BM0+4qeEuqRTbYrhDVzmfaASSEzY4i0AgT7Zkk+wYCYReQ0Z6o6wSN570V9
/H1dWPoQlD60lV/2ZPZTGRmLzo3KIgtrNMFqquuE2eIn02PkWSp78B/MORKAslol
EYqBIHM3+DBy5LZiA3kZGO0V1Gj1j4/eShzSxx7WoF0X4FIP5OhMd01AQir0n1B1
h1tk+5WRYgxVja8ZD3ZbySDboTrJw61iD5EFlLA537G9vBSwhRI=
=JhIu
-----END PGP SIGNATURE-----

--Sig_/uaSCk2iCuPC2HhY2IGqSpLb--
