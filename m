Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C090D02528
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BD110E6EF;
	Thu,  8 Jan 2026 11:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D32vAExF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7210E6EF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0PYXjUX8YBcLAO+yljLN/zQoJZA6cSmOlOiY9PibF7PKAq4MMVujz920zl5d1rXzi1PlUQhby05l3NH7btiMzPgsPmeeO9tjdO3mC+5hMz6iK/TdgozVgd3j+d43QcSldLG9IGXdifHwFjnKEWqy3x60KrxkeZOkFss2qE0kRi+Mf5Yu0Y7SNLcETcVU41Wrj9BTyrwc1374NWfTDvLlQVE42nI6jPEcEj9mT279J623Ng1h1VM7ohPusxcZKmXydLxPhdFgR83cyQXRnp3At/HL06xv0V4UFiyf0LLFs9rRHsyLehB81J1IM7gHWhfaBZWK3BRghbCkZTt8Rcimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/W7LqEx18WUsxvfWM3YNeaXbbGsPWoCwQCAOTqXNu8=;
 b=hAm3xIXY6C9yjHrmOPwB2ezP1sYLT1xQA5mx6q8+xv+IYWDWZfpMd0JaLzG+Ws0ARjLvU21uWPPvrLtEcfKXM0YYLLCIIyHq5JlJSJkjB3H2slkUapzUE8f6v7z1hJWypyQGqxDJ/scj+Xt/0i9JFCduv7Le7hCy34cBC+S25hI04OpmbHtzCpchztA9GhdzmHhi4LO3V0F/SPNlPHL+jhEMoSwBchnBzccQAnikJeFAHe80SIiQ8ZSPMZceWnadVU35YvJNJaJN573UqK4bYJePHSvdo3CSYr5jiFT46TG3YrlSrX4XpHXGZkH5UDzxRXd3fwhEwgPw4Z6jlfMNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/W7LqEx18WUsxvfWM3YNeaXbbGsPWoCwQCAOTqXNu8=;
 b=D32vAExFzG2JgbMQT18gHk6pIsqxITVLwM6b7TdzO10uonV4aW+qZ8zPoUDhhgBImUaFvHVpKPlsgOgd2fFtpoVEeFS05EPUm2grStnVC0f/y9knnuzqmpmHI2tptZIOAFPfG+0D9Bkg4WQlbXUK5OMl9KeOT+lkJuJHMtM3tHZWJFb6EUkpTly/riP3xc/E6AlJOInvJfod0c28RQLx395LoA2Yv/s27zYrR9KU8eioZOleMIqgxb1cp6yMjYd6G8l6i+zZzzA/Ff0pfCVUmHRCpFqRq6b9owSCVoyXWkWmYar83h8fs3zQ85j0/X2s0q25bgRzMTS2/hu17hmLDg==
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 11:13:03 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::14) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Thu, 8
 Jan 2026 11:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 11:13:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 03:12:47 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 8 Jan 2026 03:12:46 -0800
