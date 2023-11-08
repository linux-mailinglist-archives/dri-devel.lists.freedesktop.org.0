Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC37E5A5B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF3310E7AA;
	Wed,  8 Nov 2023 15:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EFE310E7AE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BDAE1476;
 Wed,  8 Nov 2023 07:45:40 -0800 (PST)
Received: from [10.1.36.61] (e122027.cambridge.arm.com [10.1.36.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801E43F64C;
 Wed,  8 Nov 2023 07:44:53 -0800 (PST)
Message-ID: <f3b487e5-8636-43b0-b258-af373b465c75@arm.com>
Date: Wed, 8 Nov 2023 15:44:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panfrost: Set clocks on/off during system
 sleep on MediaTek SoCs
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-5-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231102142643.75288-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2023 14:26, AngeloGioacchino Del Regno wrote:
> All of the MediaTek SoCs supported by Panfrost can switch the clocks
> off and on during system sleep to save some power without any user
> experience penalty.
> 
> Measurements taken on multiple MediaTek SoCs show that adding this
> will not prolong the time that is required to resume the system in
> any meaningful way.
> 
> As an example, for MT8195 - a "before" with only runtime PM operations
> (so, without turning on/off GPU clocks), and an "after" executing both
> the system sleep .resume() handler and .runtime_resume() (so the time
> refers to T_Resume + T_Runtime_Resume):
> 
> Average Panfrost-only system sleep resume time, before: ~28000ns
> Average Panfrost-only system sleep resume time, after:  ~33500ns
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

The change looks good:

Reviewed-by: Steven Price <steven.price@arm.com>

However it would be good to explicitly state (in the commit message)
which SoCs you personally have tested (for correctness), just in case we
find there are problems in the future with this on a particular SoC.

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7cabf4e3d1f2..82f3c5fe9c58 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -734,6 +734,7 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.supply_names = mediatek_mt8183_b_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS),
>  };
>  
>  static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
> @@ -742,6 +743,7 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.supply_names = mediatek_mt8183_b_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
>  	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS),
>  };
>  
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
> @@ -752,6 +754,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.supply_names = mediatek_mt8192_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS),
>  };
>  
>  static const struct of_device_id dt_match[] = {

