Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F42A7F98
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE86ED1A;
	Thu,  5 Nov 2020 13:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385F26ED0A;
 Thu,  5 Nov 2020 13:23:17 +0000 (UTC)
IronPort-SDR: 9WwfDfIwIgJX/G5h0h6EBdwTCfadze6JgWcc50uyG+3vx0R3kVQC4jADZtb1BeKfT7KFTRlM6e
 kbCjx/tZmJUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="156369568"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="156369568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:23:16 -0800
IronPort-SDR: ddTzpfxRWGdGynZ2C+SgowXVFlOyPfIKq76kqZPoQuQNfVxbIIT9fCd0lwdyXVwAeWclY8BctI
 BPw3lQtZth6g==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="306511514"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:23:14 -0800
Date: Thu, 5 Nov 2020 18:53:58 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 02/16] drm/i915/hdcp: Get conn while content_type
 changed
Message-ID: <20201105132358.GC3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-3-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 22:11:54 +0530, Anshuman Gupta wrote:
> Get DRM connector reference count while scheduling a prop work
> to avoid any possible destroy of DRM connector when it is in
> DRM_CONNECTOR_REGISTERED state.
> 
> Fixes: a6597faa2d59 ("drm/i915: Protect workers against disappearing connectors")
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index eee8263405b9..b9d8825e2bb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2210,6 +2210,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
>  	if (content_protection_type_changed) {
>  		mutex_lock(&hdcp->mutex);
>  		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		drm_connector_get(&connector->base);
haa... just commented about missing of this get ref in previous patch.
ignore it.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

-Ram
>  		schedule_work(&hdcp->prop_work);
>  		mutex_unlock(&hdcp->mutex);
>  	}
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
