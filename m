Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3202286531
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F26E959;
	Wed,  7 Oct 2020 16:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A77689243
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:11:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FED31FB;
 Wed,  7 Oct 2020 09:11:22 -0700 (PDT)
Received: from localhost (unknown [10.1.199.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E52073F66B;
 Wed,  7 Oct 2020 09:11:21 -0700 (PDT)
Date: Wed, 7 Oct 2020 17:11:20 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 2/5] thermal: devfreq_cooling: get a copy of device status
Message-ID: <20201007161120.GC15063@arm.com>
References: <20200921122007.29610-1-lukasz.luba@arm.com>
 <20200921122007.29610-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921122007.29610-3-lukasz.luba@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Oct 2020 16:49:03 +0000
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

On Monday 21 Sep 2020 at 13:20:04 (+0100), Lukasz Luba wrote:
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
> index 7063ccb7b86d..cf045bd4d16b 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -227,6 +227,24 @@ static inline unsigned long get_total_power(struct devfreq_cooling_device *dfc,
>  							       voltage);
>  }
>  
> +static void _normalize_load(struct devfreq_dev_status *status)

Is there a reason for the leading "_" ?
AFAIK, "__name()" is meant to suggest a "worker" function for another
"name()" function, but that would not apply here.

> +{
> +	/* Make some space if needed */
> +	if (status->busy_time > 0xffff) {
> +		status->busy_time >>= 10;
> +		status->total_time >>= 10;
> +	}

How about removing the above code and adding here:

status->busy_time = status->busy_time ? : 1;

> +
> +	if (status->busy_time > status->total_time)

This check would then cover the possibility that total_time is 0.

> +		status->busy_time = status->total_time;

But a reversal is needed here:
		status->total_time = status->busy_time;

> +
> +	status->busy_time *= 100;
> +	status->busy_time /= status->total_time ? : 1;
> +
> +	/* Avoid division by 0 */
> +	status->busy_time = status->busy_time ? : 1;
> +	status->total_time = 100;

Then all of this code can be replaced by:

status->busy_time = (unsigned long)div64_u64((u64)status->busy_time << 10,
					     status->total_time);
status->total_time = 1 << 10;

This way you gain some resolution to busy_time and the divisions in the
callers would just become shifts by 10.

Hope it helps,
Ionela.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
