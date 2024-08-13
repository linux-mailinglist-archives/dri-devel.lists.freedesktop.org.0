Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8678A9500CA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223E10E2AC;
	Tue, 13 Aug 2024 09:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="QABmRsCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154F910E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG9eTygCQeq/sOk5rTPfTdGhno93PFD+fnfYa3tVCIp5uKziW58F1b6q7WxTwZ8MefAp0uP2GjsZZS7dMtUAz3/h8OFWEBfOqZ6+QHkx+Aaqnxg37p55yPdF1CngK7ltefwZQfS1HgoHUZ+JFQVq+tDtBkqYtisPpPI8NvZfxbK6I5za89aHiSWDfAnv+mbysfobuGib3Mowugi2+612w0PTBY6i/AZ2Hib2aNa5DWThOg4dGhTgk9SZo92bLb/F1hSlpNuv8/jloJ1OixVT6KGa6JQ1j+O5Y4yDE5GDVB9KoAoTggu1VDJeGcfsu0fN/whmrI/FwB4HR48OHcEJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg6KYKgpaSeM55sTXqXgdPKjcJnZRfusdSSul92Ad0s=;
 b=JWkDCFNPxoUlZGYuKPkxcARgxm7+57zOwlvF07pN1CevMggaE2H6YLxk7yJZrSpqb+gAPo6qLl9EHC3qGWgBPgrpceuO9EgOveNuWkcUZZHxEEt9mq2OF6cDghX22ZFqVX0NX27omGkZ0F6rCUDMuDqAl6XrmRAoFxhj7r+maZKD8tiJ6JiepaxxGCNgm/P/IlVV/wwaJk1F6mMo7CSDNJEyoQPWjAwsGiWRCgzcSMCfazGBwyqQLyJUdldq6Mid2d8UL4CCt2dU1eg7mb/NUq2X+MR3HjbuxhPySb7GGsIirapv1xPSqkKDVrivUvOMPTac35SJelQBkkYA6UoffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg6KYKgpaSeM55sTXqXgdPKjcJnZRfusdSSul92Ad0s=;
 b=QABmRsCHTS82EhXw0tPBbYONtqL9G3fO4tu5QwiOqYfq7GMzb9J/MT5OcMDDKMplFJQ/Xr89H2jZRklhI02Zkk27PesSGdcJZ8gfiyrGNTlx9WsVhVfJB6OfVcLzexTwKE0+nNH4s1H39t6D0OKicKLtJcFfr9A5BD5SIfW/mVgNvMvjqW4m9RJvZlh/0yaDw8PvQyTM6Ew1STmrf9Bmqmo92FcxX7YB4dwCsfbvVuypCePxaWCx1ReUj++mQeMNxHvoKh4LYB478jPESaRILevDElko0ZU4I4NRAlXffoaPa2Qqgjw2cl0fMlJv8fRyYuPH+lb97uCr8ToErCoPQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7198.apcprd06.prod.outlook.com (2603:1096:990:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 09:05:37 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:37 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 1/5] udmabuf: cancel mmap page fault, direct map it
