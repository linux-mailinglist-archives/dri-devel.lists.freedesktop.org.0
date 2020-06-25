Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69EF209B5E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 10:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8040C6E81E;
	Thu, 25 Jun 2020 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ABE6E5C6;
 Thu, 25 Jun 2020 08:36:31 +0000 (UTC)
IronPort-SDR: JaZkXi2B3vKmteauWkkEW2lMaEmOvk/+0PiEE8miySYznxzOKuxO4nZB7r36Qm06UZwBLh8Xrr
 QDpEJax2Iwjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="132239833"
X-IronPort-AV: E=Sophos;i="5.75,278,1589266800"; d="scan'208";a="132239833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 01:36:31 -0700
IronPort-SDR: nptsyqABQqfl3whN377X0nrbm72up2EHiG8O08fQmmz1aatU+f/Goicbu0H5gwFoMXQRkDf0u1
 PQZUbKUhbXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,278,1589266800"; d="scan'208";a="296015442"
Received: from pietryga-mobl1.ger.corp.intel.com (HELO [10.249.41.109])
 ([10.249.41.109])
 by orsmga007.jf.intel.com with ESMTP; 25 Jun 2020 01:36:28 -0700
Subject: Re: [PATCH v6 3/3] drm/i915: Send hotplug event if edid had changed
To: Kunal Joshi <kunal1.joshi@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200623185756.19502-1-kunal1.joshi@intel.com>
 <20200623185756.19502-4-kunal1.joshi@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <61952a12-bd15-92ce-fd81-88a35ed88acb@linux.intel.com>
Date: Thu, 25 Jun 2020 10:36:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623185756.19502-4-kunal1.joshi@intel.com>
Content-Language: en-US
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
Cc: stanislav.lisovskiy@intel.com, daniel.vetter@intel.com,
 arkadiusz.hiler@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 23-06-2020 om 20:57 schreef Kunal Joshi:
> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
> Added epoch counter checking to intel_encoder_hotplug
> in order to be able process all the connector changes,
> besides connection status. Also now any change in connector
> would result in epoch counter change, so no multiple checks
> are needed.
>
> v2: Renamed change counter to epoch counter. Fixed type name.
>
> v3: Fixed rebase conflict
>
> v4: Remove duplicate drm_edid_equal checks from hdmi and dp,
>     lets use only once edid property is getting updated and
>     increment epoch counter from there.
>     Also lets now call drm_connector_update_edid_property
>     right after we get edid always to make sure there is a
>     unified way to handle edid change, without having to
>     change tons of source code as currently
>     drm_connector_update_edid_property is called only in
>     certain cases like reprobing and not right after edid is
>     actually updated.
>
> v5: Fixed const modifiers, removed blank line
>
> v6: Removed drm specific part from this patch, leaving only
>     i915 specific changes here.
>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---

Much better!

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

for whole series

>  drivers/gpu/drm/i915/display/intel_hotplug.c | 26 +++++++++++---------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> index 2e94c1413c02..393813494523 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -283,6 +283,8 @@ intel_encoder_hotplug(struct intel_encoder *encoder,
>  {
>  	struct drm_device *dev = connector->base.dev;
>  	enum drm_connector_status old_status;
> +        u64 old_epoch_counter;
> +        bool ret = false;
>  
>  	drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
>  	old_status = connector->base.status;
> @@ -290,17 +292,19 @@ intel_encoder_hotplug(struct intel_encoder *encoder,
>  	connector->base.status =
>  		drm_helper_probe_detect(&connector->base, NULL, false);
>  
> -	if (old_status == connector->base.status)
> -		return INTEL_HOTPLUG_UNCHANGED;
> -
> -	drm_dbg_kms(&to_i915(dev)->drm,
> -		    "[CONNECTOR:%d:%s] status updated from %s to %s\n",
> -		    connector->base.base.id,
> -		    connector->base.name,
> -		    drm_get_connector_status_name(old_status),
> -		    drm_get_connector_status_name(connector->base.status));
> -
> -	return INTEL_HOTPLUG_CHANGED;
> +        if (old_epoch_counter != connector->base.epoch_counter)
> +                ret = true;
> +
> +        if(ret) {
> +		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s(epoch counter %llu)\n",
> +			      connector->base.base.id,
> +			      connector->base.name,
> +			      drm_get_connector_status_name(old_status),
> +			      drm_get_connector_status_name(connector->base.status),
> +			      connector->base.epoch_counter);
> +		return INTEL_HOTPLUG_CHANGED;
> +        }
> +        return INTEL_HOTPLUG_UNCHANGED;
>  }
>  
>  static bool intel_encoder_has_hpd_pulse(struct intel_encoder *encoder)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
