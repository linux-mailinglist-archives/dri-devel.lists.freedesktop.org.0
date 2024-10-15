Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B499F7AC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C492B10E5F5;
	Tue, 15 Oct 2024 20:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TeMzfZgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667C110E5A4;
 Tue, 15 Oct 2024 15:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOIa4n2GeEtQdQ5mIrObPHNq2tbUyQH0yoRmpptZnFJqba4Lg563lSBhCaM067gFS3dS2mOCWCjJfgsagyXK9Fe3DXntcJQC56t0SzQLSwHx3PaCJmxNj5lwKca7KvHOW+/7t+nYPLUkjjlBp6LDetrKq6KJIZdjfU/P4Tk8KdJsay06aZlxBWTUwq5su6vm7dlyUk2OdAYaoffrDZQWXX0SHFgp6sZjMFQVYg66SsWyoPcM3dJWs61Sz1JX14ThxhwkZ8jVl4CLY7Cm5eIR3yndR6nG5qQNYEItaagbXGfXn4j8GTWm5fR1FWt0dPdo/6ZSf/G+OmiiixbgDQhhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWcn9NVt1hK7DI5Z8sasmo2JCUcg6jAxYQ0go1j3Uyk=;
 b=s/hUjmd3GWdOfX2YYvEHuOhin80QYC919HLnOyPbtqKHdEaXd9DPRZBLZDKEckfG02M/9GhzEp7Os/OcFdgQSU/ISFz4p76Qt/Ye4wOGJMxvcAc264M2+NlPwN0wvMWM/GvH2flKfltrtSCrVK7en8d4H09F3EpnsudQorgckr5vszit89oPBk6yszjiLe1gLuyvjrrxQkJ9AlFbTsAZrCuHJswWVci2w96PK3o72lBZfw2WwuI8sWH3G+0tkkNkm4GzszIFGEoOYwCfdAGK85O5SrVNB4mGq+7ty2tapoWUDEGitsANWazvgU9MsNgp6ysjJGFAgR0Eki5srDl/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWcn9NVt1hK7DI5Z8sasmo2JCUcg6jAxYQ0go1j3Uyk=;
 b=TeMzfZgGXRyEnUbvup3rg4dxNu88kGxtycFUWNDUnHWE0YoLMIdRoezFFfEhcch7toMybYecn87buCZtIXR3gyXf2XRltjTIkMaSNETTbkLXuJDaJnxzNuiw6wmJjvNFMA1AEWOq3tN9T0TdVccNzR6EHzUp2qg/G95jwQqgaAYjx/NCRRod6OGhlUrwa8NlT+Eu99nc27LPTJxq7WmYjCATJx/weMsVoXBEA4y7RvZwYiVZwOH51d9iJFNtHf58BUC4L97WrQDzKw0FdFtmuQP5IxderL0Ei5RgTWIi5T7I9RAf1RbYTbQU8NdDsywY2LRIOhphPYKQVjr8E39XVg==
