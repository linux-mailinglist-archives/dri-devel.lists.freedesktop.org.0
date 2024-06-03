Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC478FA58D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 00:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E50810E3E6;
	Mon,  3 Jun 2024 22:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=oppo.com header.i=@oppo.com header.b="Q/DFzWx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DDF10E362
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 11:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReHEXSbxPFaj32VjD0sHxhn8+d/MfQniPC1YN6ycckO/K/OEiWTb4ulgRLGx6InKHs7Df9m1CpCzrr6fwpamT6qndDKEsST5jj8M8mYQzvZlfgSrxS3nTM2h+urmwUDujOwnFs575Mx4FEtWwJIbfjITO08QFEDY/9qP99/po+ZUScJlqHQ6PvfWgnP9L8F3O/FQx8+lvo8hATcnAHmbPuE5G7tHPlGMUc63B4Y5coHTmiwA2XaFrTnMwlqNQWHflf6aTbFek+6GxaQkqbU+TF9U9wx9vTp5YNxIJ6q9GVrodZwUOjaO79/ABt+j+WAFj6ecRAMI2o84N850CF5Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoIM7lC3W2CmzRv5ldHqXT4NLmee7//rWVqgOuxoapU=;
 b=Jn15r9SryYqAxsdKhMpvALdBExiIthl5c33WVxb1sPy1iESS04xLXbtZO1KWXgk4XDlffdMY28jomNx/Lv4f9ji468zGQl6yMAiOM+46mTD8kVEz+nbcGY+82t4cD02EEJtj3ZyzFuNpTbcVKHz9sVYK5x3IbTsecarccnygVTCgnBl55tyWbSWdrl5iL+iLQzk62oMbKsFPvzD2Ulwsekdhm71PcLvnMnISW1gvIwnBLLlSOerM0lfwLOybLezJpWKewrFmqfxfvr9jfrXYAHm5mXFapY/Mxphpt0EhWj0jO7PJhteYfCgUilbcJrrXgboTyJ2ru/jclq9OS/f7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=linaro.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoIM7lC3W2CmzRv5ldHqXT4NLmee7//rWVqgOuxoapU=;
 b=Q/DFzWx5bafjt7/E5pgCq7hcJYc0Dy/FvJe2pjgmDvQzqPkMyJ9Pm3Il9K3RNuHejcR4bUsfO0VyqKT54T6aUGEMWcQ6cq5i4WTTnlV2yMuYz0irHWlkor3g/7kGDTfcf8Fgw7dZiFJhB/LiwvzLCDq8mydg7WvgvFv6musvTgs=
