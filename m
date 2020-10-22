Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C354A296A33
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FB6E49A;
	Fri, 23 Oct 2020 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34A886E087
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 11:26:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96FBED6E;
 Thu, 22 Oct 2020 04:26:45 -0700 (PDT)
Received: from [10.57.20.67] (unknown [10.57.20.67])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4262F3F66B;
 Thu, 22 Oct 2020 04:26:43 -0700 (PDT)
Subject: Re: [PATCH 4/5] thermal: devfreq_cooling: remove old power model and
 use EM
To: Ionela Voinescu <ionela.voinescu@arm.com>
References: <20200921122007.29610-1-lukasz.luba@arm.com>
 <20200921122007.29610-5-lukasz.luba@arm.com> <20201007151225.GB15063@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <4929dcfa-9ab0-52fa-8426-50cda52eb8dc@arm.com>
Date: Thu, 22 Oct 2020 12:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201007151225.GB15063@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/7/20 4:12 PM, Ionela Voinescu wrote:
> Hi Lukasz,
> 
> On Monday 21 Sep 2020 at 13:20:06 (+0100), Lukasz Luba wrote:
> [..]
>>   /**
>> - * freq_get_state() - get the cooling state corresponding to a frequency
>> + * freq_get_state() - get the performance index corresponding to a frequency
> 
> If we change the meaning of the return value, I think the function needs
> a name change as well.
> 
> Also, we do treat this as a cooling state when we do validation and
> compare it to THERMAL_CSTATE_INVALID,  but it's not actually a cooling
> state (it's max_state - state). It does create confusion if we name
> "state" both a performance index and a cooling state.
> 
> Given that the only user is devfreq_cooling_get_requested_power(),
> might be good to collapse freq_get_state() in that function and rename
> the "state" variable in there to "em_perf_idx".

I will have a look into this.

> 
>>    * @dfc:	Pointer to devfreq cooling device
>> - * @freq:	frequency in Hz
>> + * @freq:	frequency in kHz
>>    *
>> - * Return: the cooling state associated with the @freq, or
>> + * Return: the performance index associated with the @freq, or
>>    * THERMAL_CSTATE_INVALID if it wasn't found.
>>    */
>>   static unsigned long
>> @@ -128,8 +130,8 @@ freq_get_state(struct devfreq_cooling_device *dfc, unsigned long freq)
>>   {
>>   	int i;
>>   
>> -	for (i = 0; i < dfc->freq_table_size; i++) {
>> -		if (dfc->freq_table[i] == freq)
>> +	for (i = 0; i <= dfc->max_state; i++) {
>> +		if (dfc->em->table[i].frequency == freq)
>>   			return i;
>>   	}
>>   
>> @@ -164,71 +166,15 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
>>   	return voltage;
>>   }
>>   
>> -/**
>> - * get_static_power() - calculate the static power
>> - * @dfc:	Pointer to devfreq cooling device
>> - * @freq:	Frequency in Hz
>> - *
>> - * Calculate the static power in milliwatts using the supplied
>> - * get_static_power().  The current voltage is calculated using the
>> - * OPP library.  If no get_static_power() was supplied, assume the
>> - * static power is negligible.
>> - */
>> -static unsigned long
>> -get_static_power(struct devfreq_cooling_device *dfc, unsigned long freq)
>> +static void dfc_em_get_requested_power(struct em_perf_domain *em,
>> +				       struct devfreq_dev_status *status,
>> +				       u32 *power, int em_perf_idx)
> 
> Is there a reason for not directly returning the power value in this
> function? Also, this only does a few arithmetic operations and it's only
> called in one place. Is it worth to have this in a separate function?

Good question, maybe I will just put this code where it's called.

> 
> [..]
>> @@ -345,11 +279,8 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
>>   	struct devfreq_cooling_device *dfc = cdev->devdata;
>>   	struct devfreq *df = dfc->devfreq;
>>   	struct devfreq_dev_status status;
>> -	unsigned long busy_time;
>> +	u32 est_power = power;
> 
> Nit: You could use power directly and remove est_power as well.
> 
>>   	unsigned long freq;
>> -	s32 dyn_power;
>> -	u32 static_power;
>> -	s32 est_power;
>>   	int i;
>>   
>>   	mutex_lock(&df->lock);
>> @@ -358,31 +289,26 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
>>   
>>   	freq = status.current_frequency;
>>   
>> -	if (dfc->power_ops->get_real_power) {
>> +	if (dfc->power_ops && dfc->power_ops->get_real_power) {
>>   		/* Scale for resource utilization */
>>   		est_power = power * dfc->res_util;
>>   		est_power /= SCALE_ERROR_MITIGATION;
>>   	} else {
>> -		static_power = get_static_power(dfc, freq);
>> -
>> -		dyn_power = power - static_power;
>> -		dyn_power = dyn_power > 0 ? dyn_power : 0;
>> -
>> -		/* Scale dynamic power for utilization */
>> -		busy_time = status.busy_time ?: 1;
>> -		est_power = (dyn_power * status.total_time) / busy_time;
>> +		_normalize_load(&status);
>> +		est_power *= status.total_time;
>> +		est_power /= status.busy_time;
>>   	}
>>   
>>   	/*
>>   	 * Find the first cooling state that is within the power
>> -	 * budget for dynamic power.
>> +	 * budget. The EM power table is sorted ascending.
>>   	 */
>> -	for (i = 0; i < dfc->freq_table_size - 1; i++)
>> -		if (est_power >= dfc->power_table[i])
>> +	for (i = dfc->max_state; i > 0; i--)
>> +		if (est_power >= dfc->em->table[i].power)
>>   			break;
>>   
>> -	*state = i;
>> -	dfc->capped_state = i;
>> +	*state = dfc->max_state - i;
>> +	dfc->capped_state = *state;
>>   	trace_thermal_power_devfreq_limit(cdev, freq, *state, power);
>>   	return 0;
>>   }
> [..]
>>   /**
>> @@ -503,7 +381,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>>   	struct thermal_cooling_device *cdev;
>>   	struct devfreq_cooling_device *dfc;
>>   	char dev_name[THERMAL_NAME_LENGTH];
>> -	int err;
>> +	int err, num_opps;
>>   
>>   	dfc = kzalloc(sizeof(*dfc), GFP_KERNEL);
>>   	if (!dfc)
>> @@ -511,28 +389,45 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>>   
>>   	dfc->devfreq = df;
>>   
>> -	if (dfc_power) {
>> -		dfc->power_ops = dfc_power;
>> -
>> +	dfc->em = em_pd_get(df->dev.parent);
>> +	if (dfc->em) {
>>   		devfreq_cooling_ops.get_requested_power =
>>   			devfreq_cooling_get_requested_power;
>>   		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
>>   		devfreq_cooling_ops.power2state = devfreq_cooling_power2state;
>> +
>> +		dfc->power_ops = dfc_power;
>> +
>> +		num_opps = em_pd_nr_perf_states(dfc->em);
>> +	} else {
>> +		/* Backward compatibility for drivers which do not use IPA */
>> +		dev_dbg(df->dev.parent, "missing EM for cooling device\n");
>> +
>> +		num_opps = dev_pm_opp_get_opp_count(df->dev.parent);
>> +
>> +		err = devfreq_cooling_gen_tables(dfc, num_opps);
>> +		if (err)
>> +			goto free_dfc;
>>   	}
>>   
>> -	err = devfreq_cooling_gen_tables(dfc);
>> -	if (err)
>> +	if (num_opps <= 0) {
>> +		err = -EINVAL;
>>   		goto free_dfc;
>> +	}
>> +
>> +	/* max_state is an index, not a counter */
> 
> Nit: Might be more clear to replace "index" with cooling state. Then
> knowledge about cooling states would make this more clear.

Similar comment is in cpufreq_cooling.c. The 'index' here means the last
valid index in the array.

Thank you for the review comments for all patches.

Regards,
Lukasz

> 
> Regards,
> Ionela.
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