Date: Tue, 13 Aug 2024 17:05:07 +0800
Message-ID: <20240813090518.3252469-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813090518.3252469-1-link@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 16218051-0a07-4a6e-b125-08dcbb7718c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ARADFJzMIFN2nPQz/viCA3PWd/mq+7AHZnV1xx2uQv9mBvyK6yhODqhiNhkb?=
 =?us-ascii?Q?fUEeU47stmjd/iGDw6qdpz6pjFw0eVLx2viyj5CjRDvxquWpVQ41m2SR5z6H?=
 =?us-ascii?Q?nlPnZf9WCEv2QWcF2OJ5asWu/3eWHjiW2lD94iV2MILYpRDQonMYjlLfO5C6?=
 =?us-ascii?Q?at/nXY+WiYtW2ApqOkU0uYpwcjb+5zfGnldwnF87WEh63CCaXkEbEfJyN+3Q?=
 =?us-ascii?Q?kbE2h2GzUIaJrH+6ye60gd3KjMmVmOoIokK78BOhZNX8V3mv8YMKDPtTO9qF?=
 =?us-ascii?Q?qAASPDEwttQUHe4d5UnWERgrmf+stghBztgfwAZqthgaxhPU774ifjVT68To?=
 =?us-ascii?Q?EjVOlVP8MAhMlKocJeTvnJQLZcLMVnngrtbDOGYMeDe3v2j5S7KgNCaYFZl1?=
 =?us-ascii?Q?hSG0Bohq2RfCHmsYumnbVxBV0bZusxP2/z8SFd8UqA3PlXUlFTF/azbP8nxd?=
 =?us-ascii?Q?wnsxPKcbhoGq+5pHiMsQRumBESwY20FOBZ20bKTyA7nMIrSyHKQOSoh8wmX8?=
 =?us-ascii?Q?dT0MbNm6YgKkH0rPy0KFhEAvjAXa3XyIfDuxVm58LQmCf7/bvTdsxYNmutI8?=
 =?us-ascii?Q?MOzs9rMHoWu+nx8UDiVukdaCtUL+YjaRokn5hd1Ce9cShWtIPc7wzlnMwo0c?=
 =?us-ascii?Q?Mqzs3ytl1eALO2x6oGT4kW5Wf9HjYWOVR/eBFOPPR40DWbWQthqDAeJaLuQQ?=
 =?us-ascii?Q?ESYEnTJ9+Q8Qhi8k8neZL4iDKDIsIQRw2dJbt5bzrT/DSJhjBtgnMDdjtaxL?=
 =?us-ascii?Q?OiZXlpkYxY2CWREUd7dXmM73jBjEkp9qqvWrG4RKzIEcpHEccqkR5ltDBvhM?=
 =?us-ascii?Q?j1m5mCGtvMmHJkoMDF7qwUyquSIVfd/VDzJyPBoHzsRTXdWe7g8jh0LB87X1?=
 =?us-ascii?Q?+uUMcPZ6EnP67I/9eB2rxNzlhUT9vbVruJHFc3EuvzkgGmsFUwUqC0AKg8nn?=
 =?us-ascii?Q?Z5dqn4+AVJLqR6qc0rdmgoeLynXdYFegbUZLQzRoppCFKtfmOgWLJ/5s9Qrh?=
 =?us-ascii?Q?W6xVsCPqYuPp4FXN5N4oAcCJj3/oWMPpi9ZP+XvnUytq+K7fd/Z7QC8W7c/4?=
 =?us-ascii?Q?pxOCqKMQsZ9hR+8ZvwnU3Yq2SeT94C6HX7ESoH9DgTX3p5j/8Uu1rGrdXZt+?=
 =?us-ascii?Q?gKL8+fA/bz1AVGfOezYtB9qQe5WbKp3DdgO33sDXw1Q6j+GDAQ0fs1OmtXIl?=
 =?us-ascii?Q?5cBz96rhc7B8XHFeKKbu7GiaC1SoZ/nc6CqeQRLTtiF+RDyWkH7QCf3nB4m/?=
 =?us-ascii?Q?hG2vYnz1o5UHAY/olCdW5py5HTI7jlok94oevA2H8uKI0g/Mg53wcyZpB5l2?=
 =?us-ascii?Q?wzMqohnq8v6pdTaG64Nu3ti+Mj8O3Z5Uets/omls2thmFPl8TQmFr7Lw9Ugw?=
 =?us-ascii?Q?Y13tpBZ2nMQpSo5seyh3aHTXJ8dqlWVtUw+THJL3ASNMtFwzSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7qBpOFuNQ9GLOBackr8KFgsyStYhuJmJ1JEKTEn0w9U0kgpAyGC2FBi7SSX7?=
 =?us-ascii?Q?Mhs9HdbDppI4nTcwj5QRtHuKeuS2e82ItgcIbiTMvbrFzp2cpNfOYKBoAUqQ?=
 =?us-ascii?Q?bfOiNOWzjTu5zcPM9JX4fTU82KwdDNxVwXhUXRi5Spy0NZXIgdg0KCwzS3V6?=
 =?us-ascii?Q?vJTCboJwzjC+6Y20XqmWDdFeESAajiGKL7JEM7EAKL1ukwM40/o64ZbXVEqK?=
 =?us-ascii?Q?vWp0GRKeIF0vcjlKGSkv/ZTVvXQtQxV1rLCKdidEZ8RgG8al8/Epf9AiQHqT?=
 =?us-ascii?Q?f9jiCTifoHG5DHT1Dp6JjyD4L4QpNYdKC73spYqCN5SlRs4qj6c1MJEmoMF6?=
 =?us-ascii?Q?2TO1pASkhfA2TbG9BBS4FxGfHHl/7SAo1ieA/IT1BQJHBHu1Jqegm1IIORgL?=
 =?us-ascii?Q?KyypSImairJ8X6Y2JDaeSYBMHWJISL0ouLrEVNxpUCqaxNgl0RMG3z1HJ7ZV?=
 =?us-ascii?Q?ZSBXxm8YDSCg2Gqn2Kejy7mX0rBPCeKSTYAxaCpyTuAxlaCd6BJ77ulfNnxM?=
 =?us-ascii?Q?5NN9If/JUkb6/k3sWEHEM2QQW8ghdCBfTmWkocdg9bTayVZ+Mw3GjLOvo6mF?=
 =?us-ascii?Q?nNeLqtuKytoCwjDKaKKh0vmA57k1tcjpoxngVLkfGGiC3+/1WLJybTSfMAXX?=
 =?us-ascii?Q?sVTuQqfQETeVLzO2iObhiXu5dAbhCyDV67ZdBgGwh5j3yb/Ko5RDzNYe01yM?=
 =?us-ascii?Q?bdolk8EyhqSRt0hLo+xWSxqweLfe+7XJxnFeZeQh+6ZcuH8ZhlM6D6lL4tHr?=
 =?us-ascii?Q?bqzd65bm6rkuyrahJr0nrqbMj+y/CrelcJfuEHMGPbGK5TX1Xgo90xP5mONZ?=
 =?us-ascii?Q?F591V/1EmFgzkr7ok9aV23csg41A+W4kjbUWlWwF8H4e+pSrMZfWLUNyijQV?=
 =?us-ascii?Q?oCHpMXIr4ATxzVQiT5cdC2ya3yUDV5meTgyjBrCF1LIBO8LEUlhS62zuDTVA?=
 =?us-ascii?Q?C5/MkfruBBHmzhd4RrOOdB1gMY317pKrHIcUOoX0BUwLwahRGKfAd6Hi1/WL?=
 =?us-ascii?Q?d2IgMuPWJ6kioZsDwUlLcvsQ9CsVUv2xXsh4reI9tp6ytWP8/2woGiu8bENG?=
 =?us-ascii?Q?39vBrdi1nQaaQJdE86EvY0EegYr9W1AXDudSF5cat3RLHZLGZU5qo/8+rxmB?=
 =?us-ascii?Q?lzosa6vCrojah6JBZVct7NIQxx14OGs0W9FqJVzNPmuxIZsfVEAITvKOkCm4?=
 =?us-ascii?Q?z1OznZdVOUoIwilawJPhpu8VM3scRfz61YILRF21iZ59XGX+1dlWnjmieiVI?=
 =?us-ascii?Q?Mms6zmlIvkPgiolBNq1dirGBLWg+pZTLm8mxFKBTxI/gO+AdXpik3tDXJOT0?=
 =?us-ascii?Q?G2wdrX8poFhjusgIJQHUllxzmTArLuT+WQT0atoTxmwn1pRhHVEumgLcwuog?=
 =?us-ascii?Q?iES9oSlXyjSHJ84fjMgz9oQbVuLEDtswICCncFHUr0ErB2Z2V31msoXtQ/rv?=
 =?us-ascii?Q?u8fDAvfz8LsRwgLaXhS9z16Eq6j0PHV1Uo0ABscc17RYT2o1/2h1U5B+JBIL?=
 =?us-ascii?Q?ViUkWJs/bjO/oq3h/G9+J5th5rxeUyiuoYC7Ha0MkiR8TTUryO7OE5I8AzQg?=
 =?us-ascii?Q?FJfWk9O8IyJIaYzqUKHupjzVshU++EEj8ba0VRB2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16218051-0a07-4a6e-b125-08dcbb7718c7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:37.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITe3cNikEuCiTXnm65tG/7DB17pDCw6BcMSgt7PPj/bRpe0xnYaJDBzaPO0+ndB0apmrqSRYZBS4nC39tZ+rYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7198
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

The current udmabuf mmap uses a page fault to populate the vma.

However, the current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically. The
current page fault method only saves some page table memory.

As a result, the page fault has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
when creating a large size udmabuf, this represents a considerable
overhead.

The current patch removes the page fault method of mmap and
instead fills pfn directly when mmap is triggered.

Signed-off-by: Huan Yang <link@vivo.com>
Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..d39f9e1cd532 100644
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
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma->vm_start;
+	     addr < end; pgoff++, addr += PAGE_SIZE) {
+		unsigned long pfn = folio_pfn(ubuf->folios[pgoff]);
+
+		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+		ret = vmf_insert_pfn(vma, addr, pfn);
+		if (ret & VM_FAULT_ERROR)
+			return vm_fault_to_errno(ret, 0);
+	}
+
 	return 0;
 }
 
-- 
2.45.2

