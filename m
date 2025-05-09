Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BDAB1157
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 12:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850F10E3B9;
	Fri,  9 May 2025 10:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FF7710E3B9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 10:59:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DEB31595;
 Fri,  9 May 2025 03:59:07 -0700 (PDT)
Received: from [10.1.35.18] (e122027.cambridge.arm.com [10.1.35.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9FC3F58B;
 Fri,  9 May 2025 03:59:15 -0700 (PDT)
Message-ID: <32dd077c-52db-4bef-8d76-12b7aaff2408@arm.com>
Date: Fri, 9 May 2025 11:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/panfrost: Commonize Mediatek power domain
 array definitions
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
 <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
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

On 09/05/2025 11:12, Louis-Alexis Eyraud wrote:
> In the panfrost driver, the platform data of several Mediatek SoC
> declares and uses several different power domains arrays according to
> GPU core number present in the SoC:
> - mediatek_mt8186_pm_domains (2 cores)
> - mediatek_mt8183_pm_domains (3 cores)
> - mediatek_mt8192_pm_domains (5 cores)
> 
> As they all are fixed arrays, starting with the same entries and the
> platform data also has a power domains array length field
> (num_pm_domains), they can be replaced by a single array, containing
> all entries, if the num_pm_domains field of the platform data is also
> set to the matching core number.
> 
> So, create a generic power domain array (mediatek_pm_domains) and use
> it in the mt8183(b), mt8186, mt8188 and mt8192 platform data instead.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7b899a9b2120c608e61dab9ca831ab8e907e8139..21b28bef84015793d9dba6b1e585891dc0dfcb6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -789,6 +789,8 @@ static const struct panfrost_compatible amlogic_data = {
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> +static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
> +						    "core3", "core4" };
>  /*
>   * The old data with two power supplies for MT8183 is here only to
>   * keep retro-compatibility with older devicetrees, as DVFS will
> @@ -798,48 +800,43 @@ static const struct panfrost_compatible amlogic_data = {
>   * coupled regulators instead.
>   */
>  static const char * const legacy_supplies[] = { "mali", "sram", NULL };
> -static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
>  	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
>  	.supply_names = legacy_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  };
>  
>  static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
>  static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> -	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.num_pm_domains = 2,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -/* MT8188 uses the same power domains and power supplies as MT8183 */
>  static const struct panfrost_compatible mediatek_mt8188_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> -static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
> -							   "core3", "core4" };
>  static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
> -	.pm_domain_names = mediatek_mt8192_pm_domains,
> +	.num_pm_domains = 5,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
> 

