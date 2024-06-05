Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867B8FC77D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71CD10E63F;
	Wed,  5 Jun 2024 09:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 638AE10E63F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:18:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF2FDDA7;
 Wed,  5 Jun 2024 02:18:44 -0700 (PDT)
Received: from [10.57.39.129] (unknown [10.57.39.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 147E13F792;
 Wed,  5 Jun 2024 02:18:16 -0700 (PDT)
Message-ID: <f44611fd-523a-4b4d-accd-20fdfbac178a@arm.com>
Date: Wed, 5 Jun 2024 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add support for Mali on the MT8188
 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/06/2024 13:39, AngeloGioacchino Del Regno wrote:
> MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
> compatible and platform data using the same supplies and the
> same power domain lists as MT8183 (one regulator, three power
> domains).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ef9f6c0716d5..4e2d9f671a0d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> +static const struct panfrost_compatible mediatek_mt8188_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,

I think this is a little confusing. Ideally we'd drop the existing
mediatek_xxx_supplies which are the same as default_supplies and just
use that instead.

> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +	.pm_domain_names = mediatek_mt8183_pm_domains,

We'd want at least a comment explaining that this isn't a typo (i.e. /*
mt8188 uses the same pm domains as mt8183 */). But I'm also wondering if
it would be sensible to simply have one domain list, something like:

--->8---
static const char * const mediatek_pm_domains[] = { "core0", "core1",
						    "core2", "core3",
						    "core4" };

static const struct panfrost_compatible mediatek_mt8183_data = {
	...
	.num_pm_domains = 3,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8186_data = {
	...
	.num_pm_domains = 2,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8188_data = {
	...
	.num_pm_domains = 3,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8192_data = {
	...
	.num_pm_domains = 5,
	.pm_domain_names = mediatek_pm_domains,
};
--->8---

OTOH what you've got it no worse than what we already had, so it's up to
you whether you want to tidy this up or just add a comment so it doesn't
look like there's a typo.

Steve

> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +};
> +
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>  static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>  							   "core3", "core4" };
> @@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>  	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
> +	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  	{}
>  };

