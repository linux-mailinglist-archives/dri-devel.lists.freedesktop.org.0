Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220924B868A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 12:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362710E713;
	Wed, 16 Feb 2022 11:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83A10E77D;
 Wed, 16 Feb 2022 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645010379; x=1676546379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eZpMFh9JD7e4Isl+qXnDubW4pV2rz0ffUf1mP1q117A=;
 b=arj39bp5vde/rtzp820+kcu8TDp+eQ5ouTvVrQv+hRCvkQG0YKTc6fRo
 bc4iBvXjGQ1cjyjq4vplnkPhSlEWi9/p4sxDyg05dKphL/QecXNtEitee
 c1FSTlz/yPmhZI9o6PsGm1OEuKwUMUDD4VdJW7BYExUOcqMFu1xa193dU
 Rlsi/MdMoOlfzGOHVZaXqYE3+0Ux0lbSO4/f8x0IZdSR1aSeLFlUa7Q6Y
 QqXgwcx2G18qdh11cjx2kC4jyztexj3yrMbd/8pnIXjKOjDlHt/M7gNO3
 wYr6tWcVsMLnXk0iJkRusAhtXrJpWuehhsz/NpN+WWnPfQih3Gx7emud1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250783196"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250783196"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 03:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="529406067"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 16 Feb 2022 03:19:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 13:19:35 +0200
Date: Wed, 16 Feb 2022 13:19:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/atomic: Don't pollute crtc_state->mode_blob with
 error pointers
Message-ID: <Ygzdx3W2A/XcYOXg@intel.com>
References: <20220209091928.14766-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220209091928.14766-1-ville.syrjala@linux.intel.com>
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
Cc: fuyufan <fuyufan@huawei.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 11:19:27AM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make sure we don't assign an error pointer to crtc_state->mode_blob
> as that will break all kinds of places that assume either NULL or a
> valid pointer (eg. drm_property_blob_put()).
> 
> Reported-by: fuyufan <fuyufan@huawei.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Slapped on a cc:stable just in case this can actually happen
in the wild, and pushed to drm-misc-fixes with Maxime's irc ack
(thanks).

> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 9781722519c3..54d62fdb4ef9 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -76,15 +76,17 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
>  	state->mode_blob = NULL;
>  
>  	if (mode) {
> +		struct drm_property_blob *blob;
> +
>  		drm_mode_convert_to_umode(&umode, mode);
> -		state->mode_blob =
> -			drm_property_create_blob(state->crtc->dev,
> -						 sizeof(umode),
> -						 &umode);
> -		if (IS_ERR(state->mode_blob))
> -			return PTR_ERR(state->mode_blob);
> +		blob = drm_property_create_blob(crtc->dev,
> +						sizeof(umode), &umode);
> +		if (IS_ERR(blob))
> +			return PTR_ERR(blob);
>  
>  		drm_mode_copy(&state->mode, mode);
> +
> +		state->mode_blob = blob;
>  		state->enable = true;
>  		drm_dbg_atomic(crtc->dev,
>  			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
