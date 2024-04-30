Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997368B6CCB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 10:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423C410EC90;
	Tue, 30 Apr 2024 08:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VRrHl+PL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE4810EC90
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:27:45 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34ca50999cdso97220f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714465664; x=1715070464; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtN6I/MrZsMh+QWZjvEHDZGUZNYY+VAe2iTynwNvttw=;
 b=VRrHl+PLyGYgByn4IIRjscwdvSuu3mm/oU01Kc1fUYjF2938ii0jrgftGRwtvuTsle
 rgPpEsjLvsmdmpr9FHxHlGtLnnXNsBvm9CPwWuqW2d3oSSM7D7CoD8Tk8HJpE7sfP4gF
 oE2Ym1hjt70mmoC1gX+5tzOYdpKww0hJuRv8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714465664; x=1715070464;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QtN6I/MrZsMh+QWZjvEHDZGUZNYY+VAe2iTynwNvttw=;
 b=t1BlttjB3Fe42Fbp/VtOWKxFmoPzxZ2r6AIOU7KWlh8jQKML7tkl6XSz1pqT2lbX6m
 TmSBTVYOjza4VFs3C0OAfNGOihQ2VrGQxPUiQIyt6kW3MlMSjesjsDn1fliSD53b5A14
 Gpvr0hR8BsauGxNZjkHC4fmfCESJevVW71POYUnIpbmD5ANbTvvqK4OjIkMX08SGxvq8
 2MajbgS31AhqNrsOezngEKKWzaXhNMe8JKQGFzZ98us20W+hV5adeI0TndQoH2+qBIGf
 3p4AG5OSdjVV37ZRLzd9FlZAYzlm2OC+tniy3nM3SIMO7DLx2ATE5yiqET/xB2nt7xz9
 3RKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfv3QRzySN84UDPpailM0DgHEtoeWBy1xqBFvumhPZymf/TrvNGh0AsPXOIpRymw/+3CBK8IKhfzoWcY7Xg/rCCBNbGIVG+1TnaY5GPQmk
X-Gm-Message-State: AOJu0YwhXJcT+We1r450SGNnbU5QR9AJhef1b8I8Eu5PuJoC40va1xk2
 ZnZDuNa30lMbFynKmc0aSwPFRzyqzNSiZ5zgTyFGL7BX0++0SJRDZiGk522yYQ0=
X-Google-Smtp-Source: AGHT+IHs7cYblukbyZbSslQ8/O/ZkVp0cDxSQ7bb6390JIb5JGmBs1IYANfhgq83FyicefsxwyNe8Q==
X-Received: by 2002:a05:600c:4f05:b0:419:f241:6336 with SMTP id
 l5-20020a05600c4f0500b00419f2416336mr9058364wmq.1.1714465663958; 
 Tue, 30 Apr 2024 01:27:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d6383000000b00341b451a31asm31373126wru.36.2024.04.30.01.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 01:27:42 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:27:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 7/7] drm/vkms Add hotplug support via configfs to VKMS.
Message-ID: <ZjCrfAELoSV3d4BH@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
 marius.vlad@collabora.com, mairacanal@riseup.net,
 jshargo@chromium.org, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
 hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-8-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-8-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Aug 29, 2023 at 05:30:59AM +0000, Brandon Pollack wrote:
