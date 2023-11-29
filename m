Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7E7FCBF2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A4010E5D0;
	Wed, 29 Nov 2023 00:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A65110E5C7;
 Wed, 29 Nov 2023 00:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J33HMkSpQ7i7/AxS6Pbyrs71jeA2jwm7ZGPUUz2WvOEi2Wk0GTfMzgVO3jTA5Bz630ltjvcmQudKFW1UGcmbza4inh+R/X3zw+50vWo2EwE7XQkYJfs2Utiuk0ulp6iVy/dmqVTcjNvPbolrJ5OZ5VTz66FpVdeHxPJjuv0sYRReucBmFUCHEx89/Iwd714bD/UK8CnAlPYJ9WZ0aeaFj2HDGgc7yW/FYm/LrdBICogIEiYdk9fFhgiRRZCBDz9SylKCTLPbqccBhRj7UlFB5NLurTBO5LJePUHLG0B+HuoxucB4iN6CGnc1OpvEqbiLZePH6ytmDRUOZ3IrIxC8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbHT1+KFV/20F8vmmdzKEO7JcLCcujqYnzeQLPyDRVw=;
 b=HMKeTbMVHyW0zWbkSrmDqGboHLhDpEqzCo9SL6VVPeF058pU9+HKxBEkfPfSSIL50uVYKDQwPK3XpynEgbQYkYmc0zbpuPNLGfiz/CcXSNqb96kYkr8nLxdrzed8J/C/rI+VL5rueOcpM9m0Q6q5bkKKUPNVay0DEVtzt58VFVCDQnSSwyDeZIzybI7XKL//TDNYVBuuKQQHNqH7ov6J1gDLc/fgqVtgl8Mo+hUleCrFiCSAdKflBNsFCKKuU4/Tdhlo52QEUXPO8Aq17zvmKDI4gnjNX53dL92rK3Yu9s47/rLNNXZBBaTRNqAE+jp2gzcCWIGbekJCh77r4LycPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbHT1+KFV/20F8vmmdzKEO7JcLCcujqYnzeQLPyDRVw=;
 b=JgkNRDr6k9+tsxYJDbWo6ZCaUPZIz6bVajc/YtK49ElYS1zQk33Ay/n3ZEMmkBo54ehv0998WtaPOlCoSQ62KBS/tRLXINSRbygliVcbH5oyXru9grMsc+q5arP9gVzhTSmHC7CKMrYGQlvulEFFltnozl9q4qORP6r6fb8RULX/zQoB5Amw+zsy0/S8JnoYfbABxy6jU+j19NFBn+sYE1O9OfSayJ0ik2YTGx4oZbD25qi6gRCrbZadmF870kg7wtv0nkHcDRaGYhIWXuACu1Eqznor4pw9tNe2hSAgpzUjtpXyDvf8fOZiMaaWN14QxS0i+g+cByOVYCWRLc8e6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 00:48:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 00:48:13 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Karol Herbst <kherbst@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, nouveau@lists.freedesktop.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH 08/10] iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the
 remaining places
