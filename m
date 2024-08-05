Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962E9473D1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20510E110;
	Mon,  5 Aug 2024 03:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bd8RT065";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A72B10E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh9v6vMeYK2CR15cTFqdTg6jP+TJdgyRAg4r912VgCyGa5Zv9NwFt6+XuZjPzOFtYn7Bq/BdMdjs4HxlAbHfPFCkIa4agwsYiFHmeIyCN4pSJ2ukVmGC3+nC7ODkQR8c/gzEuq5Yit8z3PlIJztAT11QI0PIDxcBWQXI4THFAV5Mm8shWJ6CH+SiIcTX+oF2x7hlx7XPCLOBXkAzNJ9cMEN0qeN01ig3fBkPXrYxL2P3jasWYbV2WF0f/hr0mgF4bqYE0MnLgLh/+l3UwAUQpyM80LRjNTsZnSmQGkmP7cShXb7OvjEN5HfbAEEFrggyewGeLmqcAeh1bdAaSQPSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN4BPOIWPDGqdDeOp0lBQqizd09UwfjA8JkwBWWPokw=;
 b=QdeHY6AtHG9alhhxinWZLqbY10XExsMMFSHcUZHjppDcVlvYaWjKWp0f/DyJPb1dRU3EV85PZhZEOzHcY7zZAGgQrrMHJEv0oymBxuQOr+73VKYuVNrNEoUWG4HuDBF1tcUhxHQlLr8PLCI/fOg5n5qiKWrCDkBXHEY86bzawto6bm+AYuAFp4QpGx/IzDP7A00PixE34ipLDUGVtg0b9bHWFobBc2HdYceEp5n6BBK0DumisqH6Aj8O4/JVdAmC7lmpZLzZNUqxWE9UFDpU8RGCffvRYoPYWHq21TJy+bGI4jI8v/28K9XBmwdIBvqUiyj3zXRUVm92mVatCYUlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN4BPOIWPDGqdDeOp0lBQqizd09UwfjA8JkwBWWPokw=;
 b=bd8RT065lorg7IgjwpZbZCcsGpcXmFePm+9qv3HFckThFKiPS+mY677Q8HlpuCPW0fj20a29nJpaxvHlbRUMP0mdiib/3f6dqVJG51EP2R/hafprg7YZ8LsVD34gzcjPj5dVp3H9BqsR+ImxtLs7W6NQM5MxM8x8Zv6p0XZKMmMhpspfpZl0+bGLpcoRWVQ0+y/DOSTXHqb96oRO7zEv6HsBM4kIQNW8336aoSuuvSR5BBPq805kFO20hC9JkzDA3ZsS3zVBYAcuygy3EOrHGOBcaR8lSDwDAdU75NdnQr120GCsa2CQ/W0rKmXOKrSGz9wC7ZwlrTOIP5jJqA2VaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7349.apcprd06.prod.outlook.com (2603:1096:990:a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:26:08 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:26:08 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 1/4] udmabuf: cancel mmap page fault, direct map it
