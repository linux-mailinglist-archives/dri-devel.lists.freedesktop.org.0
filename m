Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920B4FB61A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 10:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE38010F1DE;
	Mon, 11 Apr 2022 08:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D7010F160
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649666063; x=1681202063;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=H0zPUd6SqeY0SP/ZrmvMhMcUPe0MxxUMdu5O8GFwUeE=;
 b=Yg3W6j1kxkbUOYIq8bVZp+O7Sq9KMZZKn7iTkNc4kuRQC5L5x+iRPaxE
 4nwCSOkuZIzVIxlrVMIQkW56H15cFTubMCXLKqgsJ8ZZ9r6isKtc4i9M4
 X4YvaQdJoMt2NlfV7tnaDnwxB44ESqWuSOoFTOenvi4hKUNrvmRVAYG51
 EHiLN6o4qEQ2TX0l3SQrmIsfPUtZ53DTCkBkh4EmzZm55GigNMrzCQiZ4
 /LaeSOi1LVqE8OsG0vpT15m2WOaCZU15fRfbF552NJElXFbpAPpEnvapR
 Ry17h7r8kzdn8gGkC3jrOsnxkE8SGdhwYFigZ8ASJpWaeTOpwGNJ+kLqn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262246327"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="262246327"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 01:34:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="572028817"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 01:34:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers
 to use DP AUX bus properly
In-Reply-To: <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
Date: Mon, 11 Apr 2022 11:34:16 +0300
Message-ID: <87o818hvcn.fsf@intel.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Apr 2022, Douglas Anderson <dianders@chromium.org> wrote:
> As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> DP AUX bus properly we really need two "struct device"s. One "struct
> device" is in charge of providing the DP AUX bus and the other is
> where we'll try to get a reference to the newly probed endpoint
> devices.
>
> In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> is already broken up into several "struct devices" anyway because it
> also provides a PWM and some GPIOs. Adding one more wasn't that
> difficult / ugly.
>
> When I tried to do the same solution in parade-ps8640, it felt like I
> was copying too much boilerplate code. I made the realization that I
> didn't _really_ need a separate "driver" for each person that wanted
> to do the same thing. By putting all the "driver" related code in a
> common place then we could save a bit of hassle. This change
> effectively adds a new "ep_client" driver that can be used by
> anyone. The devices instantiated by this driver will just call through
> to the probe/remove/shutdown calls provided.
>
> At the moment, the "ep_client" driver is backed by the Linux auxiliary
> bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> want to expose this to clients, though, so as far as clients are
> concerned they get a vanilla "struct device".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

What is an "EP" client or device?

BR,
Jani.