Received: from c-237-150-60-063.mtl.labs.mlnx (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 8 Jan 2026 03:12:43 -0800
From: Edward Srouji <edwards@nvidia.com>
Date: Thu, 8 Jan 2026 13:11:15 +0200
Subject: [PATCH rdma-next 2/2] RDMA/mlx5: Implement DMABUF export ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-dmabuf-export-v1-2-6d47d46580d3@nvidia.com>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
In-Reply-To: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767870755; l=3906;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=XKdedpkRWS96DSpISJqiO92oMp2BawoYlv3Gdfu8C30=;
 b=Z3qzzUy4/YtYqll05kvnHjMtCNcYnq7pKJCtoSRwXwA/u9STtr5eCIuAWZq6tLv5dxCyGKtFU
 ql4S5GsDEgVAMTvUIwCFI7C8J5l7ihMh8qqRBXfgrNTJFaHcfzUFaQX
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ac149e-c850-4240-8a7c-08de4ea6e40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDUyZjFmdi92eXRZWmZaSXhRK2QrdWtLL3pxV3JwSTVtTWZvYnNWUFJoRis0?=
 =?utf-8?B?OVk1K01hT3o3VUNEd3VMNU1mbnVRUXNQRzV1aWkxYXkwbGpHNTVSK2hJUDRR?=
 =?utf-8?B?VmJraE5OUTE3ZWxJSDQvaWRLMkJ5L3BZNHFmdXJYWWpBVlc5bDgwZVdsQm9Q?=
 =?utf-8?B?MmVqY1M4ZFg0MW12UHNwR2VucWY4RGo5Nzg5T2c0dWJPRldENG9qM2hpbkJ3?=
 =?utf-8?B?amVPRzdDQXZmdGl5Sis1VFI4SExydnFJdVJZVWNpLzV3Q2RvclRWYjM4TTVk?=
 =?utf-8?B?d1cyUWthRjFzclJYeEllWWVxS0NOakVSc3puTkVWcEoxNE01MVhPM1k3ZGRx?=
 =?utf-8?B?QUJuUE5iOWFhcTRoNmZOZktCMlZBL2FXeDF3S0JHSzdtQitMdFBrQzZlL1BC?=
 =?utf-8?B?QWxQaWVtcWdFeEFIUm9OekkrYW8zbEN5dnNVT0M4MDlvMmIybU9wVzRhREN1?=
 =?utf-8?B?MmxoYlVKblMzUHNGUzM1cHVZQll3cm9BaDljYzZySHI2c1hDOGQwc3JTZXRO?=
 =?utf-8?B?ZmUyOEJCUTg1UUd4cVRhQmIwWnVJaW5xWWJEc1F6YklCNnFHenFLL1dKN2tD?=
 =?utf-8?B?dUVBK0w3TTN4RjRYbC95RDBsbnkydGt2L1hNQVBPbW1GengvZHNWR2MwUktO?=
 =?utf-8?B?QUlJMHJTVFE0RmdQUUZ4ZCtPY09iem5nZzlLTkNPcDFYeVoya0o5aXBOMlJW?=
 =?utf-8?B?VnBvT2c4T3JYQnY3ZFNRdENSWDdacWNrek9Jczh5cEdITllVMCtFeGE2Ym10?=
 =?utf-8?B?QjZESU1GRWNhSlRIbzlvY2NjcHYwOE1xSEVKWnBrRnBzaXhFaWMyOUR3Ukxr?=
 =?utf-8?B?QnhDdGk2cGtFRE5mU2o1U2dlbG1OOUZGaGlWeTJNYmt4WnBSaEYwdTlxT0xZ?=
 =?utf-8?B?dyt0dHMxUndhbGM3enZYekxzTmtLeXpGVzk2SlUwMXZjWnhHQ0U3YVg5dk1K?=
 =?utf-8?B?eXV3dWc1TTRWeUdpQ2ZyUnMxZDAxMEl1OFdQbTVIU0ZlL1ROelQzNVh3WjdV?=
 =?utf-8?B?NmcwWWpxSzZuNjFNVitJRkx3WVRpSkFObHJ3eDZZL1NLa280QVU4aGFUVG0v?=
 =?utf-8?B?UUt3V1dRanRWanBjZVNrUEcrUVU3UVQ1MG9yTXczL0pRTDNJMW1DcEdzc2tS?=
 =?utf-8?B?dGUvNk5CNWRxVUxTWE91SkwvekJxeXh4UkMrZWtIRnRleE1JbU1jbVdrM05j?=
 =?utf-8?B?NWtyUzJEbktjcS8rUEl5V1lmTTQ4TlIyelUrV2piM0FTb2g1bEJPZ0UyUGVD?=
 =?utf-8?B?cmg2U3dhajNlSWJEQzJ2a3R5cVlUczgrTEgvM1FZL0U5Q1NpVndjNmFWMENL?=
 =?utf-8?B?UG03MWlGeHJuYlVmc2p4MmVaQUtNOEFrM3NJSTQ5bm1DdG0wTkg2a0JVL0xY?=
 =?utf-8?B?aXozVzNXWVYrMW5zbXp5aXZCQllXb0FldDhRd2lOSnd5MEllUGpoRFJWQ2tI?=
 =?utf-8?B?akhQZnZWVkNwSEljUE5KcGc1Y2gxN29Uc3I5K0JEdEgxWnR1L3ZqdW9CVmNw?=
 =?utf-8?B?MFBCLzV6S2ZNYmZvZlg1NTVsMjljN2VrMUxzaTdxRUdaVERJMCtDRkk0b1Jo?=
 =?utf-8?B?U21SU2VDTXBXR0Vsa1FBZXRRaTlnaUtwQlNSZUhycVFtSzIwazg0YkhWa2ll?=
 =?utf-8?B?ZUR1TVNsUlZHYUlhaEMwOUV5ZER4QnBtV1ZibkRvaEIrS05hUEpOdzdLY0d5?=
 =?utf-8?B?NXVlSWNIQk5kM0JIWldBM1ZWaUVsQXdLbEJ5eVI3UmFRMEg3eGJwc0pUSGdp?=
 =?utf-8?B?ckNFVjBBNWxZbjZlQ3V6YThKM29VSWpDUW9vaHFDR2w4L2dIWGNhYXRxb2pP?=
 =?utf-8?B?dGlFanB1NCtxcUFueWh5ZS82VDhtZytvMU9VZEZOQ0t0UlhPVG1INXJyRlRL?=
 =?utf-8?B?M1Jha2lzRFhrOE9rSy9qY1hkRWNnSDQ4TWt3Z2FvMnluK3NUNkU5ZUg2dW1q?=
 =?utf-8?B?RnNyc2ZzNStBK3l3b3owR3BwY1FsZWlxNnZpNjJ3Z0NZbWxneDdmK2Juai8v?=
 =?utf-8?B?L0pPNEx5aHRsN2lybHNWVU9iMUpSV3BCNHl4S0RtU3VtamdUeEpLaE0vQjRy?=
 =?utf-8?B?QllBb3lWT2cxYTNzZm0zQklOekYxb1cvRzNKRitxUFppVlhMMGpZcUlMbXgw?=
 =?utf-8?Q?oED8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:13:02.9106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ac149e-c850-4240-8a7c-08de4ea6e40e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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

From: Yishai Hadas <yishaih@nvidia.com>

Enable p2pdma on the mlx5 PCI device to allow DMABUF-based peer-to-peer
DMA mappings.

Add implementation of the mmap_get_pfns and pgoff_to_mmap_entry device
operations required for DMABUF support in the mlx5 RDMA driver.

The pgoff_to_mmap_entry operation converts a page offset to the
corresponding rdma_user_mmap_entry by extracting the command and index
from the offset and looking it up in the ucontext's mmap_xa.

The mmap_get_pfns operation retrieves the physical address and length
from the mmap entry and obtains the p2pdma provider for the underlying
PCI device, which is needed for peer-to-peer DMA operations with
DMABUFs.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
 drivers/infiniband/hw/mlx5/main.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index e81080622283..f97c86c96d83 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -2446,6 +2446,70 @@ static int mlx5_ib_mmap_clock_info_page(struct mlx5_ib_dev *dev,
 			      virt_to_page(dev->mdev->clock_info));
 }
 
