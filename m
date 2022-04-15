Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B7502816
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 12:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C518510E87E;
	Fri, 15 Apr 2022 10:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3408510E87E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 10:18:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1DA451F42643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650017926;
 bh=3nskTfZWuZt2VYfDTgr6VDBD1IupgXRqxVExf8eBPqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oWz+8ZzASpEwN75z0H5uTPpshi0t04pw3CFLlWv3acCqEWSpUSoH7nX85QJ4TqtRM
 PzcmmKGeHS61PhbSXOASlYe5hww5Bi5We9/cBVcKomj3w3u4KTGLt1RMZoNG63lxKl
 +e1hY8vl9k11L0lCKQ2HyfQ3lufxPGQvnL/lCGTIwq41qjxZM7uwbObthIF3gr7Sab
 mlQmyaiGM4dPvttuniDtFW0QSGSTiECAiRMGA0qVbJd+8mqF/J/Ys3SK5dMt6LpUd1
 TOsvvEWwjJcYF2ni97/d/01YrjCZSKa/NXLEL4uqZodTqNHBJnWwjS8yX2/EXKKKML
 SuX82+wPvJBEA==
Message-ID: <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
Date: Fri, 15 Apr 2022 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 03/10] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-4-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> 1. Add mt8195 mmsys compatible for 2 vdosys.
> 2. Add io_start into each driver data of mt8195 vdosys.
> 3. Add get match data function to identify mmsys by io_start.
> 4. Add mt8195 routing table settings of vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Unless anyone wants this commit to be split in two, one for the match data
and one for the mt8195 addition, it looks almost good to me, apart one small
change that has to be done, check below:


> --- >   drivers/soc/mediatek/mt8195-mmsys.h    | 370 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
>   drivers/soc/mediatek/mtk-mmsys.h       |   6 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  11 +
>   4 files changed, 528 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 

..snip..

> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..21cf300ba864 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
>   };
>   
>   struct mtk_mmsys_driver_data {
> +	const u32 io_start;

I agree with you that this iostart is in 32bits boundaries, and that this will
practically never change... and I was in doubt whether this would be acceptable
or not, because of saving some memory.

Even though I would really love to have the savings, in order to avoid having any
"surprises" in the future (any future breakage for "reasons"), we shall comply
with the kernel types, so, this has to be...

	const resource_size_t io_start;

...and this is the same for both this file and mtk_drm_drv.h, which you modify in
patch 07/10.

After fixing that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Cheers,
Angelo