> ---
>
>  drivers/gpu/drm/dp/drm_dp_aux_bus.c | 165 +++++++++++++++++++++++++++-
>  include/drm/dp/drm_dp_aux_bus.h     |  58 ++++++++++
>  2 files changed, 222 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/dp/drm_dp_aux_bus.c b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> index 415afce3cf96..5386ceacf133 100644
> --- a/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> @@ -12,6 +12,7 @@
>   * to perform transactions on that bus.
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -299,6 +300,163 @@ void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *drv)
>  }
>  EXPORT_SYMBOL_GPL(dp_aux_dp_driver_unregister);
>  
> +/* -----------------------------------------------------------------------------
> + * DP AUX EP Client
> + */
> +
> +struct dp_aux_ep_client_data {
> +	struct dp_aux_ep_client *client;
> +	struct auxiliary_device adev;
> +};
> +
> +static int dp_aux_ep_client_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (!data->client->probe)
> +		return 0;
> +
> +	return data->client->probe(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_remove(struct auxiliary_device *adev)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (data->client->remove)
> +		data->client->remove(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_shutdown(struct auxiliary_device *adev)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (data->client->shutdown)
> +		data->client->shutdown(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_dev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	kfree(data);
> +}
> +
> +/**
> + * dp_aux_register_ep_client() - Register an DP AUX EP client
> + * @client: The structure describing the client. It's the client's
> + *          responsibility to keep this memory around until
> + *          dp_aux_unregister_ep_client() is called, either explicitly or
> + *          implicitly via devm.
> + *
> + * See the description of "struct dp_aux_ep_client" for a full explanation
> + * of when you should use this and why.
> + *
> + * Return: 0 if no error or negative error code.
> + */
> +int dp_aux_register_ep_client(struct dp_aux_ep_client *client)
> +{
> +	struct dp_aux_ep_client_data *data;
> +	int ret;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->adev.name = "ep_client";
> +	data->adev.dev.parent = client->aux->dev;
> +	data->adev.dev.release = dp_aux_ep_client_dev_release;
> +	device_set_of_node_from_dev(&data->adev.dev, client->aux->dev);
> +
> +	ret = auxiliary_device_init(&data->adev);
> +	if (ret) {
> +		/*
> +		 * NOTE: if init doesn't fail then it takes ownership
> +		 * of memory and this kfree() is magically part of
> +		 * auxiliary_device_uninit().
> +		 */
> +		kfree(data);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(&data->adev);
> +	if (ret)
> +		goto err_did_init;
> +
> +	client->_opaque = data;
> +
> +	return 0;
> +
> +err_did_init:
> +	auxiliary_device_uninit(&data->adev);
> +	return ret;
> +}
> +
> +/**
> + * dp_aux_unregister_ep_client() - Inverse of dp_aux_register_ep_client()
> + * @client: The structure describing the client.
> + *
> + * If dp_aux_register_ep_client() returns no error then you should call this
> + * to free resources.
> + */
> +void dp_aux_unregister_ep_client(struct dp_aux_ep_client *client)
> +{
> +	struct dp_aux_ep_client_data *data = client->_opaque;
> +
> +	auxiliary_device_delete(&data->adev);
> +	auxiliary_device_uninit(&data->adev);
> +}
> +
> +static void dp_aux_unregister_ep_client_void(void *data)
> +{
> +	dp_aux_unregister_ep_client(data);
> +}
> +
> +/**
> + * devm_dp_aux_register_ep_client() - devm wrapper for dp_aux_register_ep_client()
> + * @client: The structure describing the client.
> + *
> + * Handles freeing w/ devm on the device "client->aux->dev".
> + *
> + * Return: 0 if no error or negative error code.
> + */
> +int devm_dp_aux_register_ep_client(struct dp_aux_ep_client *client)
> +{
> +	int ret;
> +
> +	ret = dp_aux_register_ep_client(client);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(client->aux->dev,
> +					dp_aux_unregister_ep_client_void,
> +					client);
> +}
> +
> +static const struct auxiliary_device_id dp_aux_ep_client_id_table[] = {
> +	{ .name = "drm_dp_aux_bus.ep_client", },
> +	{},
> +};
> +
> +static struct auxiliary_driver dp_aux_ep_client_driver = {
> +	.name = "ep_client",
> +	.probe = dp_aux_ep_client_probe,
> +	.remove = dp_aux_ep_client_remove,
> +	.shutdown = dp_aux_ep_client_shutdown,
> +	.id_table = dp_aux_ep_client_id_table,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Module init
> + */
> +
>  static int __init dp_aux_bus_init(void)
>  {
>  	int ret;
> @@ -307,11 +465,16 @@ static int __init dp_aux_bus_init(void)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	ret = auxiliary_driver_register(&dp_aux_ep_client_driver);
> +	if (ret)
> +		bus_unregister(&dp_aux_bus_type);
> +
> +	return ret;
>  }
>  
>  static void __exit dp_aux_bus_exit(void)
>  {
> +	auxiliary_driver_unregister(&dp_aux_ep_client_driver);
>  	bus_unregister(&dp_aux_bus_type);
>  }
>  
> diff --git a/include/drm/dp/drm_dp_aux_bus.h b/include/drm/dp/drm_dp_aux_bus.h
> index 4f19b20b1dd6..ecf68b6873bd 100644
> --- a/include/drm/dp/drm_dp_aux_bus.h
> +++ b/include/drm/dp/drm_dp_aux_bus.h
> @@ -54,4 +54,62 @@ int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *aux_ep_drv,
>  				struct module *owner);
>  void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *aux_ep_drv);
>  
> +/**
> + * struct dp_aux_ep_device - Helper for clients of DP AUX EP devices
> + *
> + * The DP AUX bus can be a bit tricky to use properly. Usually, the way
> + * things work is that:
> + * - The DP controller driver provides the DP AUX bus and would like to probe
> + *   the endpoints on the DP AUX bus (AKA the panel) as part of its probe
> + *   routine.
> + * - The DP controller driver would also like to acquire a reference to the
> + *   DP AUX endpoints (AKA the panel) as part of its probe.
> + *
> + * The problem is that the DP AUX endpoints aren't guaranteed to complete their
> + * probe right away. They could be probing asynchronously or they simply might
> + * fail to acquire some resource and return -EPROBE_DEFER.
> + *
> + * The best way to solve this is to break the DP controller's probe into
> + * two parts. The first part will create the DP AUX bus. The second part will
> + * acquire the reference to the DP AUX endpoint. The first part can complete
> + * finish with no problems and be "done" even if the second part ends up
> + * deferring while waiting for the DP AUX endpoint.
> + *
> + * The dp_aux_ep_client structure and associated functions help with managing
> + * this common case. They will create/add a second "struct device" for you.
> + * In the probe for this second "struct device" (known as the "clientdev" here)
> + * you can acquire references to the AUX DP endpoints and can freely return
> + * -EPROBE_DEFER if they're not ready yet.
> + *
> + * A few notes:
> + * - The parent of the clientdev is guaranteed to be aux->dev
> + * - The of_node of the clientdev is guaranteed to be the same as the of_node
> + *   of aux->dev, copied with device_set_of_node_from_dev().
> + * - If you're doing "devm" type things in the clientdev's probe you should
> + *   use the clientdev. This makes lifetimes be managed properly.
> + *
> + * NOTE: there's no requirement to use these helpers if you have solved the
> + * problem described above in some other way.
> + */
> +struct dp_aux_ep_client {
> +	/** @probe: The second half of the probe */
> +	int (*probe)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @remove: Remove function corresponding to the probe */
> +	void (*remove)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @shutdown: Shutdown function corresponding to the probe */
> +	void (*shutdown)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @aux: The AUX bus */
> +	struct drm_dp_aux *aux;
> +
> +	/** @_opaque: Used by the implementation */
> +	void *_opaque;
> +};
> +
> +int dp_aux_register_ep_client(struct dp_aux_ep_client *client);
> +void dp_aux_unregister_ep_client(struct dp_aux_ep_client *client);
> +int devm_dp_aux_register_ep_client(struct dp_aux_ep_client *client);
> +
>  #endif /* _DP_AUX_BUS_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