+static int phys_addr_to_bar(struct pci_dev *pdev, phys_addr_t pa)
+{
+	resource_size_t start, end;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		/* Skip BARs not present or not memory-mapped */
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+
+		start = pci_resource_start(pdev, bar);
+		end = pci_resource_end(pdev, bar);
+
+		if (!start || !end)
+			continue;
+
+		if (pa >= start && pa <= end)
+			return bar;
+	}
+
+	return -1;
+}
+
+static int mlx5_ib_mmap_get_pfns(struct rdma_user_mmap_entry *entry,
+				 struct dma_buf_phys_vec *phys_vec,
+				 struct p2pdma_provider **provider)
+{
+	struct mlx5_user_mmap_entry *mentry = to_mmmap(entry);
+	struct pci_dev *pdev = to_mdev(entry->ucontext->device)->mdev->pdev;
+	int bar;
+
+	phys_vec->paddr = mentry->address;
+	phys_vec->len = entry->npages * PAGE_SIZE;
+
+	bar = phys_addr_to_bar(pdev, phys_vec->paddr);
+	if (bar < 0)
+		return -EINVAL;
+
+	*provider = pcim_p2pdma_provider(pdev, bar);
+	/* If the kernel was not compiled with CONFIG_PCI_P2PDMA the
+	 * functionality is not supported.
+	 */
+	if (!*provider)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static struct rdma_user_mmap_entry *
+mlx5_ib_pgoff_to_mmap_entry(struct ib_ucontext *ucontext, off_t pg_off)
+{
+	unsigned long entry_pgoff;
+	unsigned long idx;
+	u8 command;
+
+	pg_off = pg_off >> PAGE_SHIFT;
+	command = get_command(pg_off);
+	idx = get_extended_index(pg_off);
+
+	entry_pgoff = command << 16 | idx;
+
+	return rdma_user_mmap_entry_get_pgoff(ucontext, entry_pgoff);
+}
+
 static void mlx5_ib_mmap_free(struct rdma_user_mmap_entry *entry)
 {
 	struct mlx5_user_mmap_entry *mentry = to_mmmap(entry);
@@ -4360,7 +4424,13 @@ static int mlx5_ib_stage_init_init(struct mlx5_ib_dev *dev)
 	if (err)
 		goto err_mp;
 
+	err = pcim_p2pdma_init(mdev->pdev);
+	if (err && err != -EOPNOTSUPP)
+		goto err_dd;
+
 	return 0;
+err_dd:
+	mlx5_ib_data_direct_cleanup(dev);
 err_mp:
 	mlx5_ib_cleanup_multiport_master(dev);
 err:
@@ -4412,11 +4482,13 @@ static const struct ib_device_ops mlx5_ib_dev_ops = {
 	.map_mr_sg_pi = mlx5_ib_map_mr_sg_pi,
 	.mmap = mlx5_ib_mmap,
 	.mmap_free = mlx5_ib_mmap_free,
+	.mmap_get_pfns = mlx5_ib_mmap_get_pfns,
 	.modify_cq = mlx5_ib_modify_cq,
 	.modify_device = mlx5_ib_modify_device,
 	.modify_port = mlx5_ib_modify_port,
 	.modify_qp = mlx5_ib_modify_qp,
 	.modify_srq = mlx5_ib_modify_srq,
+	.pgoff_to_mmap_entry = mlx5_ib_pgoff_to_mmap_entry,
 	.pre_destroy_cq = mlx5_ib_pre_destroy_cq,
 	.poll_cq = mlx5_ib_poll_cq,
 	.post_destroy_cq = mlx5_ib_post_destroy_cq,

-- 
2.49.0

