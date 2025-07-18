Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E00B0A382
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43A010E97F;
	Fri, 18 Jul 2025 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CCKiesY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E1510E979;
 Fri, 18 Jul 2025 11:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQCLDT7IKWtzcraaPxfg8N0WeU7ocX3RSpFnadBhm2QX5wOthiNo3qdqgaeFgvjgc5Eh/z29kLgI0rsLfwoP7hjUMzDRmBsocb3KtsEAz9elIbcKDCaVboxNDPW/5VyHKF0CS3a7rfFOsOTJc7CmqIaTPyk1Rz2XERCCfkiOAdIJMt5FHuJrf9w0RTajhabdzM3OFKLdw3sNTd4Q/N+bPtriT+KTA/pwNT/3WIRaNkCY48EUwiQU97J8jbmNd5CFOn9/Ikt6TBZCUB6VSPasNGqNUMth+LKY0cWys3EAQmdzFTpMLi94exWN1jkBB32dgw/jCYk/nU/FsLv656tlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOPJvGgWjA/YEI0pFjv5YfuT3rt/ytuNzi1aJNt7a6M=;
 b=YYcYN6fN2/O9sFsPF70ZL5FlGGQHyzxQmH0jN8foCh8mtRp7THvsr0Cw7fQrOwLGNYHHYlomk8MgE8cCI/SKVtVU59Na4FbC07yYTJCYRk+9TniQJjesD5kVlhau6Gf6WbjCPo/aYNQdpLH9Cggfk6RiCR9hUtpXIiDdWz/EPY2L7PEZiZ8Me5uB41CGU9x2nsLHMbGAw64qxv0CuYeXvKdObfWCm/YGObO4byloOVHHis/Tfh/uTHPey/+CpppNGYxKd4j//NPPgTIMYTjCqf7FpRFYSVhOQuGcrv02gTT8J8e+80xVFtDMDqKRJ90/Cu/fwCeC6YXGj8RhA87fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOPJvGgWjA/YEI0pFjv5YfuT3rt/ytuNzi1aJNt7a6M=;
 b=CCKiesY/avP3kIcyANQx1o9d1MOroODYqApdxyiZX4hkHo7YW4KnURk0ejr0Cth5sqJUdjwH2H5Ofd0o1dlM/wu84sWVOy3T91kU/Sxttg+DYAu84oVbUzD1cOTWEKZ3aFX+297cq2XqrQg8KhHGyVXFioGkKZjoolrzNsseGM3tL0KFpxccBwYAQI/b2+hjKmi3AqvfsURlQh0Pj8ouQkJOl9px/aJfASJmQ8436/9eG0kQo4PKrHRyYHrmr5/fHNwLPChvtFQrt1+5I1sjulJ83KTVh8esHwrO8+Q1pcl6QQomVJq5eK+9Ew+lXHuAURNEZtMcnZ0iyYakya7KYg==
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 11:52:06 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::3) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 11:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:52:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:51:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:51:47 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:51:41 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple
 <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik
 <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, Daisuke Matsuda
 <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>, <linux-mm@kvack.org>,
 <linux-rdma@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Yonatan
 Maman" <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Date: Fri, 18 Jul 2025 14:51:08 +0300
