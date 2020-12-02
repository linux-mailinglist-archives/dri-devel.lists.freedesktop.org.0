Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F642CD0F5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B076E9AD;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9EC16EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 10:23:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF551042;
 Wed,  2 Dec 2020 02:23:41 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1AA63F66B;
 Wed,  2 Dec 2020 02:23:40 -0800 (PST)
Date: Wed, 2 Dec 2020 10:23:39 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v2 2/5] thermal: devfreq_cooling: get a copy of device
 status
Message-ID: <20201202102339.GB9486@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118120358.17150-3-lukasz.luba@arm.com>
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

On Wednesday 18 Nov 2020 at 12:03:55 (+0000), Lukasz Luba wrote:
> Devfreq cooling needs to now the correct status of the device in order
> to operate. Do not rely on Devfreq last_status which might be a stale data
> and get more up-to-date values of the load.
> 
> Devfreq framework can change the device status in the background. To
> mitigate this situation make a copy of the status structure and use it
> for internal calculations.
> 
> In addition this patch adds normalization function, which also makes sure
> that whatever data comes from the device, it is in a sane range.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/thermal/devfreq_cooling.c | 52 +++++++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> index 659c0143c9f0..925523694462 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -227,20 +227,46 @@ static inline unsigned long get_total_power(struct devfreq_cooling_device *dfc,
>  							       voltage);
>  }
>  
> +static void _normalize_load(struct devfreq_dev_status *status)
> +{
> +	/* Make some space if needed */
> +	if (status->busy_time > 0xffff) {
> +		status->busy_time >>= 10;
> +		status->total_time >>= 10;
> +	}
> +
> +	if (status->busy_time > status->total_time)
> +		status->busy_time = status->total_time;
> +
> +	status->busy_time *= 100;
> +	status->busy_time /= status->total_time ? : 1;
> +
> +	/* Avoid division by 0 */
> +	status->busy_time = status->busy_time ? : 1;
> +	status->total_time = 100;
> +}
>  
>  static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cdev,
>  					       u32 *power)
>  {
>  	struct devfreq_cooling_device *dfc = cdev->devdata;
>  	struct devfreq *df = dfc->devfreq;
> -	struct devfreq_dev_status *status = &df->last_status;
> +	struct devfreq_dev_status status;
>  	unsigned long state;
> -	unsigned long freq = status->current_frequency;
> +	unsigned long freq;
>  	unsigned long voltage;
>  	u32 dyn_power = 0;
>  	u32 static_power = 0;
>  	int res;
>  
> +	mutex_lock(&df->lock);
> +	res = df->profile->get_dev_status(df->dev.parent, &status);
> +	mutex_unlock(&df->lock);
> +	if (res)
> +		return res;
> +
> +	freq = status.current_frequency;
> +
>  	state = freq_get_state(dfc, freq);
>  	if (state == THERMAL_CSTATE_INVALID) {
>  		res = -EAGAIN;
> @@ -268,16 +294,18 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
>  	} else {
>  		dyn_power = dfc->power_table[state];
>  
> +		_normalize_load(&status);
> +
>  		/* Scale dynamic power for utilization */
> -		dyn_power *= status->busy_time;
> -		dyn_power /= status->total_time;
> +		dyn_power *= status.busy_time;
> +		dyn_power /= status.total_time;
>  		/* Get static power */
>  		static_power = get_static_power(dfc, freq);
>  
>  		*power = dyn_power + static_power;
>  	}
>  
> -	trace_thermal_power_devfreq_get_power(cdev, status, freq, *power);
> +	trace_thermal_power_devfreq_get_power(cdev, &status, freq, *power);
>  
>  	return 0;
>  fail:
> @@ -309,14 +337,20 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
>  {
>  	struct devfreq_cooling_device *dfc = cdev->devdata;
>  	struct devfreq *df = dfc->devfreq;
> -	struct devfreq_dev_status *status = &df->last_status;
> -	unsigned long freq = status->current_frequency;
> +	struct devfreq_dev_status status;
>  	unsigned long busy_time;
> +	unsigned long freq;
>  	s32 dyn_power;
>  	u32 static_power;
>  	s32 est_power;
>  	int i;
>  
> +	mutex_lock(&df->lock);
> +	status = df->last_status;
> +	mutex_unlock(&df->lock);
> +
> +	freq = status.current_frequency;
> +
>  	if (dfc->power_ops->get_real_power) {
>  		/* Scale for resource utilization */
>  		est_power = power * dfc->res_util;
> @@ -328,8 +362,8 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
>  		dyn_power = dyn_power > 0 ? dyn_power : 0;
>  
>  		/* Scale dynamic power for utilization */
> -		busy_time = status->busy_time ?: 1;
> -		est_power = (dyn_power * status->total_time) / busy_time;
> +		busy_time = status.busy_time ?: 1;
> +		est_power = (dyn_power * status.total_time) / busy_time;
>  	}
>  
>  	/*
> -- 
> 2.17.1
> 

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

Thanks,
Ionela.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