Date: Tue, 28 Nov 2023 20:48:04 -0400
Message-ID: <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:805:de::45) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a02ace-b9c1-4f95-28db-08dbf074dba2
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tBTgllR6ysaDCa8nB1NjgjCaR7f+sYWEV1hsuQS7cj8OdNUjpS3NWNGXHEymzzH+uWYZNq7nyfvg1Sj/fn2rq49uU0ggc3SvVhR2UHbC9TxAbDh/p/3MHcC5g3fBYF8VZJ22sOYaWKpEkGLSNXlPUkevc26nEL5eJUvtMzx1PfCSdRzWdPL/V3vAe68qUyO6H7ph9i/kH7Zo2bvXJxL1eL1T8GdIR8+QXjQzui0dkTnAyBteKOolg8wPREEErSi+LCXbdmLUe8n86G9+12ZrzcjVNQFF17J9j3wmlQIyEmty5EosimrK71FMgT6SuPJUQMBkeXWnbIEPdooG9tZC0v9lwDhSZBdr4SRgH1TfwDysCLT3P6WXqmaJUip0l8BYNAI9SbJlgpJy6Bb2IvoaWdVL5XwMzH85l+3iC2zjFQjf65xjolLDO5If470hEaiwLyeiEHP/UZpKwKzDtTldb5koAneDSvaiIVePIuSIaPrRWWEgVhGKedKKXBQ7IEVifqnYQWs6zY+6SjwTCdlS6FYY0+M0dQxx95ph2l7qhaFdyMmZDlaiVMB45uzIIaP/QxmmNS3r5kI2T9EgDTJa0BIGvJmsuvPK1a8k230NJ5yIZerdqydy8e/rqo/i/V9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(7416002)(7366002)(7406005)(41300700001)(4326008)(8936002)(8676002)(2906002)(110136005)(316002)(66556008)(66476007)(54906003)(66946007)(2616005)(921008)(6486002)(478600001)(36756003)(6512007)(6506007)(66574015)(26005)(6666004)(83380400001)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssokdyrtSXQsVnEiFm5yztlgDbavoBr3t7MYHnZX7QUBgrV6jZw4oHN6mZqM?=
 =?us-ascii?Q?Y6DzmNgPHvj1X/MnhftVKwjGialq/HU/qmnb70sFtKpFvm3mpG75a0eXX955?=
 =?us-ascii?Q?+6vz/vqweBA66OBjrvCoUoN2tZ7hmbSHOtFbI8QuLiuc9gGgyP2tHmcpqQrI?=
 =?us-ascii?Q?TdNY+yVkC4z6FMV9eH9z37pgEk30+f/gB2tiosGv0GFRTVboqmKFhJahFaWu?=
 =?us-ascii?Q?ditUeUL2OdUb4LZ1Q/6wU8DIiajuFs6YdfUFaHCBPyuk8JhDOFLd/+trSsJ3?=
 =?us-ascii?Q?lh7wIM/kKfK4qMcoA0NcirHFnATrAcaH4TpETAGgJCCXsSeZv4Vsl8VGQsP3?=
 =?us-ascii?Q?NImwYsteJcBgM9kqDxhXzMlziGeM9BtObktyeM2mEBxReLYTsAXAfTjw2McT?=
 =?us-ascii?Q?9GWD6DS7jqcWgL+QD5NTXSUb91wYBsRGbyVrfLzNc6kFPG1LFl7cCjZJv3RV?=
 =?us-ascii?Q?5TBeWNpMQfMWdBIAhA62+6t0t+7qXT/n8qTL4SpHaijv+M2bg/r/RlQp6giG?=
 =?us-ascii?Q?gLfphG8edGkASDvHQzHlQQGXnLFL0hEVL2mfcRatjE/T0wV03tHQ+frfFeD7?=
 =?us-ascii?Q?UMWqV4ovWFB8gXNsar51F6SGQ2CaOTAisZlStpTGb8Yn1OA96CgeO8gcIhRk?=
 =?us-ascii?Q?c3YQQNd6d9C8k1w7hMZ5go1ogkOwUi5xDW2bxqUDeClOVgg7MXRtyj//N5aK?=
 =?us-ascii?Q?PkCWFoiEqAi8hDuaAmTxX/jsOm0vZdftM5XBCGxesoXdbEpeP+MNhzNVo6qE?=
 =?us-ascii?Q?cT+8TfptkpnQ9c03A+uxjZN850BOYZbtsOtY6Jhn8uxP0B3BM18BeZ6aAtey?=
 =?us-ascii?Q?uVTKiXL++/AYmahYOGzp1+VM3ZvsasEfJG7cT0nRVHCxLy2aJzE1E/ay3OcB?=
 =?us-ascii?Q?9EUeJ1Kz+E4JgM05erMI6vJ3fIufG2CGh6TaOb/nMG7P2qVMlUmm8pUm7gMc?=
 =?us-ascii?Q?j/BSFC4hCLm5m2tGq6DyT+5JtYMNjBw0I6dZsim3qzJNanpQOx1WJ/Uju4f5?=
 =?us-ascii?Q?M/02pmV2vH8If4pg2dWXZCu+M9aNFK6NTE019tcVDZmhQqBDUkppP12ktzlj?=
 =?us-ascii?Q?lPOS1hIJMtTu18uqc4w7zConjRYDW7rqFQWjz1py4ytBcMF7G4vYcjueW6St?=
 =?us-ascii?Q?wUjrQMpjSnvB40kOe1IjBfvBdBFfuCbFkMhTToh212ewBvmbgj89F1kNewb4?=
 =?us-ascii?Q?3LEAJcWiTwoBI5Z/tEcSfP7LtjvXXq0PElDuFallZtZuU2GbYw7mXA2WfKCw?=
 =?us-ascii?Q?sz9ybiPy4dXk1Rrja5TSwwyDqCi8uiFXkgk7BjRkkox3ADyntIJyIOgyrr8e?=
 =?us-ascii?Q?6EhGUKawu55/VDFnq7pEI1s5eSXe6OyPTgoS5rnm9MAOsDEBHEMApPJg7/bD?=
 =?us-ascii?Q?2zf4Cxp6IL1Op/0a/nVo8gXFLU1OcZgAF3xGnIDbmKjF99QCcisLYYqvvO9j?=
 =?us-ascii?Q?FX8Jgf/FsACJMGd4sRlW3Xyzz0BQ8gRnYiEBM2yWKqkkm9SCRPSBnB1rX0ud?=
 =?us-ascii?Q?64fJsfnGEUQxyPL7XRtMkCbvISPYAnrvFe7D+Ix+LbKEG7Dd/hzSDbU5eS69?=
 =?us-ascii?Q?GhQ7MHMuoXGp0sPlUy8cOiitHop/WSCFvMgmn8St?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a02ace-b9c1-4f95-28db-08dbf074dba2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 00:48:09.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKdhvK8dSwRgwkccyIgkuLRak3eWVI9irOmPi1IrcAmKPdmM/LP7AlGWRiWY1FFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Hector Martin <marcan@marcan.st>, Jerry Snitselaar <jsnitsel@redhat.com>,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 Moritz Fischer <mdf@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API was defined to formalize the access to internal iommu details on
