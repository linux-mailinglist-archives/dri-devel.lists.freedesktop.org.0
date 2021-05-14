Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217753804B3
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4246EE3C;
	Fri, 14 May 2021 07:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D316EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 07:54:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z9so41898664lfu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=c0194sBogjVTlB+VJQHIwtAnq2yY5vXPptvtPB3FKLc=;
 b=D7gmNf6UY8p/oFFkDHrG0tWapuhXQdrWvp7NDB93qjeIY9R/8mlRm6aM/KkQH7xDHy
 CRBMW+1++lP1/NlHuiIs4ki2OHacZfkKEzjkZph6v8NqRw25ijdNKcQaClfkayD58ii+
 Rd92+N5cNu3v6+Xo6sLklJBi/5B1oKmzPaweY0SYnKDc1qt7l9MYekqlW0mHa2npHb1M
 e9+lQEnAiqA++AcbxMexf3296ZqNfYA/5UlLz++hPQ/ZSJU9SBK8j0dwKKYdqgDXflFK
 1bXfDToPUzzttuax+R/FnuJPE0fn+88aTjkAkQqNUFaYaNlWIyM2iinSUjV8M/Eoawjf
 XBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=c0194sBogjVTlB+VJQHIwtAnq2yY5vXPptvtPB3FKLc=;
 b=XqQiRdAuimnFBIpWwG2YxZxjsB7lqm9yU0M3eKJLOe0yk/IgiHb65ml5jTmQbvjRoC
 rsU1v6blklkumV67rbNHz0zYEOg8VKG0j0lv7gIoCu1KqYQNsA8pXwhq1sYCufew8UPu
 VBN48pJNsrZYA1RBcEvlwiStRA/SaWjOHqi5vppRXKFeQBLFjZaEiYY3Jd0XaVGxxTVW
 j8prM6Q86gDORvvIHhg/quqzAyENIvlNQra70MgaDT/5aho9uLjbWW6GCKyZJY9OdR1j
 S0V+rF0BmR+8MvvNiIlS3PM4fEBrzH/RFkdX5n91gx1YF3nB6M57Cnj1gkq596n6/cpb
 M/3w==
X-Gm-Message-State: AOAM531pqtfv+gxD45SIh4Eksa4Fl4sdk6sjGtzF5GCYCXY1PfgRUCh4
 PwH4SOsR40+D01gyflyHvhE=
X-Google-Smtp-Source: ABdhPJwJUL63XTpjK6YgT4BwzeJy3p8pLml7pYjtHSJHsTuc/qMj3XCzkFkPrnqCLYm3z/0VceDGLA==
X-Received: by 2002:ac2:5f58:: with SMTP id 24mr32176624lfz.200.1620978857645; 
 Fri, 14 May 2021 00:54:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u21sm530091lff.66.2021.05.14.00.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 00:54:17 -0700 (PDT)
Date: Fri, 14 May 2021 10:54:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <20210514105404.6e5e44bc@eldfell>
In-Reply-To: <CAF6AEGu4B2wXhbjUxT36tKUhz7R_Mg=TzD7yOA-90L7VBCHpMQ@mail.gmail.com>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
 <20210512112330.0130a62a@eldfell>
 <CAF6AEGu4B2wXhbjUxT36tKUhz7R_Mg=TzD7yOA-90L7VBCHpMQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9+QyOu3vMsXOByZ7woRCPI6"; protocol="application/pgp-signature"
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9+QyOu3vMsXOByZ7woRCPI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 07:57:26 -0700
Rob Clark <robdclark@gmail.com> wrote:

> On Wed, May 12, 2021 at 1:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Tue, 11 May 2021 18:44:17 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote: =20
> > > > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wr=
ote: =20
> > > > >
> > > > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> w=
rote: =20
> > > > > >
> > > > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch>=
 wrote: =20
> > > > > > >
> > > > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote: =20
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
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org> =20

...

> > > > > > But we could re-work drm_framebuffer_funcs::dirty to operate on=
 a
> > > > > > per-crtc basis and hoist the loop and check if dirtyfb is neede=
d out
> > > > > > of drm_atomic_helper_dirtyfb() =20
> > > > >
> > > > > That's still using information that userspace doesn't have, which=
 is a
> > > > > bit irky. We might as well go with your thing here then. =20
> > > >
> > > > arguably, this is something we should expose to userspace.. for DSI
> > > > command-mode panels, you probably want to make a different decision
> > > > with regard to how many buffers in your flip-chain..
> > > >
> > > > Possibly we should add/remove the fb_damage_clips property depending
> > > > on the display type (ie. video/pull vs cmd/push mode)? =20
> > >
> > > I'm not sure whether atomic actually needs this exposed:
> > > - clients will do full flips for every frame anyway, I've not heard of
> > >   anyone seriously doing frontbuffer rendering. =20
> >
> > That may or may not be changing, depending on whether the DRM drivers
> > will actually support tearing flips. There has been a huge amount of
> > debate for needing tearing for Wayland [1], and while I haven't really
> > joined that discussion, using front-buffer rendering (blits) to work
> > around the driver inability to flip-tear might be something some people
> > will want. =20
>=20
> jfwiw, there is a lot of hw that just can't do tearing pageflips.. I
> think this probably includes most arm hw.  What is done instead is to
> skip the pageflip and render directly to the front-buffer.
>=20
> EGL_KHR_mutable_render_buffer is a thing you might be interested in..
> it is wired up for android on i965 and there is a WIP MR[1] for
> mesa/st (gallium):
>=20
> Possibly it could be useful to add support for platform_wayland?
>=20
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10685

