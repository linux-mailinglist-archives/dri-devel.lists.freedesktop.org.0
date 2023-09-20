Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AF7A8B08
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428510E535;
	Wed, 20 Sep 2023 18:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEDC10E535
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:03:16 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C55EB66071EF;
 Wed, 20 Sep 2023 19:03:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695232995;
 bh=uhO6IttlYAj/yo5egvC4YtDuaO5w616IbV33O4PUKrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=djBLZIQj9bZUYXB/HL8DhBfnmC6Zz5EM+aa0PPgailiNE5qvhOkymJegKZyBU/RE6
 BSS8YEJKGpW2t7+MQkScLOjwNgv1gsedUfSqOtgqU5Y6Cy9NjTrLNyFEGqTlCDj5sX
 0R0rQBrXo/gDPOmeXr7dbIyf9OFHQxIMx2yVA1VWNpKf9FSqC0lFrb4ZQhZez0inf/
 ggI4sLNlVN7FYenfT4vHjqyXlHM+ZX12zifTl11CJ8d0iwqBh3SmjkcJKb+5MnkRUh
 TJvxFaOGotp9hboR5qBFsoCgIqk4dX4FgN/QABKtLjcUvp+gVlSE/4lCCZST7kkXAK
 zYpUinJKpsP8g==
Message-ID: <393d65d0-8886-6663-5521-ba495d711750@collabora.com>
Date: Wed, 20 Sep 2023 15:03:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 7/7] drm/vkms Add hotplug support via configfs to VKMS.
Content-Language: en-US
To: Brandon Pollack <brpol@chromium.org>, marius.vlad@collabora.com,
 mairacanal@riseup.net, jshargo@chromium.org
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-8-brpol@chromium.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230829053201.423261-8-brpol@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, hirono@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, mduggan@chromium.org,
 mripard@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

Thanks for the patch.

On 29/08/2023 02:30, Brandon Pollack wrote:
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

Are these tests going to be added in igt?

I was just wondering if it requires any special thing for drm ci:

https://lists.freedesktop.org/archives/dri-devel/2023-September/423719.html

(btw, it would be awesome of you could test your changes with drm ci :)

Regards,
Helen

