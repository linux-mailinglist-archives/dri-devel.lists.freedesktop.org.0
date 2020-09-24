Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76556276E4B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179E86E1B2;
	Thu, 24 Sep 2020 10:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6D6E1B2;
 Thu, 24 Sep 2020 10:11:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y4so2224009ljk.8;
 Thu, 24 Sep 2020 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=0ktpu0KCEfoKar6im+OpUlZC6mYr/wchYlzLWYWZORg=;
 b=n2m0Jqe4n1A7My+53I5Xg7NHFj38jOLfb5rFUutPwF14oY+vWrT5TybOZ4hXVz8a1O
 PE0Sif87/6uhQOQcCS9TrdweE0a1X8XzdBPPEPk8NBa458F7at5ckmVzA7yIie1voxCr
 s62NEJupWjQ/bZQHqoHFl5zU0bMuD5Tzqv2q5a+FYnfWqo3GhKxQ6nNrIv3JRMbAw6rR
 N7F4108Ci+YTC/m7D91w9mw0TY8yAelUWHW7iw8w63LkuLrVu1Q4OprXPtInwSPLtUsI
 uHfiGsHMLXi3W/SpAXE4yfLmBz9jgRhB606sNJJhJUrdYO1zOBoX/LL/ILak2QyTB5qn
 JWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0ktpu0KCEfoKar6im+OpUlZC6mYr/wchYlzLWYWZORg=;
 b=sL2Y7c4hlaSOkPwwzKGho3CH3QJaCaA6vS3n4znoo7I+NpfLI3BORKBDyOIF/r8tjy
 CNESvFICWZvrAV9ycGtHaloW5ZJX0aN2qWEv/ZLP+WQmA+uOFijWhktd9KWxR6zzbcVJ
 Qb3PRt6DEm0OVwyUU8WiTt0EcJP/e0m35CcAJyP0E3o81A0PclDGWs7BZx5bZaYXO22r
 Rv+IfFA8CnRjYNWmE+XV4vSBdqpfIooPjcPx68Tb0cfuOjbKpnVN+QpwpB0olFZZccwU
 k3fbRpwUW9ljZfu0xKs0onTIo64e9jMLzZVHgNKM9LBZHyTm6nj4JtLMCccEGcEN67ND
 tvsQ==
X-Gm-Message-State: AOAM530lVgl2bNSIwh2ldIlgSHLGBYHm8YoUBdyAcGKixRat8mSRPODW
 mNYKYoBUv0r55eg7FTwjL4k=
X-Google-Smtp-Source: ABdhPJzJMutwVxuJRqehGtUY4EmT08iJGjylLzOyc1dYYYW/K7rkkHxp9L+oHraYor8FDPjhTYA9tw==
X-Received: by 2002:a2e:814b:: with SMTP id t11mr69736ljg.367.1600942269583;
 Thu, 24 Sep 2020 03:11:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b25sm1624531lfc.298.2020.09.24.03.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 03:11:09 -0700 (PDT)
Date: Thu, 24 Sep 2020 13:10:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Message-ID: <20200924131056.54beb12e@eldfell>
In-Reply-To: <CAKMK7uHwU0r7Z699qw3Y2HPuvzL3-B12fw3gDbdrxOX1V6iK2w@mail.gmail.com>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
 <20200923191724.GA62596@xpredator>
 <CAKMK7uH0WiEPP1H1DZPdE4mJdStTTtnZJQN5rjnkG_6va_1Tdg@mail.gmail.com>
 <20200924104101.63be1c13@eldfell>
 <CAKMK7uHwU0r7Z699qw3Y2HPuvzL3-B12fw3gDbdrxOX1V6iK2w@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1845872675=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1845872675==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VFcXys35aZGQ6/_poKiB1ik"; protocol="application/pgp-signature"

