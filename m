Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECEE9DE865
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9154710E2A6;
	Fri, 29 Nov 2024 14:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ8l5CQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800B10E1C0;
 Fri, 29 Nov 2024 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732890326; x=1764426326;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kOdJ0hZvY96k2dhb2j6xsoXMHbu8SvdJsna8uD+9w/0=;
 b=hJ8l5CQpGo3qXGrrRHC34qorGCNsNW0nvKZr3RsHVOuu4VwmWlRz6sBI
 Xlwn4I2u9mSUBUHTUVpcMMNh/k7C14XY/IXvQRfOEPzbRN40TKUisCpzW
 Ig8ym7q6aZL6yd2Du4w8GQTRdsYSYbEkCa9GNEJ8A9PSUAZ2beC2Y5xx0
 9ppg1iOuUtUYg4B8tdMUjaeDXn3YmNf7SLRoMnz9HBNnYwcJ5mOrDLFbt
 G0yFKNdJqs3PPAZmP3FSoA0X0sLSDU6I1q5ZaSpUyx8bynJxPJLig++k9
 rda98I3SHDr2iegkJQwvVvmN+Jjulmb3I321jx0jGlG3p/WsvmzyBtsip w==;
X-CSE-ConnectionGUID: 3Tj8uWQuRWis2JxGSrGBFg==
X-CSE-MsgGUID: TyCs7CiGR9ml6+QiH6aBgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36797468"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="36797468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 06:25:25 -0800
X-CSE-ConnectionGUID: eIU9oEW0Qj6etbB8M3htLQ==
X-CSE-MsgGUID: IRU/7VKPQvWcY50g3hQ8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="92412448"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 06:25:23 -0800
Date: Fri, 29 Nov 2024 16:26:01 +0200
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126161859.1858058-2-imre.deak@intel.com>
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

Adding more people from DRM core domain. Any comment, objection to this
change?

On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> Atm when the connector is added to the drm_mode_config::connector_list,
> the connector may not be fully initialized yet. This is not a problem
> for user space, which will see the connector only after it's registered
> later, it could be a problem for in-kernel users looking up connectors
> via the above list.
> 
> To resolve the above issue, add a way to separately initialize the DRM
> core specific parts of the connector and add it to the above list. This
> will move adding the connector to the list after the properties on the
> connector have been added, this is ok since these steps don't have a
> dependency.
> 
> v2: (Jani)
> - Let initing DDC as well via drm_connector_init_core().
> - Rename __drm_connector_init to drm_connector_init_core_and_add().
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 111 ++++++++++++++++++++++++++------
>  include/drm/drm_connector.h     |   6 ++
>  2 files changed, 97 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849e..fd7acae8656b2 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
>  	}
>  }
>  
> -static int __drm_connector_init(struct drm_device *dev,
> -				struct drm_connector *connector,
> -				const struct drm_connector_funcs *funcs,
> -				int connector_type,
> -				struct i2c_adapter *ddc)
> +static int __drm_connector_init_core(struct drm_device *dev,
> +				     struct drm_connector *connector,
> +				     const struct drm_connector_funcs *funcs,
> +				     int connector_type,
> +				     struct i2c_adapter *ddc)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
> @@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	/* provide ddc symlink in sysfs */
>  	connector->ddc = ddc;
>  
> +	INIT_LIST_HEAD(&connector->head);
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
> @@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
>  
>  	drm_connector_get_cmdline_mode(connector);
>  
> -	/* We should add connectors at the end to avoid upsetting the connector
> -	 * index too much.
> -	 */
> -	spin_lock_irq(&config->connector_list_lock);
> -	list_add_tail(&connector->head, &config->connector_list);
> -	config->num_connector++;
> -	spin_unlock_irq(&config->connector_list_lock);
> -
>  	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
>  	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>  		drm_connector_attach_edid_property(connector);
> @@ -332,6 +325,86 @@ static int __drm_connector_init(struct drm_device *dev,
>  	return ret;
>  }
>  
> +/**
> + * drm_connector_init_core - Initialize the core state of a preallocated connector
> + * @dev: DRM device
> + * @connector: the connector to init
> + * @funcs: callbacks for this connector
> + * @connector_type: user visible type of the connector
> + * @ddc: pointer to the associated ddc adapter
> + *
> + * Initialises the core state of preallocated connector. This is
> + * equivalent to drm_connector_init(), without adding the connector to
> + * drm_mode_config::connector_list. This call must be followed by calling
> + * drm_connector_add() during initialization to expose the connector to
> + * in-kernel users via the above list.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type,
> +			    struct i2c_adapter *ddc)
> +{
> +	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> +		return -EINVAL;
> +
> +	return __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> +}
> +EXPORT_SYMBOL(drm_connector_init_core);
> +
> +/**
> + * drm_connector_add - Add the connector
> + * @connector: the connector to add
> + *
> + * Add the connector to the drm_mode_config::connector_list, exposing the
> + * connector to in-kernel users. This call must be preceded by a call to
> + * drm_connector_init_core().
> + */
> +void drm_connector_add(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	spin_lock_irq(&config->connector_list_lock);
> +	list_add_tail(&connector->head, &config->connector_list);
> +	config->num_connector++;
> +	spin_unlock_irq(&config->connector_list_lock);
> +}
> +EXPORT_SYMBOL(drm_connector_add);
> +
> +static void drm_connector_remove(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	if (list_empty(&connector->head))
> +		return;
> +
> +	spin_lock_irq(&dev->mode_config.connector_list_lock);
> +	list_del_init(&connector->head);
> +	dev->mode_config.num_connector--;
> +	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +}
> +
> +static int drm_connector_init_core_and_add(struct drm_device *dev,
> +					   struct drm_connector *connector,
> +					   const struct drm_connector_funcs *funcs,
> +					   int connector_type,
> +					   struct i2c_adapter *ddc)
> +{
> +	int ret;
> +
> +	ret = __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_add(connector);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_connector_init - Init a preallocated connector
>   * @dev: DRM device
> @@ -361,7 +434,7 @@ int drm_connector_init(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
>  		return -EINVAL;
>  
> -	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
> +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, NULL);
>  }
>  EXPORT_SYMBOL(drm_connector_init);
>  
> @@ -398,7 +471,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
>  		return -EINVAL;
>  
> -	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
>  }
>  EXPORT_SYMBOL(drm_connector_init_with_ddc);
>  
> @@ -442,7 +515,7 @@ int drmm_connector_init(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, funcs && funcs->destroy))
>  		return -EINVAL;
>  
> -	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	ret = drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
>  	if (ret)
>  		return ret;
>  
> @@ -659,10 +732,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	connector->name = NULL;
>  	fwnode_handle_put(connector->fwnode);
>  	connector->fwnode = NULL;
> -	spin_lock_irq(&dev->mode_config.connector_list_lock);
> -	list_del(&connector->head);
> -	dev->mode_config.num_connector--;
> -	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +
> +	drm_connector_remove(connector);
>  
>  	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
>  	if (connector->state && connector->funcs->atomic_destroy_state)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f449..2476dcbd3c34d 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2122,6 +2122,12 @@ struct drm_connector {
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>  
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type,
> +			    struct i2c_adapter *ddc);
> +void drm_connector_add(struct drm_connector *connector);
>  int drm_connector_init(struct drm_device *dev,
>  		       struct drm_connector *connector,
>  		       const struct drm_connector_funcs *funcs,
> -- 
> 2.44.2
> 
