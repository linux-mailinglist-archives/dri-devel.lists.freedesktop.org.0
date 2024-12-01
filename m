Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D99DF532
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2993910E3DB;
	Sun,  1 Dec 2024 10:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N7SiPhOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13010E1C7;
 Sun,  1 Dec 2024 10:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRMVJP0/YpmwIaGnF+JgB354+0zk8ywhrDB+Xn6HDZ6q7v8hGPr0WIssnOB1Z5DGqVMeRVOjetsyPHxybQuEkuHpEtiT5SoRcMW/H8qMUAdKJfszdGahWJ94sNzV051NY+B5PSzg3Uj8yP3oEQoyc/BD2t03PKsNdCsjE1VYPqAhpXUvDeVryE+7n7oWDWCf3+9x5OMc/rss/EvsPZ6wLWIzOJlYCztJFnNSyJmjKqaaUaz4ta9HjqEL3no5juKcYyHtHkhNzVZRN+ATfA0TOvIguf5sx9N4ir/e9Fs4Zv+8LVuKy/DKsJ3PJn0zy+v6VVM+FubYYWltCRX8CSAWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMhDRgrewIAka6a+gUfJ5hQiGVZI7odoh414sahOfLM=;
 b=Hnr/bRUMhZ0peeRG4FiFOpR64wpkmHNFkcdRg+B07M9l/H5Gm4KTZuVyma6EQQqhwRIblyVOjgefTTVPaUXBYWBgLB4SXEadQeN1pwKBiC8dEtKvpjxkRs/Os6V9ejz4YXvkHuzvKc1Ob9CMFtjKxDtT2N5oqwkVPkZl3u2h0d1pjJljiX23qOFIP9zLJ07qwW2Ql+LBFbEy9ybafUWJ7/SFWY3lAC1CHoLjlKFeO4LPShEeDGmf8BeRK2SLy/0X9oN/u2TVYrh7CN5YD4cCLd/cVl+0/lKr5ciIP/0uJWtj9MgvS7oQHUCcu9JGkzpVHVXTfikW/b6mWLE2Nih63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMhDRgrewIAka6a+gUfJ5hQiGVZI7odoh414sahOfLM=;
 b=N7SiPhOqMSEBmhkK/bSx+PA+x7Ldm3VhimuGgJrp7LsRlIOp+2yTFEhlHgRj/jPjz9RvbMDgH4JI2joclw6QSpAOn/RZT37NlSaPI7ZOHKbIZqKXk6T33HAHirjOBqgWkU0FtHG7orXznNYhiGX9EBrXbS6TM/e464Q4VUCtXDNo3LLu8EUH78UxKHkUj/BBkvnNDdelsHzgRZi6ZFqvqeaWsG6IQmxO9uSEd6hmMBfX3X6RUempFtMVkrWvAmxUBjxVCu5iIDYV9eB4dF0Zpj2rHszO/VIOF8Snl6FAeI0MZ7lQbbQSX7ExYBCdfriCwr3/Or93JIZpPeKyu7APMQ==
