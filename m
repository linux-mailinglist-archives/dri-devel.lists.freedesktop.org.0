Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7103985E9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202C6E0CB;
	Wed,  2 Jun 2021 10:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 816A56E0CB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:07:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C349E1042;
 Wed,  2 Jun 2021 03:07:13 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22D5A3F73D;
 Wed,  2 Jun 2021 03:07:12 -0700 (PDT)
Subject: Re: [PATCH] drm/rockchip: defined struct rockchip_dp_dt_ids[] under
 CONFIG_OF
To: Souptick Joarder <jrdr.linux@gmail.com>, hjc@rock-chips.com,
 heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch
References: <20210602080212.4992-1-jrdr.linux@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8027801c-5260-8b1b-c758-fdfb8c18e9a7@arm.com>
Date: Wed, 2 Jun 2021 11:07:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602080212.4992-1-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-rockchip@lists.infradead.org, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 09:02, Souptick Joarder wrote:
> Kernel test robot throws below warning when CONFIG_OF
> is not set.
> 
>>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34:
> warning: unused variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
>     static const struct of_device_id rockchip_dp_dt_ids[] = {
> 
> Fixed it by defining rockchip_dp_dt_ids[] under CONFIG_OF.

I think the __maybe_unused annotation is generally preferred over 
#ifdefs these days. However, since these drivers only work with 
devicetree anyway, it probably makes more sense to just remove the 
of_match_ptr() uses which lead to these warnings in the first place.

Robin.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index ade2327a10e2..9b79ebaeae97 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -454,12 +454,14 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
>   	.chip_type = RK3288_DP,
>   };
>   
> +#ifdef CONFIG_OF
>   static const struct of_device_id rockchip_dp_dt_ids[] = {
>   	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>   	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> +#endif
>   
>   struct platform_driver rockchip_dp_driver = {
>   	.probe = rockchip_dp_probe,
> 
