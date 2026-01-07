Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21CCFCCD8
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8702910E581;
	Wed,  7 Jan 2026 09:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f8raeWxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012054.outbound.protection.outlook.com
 [40.107.200.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79A810E576;
 Wed,  7 Jan 2026 09:19:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh5fZN4B/ZvZWxctxSR9lOaCGdaekf5n1I+h1R3FJ1/e5WeVY22o2m8ytaqhpXBcmfhgwUlnekfLw9PxMM1uPbZZogD90p8DibvliZBigeNRuUbwd7P3HX+Y/qYGnG4tBU0dEfviyL6qd7v3KIQ0tK9G4anzqGLm0XMHjiWT+MsSFgKcJcy/3WZoCbbM2SRRzGks0hB1d1z3HU/U/vNdjRZtTSnJhKq6kEsI0bAqw/Lh0YW/SiGZEx2m27jeIdT7OWboqxjHkc+O0/VohS2uRjetzDUY72KRbZ7NXiP4gqY8TxknwDNYkiPtQzNDpRuK1mza5a551IN7V4kxiV9gfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY1pGzhVJmWWFgyAMcfofUzjK4DzwQXkn1zo4epIkjM=;
 b=SM3l3EU9R8in/J3dvVBOj3msGuphicEcGs+EvpBT6BOu+3CqW1/XcD51NOVfNwoV24BwK3a1FnibmwTkmR+GRj/W7kwG6OAcSLWa0D/49fi0U6lPwegZHvnwvPabMBIQDc+TNTW/xQ2CJjy9frS81Yp3HEegHMey4XNWUTaMBIkj9Lkd+WSQHZQSOE/pKWLNH2WXa9C4WTvMTiJEQwwktYeBHiL+kyPSyVgDkpgNUC8kReew32rhc2qE68CxIfOnH3j3w9KyoK22dQ/FqWiRkEUQuZze/5y9twYdavgJnCOICZM1RgPFErdbs43+rjG6m0GXMyrPYraawFpwTSu0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY1pGzhVJmWWFgyAMcfofUzjK4DzwQXkn1zo4epIkjM=;
 b=f8raeWxheeLqJHbwaZyk8F1fGqku+OHAWYJbZZjblyex8ey/4x3U4kuJzXlaqZPYRKo1r0d+PznvGoVQlHcWz6Kd95i53dJB59ApElT5kQztdBUSOCFV0Tq5C4C8Z+PM12kxYXoIdTA+LXsnyQLdQEJdJzT4gZZEXnIE2azwSEtbRFIbxhgHogdTmrWOh6CupRo/fOtN+4gdV81Sq8ULnghh1gN0PqNJnpKkIiIllUxVmjwhz49peuCzAvvnLE7QH2tqacjTrajzEYld8q9j5aRfMO13yBUrEotwPuX+fLtQ0AdUcdhOiZFByifqqgb8V/CwyOYjIV5YvwUPFm1TeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:19:10 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:19:10 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: [PATCH v2 10/11] mm/hmm: Add flag to track device private pages
Date: Wed,  7 Jan 2026 20:18:22 +1100
Message-Id: <20260107091823.68974-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2983e305-5c6e-49bb-3994-08de4dcdd0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vDvVQBSp2/zHDHkJdwquavwCAd15grPABHWERSAZnXoGfBcvYhp75EtrprpV?=
 =?us-ascii?Q?aK+Cxhc6E4ZrVtz2pnOozhXOt6l5BSZZF4T+HkUydO5o0hCg4mDmkOlAau2s?=
 =?us-ascii?Q?Dw6WYvufyhVOnwQEBfbPq/pU9MfrG2DHrRgrxUzJX8OaDf3gT9GXQd9AQ+o3?=
 =?us-ascii?Q?CsMP0PivYq34sKk0pLL39h3foPITHf4DULKAuUF7RZfE20xLGKqdYVRYRQS1?=
 =?us-ascii?Q?qg1yeVT7TRBZOTmokhJBQwc3LrXOAnKT9pWbYywgIQwJtpXN2yDU3q5B6/hx?=
 =?us-ascii?Q?gDg+zTk86XgvT8k4dtQX8/NueYk8ct9SlGHTzVsMuRr8nOT2exTgGj1+xRYu?=
 =?us-ascii?Q?tsSzNSqBZovhNqS079ZlYUwMNeKt3ycFwypf2lN52w4bl+dkyorQqbbPCbdq?=
 =?us-ascii?Q?6l9hvnI4XYcvXcfXQ++kBbs2pYftucZXwXZKKGGqHZyIcuT8j1OUFBWY6Kdn?=
 =?us-ascii?Q?itILqCP+T5Cv92guhfdEFZufWH9itYruBxqaZos5WaiZTvXYN9n+Gb/GdoRH?=
 =?us-ascii?Q?Yir39nL0M9Q/Wy3JZUqAbVFOlYY14rvh2muZIC21pul7PMsqSI9ENiS2OCKF?=
 =?us-ascii?Q?0hgTfiL9L8ARXtLTXCAzlq6Wwa01IUevvkyS7iQb5YTxgPBiIUu2+g/1N4Yq?=
 =?us-ascii?Q?FnG3aaT2dQh4OedrLIuHjtQXgqF3y4wPuGpIHLC8S1l2fRELq82i/saByQoh?=
 =?us-ascii?Q?K8C/wlvSplLXA6Pd3r+c+339IWWT6EJ49O39Xao0KOzUpRcq3nfZ8CkidQrx?=
 =?us-ascii?Q?I/SOyirKmoJNYfKLWsqPahlU1dYPQGn4Bf19zpKWEXjK13GP2tmaCgbWsxmv?=
 =?us-ascii?Q?1h5+SaxbpjmMpqg+/jIo9PhDPSbECBEFkU3LjStHE6jxEh4coXL/0AWljcil?=
 =?us-ascii?Q?XAFcI9Vn3MM13TleMG639kw+A4Oh7qlum5Azw81V2CeDBEZpa5BejErIKn0a?=
 =?us-ascii?Q?uA5fHM1mramwnKQCJe2InOwiIp529DhrtRDnShP1TBdVoaL4DAv7etKpDM1g?=
 =?us-ascii?Q?QD5+0E7bTjstp2/SVTeYrC1kp08kqzRF4gv0ut53Or8+c1I96fnN/SpSwqYp?=
 =?us-ascii?Q?GVHh9gcZOkJr0BmYxonUpYsBKtJNqFxKXF2sRtK7MFmBrOmrMHQOH5tg6wJw?=
 =?us-ascii?Q?PJS3f2EazObEJbaI0WI1lr7UFJaK3cTD/ZPk4qRuJU+4cWNj8Y6o4XhXqzmA?=
 =?us-ascii?Q?a4OsFkbKBR7weoyy6OLUlo/wC4pEoWkq91Wd7T/kT7bA3ZGFxMeiSo3E4BjU?=
 =?us-ascii?Q?mGKYL3VthVvHrj7g6qQjJhnK9wPCPSeOVfW8VUkiwh+VMuk3dLS5O0vPp7/2?=
 =?us-ascii?Q?9Y09QfSzFBWWHlcTaopFNQTU+fw3rL9jujYvvLnWYLILdmxa59bE/HX9VBt0?=
 =?us-ascii?Q?1wBv9vcoqJW/cTzK9b2cdBtf9RAKodyaGFgsZYnt4+8Xk1B2PcocPNLSQT56?=
 =?us-ascii?Q?NQJuUo91Faroy9K0ESZ1bhQToLmsUwYx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8jvgwfg5ERRMOsj2q9r8ntv3txmXCJ20KNFaOX3Yf2WfyRiwFI8E63Si7Zc?=
 =?us-ascii?Q?0Kw5PWQNa2EL2cwtG2Lxrk3C8O8pHmy7vVnn7TE2jHQf9EShl4xjAjRpgouD?=
 =?us-ascii?Q?Ot5THyTdGUGY/xjQ5HSZPEEpdDTEuKZtcc9fqdSkPIlW2S6UGt/tsD7AAGU5?=
 =?us-ascii?Q?utCCaBdM4U38SzYxRRO6L+uUHF33+3AhILGYuFwmBAUnVOrIy6qrs1bBJttS?=
 =?us-ascii?Q?1Bs+yxWWTYU+1dSN7j/QoqOGUZp9NT/PNHJrG0/VX2P0rxDtQT0bA+O8teWE?=
 =?us-ascii?Q?cJI/dCLH4a8QZhw1wrlrQI4e3+d7dzOH21ULnAVSssQQwT75UbPkC/AU2/AS?=
 =?us-ascii?Q?2U0rbO3gi8jIPjybOR2+TosbS0mdATf+ILy7ULVKhyYGFYPNlQvL3SCOS+Ca?=
 =?us-ascii?Q?MRLbGFKpMMeQTLmvuQPEgdo1hlfaEq8YcO+ROczlzvXIClSldzy5h3oTfGlv?=
 =?us-ascii?Q?WNq615h2c6/edWUaZ7dRFv6dKawyt7NsabphftyUMqUteHJKrMkbVGygWgG/?=
 =?us-ascii?Q?HZC442JFcZzc43V0QHQQR8kqRsMllb0bY3tztXOj46U6gZAzxbmKE/37Pejp?=
 =?us-ascii?Q?isQA9gU3XOAik3pO2uguPK9MqEcBDgj7OcYCJPjs3mnfzV3B/dKjzJNuK84q?=
 =?us-ascii?Q?hgXuD6yuS59bKNUZNKPPKvZbNqSsnhG7Nsp24mW69ZpDEB6Dbhq4l5KeRRVh?=
 =?us-ascii?Q?m7HHpuGz86Ng5mQbg1Pqr9aJ1pY5UfkhCV6qNVbid9/hsIlrpgTtRPtYKnua?=
 =?us-ascii?Q?0gDM9puhnE12l9tbc5p4KZYvvUXz6Xx1MmjcsslYmS7r99y1Jh5yejHQix/+?=
 =?us-ascii?Q?b8unWyC5UFQLB3G9hAn9RxV33iF0tctZMexaDHzMMPS9zBM1RbZCor4q4DoN?=
 =?us-ascii?Q?WqLT0HQZLK5Y9E7J8touTeD1VuR8pR97auq717NN0RaZxYcKXecZwsMUZ4Bn?=
 =?us-ascii?Q?X0VmELIusqkvgX+SLnJF21k70SbgLr4U6GmECBGuIa+mIbEADLIbkQl1woz5?=
 =?us-ascii?Q?kKhfoFzNRkWkO5m4G1zKpbw0MzOLwT6Bae7kMedgXPy33YesmZ4EHni1y+aQ?=
 =?us-ascii?Q?viufPEvB0XzyjlACf1xqrMVkym16CWvZ+S6WqELtU38w2rSR0iOo2XFquie2?=
 =?us-ascii?Q?VAXNlrhUAs40qG8Djr6u1tGPy1wQfS9+5ps1+QsodqUxfIsKQzALgaECWJMq?=
 =?us-ascii?Q?dB1+F0WUCeTFIrTQZbmZ4IoAZvrxO6wToUnfuw79WkTQ0Fj7/Eo2cW0K5HHL?=
 =?us-ascii?Q?ke74lKVpeND4A449C39ZEpbuTKLVRBQUFaoGpy1O1F1N2GwglMtz2ilWbXYQ?=
 =?us-ascii?Q?sxtHhE8XVcveMRz05FyPZK2m7P0MKsZ1tORo1sBxS5NPDY88i3/Y2kONLnHj?=
 =?us-ascii?Q?9lVI7TXcK1xXF038J7uM4Xrpm+5SN5YAcRStmFNZFBojcnUuwbdyy+bM4Y9i?=
 =?us-ascii?Q?ZAcLCZ7QX+BzVv94v3oXxUg9DXzkAkKDHxPVg7tYLPlCwdxHux/sZHnuGt7Z?=
 =?us-ascii?Q?cW9DbzUaORwgrRXe/0cS83qdugUNCrmaJNadBjKfaFLEN6327SBRpyqdapuz?=
 =?us-ascii?Q?woKXLYVnjH2ZIXG4CQnS4H/nZBygKTxngoEY88mQrYYPqgBmWhY/c0kf1MBz?=
 =?us-ascii?Q?LFhcUdzwCkt6/b+E3zAqRpSnS+hpsMWD7vXXc8fp7SJ+rMsqUZcvM2XaOz/x?=
 =?us-ascii?Q?LfovwBQa0MxDOCksOG5UVnO97R7+FgDpJwcd0BmKTVWJVXBSoeEvrvu6kpAX?=
 =?us-ascii?Q?4+tz90c6ZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2983e305-5c6e-49bb-3994-08de4dcdd0ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:19:10.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/1NsIoK6Fi3d/0veucu3cC2ObCdOFtNMPMljg8s1otN/jmwGL5+UR5tds2Ix5TZJWmXmUXbXi745hSTGIdWxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
that a hmm_pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
  - Update HMM_PFN_ORDER_SHIFT
  - Handle hmm_vma_handle_absent_pmd()
v2:
  - No change
---
 include/linux/hmm.h | 4 +++-
 mm/hmm.c            | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..d8756c341620 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
  * HMM_PFN_P2PDMA - P2P page
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
@@ -40,6 +41,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
 	/*
 	 * Sticky flags, carried from input to output,
 	 * don't forget to update HMM_PFN_INOUT_FLAGS
@@ -48,7 +50,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 12),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..14895fa6575f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -267,7 +267,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
+			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
 			if (softleaf_is_device_private_write(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
@@ -347,7 +347,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    softleaf_to_folio(entry)->pgmap->owner ==
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
-			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT) |
+			HMM_PFN_DEVICE_PRIVATE;
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-- 
2.34.1

