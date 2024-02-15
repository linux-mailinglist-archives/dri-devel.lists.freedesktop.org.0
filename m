Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56FF856704
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E39D10E93E;
	Thu, 15 Feb 2024 15:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUcMInqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B4310E93D;
 Thu, 15 Feb 2024 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708010170; x=1739546170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rJerO7T+iJlyNznWixSHHFkUOgCtPtAhNcAtt+uTovk=;
 b=hUcMInqFv9jrTcJ0Gg1vX1IOO6PV9R0z7Z5gCgnD/KRiQUxlB9PAMQQs
 jxaRSoQgoVMG7o1V2/oPWgCvvB7XUqRCpOv1H64TDemURmQNx31kZnaSy
 sFiJhr+V6E7PByFrKmRTus2AKcE9OgSFo3Xu6EeLtv6Ux0CulPjEqOCP9
 xliN75Vo8qmX9WnPJBqpdWQaDdOpVHt7qS1TwcvnE+IZMCcq0kcCk0pRv
 /hZab6QSqzuBsdj+/Js2qv+hM/F6YFXKDfomLA7VuwocyYjCoq81pznQ9
 GDryPm5Mm45aIIrK4/+pPWaZ0xJeIEJpVlLMfG4TFcwQpR4brrvUCWb/9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2227183"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2227183"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 07:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826424731"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="826424731"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Feb 2024 07:16:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 17:16:03 +0200
Date: Thu, 15 Feb 2024 17:16:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/mst: improve debug logging of DP MST
 mode detect
Message-ID: <Zc4qsyIUABesA_87@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <26cddf53e9f7697fc422d19e14bfaf215d6548a6.1707823736.git.jani.nikula@intel.com>
 <Zc0D2L1F5JCXC4ID@intel.com> <87jzn654rb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzn654rb.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 15, 2024 at 01:46:48PM +0200, Jani Nikula wrote:
> On Wed, 14 Feb 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Feb 13, 2024 at 01:30:57PM +0200, Jani Nikula wrote:
> >> Rename intel_dp_can_mst() to intel_dp_mst_detect(), and move all DP MST
> >> detect debug logging there. Debug log the sink's MST capability,
> >> including single-stream sideband messaging support, and the decision
> >> whether to enable MST mode or not. Do this regardless of whether we're
> >> actually enabling MST or not.
> >> 
> >> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++--------
> >>  1 file changed, 31 insertions(+), 14 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> index a1c304f451bd..944f566525dd 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -4007,31 +4007,48 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >>  					   intel_dp->downstream_ports) == 0;
> >>  }
> >>  
> >> +static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
> >> +{
> >> +	if (mst_mode == DRM_DP_SST_SIDEBAND_MSG)
> >> +		return "single-stream sideband messaging";
> >> +	else
> >> +		return str_yes_no(mst_mode == DRM_DP_MST);
> >
> > I wonder if this should also just say "sst"/"mst"/"sst sideband" etc.
> > Shrug.
> >
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I realize there's an issue here.
> 
> intel_dp_detect_dpcd() bails out early for !drm_dp_is_branch(), before
> the intel_dp_can_mst() call. (Renamed intel_dp_mst_detect() here.)
> 
> We'll still happily call intel_dp_configure_mst() later also for
> !branch.
> 
> We'll need to call intel_dp_mst_detect() earlier and/or somehow combine
> these together. I don't think branch devices need to support MST, but I
> think MST devices need to support branching. And single-stream sideband
> support does not mean branching.
> 
> The intention of this patch was to improve MST debug logging, but the
> end result is that it reduces it! Auch.
> 
> I wonder if we should branch (eh) the detect earlier for eDP, SST and
> MST/branch paths. Just to make it easier for our poor brains to follow.

Hmm. The sink count check is another case as well. If the device
has a local sink, or somehting connected to its DFP(s) it should
declare sink count >= 1.

-- 
Ville Syrjälä
Intel
