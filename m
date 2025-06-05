Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA58ACEAD9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8E610E264;
	Thu,  5 Jun 2025 07:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Bz76LnNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4A810E264;
 Thu,  5 Jun 2025 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749108681;
 bh=O6GF6Ib361pAcexbPWlC6Cj4s9T/F2pFfibpfjT68uw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bz76LnNXmpLyA1/OYgMiYNjMH4CuH5uLwSE2x/AYtPD2JkHtyuy3TVfnSWdoZ6cqi
 rP9I//OBXzk+WYVOVH+P5HbsQvvZvV2X+y2taVJcIhGpHM+seGMWeskWyDDyijhaae
 HopK0Zwqaqwop2yuDkCs9ZlKtEqKtJse/UDIRrqXzqVDfxzS5JacGFJ/cH7+sNtNat
 a2oCJXaIzKXqBQRc19T5GE+udKGIueZ4BRwHktVdaIK8rppqOB7Vg1ubIOjqVgXUgZ
 A74VQH3KvB3lDGRgUgldWP9nyo31Bd4lanXe26/BTvf+/k9paic9hgz876njAFZ2iz
 CIEiBHSiHEFLg==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CBBF017E046C;
 Thu,  5 Jun 2025 09:31:20 +0200 (CEST)
Date: Thu, 5 Jun 2025 10:30:57 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Simon Ser
 <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
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
Message-ID: <20250605103057.4e7b5ceb@eldfell>
In-Reply-To: <DM4PR11MB636037A3F51B4062BE199C4AF46CA@DM4PR11MB6360.namprd11.prod.outlook.com>
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
 <20250603135108.603fa6e6@eldfell>
 <f80f66d1-38a8-4e45-ba63-ae2427c91317@amd.com>
 <DM4PR11MB636037A3F51B4062BE199C4AF46CA@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EL78yUqFqWIeIF4F2yE3w7e";
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

--Sig_/EL78yUqFqWIeIF4F2yE3w7e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Jun 2025 18:59:22 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Wednesday, June 4, 2025 1:57 AM
> > To: Pekka Paalanen <pekka.paalanen@collabora.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Cc: Simon Ser <contact@emersion.fr>; Alex Hung <alex.hung@amd.com>; dri-
> > devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> > leo.liu@amd.com; ville.syrjala@linux.intel.com; mwen@igalia.com;
> > jadahl@redhat.com; sebastian.wick@redhat.com; shashank.sharma@amd.com;
> > agoins@nvidia.com; joshua@froggi.es; mdaenzer@redhat.com;
> > aleixpol@kde.org; xaver.hugl@gmail.com; victoria@system76.com;
> > daniel@ffwll.ch; quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
> > quic_abhinavk@quicinc.com; marcan@marcan.st; Liviu.Dudau@arm.com;
> > sashamcintosh@google.com; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
> > Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
> >=20
> >=20
> >=20
> > On 2025-06-03 06:51, Pekka Paalanen wrote: =20
> > > On Tue, 3 Jun 2025 08:30:23 +0000
> > > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > > =20
> > >>> -----Original Message-----
> > >>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >>> Sent: Friday, May 30, 2025 7:28 PM
> > >>> To: Shankar, Uma <uma.shankar@intel.com>
> > >>> Cc: Simon Ser <contact@emersion.fr>; Harry Wentland
> > >>> <harry.wentland@amd.com>; Alex Hung <alex.hung@amd.com>; dri-
> > >>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
> > >>> gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> > >>> leo.liu@amd.com; ville.syrjala@linux.intel.com;
> > >>> pekka.paalanen@collabora.com; mwen@igalia.com; jadahl@redhat.com;
> > >>> sebastian.wick@redhat.com; shashank.sharma@amd.com;
> > >>> agoins@nvidia.com; joshua@froggi.es; mdaenzer@redhat.com;
> > >>> aleixpol@kde.org; xaver.hugl@gmail.com; victoria@system76.com;
> > >>> daniel@ffwll.ch; quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
> > >>> quic_abhinavk@quicinc.com; marcan@marcan.st; Liviu.Dudau@arm.com;
> > >>> sashamcintosh@google.com; Borah, Chaitanya Kumar
> > >>> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
> > >>> Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT
> > >>> type
> > >>>
> > >>> On Thu, 22 May 2025 11:33:00 +0000
> > >>> "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > >>> =20
> > >>>> One request though: Can we enhance the lut samples from existing
> > >>>> 16bits to 32bits as lut precision is going to be more than 16 in c=
ertain =20
> > hardware. =20
> > >>> While adding the new UAPI, lets extend this to 32 to make it future=
 proof. =20
> > >>>> Reference:
> > >>>> https://patchwork.freedesktop.org/patch/642592/?series=3D129811&re=
v=3D4
> > >>>>
> > >>>> +/**
> > >>>> + * struct drm_color_lut_32 - Represents high precision lut values
> > >>>> + *
> > >>>> + * Creating 32 bit palette entries for better data
> > >>>> + * precision. This will be required for HDR and
> > >>>> + * similar color processing usecases.
> > >>>> + */
> > >>>> +struct drm_color_lut_32 {
> > >>>> +	/*
> > >>>> +	 * Data for high precision LUTs
> > >>>> +	 */
> > >>>> +	__u32 red;
> > >>>> +	__u32 green;
> > >>>> +	__u32 blue;
> > >>>> +	__u32 reserved;
> > >>>> +}; =20
> > >>>
> > >>> Hi,
> > >>>
> > >>> I suppose you need this much precision for optical data? If so,
> > >>> floating-point would be much more appropriate and we could probably=
 keep =20
