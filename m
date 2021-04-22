Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EE368144
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617D86EA84;
	Thu, 22 Apr 2021 13:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC8B6EA84;
 Thu, 22 Apr 2021 13:11:27 +0000 (UTC)
IronPort-SDR: h/f3HBGppAnadrbk120i7imNcgJP2Y0gy5Ph2B6W2k2IG78Dfh3lXqTY2sXjk2C/hls5E0acwp
 RTzHN8RhsMnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="183013050"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="183013050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 06:11:25 -0700
IronPort-SDR: 2cws8iVnIBUTaYtmiex6GaRlSETtuK+tB1Tf/+g++/J2QYE8gmfSjA/MsRtNGxDq7D0bZ8RRhC
 RU1PY14364ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="386076135"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 22 Apr 2021 06:11:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Apr 2021 16:11:22 +0300
Date: Thu, 22 Apr 2021 16:11:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIF1+mhbWO7UD/yN@intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIFGt+I8LMckYyVG@phenom.ffwll.local>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Currently we try to detect a symmetric memory configurations
> > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > either only set on a very specific subset of machines or it
> > just does not exist (it's not mentioned in any public chipset
> > datasheets I've found). As it happens my CL/CTG machines never
> > set said bit, even if I populate the channels with identical
> > sticks.
> > =

> > So let's do the L-shaped memory detection the same way as the
> > desktop variants, ie. just look at the DRAM rank boundary
> > registers to see if both channels have an identical size.
> > =

> > With this my CL/CTG no longer claim L-shaped memory when I use
> > identical sticks. Also tested with non-matching sticks just to
> > make sure the L-shaped memory is still properly detected.
> > =

> > And for completeness let's update the debugfs code to dump
> > the correct set of registers on each platform.
> > =

> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Did you check this with the swapping igt? I have some vague memories of
> bug reports where somehow the machine was acting like it's L-shaped memory
> despite that banks were populated equally. I've iirc tried all kinds of
> tricks to figure it out, all to absolutely no avail.

Did you have a specific test in mind? I ran a bunch of things
that seemed swizzle related. All passed just fine.

Chris did have similar concerns and suggested we should have
better tests. I guess what I should try to do is some selftests
which make sure we test both high and low physical addresses
and check the swizzle pattern is as expected. But haven't =

found the time to do that yet.

> =

> tbh I'd just not touch this, not really worth it.

It's totally worth it to get gen4 machines working again.


> -Daniel
> > ---
> >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 15 ++++++++-------
> >  drivers/gpu/drm/i915/i915_debugfs.c          | 16 ++++++++++++----
> >  drivers/gpu/drm/i915/i915_reg.h              |  4 ++++
> >  3 files changed, 24 insertions(+), 11 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu=
/drm/i915/gt/intel_ggtt_fencing.c
> > index 0fa6c38893f7..754f20768de5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > @@ -693,14 +693,15 @@ static void detect_bit_6_swizzle(struct i915_ggtt=
 *ggtt)
> >  				swizzle_x =3D I915_BIT_6_SWIZZLE_9_10_17;
> >  				swizzle_y =3D I915_BIT_6_SWIZZLE_9_17;
> >  			}
> > -			break;
> > -		}
> >  =

> > -		/* check for L-shaped memory aka modified enhanced addressing */
> > -		if (IS_GEN(i915, 4) &&
> > -		    !(intel_uncore_read(uncore, DCC2) & DCC2_MODIFIED_ENHANCED_DISAB=
LE)) {
> > -			swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > -			swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > +			/* check for L-shaped memory aka modified enhanced addressing */
> > +			if (IS_GEN(i915, 4) &&
> > +			    intel_uncore_read16(uncore, C0DRB3_CL) !=3D
> > +			    intel_uncore_read16(uncore, C1DRB3_CL)) {
> > +				swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > +				swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > +			}
> > +			break;
> >  		}
> >  =

> >  		if (dcc =3D=3D 0xffffffff) {
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915=
/i915_debugfs.c
> > index 8dd374691102..6de11ffcde38 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -621,10 +621,18 @@ static int i915_swizzle_info(struct seq_file *m, =
void *data)
> >  			   intel_uncore_read(uncore, DCC));
> >  		seq_printf(m, "DDC2 =3D 0x%08x\n",
> >  			   intel_uncore_read(uncore, DCC2));
> > -		seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > -			   intel_uncore_read16(uncore, C0DRB3_BW));
> > -		seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > -			   intel_uncore_read16(uncore, C1DRB3_BW));
> > +
> > +		if (IS_G45(dev_priv) || IS_I965G(dev_priv) || IS_G33(dev_priv)) {
> > +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > +				   intel_uncore_read16(uncore, C0DRB3_BW));
> > +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > +				   intel_uncore_read16(uncore, C1DRB3_BW));
> > +		} else if (IS_GEN(dev_priv, 4)) {
> > +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > +				   intel_uncore_read16(uncore, C0DRB3_CL));
> > +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > +				   intel_uncore_read16(uncore, C1DRB3_CL));
> > +		}
> >  	} else if (INTEL_GEN(dev_priv) >=3D 6) {
> >  		seq_printf(m, "MAD_DIMM_C0 =3D 0x%08x\n",
> >  			   intel_uncore_read(uncore, MAD_DIMM_C0));
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i91=
5_reg.h
> > index 0587b2455ea1..055c258179a1 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -3790,6 +3790,10 @@ static inline bool i915_mmio_reg_valid(i915_reg_=
t reg)
> >  #define C0DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x206)
> >  #define C1DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x606)
> >  =

> > +/* 965gm,ctg DRAM channel configuration */
> > +#define C0DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1206)
> > +#define C1DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1306)
> > +
> >  /* snb MCH registers for reading the DRAM channel configuration */
> >  #define MAD_DIMM_C0			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5004)
> >  #define MAD_DIMM_C1			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5008)
> > -- =

> > 2.26.3
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
