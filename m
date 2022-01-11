Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98748ABFF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59414112251;
	Tue, 11 Jan 2022 10:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C267112251
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:57:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9E9241F43A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898675;
 bh=wGR7oi2bLZenrRXTXE28i4i6d2Ekxsg5WZGuvas3jHY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Elc7ksex3MqC7VFRbmEfNUXzNvwhk3UEccDOC/u1znbgRXDZTYLQdp/SSiOJ5SEAs
 1KmcNwdqFZFAJDabwwHyatfRD2zhbhAguiP1XMOqqBDB3qeFl7V1OHP3VBZ/jvitd4
 6+MgYh6T+cbVegQp6IxnBOF+F95uaD4zdLm3d1lalgGHMCcec+egpC8Fbk/+jEW8dp
 qffAVj3LFRjOTVG7Imi1WW9tlZVKBcd+ux0un1J7gGzXYV8ADM3uzotHqlFQ+v7hGS
 T14MeN/OpRqSiQ+UceKM2Zv0VP7lHG/fD3ibwIs1PyI7Isl0VgfMgbAIJolt18vMOg
 m2gaQsbvPNOtQ==
Subject: Re: [PATCH v9 02/15] iommu/mediatek-v1: Free the existed fwspec if
 the master dev already has
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <db984e48-a0fc-0802-0ce6-69d542c08771@collabora.com>
Date: Tue, 11 Jan 2022 11:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 yf.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/11/21 11:54, Yong Wu ha scritto:
> When the iommu master device enters of_iommu_xlate, the ops may be
> NULL(iommu dev is defered), then it will initialize the fwspec here:
> 
> [<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
> (iommu_fwspec_init+0xbc/0xd4)
> [<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
> (of_iommu_xlate+0x7c/0x12c)
> [<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
> (of_iommu_configure+0x144/0x1e8)
> 
> BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
> weird. We always expect create the fwspec internally. otherwise it will
> enter here and return fail.
> 
> static int mtk_iommu_create_mapping(struct device *dev,
> 				    struct of_phandle_args *args)
> {
>          ...
> 	if (!fwspec) {
> 	        ....
> 	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
>                  >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
> 		return -EINVAL;
> 	}
> 	...
> }
> 
> Thus, Free the existed fwspec if the master device already has fwspec.
> 
> This issue is reported at:
> https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/
> 
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

