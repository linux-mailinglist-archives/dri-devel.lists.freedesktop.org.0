Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C295808F54
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A510E94D;
	Thu,  7 Dec 2023 18:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2010E20F;
 Thu,  7 Dec 2023 18:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b54bsKjTox2++AdrfYcceeswJCbM7FWXuCYDFae7hn+CkmGp5iap0JiefcR3U/2n502EcVxarh6CCYpH3/UJHn/zr8DBES2ei/RC5LOcNFbpuFZ0c0MGYzMhSF4qgJzs0KbRWyjlmDWn5jK55Fd1BoGhBQMdMWbwpMOEWZ0UV7sCuDaw4nZzj7HcaawrvSuaIs35Znc4AWjYp4pb9lBjQVIRaSzaue5kjk/Fe+yzI0SQPEWz8Is/vRQBkcDRDYSvuL942nPaN8k7IcghU5jBvl4ZRMuFdJo5C1t1Niw/taAbP2fy3odsZdJMwjCFgvs3LPNrc2TIkZ2QGQvTedDhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkdvzv1EBXyWjybHWKWnAFViL+abSa6krQd/K5pDdlE=;
 b=fLdWIH6q+fqGlfgzPx+x9JpmN4nErmv0c/LvP9dY/1PMK4DpZ0hM0p4nD5D8O138jw2Q7Z3oaKPv8yxchvVjjNeCwu0kmz992cMB8KCw2e9L4kMzlfWu0mXIQLsk3Aqgm68P4+zazdUFh5uFZGIrYUrZ4dVmda0Akw7H1+AtQCHUu4yNibTHh/Yqy26vvknjPC9+gDIopAnEpiciEkvUPzSQZtPhHCvtCWSw4UT0R+VSc+gi7SvOkBafR8GIUtG633dZTBwAy3V4a7RzOsI2xZD+E0tjcBH1SpZ2Gn2sy4leZXBInIqV68IvUjMSZ+KDCAIQU6UP7aVLMnHqz+KzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qkdvzv1EBXyWjybHWKWnAFViL+abSa6krQd/K5pDdlE=;
 b=RM1T2z1HVka+Ht8GnkUmVUPuUQa/wwohLOeeCRB8c+0Hlr/NZjgsefeS2qq5CfEkY4b96vssjeQCuI1y5/8wNTaWVT2Ufy/c43F4RYK/2dMq79EwDq4yRLBOn5GjdYiaSbUJyS9jK2/DWNg54sCHa0YWaDVzauNdqNiaXulOMMba9l/0Fr5Xi+GoZKtxTnZPD3htkL/aeb87S69GkXZUImRbloy9HDZvGG4WPGBMdPEbva7s6ztLgeGbKcOWlb38ixWKdd6pxhlhaWsZaCEEZloj2SJ+/cmg+FKI5mtk7i9U0rrhghMrBH/PRMR5b9LFXPUG236ewGY4I/iGMPcmJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:15 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
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
 Lyude Paul <lyude@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 7/7] iommu/tegra: Use tegra_dev_iommu_get_stream_id() in
 the remaining places
