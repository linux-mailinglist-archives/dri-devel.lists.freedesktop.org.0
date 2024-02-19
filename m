Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01B85A2C9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB6510E358;
	Mon, 19 Feb 2024 12:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="csbnNj6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580D10E358;
 Mon, 19 Feb 2024 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JaeyaROe1f4Zrix0WXESY3j/JYRuGeJy+nfml8UVj0o=; b=csbnNj6LDlHtGWbxK+6qA8KJp4
 3d/ocxTJNfXcBmIWX5076xJ9Bfbv1dM+acIEu4h/gDCzX3bcXH2BM4KEZkx33jFHOGcPUt7UcG8Ww
 VQiZn3n2EnAjjzuLOupOXFtR+rX3U2s8ZSuTqvhc+txC2VYM7oatB1safji+7H0FHJP1/yMW6Mwv5
 s/71gDiuHyrCVNwjcH2s2gKSnd8H2jC9skZAHMYG6PZvid87tUwTa2lBhYKSlrqX4Q8oG5aiXajIe
 5fr+Mtxzc1xnoaVUQy715zzwr6KK4P9AHVFWFZUvwkM4ezduM2E8NB9nAFnUMTjvcxI3eftjncCaQ
 VABRR/oA==;
Received: from [194.136.85.206] (port=34518 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rc2MO-0002I0-1P;
 Mon, 19 Feb 2024 14:03:01 +0200
Date: Mon, 19 Feb 2024 14:02:51 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>
Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add
 capabilities to colorop
Message-ID: <20240219140251.59d730cd@eldfell>
In-Reply-To: <DM4PR11MB63603152935C305151D259AFF4512@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-18-uma.shankar@intel.com>
 <20240213113727.22f9c8e5@eldfell>
 <DM4PR11MB636037556D1EF1ACC2A70629F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20240214110340.477e9df3@eldfell>
 <DM4PR11MB63603152935C305151D259AFF4512@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sx.YA6uiOYhFK3j5ulS1sf7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/sx.YA6uiOYhFK3j5ulS1sf7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Feb 2024 10:34:19 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> > Sent: Wednesday, February 14, 2024 2:34 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: ville.syrjala@linux.intel.com; intel-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; contact@emersion.fr; harry.wentland@amd.co=
m;
> > mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup=
.net;
> > marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> > sean@poorly.run
> > Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add capab=
ilities
> > to colorop
> >=20
> > On Wed, 14 Feb 2024 07:28:37 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > > Of Pekka Paalanen
> > > > Sent: Tuesday, February 13, 2024 3:07 PM
> > > > To: Shankar, Uma <uma.shankar@intel.com>
> > > > Cc: intel-gfx@lists.freedesktop.org;
> > > > dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> > > > contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> > > > jadahl@redhat.com; sebastian.wick@redhat.com;
> > > > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > > > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > > > victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> > > > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com;
> > > > arthurgrillo@riseup.net; marcan@marcan.st; Liviu.Dudau@arm.com;
> > > > sashamcintosh@google.com; sean@poorly.run
> > > > Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add
> > > > capabilities to colorop
> > > >
> > > > On Tue, 13 Feb 2024 12:18:24 +0530
> > > > Uma Shankar <uma.shankar@intel.com> wrote:
> > > > =20
> > > > > This defines the lut segments and create the color pipeline
> > > > >
> > > > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > > > Signed-off-by: Chaitanya Kumar Borah
> > > > > <chaitanya.kumar.borah@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_color.c | 109
> > > > > +++++++++++++++++++++
> > > > >  1 file changed, 109 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > > > index e223edbe4c13..223cd1ff7291 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > > > @@ -3811,6 +3811,105 @@ static const struct intel_color_funcs =20
> > > > ilk_color_funcs =3D { =20
> > > > >  	.get_config =3D ilk_get_config,
> > > > >  };
> > > > >
> > > > > +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> > > > > +	/* segment 1 */
> > > > > +	{
> > > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > > +				DRM_MODE_LUT_NON_DECREASING), =20
> > > >
> > > > Hi Uma,
> > > >
> > > > is it a good idea to have these flags per-segment?
> > > >
> > > > I would find it very strange, unusable really, if REFLECT_NEGATIVE
> > > > applied on some but not all segments, for example. Is such
> > > > flexibility really necessary in the hardware description? =20
> > >
> > > Hi Pekka,
> > > Idea to have these flags is to just have some option in case there are
> > > some differences across segments. Most cases this should not be the
> > > case, just helps to future proof the implementation.
> > >
> > > Based on how the community feels on the usability of it, we can take a
> > > call on the flags and the expected interpretation for the same. We ar=
e open for =20
> > suggestions on the same. =20
> > > =20
> > > > =20
> > > > > +		.count =3D 128,
> > > > > +		.input_bpc =3D 24, .output_bpc =3D 16, =20
> > > >
> > > > The same question about input_bpc and output_bpc. =20
> > >
> > > Same for these as well, userspace can just ignore these if no usage.
> > > However, for some clients it may help in Lut computations.
> > > The original idea for the structure came from Ville (missed to mention
> > > that in cover letter, will get that updated in next version).
> > >
> > > @ville.syrjala@linux.intel.com Please share your inputs on the usabil=
ity of these =20
> > attributes.
> >=20
> > Userspace will always need to evaluate whether each segment is good eno=
ugh
> > individually, so maybe it's not that big deal.
> >=20
> > Ignoring these is not an option for userspace, because that would mean =
userspace
> > does not know what it is getting. If UAPI contains a parameter, then th=
e onus is on
> > userspace to ensure the value is acceptable. =20
>=20
> Got your point, the parameters, and expectations with it should be clearl=
y defined.
> Here it just means what is the bpc which is fed to the color block and at=
 what bpc
> results come out after rounding and truncation. This information may help=
 in
> computing the LUT co-efficients and get better accuracy.
>=20
> Having said that, we are not using it as of now in the IGT tests. We can =
discuss the
> usability and usefulness of this attribute for userspace, based on recomm=
endation
> we can adopt or drop this.

Hi Uma,

this discussion applies much more to the flags than bpc.

Bpc is interesting to userspace, so I do think it should be kept, and
extended to all colorops as possible.

> > > > > +		.input_bpc =3D 24, .output_bpc =3D 16, =20
> > > > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > > > +		.min =3D 0, .max =3D (1 << 24) - 1,

Btw. does this say, that normalized input value range is
[0.0, 1.0], and output values must be in [0.0, 256.0]?

That the divisor is (1 << bpc) - 1, and not (1 << bpc)?

> > > > > +	},
> > > > > +	/* segment 2 */
> > > > > +	{
> > > > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > > > +				DRM_MODE_LUT_INTERPOLATE |
> > > > > +				DRM_MODE_LUT_REUSE_LAST |
> > > > > +				DRM_MODE_LUT_NON_DECREASING),
> > > > > +		.count =3D 1,
> > > > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24, =20
> > > >
> > > > What if there is a gap or overlap between the previous segment .end
> > > > and the next segment .start? Is it forbidden? Will the kernel common
> > > > code verify that drivers don't make mistakes? Or IGT? =20
> > >
> > > This is just to help give some reference to userspace.  As of now,
> > > driver trusts the values coming from userspace if it sends wrong valu=
es its on =20
> > him and driver can't help much. =20
> > > However, we surely can have some sanity check like non decreasing lut=
s etc. to =20
> > driver.
> >=20
> > But what will guarantee that the driver provided values are consistent?
> > That they actually describe a template of a well-formed sampled curve? =
If they
> > are not consistent, userspace cannot use the colorop.
> > Whose responsibility is it to ensure the consistency? =20
>=20
> Since the driver will be privileged, I guess userspace should believe the=
 values are