Thanks Rob, that's interesting.

I would like to say that EGL Wayland platform cannot and has no reason
to support frontbuffer rendering in Wayland clients, because the
compositor may be reading the current client frontbuffer at any time,
including *not reading it again* until another update is posted via
Wayland. So if a Wayland client is doing frontbuffer rendering, then I
would expect it to be very likely that the window might almost never
show a "good" picture, meaning that it is literally just the
half-rendered frame after the current one with continuously updating
clients.

That is because a Wayland client doing frontbuffer rendering is
completely unrelated to the Wayland compositor putting the client
buffer on scanout.

Frontbuffer rendering used by a Wayland compositor would be used for
fallback tearing updates, where the rendering is roughly just a blit
from a client buffer. By definition, it means blit instead of scanout
from client buffers, so the performance/power hit is going to be...
let's say observable.

If a Wayland client did frontbuffer rendering, and then it used a
shadow buffer of its own to minimise the level of garbage on screen by
doing only blits into the frontbuffer, that would again be a blit. And
then the compositor might be doing another blit because it doesn't know
the client is doing frontbuffer rendering which would theoretically
allow the compositor to scan out the client buffer.

There emerges the need for a Wayland extension for clients to be
telling the compositor explicitly that they are going to be doing
frontbuffer rendering now, it is ok to put the client buffer on scanout
even if you want to do tearing updates on hardware that cannot
tear-flip.

However, knowing that a client buffer is good for scanout is not
sufficient for scanout in a compositor, so it might still not be
scanned out. If the compositor is instead render-compositing, you have
the first problem of "likely never a good picture".

I'm sure there can be specialised use cases (e.g. a game console
Wayland compositor) where scanout can be guaranteed, but generally
for desktops it's not so.

I believe there will be people wanting EGL Wayland platform frontbuffer
rendering for very special cases, and I also believe it will just break
horribly everywhere else. Would it be worth it to implement? No idea.

Maybe there would need to be a Wayland extension so that compositors
can control the availability of frontbuffer rendering in EGL Wayland
platform?

There is the dmabuf-hints Wayland addition that is aimed at dynamically
providing information to help optimise for scanout and
render-compositing. If a compositor could control frontbuffer rendering
in a client, it could tell the client to use frontbuffer rendering when
it does hit scanout, and tell the client to stop frontbuffer rendering
when scanout is no longer possible. The problem with the latter is a
glitch, but since frontbuffer rendering is by definition glitchy (when
done in clients), maybe that is acceptable to some?


Thanks,
pq

--Sig_/9+QyOu3vMsXOByZ7woRCPI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCeLJwACgkQI1/ltBGq
qqesIQ/+P1Xg8GPzwfpZuPgV5aa94yvYjCGoNqlMazREij4ZbX0SU+a9ekmqo7Eu
sCvB/XUzPe1MGoXPRQGI8rdCn8Tw2BrJw36ZiIsz6KAZ5DTWOhROPhzEwxEse23N
nmthRylTGv5w8K+e93LIz7QLitrJ76Ig9Evrc8pQw1o03UTCP4H6llnfejY9VibZ
BPfSYxG046yj+9/UXztlrU8AxZ/X0hHmCcqmi6d1qIVYOzURNQM0QxNLuhNzQlUE
Adm1ASZvMbcFNn/cfsTvsMZKLiP0TIPna0bVmIrazuN5W8+AdMS3bqzgCMzPGTXt
0VuywKJEgbRXbsIF1AaiiOQ3MLxPSMWAM6yZdWVR2dUBJxKTCHmiSk37MHliub9h
WF8sD09Ay7kEaDpDOb6mya7aEEl3/TRxRmJ9GDddOBrRnIU5HCpnO0rRC1y9/1l4
1iKPDP3a8zUMI595ZdRG+Vv98Zd5JopCsEolFjv93ZzukioxhQhzMKdVFIOhkmmk
bVxfWVop0L9CbJQY30XmkH5F7I/TSmiy2bGxma6xUkmlZkoxyI8LSlqW7xWCqkuT
vcqV9WrACkv8WkyAdBVX7m/i14xTqb6gjigJDMXH005az0lGpmV3Cz4AwtJ1EI/S
Id23eZBMrNL9UZh//ektyCZTs1Anmfrekm3jk3uzb4b/2y35fZ4=
=OqLS
-----END PGP SIGNATURE-----

--Sig_/9+QyOu3vMsXOByZ7woRCPI6--
