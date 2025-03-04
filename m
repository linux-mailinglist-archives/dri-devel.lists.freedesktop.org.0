Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092DA4EE8D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 21:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC310E6B1;
	Tue,  4 Mar 2025 20:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="jNP4ReSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 591 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 20:40:21 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E53710E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:40:21 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1741120223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6WzCje76QLUKJGbmYoeUe7d9zKFda9oGc8+kEK4a04=;
 b=jNP4ReSawiAxad9womJccr4tfSjzlhZUJA6DV3kWGJXSysytY4Z8oqIOu2KElbzgCtxThe
 Hb6obA+e0Qo/eYo2+zpV+mtx40sUxmEqUnAw4mQxJbez7q10pXKoybJIO9Uu2fYNmla3cE
 PDPzlUbH2X+2eWAHvki/b8nLITpLoAopv5K8ASny7u2n7w253EIR3hZZPTyz/t/zEY2hvK
 1h4mrF8gHB7qXOgkGIyyPIFUWoBghSgDu13Y9Jz18RqL63V6sJvR3FyqOKdUZrOXV6xRnT
 RG5VgCo8Voq1kDCl3iZs+gL4BxgzMADdzke5argxV/fGYQPeGQ58inZobpDDaQ==
Date: Tue, 04 Mar 2025 21:30:22 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de, Heiko Stuebner
 <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 1/3] drm/rockchip: lvds: move pclk preparation in with
 clk_get
In-Reply-To: <20250304124418.111061-2-heiko@sntech.de>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-2-heiko@sntech.de>
Message-ID: <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Heiko,

On 2025-03-04 13:44, Heiko Stuebner wrote:
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 385cf6881504..ecfae8d5da89 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs
> px30_lvds_encoder_helper_funcs = {
>  static int rk3288_lvds_probe(struct platform_device *pdev,
>  			     struct rockchip_lvds *lvds)
>  {
> -	int ret;
> -
>  	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lvds->regs))
>  		return PTR_ERR(lvds->regs);
> 
> -	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
> +	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
>  	if (IS_ERR(lvds->pclk)) {
> -		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
> +		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");

I'm wondering why this patch isn't replacing deprecated DRM
logging macros with their preferred successors in a couple of
places, just like what the patch 2/3 from this series does?
