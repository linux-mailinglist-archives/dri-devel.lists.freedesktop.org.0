Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F0518421
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8E310ED41;
	Tue,  3 May 2022 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E6B10ED41
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:19:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D50F1F440F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580367;
 bh=7dmHQ4KerR5qmz8szAHhl2RdSUpC3IqMde/web4SJVI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oLDe2oHiRbT3NMQHsqrGQgkM2j77gKaebdcIESyJ/PQhseVGHXB4mY9UB/4UBsWv4
 8+abIYy7l0uvL4bcAAPg5TmyFkNfAIYMOy1/EUnkY6HrsuXb+J4k8UrCiavBaPZOva
 tbqKdR3n1N3hN3xzZAi6/Wyk4FOxSYgvr7jMzbcB06NbgP/2q9jXHUyoyO9HG6aqbw
 jVBxXJXa5+oPiYw9N+r2SfEcgHV+jQx5QA2V3pFyZAKyUjzXy/M/iB90kE0Gz1L08n
 fYAreCLdIPP7aqo5Nw1Qj4vUkWv1DkpHytOhb23qoypyPBP5t9o8b9XWOIpb1Mty26
 oc7sbOVhGOeIg==
Message-ID: <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
Date: Tue, 3 May 2022 14:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 06/25] soc: mediatek: add mtk_mmsys_write_reg API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-7-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-7-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add mtk_mmsys_write_reg API. Simplify code for writing mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ab3c5cbb0175..3e2e5e3f721d 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -191,22 +191,26 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
>   	return -EINVAL;
>   }
>   
> +static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +

Uhm... this is the equivalent of regmap_update_bits(): I fear that calling this
mtk_mmsys_write_reg() may lead to confusion.

I think that a more appropriate name would be mtk_mmsys_update_bits() or
something similar, recalling that this is not just a register write, but
a RMW.

Regards,
Angelo
