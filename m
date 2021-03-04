Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81C32CEA5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 09:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BDC6E901;
	Thu,  4 Mar 2021 08:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1F889CF3;
 Thu,  4 Mar 2021 08:42:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z11so41771814lfb.9;
 Thu, 04 Mar 2021 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=mCUvXtDbpYOmVLpGyxtriKsie7qQBaDkkpJAR4b0GYI=;
 b=AKxBQiYTyrirpvLqGRQN0cJ3rA8sXCmI7M+wf8I3B+W0S6C+h01pH+r8eZ3pYJTOsR
 xnoCuc03cIYxCzb2X3gr9x5dGkHesoN47XELfqDlPqaYV4qNteqcdfFSUdYLgd9CYzYF
 EGELzfc6R2LRTT+Era2ZoPQVWIhnrEcOg5jnCF1Qz2iw1IBUX5SN5FZrAGVKiIHZHsFc
 +aSFvrm/AT1gd7E5je7UbznVLs0atsu+dRGPJCMLUtikx9OHa9ul3QLDHhcc+V1U34zN
 m43zbLxvMESWspeFFzR1PiFJvkNdJwru3smjiV6k9IMGoaot/CdxZaKTyr8bo64qV7in
 VQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=mCUvXtDbpYOmVLpGyxtriKsie7qQBaDkkpJAR4b0GYI=;
 b=H0OzTViyf2rgzUlbZi2cJE8p9o05O4ngd3XLBCpYjjaeY9nHSpDCE/X8xxGsN8eizD
 88m6jCeqdIpN68ux4V51zV2ZRHzRfQnSduYvmED+FzcEmPCvOy5dqt4rhI4Cwb/GEZ1P
 +v+jdYi1aAF4IbB6/Y3HC4yVUA9tGcQ/jbnYeb3YfXNvKrQfGTl8X/79fZFydhsRf/wE
 GjzVds+iy/K2cqnh+j/p8z3qBhC6KMMwyFrmvfGy/dhkuhezBtZuHDb//6anwDAsO4e4
 Vwr7kWSjQBhcu/WtSzPuKrAS/vwjyH1slT6EruwedfIIImhEa6hqMowReX2zQ9TV2Ep9
 +lYg==
X-Gm-Message-State: AOAM531f3c0KV3b7QLMmfbsPIhS1MP73g4rf1X+JpwoesN9wxo8ZRE/1
 g7OQO57b7zN49fNnCKc4NmM=
X-Google-Smtp-Source: ABdhPJy0KC4m50xJdjI43gjSGC2IrbFgY9DBzNv50vRzlaKoo8/7uxdNuGQB474G5AcPIhCpteiEug==
X-Received: by 2002:a05:6512:31d0:: with SMTP id
 j16mr1694036lfe.467.1614847346826; 
 Thu, 04 Mar 2021 00:42:26 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d11sm1077200lfs.291.2021.03.04.00.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 00:42:26 -0800 (PST)
Date: Thu, 4 Mar 2021 10:42:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20210304104223.6b3490bc@eldfell>
In-Reply-To: <20210303204433.GA15819@labuser-Z97X-UD5H>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell>
 <20210303204433.GA15819@labuser-Z97X-UD5H>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1369322366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1369322366==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eKQv8/pHSZT3FZUwsOzSPdK"; protocol="application/pgp-signature"

--Sig_/eKQv8/pHSZT3FZUwsOzSPdK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Mar 2021 12:44:33 -0800
"Navare, Manasi" <manasi.d.navare@intel.com> wrote:

> On Wed, Mar 03, 2021 at 10:47:44AM +0200, Pekka Paalanen wrote:
> > On Tue,  2 Mar 2021 12:41:32 -0800
> > Manasi Navare <manasi.d.navare@intel.com> wrote:
> >  =20
> > > In case of a modeset where a mode gets split across mutiple CRTCs
> > > in the driver specific implementation (bigjoiner in i915) we wrongly =
count
> > > the affected CRTCs based on the drm_crtc_mask and indicate the stolen=
 CRTC as
