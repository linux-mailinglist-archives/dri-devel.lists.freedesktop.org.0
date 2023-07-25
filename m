Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA6761058
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6884489CCE;
	Tue, 25 Jul 2023 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA4489CCE;
 Tue, 25 Jul 2023 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690280017; x=1721816017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j3aIRDBLDVRrwehitzRcP+rCqG3ppF9PZXiSu93TDQk=;
 b=cIh6nqqiWtmGlvvv6zej3GiPA0O4X+8yEO2qAckxa4th4ozLuZWXAvI9
 vkxx0b/PYMt8/tcOQCVTzEiHDxfkOr3VziB6HTx2ei5+Tt5ifAVbtfgM9
 K9MV4NoIBswY027dP68DjeaJ6LriN5asUPQe1+3U8UOYjKHISqIfM8dqz
 /RHnu9BKpcKJbHxGfF94LSuzGD69tOgmOvhPtO0r68S+yaXRp2CKJ1/eJ
 ndQv7h3DybkIqUP0HXMHKUGwTwtTHdhjdQt57f9ojtJd4fkQnSiOBoIyU
 C6JyPG0WfjloLyfZNwaf1A5Q4iA0WbT/Pst00N/lLkBmoeUa5ubOkuZUA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352577358"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352577358"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791320196"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="791320196"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:13:34 -0700
Date: Tue, 25 Jul 2023 13:13:31 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 05/19] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Message-ID: <ZL+gS640uxlrzhSP@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
 <ZLj+YEpuQMDcogN4@intel.com>
 <65cb4383-ff7d-f7b4-29b8-4d81fbe076c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65cb4383-ff7d-f7b4-29b8-4d81fbe076c7@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 05:49:11PM +0530, Nautiyal, Ankit K wrote:
> Hi Stan,
> 
> Thanks for the reviews ans suggestions. Please my response inline:
> 
> 
> On 7/20/2023 2:59 PM, Lisovskiy, Stanislav wrote:
> > On Thu, Jul 13, 2023 at 04:03:32PM +0530, Ankit Nautiyal wrote:
> > > In Bigjoiner check for DSC, bigjoiner interface bits for DP for
> > > DISPLAY > 13 is 36 (Bspec: 49259).
> > > 
> > > v2: Corrected Display ver to 13.
> > > 
> > > v3: Follow convention for conditional statement. (Ville)
> > > 
> > > v4: Fix check for display ver. (Ville)
> > > 
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 19768ac658ba..c1fd448d80e1 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -802,8 +802,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
> > >   	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
> > >   	if (bigjoiner) {
> > > +		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
> > >   		u32 max_bpp_bigjoiner =
> > > -			i915->display.cdclk.max_cdclk_freq * 48 /
> > > +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
> > Probably "num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);" again,
> > instead of "2"?
> 
> Currently intel_dsc_get_num_vdsc_instances will give total number of
> vdsc_engines including joined pipes.
> 
> So with bigjoiner the function will return 4.
> 
> This was good to calculate Pipe BW check: (Pixel clock < PPC * CDCLK
> frequency * Number of pipes joined
> 
> as we get PPC * number of pipes joined from
> intel_dsc_get_num_vdsc_instances)
> 
> Or to calculate DSC_PIC_WIDTH PPS parameter.
> 
> But here we perhaps need intel_dsc_get_vdsc_engines_per_pipe that will just
> return 2 if dsc_split 1 otherwise.
> 
> Thanks & Regards,
> 
> Ankit

Yes, I agree, unfortunately not applicable here.
May be yeah we need some function like that and then refactor
also the intel_dsc_get_num_vdsc_instances to use that one..

Stan

> 
> > 
> > With that clarified,
> > 
> > Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > 
> > >   			intel_dp_mode_to_fec_clock(mode_clock);
> > >   		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
> > > -- 
> > > 2.40.1
> > > 
