Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A022337B7D0
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76136EB56;
	Wed, 12 May 2021 08:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F46EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:23:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id h4so32573586lfv.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9aIZ3BO/Kt7N85XGaQbgXr/03H9e0femzgtmBv1i4IQ=;
 b=YzkDtYAd/hdRKCT6T02OLng0R95aJDXYUAkdCmJq5QkjTQyfDQtJM7Bs7NZyO4ORkE
 QBIwcar1v8a8VVPGaWr9jhbKqsFzdP2iyAuhSdj+ui0eoBzeYlfMnfG+6aThIgl+VF1t
 ZFpD3gDbxahxWDQCHZhVDsG21Oxvmqno9nS/Noj2n7eArWSfC+DZ50ea+efSfkJYhFhP
 llXTtgEfpCZrZjuN0wSzd0/VSrMnBuo9t29zCxBhlcKjtB6mVLvJGq1cdMx471nxH+iC
 ym6ymPUrdCPdItcJGXzWPJBG8r+fxiEcnpOfTN5ZTYBNxu9+imqZ5DzjsCCq5wiucXce
 fsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9aIZ3BO/Kt7N85XGaQbgXr/03H9e0femzgtmBv1i4IQ=;
 b=h947APmeKtyTOd4oeW4Phn2FmrLuD1+R8dnABBWwVPbllUEPpybqTc400JAX4ymK9u
 GeJSOONzL9eUoNqFHxus25yJaWY3Rc5zS4xOgaCZamKmFoMvGuT6d3Wz7sP+LJhjHGPZ
 Us23F7K46i26/Nyn8am5mUiqHSRF1cJTxa0JviN9xMXDv5cQVI5luzjECXoMZNQkZOxy
 5N0fHSl4v1hMAqAP67x8bMch90/9pe7iSMWzf6teInMjeDZUX8rDRp26yAaF3cYTHQL/
 CLTyqfzKne4pnBbdY8KijV7ZO78Qk0oiBJhS+CjTvxiUAWE5OdWWnbeXK2tv90t4RFHf
 pzWg==
X-Gm-Message-State: AOAM5312PwNUtwGbXr1JcYObeKyIN8jR0qCxmMG6ZP1OD+N4xoBBTged
 /ZPmU0pKTpAD5KG1B7pxgRc=
X-Google-Smtp-Source: ABdhPJxIQQ48FU0L7CKogpDIUHwEoIvCroXif7FW1IltqqjuJf/xet9uxJ5eSLhS2ZB3osNMdhZNaQ==
X-Received: by 2002:a05:6512:13a5:: with SMTP id
 p37mr23496024lfa.610.1620807820960; 
 Wed, 12 May 2021 01:23:40 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z11sm2872799lfr.73.2021.05.12.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 01:23:40 -0700 (PDT)
Date: Wed, 12 May 2021 11:23:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <20210512112330.0130a62a@eldfell>
In-Reply-To: <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lRLO/BB86aWvK=8TPAYRlGl"; protocol="application/pgp-signature"
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lRLO/BB86aWvK=8TPAYRlGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 11 May 2021 18:44:17 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote:
> > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:=
 =20
> > >
> > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote=
: =20
> > > >
> > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wro=
te: =20
> > > > >
> > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote: =20
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on =
"video
> > > > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > > > optional helper vfunc to determine if a plane is attached to a =
CRTC
> > > > > > that actually needs dirtyfb, and skip over them.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org> =20
> > > > >
> > > > > So this is a bit annoying because the idea of all these "remap le=
gacy uapi
> > > > > to atomic constructs" helpers is that they shouldn't need/use any=
thing
> > > > > beyond what userspace also has available. So adding hacks for the=
m feels
> > > > > really bad. =20
> > > >
> > > > I suppose the root problem is that userspace doesn't know if dirtyfb
> > > > (or similar) is actually required or is a no-op.
> > > >
> > > > But it is perhaps less of a problem because this essentially boils
> > > > down to "x11 vs wayland", and it seems like wayland compositors for
> > > > non-vsync'd rendering just pageflips and throws away extra frames f=
rom
> > > > the app? =20
> > >
> > > Yeah it's about not adequately batching up rendering and syncing with
> > > hw. bare metal x11 is just especially stupid about it :-)
> > > =20
> > > > > Also I feel like it's not entirely the right thing to do here eit=
her.
> > > > > We've had this problem already on the fbcon emulation side (which=
 also
