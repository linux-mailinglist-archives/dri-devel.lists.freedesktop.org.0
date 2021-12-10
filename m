Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96425470706
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3DE10E9BD;
	Fri, 10 Dec 2021 17:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51310E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:49 +0000 (UTC)
X-UUID: f6184c85e41d4b64b8936494185a5018-20211211
X-UUID: f6184c85e41d4b64b8936494185a5018-20211211
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 26101188; Sat, 11 Dec 2021 01:26:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:26:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:44 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 07/17] iommu/mediatek: Support APU iommu and config data for
 mt8192
Date: Sat, 11 Dec 2021 01:25:55 +0800
Message-ID: <20211210172605.30618-8-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

APU IOMMU is a new iommu HW. it uses a new pagetable.
Add support for mt8192 apu iommu.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/iommu/mtk_iommu.c | 45 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 8377f3c37283..4bc7c76062e6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -133,6 +133,7 @@
 /* 2 bits: iommu type */
 #define MTK_IOMMU_TYPE_MM		(0x0 << 13)
 #define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
+#define MTK_IOMMU_TYPE_APU		(0x2 << 13)
 #define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
 #define IFA_IOMMU_PCIe_SUPPORT		BIT(15)
 
@@ -185,6 +186,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int ban
 #define MTK_IOMMU_4GB_MODE_REMAP_BASE	 0x140000000UL
 
 static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
+static LIST_HEAD(apulist);	/* List the apu iommu HWs */
 
 #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
 
@@ -209,6 +211,13 @@ static const struct mtk_iommu_iova_region mt8192_multi_dom[] = {
 	#endif
 };
 
+static const struct mtk_iommu_iova_region mt8192_multi_dom_apu[] = {
+	{ .iova_base = 0x0,		.size = SZ_4G}, /* APU DATA */
+	{ .iova_base = 0x4000000ULL,	.size = 0x4000000},  /* APU VLM */
+	{ .iova_base = 0x10000000ULL,	.size = 0x10000000}, /* APU VPU */
+	{ .iova_base = 0x70000000ULL,	.size = 0x12600000}, /* APU REG */
+};
+
 /* If 2 M4U share a domain(use the same hwlist), Put the corresponding info in first data.*/
 static struct mtk_iommu_data *mtk_iommu_get_frst_data(struct list_head *hwlist)
 {
@@ -638,24 +647,45 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 
 static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
+	unsigned int flag = DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct mtk_iommu_data *data;
+	struct mtk_iommu_data *data, *curdata;
+	struct device_link *link;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return ERR_PTR(-ENODEV); /* Not a iommu client device */
 
 	data = dev_iommu_priv_get(dev);
 
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_APU)) {
+		/*
+		 * The APU IOMMU HWs must work together. The consumer device
+		 * must connect with all the apu iommu HWs at the same time.
+		 */
+		for_each_m4u(curdata, data->hw_list) {
+			link = device_link_add(dev, curdata->dev, flag);
+			if (!link)
+				dev_err(dev, "Unable to link %s\n", dev_name(curdata->dev));
+		}
+	}
 	return &data->iommu;
 }
 
 static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct mtk_iommu_data *data;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
+	data = dev_iommu_priv_get(dev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_APU)) {
+		struct list_head *head = data->hw_list;
+
+		for_each_m4u(data, head)
+			device_link_remove(dev, data->dev);
+	}
 	iommu_fwspec_free(dev);
 }
 
@@ -1270,6 +1300,18 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 			   {0, 14, 16}, {0, 13, 18, 17}},
 };
 
+static const struct mtk_iommu_plat_data mt8192_data_apu = {
+	.m4u_plat       = M4U_MT8192,
+	.flags          = DCM_DISABLE | MTK_IOMMU_TYPE_APU |
+			  SHARE_PGTABLE,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.hw_list        = &apulist,
+	.bank_nr	= 1,
+	.bank_enable    = {true},
+	.iova_region    = mt8192_multi_dom_apu,
+	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom_apu),
+};
+
 static const struct mtk_iommu_plat_data mt8195_data_infra = {
 	.m4u_plat	  = M4U_MT8195,
 	.flags            = WR_THROT_EN | DCM_DISABLE |
@@ -1325,6 +1367,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
+	{ .compatible = "mediatek,mt8192-iommu-apu",   .data = &mt8192_data_apu},
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
 	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
-- 
2.18.0