> > 16-bit storage. =20
> > >>>
> > >>> What does the "more than 16-bit" hardware actually use? ISTR at
> > >>> least AMD having some sort of float'ish point internal pipeline?
> > >>>
> > >>> This sounds the same thing as non-uniformly distributed taps in a L=
UT.
> > >>> That mimics floating-point input while this feels like floating-poi=
nt output of a =20
> > LUT. =20
> > >>>
> > >>> I've recently decided for myself (and Weston) that I will never
> > >>> store optical data in an integer format, because it is far too
> > >>> wasteful. That's why the electrical encodings like power-2.2 are so=
 useful, not =20
> > just for emulating a CRT. =20
> > >>
> > >> Hi Pekka,
> > >> Internal pipeline in hardware can operate at higher precision than
> > >> the input framebuffer to plane engines. So, in case we have optical
> > >> data of 16bits or 10bits precision, hardware can scale this up to
> > >> higher precision in internal pipeline in hardware to take care of
> > >> rounding and overflow issues. Even FP16 optical data will be normali=
zed and =20
> > converted internally for further processing. =20
> > >
> > > Is it integer or floating-point?
> > > =20
> >=20
> > For AMD the internal format is floating point with slightly higher prec=
ision than
> > FP16.
> >  =20
> > > If we take the full range of PQ as optical and put it into 16-bit
> > > integer format, the luminance step from code 1 to code 2 is 0.15 cd/m=
=C2=B2.
> > > That seems like a huge step in the dark end. Such a step would
> > > probably need to be divided over several taps in a LUT, which wouldn't
> > > be possible.
> > > =20
> >=20
> > Right, and with 32-bpc we'll get a luminance step size of
> > ~0.0000023 cd/m^2, which seems plenty fine-grained.
> >  =20
> > > In that sense, if a LUT is used for the PQ EOTF, I totally agree that
> > > 16-bit integer won't be even nearly enough precision.
> > >
> > > This actually points out the caveat that increasing the number of taps
> > > in a LUT can cause the LUT to become non-monotonic when the sample
> > > precision runs out. That is, consecutive taps don't always increase in
> > > value.
> > > =20
> > >> Input to LUT hardware can be 16bits or even higher, so the look up
> > >> table we program can be of higher precision than 16 (certain cases 24
> > >> in Intel pipeline). This is later truncated to bpc supported in outp=
ut formats from =20
> > sync (10, 12 or 16), mostly for electrical value to be sent to sink. =20
> > >>
> > >> Hence requesting to increase the container from current u16 to u32,
> > >> to get advantage of higher precision luts. =20
> > >
> > > My argument though is to use a floating-point format for the LUT
> > > samples instead of adding more and more integer bits. That naturally
> > > puts more precision where it is needed: near zero.
> > >
> > > A driver can easily convert that to any format the hardware needs.
> > >
> > > However, it might make best sense for a driver to expose a LUT with a
> > > format that best matches the hardware precision, especially
> > > floating-point vs. integer.
> > >
> > > I guess we may eventually need both 32 bpc integer and 16 (or 32) bpc
> > > floating-point.
> > > =20
> >=20
> > While I like floating point better for representing these things I don'=
t think it's a
> > great idea to pass floating point values via IOCTLs but 32 bpc integer =
values make
> > sense here.
> >  =20
>=20
> Nice, we all are on same page here.

Fine by me!

Thanks,
pq

--Sig_/EL78yUqFqWIeIF4F2yE3w7e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmhBR7EACgkQI1/ltBGq
qqe7vg/9EskSBi2mFlp3lXUqT3zB7DWEnztWyzWtQA4oQqSA8IgQ0HxzCrd8DIpV
lHOFlezlhd3nwi045mxqj2NaYLdu244Ma50w9Y27tt0ZboDBTAi15kPByZEQgfT2
mXa4q/K0V3GP9lzw1d+6e+NOZswlmiVJKjOlD1zkMqgvQgA4WFLPeideZ+UP07Wz
PlrkRmW/KcoudbL4A5mQ7FQJpY362AmhabyYc99lBwW7B7rS0Y3PP6rrTIeYeJoX
rLGzQxjCW5w+u4z6hi+LZlj593t8vJX3vKHzaXPF9iZb9eMWQ6MCzk5x/ljz6thB
DvwA3fgSfwdoVir64Y21c8L+2iiTvwnJrVGOeFEyjjUjZSG2OOsz+VqA1yQIvKpd
rgC7EpiqfUJNug9S7a/+dtmJbLRPIVQIEfd3NqBwDOYaCcjs452B+dRh+4uoHhjg
9e8lgbMxL1fngqONlRpztpVMlU6dnzwt59mku/YzZfjznYeH6iTWozWnDUf63RLJ
TZubqKeZKKkXmhmtJSIh5yl+OLIOe9rJsASJwky4SM30xzh0fyQQosvUutVEuzGI
kzYCONg9YcWMzzoTpAOuhyY86zpIsN69XwVuvLCbdvUKBsYvvbbnexiYtfqgcfrV
EYyya88adwDxUavPLmFpmPMH7eCj1rY7DAVnITUM3cz/O66/qZg=
=gZg4
-----END PGP SIGNATURE-----

--Sig_/EL78yUqFqWIeIF4F2yE3w7e--
