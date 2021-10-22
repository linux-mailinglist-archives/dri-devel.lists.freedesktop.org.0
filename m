Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F4437EBD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162D56EDC8;
	Fri, 22 Oct 2021 19:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2180F6EDC8;
 Fri, 22 Oct 2021 19:38:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="229239098"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="229239098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 12:38:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="576762206"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 12:38:41 -0700
Date: Fri, 22 Oct 2021 12:51:12 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v3] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20211022195112.GA1609@labuser-Z97X-UD5H>
References: <20211004115913.23889-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004115913.23889-1-manasi.d.navare@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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


Hi Ville,

Could you take a look at this, this addresses teh review comments from prev version

Manasi

On Mon, Oct 04, 2021 at 04:59:13AM -0700, Manasi Navare wrote:
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
> v3: Add the same uapi crtc_state->enable check in requested
> crtc calc (Ville)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ff1416cd609a..a1e4c7905ebb 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1310,8 +1310,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
>  
> -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> -		requested_crtc |= drm_crtc_mask(crtc);
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->enable)
> +			requested_crtc |= drm_crtc_mask(crtc);
> +	}
>  
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> @@ -1360,8 +1362,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
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
> 