> 
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>   Documentation/gpu/vkms.rst           |  2 +-
>   drivers/gpu/drm/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++
>   drivers/gpu/drm/vkms/vkms_output.c   | 47 ++++++++++++++++++-
>   4 files changed, 123 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index c3875bf66dba..7f715097539c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -145,7 +145,7 @@ We want to be able to manipulate vkms instances without having to reload the
>   module. Such configuration can be added as extensions to vkms's ConfigFS
>   support. Use-cases:
>   
> -- Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
> +- Hotremove connectors on the fly (to be able to test DP MST handling
>     of compositors).
>   
>   - Change output configuration: Plug/unplug screens, change EDID, allow changing
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index bc35dcc47585..d231e28101ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   
> +#include "drm/drm_probe_helper.h"
>   #include <linux/configfs.h>
>   #include <linux/mutex.h>
>   #include <linux/platform_device.h>
> @@ -40,6 +41,7 @@
>    *   `-- vkms
>    *       `-- test
>    *           |-- connectors
> + *                `-- connected
>    *           |-- crtcs
>    *           |-- encoders
>    *           |-- planes
> @@ -89,6 +91,14 @@
>    *
>    *   echo 1 > /config/vkms/test/enabled
>    *
> + * By default no display is "connected" so to connect a connector you'll also
> + * have to write 1 to a connectors "connected" attribute::
> + *
> + *   echo 1 > /config/vkms/test/connectors/connector/connected
> + *
> + * One can verify that this is worked using the `modetest` utility or the
> + * equivalent for your platform.
> + *
>    * When you're done with the virtual device, you can clean up the device like
>    * so::
>    *
> @@ -236,7 +246,58 @@ static void add_possible_encoders(struct config_group *parent,
>   
>   /*  Connector item, e.g. /config/vkms/device/connectors/ID */
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
>   static struct config_item_type connector_type = {
> +	.ct_attrs = connector_attrs,
>   	.ct_owner = THIS_MODULE,
>   };
>   
> @@ -264,7 +325,7 @@ static ssize_t plane_type_show(struct config_item *item, char *buf)
>   	plane_type = plane->type;
>   	mutex_unlock(&configfs->lock);
>   
> -	return sprintf(buf, "%u", plane_type);
> +	return sprintf(buf, "%u\n", plane_type);
>   }
>   
>   static ssize_t plane_type_store(struct config_item *item, const char *buf,
> @@ -319,6 +380,7 @@ static struct config_group *connectors_group_make(struct config_group *group,
>   				    &connector_type);
>   	add_possible_encoders(&connector->config_group,
>   			      &connector->possible_encoders.group);
> +	connector->connected = false;
>   
>   	return &connector->config_group;
>   }
> @@ -500,7 +562,7 @@ static ssize_t device_enabled_show(struct config_item *item, char *buf)
>   	is_enabled = configfs->vkms_device != NULL;
>   	mutex_unlock(&configfs->lock);
>   
> -	return sprintf(buf, "%d", is_enabled);
> +	return sprintf(buf, "%d\n", is_enabled);
>   }
>   
>   static ssize_t device_enabled_store(struct config_item *item, const char *buf,
> @@ -557,7 +619,7 @@ static ssize_t device_id_show(struct config_item *item, char *buf)
>   
>   	mutex_unlock(&configfs->lock);
>   
> -	return sprintf(buf, "%d", id);
> +	return sprintf(buf, "%d\n", id);
>   }
>   
>   CONFIGFS_ATTR_RO(device_, id);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 2b9545ada9c2..5336281f397e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>   #ifndef _VKMS_DRV_H_
>   #define _VKMS_DRV_H_
>   
> +#include "drm/drm_connector.h"
>   #include <linux/configfs.h>
>   #include <linux/hrtimer.h>
>   
> @@ -147,7 +148,9 @@ struct vkms_config_links {
>   
>   struct vkms_config_connector {
>   	struct config_group config_group;
> +	struct drm_connector *connector;
>   	struct vkms_config_links possible_encoders;
> +	bool connected;
>   };
>   
>   struct vkms_config_crtc {
> @@ -220,6 +223,10 @@ struct vkms_device {
>   #define item_to_configfs(item) \
>   	container_of(to_config_group(item), struct vkms_configfs, device_group)
>   
> +#define connector_item_to_configfs(item)                                     \
> +	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
> +		     connectors_group)
> +
>   #define item_to_config_connector(item)                                    \
>   	container_of(to_config_group(item), struct vkms_config_connector, \
>   		     config_group)
> @@ -279,4 +286,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
>   int vkms_init_configfs(void);
>   void vkms_unregister_configfs(void);
>   
> +/* Connector hotplugging */
> +enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
> +						bool force);
> +
>   #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0ee1f3f4a305..1a1cd0202c5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   
> +#include <drm/drm_print.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_crtc.h>
> @@ -8,10 +9,12 @@
>   #include <drm/drm_plane.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
> +#include <linux/printk.h>
>   
>   #include "vkms_drv.h"
>   
>   static const struct drm_connector_funcs vkms_connector_funcs = {
> +	.detect = vkms_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
>   	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
> @@ -19,6 +22,48 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
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
>   static const struct drm_encoder_funcs vkms_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
> @@ -280,12 +325,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   		struct vkms_config_connector *config_connector =
>   			item_to_config_connector(item);
>   		struct drm_connector *connector = vkms_connector_init(vkmsdev);
> -
>   		if (IS_ERR(connector)) {
>   			DRM_ERROR("Failed to init connector from config: %s",
>   				  item->ci_name);
>   			return PTR_ERR(connector);
>   		}
> +		config_connector->connector = connector;
>   
>   		for (int j = 0; j < output->num_encoders; j++) {
>   			struct encoder_map *encoder = &encoder_map[j];
