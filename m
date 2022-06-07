Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5953FA06
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0512AFCE;
	Tue,  7 Jun 2022 09:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1FE12AFEB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654594906; x=1686130906;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IziG/fLuQ0Z0+ZAcn4uOIuJKPNdqnS0kLtR6G8B9JCs=;
 b=TpIRPG/1wbq2m/ZJhQeFu0ZyfwlEaCilwBwt7WVshWFmiS/3MiNpUgWj
 pgWBJbC2AfxwnbWDaD5g4JpKRIy7ggKLC04uGjasj0UpSiQbStJs37HLa
 ldPjK+0aSiaVUNrkirExjAfwyCQ9sAZnNxIsswJeTktmp0xzmlhv5/ubn
 Xs8Z1vMguOVE90DuF+eGrHpeKEXFBryhWeAiR+XXf7n9pfMVCYYKTbNAE
 Dt1OXEd4maBQsidJw4+ev8D5DmlrYM5SpnTZoGoUm6RpSHVLeHOGoEpwT
 4ch12xvTj1jQE8LS92Z0BBxHLsW1/eldQm32m1PLK0zHJ7blujlABFraK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276756560"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="276756560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 02:41:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636052389"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.57.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 02:41:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v3 3/7] drm/mgag200: Implement connector's get_modes
 with helper
In-Reply-To: <20220516134343.6085-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220516134343.6085-1-tzimmermann@suse.de>
 <20220516134343.6085-4-tzimmermann@suse.de>
Date: Tue, 07 Jun 2022 12:41:40 +0300
Message-ID: <87sfogq08b.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 May 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Provide drm_connector_helper_get_modes_from_ddc() to implement the
> connector's get_modes callback. The new helper updates the connector
> from DDC-provided EDID data.

When adding drm core code, please do *not* prefix with "drm/mgag200".

I, and I believe many people, totally ignore changes to a lot of
drivers, while trying to closely follow drm core changes.

Going forward, I'll be slightly changing what the .get_modes hook is
supposed to do, so this feels like a bit of a detour to me. Anyone
picking this up is up for another refactor later on. Oh well.


BR,
Jani.

PS. There's a // comment in there.

>
> v2:
> 	* clear property if EDID is NULL in helper
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c     | 36 ++++++++++++++++++++++++++
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++---------
>  include/drm/drm_probe_helper.h         |  2 ++
>  3 files changed, 42 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 682359512996..d77f17867195 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -964,3 +964,39 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  	return changed;
>  }
>  EXPORT_SYMBOL(drm_helper_hpd_irq_event);
> +
> +/**
> + * drm_connector_helper_get_modes_from_ddc - Updates the connector's EDID
> + *                                           property from the connector's
> + *                                           DDC channel
> + * @connector: The connector
> + *
> + * Returns:
> + * The number of detected display modes.
> + *
> + * Uses a connector's DDC channel to retrieve EDID data and update the
> + * connector's EDID property and display modes. Drivers can use this
> + * function to implement struct &drm_connector_helper_funcs.get_modes
> + * for connectors with a DDC channel.
> + */
> +int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +	int count = 0;
> +
> +	if (!connector->ddc)
> +		return 0;
> +
> +	edid = drm_get_edid(connector, connector->ddc);
> +
> +	// clears property if EDID is NULL
> +	drm_connector_update_edid_property(connector, edid);
> +
> +	if (edid) {
> +		count = drm_add_edid_modes(connector, edid);
> +		kfree(edid);
> +	}
> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index b227891d01ec..4c0680dd1a78 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -689,26 +689,17 @@ static void mgag200_disable_display(struct mga_device *mdev)
>   * Connector
>   */
>  
> -static int mga_vga_get_modes(struct drm_connector *connector)
> +static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
>  {
>  	struct mga_device *mdev = to_mga_device(connector->dev);
> -	struct mga_connector *mga_connector = to_mga_connector(connector);
> -	struct edid *edid;
> -	int ret = 0;
> +	int ret;
>  
>  	/*
>  	 * Protect access to I/O registers from concurrent modesetting
>  	 * by acquiring the I/O-register lock.
>  	 */
>  	mutex_lock(&mdev->rmmio_lock);
> -
> -	edid = drm_get_edid(connector, &mga_connector->i2c->adapter);
> -	if (edid) {
> -		drm_connector_update_edid_property(connector, edid);
> -		ret = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	}
> -
> +	ret = drm_connector_helper_get_modes_from_ddc(connector);
>  	mutex_unlock(&mdev->rmmio_lock);
>  
>  	return ret;
> @@ -828,7 +819,7 @@ static void mga_connector_destroy(struct drm_connector *connector)
>  }
>  
>  static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
> -	.get_modes  = mga_vga_get_modes,
> +	.get_modes  = mgag200_vga_connector_helper_get_modes,
>  	.mode_valid = mga_vga_mode_valid,
>  };
>  
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 48300aa6ca71..c80cab7a53b7 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -26,4 +26,6 @@ void drm_kms_helper_poll_disable(struct drm_device *dev);
>  void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>  
> +int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
> +
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
