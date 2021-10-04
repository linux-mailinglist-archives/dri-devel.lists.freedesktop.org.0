Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEB421397
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 18:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E58F6EA48;
	Mon,  4 Oct 2021 16:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD856EA46;
 Mon,  4 Oct 2021 16:05:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="222927063"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="222927063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 08:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622415853"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2021 08:22:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 18:22:23 +0300
Date: Mon, 4 Oct 2021 18:22:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 05/10] drm/connector: Add a drm_connector privacy-screen
 helper functions (v2)
Message-ID: <YVscLznEbn0m07Mi@intel.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
 <20211002163618.99175-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002163618.99175-6-hdegoede@redhat.com>
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

On Sat, Oct 02, 2021 at 06:36:13PM +0200, Hans de Goede wrote:
> Add 2 drm_connector privacy-screen helper functions:
> 
> 1. drm_connector_attach_privacy_screen_provider(), this function creates
> and attaches the standard privacy-screen properties and registers a
> generic notifier for generating sysfs-connector-status-events on external
> changes to the privacy-screen status.
> 
> 2. drm_connector_update_privacy_screen(), update the privacy-screen's
> sw_state if the connector has a privacy-screen.
> 
> Changes in v2:
> - Do not update connector->state->privacy_screen_sw_state on
>   atomic-commits.
> - Change drm_connector_update_privacy_screen() to take drm_connector_state
>   as argument instead of a full drm_atomic_state. This allows the helper
>   to be called by drivers when they are enabling crtcs/encoders/connectors.
> 
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 102 ++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  11 ++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b2f1f1b1bfb4..00cf3b6135f6 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_sysfs.h>
>  
>  #include <linux/uaccess.h>
> @@ -462,6 +463,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  		    DRM_CONNECTOR_REGISTERED))
>  		drm_connector_unregister(connector);
>  
> +	if (connector->privacy_screen) {
> +		drm_privacy_screen_put(connector->privacy_screen);
> +		connector->privacy_screen = NULL;
> +	}
> +
>  	if (connector->tile_group) {
>  		drm_mode_put_tile_group(dev, connector->tile_group);
>  		connector->tile_group = NULL;
> @@ -543,6 +549,10 @@ int drm_connector_register(struct drm_connector *connector)
>  	/* Let userspace know we have a new connector */
>  	drm_sysfs_hotplug_event(connector->dev);
>  
> +	if (connector->privacy_screen)
> +		drm_privacy_screen_register_notifier(connector->privacy_screen,
> +					   &connector->privacy_screen_notifier);
> +
>  	mutex_lock(&connector_list_lock);
>  	list_add_tail(&connector->global_connector_list_entry, &connector_list);
>  	mutex_unlock(&connector_list_lock);
> @@ -578,6 +588,11 @@ void drm_connector_unregister(struct drm_connector *connector)
>  	list_del_init(&connector->global_connector_list_entry);
>  	mutex_unlock(&connector_list_lock);
>  
> +	if (connector->privacy_screen)
> +		drm_privacy_screen_unregister_notifier(
> +					connector->privacy_screen,
> +					&connector->privacy_screen_notifier);
> +
>  	if (connector->funcs->early_unregister)
>  		connector->funcs->early_unregister(connector);
>  
> @@ -2442,6 +2457,93 @@ drm_connector_attach_privacy_screen_properties(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_attach_privacy_screen_properties);
>  
> +static void drm_connector_update_privacy_screen_properties(
> +	struct drm_connector *connector, bool set_sw_state)
> +{
> +	enum drm_privacy_screen_status sw_state, hw_state;
> +
> +	drm_privacy_screen_get_state(connector->privacy_screen,
> +				     &sw_state, &hw_state);
> +
> +	if (set_sw_state)
> +		connector->state->privacy_screen_sw_state = sw_state;
> +	drm_object_property_set_value(&connector->base,
> +			connector->privacy_screen_hw_state_property, hw_state);
> +}
> +
> +static int drm_connector_privacy_screen_notifier(
> +	struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct drm_connector *connector =
> +		container_of(nb, struct drm_connector, privacy_screen_notifier);
> +	struct drm_device *dev = connector->dev;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	drm_connector_update_privacy_screen_properties(connector, true);

This thing still seems pretty unatomic in essence. The standard rule
is that non-immutable properties do not change under external
influence. So if userspace is unaware of the change then it could
just flip the state back to where it was previously. Ie. seems racy
at least which could in theory lead to some funny ping pong in the
state.

To go proper atomic route here the state of the prop should be
fully cotrolled by userspace. Is that not possible for some reason?

> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	drm_sysfs_connector_status_event(connector,
> +				connector->privacy_screen_sw_state_property);
> +	drm_sysfs_connector_status_event(connector,
> +				connector->privacy_screen_hw_state_property);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +/**
> + * drm_connector_attach_privacy_screen_provider - attach a privacy-screen to
> + *    the connector
> + * @connector: connector to attach the privacy-screen to
> + * @priv: drm_privacy_screen to attach
> + *
> + * Create and attach the standard privacy-screen properties and register
> + * a generic notifier for generating sysfs-connector-status-events
> + * on external changes to the privacy-screen status.
> + * This function takes ownership of the passed in drm_privacy_screen and will
> + * call drm_privacy_screen_put() on it when the connector is destroyed.
> + */
> +void drm_connector_attach_privacy_screen_provider(
> +	struct drm_connector *connector, struct drm_privacy_screen *priv)
> +{
> +	connector->privacy_screen = priv;
> +	connector->privacy_screen_notifier.notifier_call =
> +		drm_connector_privacy_screen_notifier;
> +
> +	drm_connector_create_privacy_screen_properties(connector);
> +	drm_connector_update_privacy_screen_properties(connector, true);
> +	drm_connector_attach_privacy_screen_properties(connector);
> +}
> +EXPORT_SYMBOL(drm_connector_attach_privacy_screen_provider);
> +
> +/**
> + * drm_connector_update_privacy_screen - update connector's privacy-screen sw-state
> + * @connector_state: connector-state to update the privacy-screen for
> + *
> + * This function calls drm_privacy_screen_set_sw_state() on the connector's
> + * privacy-screen.
> + *
> + * If the connector has no privacy-screen, then this is a no-op.
> + */
> +void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state)
> +{
> +	struct drm_connector *connector = connector_state->connector;
> +	int ret;
> +
> +	if (!connector->privacy_screen)
> +		return;
> +
> +	ret = drm_privacy_screen_set_sw_state(connector->privacy_screen,
> +					      connector_state->privacy_screen_sw_state);
> +	if (ret) {
> +		drm_err(connector->dev, "Error updating privacy-screen sw_state\n");
> +		return;
> +	}
> +
> +	/* The hw_state property value may have changed, update it. */
> +	drm_connector_update_privacy_screen_properties(connector, false);
> +}
> +EXPORT_SYMBOL(drm_connector_update_privacy_screen);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>  				    struct drm_property *property,
>  				    uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a79aec55ea40..b501d0badaea 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -27,6 +27,7 @@
>  #include <linux/llist.h>
>  #include <linux/ctype.h>
>  #include <linux/hdmi.h>
> +#include <linux/notifier.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_util.h>
>  
> @@ -40,6 +41,7 @@ struct drm_encoder;
>  struct drm_property;
>  struct drm_property_blob;
>  struct drm_printer;
> +struct drm_privacy_screen;
>  struct edid;
>  struct i2c_adapter;
>  
> @@ -1451,6 +1453,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
>  
> +	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
> +	struct drm_privacy_screen *privacy_screen;
> +
> +	/** @privacy_screen_notifier: privacy-screen notifier_block */
> +	struct notifier_block privacy_screen_notifier;
> +
>  	/**
>  	 * @privacy_screen_sw_state_property: Optional atomic property for the
>  	 * connector to control the integrated privacy screen.
> @@ -1788,6 +1796,9 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  					  int min, int max);
>  void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
>  void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
> +void drm_connector_attach_privacy_screen_provider(
> +	struct drm_connector *connector, struct drm_privacy_screen *priv);
> +void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>  
>  /**
>   * struct drm_tile_group - Tile group metadata
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