Received: from SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) by TY0PR02MB6803.apcprd02.prod.outlook.com
 (2603:1096:405:b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Mon, 3 Jun
 2024 11:40:47 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:8f:cafe::60) by SG2PR01CA0134.outlook.office365.com
 (2603:1096:4:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Mon, 3 Jun 2024 11:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 11:40:46 +0000
Received: from PH80250894.adc.com (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Jun
 2024 19:40:46 +0800
From: <hailong.liu@oppo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <21cnbao@gmail.com>, Hailong.Liu <hailong.liu@oppo.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1] dma-buf: heaps: move the verification of heap_flags to
 the corresponding heap
Date: Mon, 3 Jun 2024 19:40:05 +0800
Message-ID: <20240603114008.16235-1-hailong.liu@oppo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TY0PR02MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 586d08e1-1f6f-4a70-f977-08dc83c2029d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|1800799015|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWdWdVYrMU5iTUswc2RHbmJxd2pWR3ZlUGdrZWZMMHFuVVBudUNCSWlyWUt0?=
 =?utf-8?B?bXk2QXdseFFLclZGMnlVZ3BQM1kxMXhMZ1VCN3VRVTJUeDlDakt1VXZQbWJj?=
 =?utf-8?B?aitnbVNwOFFra0pUUm10TmpwcWllNDRoYUlYcEpkMnVVUXM5SFBOdWh4cTAr?=
 =?utf-8?B?UkYySXllbmRWNEV0d0xsV0xRWDBaQzVKeTgxNThTZm9ZYWhtNFlxby9yZzA5?=
 =?utf-8?B?Z0N2VjdBS0RqL3ZPczdGczcvL2h5d0NMZTY1Nkw2T1BtcEt2bUNVMks4VmVz?=
 =?utf-8?B?LzEwSFJWcEZNZ0NTb2ZqS0o4OHdzWjJvdEF0V2tDMjh5T1hLQ29seFZsYUJa?=
 =?utf-8?B?U2szNm5yTkI2WDBKVW9LYmZKK2t3aW1Gb3ZiaGw2SWxXazdnUEFRaitQWEYv?=
 =?utf-8?B?YVBCYUVrT3dGQXdxaTRBK3pZaDlmZTFENGZrWUg3Z2RzNEMrOGFwRCthVG04?=
 =?utf-8?B?SEpVZEJJN2Q1RXhOOUhBL1VtcFduTzJ3aUJtc084ckx5R094TEdDTWpRbGVH?=
 =?utf-8?B?cXpDRHdqQ2o2WEtYZGRwU2pFREpRaWd5SlU2WTdmVDY0TUpGQ3pTaEVSYXBU?=
 =?utf-8?B?UDR2K1VaZ2htOTVoWXRJUlZPam1Bc2MyMnJvRWkvZ1IxL0t1cWFDTmpiMG5j?=
 =?utf-8?B?dURza0k4U3FPd2FSUzIzYUp2VDdram55YTIwVStRcDAwOE53MkVlQlp2aUl1?=
 =?utf-8?B?NDVoZjdQYzFGN2ZidHBKOWFsUU9pcXlKTCtNTEE1OThFUVcvd3NiZkZnUWpW?=
 =?utf-8?B?S2JCY216RkExcStTUzlqY3czQnpQRXRFR1NtRVJIeHYrSll0RU4xb1JjRWo3?=
 =?utf-8?B?OFFuRlRqUUFPVWZvVEoyZkJnemxRU2ppa2Y0OTNndHdBUjl6SGtWTkFGaEhp?=
 =?utf-8?B?dWQyNXZiellYdzBkWUtiOGloaUtmUG93U2xNUWc1MkNhVFdOZVVyMExCN1d6?=
 =?utf-8?B?V1FkNUxpZm1heHp4ZXRESHZtSyttbEd4VVo1TWVLQ3V0ekZybFBPaHY3dnlZ?=
 =?utf-8?B?YUI3MlBlVmYxMGREYUFxbDh1SmNKMjlvNUtzWC9RY3dhUDd3RXNLTEtDY3pk?=
 =?utf-8?B?blBnVzh2NVBoVUpGdkdaUUNFZ3JoaFZhRS9ONWRuakFJNStSMDl5ZklWR0Ez?=
 =?utf-8?B?U0VsWk4vRE5pNW4zZEFnV1pvcW1ZNFMzeXR3RWlaSEs0c0J4UWlpNnJvYnAr?=
 =?utf-8?B?OHZ1NXM3czhLUHJuWUJMUHIzc2hUYklHcnUweCtsY2RNZmxXcUQ5ZWhnWi8x?=
 =?utf-8?B?dklxSkRWVWhpVjFuMDdCdGhvSmhPTzRSQjArQUtxZUhGb3B4KzRMNUxvWnZT?=
 =?utf-8?B?d0JEbnFzRzludzZaZHBPMloxbDBxUXA5TmtYeTZpK0IxM21vQ3RJL0YxWVdH?=
 =?utf-8?B?NmN2K3N1SVA0RG5IdW03K3BQTWcwZUhyMGdBampvekZsTHVSYUNrUUlEcnpP?=
 =?utf-8?B?c2tEbG1ld1Z4dzBDNHNEMFdxZEVzQmRjSDlldnhzVmMvckljT0dERWwxb1B6?=
 =?utf-8?B?WGRuL2k2dXIrRGs5a1VQaHhKdUx3aGJKRTN0YUNrVGVyeWxiS3FFYWtibHk0?=
 =?utf-8?B?dEl4MlkydWxQK0ZKK2pvbHlzWnNtWll1NDRsa2R0VGF6a1p4YWhXSW8yTU90?=
 =?utf-8?B?ejlZSFNOemR5WmNkNFFkODN5aEFzMVVHU1pnMHlqSVRzbGtqbXRLaDMyVE9l?=
 =?utf-8?B?K2pRWm5Jc0pRZEFJcVdpSGxhNTBRNzlTb2xtL3BvL3dHTjFjaFJQQVc2M1NJ?=
 =?utf-8?B?VTBYMnZKY1RFZk51NklMRWdDRTh0L3RaVW40TDBqMWxoWnN3Q0I4OExzbjMw?=
 =?utf-8?B?L2J2RFVZamlpVGxEV1hQREZmcjcrdDN5ZTBNMUJCa0pUYmF1MHBPVnFqOWVv?=
 =?utf-8?Q?7zoKTe01c9Hr9?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:40:46.9475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586d08e1-1f6f-4a70-f977-08dc83c2029d
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6803
X-Mailman-Approved-At: Mon, 03 Jun 2024 22:31:24 +0000
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

From: "Hailong.Liu" <hailong.liu@oppo.com>

This help module use heap_flags to determine the type of dma-buf,
so that some mechanisms can be used to speed up allocation, such as
memory_pool, to optimize the allocation time of dma-buf.

Signed-off-by: Hailong.Liu <hailong.liu@oppo.com>
---
 drivers/dma-buf/dma-heap.c          | 3 ---
 drivers/dma-buf/heaps/cma_heap.c    | 3 +++
 drivers/dma-buf/heaps/system_heap.c | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..6c78ee6c7a58 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -105,9 +105,6 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
 		return -EINVAL;

-	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
-		return -EINVAL;
-
 	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
 				   heap_allocation->fd_flags,
 				   heap_allocation->heap_flags);
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..ae4fa974372b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -288,6 +288,9 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	int ret = -ENOMEM;
 	pgoff_t pg;

+	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
+		return ERR_PTR(-EINVAL);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9076d47ed2ef..80858719a819 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -347,6 +347,9 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;

+	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
+		return ERR_PTR(-EINVAL);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
---
In fact, there are many differences between the main Linux code and Android
code, I’m not sure if it’s appropriate to submit here.
--
2.34.1