Date: Mon,  5 Aug 2024 11:25:43 +0800
Message-ID: <20240805032550.3912454-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805032550.3912454-1-link@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 01379263-71d2-4dbd-97bd-08dcb4fe58ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sta/5HTwmHdzjAzlWdiN4gzbn9UEHvNL31YWCL6m1d7mvsYAxV9Kr5AHFah2?=
 =?us-ascii?Q?HLJct5g3KjAT2G7CDNFgEh06XzhDypZkH7JyfRuGlpQAhQahnNsrBJlMoUyh?=
 =?us-ascii?Q?WvaQsiHTVrnS/j9MzDun4JSONeN4XL/PP6bSh88vqoT3x+n/+NpFMkiKKhzl?=
 =?us-ascii?Q?/7nunY+D2J8bCQrQL3M4dTfWhLBHYotuUCvUqdg7oNa0KGQ5Ncr2DBTfjKvV?=
 =?us-ascii?Q?3IMT6CdlQsmPvplS7+mFYxlhNtD1Z/QoJTQArGIbeMn0lSD+PjRQvY95oNJd?=
 =?us-ascii?Q?7H9Gr/yjcsqaH8fVJi4XJaQDjuTksWfpsZPnhaT6k7upveEQpLyCPvV/8EOB?=
 =?us-ascii?Q?i2hWv/cJgs6mpeUCtvGc25Wh2hhkBwiCw8XR6xxFpSxiQNA6/tObBphKi1cS?=
 =?us-ascii?Q?znedSWoRGc8es0IjZebIAfr3kgarHLmRbUHNvLLr6LsTmENc3GaUJOyh3R0R?=
 =?us-ascii?Q?HeRD2xt9HDy/yBh6Y4OsE7gah46DAu2aZrkUVPzd52d0dzYcH/KTdlUoqFzM?=
 =?us-ascii?Q?pC/ZxqFRWnuu480RxQJdCHeYf7O/bJdaBDkNts3AcGxWw3zgxw+8zfdiEkap?=
 =?us-ascii?Q?5fpRFo9n6UgO1HcBcUBfrVQc2d3bBkUuydwUdd80FxcE+OSLXCH7uXXxXUSO?=
 =?us-ascii?Q?XODUwfMGOxFe5iRhyzKwbGQvlcWRSo2hJUTv2eHh7aU9/qpqzQXjqagFuCtY?=
 =?us-ascii?Q?R+De2ort1Av6ussgXoBpau9Xf9I2y/sPkSY+hna7PPFGissK29LOOWlyfFxd?=
 =?us-ascii?Q?GkqSUMiWYw9dbjey+IIdrwN5j6zysmsPhXAJGjwRpg2kN1WwfhT8SwaWo7v8?=
 =?us-ascii?Q?SngBbQpGb5XbAlqvynMjdq3dY2ju5cImciCI1AF5vy//3huCyJeQqIPmDM9Y?=
 =?us-ascii?Q?sNV+1t0/BxT3WMk9Ar1GFqezSnBwiI6dWfJKyU1dsEY2a/L77E/AZ2yfeacf?=
 =?us-ascii?Q?6nzHMAEu/4HbU6azT3UoDMruhVCEq+3toLp4g73rtsORpLBguWkYj/PiJase?=
 =?us-ascii?Q?7RBDEnwjkhRZmqdbr2kQlScCSCxLZK0HOSo/MS8ZKBBhbkDlpyvtv6OnLQkO?=
 =?us-ascii?Q?epqdL52oXsYCaR8VwiRSrF/atjAb3vfReN8NdCXcf9sSIb73qrOSflqBie7D?=
 =?us-ascii?Q?nUUZ3dorEj8nflT4tSx7sjeW9VNPmxfzONhQNZwWVk2c6UDk55EIz2PzBGQK?=
 =?us-ascii?Q?ZkArqCLIJO+PtxZgvSqc7BC/NFfMIi2pg+uB6SX/0nsyW12+GHylssxZ8rdX?=
 =?us-ascii?Q?I3KTRi06QkKUFGzxm7aOPL4s/VvC7LOFiEYQ/9ENQPWR8XL9hT7dfiOSmkSl?=
 =?us-ascii?Q?ZVghPsxtTrySxFdSlmjVezIS88XnfH6Bz9HAELRC/aDQreCbJP+V5B8G0D14?=
 =?us-ascii?Q?qip2iTokHRcBTZn6wn7LuYEMncTM0lxs9NBKnRkuZHt28HtZMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DudbI0jsHexhODq+pT7oLJYTDpHU20dVWaMNH6rMF1i2aq9HSaTVOgeW1Se3?=
 =?us-ascii?Q?zHrtjAq4UUL47bF8do9pmXkSjrBroFF3hwho8g2BnsZO797CwdMYst8pnVw0?=
 =?us-ascii?Q?Moq4G5ubOZNzRdhvxSUvI0ZoIfnA7YTJHa4u/OdnOZSoKmHYXUHSakH7zUbo?=
 =?us-ascii?Q?avdHlccFrcl6xxrLktpcShL282I/NDcINwISsg7WeIFH1QfnNMetPIZ7GhCZ?=
 =?us-ascii?Q?SZNQ9bhTzuFN9dNeFDD8DSK3R090pf/JXz+6HsRaVHgtILYHux27cQjZDO8m?=
 =?us-ascii?Q?JtuWTBpxW7idopucA/kJhayCroR4uA/oiM+/xiYFjA0b3VricGkHSHgHv1R3?=
 =?us-ascii?Q?pvnk7hTjGaRls/PQRl3zfVzsiF2T6zYI+0yu039tAoKpGE4djMd1v1yQcoJX?=
 =?us-ascii?Q?3eLnY3mC9YjPRJZVWykr9lsszUywbxMVwl84x2hBRTgvvF+2+kBNP6nnHp3I?=
 =?us-ascii?Q?yPj5ndE8C2An7MfbjeipdqSmG9/MA0EGhh+jA4MFTFV/K0eq9DX/RY3t0J95?=
 =?us-ascii?Q?G+cueG9j/YN6j81i3YgHciVdWR1W3IPbIsH+bQD3+NyeV48BWl68YqUDtXqu?=
 =?us-ascii?Q?4/4v0qYHlu2QSZrfowjrTicptub+HLsHUF1YQiKFp7oJLR217i1ALUGPPcMb?=
 =?us-ascii?Q?VpzXFPJMVGWLanK6PTK+83kNDEBzLMi8YhyeQbyMfsVY173gfyzA6//pHe33?=
 =?us-ascii?Q?pNuO/gDRXpXXDxchu+bTvVdRLv1ebv4yYmy8QZBjJS3U6/2D9fQJ1i8xd99b?=
 =?us-ascii?Q?GR8iahIoH3uK20vMMOvl6uZuhaBNgiSBLqsm6EbDqgQZd9//uu62mY8QUhGI?=
 =?us-ascii?Q?g3jpN16BxwMrZFMAtWztOwM2zcWXWIvOOYB8u4fehuYuy+caozzOl1afxHth?=
 =?us-ascii?Q?ZuFEc9TXmZ3ExCXOFSQmx1Z1CkCUt+QfvgeYqRn3kVXsJpaxZQS3OUUbA9+6?=
 =?us-ascii?Q?2BkRJvquKUYVccWqUqIWehQekHIKREozsm+1VNCggHdhABoaDKNjS0lluyvO?=
 =?us-ascii?Q?VxNdHq5HRKg2N0cQYmx0qF+yV5PxMIHYX8qKkmX2H6t+iwu3lF9YwJVB7FUJ?=
 =?us-ascii?Q?QmZvicbDpfEBCpo9+HpgfCHUjGnrcanSG2SADyY+lFymBcdZm7148W9oPRVs?=
 =?us-ascii?Q?w2/CtwHWr4GPLhc6r4n9vRi0ZbHvq1WEyjWQ7AHoYSzu3lVon4+ObUom81/v?=
 =?us-ascii?Q?Y7fUwZsqUiJfwS/c/OVu8G8z8N2vC57nGoSHEBs+m9oEJuH/SyuSiYR7FxLj?=
 =?us-ascii?Q?LAkDUWoSe8c3nht2RMIkxrO8jKVj4JYhO9jIKbXFxoRfV4GUSS6CHqaFQGdw?=
 =?us-ascii?Q?xc4M+I0G2ZnN43dje8Zt7lX8FKCkAGqJUK81D+pZpAuPK2SEpFbKy61I/DLT?=
 =?us-ascii?Q?+yZpVkCchF8xae5gFp9hQh9nCatHtdvShVWwY6f266HrVDSCiJsYfpD6I2jG?=
 =?us-ascii?Q?azbzwX/hsUV79ySC5O7IL8DEVTuIlzJkSjMDIECJs1T9fxCvD0zaLrZbOuRO?=
 =?us-ascii?Q?3yNJIAEptojL9+4LllslPat1zKetwXKd09WQRyXEKQtqdVtkxOSnskdibegl?=
 =?us-ascii?Q?P8FmZzRT0njIwBmmmEsH3uGUPHD9TqBvDu2OYBBN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01379263-71d2-4dbd-97bd-08dcb4fe58ae
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:26:08.3821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+ekU6rWPpT7eZwcW7AKZQP3E9R+A0MbR9qfaRcgTEaO0x5meedV1y7IgUcAENJ60I/fRiMqqprnlqJhVWjW3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7349
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