> > > > > shouldn't be able to peek behind the atomic kms uapi curtain), an=
d the fix
> > > > > there was to have a worker which batches up all the updates and a=
voids any
> > > > > stalls in bad places. =20
> > > >
> > > > I'm not too worried about fbcon not being able to render faster than
> > > > vblank.  OTOH it is a pretty big problem for x11 =20
> > >
> > > That's why we'd let the worker get ahead at most one dirtyfb. We do
> > > the same with fbcon, which trivially can get ahead of vblank otherwise
> > > (if sometimes flushes each character, so you have to pile them up into
> > > a single update if that's still pending).
> > > =20
> > > > > Since this is for frontbuffer rendering userspace only we can pro=
bably get
> > > > > away with assuming there's only a single fb, so the implementatio=
n becomes
> > > > > pretty simple:
> > > > >
> > > > > - 1 worker, and we keep track of a single pending fb
> > > > > - if there's already a dirty fb pending on a different fb, we sta=
ll for
> > > > >   the worker to start processing that one already (i.e. the fb we=
 track is
> > > > >   reset to NULL)
> > > > > - if it's pending on the same fb we just toss away all the update=
s and go
> > > > >   with a full update, since merging the clip rects is too much wo=
rk :-) I
> > > > >   think there's helpers so you could be slightly more clever and =
just have
> > > > >   an overall bounding box =20
> > > >
> > > > This doesn't really fix the problem, you still end up delaying send=
ing
> > > > the next back-buffer to mesa =20
> > >
> > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > tracking corruption is possible, but that's not the kernel's problem.
> > > So how would anything get held up in userspace. =20
> >=20
> > the part about stalling if a dirtyfb is pending was what I was worried
> > about.. but I suppose you meant the worker stalling, rather than
> > userspace stalling (where I had interpreted it the other way around).
> > As soon as userspace needs to stall, you're losing again. =20
>=20
> Nah, I did mean userspace stalling, so we can't pile up unlimited amounts
> of dirtyfb request in the kernel.
>=20
> But also I never expect userspace that uses dirtyfb to actually hit this
> stall point (otherwise we'd need to look at this again). It would really
> be only there as defense against abuse.
>=20
> > > > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > > > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > > > of drm_atomic_helper_dirtyfb() =20
> > >
> > > That's still using information that userspace doesn't have, which is a
> > > bit irky. We might as well go with your thing here then. =20
> >=20
> > arguably, this is something we should expose to userspace.. for DSI
> > command-mode panels, you probably want to make a different decision
> > with regard to how many buffers in your flip-chain..
> >=20
> > Possibly we should add/remove the fb_damage_clips property depending
> > on the display type (ie. video/pull vs cmd/push mode)? =20
>=20
> I'm not sure whether atomic actually needs this exposed:
> - clients will do full flips for every frame anyway, I've not heard of
>   anyone seriously doing frontbuffer rendering.

That may or may not be changing, depending on whether the DRM drivers
will actually support tearing flips. There has been a huge amount of
debate for needing tearing for Wayland [1], and while I haven't really
joined that discussion, using front-buffer rendering (blits) to work
around the driver inability to flip-tear might be something some people
will want.

Personally, what I do agree with is that "tear if late from intended
vblank" is a feature that will be needed when VRR cannot be used.
However, I would also argue that multiple tearing updates per refresh
cycle is not a good idea, and I know people disagree with this because
practically all relevant games are using a naive main loop that makes
multi-tearing necessary for good input response.

I'm not quite sure where this leaves the KMS UAPI usage patterns. Maybe
this matters, maybe not?

Does it make a difference between using legacy DirtyFB vs. atomic
FB_DAMAGE_CLIPS property?

Also mind that Wayland compositors would be dynamically switching
between "normal flips" and "tearing updates" depending on the
scenegraph. This switch should not be considered a "mode set".

[1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reques=
ts/65


Thanks,
pq

--Sig_/lRLO/BB86aWvK=8TPAYRlGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCbkIIACgkQI1/ltBGq
qqevug//QKCSIRF80hOucwS6B35t2bxDSP5LwyUk618mdGjPvx+iSvkmw+SZbQzR
iy4HoFkwbhUSyTEeUX1FeiYmlZ1LFj90Hi4f8bWWIHsRJKN62neUOc+uMigXT5dk
lNSVwxStn4W8298ssY0Gm10We0XkbAPXIeCI/GLjcrXV7Eau98OrO1MjyPFBd5w7
ogSeXWSEIrqyR8+HV8ppIyfCeR8ze0HFCP0nGysEeQyUhSbHzE0OIIvDwp5R4jcO
j4OeoTxTPmt/YLIubJGVxb1ytcuTUK87zklnpx/TX0vGJZu3uR4/xLnUQYcMqow/
D0IbKAGD1MRPAcwXQzQuh0GorkDM3pYd4VLKAIWOoIyHY+c2KgV9LjXeW2v2kEjs
WYDAhtu7B4+8G6c2kI/sM4vhhGye1gKv/qi1c8vdbFZfspEx0jnUSiuLQqxKqp85
Uyb9DNZImniANnhCMUfXNTjY161x5Ld9nrEJgVo1x7fDobnpWhBHMOcJGEh8gW6r
mFJI6D4BHejShU6I0/3ujG5XVk06xtXPTCsfEEM2WB3jcuAbipN8ZWDHfd8W04/B
HfOAUJJMlDXsBGsMeKqUjKN5Jjl3l2J6Jq49iAMIH1UUoVMwE/9W6g9JRzbNWO4y
dIvnagivona6Iy+bxrMSsOac9lyWY3XN/lJf8GzSdBQBH1pCITs=
=p1HT
-----END PGP SIGNATURE-----

--Sig_/lRLO/BB86aWvK=8TPAYRlGl--
