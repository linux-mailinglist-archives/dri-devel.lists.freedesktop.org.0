Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A79D1771
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F210E54B;
	Mon, 18 Nov 2024 17:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEQoilP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E310E54B;
 Mon, 18 Nov 2024 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731952430; x=1763488430;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=TKAg8fWK0B/2FYJE6V2CqI/B8+VAyxkZyCaXXxmgLds=;
 b=mEQoilP0cYLyp5hkqi553uRAVSelu0fRBWmOfBEonKPrP87w/ZU8gYrG
 03PieofonM+V59pQTNIV3IpqB+/gilRXEc8MREBvcX3iU8XLgsdrp538U
 4XJKNTiOw4z2N4cexEpGi1yx0NxAqaPVMUiq82QD6Eh3+Mopb7tlVllkJ
 Yz5msUfNCBiXZfAdYBQ7ZGswO1T5WHn4S8V2SrMjwhr+FZBtoFJC+tuR3
 YGnkCTvW35IyA6lEmE1Ut29723YJqn2ASAia4iODK+seDJMVHlwFORXfa
 bQzkYtvcDfnH/I6uXuVOdVaHw1B/ObeE+awesc27y6YLMI+dZ+X3q+NMO Q==;
X-CSE-ConnectionGUID: P7+Vnch+QXikbxCeMxb78Q==
X-CSE-MsgGUID: rgjor1iER7m9Ir7ShEGivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19534969"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="19534969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:53:39 -0800
X-CSE-ConnectionGUID: WpntmS3lQCuTpMi9Q9aeaA==
X-CSE-MsgGUID: sNijzdD5SG2sC7cJp+mchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89447031"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:53:38 -0800
Date: Mon, 18 Nov 2024 19:54:00 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Zzt_ODPzu08N6fg1@ideak-desk.fi.intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-2-imre.deak@intel.com>
 <87bjyc4ubq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjyc4ubq.fsf@intel.com>
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

