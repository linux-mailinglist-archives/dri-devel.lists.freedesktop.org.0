Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D36E20DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229CC10ECC6;
	Fri, 14 Apr 2023 10:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C63010ECC6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:34:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BE516603222;
 Fri, 14 Apr 2023 11:34:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681468479;
 bh=Wv3E9PUWrZb1LypVjlRkJKgongoVuhTGI7YvkuT0r4E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ym8z5pIXYeL+KxgD1J/F6kLUdC8NENeAzIH6DimNp3bWQPI7DtYYqhnEEfjXzR+lg
 EKsap0k2N7IrlsgxkT1X1o+GswaNAwhC6gVQ+X2q3vBIBVR+7oW9lCUmLU8glTKtZ9
 ddf+0HVpsMl+o32s1J+cp/q/Zjbzq/lnNxH59SsTbOGtS4WbjJdRU77q33eS8YvD4B
 ad2qUc9E3vYPmAefMvBL9BkD+HUrWQus4t9zve069FCYXxN/0ON9nb0n4v1IwvEWA3
 3CYrEedDnt/9nNDbF3/iV/VoIGc9TSjhSsYw+eHpY+3xQWOOKTs9yttvjj7NRaiPB0
 bDrMCafVaienw==
Message-ID: <52440231-bbcc-48f6-fe47-a554cade8d73@collabora.com>
Date: Fri, 14 Apr 2023 12:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/04/23 14:46, Guillaume Ranquet ha scritto:
> The clock rate calculus in mtk_hdmi_pll_calc() was wrong when it has
> been replaced by 'div_u64'.
> 
> Fix the issue by multiplying the values in the denominator instead of
> dividing them.
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index e10da6c4147e..5e84b294a43e 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -271,7 +271,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	 * [32,24] 9bit integer, [23,0]:24bit fraction
>   	 */
>   	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
> -		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
> +		      da_hdmitx21_ref_ck * PLL_FBKDIV_HS3);

How did that even work?!?!?!? Because ... it worked, I did test it. Bah!
Luck was on your side :-P

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