some Tegra SOCs, but a few callers got missed. Add them.

The helper already masks by 0xFFFF so remove this code from the callers.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma/tegra186-gpc-dma.c                  |  8 +++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c |  7 ++-----
 drivers/memory/tegra/tegra186.c                 | 12 ++++++------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index fa4d4142a68a21..88547a23825b18 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1348,8 +1348,8 @@ static int tegra_dma_program_sid(struct tegra_dma_channel *tdc, int stream_id)
 static int tegra_dma_probe(struct platform_device *pdev)
 {
 	const struct tegra_dma_chip_data *cdata = NULL;
-	struct iommu_fwspec *iommu_spec;
-	unsigned int stream_id, i;
+	unsigned int i;
+	u32 stream_id;
 	struct tegra_dma *tdma;
 	int ret;
 
@@ -1378,12 +1378,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 
 	tdma->dma_dev.dev = &pdev->dev;
 
-	iommu_spec = dev_iommu_fwspec_get(&pdev->dev);
-	if (!iommu_spec) {
+	if (!tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
 		dev_err(&pdev->dev, "Missing iommu stream-id\n");
 		return -EINVAL;
 	}
-	stream_id = iommu_spec->ids[0] & 0xffff;
 
 	ret = device_property_read_u32(&pdev->dev, "dma-channel-mask",
 				       &tdma->chan_mask);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
index e7e8fdf3adab7a..b40fd1dbb21617 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
@@ -28,16 +28,13 @@ static void
 gp10b_ltc_init(struct nvkm_ltc *ltc)
 {
 	struct nvkm_device *device = ltc->subdev.device;
-	struct iommu_fwspec *spec;
+	u32 sid;
 
 	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
 	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
 	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
 
-	spec = dev_iommu_fwspec_get(device->dev);
-	if (spec) {
-		u32 sid = spec->ids[0] & 0xffff;
-
+	if (tegra_dev_iommu_get_stream_id(device->dev, &sid)) {
 		/* stream ID */
 		nvkm_wr32(device, 0x160000, sid << 2);
 	}
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 533f85a4b2bdb7..3e4fbe94dd666e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args args;
 	unsigned int i, index = 0;
+	u32 sid;
 
+	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));
 	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
 					   index, &args)) {
 		if (args.np == mc->dev->of_node && args.args_count != 0) {
 			for (i = 0; i < mc->soc->num_clients; i++) {
 				const struct tegra_mc_client *client = &mc->soc->clients[i];
 
-				if (client->id == args.args[0]) {
-					u32 sid = fwspec->ids[0] & MC_SID_STREAMID_OVERRIDE_MASK;
-
-					tegra186_mc_client_sid_override(mc, client, sid);
-				}
+				if (client->id == args.args[0])
+					tegra186_mc_client_sid_override(
+						mc, client,
+						sid & MC_SID_STREAMID_OVERRIDE_MASK);
 			}
 		}
 
-- 
2.42.0

