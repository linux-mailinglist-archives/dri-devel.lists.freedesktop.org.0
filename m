Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF18CCCAF0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F6E10E12E;
	Thu, 18 Dec 2025 16:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="R4qefrpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch
 [79.135.106.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A3D10E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1766074554; x=1766333754;
 bh=wcJGa3FpQvqKYSuDBQebeLYMX7Mta1CDqB/hhA7sH88=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=R4qefrpkg/xne2aKHbfQI0zLMqyD5Jl03iYsxerjUa3ycEJXnZScRBnik+nuHB1lJ
 Yd47xyinwzd3IZtgDxDSqqNaymKcf30kfqXZwkK6L37rtHmBAXiCS5xrJjIpYzdm7y
 avOnmc0gaBOmXCQ1IaOGQyxNodxGm6nrKLOznO5HJM9ULJNUeWXU07jlM6iaoMZ+KK
 9ytQZhFYZe8ewQwiEe9igvwcpcGdUCYMieNwtFBT25+k60eyou36Mya6z1Pf5rbnHv
 5kSbiZadoJ2Tr9UkJgUS4Wo/lDsiielC+ljGpvDlxbOl9ObA+cIrUvZkXymWLGOpRQ
 eGVFTKTC+4/rg==
Date: Thu, 18 Dec 2025 16:15:49 +0000
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 pekka.paalanen@collabora.com, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, swati2.sharma@intel.com,
 alex.hung@amd.com, jani.nikula@intel.com, suraj.kandpal@intel.com
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Message-ID: <k3LqbZf-MaL96Q4M9Gi2ulFVSAPs8qKk3J7vvjzvqFwqbI-v8rlIi4f2Sr5KvVmB04UZXAZIPaLZHADswcIMESDOWilrOBNOLtRhlUcoowk=@emersion.fr>
In-Reply-To: <31921238-6621-40d5-94b5-8ba3e5f9d40c@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com> <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
 <k4mMdQv6X-RIzc4veUD5pP2oD1KGp1Tx6ifJM6S8W3nrowRPz275vsfcNUHeflvxZaISPaM_e861Q-1rO1jnV8bNNmOdPJ3tyS3GVbnpbao=@emersion.fr>
 <31921238-6621-40d5-94b5-8ba3e5f9d40c@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 8e534f4916e09db9fe19c8ade093505a387cb3b3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Monday, December 15th, 2025 at 09:43, Borah, Chaitanya Kumar <chaitanya.=
kumar.borah@intel.com> wrote:

> On 12/12/2025 11:55 PM, Simon Ser wrote:
>=20
> > On Friday, December 12th, 2025 at 18:47, Borah, Chaitanya Kumar chaitan=
ya.kumar.borah@intel.com wrote:
> >=20
> > > > > +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> > > > > + const struct intel_plane_state *plane_state)
> > > > > +{
> > > > > + struct intel_display *display =3D to_intel_display(plane_state)=
;
> > > > > + struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crt=
c);
> > > > > +
> > > > > + if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
> > > > > + glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
> > > > > ^^^^^^^^^^^^
> > > >=20
> > > > And this looks like a pretty major fail. Why is the 3D LUT stored i=
n
> > > > the plane state when it's a pipe level thing?
> > >=20
> > > With DISPLAY_VER(display) >=3D 35, 3DLUT can be attached to a plane.
> > >=20
> > > (Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the =
HW
> > > to the userspace right now (through the new plane color pipeline uapi=
).
> > > Therefore, it lies in the plane state.
> > >=20
> > > However, there are (soonish)plans to adopt the color pipeline for crt=
cs
> > > too. Once that happens, it needs to be handled a bit more carefully. =
A
> > > potential approach is to allow userspace to program the block with a
> > > first come first served semantics and fail the commit if it tries to =
set
> > > 3DLUT both on plane and crtc in the same commit.
> >=20
> > The plane 3D LUT must only be used before blending. Any pipe-level
> > post-blending 3D LUT hardware block is not suitable to implement plane
> > colorops.
>=20
> Same 3D LUT block is shared across pipe and planes. When we do end up
> implementing the pipe color pipeline we would like the 3DLUT exposed at
> the pipe stage too.

Ah, I see! And there is a switch in the hw to configure whether it's
applied pre- or post-blending?

> However, there is no good way to do it in the current color pipeline
> UAPI (atleast that I know of). One suggestion from Harry (discussed in
> the hackfest) was to list the pipelines in order of preference of the
> driver.
>=20
> Considering we prefer the pre-blend 3DLUT over a post blend one, it
> would mean that we don't expose the 3DLUT on the first pipeline on the
> crtc but do it in the second one. (I am not sure how well it scales thoug=
h)
>=20
> I have considered other solutions like introducing a new property say
> "muxed" which could be used with Bypass to indicate if the current color
> block is being used in another part of the pipeline.

I think two pipelines + making commits fail when they use conflicting
colorops is the way to go.

If it turns out to be a generalized issue with more hardware and the
above solution isn't enough for user-space, we can think of introducing
a way to describe the limitation.
