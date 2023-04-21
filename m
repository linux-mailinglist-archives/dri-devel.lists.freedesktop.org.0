Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0C6EB47B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 00:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3A10E0E1;
	Fri, 21 Apr 2023 22:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CC810E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 22:13:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A4BD649A3;
 Fri, 21 Apr 2023 22:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB865C4339B;
 Fri, 21 Apr 2023 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682115213;
 bh=XZd3xOHh9hRBu/JySb+r9z3kK1JjV1tv32skF1cGDD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mTwMl+eJzSMy03iFAPAUp2luKiUzmKPxD1vHfIkFe4Op2MvFaumks9ziuyiKumi0v
 Kb/A8ohF449C24/uFul9iePPNOmLn95Zm4ndeWMsNRXj/rv9p/xW25pi4mfS/fVaTf
 VFwB+RLND2DfSaBonTlBPJP1WiV8fiFmWzg4E84lUoQJzQ9GA+ndAvfyfCj0W1FnD4
 m3EuUHMyJy4e15fVTJUwSxUh7WEUDFlfghF/VUXYforrGmxivzem48PrTb9o3XkUWl
 qaF8VAirH/9KOwHFiHeOTm+Yga6UiorhrHPbmTSc+hc2glWjs/f1Eg5f/NB/e4vYra
 wWAJqLWNq8X6g==
Date: Fri, 21 Apr 2023 15:13:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
Message-ID: <20230421221330.GA3657732@dev-arch.thelio-3990X>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-phy@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 06:07:46PM +0200, Guillaume Ranquet wrote:
> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
> by the kernel test robot.
> 
> Fix the issue by removing the variable altogether and testing out the
> return value of mtk_hdmi_pll_set_hw()
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can somebody pick this up? It fixes a rather obvious warning, which is
breaking clang builds (as evidenced by three versions of the same fix).

> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..054b73cb31ee 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>  	u8 txpredivs[4] = { 2, 4, 6, 12 };
>  	u32 fbkdiv_low;
> -	int i, ret;
> +	int i;
>  
>  	pixel_clk = rate;
>  	tmds_clk = pixel_clk;
> @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	if (!(digital_div <= 32 && digital_div >= 1))
>  		return -EINVAL;
>  
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +	return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>  			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>  			    txposdiv, digital_div);
> -	if (ret)
> -		return -EINVAL;
> -
> -	return 0;
>  }
>  
>  static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> 
> -- 
> 2.40.0
> 
