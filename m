Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF4366C52
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 15:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ADE6E998;
	Wed, 21 Apr 2021 13:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42336E99C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 13:17:13 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c03:4000::11ea])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B8F551F42E3B;
 Wed, 21 Apr 2021 14:17:09 +0100 (BST)
Date: Wed, 21 Apr 2021 09:17:04 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v13 4/4] drm/panfrost: Add mt8183-mali compatible string
Message-ID: <YIAl0HRoAKD58C0R@maud>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <20210421132841.v13.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132841.v13.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
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
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not that you need it but this patch is Reviewed-by: Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com>

On Wed, Apr 21, 2021 at 01:28:55PM +0800, Nicolas Boichat wrote:
> Add support for MT8183's G72 Bifrost.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
>  - Fix GPU ID in commit message
> 
> Changes in v6:
>  - Context conflicts, reflow the code.
>  - Use ARRAY_SIZE for power domains too.
> 
> Changes in v5:
>  - Change power domain name from 2d to core2.
> 
> Changes in v4:
>  - Add power domain names.
> 
> Changes in v3:
>  - Match mt8183-mali instead of bifrost, as we require special
>    handling for the 2 regulators and 3 power domains.
> 
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 83a461bdeea8..ca07098a6141 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> +const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> +const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
> +static const struct panfrost_compatible mediatek_mt8183_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
> +	.supply_names = mediatek_mt8183_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +	.pm_domain_names = mediatek_mt8183_pm_domains,
> +};
> +
>  static const struct of_device_id dt_match[] = {
>  	/* Set first to probe before the generic compatibles */
>  	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "arm,mali-t860", .data = &default_data, },
>  	{ .compatible = "arm,mali-t880", .data = &default_data, },
>  	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
> +	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
