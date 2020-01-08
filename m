Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6380C13402C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 12:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A329C6E88F;
	Wed,  8 Jan 2020 11:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F5446E896
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 11:18:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4F7630E;
 Wed,  8 Jan 2020 03:18:58 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F1133F703;
 Wed,  8 Jan 2020 03:18:57 -0800 (PST)
Subject: Re: [PATCH RFT v1 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, steven.price@arm.com,
 tomeu.vizoso@collabora.com, robh@kernel.org
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-2-martin.blumenstingl@googlemail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a85f2063-f412-9762-58d1-47fdffb24af9@arm.com>
Date: Wed, 8 Jan 2020 11:18:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107230626.885451-2-martin.blumenstingl@googlemail.com>
Content-Language: en-GB
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
Cc: airlied@linux.ie, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2020 11:06 pm, Martin Blumenstingl wrote:
> Decouple the check to see whether we want to enable devfreq for the GPU
> from dev_pm_opp_set_regulators(). This is preparation work for adding
> back support for regulator control (which means we need to call
> dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
> means having a check for "is devfreq enabled" that is not tied to
> dev_pm_opp_of_add_table() makes things easier).

Hmm, what about cases like the SCMI DVFS protocol where the OPPs are 
dynamically discovered rather than statically defined in DT?

Robin.

> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbf..1471588763ce 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -5,6 +5,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_opp.h>
>   #include <linux/clk.h>
> +#include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include "panfrost_device.h"
> @@ -79,10 +80,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	struct devfreq *devfreq;
>   	struct thermal_cooling_device *cooling;
>   
> -	ret = dev_pm_opp_of_add_table(dev);
> -	if (ret == -ENODEV) /* Optional, continue without devfreq */
> +	if (!device_property_present(dev, "operating-points-v2"))
> +		/* Optional, continue without devfreq */
>   		return 0;
> -	else if (ret)
> +
> +	ret = dev_pm_opp_of_add_table(dev);
> +	if (ret)
>   		return ret;
>   
>   	panfrost_devfreq_reset(pfdev);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