The current udmabuf mmap uses a page fault mechanism to populate the vma.

However, the current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically. The
current page fault method only saves some page table memory.

As a result, the page fault mechanism has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
this means that user mode access to virtual addresses needs to trap into
kernel mode.

Therefore, when creating a large size udmabuf, this represents a
considerable overhead.

The current patch removes the page fault method of mmap and
instead fills it directly when mmap is triggered.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..475268d4ebb1 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -38,36 +38,29 @@ struct udmabuf_folio {
 	struct list_head list;
 };
 
-static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct udmabuf *ubuf = vma->vm_private_data;
-	pgoff_t pgoff = vmf->pgoff;
-	unsigned long pfn;
-
-	if (pgoff >= ubuf->pagecount)
-		return VM_FAULT_SIGBUS;
-
-	pfn = folio_pfn(ubuf->folios[pgoff]);
-	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
-
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
-static const struct vm_operations_struct udmabuf_vm_ops = {
-	.fault = udmabuf_vm_fault,
-};
-
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 {
 	struct udmabuf *ubuf = buf->priv;
+	unsigned long addr;
+	unsigned long end;
+	unsigned long pgoff;
+	int ret;
 
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
-	vma->vm_ops = &udmabuf_vm_ops;
-	vma->vm_private_data = ubuf;
-	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma->vm_start;
+	     addr < end; pgoff++, addr += PAGE_SIZE) {
+		struct page *page =
+			folio_page(ubuf->folios[pgoff],
+				   ubuf->offsets[pgoff] >> PAGE_SHIFT);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.45.2