Message-ID: <20250718115112.3881129-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DS0PR12MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e3c9f0-552e-4446-0144-08ddc5f1847a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N7gaRVMlTCFleMXWmxcOhI2h9M7YrxsNQUcMmNU8jZHNYqV5j0eXCRvG2UkV?=
 =?us-ascii?Q?gPnnpnF4fUZIDmWbP/NnNXP6C2/rYQfVcTik6ckStKm4XrJJtK1nXrR76xPw?=
 =?us-ascii?Q?FoLSvTVEiZpJ7/2NGDn2hpPamZGUoMnCvQ58YtT1kyCbued8ErcqUYAUDcKz?=
 =?us-ascii?Q?KFaQqLHri7gZFPRZyUKjWKlGGmyvQ8Hr4lmFq8UGNyClsif1NMUUmmUW/dLP?=
 =?us-ascii?Q?igu4V1qNcNeQwWWZ/1plCNM7ETBUTB+NAM+lNBEOLhqUaEcavnA08tMCzv6O?=
 =?us-ascii?Q?u2O50jl3laPsDpggsWv8cTVArukXOmWPugu1QVVI2rfuhEiBtcsDAe3YKY0Q?=
 =?us-ascii?Q?3EEGisklW8DH2UrTS5hTAusnxEQrDutduFbr67BxgdFm8c+pl0XsmamSF4SQ?=
 =?us-ascii?Q?RQFr4rsSPQ9afagffG3mFGlfhBuMTMaiefCf/Z9jhOSlUNI1cwyYeMZ0zk2M?=
 =?us-ascii?Q?JhIIzj9oDgDva78GUu2BJni0IlcfrACxwXoucpz01zcy3uG36r5mrGmMMLa2?=
 =?us-ascii?Q?9ZfONM3V05BZtPtyKyyrnxOTluUcSA2OOsGrN1PgCRLzuic/H3Pq55h7/AZ3?=
 =?us-ascii?Q?SOwCXuU0sOEw9j8mcpW+YbS6M0/Fyif0oqWizDoYAQ7zNQafbKrN2KHbMOfz?=
 =?us-ascii?Q?b5JeKyqASrLagUFFCNACqmg4Y0bxlgCHRdVFW9pAAqKCg7IW3S7Yz71LP6kx?=
 =?us-ascii?Q?YDrVYWrAtkreodoNSAIeDSapGUmlhza3dPXijVjmepMREJ0S3k5BoRhrvLQ/?=
 =?us-ascii?Q?sPLvpK1gBTkCqfsLnjZHmhQ2tUTVXvHZWZY25G7j0TXSepJZEzXGOo39lOIw?=
 =?us-ascii?Q?Oyfu+KiynHOaJHqiZ64q70TKau24mUvcZzL5DaprDSIF2/9UoBtlGjOGbQI4?=
 =?us-ascii?Q?mNOPvuWUAoNswV1XGcBO0zuoB+VRisszU8I9iQPa03TMcr2odWq9RPn6ytWM?=
 =?us-ascii?Q?GZ9LqHPw4j+KgnO2A4GeBLrDobBKhJ/rDMTvcmvNha3wzs6zFq5ZDmefFjFC?=
 =?us-ascii?Q?MbzPTzBnD/zY6+2cZ9DTbeOFF7l/u/m78VYYs6Cxaw/ZjcfarSTe+/I/r9II?=
 =?us-ascii?Q?VLtnik9vajOBnNXtvVwrHrbLZpvBdvnwCTckv9qAbbcMsTiFFPfaDkqKTf7f?=
 =?us-ascii?Q?phsDn+wBbT0OFgCF4Zei6YAIlmJD/vOXVPpdd8iVqhkBXZhfwavwVW/YXp0e?=
 =?us-ascii?Q?3kj3W8rd7EUw+HEI5+FAqAxJT4N4Cuegm3knwtxhfYWBxmnmGO6q+kTCj6Sn?=
 =?us-ascii?Q?AyhlzvyVFaoGWgR4lrVufWz2RrRFM6Ic3002CHjxSzKckjHRZW45a9RfrPdr?=
 =?us-ascii?Q?O/LCRBauQkREcYDpU1gmiASQDs14eWkr+IlqmJ2xE7RjvpX+hGOJ9wZGvC5Z?=
 =?us-ascii?Q?QqhJlQYfwh4xYh6Kj9uivPLTSdjLpQPiQ0YT5jMOUgLEc2tTAzxiY45OAwQ+?=
 =?us-ascii?Q?agGCXXvHfRWj0evmk6DHpWARpnx6/cQcQkDw4h4XN0q67rKlBwI0RS90FL4Z?=
 =?us-ascii?Q?y7al2nRq/qa4MrqLNTUxv4WH6+kc6owjHscy?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:52:05.6428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e3c9f0-552e-4446-0144-08ddc5f1847a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487
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

From: Yonatan Maman <Ymaman@Nvidia.com>

hmm_range_fault() by default triggered a page fault on device private
when HMM_PFN_REQ_FAULT flag was set. pages, migrating them to RAM. In some
cases, such as with RDMA devices, the migration overhead between the
device (e.g., GPU) and the CPU, and vice-versa, significantly degrades
performance. Thus, enabling Peer-to-Peer (P2P) DMA access for device
private page might be crucial for minimizing data transfer overhead.