On Mon, Nov 18, 2024 at 02:09:29PM +0200, Jani Nikula wrote:
> On Fri, 15 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> > Atm when the connector is added to the drm_mode_config::connector_list,
> > the connector may not be fully initialized yet. This is not a problem
> > for user space, which will see the connector only after it's registered
> > later, it could be a problem for in-kernel users looking up connectors
> > via the above list.
> >
> > To resolve the above issue, add a way to separately initialize the DRM
> > core specific parts of the connector and add it to the above list. This
> > will move adding the connector to the list after the properties on the
> > connector have been added, this is ok since these steps don't have a
> > dependency.
> >
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 103 ++++++++++++++++++++++++++------
> >  include/drm/drm_connector.h     |   5 ++
> >  2 files changed, 91 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index fc35f47e2849e..6132a7917b20c 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
> >  	}
> >  }
> >  
> > -static int __drm_connector_init(struct drm_device *dev,
> > -				struct drm_connector *connector,
> > -				const struct drm_connector_funcs *funcs,
> > -				int connector_type,
> > -				struct i2c_adapter *ddc)
> > +static int __drm_connector_init_core(struct drm_device *dev,
> > +				     struct drm_connector *connector,
> > +				     const struct drm_connector_funcs *funcs,
> > +				     int connector_type,
> > +				     struct i2c_adapter *ddc)
> >  {
> >  	struct drm_mode_config *config = &dev->mode_config;
> >  	int ret;
> > @@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
> >  	/* provide ddc symlink in sysfs */
> >  	connector->ddc = ddc;
> >  
> > +	INIT_LIST_HEAD(&connector->head);
> >  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> >  	INIT_LIST_HEAD(&connector->probed_modes);
> >  	INIT_LIST_HEAD(&connector->modes);
> > @@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
> >  
> >  	drm_connector_get_cmdline_mode(connector);
> >  
> > -	/* We should add connectors at the end to avoid upsetting the connector
> > -	 * index too much.
> > -	 */
> > -	spin_lock_irq(&config->connector_list_lock);
> > -	list_add_tail(&connector->head, &config->connector_list);
> > -	config->num_connector++;
> > -	spin_unlock_irq(&config->connector_list_lock);
> > -
> >  	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
> >  	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> >  		drm_connector_attach_edid_property(connector);
> > @@ -332,6 +325,84 @@ static int __drm_connector_init(struct drm_device *dev,
> >  	return ret;
> >  }
> >  
> > +/**
> > + * drm_connector_init_core - Initialize the core state of a preallocated connector
> > + * @dev: DRM device
> > + * @connector: the connector to init
> > + * @funcs: callbacks for this connector
> > + * @connector_type: user visible type of the connector
> > + *
> > + * Initialises the core state of preallocated connector. This is
> > + * equivalent to drm_connector_init(), without adding the connector to
> > + * drm_mode_config::connector_list. This call must be followed by calling
> > + * drm_connector_add() during initialization to expose the connector to
> > + * in-kernel users via the above list.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drm_connector_init_core(struct drm_device *dev,
> > +			    struct drm_connector *connector,
> > +			    const struct drm_connector_funcs *funcs,
> > +			    int connector_type)
> 
> Please include the ddc parameter here, and have callers pass NULL. We
> absolutely don't want to see drm_connector_init_core_with_ddc().

Ok.

> > +{
> > +	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> > +		return -EINVAL;
> > +
> > +	return __drm_connector_init_core(dev, connector, funcs, connector_type, NULL);
> > +}
> > +EXPORT_SYMBOL(drm_connector_init_core);
> > +
> > +/**
> > + * drm_connector_add - Add the connector
> > + * @connector: the connector to add
> > + *
> > + * Add the connector to the drm_mode_config::connector_list, exposing the
> > + * connector to in-kernel users. This call must be preceded by a call to
> > + * drm_connector_init_core().
> > + */
> > +void drm_connector_add(struct drm_connector *connector)
> > +{
> > +	struct drm_device *dev = connector->dev;
> > +	struct drm_mode_config *config = &dev->mode_config;
> > +
> > +	spin_lock_irq(&config->connector_list_lock);
> > +	list_add_tail(&connector->head, &config->connector_list);
> > +	config->num_connector++;
> > +	spin_unlock_irq(&config->connector_list_lock);
> > +}
> > +EXPORT_SYMBOL(drm_connector_add);
> > +
> > +static void drm_connector_remove(struct drm_connector *connector)
> > +{
> > +	struct drm_device *dev = connector->dev;
> > +
> > +	if (list_empty(&connector->head))
> > +		return;
> > +
> > +	spin_lock_irq(&dev->mode_config.connector_list_lock);
> > +	list_del_init(&connector->head);
> > +	dev->mode_config.num_connector--;
> > +	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> > +}
> > +
> > +static int __drm_connector_init(struct drm_device *dev,
> > +				struct drm_connector *connector,
> > +				const struct drm_connector_funcs *funcs,
> > +				int connector_type,
> > +				struct i2c_adapter *ddc)
> 
> I'd nuke this wrapper altogether, and put the stuff inline.

Not sure, since it's used in a few places. Could rename it to
drm_connector_init_core_and_add() for clarity.

> Which kind of highlights that drmm_connector_init() still has the same
> problem, everyone's encouraged to move towards that, but then what?

Not sure how the drmm API would work on MST where connectors should be
freed dynamically, at least it doesn't work as-is; and MST is where
initialising and adding a connector separately matters - at least for
i915 - vs. other static connector types where it doesn't.

If needed, adding a drmm version of initialising a connector without
adding it would be simple, but based on the above I don't think it's
needed atm.

> > +{
> > +	int ret;
> > +
> > +	ret = __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_connector_add(connector);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * drm_connector_init - Init a preallocated connector
> >   * @dev: DRM device
> > @@ -659,10 +730,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  	connector->name = NULL;
> >  	fwnode_handle_put(connector->fwnode);
> >  	connector->fwnode = NULL;
> > -	spin_lock_irq(&dev->mode_config.connector_list_lock);
> > -	list_del(&connector->head);
> > -	dev->mode_config.num_connector--;
> > -	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> > +
> > +	drm_connector_remove(connector);
> >  
> >  	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
> >  	if (connector->state && connector->funcs->atomic_destroy_state)
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index e3fa43291f449..8e8d130b40f98 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2122,6 +2122,11 @@ struct drm_connector {
> >  
> >  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> >  
> > +int drm_connector_init_core(struct drm_device *dev,
> > +			    struct drm_connector *connector,
> > +			    const struct drm_connector_funcs *funcs,
> > +			    int connector_type);
> > +void drm_connector_add(struct drm_connector *connector);
> >  int drm_connector_init(struct drm_device *dev,
> >  		       struct drm_connector *connector,
> >  		       const struct drm_connector_funcs *funcs,
> 
> -- 
> Jani Nikula, Intel