> sane as reported by the properties. This is as for any other hardware cap=
abilities.
> Also, its immutable so userspace will not be able to tweak it making it s=
afe.

It is still possible for the driver to give an utter nonsense blob.
Where should be the tests to prevent that, in IGT or DRM core?

> > We have a few examples of drivers getting descriptive values like these=
 simply
> > wrong until DRM common code started sanity-checking them, the bitmasks =
of
> > possible_clones and possible_crtcs for example. =20
>=20
> We can implement some helpers to catch basic abnormalities with LUT repor=
ting
> while property creation itself.  Like decreasing luts, not matching the r=
eported flags etc.

I really meant *drivers* getting the *advertisement* values wrong.
Claiming that a connector/encoder is compatible with CRTC index 17 when
such CRTC does not exist is a real example. Or that all connectors can
be clones with all other connectors, even those that do not exist.

In the case of segmented LUTs, there could be these mistakes for a
two-segment { A, B } description:
- segment A has REFLECT_NEGATIVE, but segment B does not
- segment B normalised start is smaller than segment A normalised end
- there is a gap between segment A normalised end and segment B normalised =
start
- segment A normalised max is smaller than segment B normalised min
- segment sample count is zero (or negative)
- segment max is smaller than segment min

And so on. Something needs to check for these and catch these, before a
driver with them is released or even merged.

