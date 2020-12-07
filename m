Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFBA2D25FB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F16E95F;
	Tue,  8 Dec 2020 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A91F089E59
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:46:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DABE31042;
 Mon,  7 Dec 2020 01:46:41 -0800 (PST)
Received: from [10.57.29.223] (unknown [10.57.29.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1968F3F66B;
 Mon,  7 Dec 2020 01:46:38 -0800 (PST)
Subject: Re: [PATCH v2 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-4-lukasz.luba@arm.com>
 <2eb16ccf-f635-af2d-616f-9cd0cec88ca0@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <103109c4-f7fd-7f53-e336-241b8a2c080e@arm.com>
Date: Mon, 7 Dec 2020 09:46:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2eb16ccf-f635-af2d-616f-9cd0cec88ca0@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/3/20 3:40 PM, Daniel Lezcano wrote:
> On 18/11/2020 13:03, Lukasz Luba wrote:
>> The Energy Model (EM) framework supports devices such as Devfreq. Create
>> new registration functions which automatically register EM for the thermal
>> devfreq_cooling devices. This patch prepares the code for coming changes
>> which are going to replace old power model with the new EM.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/thermal/devfreq_cooling.c | 99 ++++++++++++++++++++++++++++++-
>>   include/linux/devfreq_cooling.h   | 22 +++++++
>>   2 files changed, 120 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
>> index 925523694462..b354271742c5 100644
>> --- a/drivers/thermal/devfreq_cooling.c
>> +++ b/drivers/thermal/devfreq_cooling.c
>> @@ -50,6 +50,8 @@ static DEFINE_IDA(devfreq_ida);
>>    * @capped_state:	index to cooling state with in dynamic power budget
>>    * @req_max_freq:	PM QoS request for limiting the maximum frequency
>>    *			of the devfreq device.
>> + * @em:		Energy Model for the associated Devfreq device
>> + * @em_registered:	Devfreq cooling registered the EM and should free it.
>>    */
>>   struct devfreq_cooling_device {
>>   	int id;
>> @@ -63,6 +65,8 @@ struct devfreq_cooling_device {
>>   	u32 res_util;
>>   	int capped_state;
>>   	struct dev_pm_qos_request req_max_freq;
>> +	struct em_perf_domain *em;
> 
> This pointer is not needed, it is in the struct device.

It is just a helper pointer, to make the code simpler and avoid nested
pointers:

struct device *dev = dfc->devfreq->dev.parent
and then using dev->em

The code is cleaner with dfc->em, but let me have a look if I can
remove it and still have a clean code.

> 
>> +	bool em_registered;
> 
> The boolean em_registered is not needed because of the test in the
> function em_dev_unregister_perf_domain():
> 
> if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
>                  return;
> 
> Logically if the 'em' was not initialized, it must be NULL, the
> corresponding struct device was zero-allocated.

It was needed for devfreq cooling to know who registered the EM.
If there is 2 frameworks and driver and all could register EM,
this code cannot blindly unregister EM in it's code. The EM might
be used still by PowerCap DTM, so the unregister might be called
explicitly by the driver.

But I will rewrite the register function and make it way simpler,
just registration of EM (stopping when it failed) and then cooling
device. Also unregister will be simpler.

Driver will have to keep the order of unregister functions for two
frameworks and call unregister devfreq cooling device as last one,
because it will remove the EM.

> 
> 
>>   };
>>   
>>   static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
>> @@ -583,22 +587,115 @@ struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df)
>>   }
>>   EXPORT_SYMBOL_GPL(devfreq_cooling_register);
>>   
>> +/**
>> + * devfreq_cooling_em_register_power() - Register devfreq cooling device with
>> + *		power information and attempt to register Energy Model (EM)
>> + * @df:		Pointer to devfreq device.
>> + * @dfc_power:	Pointer to devfreq_cooling_power.
>> + * @em_cb:	Callback functions providing the data of the EM
>> + *
>> + * Register a devfreq cooling device and attempt to register Energy Model. The
>> + * available OPPs must be registered for the device.
>> + *
>> + * If @dfc_power is provided, the cooling device is registered with the
>> + * power extensions. If @em_cb is provided it will be called for each OPP to
>> + * calculate power value and cost. If @em_cb is not provided then simple Energy
>> + * Model is going to be used, which requires "dynamic-power-coefficient" a
>> + * devicetree property.
>> + */
>> +struct thermal_cooling_device *
>> +devfreq_cooling_em_register_power(struct devfreq *df,
>> +				  struct devfreq_cooling_power *dfc_power,
>> +				  struct em_data_callback *em_cb)
>> +{
>> +	struct thermal_cooling_device *cdev;
>> +	struct devfreq_cooling_device *dfc;
>> +	struct device_node *np = NULL;
>> +	struct device *dev;
>> +	int nr_opp, ret;
>> +
>> +	if (IS_ERR_OR_NULL(df))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	dev = df->dev.parent;
> 
> Why the parent ?

The parent has OPPs and we are calling em_perf_domain_register() or
dev_pm_opp_of_register_em() (which in addition needs DT node) for that
device.

The old devfreq cooling code also had dev parent, to enable/disenable
OPPs.

> 
>> +
>> +	if (em_cb) {
>> +		nr_opp = dev_pm_opp_get_opp_count(dev);
>> +		if (nr_opp <= 0) {
>> +			dev_err(dev, "No valid OPPs found\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +
>> +		ret = em_dev_register_perf_domain(dev, nr_opp, em_cb, NULL, false);
>> +	} else {
>> +		ret = dev_pm_opp_of_register_em(dev, NULL);
>> +	}
>> +
>> +	if (ret)
>> +		dev_warn(dev, "Unable to register EM for devfreq cooling device (%d)\n",
>> +			 ret);
>> +
>> +	if (dev->of_node)
>> +		np = of_node_get(dev->of_node);
>> +
>> +	cdev = of_devfreq_cooling_register_power(np, df, dfc_power);
>> +
>> +	if (np)
>> +		of_node_put(np);> +
>> +	if (IS_ERR_OR_NULL(cdev)) {
>> +		if (!ret)
>> +			em_dev_unregister_perf_domain(dev);
>> +	} else {
>> +		dfc = cdev->devdata;
>> +		dfc->em_registered = !ret;
>> +	}
>> +
>> +	return cdev;
>> +}
>> +EXPORT_SYMBOL_GPL(devfreq_cooling_em_register_power);
>> +
>> +/**
>> + * devfreq_cooling_em_register() - Register devfreq cooling device together
>> + *				with Energy Model.
>> + * @df:		Pointer to devfreq device.
>> + * @em_cb:	Callback functions providing the data of the Energy Model
>> + *
>> + * This function attempts to register Energy Model for devfreq device and then
>> + * register the devfreq cooling device.
>> + */
>> +struct thermal_cooling_device *
>> +devfreq_cooling_em_register(struct devfreq *df, struct em_data_callback *em_cb)
>> +{
>> +	return devfreq_cooling_em_register_power(df, NULL, em_cb);
>> +}
>> +EXPORT_SYMBOL_GPL(devfreq_cooling_em_register);
>> +
>>   /**
>>    * devfreq_cooling_unregister() - Unregister devfreq cooling device.
>>    * @cdev: Pointer to devfreq cooling device to unregister.
>> + *
>> + * Unregisters devfreq cooling device and related Energy Model if it was
>> + * present.
>>    */
>>   void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
>>   {
>>   	struct devfreq_cooling_device *dfc;
>> +	struct device *dev;
>>   
>> -	if (!cdev)
>> +	if (IS_ERR_OR_NULL(cdev))
> 
> Why this additional IS_ERR check ?

Not needed too much, but helps if driver doesn't check the
result of registration function and then just calls unregister
function, i.e.

	if (pfdev->devfreq.cooling)
		devfreq_cooling_unregister(pfdev->devfreq.cooling);

> 
>>   		return;
>>   
>>   	dfc = cdev->devdata;
>> +	dev = dfc->devfreq->dev.parent;
>>   
>>   	thermal_cooling_device_unregister(dfc->cdev);
>>   	ida_simple_remove(&devfreq_ida, dfc->id);
>>   	dev_pm_qos_remove_request(&dfc->req_max_freq);
>> +
>> +	if (dfc->em_registered)
>> +		em_dev_unregister_perf_domain(dev);
>> +
> 
> As stated before it can be called unconditionally

OK, I will rewrite it. The goal was to be able handle many situations
in register/unregister function, but I will make them simpler.

Thank you Daniel for review comments. I will address them in next
version.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