Date: Thu,  7 Dec 2023 14:03:14 -0400
Message-ID: <7-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E0D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e13b29-904d-42f6-d3e4-08dbf74ec8b9
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n/l6UAabUdpS5PVFZStuBJoDnIqrihHpl7qOWQuw3pmkEzShA3wA/eXc4fdVlynIh7D9Nf3S612YCYIhbrM7Hl4E/BN7BoAyn2n4VsqWc1GZW7/rzEX5BeTphiYPcoGkBQMq11bqvUYStxI1UMF+AVmK84hjOE850BnHjFp4IVpfnVHaPuT+p6AevNDvV07SMjpgC99U4Lulo2Vy1DwoFKL90lyMyQhCaiZl0IPuAGwUQLy7fF67nmfYg3tT6ydQmzc+qaCvy7UBj7ZNk/cTTSHmwAb54uQSpvvgvMrVPDJjlp1PgsCOhQYBTij4L7LBk4TMsgc0qt282aj7NG+5gqGKf003hF5vJk6xG3irbyy+kDwXcDUY8s28eKT9nfdB30hOqhq3OYEQpVEWPEhLwZrdyOo7pyP90cEV//IFKTRoXv9Qbxym7kcoB3CKaXtDKB0ntchgRUcuBO9EYjl+YZ4Q0p7hE6XvWGQ6YonBpSS0/AvpvMf3N/t7bYCVlFXdoRPwzWlA0hyEZLa3scpmKw8F8ZZEBNrOQXTuuoBVh7lPB4b+RthKJgF7KSaDF3ajhGGvvX/o06XHSkmXphfWqCiNebxomSynFjo2sUm2onTb8PI312bij44oQvF3LVx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(66574015)(83380400001)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+JFcrODuzG05IJoMWbmoOiF4vCjY3SH3yczsBv+1cnvZb/PHHqr49Ya4DxGw?=
 =?us-ascii?Q?FFAQzMVFPEBCbqJCLO2JFNYQpbPesApFsErSdY8FP+I8ZggtbmX9g5iA2T78?=
 =?us-ascii?Q?TJxK8Naww7UoETmaOG85QiH70jfDBMbAgVh6wQBcrkj/ziWx28ybAxIc857G?=
 =?us-ascii?Q?GpK/IMMi+42kB/0+GPojg6Q0J40FLr1/rdfmp/3VsizdJ7gZUl5Ii9sSbOoz?=
 =?us-ascii?Q?2aJYBilbWAAhWtJGamsfsHUOQmRqkmz6Tikek1xlNutEscjt6A/LRPBFHVGS?=
 =?us-ascii?Q?r4BzqQzf50TXJKHbNtMOiGsy2gylTQPS5ZVxWyIP4s3AJSzZ1murhL7tdf/3?=
 =?us-ascii?Q?aAQMlACPZfkqoknaexWV8w4IgzEAFXbmZdBl3QMZ9AVqFXyoPpEglsbLAwSL?=
 =?us-ascii?Q?Imos7H4nFoLkGfGAXm5Nhom2pa97gjirhWNpHP8B2b2Yun3N8ecicrCp0D+0?=
 =?us-ascii?Q?GrExXcj9kyUzIxH9qsYADh5PglW0gvklbFU+CEmWINm14Y0AcASbbQcemucB?=
 =?us-ascii?Q?cgsiw/voFBeTxf2jEhXadDBT13I1WV8e8GPELL87KqgWi7e8NcaJ96oqltaZ?=
 =?us-ascii?Q?bKojsGRMz8E43qVLE7GH2kCyXcWOFY5thGXyGelilGmjF5reNtx6ZoP8sJI8?=
 =?us-ascii?Q?ZJuyrNM2cSXKpEvQKVqeXDJIHWg+oPk9f0Xigzpi7cWtxl96CRpfCgSS7Zti?=
 =?us-ascii?Q?WoYMGE4khrx0p/ej1/oHKFceNOizJU1KyVBZyG/cIICfYtRtHUBBjo2SDcfs?=
 =?us-ascii?Q?vSy7AYSW4Un0HYPnrGb2fpFTxjs7WiB091ddDt5REj1J9fJ1Q4SkeWXohkLe?=
 =?us-ascii?Q?ST7HqkgJdasiA9JirPU+h0gfwdCj+aecmDSsQdh5W6X8JE8bZfOc8gVWsnFM?=
 =?us-ascii?Q?9eDG6Cr52xahrh3neToXaIPu/AzXQdD7u7jKCc39zLBe7SVRe+7Y26zZLRFD?=
 =?us-ascii?Q?MvZBMys/NjxB7jwrck2UTPky41COgjDf/Y65eQwHJHRJT5An2lGfY0N6Qd7A?=
 =?us-ascii?Q?ihywWykCpZgFr4+b82kfiLgJKem3ZyBJ4XPLrfGr4wVBtGZ00HtL/V1WW8Qv?=
 =?us-ascii?Q?sRl39k5IgChEAQWckboRPjz6+tZZBWMtsDgZ0ypdmhYw5tJDQOMBvyTlmpL/?=
 =?us-ascii?Q?UqEi9ernx45wdPakz9YLhShrqwMw9MF0Lg8DasVMoBH+JEyBSDI7yuXmUeLH?=
 =?us-ascii?Q?ZPzgaUJ/OY6gXhg9Zb87e7AgvrqR25+HgoEj13TRgJp7Z8qvPscXjb6hEPDE?=
 =?us-ascii?Q?ZwC1XdVjS4iB0GOZv57qN5xmIYgg2m/xY5q7R+djCjXs0nYBEC2CDgeHqY90?=
 =?us-ascii?Q?O/HTq6VyTP/q8aKLqXJFV+rtXNC1OypgYluofL3MhrUUv3cw1UZ1ecFczk/b?=
 =?us-ascii?Q?XInHw5R+zvGvR0raZX6ZDRj/ps3WJVg8Ok1/p+wyA5u/MLe/jJq6YKcu4+Wx?=
 =?us-ascii?Q?3Qwax/RtviwiaGUH+cT2sq0tnO8W9X1WZRWkK9AJh6+uprqSJUzOj5enCWpr?=
 =?us-ascii?Q?c00KBhlCIRxg9t8V+AAypSH2MpOO5+JxU8XZy7jiiea4tTlC0TQYQlWHq3bp?=
 =?us-ascii?Q?hLZhZ1ccTI6ZwPI08Rvb3Wp/DTj7alaBqwajCQzk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e13b29-904d-42f6-d3e4-08dbf74ec8b9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:15.1951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpYMkmZkyeEXimkQSeaIavwaVjwVEFkWI8BApk4OYFTmL4lf2Igjlo69pO0fmWrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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
 Moritz Fischer <mdf@kernel.org>, Moritz Fischer <moritzf@google.com>,
 Thierry Reding <treding@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API was defined to formalize the access to internal iommu details on
some Tegra SOCs, but a few callers got missed. Add them.

The helper already masks by 0xFFFF so remove this code from the callers.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma/tegra186-gpc-dma.c                  |  8 +++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c |  9 ++-------
 drivers/memory/tegra/tegra186.c                 | 14 ++++++++------
 3 files changed, 13 insertions(+), 18 deletions(-)

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
index e7e8fdf3adab7a..29682722b0b36b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
@@ -28,19 +28,14 @@ static void
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
-		/* stream ID */
+	if (tegra_dev_iommu_get_stream_id(device->dev, &sid))
 		nvkm_wr32(device, 0x160000, sid << 2);
-	}
 }
 
 static const struct nvkm_ltc_func
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 533f85a4b2bdb7..9cbf22a10a8270 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -111,9 +111,12 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args args;
 	unsigned int i, index = 0;
+	u32 sid;
+
+	if (!tegra_dev_iommu_get_stream_id(dev, &sid))
+		return 0;
 
 	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
 					   index, &args)) {
@@ -121,11 +124,10 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
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
2.43.0

