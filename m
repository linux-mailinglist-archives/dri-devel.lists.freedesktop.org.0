Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793D53CB33
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24AD10E0E9;
	Fri,  3 Jun 2022 13:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8989110E0E9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:59:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 26FF81F45910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654264740;
 bh=1PokqYaPEgiXhLt5emusMefjpPlRtuRVPgBT7aSIqAM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=lNBNeQ8yPFDvNcvNqJFOjmOTdCKsOFJYIqyIDiAkKuUfJpgakVkYDKQJ06WktOsJY
 K4+jxiwjdc/9BaX+ysLBfnyDIjk7K71EJgH84mhGNvHaXDG2AEtbPkrxsxGOQYtASp
 dO9KwSOZoT//vsWI+08+CYrKrO1f1d2JgGBklCuDv3nj8HmkjgawELdyso3EYnrJam
 jwdPlQR2zAEbYzpdppEx2jpZehUrAw2cSAwWNDaCfPZybaU8zbEls0fzyyta+fd1up
 sLTfoeTs92lKFc1rgiJV6ho7/SEe74DUJ9eRqICOl7fR45IGFEmLeQ73F4BMjib/Iy
 OXat3n7Yh8s3w==
Message-ID: <c1ccad8a-8063-1156-f18f-8cc13c65a11b@collabora.com>
Date: Fri, 3 Jun 2022 16:58:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] drm/tegra: dc: rgb: Fix refcount leak in
 tegra_dc_rgb_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Terje Bergstrom <tbergstrom@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220603132703.42085-1-linmq006@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220603132703.42085-1-linmq006@gmail.com>
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

On 6/3/22 16:27, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> So add of_node_put() in error paths.
> 
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - update Fixes tag.
> v1 Link: https://lore.kernel.org/r/20220602155615.43277-1-linmq006@gmail.com
> ---
>  drivers/gpu/drm/tegra/rgb.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index ff8fce36d2aa..cef2b1b72385 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -196,12 +196,16 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  	int err;
>  
>  	np = of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> -		return -ENODEV;
> +	if (!np || !of_device_is_available(np)) {
> +		err = -ENODEV;
> +		goto err_put_node;
> +	}
>  
>  	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> -	if (!rgb)
> -		return -ENOMEM;
> +	if (!rgb) {
> +		err = -ENOMEM;
> +		goto err_put_node;
> +	}
>  
>  	rgb->output.dev = dc->dev;
>  	rgb->output.of_node = np;
> @@ -209,31 +213,34 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  
>  	err = tegra_output_probe(&rgb->output);
>  	if (err < 0)
> -		return err;
> +		goto err_put_node;
> +
>  
>  	rgb->clk = devm_clk_get(dc->dev, NULL);
>  	if (IS_ERR(rgb->clk)) {
>  		dev_err(dc->dev, "failed to get clock\n");
> -		return PTR_ERR(rgb->clk);
> +		err =  PTR_ERR(rgb->clk);
> +		goto err_put_node;
>  	}
>  
>  	rgb->clk_parent = devm_clk_get(dc->dev, "parent");
>  	if (IS_ERR(rgb->clk_parent)) {
>  		dev_err(dc->dev, "failed to get parent clock\n");
> -		return PTR_ERR(rgb->clk_parent);
> +		err = PTR_ERR(rgb->clk_parent);
> +		goto err_put_node;
>  	}
>  
>  	err = clk_set_parent(rgb->clk, rgb->clk_parent);
>  	if (err < 0) {
>  		dev_err(dc->dev, "failed to set parent clock: %d\n", err);
> -		return err;
> +		goto err_put_node;
>  	}
>  
>  	rgb->pll_d_out0 = clk_get_sys(NULL, "pll_d_out0");
>  	if (IS_ERR(rgb->pll_d_out0)) {
>  		err = PTR_ERR(rgb->pll_d_out0);
>  		dev_err(dc->dev, "failed to get pll_d_out0: %d\n", err);
> -		return err;
> +		goto err_put_node;
>  	}
>  
>  	if (dc->soc->has_pll_d2_out0) {
> @@ -241,13 +248,17 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  		if (IS_ERR(rgb->pll_d2_out0)) {
>  			err = PTR_ERR(rgb->pll_d2_out0);
>  			dev_err(dc->dev, "failed to get pll_d2_out0: %d\n", err);
> -			return err;
> +			goto err_put_node;
>  		}
>  	}
>  
>  	dc->rgb = &rgb->output;
>  
>  	return 0;
> +
> +err_put_node:
> +	of_node_put(np);
> +	return err;
>  }
>  
>  int tegra_dc_rgb_remove(struct tegra_dc *dc)

Doesn't look like the node is put on driver removal either. Hence you
should make it resource-managed.

-- 
Best regards,
Dmitry
