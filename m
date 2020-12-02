Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7B2CD0ED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7356E0CF;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07C366E9C7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 10:24:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE54F30E;
 Wed,  2 Dec 2020 02:24:41 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 584BC3F66B;
 Wed,  2 Dec 2020 02:24:41 -0800 (PST)
Date: Wed, 2 Dec 2020 10:24:39 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v2 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Message-ID: <20201202102439.GA1639@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118120358.17150-4-lukasz.luba@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, orjan.eide@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukasz,

On Wednesday 18 Nov 2020 at 12:03:56 (+0000), Lukasz Luba wrote:
> + * Register a devfreq cooling device and attempt to register Energy Model. The
> + * available OPPs must be registered for the device.
> + *
> + * If @dfc_power is provided, the cooling device is registered with the
> + * power extensions. If @em_cb is provided it will be called for each OPP to
> + * calculate power value and cost. If @em_cb is not provided then simple Energy
> + * Model is going to be used, which requires "dynamic-power-coefficient" a
> + * devicetree property.
> + */
> +struct thermal_cooling_device *
> +devfreq_cooling_em_register_power(struct devfreq *df,
> +				  struct devfreq_cooling_power *dfc_power,
> +				  struct em_data_callback *em_cb)
> +{
> +	struct thermal_cooling_device *cdev;
> +	struct devfreq_cooling_device *dfc;
> +	struct device_node *np = NULL;
> +	struct device *dev;
> +	int nr_opp, ret;
> +
> +	if (IS_ERR_OR_NULL(df))
> +		return ERR_PTR(-EINVAL);
> +
> +	dev = df->dev.parent;
> +
> +	if (em_cb) {
> +		nr_opp = dev_pm_opp_get_opp_count(dev);
> +		if (nr_opp <= 0) {
> +			dev_err(dev, "No valid OPPs found\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		ret = em_dev_register_perf_domain(dev, nr_opp, em_cb, NULL, false);
> +	} else {
> +		ret = dev_pm_opp_of_register_em(dev, NULL);
> +	}
> +
> +	if (ret)
> +		dev_warn(dev, "Unable to register EM for devfreq cooling device (%d)\n",
> +			 ret);
> +
> +	if (dev->of_node)
> +		np = of_node_get(dev->of_node);
> +

Should np be checked before use? I'm not sure if it's better to do the
assign first and then the check on np before use. It depends on the
consequences of passing a NULL node pointer later on.

> +	cdev = of_devfreq_cooling_register_power(np, df, dfc_power);
> +
> +	if (np)
> +		of_node_put(np);
> +
> +	if (IS_ERR_OR_NULL(cdev)) {
> +		if (!ret)
> +			em_dev_unregister_perf_domain(dev);
> +	} else {
> +		dfc = cdev->devdata;
> +		dfc->em_registered = !ret;
> +	}
> +
> +	return cdev;
> +}
> +EXPORT_SYMBOL_GPL(devfreq_cooling_em_register_power);
> +
> +/**
> + * devfreq_cooling_em_register() - Register devfreq cooling device together
> + *				with Energy Model.
> + * @df:		Pointer to devfreq device.
> + * @em_cb:	Callback functions providing the data of the Energy Model
> + *
> + * This function attempts to register Energy Model for devfreq device and then
> + * register the devfreq cooling device.
> + */
> +struct thermal_cooling_device *
> +devfreq_cooling_em_register(struct devfreq *df, struct em_data_callback *em_cb)
> +{
> +	return devfreq_cooling_em_register_power(df, NULL, em_cb);
> +}
> +EXPORT_SYMBOL_GPL(devfreq_cooling_em_register);
> +
>  /**
>   * devfreq_cooling_unregister() - Unregister devfreq cooling device.
>   * @cdev: Pointer to devfreq cooling device to unregister.
> + *
> + * Unregisters devfreq cooling device and related Energy Model if it was
> + * present.
>   */
>  void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
>  {
>  	struct devfreq_cooling_device *dfc;
> +	struct device *dev;
>  
> -	if (!cdev)
> +	if (IS_ERR_OR_NULL(cdev))
>  		return;
>  
>  	dfc = cdev->devdata;
> +	dev = dfc->devfreq->dev.parent;
>  
>  	thermal_cooling_device_unregister(dfc->cdev);
>  	ida_simple_remove(&devfreq_ida, dfc->id);
>  	dev_pm_qos_remove_request(&dfc->req_max_freq);
> +
> +	if (dfc->em_registered)
> +		em_dev_unregister_perf_domain(dev);
> +
>  	kfree(dfc->power_table);
>  	kfree(dfc->freq_table);
>  
> diff --git a/include/linux/devfreq_cooling.h b/include/linux/devfreq_cooling.h
> index 9df2dfca68dd..19868fb922f1 100644
> --- a/include/linux/devfreq_cooling.h
> +++ b/include/linux/devfreq_cooling.h
> @@ -11,6 +11,7 @@
>  #define __DEVFREQ_COOLING_H__
>  
>  #include <linux/devfreq.h>
> +#include <linux/energy_model.h>
>  #include <linux/thermal.h>
>  
>  
> @@ -65,6 +66,13 @@ struct thermal_cooling_device *
>  of_devfreq_cooling_register(struct device_node *np, struct devfreq *df);
>  struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df);
>  void devfreq_cooling_unregister(struct thermal_cooling_device *dfc);
> +struct thermal_cooling_device *
> +devfreq_cooling_em_register_power(struct devfreq *df,
> +				  struct devfreq_cooling_power *dfc_power,
> +				  struct em_data_callback *em_cb);
> +struct thermal_cooling_device *
> +devfreq_cooling_em_register(struct devfreq *df,
> +			    struct em_data_callback *em_cb);
>  
>  #else /* !CONFIG_DEVFREQ_THERMAL */
>  
> @@ -87,6 +95,20 @@ devfreq_cooling_register(struct devfreq *df)
>  	return ERR_PTR(-EINVAL);
>  }
>  
> +static inline struct thermal_cooling_device *
> +devfreq_cooling_em_register_power(struct devfreq *df,
> +				  struct devfreq_cooling_power *dfc_power,
> +				  struct em_data_callback *em_cb)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline struct thermal_cooling_device *
> +devfreq_cooling_em_register(struct devfreq *df,	struct em_data_callback *em_cb)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static inline void
>  devfreq_cooling_unregister(struct thermal_cooling_device *dfc)
>  {
> -- 
> 2.17.1
> 

Otherwise it looks good to me:

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

Ionela.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