Received: from SJ0PR03CA0135.namprd03.prod.outlook.com (2603:10b6:a03:33c::20)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 15 Oct
 2024 15:24:15 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::60) by SJ0PR03CA0135.outlook.office365.com
 (2603:10b6:a03:33c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Tue, 15 Oct 2024 15:24:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 15:24:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Oct
 2024 08:24:04 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 15 Oct 2024 08:24:03 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 15 Oct 2024 08:23:59 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>, <herbst@redhat.com>,
 <lyude@redhat.com>, <dakr@redhat.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>, <jglisse@redhat.com>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <bskeggs@nvidia.com>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Date: Tue, 15 Oct 2024 18:23:45 +0300
Message-ID: <20241015152348.3055360-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015152348.3055360-1-ymaman@nvidia.com>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c904050-d6f0-4e81-1d1c-08dced2d6daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DfnJDOvTskSHOrWolZIi/Fe9XUtlZpVqH6rLAkZNFCSfnSOYyTNOUgx+XtrI?=
 =?us-ascii?Q?SmwUY89Gc+zL21Vh7T3xjcR3ChSlJmAsg4zOKB02SEA77WSbtmw//RKQWyH8?=
 =?us-ascii?Q?srpPFT3op2aJdwEEs2G4Ifs/VLnWDaSdACMsZMFOqtP50pPdQBy0r5BwdyrI?=
 =?us-ascii?Q?t8VgOxyIag1VGiJPg+K6MiVKJAr70mErbkIjIZcEpNi/nPboO/yuxIizy/rF?=
 =?us-ascii?Q?iDXAJXaF4silKSn7ApovMzRo5lZoYuZIKAkWLPMU6fB9owzP2wKs7QvSww2W?=
 =?us-ascii?Q?CVvZBXD9n9l+NdLxUgWf5LNuPg/iVD4vwnyrVauJm1ayMlVI+v4c3Lod6vhG?=
 =?us-ascii?Q?vi8vapM1cX+rodzD1WohhaPJ+t81xqj/9OJp6N7fvzVBd+hx+c+p4Mnaqy+y?=
 =?us-ascii?Q?hEsNRI7LXkS7xWnbt0H1lV9Je2nkUA/dhrYFZ8FxJ0eSPKWl9WiAo7VEUow+?=
 =?us-ascii?Q?05Sc7F5t4pC+janrlXDs7KCe14PuJyiRUCyYGizKN04K1XDSk6zfujiAKdX0?=
 =?us-ascii?Q?4Gq+xKhyzjAiMc1SyMtCsyNdsus17NqC6sWV1XeknlVOSybhZx4IGlZWaR1I?=
 =?us-ascii?Q?lIW6qNVRYdgOcCX8sgNGmqEF2fzyGnfO26RwzAWP1gi/KD9PopE+9aFR4Ftr?=
 =?us-ascii?Q?h1sfCKegC4PX09km0G8KQ1of5ELn1N4c08MgAk0zUCEkjFDnYzf4jmuK9WZC?=
 =?us-ascii?Q?3DLLresibMLu3xZVBcwcvhxDDI/H/qMBUjsUxLt4BkgXjgUPI7CnX+cuKpTP?=
 =?us-ascii?Q?UK7Ym7hzXqvFSr+5+nf1VJ60SG2cvTSIHOp746IPt/CywM8v5Q8z935cSBls?=
 =?us-ascii?Q?To03yNdQkQgpQxlpDu6EdKUzvj0TFnU+nlaDBhV1sdFCYPkcH44opP7b49q/?=
 =?us-ascii?Q?O1Zn8uAjCAmLnNiPhWVaWsGy7X97cNXMLrV6B5Lzdv0T8bF9N3Tx9n5w2g16?=
 =?us-ascii?Q?aBlJRJP7vWWuDsJBa955lq6hm8hRKLgfsAoICFiFA+fztx/L+ACuAAe00UZU?=
 =?us-ascii?Q?vee1yNk1SMbhzNLom8Qvl9Q0sE1SwDMz7Gn9eJ8PPN6jSkfss5RrWw0c5kBm?=
 =?us-ascii?Q?Rru6RISKCBw7P37ond3gLSXlJX7wSRlUu8X8+yaIaoaRiOgV8a0Lqy8b3rJq?=
 =?us-ascii?Q?w4cyHcjFeCfk6r6aAwhGhFBkNVVY0Vqv/DfRipK1YWNoIAiXc0z/d7unK0Xm?=
 =?us-ascii?Q?TLhrGq7+0CJdl1FGrLTI4hEYAJbMw+Dqa9Q+3cLL/uIWDcqb0w6+xArwMVZ+?=
 =?us-ascii?Q?Z0l28ANL0k4HdOjgW6MILiaUeYCt/u3R2wSP690X9yVeBqVmI3T4LpIGWQoZ?=
 =?us-ascii?Q?07HN3nA0T9stDf1FaY++67Ucb4BK6fpmms9HSb07yC2R3ZlGt10pISSXgjob?=
 =?us-ascii?Q?JLhn8ZwrGntjAVuK3VybTKNWWFbn?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 15:24:14.9115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c904050-d6f0-4e81-1d1c-08dced2d6daf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
X-Mailman-Approved-At: Tue, 15 Oct 2024 20:00:36 +0000
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

hmm_range_fault() natively triggers a page fault on device private
pages, migrating them to RAM. In some cases, such as with RDMA devices,
the migration overhead between the device (e.g., GPU) and the CPU, and
vice-versa, significantly damages performance. Thus, enabling Peer-to-
Peer (P2P) DMA access for device private page might be crucial for
minimizing data transfer overhead.

This change introduces an API to support P2P connections for device
private pages by implementing the following:

 - Leveraging the struct pagemap_ops for P2P Page Callbacks. This
   callback involves mapping the page to MMIO and returning the
   corresponding PCI_P2P page.

 - Utilizing hmm_range_fault for Initializing P2P Connections. The API
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
Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
---
 include/linux/hmm.h      |  2 ++
 include/linux/memremap.h |  7 +++++++
 mm/hmm.c                 | 28 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 126a36571667..7154f5ed73a1 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -41,6 +41,8 @@ enum hmm_pfn_flags {
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
 	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
+	/* allow returning PCI P2PDMA pages */
+	HMM_PFN_REQ_ALLOW_P2P = 1,
 
 	HMM_PFN_FLAGS = 0xFFUL << HMM_PFN_ORDER_SHIFT,
 };
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 3f7143ade32c..0ecfd3d191fa 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -89,6 +89,13 @@ struct dev_pagemap_ops {
 	 */
 	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
 
+	/*
+	 * Used for private (un-addressable) device memory only. Return a
+	 * corresponding struct page, that can be mapped to device
+	 * (e.g using dma_map_page)
+	 */
+	struct page *(*get_dma_page_for_device)(struct page *private_page);
+
 	/*
 	 * Handle the memory failure happens on a range of pfns.  Notify the
 	 * processes who are using these pfns, and try to recover the data on
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..987dd143d697 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -230,6 +230,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	unsigned long cpu_flags;
 	pte_t pte = ptep_get(ptep);
 	uint64_t pfn_req_flags = *hmm_pfn;
+	struct page *(*get_dma_page_handler)(struct page *private_page);
+	struct page *dma_page;
 
 	if (pte_none_mostly(pte)) {
 		required_fault =
@@ -257,6 +259,32 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			return 0;
 		}
 
+		/*
+		 * P2P for supported pages, and according to caller request
+		 * translate the private page to the match P2P page if it fails
+		 * continue with the regular flow
+		 */
+		if (is_device_private_entry(entry)) {
+			get_dma_page_handler =
+				pfn_swap_entry_to_page(entry)
+					->pgmap->ops->get_dma_page_for_device;
+			if ((hmm_vma_walk->range->default_flags &
+			    HMM_PFN_REQ_ALLOW_P2P) &&
+			    get_dma_page_handler) {
+				dma_page = get_dma_page_handler(
+					pfn_swap_entry_to_page(entry));
+				if (!IS_ERR(dma_page)) {
+					cpu_flags = HMM_PFN_VALID;
+					if (is_writable_device_private_entry(
+						    entry))
+						cpu_flags |= HMM_PFN_WRITE;
+					*hmm_pfn = page_to_pfn(dma_page) |
+						   cpu_flags;
+					return 0;
+				}
+			}
+		}
+
 		required_fault =
 			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
 		if (!required_fault) {
-- 
2.34.1

