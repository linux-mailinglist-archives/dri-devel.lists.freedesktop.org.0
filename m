Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1A9FF9F9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381C10E6F6;
	Thu,  2 Jan 2025 13:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4vO9Lb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C93810E6EE;
 Thu,  2 Jan 2025 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735826023; x=1767362023;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=uFUofVNkwQFYFj3onk4doeE8eT69tQyXfYKkh1B16jE=;
 b=I4vO9Lb+E0Rv5i4PnYo4hO6tMmwKtk/vL94hNZqO2hTBLe9uguG7nPn+
 R6qTeL+eGlKP+xs3cM1MElH7Oc6Mhhu6FM0MiF/0HXoD9ecynS6i/2Ox+
 nqrILYpGPMWgLjWIBVNAMA68XhWwJisPMnppwQ294IS5bG7+pd6tIs//Q
 d+fRRrzataqfCJHhdbpZFzjtwyNAArCazZHo+UpvrvhwClqUoTdQ/6jRR
 X0Nx/mhaTgQ6+jNr6AtEblyYvtc8XOAZCMo/iKdwLRvWi5/lPCNh1QzJP
 Hes3LzmDxXEM81rs7+Knj6nZxcA1d/UAzn8jb3/Wj5+jaWSnhuLTcxHe6 Q==;
X-CSE-ConnectionGUID: AQXdI6XPTJGU9x2NMdifbA==
X-CSE-MsgGUID: /cCF2w7eRBqKNf5E1Pjjnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35762425"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="35762425"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 05:53:43 -0800
X-CSE-ConnectionGUID: k4YeoYmcTtmTyeN5c+3tGQ==
X-CSE-MsgGUID: q17qYiowTum09OdB6/cS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101598767"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 05:53:40 -0800
Date: Thu, 2 Jan 2025 15:54:31 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 10/16] drm/i915/ddi: write payload for 128b/132b SST
Message-ID: <Z3aalx25SVnaBUcN@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <5ce97e5f6c2dd4d5ee3181b2d4ed968eb806534c.1734643485.git.jani.nikula@intel.com>
 <Z3QerVHWpJ5aN8eT@ideak-desk.fi.intel.com>
 <877c7do5c9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c7do5c9.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2025 at 12:52:38PM +0200, Jani Nikula wrote:
> On Tue, 31 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Thu, Dec 19, 2024 at 11:33:59PM +0200, Jani Nikula wrote:
> >> Write the payload allocation table for 128b/132b SST. Use VCPID 1 and
> >> start from slot 0, with dp_m_n.tu slots.
> >> 
> >> This is preparation for enabling 128b/132b SST. This path is not
> >> reachable yet. Indeed, we don't yet compute TU for 128b/132b SST.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> index 6f813bf85b23..64528ff8856e 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> @@ -2669,6 +2669,12 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
> >>  	/* 6.o Configure and enable FEC if needed */
> >>  	intel_ddi_enable_fec(encoder, crtc_state);
> >>  
> >> +	/* 7.a 128b/132b SST. */
> >> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
> >> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
> >> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
> >
> > I would handle the error by sending a modeset retry uevent. Either way:
> 
> Mmmh. The MST code calls intel_dp_queue_modeset_retry_for_link() in
> response to drm_dp_add_payload_part{1,2}() failures, but nothing
> else. As in, we don't do anything else (we just plunge on with the
> enable), and we don't even do that much in response to any other errors.
> 
> Our options are limited anyway.

The right thing to do is to report all these errors to user space, so it
can recover from it.

> Arguably the MST path payload update has more failure modes than SST,
> but you'd like to do this:
> 
> 	ret = drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
> 	if (ret < 0)
> 		intel_dp_queue_modeset_retry_for_link(state, encoder, crtc_state);
> 
> in mtl_ddi_pre_enable_dp() and tgl_ddi_pre_enable_dp()?

Yes.

> Overall I'm wondering if this too needs an overhaul. Instead of queueing
> the retry all over the place, maybe we should just flag it in
> crtc_state, and have intel_atomic_cleanup_work() do it once afterwards?

Atm it's queued once after detecting the first error, not sure if
deferring that would be better.

> BR,
> Jani.
> 
> >
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> >
> >> +	}
> >> +
> >>  	if (!is_mst)
> >>  		intel_dsc_dp_pps_write(encoder, crtc_state);
> >>  }
> >> @@ -2808,6 +2814,11 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
> >>  	/* 7.l Configure and enable FEC if needed */
> >>  	intel_ddi_enable_fec(encoder, crtc_state);
> >>  
> >> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
> >> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
> >> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
> >> +	}
> >> +
> >>  	if (!is_mst)
> >>  		intel_dsc_dp_pps_write(encoder, crtc_state);
> >>  }
> >> -- 
> >> 2.39.5
> >> 
> 
> -- 
> Jani Nikula, Intel
