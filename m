Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3F5BF8CC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE7710E8E0;
	Wed, 21 Sep 2022 08:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6F810E8E0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:15:44 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3DC36601F3F;
 Wed, 21 Sep 2022 09:15:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748143;
 bh=XH9jh6d/hbkh2EaYj2CvFnDhMpxuJds1twj/Gjm5QII=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n6N75gL0cvd7s2ORUOI6HiDaAATa+J+CFW2qnVM07rXmVNZdqrxfaQ/SnVqiAR3Ui
 KrKJAZfDhqFDlTbrqYYMFygw5NGnBObQ6i57rbeTQxXi33u4qix6JWe3HPs+Q+OFv0
 9b2nJT8Hl0DQbgkhUEqhuMyPYbIYKK+xYr765lsey+cKk0LdXt9S6T10WcQrDDpqbE
 X2qV1/Mp5jC7hS3CdH/pfQMDVRPuINTxtihbx5kkezlXKdIBOWYPZdQ+pfHeDvYCdL
 iD+kdPhLt7PxdbkFAjdJ79s7ZhLFWQBgKv0Jk7+PP8LmRoJRr/Cne0Bx42srTYeoAk
 p2LYSYU+7SK8g==
Message-ID: <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
Date: Wed, 21 Sep 2022 10:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/18] phy: mediatek: add a new helper to update bitfield
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-2-chunfeng.yun@mediatek.com>
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

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Due to FIELD_PREP() macro can be used to prepare a bitfield value,
> local ones can be remove; add the new helper to make bitfield update
> easier.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
> index 500fcdab165d..a723d4afc9b4 100644
> --- a/drivers/phy/mediatek/phy-mtk-io.h
> +++ b/drivers/phy/mediatek/phy-mtk-io.h
> @@ -8,6 +8,7 @@
>   #ifndef __PHY_MTK_H__
>   #define __PHY_MTK_H__
>   
> +#include <linux/bitfield.h>
>   #include <linux/io.h>
>   
>   static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
> @@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
>   	writel(tmp, reg);
>   }
>   
> +/* field @mask should be constant and continuous */

"Field @mask shall be [...]"
              ^^^^^

> +static inline void mtk_phy_update_field(void __iomem *reg, u32 mask, u32 val)

...so, (void __iomem *reg, const u32 mask, u32 val)

> +{
> +	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
> +}
> +
>   #endif


