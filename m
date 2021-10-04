Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E15420A29
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 13:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0CC6E1A8;
	Mon,  4 Oct 2021 11:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4656E1A8;
 Mon,  4 Oct 2021 11:37:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="222841227"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="222841227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 04:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="622090999"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2021 04:37:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 14:37:52 +0300
Date: Mon, 4 Oct 2021 14:37:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v2] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <YVrnkOLIdsQBEVsK@intel.com>
References: <20211004113629.23715-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004113629.23715-1-manasi.d.navare@intel.com>
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

On Mon, Oct 04, 2021 at 04:36:29AM -0700, Manasi Navare wrote:
> In case of a modeset where a mode gets split across mutiple CRTCs
> in the driver specific implementation (bigjoiner in i915) we wrongly count
> the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
> an affected CRTC in atomic_check_only().
> This triggers a warning since affected CRTCs doent match requested CRTC.
> 
> To fix this in such bigjoiner configurations, we should only
> increment affected crtcs if that CRTC is enabled in UAPI not
> if it is just used internally in the driver to split the mode.
> 
> There is no way we can adjust requested_crtc calculation as suggested
> in review comments because the crtc gets stolen only after the atomic_check call.

The uapi crtc_state->enable value does not change due to bigjoiner
stealing the crtc. So I don't understand what you're trying to say
here.

The only internal thing that could alter the set of enabled crtcs
on the uapi level is update_connector_routing(true), but that is
always called before drm_atomic_check_only().

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ff1416cd609a..44e7ebf43a2a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1360,8 +1360,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		}
>  	}
>  
> -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> -		affected_crtc |= drm_crtc_mask(crtc);
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->enable)
> +			affected_crtc |= drm_crtc_mask(crtc);
> +	}
>  
>  	/*
>  	 * For commits that allow modesets drivers can add other CRTCs to the
> -- 
> 2.19.1

-- 
Ville Syrjälä
Intel
