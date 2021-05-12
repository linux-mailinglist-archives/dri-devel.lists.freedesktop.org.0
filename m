Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D684337B980
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 11:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711ED6E1E9;
	Wed, 12 May 2021 09:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25A06E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 09:46:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t11so32765495lfl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=UTRP9W3DEBcVT+DNyrLGorO1aWE0wr79U4YNb/sEr88=;
 b=Tobg/HwCejdmVJtT9riwTrELsR+KxRPiAyTzL5Hei34O/TmMDIneiXJSwKQAVabbjI
 hhoDpf26PlqSSgFKjVnsuDdKHzavjgRqoT4NE9XAlyEJBjm4frVGBeOumk5zXd/7SrVX
 0F/YSZ1jHiwqFFY9VC+pxI3yE3/md8bRSc0d7zplqWwu5YFOPi+uXLjKR0FQ0qXL3ZVT
 zGcx1eORkiBi68Sf/gyy7HrdYut3BfrVpmVv24ji0prPEpnkrJaSOaSf+yeBOyiQzQFH
 rmhaq4GVfVauCP+UmCz2aD+UuA0DPehY8fuxZ92xSRy9HOFKCAXUhsHoQLB+9HvBRxGp
 r5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=UTRP9W3DEBcVT+DNyrLGorO1aWE0wr79U4YNb/sEr88=;
 b=QPIUjZ3W1gM3G1WN2AcBrHPGQDY4c6Nqfuc1i81/7CGiN6c0f5HToVhAHuykhuGeMB
 tnXcazIBDPRzSC4JpJrdi/a3hTTJ3PDuvJZ6WIRkvYhR7b7syT5t28xhWKd0QStFdmV9
 8mqgf+zEfXkoJc4olm/y+bGQniTf0710GtZfv+YwZusRg0nwspo+vFPN1t03Fs3WJmx1
 kibDxMSIrgfvsxL2CVRCUNJzFMkrZq49y8XjCqAnTtGKDeOUDguVlRLIwHGwwEZeF7yA
 s5ZGLL22Ttk5h4HH1HYr6Pmd0V5m/Uma4tBNi1WII4fRuszNjq/Kk4vUtqs1gSo96asm
 KlxA==
X-Gm-Message-State: AOAM530EY/raLm6cCdGpqpjLAVuaB7gGeeSZ9SFsie5kpkd3BzWCW4dk
 tN1ZJjZtAho7bp+i2SkhxI8=
X-Google-Smtp-Source: ABdhPJy5+cU1uYWURgeU0XWz89XSUMz+AgVTEVmslstJsUSkDYUfwB4bEB1kRwOwnrZylA75c+gVGQ==
X-Received: by 2002:a19:c512:: with SMTP id w18mr24201034lfe.428.1620812783233; 
 Wed, 12 May 2021 02:46:23 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h19sm2930207lfc.56.2021.05.12.02.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 02:46:22 -0700 (PDT)
Date: Wed, 12 May 2021 12:46:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <20210512124619.3fba5b9b@eldfell>
In-Reply-To: <YJuVbRNGSCkYYD7U@phenom.ffwll.local>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
 <20210512112330.0130a62a@eldfell>
 <YJuVbRNGSCkYYD7U@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+osi.ekD5RBkw66jYfIoG/Y"; protocol="application/pgp-signature"
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

--Sig_/+osi.ekD5RBkw66jYfIoG/Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 10:44:29 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 12, 2021 at 11:23:30AM +0300, Pekka Paalanen wrote:
> > On Tue, 11 May 2021 18:44:17 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote: =20
> > > > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wr=
ote:   =20
> > > > >
> > > > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> w=
rote:   =20
> > > > > >
> > > > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch>=
 wrote:   =20
> > > > > > >
> > > > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:   =
=20
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank=
 on "video
> > > > > > > > mode" type displays, which is pointless and unnecessary.  A=
dd an
> > > > > > > > optional helper vfunc to determine if a plane is attached t=
o a CRTC
> > > > > > > > that actually needs dirtyfb, and skip over them.
> > > > > > > >
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>   =20
> > > > > > >
> > > > > > > So this is a bit annoying because the idea of all these "rema=
p legacy uapi
> > > > > > > to atomic constructs" helpers is that they shouldn't need/use=
 anything
> > > > > > > beyond what userspace also has available. So adding hacks for=
 them feels
