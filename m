Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD7598FBD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 23:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662F810EAF9;
	Thu, 18 Aug 2022 21:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC3910EAF9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 21:47:23 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D240C66019FB;
 Thu, 18 Aug 2022 22:47:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660859242;
 bh=4gpnxl75xpqaey0GgS05hQ2JXOenf1aNFuT3t037TNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EBmaQbanWlisUZo1v/tUYoK4/8bd1j2jFm+u8dfqyZyuoSE/phFCvdoPoFPZhKznK
 nPeMwAmGGLT5K17WA4PUxXe0K1C348e+lgDNFTWzgzFIM9aVaP9DzGGaWCova5fRSw
 p4DLeWH/351NFNk74MtG0Pp+P6P+JGvL4vePwP79wuPrh9+HdDpPPAJXlBnQHW3joR
 WfLEjwp6fINYl9EkAFnP+iMaFp318UG778MjeJ/iBvJr4xqscK80dGDR47Id72M6OF
 3nQzJxx9bIMXimOoL56w8Lt+vvTtpq8SvlxQRYDIKjC2dKF9bEHyy3ghx6TFTQ5gPO
 97/mIlif/FRJA==
Date: Thu, 18 Aug 2022 17:47:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v25 07/10] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Message-ID: <20220818214715.spbyic34szubx3gi@notapiano>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
 <20220711075245.10492-8-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220711075245.10492-8-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nancy,

On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
[..]
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.clk_driver = "clk-mt2701-mm",
>  	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  	.routes = mmsys_default_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.routes = mmsys_mt8183_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
>  
>  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>  	.routes = mmsys_mt8186_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>  };
[..]
> @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;

The number of resets was previously always set to 32, and now you're instead
setting it based on num_resets from each machine. The issue is, you're
forgetting a bunch of them.

mt8192 didn't get a num_reset, so this commit breaks the display on mt8192 based
devices. But mt8192 isn't the only one, there are other platforms missing this
property. Please set num_resets to 32 in every single one of them, otherwise
there will be display regressions.

Thanks,
Nícolas