Think of it as reversed checks at UAPI boundary where a common
component is checking that drivers get it right.

>=20
> > There should also be DRM common code to verify that userspace provided =
data
> > matches the segmented LUT description rather than drivers just trusting=
 it. If it
> > doesn't match, the atomic commit must fail rather than silently malfunc=
tion. The
> > same with programming hardware: if hardware does not produce the intend=
ed
> > result from a given segmented LUT configuration, the atomic commit must=
 fail
> > instead of malfunction. =20
>=20
> Yes, we can have some checks in driver for sanity of userspace provided v=
alues.
> Things like LUTs not following the flags and capabilities reported, going=
 beyond
> the range etc. However the actual values and computation of the same has =
to be
> userspace responsibility, if the co-efficients go wrong then responsibili=
ty of the artifact
> should be on the client/compositor who is controlling it (permission can =
be controlled
> so that only allowed userspace can be able to change color setttings)

Naturally. A driver cannot know if the values are correct for what
userspace intends to do, but the DRM core can check that the values fit
the segmented LUT description that the driver advertised.

Permission? Permissions are already controlled by the DRM master
mechanic.

> > >
> > > Ideally LUT values should not overlap, but we can indicate this
> > > explicitly with flag to hint the userspace (for overlap or otherwise)=
 and also get =20
> > a check in driver for the same.
> >=20
> > Sorry? How could overlapping segments ever work? Or segments with a gap
> > between them? =20
>=20
> I have not seen overlapping luts in segments, we can take a call if all v=
endors align.
>=20
> > If segments overlap, what's the rule for choosing which segment to use =
for an
> > input value hitting both? The segments can disagree on the result.
> >=20
> > If there are gaps, what is the rule how to handle an input value hittin=
g a gap? =20
>=20
> This can be brainstormed, if any usescase like this exists.

These questions were supposed to make you think and realise
that overlapping/gapped segments make absolutely no sense at all by
pointing out the problems they would cause as an interface description.

Even if hardware had literally overlapping segments, then the driver
should advertise non-overlapping segments that match what the hardware
will achieve.

If hardware had literally gaps between segments, then... either the
hardware cannot be fully used, or the driver will manufacture a
description without gaps that matches hardware behaviour.


Thanks,
pq

--Sig_/sx.YA6uiOYhFK3j5ulS1sf7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXTQ2sACgkQI1/ltBGq
qqcb+RAAqTo/LeFpOi4DjI4Gw5kvRtLaoLrttsCAc+Bgt5sxoXYq8qYxTEBDfiYb
3KV3KTLcfgjekh6XCkynnUnMs9TP6UDRo6M6w7BbE9EBFjenQM6lRNe3On6uCxHa
dTzWrzrz0QHca58OH4nue/d4pHcuEU+3dUCr5/SY6t3AuYVagZy48MZSyVT2gGGj
IFPLtVg5DIF0lonY2VWQCK/kay+nFrhSmh26x1fg8d2vwhrBAmWFFmiQSyWASz2s
1CNQr2VHbRrXsQzJdBp6A2zyGpdw5jdY6KKuJDt2waMNcatxxGAvoM+aIXSNns6c
+tW56tTiBIUt/l/zv122y9q6GpNGJxA/q+RoBgACix8wjTFlBLLylQPemMFOdOFv
U23SCrT1EsEF/5wc6O9+dLHuqKY3Kb8p0tB161g41jz7/zFIldQpP15CS4RS3K6h
EmovoXfD3GR9RVbL97t4gn5cELAighocTkwtYQJWvQoF9JYCQJnC/g3t+Bvs6ZTz
AId7n4OpOjb4sFT3H0+RyjIV6rMsad7H/YFO6AKlexrwxmWbLHA62uR2iGQJcuW2
dfZB7yFsTgI+Q8aMishoMB5kBiW/+vT+qsc75O6wG4pm1SvAXU1CKBLynswijtTq
v/MqWIVXT2EFf6dXTHdQodrZFXIzQyaTEHvdiWiUi1OpUcG6r6o=
=953z
-----END PGP SIGNATURE-----

--Sig_/sx.YA6uiOYhFK3j5ulS1sf7--