--Sig_/VFcXys35aZGQ6/_poKiB1ik
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Sep 2020 10:04:12 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Thu, Sep 24, 2020 at 9:41 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Wed, 23 Sep 2020 22:01:25 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > On Wed, Sep 23, 2020 at 9:17 PM Marius Vlad <marius.vlad@collabora.co=
m> wrote: =20
> > > >
> > > > On Wed, Sep 23, 2020 at 05:18:52PM +0200, Daniel Vetter wrote: =20
> > > > > When doing an atomic modeset with ALLOW_MODESET drivers are allow=
ed to
> > > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > > reconfiguring global resources). =20
> >
> > ...
> > =20
> > > > > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomi=
c_state *state)
> > > > >               }
> > > > >       }
> > > > >
> > > > > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > > > > +             affected_crtc |=3D drm_crtc_mask(crtc);
> > > > > +
> > > > > +     /*
> > > > > +      * For commits that allow modesets drivers can add other CR=
TCs to the
> > > > > +      * atomic commit, e.g. when they need to reallocate global =
resources.
> > > > > +      * This can cause spurious EBUSY, which robs compositors of=
 a very
> > > > > +      * effective sanity check for their drawing loop. Therefor =
only allow
> > > > > +      * drivers to add unrelated CRTC states for modeset commits.
> > > > > +      *
> > > > > +      * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL=
 as an output
> > > > > +      * so compositors know what's going on.
> > > > > +      */
> > > > > +     if (affected_crtc !=3D requested_crtc) {
> > > > > +             DRM_DEBUG_ATOMIC("driver added CRTC to commit: requ=
ested 0x%x, affected 0x%0x\n",
> > > > > +                              requested_crtc, affected_crtc);
> > > > > +             WARN(!state->allow_modeset, "adding CRTC not allowe=
d without modesets: requested 0x%x, affected 0x%0x\n",
> > > > > +                  requested_crtc, affected_crtc); =20
> > > > Previous patch had the warn on state->allow_modeset now is
> > > > !state->allow_modeset. Is that correct? =20
> > >
> > > We need to fire a warning when allow_modeset is _not_ set. An earlier
> > > version got that wrong, and yes that would have caused a _ton_ of
> > > warnings on any fairly new intel platform.
> > > =20
> > > > I haven't followed the entire thread on this matter, but I guess th=
e idea
> > > > is that somehow the kernel would pass to userspace a CRTC mask of
> > > > affected_crtc (somehow, we don't know how atm) and with it, userspa=
ce
> > > > can then issue a new commit (this commit blocking) with those? =20
> > >
> > > Either that, or just use that to track all the in-flight drm events.
> > > Userspace will get events for all the crtc, not just the one it asked
> > > to update. =20
> >
> > Wait, does that happen already? Getting CRTC events for CRTCs userspace
> > didn't include in the atomic commit? =20
>=20
> Yeah I'm pretty sure. With the affected_crtc mask you could update
> your internal book-keeping to catch these, which should also prevent
> all the spurious EBUSY. But I'm not entirely sure, I just read the
> code, haven't tested.

If that actually happens, how does userspace know whether the
userdata argument with the event is valid or not?

The kernel should expect the userdata argument to be one-shot, because
it may be a pointer to a malloc()'d struct that gets freed the moment
the originally expected event is handled, so re-using userdata is going
to break userspace (ISTR Mutter uses this style with legacy, Weston
passes somewhat more persistent pointers with both legacy and atomic).
Does the kernel reset it to zero? What if userspace doesn't use a
pointer but e.g. an index where 0 may be a legal value but also wrong?


Thanks,
pq

> > That could explain why Weston freaks out in
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/435 =20
>=20
> Hm it's strange that you first get an EBUSY, and only on the next
> modeset get the spurious event. You should get one already on the
> first modeset.
> -Daniel
>=20
> >
> >
> > Thanks,
> > pq
> >
> > =20
> > > If that's easier to do by re-issuing the commit with the
> > > full set of crtc, then I guess that's an option. But not required (I
> > > think at least, would need to test that to make sure).
> > > -Daniel
> > > =20
> > > > > +     }
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_atomic_check_only); =20
>=20
>=20
>=20


--Sig_/VFcXys35aZGQ6/_poKiB1ik
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9scLAACgkQI1/ltBGq
qqdd0w//Z0d691SdKVgqAiUmeTn6MtrcPik27P5hcFlTUS9TpmXdSPFf1Zu89Hsw
+5uys5732xlOCJ94C3er9wYmmWWycC9z9PVI3y7SYFwkfCuDMHHTFAPYP/yPErGj
36pYVwd4a46dhS2WYInnE0+nSc5MOn7DhxZQne9vOY2cCx0U69t7NnjAvXRk2QNJ
XwigVyRHkrbIUAD/ky/qy2XLZyntdt8dO8JKQ/OunLhRKGuA0VFrPRBydKWDCZ3f
rqWHhmG9ZcXsIi+Kvv6EiZHKNv+Xp6KN4e7/ektzL8oA+ubBu36FsbwMrXeCUNFU
S2JJZqTvr13il2JRHR9Yr7DwW8l1XDC2ySMX8icC8gh9jsBtYawUyQN8UXMQB6Mm
xEqoXWkJuLy2+LhoQghzVqYqkaUgi/htlOE84qXpSH6ReQA/tanKg9n9NQYIVFtb
UK7Zv+pWakIWAZpEmNTlcd6O14dcGNa5M8d+0bD7mC+CtXpNWkrtZ21FyexYqxQ0
tuNsyoBadlKkpYC6kdMkmK2LeYd+YYN6ang9xVqUZBp1jeisRp/QzcpL0muR6jxh
xaK9/T9dxqRcwxvGiETImD5Bd3TLyISjEyE5a/NaFmPScaeuiueFMDavVseuB0Th
fgc8HnRDuoVGJrfWvcr/cRwvC/YOtcN1UHmqiAJERean215ZjTg=
=O76N
-----END PGP SIGNATURE-----

--Sig_/VFcXys35aZGQ6/_poKiB1ik--

--===============1845872675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1845872675==--
