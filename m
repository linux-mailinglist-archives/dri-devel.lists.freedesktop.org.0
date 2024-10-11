Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A057A999F8E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D9210EA96;
	Fri, 11 Oct 2024 09:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3QaeiKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347510EA96
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728637273; x=1760173273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DRJL53NjDtQjTduKpobQMRFfgkTRzBprQ88ZIp6qdWk=;
 b=l3QaeiKP2dixQUxoh2LQc/t0yD5JKCDSjI5wvAn820kSdEVpcZEqPxWQ
 w0q8IHIk7nRorrPHntaCj8K75MFhbwgYCeqUrpYBQBzb9ZCqJ+sBtA+NI
 oFApx+gbE/w5GAN3+triwEJskd/uJ66aXA10RtLrw8GmH4EhgM+RBnigw
 Hc9dlTmMbcM+X/Ear2MbJlvKgqrZsv2Ydub99+pVV/UQGaT/RegHzflrM
 AK6rPQsOsW5sNJDZPlgA8y6QpZmB5qsXIfs6tJ1FnPgVr9bwas45XsPx+
 +0cQj7wZH0EvizHehQ3DSWuAAc+BYeoFaRPT423T/1WGXb3Mb0Aq3Ys+0 A==;
X-CSE-ConnectionGUID: thi8SVVqQKm4vLGXFqcGnA==
X-CSE-MsgGUID: BzacfMmZS5SRmClKPESNVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31730973"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="31730973"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:01:13 -0700
X-CSE-ConnectionGUID: cVso54b2S2ukrbFSeQ+aPg==
X-CSE-MsgGUID: RDCNlIxvT8mt6A96p5wCTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="80856947"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:01:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/7] drm: Add bmc_attached flag to connector
In-Reply-To: <20241011065705.6728-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241011065705.6728-1-tzimmermann@suse.de>
 <20241011065705.6728-4-tzimmermann@suse.de>
Date: Fri, 11 Oct 2024 12:01:04 +0300
Message-ID: <871q0n6mjz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 11 Oct 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add the bmc_attached flag to struct drm_connector to signal the
> presence of a virtual BMC output. The connector reports to be in
> status connected even without a physically connected display. Fbcon
> or userspace compositors would otherwise stop displaying to the
> BMC.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 6 +++++-
>  include/drm/drm_connector.h        | 8 ++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index df44be128e72..83c3f2d42d49 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -605,7 +605,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  			ret = connector_status_unknown;
>  
>  		connector->physical_status = ret;
> -		connector->status = connector->physical_status;
> +
> +		if (connector->bmc_attached)
> +			connector->status = connector_status_connected;
> +		else
> +			connector->status = connector->physical_status;

Perhaps all this would make more sense squashed into the previous patch?

>  	}
>  
>  	/*
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 37e951f04ae8..ed360ae35f21 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1802,6 +1802,14 @@ struct drm_connector {
>  	 */
>  	bool ycbcr_420_allowed;
>  
> +	/**
> +	 * @ bmc_attached:
> +	 * The connector has a BMC transparently attached to it. It has to
> +	 * report a connected status, even without a physically connected
> +	 * display.
> +	 */
> +	bool bmc_attached;

Who is supposed to set this and when? Can it be changed during connector
life cycle? (I find myself wishing for C++ public/private members,
*gasp*!)

Again, there's bound to be people for whom "BMC" means nothing, and
therefore this member means nothing. I'm wondering if the name could be
something with a higher level of abstraction. In some ways, this is
related to or a special case of connector->force, but without the
uapi. You know, "logical force", with the use case being BMC.

BR,
Jani.


> +
>  	/**
>  	 * @registration_state: Is this connector initializing, exposed
>  	 * (registered) with userspace, or unregistered?

-- 
Jani Nikula, Intel