> > > > > > > really bad.   =20
> > > > > >
> > > > > > I suppose the root problem is that userspace doesn't know if di=
rtyfb
> > > > > > (or similar) is actually required or is a no-op.
> > > > > >
> > > > > > But it is perhaps less of a problem because this essentially bo=
ils
> > > > > > down to "x11 vs wayland", and it seems like wayland compositors=
 for
> > > > > > non-vsync'd rendering just pageflips and throws away extra fram=
es from
> > > > > > the app?   =20
> > > > >
> > > > > Yeah it's about not adequately batching up rendering and syncing =
with
> > > > > hw. bare metal x11 is just especially stupid about it :-)
> > > > >   =20
> > > > > > > Also I feel like it's not entirely the right thing to do here=
 either.
> > > > > > > We've had this problem already on the fbcon emulation side (w=
hich also
> > > > > > > shouldn't be able to peek behind the atomic kms uapi curtain)=
, and the fix
> > > > > > > there was to have a worker which batches up all the updates a=
nd avoids any
> > > > > > > stalls in bad places.   =20
> > > > > >
> > > > > > I'm not too worried about fbcon not being able to render faster=
 than
> > > > > > vblank.  OTOH it is a pretty big problem for x11   =20
> > > > >
> > > > > That's why we'd let the worker get ahead at most one dirtyfb. We =
do
> > > > > the same with fbcon, which trivially can get ahead of vblank othe=
rwise
> > > > > (if sometimes flushes each character, so you have to pile them up=
 into
> > > > > a single update if that's still pending).
> > > > >   =20
> > > > > > > Since this is for frontbuffer rendering userspace only we can=
 probably get
> > > > > > > away with assuming there's only a single fb, so the implement=
ation becomes
> > > > > > > pretty simple:
> > > > > > >
> > > > > > > - 1 worker, and we keep track of a single pending fb
> > > > > > > - if there's already a dirty fb pending on a different fb, we=
 stall for
> > > > > > >   the worker to start processing that one already (i.e. the f=
b we track is
> > > > > > >   reset to NULL)
> > > > > > > - if it's pending on the same fb we just toss away all the up=
dates and go
> > > > > > >   with a full update, since merging the clip rects is too muc=
h work :-) I
> > > > > > >   think there's helpers so you could be slightly more clever =
and just have
> > > > > > >   an overall bounding box   =20
> > > > > >
> > > > > > This doesn't really fix the problem, you still end up delaying =
sending
> > > > > > the next back-buffer to mesa   =20
> > > > >
> > > > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > > > tracking corruption is possible, but that's not the kernel's prob=
lem.
> > > > > So how would anything get held up in userspace.   =20
> > > >=20
> > > > the part about stalling if a dirtyfb is pending was what I was worr=
ied
> > > > about.. but I suppose you meant the worker stalling, rather than
> > > > userspace stalling (where I had interpreted it the other way around=
).
> > > > As soon as userspace needs to stall, you're losing again.   =20
> > >=20
> > > Nah, I did mean userspace stalling, so we can't pile up unlimited amo=
unts
> > > of dirtyfb request in the kernel.
> > >=20
> > > But also I never expect userspace that uses dirtyfb to actually hit t=
his
> > > stall point (otherwise we'd need to look at this again). It would rea=
lly
> > > be only there as defense against abuse.
> > >  =20
> > > > > > But we could re-work drm_framebuffer_funcs::dirty to operate on=
 a
> > > > > > per-crtc basis and hoist the loop and check if dirtyfb is neede=
d out
> > > > > > of drm_atomic_helper_dirtyfb()   =20
> > > > >
> > > > > That's still using information that userspace doesn't have, which=
 is a
> > > > > bit irky. We might as well go with your thing here then.   =20
> > > >=20
> > > > arguably, this is something we should expose to userspace.. for DSI
> > > > command-mode panels, you probably want to make a different decision
> > > > with regard to how many buffers in your flip-chain..
> > > >=20
> > > > Possibly we should add/remove the fb_damage_clips property depending
> > > > on the display type (ie. video/pull vs cmd/push mode)?   =20
> > >=20
> > > I'm not sure whether atomic actually needs this exposed:
> > > - clients will do full flips for every frame anyway, I've not heard of
> > >   anyone seriously doing frontbuffer rendering. =20
> >=20
> > That may or may not be changing, depending on whether the DRM drivers
> > will actually support tearing flips. There has been a huge amount of
> > debate for needing tearing for Wayland [1], and while I haven't really
> > joined that discussion, using front-buffer rendering (blits) to work
> > around the driver inability to flip-tear might be something some people
> > will want. =20
>=20
> Uh pls dont, dirtyfb does a full atomic commit on atomic drivers
> underneath it.

You keep saying dirtyfb, but I still didn't understand if you mean
literally *only* the legacy DirtyFB ioctl, or does it include
FB_DAMAGE_CLIPS in atomic too?

I suppose you mean only the legacy ioctl.

> > Personally, what I do agree with is that "tear if late from intended
> > vblank" is a feature that will be needed when VRR cannot be used.
> > However, I would also argue that multiple tearing updates per refresh
> > cycle is not a good idea, and I know people disagree with this because
> > practically all relevant games are using a naive main loop that makes
> > multi-tearing necessary for good input response.
> >=20
> > I'm not quite sure where this leaves the KMS UAPI usage patterns. Maybe
> > this matters, maybe not?
> >=20
> > Does it make a difference between using legacy DirtyFB vs. atomic
> > FB_DAMAGE_CLIPS property?
> >=20
> > Also mind that Wayland compositors would be dynamically switching
> > between "normal flips" and "tearing updates" depending on the
> > scenegraph. This switch should not be considered a "mode set".
> >=20
> > [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_re=
quests/65 =20
>=20
> I think what you want is two things:
> - some indication that frontbuffer rendering "works", for some value of
>   that (which should probably be "doesn't require dirtyfb")
>=20
> - tearing flips support. This needs driver support

A "tear if late" functionality in the kernel would be really nice too,
but can probably be worked around with high resolution timers in
userspace and just-in-time atomic tearing flips. Although those flips
would need to be tearing always, because timers that close to vblank are
going to race with vblank.

> If you don't have either, pls don't try to emulate something using
> frontbuffer rendering and dirtyfb, because that will make it really,
> really awkward for the kernel to know what exactly userspace wants to do.
> Overloading existing interfaces with new meaning just we can really=20
> and it happens to work on the one platform we tested is really not a good
> idea.

Alright, I'll spread the word if I catch people trying that.

I didn't even understand that using DirtyFB at all would put "new
meaning" to it. I mean, if you do front-buffer rendering, you must use
DirtyFB or FB_DAMAGE_CLIPS on atomic to make sure it actually goes
anywhere, right?


Thanks,
pq

--Sig_/+osi.ekD5RBkw66jYfIoG/Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCbo+sACgkQI1/ltBGq
qqccsA/9EikRFWnviIH8pRt8K+WdgN2z8rZMbR3OJf/v6ChNpUrCHjBCJJ9MULrc
WbyVpvb+dyv2fUi2Yc4r4gLMWa95xQkZ/MhIvjWv9tKnlkUbogkyBhi0PxuctmUL
4uAxw+rQ8+46ICDKZ+q4TF1ZKocAhlQAmF25MDZVaTgWTIcXbSOLZZ+okT0coi3b
UTKSQIZ/VyH7fz91Jknsds8imGcpmvmJr57HHv/EW8QTqU3hdJbcIly1oYKvT7Dt
8oBSj5rcvy79bFStiWKcd1M/cUhM01esoKU2UzLZAhzH657oQmo3ECMXzHtcC0do
LuRR/xxvLvcKJILtP4w6sDdryDbdCIWOj8CARfOmEDZnPleBDGN2dQ1mbI2bCWoh
udWHlywYV/hcJbLBA1ySu/51YCqzHBQnkvjQDEDYSfhhg5mBz0+YDYD3kRCd+tZH
tixFk77yEzb2NQnVHlj7drJj+FCzhF6PU0HcOIq26JzGGculTqigkz4WFrBjBC60
+rnB5uZpMDtAU/v9RGzvUBdTuHiBxyJJSTxQMcLkEDgrtq8le7IIPW9io8Thx+K7
CV8+x2vYOVQCTNmJT+6gFDaBb9caZJ7fupzdNwRFozEHJxTYWsm3Kwh5Bid3PDpr
g8h8kebrdjKYNQ8XxRTr+FUfdpWD40Mg9PO6kfWVIfmYUdqUecw=
=Bjrg
-----END PGP SIGNATURE-----

--Sig_/+osi.ekD5RBkw66jYfIoG/Y--