Received: from CH0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:610:e5::7)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Sun, 1 Dec
 2024 10:38:02 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::9d) by CH0PR03CA0242.outlook.office365.com
 (2603:10b6:610:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Sun,
 1 Dec 2024 10:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Sun, 1 Dec 2024 10:38:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 1 Dec 2024
 02:37:53 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 1 Dec 2024 02:37:52 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 1 Dec 2024 02:37:48 -0800
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>,
 <jglisse@redhat.com>, <akpm@linux-foundation.org>, <Ymaman@Nvidia.com>,
 <GalShalom@Nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-tegra@vger.kernel.org>
Subject: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private pages
Date: Sun, 1 Dec 2024 12:36:55 +0200
Message-ID: <20241201103659.420677-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241201103659.420677-1-ymaman@nvidia.com>
References: <20241201103659.420677-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd84002-9361-4640-34df-08dd11f43b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bG86dYyH+RIyb6NlGzVA1kni4MXz4cBhWM7ilkAVWA0DRuub6Pi9LF8iS8o1?=
 =?us-ascii?Q?rzusBU0YBecO6ODgVrJufP1urSoamG6EuPOvelC18LOwBmfflcK93sPr+vOT?=
 =?us-ascii?Q?Fc9/Y/YHUKfYjf3MR74Ip1r/e+ecGkOR5ys65gCVinkHpSWn5pr379stLqB3?=
 =?us-ascii?Q?rbY30BpXv20/JVzAqNK1ZOi70UZ/wn+DUvmQe2W55TaKBdvsRervjq6+ltAC?=
 =?us-ascii?Q?cEze5xk+ZMesxdV8BJkau6P9aibit60LeIGNCi2gdb7FIGIlaRMXvJo74V5X?=
 =?us-ascii?Q?KFliLDLUo1yWsk6HdSVumZqA7p69F6nYv7Ncb5ZFcv2NB/gRblAL6qA57JkS?=
 =?us-ascii?Q?mreMFiI0BMaSw0ms/F8x0rMymisGTU1qOPsB2DwN58N/LA6gjVgXFF7wsioz?=
 =?us-ascii?Q?NFRClHVLOuMg9H1sNhR2t08Egv7I6FpcjHiHWYpMeDoW6OZxbgske+wAxppI?=
 =?us-ascii?Q?djWpgMaiIAGTmOPf1hYVq9JHK8ETAxWSfl2MayXa54qXi5NTycy+Rk9ZwMs/?=
 =?us-ascii?Q?ZKc5cJ/w/GHANOIIDvzf4rIaKzUBukJ/H61Z79yjlszq3qfemm3bFQE3t6az?=
 =?us-ascii?Q?T046Tc7b54uMC+fCtOTr8Cx+kLcTuu4a+80nzXFwwHkylShSWVuILhaELNHd?=
 =?us-ascii?Q?z5ThNtNaA+UumhOgVyGeq1APw+v17o2fRpzwwts3dGOPcyJPbuUXiWJuX6VG?=
 =?us-ascii?Q?MyHnZTZ//yp8CRuMv9EwlGsc5hhpqohLuQJPT/Ywc/IUTWjbiVeH1GghKZhe?=
 =?us-ascii?Q?C5V8ncmyr164x8jch5c0keQxop9nZHC/4tUW/eEkXWw2QoAT1LroTim2zHh6?=
 =?us-ascii?Q?VW17RJBLArNOJUNtExT+m0zhk25pYKmhitTDJLbhouXyfwWMWVXkNLpr0J1Z?=
 =?us-ascii?Q?KdW69FnioQt8kv/+m4lPhBEdCZqe81wtsmEQMp3hUJBTt0+rFbATek7vrb/v?=
 =?us-ascii?Q?BQfuZ2a2EZzbbnPFxkEpUX/+pIjUtEd9cEOPVG3ErrGkLHzbQoQgci9bN4kM?=
 =?us-ascii?Q?7/Px47lKlX2VG/880boI5rVdCGjveNZoj+87bBRIFywZFZGgOPrDgcjn1OnT?=
 =?us-ascii?Q?jQmgS34TTBt4UwE1zJr6WQgA9tVkKQkdAr1y+xzADwVQRboY98/qL/+Kmo3w?=
 =?us-ascii?Q?0My5RLn5jA4Cx3wUsu0Pa1BtAQ67ahkwlNz8P5BQrIVHm/4zVR69PkNu53ly?=
 =?us-ascii?Q?4xU3Y4TajhOtpuZDP51rLnujBiQORclU+6VXT935XUM0bhx8ZH/VTnW7P2ez?=
 =?us-ascii?Q?l7uJFmC67FcfbZM8B8Q7RUBTIIDDTc/a/7GxfE7PywvCkJrvT9lLsq1mfoWQ?=
 =?us-ascii?Q?cg14irf9ECft+snHqGh+XvhZu98wnLHVvrgX1d/t2DYQ6RMNl4f5HYhdjGYM?=
 =?us-ascii?Q?Ln4mVRCANLYBjpD6JV6zbRlUiM7/7aJxzETTVXCVPbBkA03yA4nQ8SMfCN/1?=
 =?us-ascii?Q?xyMyjK7NsvW02NO9ZPL/NmtoUfZPXItgnB86CGeW4GE0crn8fxgXxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2024 10:38:01.9770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd84002-9361-4640-34df-08dd11f43b4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
 include/linux/hmm.h      |  3 ++-
 include/linux/memremap.h |  8 ++++++
 mm/hmm.c                 | 57 +++++++++++++++++++++++++++++++++-------
 3 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 62980ca8f3c5..017f22cef893 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -26,6 +26,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
  *                      to mark that page is already DMA mapped
+ * HMM_PFN_ALLOW_P2P - Allow returning PCI P2PDMA page
  *
  * On input:
  * 0                 - Return the current state of the page, do not fault it.
@@ -41,7 +42,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
 
 	/* Sticky flag, carried from Input to Output */
+	HMM_PFN_ALLOW_P2P = 1UL << (BITS_PER_LONG - 6),
 	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 7),
 
 	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 8),
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 3f7143ade32c..cdf5189be5e9 100644
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
index a852d8337c73..1c080bc00ee8 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -226,6 +226,51 @@ static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
 	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
+static bool hmm_handle_device_private(struct hmm_range *range,
+				      unsigned long pfn_req_flags,
+				      swp_entry_t entry,
+				      unsigned long *hmm_pfn)
+{
+	struct page *page = pfn_swap_entry_to_page(entry);
+	struct dev_pagemap *pgmap = page->pgmap;
+	int ret;

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
+		if (!ret) {
+			*hmm_pfn |= HMM_PFN_ALLOW_P2P;
+			goto found;
+		}
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
@@ -249,17 +294,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (!pte_present(pte)) {
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
-		/*
-		 * Don't fault in device private pages owned by the caller,
-		 * just report the PFN.
-		 */
 		if (is_device_private_entry(entry) &&
-		    pfn_swap_entry_to_page(entry)->pgmap->owner ==
-		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
-			if (is_writable_device_private_entry(entry))
-				cpu_flags |= HMM_PFN_WRITE;
-			*hmm_pfn = (*hmm_pfn & HMM_PFN_DMA_MAPPED) | swp_offset_pfn(entry) | cpu_flags;
+		    hmm_handle_device_private(range, pfn_req_flags, entry, hmm_pfn)) {
+			*hmm_pfn = *hmm_pfn & HMM_PFN_DMA_MAPPED;
 			return 0;
 		}
 
-- 
2.34.1

