Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1703D2F63CF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C56E40B;
	Thu, 14 Jan 2021 15:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 437436E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:10:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A9A3ED1;
 Thu, 14 Jan 2021 07:10:28 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEF853F70D;
 Thu, 14 Jan 2021 07:10:26 -0800 (PST)
Subject: Re: [PATCH v10 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
From: Steven Price <steven.price@arm.com>
Message-ID: <495a0ad3-ef01-d4b8-eb1f-e70d55fd7ddf@arm.com>
Date: Thu, 14 Jan 2021 15:10:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113140546.v10.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2021 06:07, Nicolas Boichat wrote:
> GPUs with more than a single regulator (e.g. G72 on MT8183) will
> require platform-specific handling for devfreq, for 2 reasons:
>   1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
>      does not support multiple regulators, so we'll need custom
>      handlers.
>   2. Generally, platforms with 2 regulators have platform-specific
>      constraints on how the voltages should be set (e.g.
>      minimum/maximum voltage difference between them), so we
>      should not just create generic handlers that simply
>      change the voltages without taking care of those constraints.
> 
> Disable devfreq for now on those GPUs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Thanks for the clarification in the commit message.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> 
> (no changes since v9)
> 
> Changes in v9:
>   - Explain why devfreq needs to be disabled for GPUs with >1
>     regulators.
> 
> Changes in v8:
>   - Use DRM_DEV_INFO instead of ERROR
> 
> Changes in v7:
>   - Fix GPU ID in commit message
> 
> Changes in v6:
>   - New change
> 
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index f44d28fad085..812cfecdee3b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	struct thermal_cooling_device *cooling;
>   	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>   
> +	if (pfdev->comp->num_supplies > 1) {
> +		/*
> +		 * GPUs with more than 1 supply require platform-specific handling:
> +		 * continue without devfreq
> +		 */
> +		DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
> +		return 0;
> +	}
> +
>   	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
>   					      pfdev->comp->num_supplies);
>   	if (IS_ERR(opp_table)) {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
