Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBB7E7CDF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87910E058;
	Fri, 10 Nov 2023 14:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C750B10E058
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:11:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F421512FC;
 Fri, 10 Nov 2023 06:12:02 -0800 (PST)
Received: from [10.57.36.221] (unknown [10.57.36.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C665F3F7C5;
 Fri, 10 Nov 2023 06:11:15 -0800 (PST)
Message-ID: <e44eb89f-2c72-4e0e-81f5-e39f1d734f46@arm.com>
Date: Fri, 10 Nov 2023 14:11:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/panfrost: Set regulators on/off during system
 sleep on MediaTek SoCs
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
 <20231109102543.42971-7-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231109102543.42971-7-angelogioacchino.delregno@collabora.com>
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

On 09/11/2023 10:25, AngeloGioacchino Del Regno wrote:
> All of the MediaTek SoCs supported by Panfrost can completely cut power
> to the GPU during full system sleep without any user-noticeable delay
> in the resume operation, as shown by measurements taken on multiple
> MediaTek SoCs (MT8183/86/92/95).
> 
> As an example, for MT8195 - a "before" with only runtime PM operations
> (so, without turning on/off regulators), and an "after" executing both
> the system sleep .resume() handler and .runtime_resume() (so the time
> refers to T_Resume + T_Runtime_Resume):
> 
> Average Panfrost-only system sleep resume time, before: ~33500ns
> Average Panfrost-only system sleep resume time, after:  ~336200ns
> 
> Keep in mind that this additional ~308200 nanoseconds delay happens only
> in resume from a full system suspend, and not in runtime PM operations,
> hence it is acceptable.
> 
> Measurements were also taken on MT8186, showing a delay of ~312000 ns.
> 
> Testing of this happened on all of the aforementioned MediaTek SoCs, but:
> MT8183 got tested only by KernelCI with <=10 suspend/resume cycles
> MT8186, MT8192, MT8195 were tested manually with over 100 suspend/resume
> cycles with GNOME DE (Mutter + Wayland).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 82f3c5fe9c58..f63382d9ab04 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -734,7 +734,7 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.supply_names = mediatek_mt8183_b_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
> -	.pm_features = BIT(GPU_PM_CLK_DIS),
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
>  static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
> @@ -743,7 +743,7 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.supply_names = mediatek_mt8183_b_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
>  	.pm_domain_names = mediatek_mt8186_pm_domains,
> -	.pm_features = BIT(GPU_PM_CLK_DIS),
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
> @@ -754,7 +754,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.supply_names = mediatek_mt8192_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
> -	.pm_features = BIT(GPU_PM_CLK_DIS),
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
>  static const struct of_device_id dt_match[] = {

