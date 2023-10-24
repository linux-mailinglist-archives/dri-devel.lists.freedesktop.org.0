Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0107D4A6E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41E210E081;
	Tue, 24 Oct 2023 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF0110E2F7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:47 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F2036607324;
 Tue, 24 Oct 2023 09:37:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698136666;
 bh=b3hTgipRW+886R6FBsLygN4L72yjGIgmU9zLWuzpo3o=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Xd+v3I16W7Ru4Jf3AYHTV0CFW5XwhEBZqYtNMSHps/DrHYiBAu3MCvYI7reaWAV4u
 yfqjXYbzv6fWT9WUkubjxVMRv7/GWj4AcakbfAXbLZICEfUOwWZMpxA0gY7Pzx9o8Z
 1YHE9FhQ+Jr9g6VZRlLWHjNcK9RJeTMdVMSqGY3lwM5S/X2cRWoBweSyIlxVtuQkiV
 yTVQ0p9eyCfKgcUCdSman/gaGB9k4C65WQbiMd1PEtkgxUqcPwYEslUIQtkTNVfcYb
 5/inotH8/Z8UygntUeEr59+og5ZcyW7B0ihRjgJq5fnSSZLzHxalFEKuWUUegzXK5h
 wBP0SD7+L2GMA==
Message-ID: <e3198dd5-48da-498c-9f21-4f6845b37675@collabora.com>
Date: Tue, 24 Oct 2023 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/11] drm/mediatek: Add mtk_ddp_sec_write to config
 secure buffer info
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-6-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-6-jason-jh.lin@mediatek.com>
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add mtk_ddp_sec_write to configure secure buffer information to
> cmdq secure packet data.
> Then secure cmdq driver will use these information to configure
> curresponding secure DRAM address to HW overlay in secure world.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 12 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..3dca936b9143 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -111,6 +111,18 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   #endif
>   }
>   
> +void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
> +		       const enum cmdq_iwc_addr_metadata_type type,
> +		       const u32 offset, const u32 size, const u32 port)
> +{
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	/* secure buffer will be 4K alignment */
> +	if (cmdq_pkt)

	if (!cmdq_pkt)
		return;
	cmdq_sec_pkt_write....

Regards,
Angelo