> > > an affected CRTC in atomic_check_only().
> > > This triggers a warning since affected CRTCs doent match requested CR=
TC.
> > >=20
> > > To fix this in such bigjoiner configurations, we should only
> > > increment affected crtcs if that CRTC is enabled in UAPI not
> > > if it is just used internally in the driver to split the mode. =20
> >=20
> > Hi,
> >=20
> > I think that makes sense to me. Stealing CRTCs that are not currently
> > used by the userspace (display server) should be ok, as long as that
> > is completely invisible to userspace: meaning that it does not cause
> > userspace to unexpectedly e.g. receive or miss per-crtc atomic
> > completion events. =20
>=20
> Yes since we are only doing atomic_check_only() here, the stolen

But the real not-test-only commit will follow if this test-only commit
succeeds, and keeping the guarantees for the real commit are important.

> crtc is completely invisible to the userspace and hence that is=20
> indicated by uapi.enable which is not true for this stolen
> crtc. However if allow modeset flag set, then it will do a full
> modeset and indicate the uapi.enable for this stolen crtc as well
> since that cannot be used for other modeset requested by userspace.
>=20
> >=20
> > Can that also be asserted somehow, or does this already do that? =20
>=20
> Not clear what you want the assertion for? Could you elaborate

As assertion that when the real atomic commit happens and then
completion events are fired, they match exactly the affected crtcs mask.

I understand this may be off-topic for this particular patch, but since
we are discussing the topic, such checks would be really nice. I'm
curious if such checks already exist.


Thanks,
pq

>=20
> Manasi
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > > Cc: Daniel Stone <daniels@collabora.com>
> > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomi=
c.c
> > > index 5b4547e0f775..d7acd6bbd97e 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm_atomic_st=
ate *state)
> > >  		}
> > >  	}
> > > =20
> > > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > -		affected_crtc |=3D drm_crtc_mask(crtc);
> > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > +		if (new_crtc_state->enable)
> > > +			affected_crtc |=3D drm_crtc_mask(crtc);
> > > +	}
> > > =20
> > >  	/*
> > >  	 * For commits that allow modesets drivers can add other CRTCs to t=
he =20
> >  =20
>=20
>=20


--Sig_/eKQv8/pHSZT3FZUwsOzSPdK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBAnW8ACgkQI1/ltBGq
qqcFCw/9G1+ZHHKwPAT0dabHK9NIdG4MjGQMwmZMc9gNBca3eUt7CgNS88sTFmY1
Zfej90sWSmYtpo6tlrFrQtwbxQ8x3XV6DEaEEfyh/JQzDLrunvFQ2kaK1hAyrd0P
aOuzwXKGYZjwsdNJsKsv6GjdviYT+qtRJFLwYSl9AnJcgxg16wrqEiwlF1Rt3p15
cDpLK46FQsUvUBrU2xAv/7kg25+M4hAEPYnS2aTEi3AFMs2sJDpYhZEyIyjqsjng
OM3b8f4vp97125B+ixqMCY3RayBVZuItpO/ELidpu7bfHkfBl9ZscDXY8QxVcfHm
r2m9D1bpHRCEKWkoeyTV0ac9MnhXD0lrsBPsB//UAku15Fblcros4KZc10DoTz79
qBlJBb0kCp54BQyIVFu/n9R7IQ7lYXK9I/t2BTxjExJEaoE81MVAefQ2T3ErgzZX
FyyDtWbHTgDYDlpBnB5gFnQS/AlAFcGqKzHMytXqVj4y9xg6PWdP3u0fuspey+uy
A4btQbEnkJTIxBctswLk0yRNYxq3EAF54Vsl2NUhjGFpIcFGZ+JxpuyvGBkGF7aU
5ycC52AGo1s3uM8Bg7nyfivK3flrQwvogLjmBMD8MYxbC+8lMASXyX5TfTseFmpT
fTyA1ggWSpKqYEpCRTe5yC0a/9XoJptO4vdfLUdNShJ1O9bV3j4=
=yCWz
-----END PGP SIGNATURE-----

--Sig_/eKQv8/pHSZT3FZUwsOzSPdK--

--===============1369322366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1369322366==--