> This change adds the ability to read or write a "1" or a "0" to the
> newly added "connected" attribute of a connector in the vkms entry in
> configfs.
> 
> A write will trigger a call to drm_kms_helper_hotplug_event, causing a
> hotplug uevent.
> 
> With this we can write virtualized multidisplay tests that involve
> hotplugging displays (eg recompositing windows when a monitor is turned
> off).
> 
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>  Documentation/gpu/vkms.rst           |  2 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++
>  drivers/gpu/drm/vkms/vkms_output.c   | 47 ++++++++++++++++++-
>  4 files changed, 123 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index c3875bf66dba..7f715097539c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -145,7 +145,7 @@ We want to be able to manipulate vkms instances without having to reload the
>  module. Such configuration can be added as extensions to vkms's ConfigFS
>  support. Use-cases:
>  
> -- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
> +- Hotremove connectors on the fly (to be able to test DP MST handling
>    of compositors).
>  
>  - Change output configuration: Plug/unplug screens, change EDID, allow changing
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index bc35dcc47585..d231e28101ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include "drm/drm_probe_helper.h"
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> @@ -40,6 +41,7 @@
>   *   `-- vkms
>   *       `-- test
>   *           |-- connectors
> + *                `-- connected
>   *           |-- crtcs
>   *           |-- encoders
>   *           |-- planes
> @@ -89,6 +91,14 @@
>   *
>   *   echo 1 > /config/vkms/test/enabled
>   *
> + * By default no display is "connected" so to connect a connector you'll also
> + * have to write 1 to a connectors "connected" attribute::
> + *
> + *   echo 1 > /config/vkms/test/connectors/connector/connected

I think it'd be really good if we allow all connector status values,
including unknown. It's not very common, which is why most compositors
utterly fail at handling it in a reasonable way.

> + *
> + * One can verify that this is worked using the `modetest` utility or the
> + * equivalent for your platform.
> + *
>   * When you're done with the virtual device, you can clean up the device like
>   * so::
>   *
> @@ -236,7 +246,58 @@ static void add_possible_encoders(struct config_group *parent,
>  
>  /*  Connector item, e.g. /config/vkms/device/connectors/ID */
>  
> +static ssize_t connector_connected_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_config_connector *connector =
> +		item_to_config_connector(item);
> +	struct vkms_configfs *configfs = connector_item_to_configfs(item);
> +	bool connected = false;
> +
> +	mutex_lock(&configfs->lock);
> +	connected = connector->connected;
> +	mutex_unlock(&configfs->lock);
> +
> +	return sprintf(buf, "%d\n", connected);
> +}
> +
> +static ssize_t connector_connected_store(struct config_item *item,
> +					 const char *buf, size_t len)
> +{
> +	struct vkms_config_connector *connector =
> +		item_to_config_connector(item);
> +	struct vkms_configfs *configfs = connector_item_to_configfs(item);
> +	int val, ret;
> +
> +	ret = kstrtouint(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != 1 && val != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +	connector->connected = val;
> +	if (!connector->connector) {
> +		pr_info("VKMS Device %s is not yet enabled, connector will be enabled on start",
> +			configfs->device_group.cg_item.ci_name);
> +	}
> +	mutex_unlock(&configfs->lock);
> +
> +	if (connector->connector)
> +		drm_kms_helper_hotplug_event(connector->connector->dev);

Ok a few lifetime bugs here:

- Calling drm_kms_helper_hotplug_event after you unluck means all the drm
  stuff might have disappeared meanwhile. Oops.

- It is worse, because switching to configfs_subsystem.su_mutex will not
  prevent the race, because the vkms_device can disappear independently
  (by manually unbinding the driver in sysfs) at least with the real
  platform driver approach. This is another reason why I'm not sure having
  a real platform driver with probe/remove hooks is a good idea.

- Furthermore the drm_connector might also disappear.

I think the way to properly fix this is:

- configfs needs to hold a reference of it's on to the drm_device in
  vkms_device.

- it needs to call a vkms function to update the connector hotplug status
  with only the configfs obj idx.  That function then needs to find the
  right drm_connector using the drm_connector_iter functions (which will
  sort out any lifetime/locking issues) until is has the right one, and
  then update the connector status.

No matter what, we cannot have a backpointer from any drm object to
configfs, that doesn't work correctly.
-Sima

> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(connector_, connected);
> +
> +static struct configfs_attribute *connector_attrs[] = {
> +	&connector_attr_connected,
> +	NULL,
> +};
> +
>  static struct config_item_type connector_type = {
> +	.ct_attrs = connector_attrs,
>  	.ct_owner = THIS_MODULE,
>  };
>  
> @@ -264,7 +325,7 @@ static ssize_t plane_type_show(struct config_item *item, char *buf)
>  	plane_type = plane->type;
>  	mutex_unlock(&configfs->lock);
>  
> -	return sprintf(buf, "%u", plane_type);
> +	return sprintf(buf, "%u\n", plane_type);
>  }
>  
>  static ssize_t plane_type_store(struct config_item *item, const char *buf,
> @@ -319,6 +380,7 @@ static struct config_group *connectors_group_make(struct config_group *group,
>  				    &connector_type);
>  	add_possible_encoders(&connector->config_group,
>  			      &connector->possible_encoders.group);
> +	connector->connected = false;
>  
>  	return &connector->config_group;
>  }
> @@ -500,7 +562,7 @@ static ssize_t device_enabled_show(struct config_item *item, char *buf)
>  	is_enabled = configfs->vkms_device != NULL;
>  	mutex_unlock(&configfs->lock);
>  
> -	return sprintf(buf, "%d", is_enabled);
> +	return sprintf(buf, "%d\n", is_enabled);
>  }
>  
>  static ssize_t device_enabled_store(struct config_item *item, const char *buf,
> @@ -557,7 +619,7 @@ static ssize_t device_id_show(struct config_item *item, char *buf)
>  
>  	mutex_unlock(&configfs->lock);
>  
> -	return sprintf(buf, "%d", id);
> +	return sprintf(buf, "%d\n", id);
>  }
>  
>  CONFIGFS_ATTR_RO(device_, id);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 2b9545ada9c2..5336281f397e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>  #ifndef _VKMS_DRV_H_
>  #define _VKMS_DRV_H_
>  
> +#include "drm/drm_connector.h"
>  #include <linux/configfs.h>
>  #include <linux/hrtimer.h>
>  
> @@ -147,7 +148,9 @@ struct vkms_config_links {
>  
>  struct vkms_config_connector {
>  	struct config_group config_group;
> +	struct drm_connector *connector;
>  	struct vkms_config_links possible_encoders;
> +	bool connected;
>  };
>  
>  struct vkms_config_crtc {
> @@ -220,6 +223,10 @@ struct vkms_device {
>  #define item_to_configfs(item) \
>  	container_of(to_config_group(item), struct vkms_configfs, device_group)
>  
> +#define connector_item_to_configfs(item)                                     \
> +	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
> +		     connectors_group)
> +
>  #define item_to_config_connector(item)                                    \
>  	container_of(to_config_group(item), struct vkms_config_connector, \
>  		     config_group)
> @@ -279,4 +286,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
>  int vkms_init_configfs(void);
>  void vkms_unregister_configfs(void);
>  
> +/* Connector hotplugging */
> +enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
> +						bool force);
> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0ee1f3f4a305..1a1cd0202c5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include <drm/drm_print.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
> @@ -8,10 +9,12 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <linux/printk.h>
>  
>  #include "vkms_drv.h"
>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
> +	.detect = vkms_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
> @@ -19,6 +22,48 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> +static const struct vkms_config_connector *
> +find_config_for_connector(struct drm_connector *connector)
> +{
> +	struct vkms_device *vkms = drm_device_to_vkms_device(connector->dev);
> +	struct vkms_configfs *configfs = vkms->configfs;
> +	struct config_item *item;
> +
> +	if (!configfs) {
> +		pr_info("Default connector has no configfs entry");
> +		return NULL;
> +	}
> +
> +	list_for_each_entry(item, &configfs->connectors_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_connector *config_connector =
> +			item_to_config_connector(item);
> +		if (config_connector->connector == connector)
> +			return config_connector;
> +	}
> +
> +	pr_warn("Could not find config to match connector %s, but configfs was initialized",
> +		connector->name);
> +
> +	return NULL;
> +}
> +
> +enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
> +						bool force)
> +{
> +	enum drm_connector_status status = connector_status_connected;
> +	const struct vkms_config_connector *config_connector =
> +		find_config_for_connector(connector);
> +
> +	if (!config_connector)
> +		return connector_status_connected;
> +
> +	if (!config_connector->connected)
> +		status = connector_status_disconnected;
> +
> +	return status;
> +}
> +
>  static const struct drm_encoder_funcs vkms_encoder_funcs = {
>  	.destroy = drm_encoder_cleanup,
>  };
> @@ -280,12 +325,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_connector *config_connector =
>  			item_to_config_connector(item);
>  		struct drm_connector *connector = vkms_connector_init(vkmsdev);
> -
>  		if (IS_ERR(connector)) {
>  			DRM_ERROR("Failed to init connector from config: %s",
>  				  item->ci_name);
>  			return PTR_ERR(connector);
>  		}
> +		config_connector->connector = connector;
>  
>  		for (int j = 0; j < output->num_encoders; j++) {
>  			struct encoder_map *encoder = &encoder_map[j];
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
