Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B041F43B554
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425A56E43C;
	Tue, 26 Oct 2021 15:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3A6E43C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:18:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BAC211F43A1C
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 04/13] iommu/mediatek: Add APU iommu support
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-5-flora.fu@mediatek.com>
Message-ID: <792b4ca0-e23b-11ba-98fd-ef4c62a382f8@collabora.com>
Date: Tue, 26 Oct 2021 17:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-5-flora.fu@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/21 13:14, Flora Fu ha scritto:
> APU IOMMU is a new iommu HW. it use a new pagetable.
> Add support for mt8192 apu iommu.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c                     | 57 +++++++++++++++++++
>   include/dt-bindings/memory/mt8192-larb-port.h |  4 ++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 90be8ebbc98a..a5f8f19e053a 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -133,6 +133,7 @@
>   /* 2 bits: iommu type */
>   #define MTK_IOMMU_TYPE_MM		(0x0 << 13)
>   #define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
> +#define MTK_IOMMU_TYPE_APU		(0x2 << 13)
>   #define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
>   #define IFA_IOMMU_PCIe_SUPPORT		BIT(15)
>   
> @@ -185,6 +186,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int ban
>   #define MTK_IOMMU_4GB_MODE_REMAP_BASE	 0x140000000UL
>   
>   static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
> +static LIST_HEAD(apulist);	/* List the apu iommu HWs */
>   
>   #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
>   
> @@ -209,6 +211,13 @@ static const struct mtk_iommu_iova_region mt8192_multi_dom[] = {
>   	#endif
>   };
>   
> +static const struct mtk_iommu_iova_region mt8192_multi_dom_apu[] = {
> +	{ .iova_base = 0x0,		.size = SZ_4G}, /* APU DATA */
> +	{ .iova_base = 0x4000000ULL,	.size = 0x4000000},  /* APU VLM */
> +	{ .iova_base = 0x10000000ULL,	.size = 0x10000000}, /* APU VPU */
> +	{ .iova_base = 0x70000000ULL,	.size = 0x12600000}, /* APU REG */
> +};
> +
>   /* If 2 M4U share a domain(use the same hwlist), Put the corresponding info in first data.*/
>   static struct mtk_iommu_data *mtk_iommu_get_frst_data(struct list_head *hwlist)
>   {
> @@ -923,6 +932,37 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
>   	return 0;
>   }
>   
> +static int mtk_iommu_apu_prepare(struct device *dev)
> +{
> +	struct device_node *apupower_node;
> +	struct platform_device *apudev;
> +	struct device_link *link;
> +
> +	apupower_node = of_find_compatible_node(NULL, NULL, "mediatek,apusys-power");

Is it expected to have PM ops in the apusys-power driver? Currently, I can't see
any, but maybe it's because of how complex is this entire implementation.

In any case, the name suggests that this controls power for the entire APU... so
it would be more appropriate if apusys-power would expose a power domain (since it
also has some sort of OPP, from what I can see), in which case you wouldn't be
retrieving it here like you're doing right now... but simply as a power domain,
simplifying the entire handling of that in here.


> +	if (!apupower_node) {
> +		dev_warn(dev, "Can't find apu power node!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!of_device_is_available(apupower_node)) {
> +		of_node_put(apupower_node);
> +		return -EPERM;
> +	}
> +
> +	apudev = of_find_device_by_node(apupower_node);
> +	if (!apudev) {
> +		of_node_put(apupower_node);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	link = device_link_add(&apudev->dev, dev, DL_FLAG_PM_RUNTIME);
> +	if (!link)
> +		dev_err(dev, "Unable link %s.\n", apudev->name);
> +
> +	of_node_put(apupower_node);
> +	return 0;
> +}
> +
>   static int mtk_iommu_probe(struct platform_device *pdev)
>   {
>   	struct mtk_iommu_data   *data;
> @@ -1021,6 +1061,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		}
>   
>   		data->pericfg = infracfg;
> +	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_APU)) {
> +		ret = mtk_iommu_apu_prepare(dev);
> +		if (ret)
> +			goto out_runtime_disable;
>   	}
>   
>   	platform_set_drvdata(pdev, data);
> @@ -1268,6 +1312,18 @@ static const struct mtk_iommu_plat_data mt8192_data = {
>   			   {0, 14, 16}, {0, 13, 18, 17}},
>   };
>   
> +static const struct mtk_iommu_plat_data mt8192_data_apu = {
> +	.m4u_plat       = M4U_MT8192,
> +	.flags          = WR_THROT_EN | DCM_DISABLE | MTK_IOMMU_TYPE_APU |
> +			  SHARE_PGTABLE,
> +	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
> +	.hw_list        = &apulist,
> +	.bank_nr	= 1,
> +	.bank_enable    = {true},
> +	.iova_region    = mt8192_multi_dom_apu,
> +	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom_apu),
> +};
> +
>   static const struct mtk_iommu_plat_data mt8195_data_infra = {
>   	.m4u_plat	  = M4U_MT8195,
>   	.flags            = WR_THROT_EN | DCM_DISABLE |
> @@ -1323,6 +1379,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
>   	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>   	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>   	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
> +	{ .compatible = "mediatek,mt8192-iommu-apu",   .data = &mt8192_data_apu},
>   	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
>   	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
>   	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
> diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
> index 23035a52c675..908d6831bf99 100644
> --- a/include/dt-bindings/memory/mt8192-larb-port.h
> +++ b/include/dt-bindings/memory/mt8192-larb-port.h
> @@ -240,4 +240,8 @@
>   #define M4U_PORT_L20_IPE_RSC_RDMA0		MTK_M4U_ID(20, 4)
>   #define M4U_PORT_L20_IPE_RSC_WDMA		MTK_M4U_ID(20, 5)
>   
> +#define IOMMU_PORT_APU_DATA			MTK_M4U_ID(0, 0)
> +#define IOMMU_PORT_APU_VLM			MTK_M4U_ID(0, 1)
> +#define IOMMU_PORT_APU_VPU			MTK_M4U_ID(0, 2)
> +
>   #endif
> 
