Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C87F15A4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504CD10E3E2;
	Mon, 20 Nov 2023 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028D10E3E2;
 Mon, 20 Nov 2023 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700490402; x=1732026402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xHHHm00VYu05k5fzkYjxacJagW2ryppPYM/pycFjEgI=;
 b=ChNSi49qK8fxCUvJKZvfpbWhNJVeeL0EHoGB3GXDho1blHMLXlRBNM8A
 esyRSqM1R5Yp96MHVQLeZHLn7jSTY3vbPL8KqahoBv60U1VqRW4g1WSid
 H9uV6gamrxYe3Yfz27LLewEkSaRGewUkY1ahI6BmqzgoofFh7qoLv8QBV
 t6sFKG/X40j36LZ4jC4c1DEwNvq96G9+001Zaiir/80+T1KlSDR7BqqiV
 233twACADbVJXK4I0V5L4PVNy2jdygdct+U3a3DqXtEdq1x45eobRKhn+
 /HRVcbj/wh7wt2TiXHnIDytsK1ufMruW43kdP9E0emJqCR3o0MOl8DhdU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422722219"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422722219"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 06:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759797688"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="759797688"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 20 Nov 2023 06:26:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 20 Nov 2023 16:26:38 +0200
Date: Mon, 20 Nov 2023 16:26:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Message-ID: <ZVtsnsLQ22ImaiFz@intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-3-ville.syrjala@linux.intel.com>
 <SJ1PR11MB612921FEBAC75CFA6407F14CB9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB612921FEBAC75CFA6407F14CB9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

On Mon, Nov 20, 2023 at 06:08:57AM +0000, Borah, Chaitanya Kumar wrote:
> Hello Ville,
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ville
> > Syrjala
> > Sent: Friday, October 13, 2023 6:44 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
> > 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > drm_color_lut_extract() rounding was changed to follow the OpenGL int<-
> > >float conversion rules. Adjust intel_color_lut_pack() to match.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > b/drivers/gpu/drm/i915/display/intel_color.c
> > index 2a2a163ea652..b01f463af861 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -785,14 +785,12 @@ static void chv_assign_csc(struct intel_crtc_state
> > *crtc_state)
> >  /* convert hw value with given bit_precision to lut property val */  static u32
> > intel_color_lut_pack(u32 val, int bit_precision)  {
> 
> Is this operation unique to Intel. Should there be a drm helper for this?

If some other driver gains gamma readout support they
could probably use something like this. The other option
would be to rework the current helper to allow conversions
both ways.

> 
> Regards
> 
> Chaitanya
> 
> > -	u32 max = 0xffff >> (16 - bit_precision);
> > -
> > -	val = clamp_val(val, 0, max);
> > -
> > -	if (bit_precision < 16)
> > -		val <<= 16 - bit_precision;
> > -
> > -	return val;
> > +	if (bit_precision > 16)
> > +		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(val, (1 << 16)
> > - 1),
> > +					     (1 << bit_precision) - 1);
> > +	else
> > +		return DIV_ROUND_CLOSEST(val * ((1 << 16) - 1),
> > +					 (1 << bit_precision) - 1);
> >  }
> > 
> >  static u32 i9xx_lut_8(const struct drm_color_lut *color)
> > --
> > 2.41.0
> 

-- 
Ville Syrjälä
Intel
