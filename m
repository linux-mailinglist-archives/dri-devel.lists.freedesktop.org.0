Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13069E118
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 14:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E94010E161;
	Tue, 21 Feb 2023 13:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF8910E128;
 Tue, 21 Feb 2023 13:11:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bx43so4141807ljb.12;
 Tue, 21 Feb 2023 05:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cNhimdyNaKAc11JJ6Ns7s8JMD6xxwBN60jrdYrS/jXY=;
 b=fwLwQ2U/UKjLvDSXZ6xR1gULG/ceO9m8grYQzVyTqMeC80dDl6gsswDequn8FGdCAc
 lochhyGoORy7f9nAwzVM/M93dWm7z6232v3kVT1i28Hhqe7l+8aGZQsehqbhqcsKK3xP
 2L02UCJpYlyqu/OJMnQyFTHfEwTZ9E3L0WPJ+8xOx+tsTFMVxRpcMWP5mBF74oDvft5f
 Bbx4Mk6YWgZjAs9NJX2vcV71TiQfSvvMMQBcWpGht2FjH/s/EuURZZUlH2wnKadNJFOB
 mOti4WCk2/EkqBuQbg4ffRWXl1jF6kLtPbP20A96Ucc4B9zpiXfrH+SHjJzgb6j5jHGx
 7xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cNhimdyNaKAc11JJ6Ns7s8JMD6xxwBN60jrdYrS/jXY=;
 b=KXUkRT8XuuR3AnZ89xv8dYdkThnL+S0IFrP/qQelkAFEgpBxH0/Tbfy6s7adgtgOU9
 sM/N9DJ0gfM0+LIW2SbbpgLRCJobjGqeApVGc5zIleZX7fACKyaBOzNwwHBSqCX6ZtmY
 jM68OxcIa/DcVj5XlCwect+A61K2dPyjhv5RPlHkbeJexz0cn08s78VD4P3d0Y9cJbrt
 nmEtIGBVmaYIBRB22GRU2GpDnIU6kwuspkTrarghCQemcgNFLPcPvx6Z5imu/ZlyQIrU
 +8/LQ2wI8g75N3BVAKSxXamWg/fL3rH0CDMy+rwOS7hPr1XmVld8R4lXhzNybydYXlYR
 BjWA==
X-Gm-Message-State: AO0yUKWFk4Q0lSgyFVPrBez6S3aCiASsp1Ldk+Klga80NneKevOU5PkH
 d7vgynO9L21gXl+3NQV8ll4=
X-Google-Smtp-Source: AK7set/r4gLYYZSEaRA0c5Ez9U9QB0NSc1DB+jLvctnSx6QhLli4WRi6ifgxcWuxUnGYTMsrLHo1kg==
X-Received: by 2002:a05:651c:1987:b0:293:5360:162b with SMTP id
 bx7-20020a05651c198700b002935360162bmr1153760ljb.11.1676985105596; 
 Tue, 21 Feb 2023 05:11:45 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u9-20020a2eb809000000b00295765966d9sm719189ljo.86.2023.02.21.05.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:11:45 -0800 (PST)
