Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3A7F15A8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 15:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8015210E3E9;
	Mon, 20 Nov 2023 14:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D934110E3EC;
 Mon, 20 Nov 2023 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700490428; x=1732026428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TBnpFWOu1vLQugdU5VVtvCRRMh/qRzWFL2X+ORUxX+A=;
 b=OnN+vvsVI7YEKJ9suJ7rrdmznbfiEJHM+oqbN3MGJoZhy0N2iA13v7Uu
 AkAmBqr4cJcEYzDFiTntYyBVY41uM4W31xZPLVkQ8uMxTHzh9giT2feoG
 n4oHS/3FM4JUANUypEgE6veD8FUlMu6vtIliOC+bwm3ku7uNm7n/i5plF
 odVIz+jP5EnQSfFv3R7VoAzAyYLmQhKi+abh19onAUNkFJddOw5oQ1pjp
 r2Z6fInT/THBKihF/CBcJMTHLB4t8TDc2QbxND7q5r04yfiNiPGArk916
 LOcpf08jLbbG0pYLpnwpFn8d7e2oaymuBq9Lx3LprUne5jeCR0D4hJ/j3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422722310"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422722310"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 06:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759797757"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="759797757"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 20 Nov 2023 06:27:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 20 Nov 2023 16:27:04 +0200
Date: Mon, 20 Nov 2023 16:27:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
Message-ID: <ZVtsuDMWBvnZ-GMe@intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-2-ville.syrjala@linux.intel.com>
 <8734xr5f0o.fsf@intel.com> <ZUElHKaa5rnifyvy@intel.com>
 <SJ1PR11MB61295A8D16AEFE78E0F9EBD3B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <SJ1PR11MB61299BB0464C687EBA4C41B1B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB61299BB0464C687EBA4C41B1B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

On Mon, Nov 20, 2023 at 01:17:05PM +0000, Borah, Chaitanya Kumar wrote:
> 
> 
> > -----Original Message-----
> > From: Borah, Chaitanya Kumar
> > Sent: Monday, November 20, 2023 6:33 PM
> > To: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Jani
> > Nikula <jani.nikula@linux.intel.com>
> > Subject: RE: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
> > 
> > Hello Ville,
> > 
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > > Ville Syrjälä
> > > Sent: Tuesday, October 31, 2023 9:37 PM
> > > To: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > > Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
> > >
> > > On Tue, Oct 31, 2023 at 11:15:35AM +0200, Jani Nikula wrote:
> > > > On Fri, 13 Oct 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > > > > entrirely. But perhaps a better idea would be to follow the OpenGL
> > > > > int<->float conversion rules, in which case we get the following
> > > > > results:
> > > >
> > > > Do you have a pointer to the rules handy, I couldn't find it. :(
> > >
> > > Eg. '2.3.5 Fixed-Point Data Conversions' in GL 4.6 spec. The section
> > > number probably changes depending on which version of the spec you look
> > at.
> > >
> > 
> > This section particularly talks about conversion of normalized fixed point  to
> > floating point numbers and vice versa.
> > Pardon my limited knowledge on the topic but aren't we just doing a scaling
> > factor conversion(Q0.16 -> Q0.8) in these patches?
> > 
> > I could not draw a direct relation between the formulas in the section[1] and
> > what we are doing here.(but it could be just me!)
> 
> Scratch that! As I understand, in effect we are doing a Q0.16 Fixed Point -> Floating point -> Q0.8 Fixed Point conversion.

Yep, that's it.

> Correct me if I am wrong! Otherwise
> 
> LGTM.
> 
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> 
> > 
> > Regards
> > 
> > Chaitanya
> > 
> > [1] https://registry.khronos.org/OpenGL/specs/gl/glspec46.core.pdf '2.3.5
> > Fixed-Point Data Conversions'
> > 
> > > >
> > > > Might also add the reference to the commit message and/or comment.
> > > >
> > > > BR,
> > > > Jani.
> > > >
> > > > --
> > > > Jani Nikula, Intel
> > >
> > > --
> > > Ville Syrjälä
> > > Intel

-- 
Ville Syrjälä
Intel
