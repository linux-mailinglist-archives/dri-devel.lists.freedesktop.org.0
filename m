Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A77D693D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 12:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C32110E597;
	Wed, 25 Oct 2023 10:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1E810E597
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 10:43:57 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 18E2B660731F;
 Wed, 25 Oct 2023 11:43:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698230636;
 bh=KegdeqPbnKJB0aXxxCWgYWenpZQb07bWKdSj7ee2iMI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XI7u9gf0OAbCguafvBwC9JursKCw9D0kI70ypY0d1agiM/u6bYeonsjdz14tizBsx
 qsdlCHlkcOmHPpI+WA9PZHLRKGcAxBGRz/RxPepIYwEkBjhBdx84E0mzh6+gwo2EN2
 TW92p+2uUGGF/ir0WbEqubWmjvsJeJTUBovpkckCywt6Od6lQYe+d9V+5WCxbK4GI0
 kt+fHID6uYvrNjWqMp1xxNRejnEpzGUf0zkkDne2eRiuDhT0LhYq07gLTKZyZqZ+9q
 DOYiAQeXVn6sJgn6KcWpZ+OUmGeW6tc/5WybzQv03BPfKZPzs5/DyLu7GvsnRE+P9h
 ou6QLq05MJRXw==
Message-ID: <7d50a061-dd73-40e4-af7d-ac8252bcea25@collabora.com>
Date: Wed, 25 Oct 2023 12:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
 <36cdd47a7016cfb8814e65b341db83006af9cdd8.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <36cdd47a7016cfb8814e65b341db83006af9cdd8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/10/23 06:07, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-10-12 at 11:57 +0200, AngeloGioacchino Del Regno wrote:
>> In preparation for adding a 12-bits gamma support for the DISP_GAMMA
>> IP, remove the mtk_gamma_set_common() function and move the relevant
>> bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
>> DISP_AAL: since the latter has no more support for gamma manipulation
>> (being moved to a different IP) in newer revisions, those functions
>> are about to diverge and it makes no sense to keep a common one (with
>> all the complications of passing common data and making exclusions
>> for device driver data) for just a few bits.
>>
>> This commit brings no functional changes.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>

..snip..

>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> index 81c04518a5eb..0929f8830d6d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> @@ -69,41 +69,28 @@ unsigned int mtk_gamma_get_lut_size(struct device
>> *dev)
>>   	return 0;
>>   }
>>   
>> -void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
>> struct drm_crtc_state *state)
>> +void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>>   {

..snip..

>>   
>> -	cfg_val = readl(regs + DISP_GAMMA_CFG);
>> +	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
>>   
>>   	/* Enable the gamma table */
>>   	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
>>   
>> -	writel(cfg_val, regs + DISP_GAMMA_CFG);
>> -}
>> -
>> -void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>> -{
>> -	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>> -
>> -	mtk_gamma_set_common(dev, gamma->regs, state);
>> +	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);

Hello CK,

something went wrong while you applied this patch: this writel became a readl,
breaking mtk_disp_gamma entirely. Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek/mtk_disp_gamma.c?h=next-20231025&id=a6b39cd248f3321dbf066f95f95a9841f891229e

Thanks,
Angelo

