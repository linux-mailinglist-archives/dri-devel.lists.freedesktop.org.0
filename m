Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2357B40685
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115E10E750;
	Tue,  2 Sep 2025 14:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fu6n+tPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C651D10E750
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756822839; x=1788358839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SgJ92jY14ykURQ2oV1lxNb3FeidAVKMdF9a6kub1TN0=;
 b=fu6n+tPXdCeL2xX2WJ7B07i2nM271IOB+JGArpLauEevpy8EW8jKkV10
 CxC0bKCdPmXq47QwCEVjyyZU3VLP7nYn0pbDk+DNFejUM1xGrDgKMF0K5
 SJTc3cOCekxE44lsrT41ZQUUVkn544y56Iwc1CUcwXi/kjmdtNwes4v58
 VppxG1a+APbmC3B90s8Ja0qmNe+vU0d7wxx9ipMI471mblTLOcgLgi+dc
 OQqH8Zoh947LClI0qaCgqr35WksAw+Y0kf1sPLEmXwJ7a9WQwc8qCVVdr
 pH/8aig7Sp8JRyYHTAWkOW76lBs823uMZCGpQc554/qSQSrUKTwSbfPz8 w==;
X-CSE-ConnectionGUID: LHyDoD7sQlatziAwX5YAXA==
X-CSE-MsgGUID: 9xOPffUXQ1ea/PcJBVSGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70480000"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70480000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 07:20:39 -0700
X-CSE-ConnectionGUID: 6fyRAJVIQka5zftFd5M7YA==
X-CSE-MsgGUID: 6WCqMJ0aTBmaCA5+neKQiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176598409"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.118])
 by orviesa005.jf.intel.com with SMTP; 02 Sep 2025 07:20:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Sep 2025 17:20:35 +0300
Date: Tue, 2 Sep 2025 17:20:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 13/37] drm/armada: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <aLb9M4pNzsuCfXE0@intel.com>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-13-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902-drm-no-more-existing-state-v2-13-de98fc5f6d66@kernel.org>
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

On Tue, Sep 02, 2025 at 11:35:12AM +0200, Maxime Ripard wrote:
> The armada atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> To: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/armada_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
> index cc47c032dbc151a463cbd0b0d048c74c2828f253..786bcce0dc20eadab14c5bee97593ae3e05732b1 100644
> --- a/drivers/gpu/drm/armada/armada_plane.c
> +++ b/drivers/gpu/drm/armada/armada_plane.c
> @@ -93,12 +93,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
>  		new_plane_state->visible = false;
>  		return 0;
>  	}
>  
>  	if (state)

This check looks like nonsense. There should be no way this gets called
without a drm_atomic_state. Could use another patch to clean up this
mess as well.

> -		crtc_state = drm_atomic_get_existing_crtc_state(state,
> -								crtc);
> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>  	else
>  		crtc_state = crtc->state;
>  
>  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>  						  0,
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
