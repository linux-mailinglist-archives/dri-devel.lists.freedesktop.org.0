Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC635E5C26
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE0610E5B5;
	Thu, 22 Sep 2022 07:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347F10E5B5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:17:41 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E2D656601A43;
 Thu, 22 Sep 2022 08:17:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663831060;
 bh=2iRz6l4AbZaBKMReNbfUfKJMN78giUanBoFMZJVDNqw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bv12SkA6sORgmtkNyYTyDYCQVVEkaOhP+nQq2u6o+qRcpIeUPv3cJNGWvJSsJjzax
 uJgFU//BcUJIA68F/1qOHSu2YhZ5gpE2KpGQNZL/gRnL36qBcZNS5THXd6lPue0C6g
 xtnDJKzcGYBDsJG6cOG3/GvfAOjQJuO+GWPIxN/SK714s/etEUIb0Vx5lufOl1zcm9
 oNeMj2sgbrjMSu82eSfucEkw6MGJ32PxEsW21okZ3gFxIB7W/ACM7b5A7kdfxEiFHP
 T+qGsp29lcN6b9QvN05lNchMIWt15O/955I0W+t0a/Lzvs3fF8+1L3K7O9FKMVFokX
 +m+N8qDZtfESQ==
Message-ID: <3d8fdcf5-c2cb-be63-48d5-d84d50aeace3@collabora.com>
Date: Thu, 22 Sep 2022 09:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/18] phy: mediatek: add a new helper to update bitfield
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-2-chunfeng.yun@mediatek.com>
 <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
 <a3f98aa1d3d10b76b1fb5e6c2e3d64cedd0bf127.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a3f98aa1d3d10b76b1fb5e6c2e3d64cedd0bf127.camel@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/09/22 04:36, Chunfeng Yun ha scritto:
> On Wed, 2022-09-21 at 10:15 +0200, AngeloGioacchino Del Regno wrote:
>> Il 20/09/22 11:00, Chunfeng Yun ha scritto:
>>> Due to FIELD_PREP() macro can be used to prepare a bitfield value,
>>> local ones can be remove; add the new helper to make bitfield
>>> update
>>> easier.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>>    drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/phy/mediatek/phy-mtk-io.h
>>> b/drivers/phy/mediatek/phy-mtk-io.h
>>> index 500fcdab165d..a723d4afc9b4 100644
>>> --- a/drivers/phy/mediatek/phy-mtk-io.h
>>> +++ b/drivers/phy/mediatek/phy-mtk-io.h
>>> @@ -8,6 +8,7 @@
>>>    #ifndef __PHY_MTK_H__
>>>    #define __PHY_MTK_H__
>>>    
>>> +#include <linux/bitfield.h>
>>>    #include <linux/io.h>
>>>    
>>>    static inline void mtk_phy_clear_bits(void __iomem *reg, u32
>>> bits)
>>> @@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void
>>> __iomem *reg, u32 mask, u32 val)
>>>    	writel(tmp, reg);
>>>    }
>>>    
>>> +/* field @mask should be constant and continuous */
>>
>> "Field @mask shall be [...]"
>>                ^^^^^
> Ok, will modify it
> 
>>
>>> +static inline void mtk_phy_update_field(void __iomem *reg, u32
>>> mask, u32 val)
>>
>> ...so, (void __iomem *reg, const u32 mask, u32 val)
> Maybe no need const, @mask will be checked it in compile time when
> use FIELD_PREP(), means @mask is a constant value, but not a variable.
> 

Adding const is not *required*, but `mask` is, effectively, a constant, hence
it fully makes sense to add const.

> Thanks
> 
>>
>>> +{
>>> +	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
>>> +}
>>> +
>>>    #endif
>>
>>
> 