Introduced an API to support P2P DMA for device private pages,includes:
 - Leveraging the struct pagemap_ops for P2P Page Callbacks. This callback
   involves mapping the page for P2P DMA and returning the corresponding
   PCI_P2P page.

 - Utilizing hmm_range_fault for initializing P2P DMA. The API
   also adds the HMM_PFN_REQ_TRY_P2P flag option for the
   hmm_range_fault caller to initialize P2P. If set, hmm_range_fault
   attempts initializing the P2P connection first, if the owner device
   supports P2P, using p2p_page. In case of failure or lack of support,
   hmm_range_fault will continue with the regular flow of migrating the
   page to RAM.

This change does not affect previous use-cases of hmm_range_fault,
because both the caller and the page owner must explicitly request and
support it to initialize P2P connection.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 include/linux/hmm.h      |  2 ++
 include/linux/memremap.h |  8 ++++++
 mm/hmm.c                 | 57 +++++++++++++++++++++++++++++++---------
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..988c98c0edcc 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -27,6 +27,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
  *                      to mark that page is already DMA mapped
+ * HMM_PFN_ALLOW_P2P - Allow returning PCI P2PDMA page
  *
  * On input:
  * 0                 - Return the current state of the page, do not fault it.
@@ -47,6 +48,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 4),
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
+	HMM_PFN_ALLOW_P2P = 1UL << (BITS_PER_LONG - 7),
 
 	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
 
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 4aa151914eab..79becc37df00 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -89,6 +89,14 @@ struct dev_pagemap_ops {
 	 */
 	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
 
+	/*
+	 * Used for private (un-addressable) device memory only. Return a
+	 * corresponding PFN for a page that can be mapped to device
+	 * (e.g using dma_map_page)
+	 */
+	int (*get_dma_pfn_for_device)(struct page *private_page,
+				      unsigned long *dma_pfn);
+
 	/*
 	 * Handle the memory failure happens on a range of pfns.  Notify the
 	 * processes who are using these pfns, and try to recover the data on
diff --git a/mm/hmm.c b/mm/hmm.c
index feac86196a65..089e522b346b 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -232,6 +232,49 @@ static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
 	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
+static bool hmm_handle_device_private(struct hmm_range *range,
+				      unsigned long pfn_req_flags,
+				      swp_entry_t entry,
+				      unsigned long *hmm_pfn)
+{
+	struct page *page = pfn_swap_entry_to_page(entry);
+	struct dev_pagemap *pgmap = page_pgmap(page);
+	int ret;
+
+	pfn_req_flags &= range->pfn_flags_mask;
+	pfn_req_flags |= range->default_flags;
+
+	/*
+	 * Don't fault in device private pages owned by the caller,
+	 * just report the PFN.
+	 */
+	if (pgmap->owner == range->dev_private_owner) {
+		*hmm_pfn = swp_offset_pfn(entry);
+		goto found;
+	}
+
+	/*
+	 * P2P for supported pages, and according to caller request
+	 * translate the private page to the match P2P page if it fails
+	 * continue with the regular flow
+	 */
+	if (pfn_req_flags & HMM_PFN_ALLOW_P2P &&
+	    pgmap->ops->get_dma_pfn_for_device) {
+		ret = pgmap->ops->get_dma_pfn_for_device(page, hmm_pfn);
+		if (!ret)
+			goto found;
+
+	}
+
+	return false;
+
+found:
+	*hmm_pfn |= HMM_PFN_VALID;
+	if (is_writable_device_private_entry(entry))
+		*hmm_pfn |= HMM_PFN_WRITE;
+	return true;
+}
+
 static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
 			      unsigned long *hmm_pfn)
@@ -255,19 +298,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (!pte_present(pte)) {
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
-		/*
-		 * Don't fault in device private pages owned by the caller,
-		 * just report the PFN.
-		 */
 		if (is_device_private_entry(entry) &&
-		    page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
-		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
-			if (is_writable_device_private_entry(entry))
-				cpu_flags |= HMM_PFN_WRITE;
-			new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
-			goto out;
-		}
+		    hmm_handle_device_private(range, pfn_req_flags, entry, hmm_pfn))
+			return 0;
 
 		required_fault =
 			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
-- 
2.34.1

