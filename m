Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0D2CD0E2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DE46E09C;
	Thu,  3 Dec 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D16EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 10:23:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C486F30E;
 Wed,  2 Dec 2020 02:23:14 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62CD93F66B;
 Wed,  2 Dec 2020 02:23:14 -0800 (PST)
Date: Wed, 2 Dec 2020 10:23:12 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v2 1/5] thermal: devfreq_cooling: change tracing function
 and arguments
Message-ID: <20201202102312.GA9486@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118120358.17150-2-lukasz.luba@arm.com>
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

On Wednesday 18 Nov 2020 at 12:03:54 (+0000), Lukasz Luba wrote:
> Prepare for deleting the static and dynamic power calculation and clean
> the trace function. These two fields are going to be removed in the next
> changes.
> 
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/thermal/devfreq_cooling.c |  3 +--
>  include/trace/events/thermal.h    | 19 +++++++++----------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> index dfab49a67252..659c0143c9f0 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -277,8 +277,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
>  		*power = dyn_power + static_power;
>  	}
>  
> -	trace_thermal_power_devfreq_get_power(cdev, status, freq, dyn_power,
> -					      static_power, *power);
> +	trace_thermal_power_devfreq_get_power(cdev, status, freq, *power);
>  
>  	return 0;
>  fail:
> diff --git a/include/trace/events/thermal.h b/include/trace/events/thermal.h
> index 135e5421f003..8a5f04888abd 100644
> --- a/include/trace/events/thermal.h
> +++ b/include/trace/events/thermal.h
> @@ -153,31 +153,30 @@ TRACE_EVENT(thermal_power_cpu_limit,
>  TRACE_EVENT(thermal_power_devfreq_get_power,
>  	TP_PROTO(struct thermal_cooling_device *cdev,
>  		 struct devfreq_dev_status *status, unsigned long freq,
> -		u32 dynamic_power, u32 static_power, u32 power),
> +		u32 power),
>  
> -	TP_ARGS(cdev, status,  freq, dynamic_power, static_power, power),
> +	TP_ARGS(cdev, status,  freq, power),
>  
>  	TP_STRUCT__entry(
>  		__string(type,         cdev->type    )
>  		__field(unsigned long, freq          )
> -		__field(u32,           load          )
> -		__field(u32,           dynamic_power )
> -		__field(u32,           static_power  )
> +		__field(u32,           busy_time)
> +		__field(u32,           total_time)
>  		__field(u32,           power)
>  	),
>  
>  	TP_fast_assign(
>  		__assign_str(type, cdev->type);
>  		__entry->freq = freq;
> -		__entry->load = (100 * status->busy_time) / status->total_time;
> -		__entry->dynamic_power = dynamic_power;
> -		__entry->static_power = static_power;
> +		__entry->busy_time = status->busy_time;
> +		__entry->total_time = status->total_time;
>  		__entry->power = power;
>  	),
>  
> -	TP_printk("type=%s freq=%lu load=%u dynamic_power=%u static_power=%u power=%u",
> +	TP_printk("type=%s freq=%lu load=%u power=%u",
>  		__get_str(type), __entry->freq,
> -		__entry->load, __entry->dynamic_power, __entry->static_power,
> +		__entry->total_time == 0 ? 0 :
> +			(100 * __entry->busy_time) / __entry->total_time,
>  		__entry->power)
>  );
>  
> -- 
> 2.17.1
> 

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

Regards,
Ionela.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
