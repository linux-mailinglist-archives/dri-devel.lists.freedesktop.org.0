Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444A23400C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EF76E9EF;
	Fri, 31 Jul 2020 07:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149E46E990
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:33:27 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 2B7F9A60;
 Fri, 31 Jul 2020 10:33:20 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.230] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14615T140283744343808S1596162798780194_; 
 Fri, 31 Jul 2020 10:33:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4a460cbde4c5ac07331aa2d6e4c56648>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/connector: Add of_drm_find_connector
To: daniel@ffwll.ch
References: <20200703094506.22527-1-andy.yan@rock-chips.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <3359f775-ba70-c116-e9b9-29b9ba692400@rock-chips.com>
Date: Fri, 31 Jul 2020 10:33:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703094506.22527-1-andy.yan@rock-chips.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping

On 7/3/20 5:45 PM, Andy Yan wrote:
> Add a function to look up a connector by
> device tree node, like what of_drm_find_bridge/panel
> does.
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reported-by: kernel test robot <lkp@intel.com>
>
> ---
>
> Changes in v2:
> - Add function declaration
>
>   drivers/gpu/drm/drm_connector.c | 33 +++++++++++++++++++++++++++++++++
>   include/drm/drm_connector.h     | 14 ++++++++++++++
>   2 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d877ddc6dc57..516376cd1868 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -743,6 +743,39 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter)
>   }
>   EXPORT_SYMBOL(drm_connector_list_iter_end);
>   
> +#ifdef CONFIG_OF
> +/**
> + * of_drm_find_connector - look up a connector using a device tree node
> + * @np: device tree node of the connector
> + *
> + *
> + * Return: A pointer to the connector which match the specified device tree
> + * node or NULL if no panel matching the device tree node can be found, or
> + * -ENODEV: the device is not available (status != "okay" or "ok")
> + */
> +struct drm_connector *of_drm_find_connector(struct drm_device *dev, const struct device_node *np)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	if (!of_device_is_available(np))
> +		return ERR_PTR(-ENODEV);
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (connector->of_node == np) {
> +			drm_connector_list_iter_end(&conn_iter);
> +			return connector;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(of_drm_find_connector);
> +#endif
> +
> +
>   static const struct drm_prop_enum_list drm_subpixel_enum_list[] = {
>   	{ SubPixelUnknown, "Unknown" },
>   	{ SubPixelHorizontalRGB, "Horizontal RGB" },
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fd543d1db9b2..d249e0498375 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1129,6 +1129,9 @@ struct drm_connector {
>   	/** @attr: sysfs attributes */
>   	struct device_attribute *attr;
>   
> +	/** @of_node: device tree node */
> +	struct device_node *of_node;
> +
>   	/**
>   	 * @head:
>   	 *
> @@ -1647,6 +1650,17 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
>   bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>   					struct drm_encoder *encoder);
>   
> +#if defined(CONFIG_OF)
> +struct drm_connector *
> +of_drm_find_connector(struct drm_device *dev, const struct device_node *np);
> +#else
> +static inline struct drm_connector *
> +of_drm_find_connector(struct drm_device *dev, const struct device_node *np)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
>   /**
>    * drm_for_each_connector_iter - connector_list iterator macro
>    * @connector: &struct drm_connector pointer used as cursor


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
