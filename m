Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0B9AFFD2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 12:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DF210E05C;
	Fri, 25 Oct 2024 10:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/FcIrP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC8810E05C;
 Fri, 25 Oct 2024 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729851326; x=1761387326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kYN2dB4ddnWcQp0D9KeXmv8oxL33z53rJDsqLD0hKak=;
 b=d/FcIrP49z/QI7OaCkTkBAcnDnidYDb5U+v1E7feGTrwlaZE+Z+nQHRv
 QzTkfCvHnRRF48HKIlQaAxECxsKXcwX6PCAKt0Xhvrtdw42ehtOFb/LBA
 cT8GpUI5zKHGFOPH5qN5Ylce+ZRZzo1O8eC6EjdIWoeSs+ijb4bHJ59Bo
 7aImBcTxImHdwr+coO8GKJiGI9eI6l0QoFgqzQZTiEyzSjxgrqnKlxrw4
 qNEM0c3ZbO3KuXE0L2Agf3SuCaPyVh3yFj4QKxsidPBlSQWW5VWcg0TCi
 KhKvaEfTAIajDH33LE/Yuhd0uzYijxYLMc0fGB3aEq2d4fkKH3pajXbiI A==;
X-CSE-ConnectionGUID: 9ymU8nkVRF+iF5mRxheheQ==
X-CSE-MsgGUID: rAYKmdaGQgSqble3+wFWYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17146742"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="17146742"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 03:15:25 -0700
X-CSE-ConnectionGUID: Jvp5S744RhGH2KlCx35tjQ==
X-CSE-MsgGUID: Z+j7UqPCTj2FihB6FZNH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80985766"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Oct 2024 03:15:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 13:15:18 +0300
Date: Fri, 25 Oct 2024 13:15:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Move plane->{fb,old_fb,crtc} to legacy
 sub-structure
Message-ID: <ZxtvtqQzME--oy7-@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-2-ville.syrjala@linux.intel.com>
 <Zv58AalhFaMgh7c5@intel.com> <875xpgqzc1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xpgqzc1.fsf@intel.com>
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

On Fri, Oct 25, 2024 at 12:57:50PM +0300, Jani Nikula wrote:
> On Thu, 03 Oct 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Oct 02, 2024 at 09:21:59PM +0300, Ville Syrjala wrote:
> >> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> 
> >> Hide the plane->fb/etc. footguns better by stashing them inside
> >> a "legacy" sub struct.
> >> 
> >> Eventually maybe we could turn 'legacy' into a pointer
> >> that only exists on legacy drivers to completely prevent
> >> any abuse by atomic drivers...
> >
> > Hmm. I should probably make it a pointer from the start,
> > to avoid having to go through the same churn yet again.
> 
> [snip]
> 
> >> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >> index dd718c62ac31..a2d91ee4b40c 100644
> >> --- a/include/drm/drm_plane.h
> >> +++ b/include/drm/drm_plane.h
> >> @@ -663,31 +663,33 @@ struct drm_plane {
> >>  	/** @modifier_count: Size of the array pointed at by @modifier_count. */
> >>  	unsigned int modifier_count;
> >>  
> >> -	/**
> >> -	 * @crtc:
> >> -	 *
> >> -	 * Currently bound CRTC, only meaningful for non-atomic drivers. For
> >> -	 * atomic drivers this is forced to be NULL, atomic drivers should
> >> -	 * instead check &drm_plane_state.crtc.
> >> -	 */
> >> -	struct drm_crtc *crtc;
> >> -
> >> -	/**
> >> -	 * @fb:
> >> -	 *
> >> -	 * Currently bound framebuffer, only meaningful for non-atomic drivers.
> >> -	 * For atomic drivers this is forced to be NULL, atomic drivers should
> >> -	 * instead check &drm_plane_state.fb.
> >> -	 */
> >> -	struct drm_framebuffer *fb;
> >> -
> >> -	/**
> >> -	 * @old_fb:
> >> -	 *
> >> -	 * Temporary tracking of the old fb while a modeset is ongoing. Only
> >> -	 * used by non-atomic drivers, forced to be NULL for atomic drivers.
> >> -	 */
> >> -	struct drm_framebuffer *old_fb;
> >> +	struct {
> 
> Do you mean something along the lines of:
> 
> 	struct __plane_legacy_or_something {
> 
> >> +		/**
> >> +		 * @crtc:
> >> +		 *
> >> +		 * Currently bound CRTC, only meaningful for non-atomic drivers. For
> >> +		 * atomic drivers this is forced to be NULL, atomic drivers should
> >> +		 * instead check &drm_plane_state.crtc.
> >> +		 */
> >> +		struct drm_crtc *crtc;
> >> +
> >> +		/**
> >> +		 * @fb:
> >> +		 *
> >> +		 * Currently bound framebuffer, only meaningful for non-atomic drivers.
> >> +		 * For atomic drivers this is forced to be NULL, atomic drivers should
> >> +		 * instead check &drm_plane_state.fb.
> >> +		 */
> >> +		struct drm_framebuffer *fb;
> >> +
> >> +		/**
> >> +		 * @old_fb:
> >> +		 *
> >> +		 * Temporary tracking of the old fb while a modeset is ongoing. Only
> >> +		 * used by non-atomic drivers, forced to be NULL for atomic drivers.
> >> +		 */
> >> +		struct drm_framebuffer *old_fb;
> >> +	} legacy;
> 
> and
> 
> 	} __legacy;
> 
> 	struct __plane_legacy_or_something *legacy;
> 
> and initially unconditionally:
> 
>        	p->legacy = &p->__legacy;
> 
> but later, once atomic drivers have been fixed:
> 
> 	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ATOMIC))
> 		p->legacy = &p->__legacy;
> 
> It would make the last update really simple.

Yeah, something like that.

-- 
Ville Syrjälä
Intel
