Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EBACC4AD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 12:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95510E6C1;
	Tue,  3 Jun 2025 10:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RCUqy7dV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EF410E6AC;
 Tue,  3 Jun 2025 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748947883;
 bh=l1R9GZqWNizruxzdd8oLnHcO+JoXYyULLOkxArw+8k4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RCUqy7dVzwwTcFboWPbbv42M4z2pTILQ/g70P4mFc2JzLCpL0V5gzdEBhh1oEPo7C
 65tUV+CWXMwz6EAS/hjVXVwbJJwfrwAFTUfrDoVUdSoZaHWsLuY3qGsq0CSOQwfvBR
 TWYk8pcLI2Br2MZjPGUzTyn8l9rryOtIui63J8HYyEeaaR0SBx0jl6Er+GU5xE6tjY
 aCHuJiQeqeiCufch/VFTrSKZIMTe+oZPR1+NZrYbVOUT4V57r/NapOw8lag8l0LNO4
 6aG8zaTzwzAzBzPJJFym6jnEUmC0MwzhxkZu3ZyX333n8khbiMJgcktfmkUFZ1Woi7
 RfK4VPp3ZoeFw==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CB6717E0FDB;
 Tue,  3 Jun 2025 12:51:22 +0200 (CEST)
Date: Tue, 3 Jun 2025 13:51:08 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: Simon Ser <contact@emersion.fr>, Harry Wentland
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <20250603135108.603fa6e6@eldfell>
In-Reply-To: <DM4PR11MB6360BFCB5756A16F38945DE7F46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
 <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250530165818.0e6cb846@eldfell>
 <DM4PR11MB6360BFCB5756A16F38945DE7F46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7R8qp=RIo_YSw9KICy5ic/I";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7R8qp=RIo_YSw9KICy5ic/I
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 08:30:23 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Sent: Friday, May 30, 2025 7:28 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: Simon Ser <contact@emersion.fr>; Harry Wentland
> > <harry.wentland@amd.com>; Alex Hung <alex.hung@amd.com>; dri-
> > devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> > leo.liu@amd.com; ville.syrjala@linux.intel.com; pekka.paalanen@collabor=
a.com;
> > mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> > Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
> > Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
> >=20
> > On Thu, 22 May 2025 11:33:00 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > One request though: Can we enhance the lut samples from existing
> > > 16bits to 32bits as lut precision is going to be more than 16 in cert=
ain hardware. =20
> > While adding the new UAPI, lets extend this to 32 to make it future pro=
of. =20
> > > Reference:
> > > https://patchwork.freedesktop.org/patch/642592/?series=3D129811&rev=
=3D4
> > >
> > > +/**
> > > + * struct drm_color_lut_32 - Represents high precision lut values
> > > + *
> > > + * Creating 32 bit palette entries for better data
> > > + * precision. This will be required for HDR and
> > > + * similar color processing usecases.
> > > + */
> > > +struct drm_color_lut_32 {
> > > +	/*
> > > +	 * Data for high precision LUTs
> > > +	 */
> > > +	__u32 red;
> > > +	__u32 green;
> > > +	__u32 blue;
> > > +	__u32 reserved;
> > > +}; =20
> >=20
> > Hi,
> >=20
> > I suppose you need this much precision for optical data? If so, floatin=
g-point would
> > be much more appropriate and we could probably keep 16-bit storage.
> >=20
> > What does the "more than 16-bit" hardware actually use? ISTR at least A=
MD
> > having some sort of float'ish point internal pipeline?
> >=20
> > This sounds the same thing as non-uniformly distributed taps in a LUT.
> > That mimics floating-point input while this feels like floating-point o=
utput of a LUT.
> >=20
> > I've recently decided for myself (and Weston) that I will never store o=
ptical data in
> > an integer format, because it is far too wasteful. That's why the elect=
rical
> > encodings like power-2.2 are so useful, not just for emulating a CRT. =
=20
>=20
> Hi Pekka,
> Internal pipeline in hardware can operate at higher precision than the in=
put framebuffer
> to plane engines. So, in case we have optical data of 16bits or 10bits pr=
ecision, hardware
> can scale this up to higher precision in internal pipeline in hardware to=
 take care of rounding
> and overflow issues. Even FP16 optical data will be normalized and conver=
ted internally for
> further processing.

Is it integer or floating-point?

If we take the full range of PQ as optical and put it into 16-bit
integer format, the luminance step from code 1 to code 2 is 0.15 cd/m=C2=B2.
That seems like a huge step in the dark end. Such a step would
probably need to be divided over several taps in a LUT, which wouldn't
be possible.

In that sense, if a LUT is used for the PQ EOTF, I totally agree that
16-bit integer won't be even nearly enough precision.

This actually points out the caveat that increasing the number of taps
in a LUT can cause the LUT to become non-monotonic when the sample
precision runs out. That is, consecutive taps don't always increase in
value.

> Input to LUT hardware can be 16bits or even higher, so the look up table =
we program can
> be of higher precision than 16 (certain cases 24 in Intel pipeline). This=
 is later truncated to bpc supported
> in output formats from sync (10, 12 or 16), mostly for electrical value t=
o be sent to sink.
>=20
> Hence requesting to increase the container from current u16 to u32, to ge=
t advantage of higher
> precision luts.

My argument though is to use a floating-point format for the LUT samples
instead of adding more and more integer bits. That naturally puts more
precision where it is needed: near zero.

A driver can easily convert that to any format the hardware needs.

However, it might make best sense for a driver to expose a LUT with a
format that best matches the hardware precision, especially
floating-point vs. integer.

I guess we may eventually need both 32 bpc integer and 16 (or 32) bpc
floating-point.


Thanks,
pq

--Sig_/7R8qp=RIo_YSw9KICy5ic/I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmg+05wACgkQI1/ltBGq
qqeRKg/4zw43UUJlzyeuKGFOfQYVK1NTXcg/bfOcxZWkdCvI7jB3aYBljVHjlnD8
DpHvKYdDtKp+W8ixe9MpPBk+eL2a5wF1Szxo3gX+tiDRExayDaqOMphDXNw8aCAK
YpwaMYcNH9VinSNTeLawOzm/Qs7tVxSIKxNqX4/uNW7YmtmT79Bq/QN+DuB8NvS9
etwZctYYpm3Aa2f2QTyF8uy6GcRwmSh3yKYjEs6lCHjA09ekO8VPKTTzP+YEUTtx
Wv0WzRhVzfm59CX7P2u/sfpl8uq2TSk3I4k2H2oK+lKpj/tbTvXF3kySLHm7UvY5
OKtEZIvRDsZaW85d7aUrTehXgWkxjLFCOp1rgg09DSc8mBPU4Fkvn78j6afl4dZW
n6mmk88TwiNkCIZecb4hzDXdUx6gl5suKGfJlgOe3TQyz05ng2tyd0FyW0/Wzizx
rsy18wsKLdj23XhjqBOR3HitPEx6f+hqNBJVKxazYPl55dNm2SuNS/MeR/bsuqru
C8WtPjr3WFosg1UPVePESvCZW28/FrZvgtnBdP3X3hQKOJH2KypcPGblYboOv4Z0
dRIr+7F7cidi8reLWx3Hwq7LALyrdDsvu5bfE5ofqIiVdrAwy4pJhD9Vcu+wPyHi
JjEvr6nnYN8IFnxhUweiswPbj6RJi15JyaanKfN7afC6zagfFw==
=C9X5
-----END PGP SIGNATURE-----

--Sig_/7R8qp=RIo_YSw9KICy5ic/I--