Date: Tue, 21 Feb 2023 15:11:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
Message-ID: <20230221151133.6392c521@eldfell>
In-Reply-To: <Y/TAr64SpxO712RB@intel.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yl_frWmpDj_N_KKHgXd/ud5";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Yl_frWmpDj_N_KKHgXd/ud5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Feb 2023 15:01:35 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > On Mon, 20 Feb 2023 07:55:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >  =20
> > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >   =20
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Will be used in the next commit to set a deadline on fences that =
an
> > > > > atomic update is waiting on.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++=
++
> > > > >  include/drm/drm_vblank.h     |  1 +
> > > > >  2 files changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_v=
blank.c
> > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct dr=
m_crtc *crtc,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > >
> > > > > +/**
> > > > > + * drm_crtc_next_vblank_time - calculate the time of the next vb=
lank
> > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > + * @vblanktime: pointer to time to receive the next vblank times=
tamp.
> > > > > + *
> > > > > + * Calculate the expected time of the next vblank based on time =
of previous
> > > > > + * vblank and frame duration   =20
> > > >
> > > > Hi,
> > > >
> > > > for VRR this targets the highest frame rate possible for the current
> > > > VRR mode, right?
> > > >   =20
> > >=20
> > > It is based on vblank->framedur_ns which is in turn based on
> > > mode->crtc_clock.  Presumably for VRR that ends up being a maximum? =
=20
> >=20
> > I don't know. :-) =20
>=20
> At least for i915 this will give you the maximum frame
> duration.

Really maximum duration? So minimum VRR frequency?

> Also this does not calculate the the start of vblank, it
> calculates the start of active video.

Oh indeed, so it's too late. What one would actually need for the
deadline is the driver's deadline to present for the immediately next
start of active video.

And with VRR that should probably aim for the maximum frame frequency,
not minimum?



Thanks,
pq

>=20
> >=20
> > You need a number of clock cycles in addition to the clock frequency,
> > and that could still be minimum, maximum, the last realized one, ...
> >=20
> > VRR works by adjusting the front porch length IIRC.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> > > BR,
> > > -R
> > >=20
> > >  =20
> > > >
> > > > Thanks,
> > > > pq
> > > >   =20
> > > > > + */
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime)
> > > > > +{
> > > > > +     unsigned int pipe =3D drm_crtc_index(crtc);
> > > > > +     struct drm_vblank_crtc *vblank =3D &crtc->dev->vblank[pipe];
> > > > > +     u64 count;
> > > > > +
> > > > > +     if (!vblank->framedur_ns)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     count =3D drm_vblank_count_and_time(crtc->dev, pipe, vblank=
time);
> > > > > +
> > > > > +     /*
> > > > > +      * If we don't get a valid count, then we probably also don=
't
> > > > > +      * have a valid time:
> > > > > +      */
> > > > > +     if (!count)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     *vblanktime =3D ktime_add(*vblanktime, ns_to_ktime(vblank->=
framedur_ns));
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> > > > > +
> > > > >  static void send_vblank_event(struct drm_device *dev,
> > > > >               struct drm_pending_vblank_event *e,
> > > > >               u64 seq, ktime_t now)
> > > > > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > > > > index 733a3e2d1d10..a63bc2c92f3c 100644
> > > > > --- a/include/drm/drm_vblank.h
> > > > > +++ b/include/drm/drm_vblank.h
> > > > > @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_devi=
ce *dev);
> > > > >  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> > > > >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > > >                                  ktime_t *vblanktime);
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime);
> > > > >  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> > > > >                              struct drm_pending_vblank_event *e);
> > > > >  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,   =20
> > > >   =20
> >  =20
>=20
>=20
>=20


--Sig_/Yl_frWmpDj_N_KKHgXd/ud5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP0wwUACgkQI1/ltBGq
qqcZkA/8Cxrs2faxApuOpiVvmEfxySmnnriqWQvI73A1Rr/BzSKXolQsb1ZRq86W
dMq+pc4YmDY3E3ffoZpMSDaQEcl9FxGx6It1FeqV0eSEHV2cmWidGNFi50+s0Wzj
KXU2DNlNwG8bFaMEM0d3G1pIpV46sV4jCEBZ5cl4qVuNpJuFu3TGHzdD3ZvL/MhT
gAyVyEj7cocuTFFEAezd2evkbyRdRUsXX98hjPoJuVi8L9Rz0WRc0FcFgucZNcEt
Y72QQgsyjEzmXsO1M0oX/5hNEWAHlp/hMOjgXT35d7ud4NLpn4cUNeegkR2jqjKu
V4MbaufRxZLBnAF77IJHdD1UsymLisA/CVTw9xBgtjgB7WKBS+9x6676cr0amWZV
tZRoSbnPf32EHIWiTDgSvCfVopE2WvIoCnHbhBwpLI4Lza4oI9QnZWItMK9c5m2k
/ilaB6X/rEPtd+NOcZL2bO/3nTFOdcM9ipWwd/Jquj/9apIA8hoMa2Fw5HZqjiym
VmY7/itis8iR6EB8vy48e45GrY+RcpLRT3BCHTG7XJ1PuQna2uWME5eBGe3dNISu
5ZDXtfk/O02jXWpMaV9jEbIIShqjQIwKaApYfOrgIDGswogZiua8l8A54xoO5R0E
qmKdiaN9VnADXv1SoykOo61fGro8pY0Q64wk8iSn1GGdq5XTWOo=
=LgjZ
-----END PGP SIGNATURE-----

--Sig_/Yl_frWmpDj_N_KKHgXd/ud5--
