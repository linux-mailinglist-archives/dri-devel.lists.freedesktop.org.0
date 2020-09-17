Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4626D907
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBC6EB97;
	Thu, 17 Sep 2020 10:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED06B6E130
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:29:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A4F1424;
 Thu, 17 Sep 2020 03:29:12 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96423F68F;
 Thu, 17 Sep 2020 03:29:10 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] drm/panfrost: add Amlogic GPU integration quirks
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200916150147.25753-1-narmstrong@baylibre.com>
 <20200916150147.25753-4-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <132c32b9-b68a-8da9-310e-c85fe17be83e@arm.com>
Date: Thu, 17 Sep 2020 11:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-4-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/09/2020 16:01, Neil Armstrong wrote:
> This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
> reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7c8a87d164c3..6e5dedacb777 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -658,7 +658,18 @@ static const struct panfrost_compatible default_data = {
>   	.pm_domain_names = NULL,
>   };
>   
> +static const struct panfrost_compatible amlogic_data = {
> +	.num_supplies = ARRAY_SIZE(default_supplies),
> +	.supply_names = default_supplies,
> +	.vendor_quirk = panfrost_gpu_amlogic_quirk,
> +};
> +
>   static const struct of_device_id dt_match[] = {
> +	/* Set first to probe before the generic compatibles */
> +	{ .compatible = "amlogic,meson-gxm-mali",
> +	  .data = &amlogic_data, },
> +	{ .compatible = "amlogic,meson-g12a-mali",
> +	  .data = &amlogic_data, },
>   	{ .compatible = "arm,mali-t604", .data = &default_data, },
>   	{ .compatible = "arm,mali-t624", .data = &default_data, },
>   	{ .compatible = "arm,mali-t628", .data = &default_data, },
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
