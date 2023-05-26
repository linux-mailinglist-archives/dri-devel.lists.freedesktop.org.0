Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87B7127C1
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 15:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D14F10E067;
	Fri, 26 May 2023 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8962510E067;
 Fri, 26 May 2023 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685108899; x=1716644899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GBm6+tMkoV4ye+KNqbPRb5VbhDAqmgkIkFHZ7JqVmmI=;
 b=n+GmfoHx1C2aU4BpXs3gnCROu4hW5DVV9TeLkOWsSLAhcrpWBBZEwnkK
 lRNUAeUSTQi43L9MXiEohTAg00TraDatvGSwi2LNobttBaXOhXjGuX2pv
 r2sj9vqP64JUjfBAJor+BWX+VQHNcPqX2yKkXiW6uk5gElM/CsbIT2G2Y
 9urcl++UXjpOsza5vFva6BmaQqwQEA+TRNz+bgpLBp1Y498iGgupKjqsd
 +GZ3t88CPSD1PcGyZWnNAwPMRPOGw4OCH/uPcGv4qMrr1XmvxR6rjFO9d
 N22SfOsZ/0fQMNprKw6qwZFjG57zsiGSPGJDohN7pRg9uPk5la32LRd2F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440556620"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="440556620"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 06:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795098724"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795098724"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 26 May 2023 06:48:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 May 2023 16:48:15 +0300
Date: Fri, 26 May 2023 16:48:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign handling
Message-ID: <ZHC4nyUkQpCxTxHj@intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-4-ville.syrjala@linux.intel.com>
 <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 08:55:08PM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ville Syrjala
> > Sent: Thursday, April 13, 2023 10:19 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign handling
> > 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > The CHV CGM CSC coefficients are in s4.12 two's complement format. Fix the CTM-
> > >CGM conversion to handle that correctly instead of pretending that the hw
> > coefficients are also in some sign-magnitude format.
> 
> Spec is slightly confusing when it says:
> "CGM CSC :  Input pixels to the CGM CSC are 14 bits. (u.14 format). Coefficients are 16 bits (s3.12)."
> Also here:
> "Programmable parameters : 
> c0[15 :0], c1[15 :0], c2[15 :0], c3[15 :0], c4[15 :0], c5[15 :0], c6[15 :0], c7[15 :0], c8[15 :0] ; // signed matrix coefficients  (s3.12)"

Yeah, the spec just uses a weird notation where it doesn't count the msb
in the bits.

> 
> But the coefficients are 16bits, can you help understand how were you able to crack this 😊

The 16bit coefficient already made me suspect they screwed up
the notation. Testing specific values on real hardware
confirmed that.

> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 46 ++++++++++++++--------
> >  1 file changed, 29 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > b/drivers/gpu/drm/i915/display/intel_color.c
> > index 4fc16cac052d..63141f4ed372 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -568,29 +568,41 @@ static void icl_load_csc_matrix(const struct
> > intel_crtc_state *crtc_state)
> >  		icl_update_output_csc(crtc, &crtc_state->output_csc);  }
> > 
> > +static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int
> > +frac_bits) {
> > +	s64 c = CTM_COEFF_ABS(coeff);
> > +
> > +	/* leave an extra bit for rounding */
> > +	c >>= 32 - frac_bits - 1;
> > +
> > +	/* round and drop the extra bit */
> > +	c = (c + 1) >> 1;
> > +
> > +	if (CTM_COEFF_NEGATIVE(coeff))
> > +		c = -c;
> > +
> > +	c = clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
> > +		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
> > +
> > +	return c & (BIT(int_bits + frac_bits) - 1); }
> > +
> > +/*
> > + * CHV Color Gamut Mapping (CGM) CSC
> > + * |r|   | c0 c1 c2 |   |r|
> > + * |g| = | c3 c4 c5 | x |g|
> > + * |b|   | c6 c7 c8 |   |b|
> > + *
> > + * Coefficients are two's complement s4.12.
> > + */
> >  static void chv_cgm_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
> >  				    struct intel_csc_matrix *csc)
> >  {
> >  	const struct drm_color_ctm *ctm = crtc_state->hw.ctm->data;
> >  	int i;
> > 
> > -	for (i = 0; i < 9; i++) {
> > -		u64 abs_coeff = ((1ULL << 63) - 1) & ctm->matrix[i];
> > -
> > -		/* Round coefficient. */
> > -		abs_coeff += 1 << (32 - 13);
> > -		/* Clamp to hardware limits. */
> > -		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_8_0 - 1);
> > -
> > -		csc->coeff[i] = 0;
> > -
> > -		/* Write coefficients in S3.12 format. */
> > -		if (ctm->matrix[i] & (1ULL << 63))
> > -			csc->coeff[i] |= 1 << 15;
> > -
> > -		csc->coeff[i] |= ((abs_coeff >> 32) & 7) << 12;
> > -		csc->coeff[i] |= (abs_coeff >> 20) & 0xfff;
> > -	}
> > +	for (i = 0; i < 9; i++)
> > +		csc->coeff[i] = ctm_to_twos_complement(ctm->matrix[i], 4, 12);
> >  }
> > 
> >  static void chv_load_cgm_csc(struct intel_crtc *crtc,
> > --
> > 2.39.2
> 

-- 
Ville Syrjälä
Intel
