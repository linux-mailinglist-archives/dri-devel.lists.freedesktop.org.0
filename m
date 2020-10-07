Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059328624D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB6A6E925;
	Wed,  7 Oct 2020 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FF6B6E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:07:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18BE31B;
 Wed,  7 Oct 2020 05:07:48 -0700 (PDT)
Received: from localhost (unknown [10.1.199.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4267D3F71F;
 Wed,  7 Oct 2020 05:07:48 -0700 (PDT)
Date: Wed, 7 Oct 2020 13:07:46 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Message-ID: <20201007120746.GA15063@arm.com>
References: <20200921122007.29610-1-lukasz.luba@arm.com>
 <20200921122007.29610-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921122007.29610-4-lukasz.luba@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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

On Monday 21 Sep 2020 at 13:20:05 (+0100), Lukasz Luba wrote:
> The Energy Model (EM) framework supports devices such as Devfreq. Create
> new registration functions which automatically register EM for the thermal
> devfreq_cooling devices. This patch prepares the code for coming changes
> which are going to replace old power model with the new EM.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/thermal/devfreq_cooling.c | 99 ++++++++++++++++++++++++++++++-
>  include/linux/devfreq_cooling.h   | 22 +++++++
>  2 files changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> index cf045bd4d16b..7e091e795284 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -50,6 +50,8 @@ static DEFINE_IDA(devfreq_ida);
>   * @capped_state:	index to cooling state with in dynamic power budget
>   * @req_max_freq:	PM QoS request for limiting the maximum frequency
>   *			of the devfreq device.
> + * @em:		Energy Model which represents the associated Devfreq device
                                     ^^^^^^^^^^^^^^^^
				     for
> + * @em_registered:	Devfreq cooling registered the EM and should free it.
>   */
>  struct devfreq_cooling_device {
>  	int id;
> @@ -63,6 +65,8 @@ struct devfreq_cooling_device {
>  	u32 res_util;
>  	int capped_state;
>  	struct dev_pm_qos_request req_max_freq;
> +	struct em_perf_domain *em;
> +	bool em_registered;
>  };
>  
>  static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
> @@ -586,22 +590,115 @@ struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df)
>  }
>  EXPORT_SYMBOL_GPL(devfreq_cooling_register);
>  
> +/**
> + * devfreq_cooling_em_register_power() - Register devfreq cooling device with
> + *		power information and attempt to register Energy Model (EM)

It took me a while to understand the differences between devfreq
register functions and it left me with a nagging feeling that we don't
need all of them. Also, looking over the cpufreq cooling devices, they
keep their registering interfaces quite simple.

With the functions added by this patch, the devfreq cooling devices will have:
 - old:
       of_devfreq_cooling_register_power
       of_devfreq_cooling_register
       devfreq_cooling_register
       devfreq_cooling_unregister
 - new:
       devfreq_cooling_em_register_power
       devfreq_cooling_em_register

My question is whether we actually need the two new
devfreq_cooling_em_register_power() and devfreq_cooling_em_register()?

The power_ops and the em are dependent on one another, so could we
extend the of_devfreq_cooling_register_power() to do the additional em
registration. We only need a way to pass the em_cb and I think that
could fit nicely in devfreq_cooling_power.

To be noted that I've reviewed these interfaces in the context of the
final state of devfreq_cooling.c, after the changes in 4/5.

> + * @df:		Pointer to devfreq device.
> + * @dfc_power:	Pointer to devfreq_cooling_power.
> + * @em_cb:	Callback functions providing the data of the EM
> + *
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
> +		ret = em_dev_register_perf_domain(dev, nr_opp, em_cb, NULL);
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

Nit: Isn't it enough to check if dev->em_pd != NULL to be able to
unregister the perf_domain? That would remove the need for
dfc->em_registered.

I suppose one could say that's using implementation details on how the
EM is built and stored and we should not rely on it, so it's up to you
if you want to change it.

Kind regards,
Ionela.

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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
