Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B149F9AD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 13:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1E410EB1D;
	Fri, 28 Jan 2022 12:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B213B10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 12:41:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFF7DB8250F;
 Fri, 28 Jan 2022 12:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA84CC340E6;
 Fri, 28 Jan 2022 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643373666;
 bh=QTzghuuSPtxJUTuUKx+W2/InQdxW15PSFwUv7VwUABw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fDDCmQCAaMcJEavgtcJqwJ2QJDBq3pXRsPPc/l3by+2yESxDGmW5Kc9OAQqn3MlGS
 9u8Jv1ppUGuCND2rokmY9SaMNtaybtUEWIbP9oXZ0jFRJDx82sG3zyppd2O0w9G76o
 Uf6erkYS+tgPQeVG5Z4aajPuWDNl06NAHpm7V+osyHiEA1BafH1iqrwBRt4Nwh5f7b
 wTP3ylF7iEUpGtGw+XjQr3MkFPOrG30hsWP/p9VE+pXFzTebvsbCxultxHFmtTO7Ho
 qvm2eN+tw7ziwQofhdfjUSM4ZDTzEncDr5Kmwnm/HUP8sHcsjZTVNARCCP6qFvyT/z
 eHYTGTk6Yk5gg==
Date: Fri, 28 Jan 2022 13:40:55 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 02/13] iommu/mediatek-v1: Free the existed fwspec if
 the master dev already has
Message-ID: <20220128134055.720bb43c@coco.lan>
In-Reply-To: <20220117070510.17642-3-yong.wu@mediatek.com>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
 <20220117070510.17642-3-yong.wu@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, Hans Verkuil <hverkuil@xs4all.nl>,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Frank Wunderlich <frank-w@public-files.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias/Yong,

Are you ok if this patch gets merged via the media tree together with the
remaining series, or do you prefer to apply it via SoC tree instead?

Regards,
Mauro


Em Mon, 17 Jan 2022 15:04:59 +0800
Yong Wu <yong.wu@mediatek.com> escreveu:

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
>         ...
> 	if (!fwspec) {
> 	        ....
> 	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
>                 >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<  
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
> Acked-by: Joerg Roedel <jroedel@suse.de>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index be22fcf988ce..1467ba1e4417 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>  	struct mtk_iommu_data *data;
>  	int err, idx = 0;
>  
> +	/*
> +	 * In the deferred case, free the existed fwspec.
> +	 * Always initialize the fwspec internally.
> +	 */
> +	if (fwspec) {
> +		iommu_fwspec_free(dev);
> +		fwspec = dev_iommu_fwspec_get(dev);
> +	}
> +
>  	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>  					   "#iommu-cells",
>  					   idx, &iommu_spec)) {



Thanks,
Mauro
