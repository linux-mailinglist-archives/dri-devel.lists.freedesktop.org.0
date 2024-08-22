Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00995B0C6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8710E59A;
	Thu, 22 Aug 2024 08:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hw62FJPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BD110E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7ve0okPVbm2Kil/p7fq3tjecuZvkKVIsOjigvufAkRGadarjio5lGbllw58cU+NMml+Wm01mdrNBpbxzlzVq9bPZBq0h+LtmS66PD+IwEZ4xvSv0Pvm+tsah4Y/LAtBDJWm2+CGB4XZ0PEniS1+f/ihD6guLCLWG/QivBQoVBU1fjiFy3t2/xnbWDoAFuH6OCnbCdAhvOlk1FNK0zp9wQaGioE96Ve8WyqpkCKJU3eshFgfbisaxyljrBVACjv1u8NzWmUR2nEcER27DIIKSXSThOoROKI3V7NtM+otHqqNUDL34QUay8AAWE6Hy0W8MdAm1JO8gq8A8DSpPq5b2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzuJ8J9ZQT1nrd+zYDpOnn3+Vmeyyfpx3zVmuuT8KuI=;
 b=AOeeOReXD9TqoP4U7+lEsth+DDcawcT3J8RsaSJnAD7JK62sobnIqKTveXLQfHc9JKmdSlJQFjEv2302TAVcOX0Q267xXdfYrTqB7jIdJ3W8ekVzZYTFZB7VKzrWQRljydmOF3kfRmFXaxQC83nN7dMW8mHVtE57Qqnk0BdN+uiyHZZJmBExD5MRP3JrynyMNGnAqF3vjQKoUYhuyJxMCr0go07Drw0GIL66osvpXR4cN9UieJaLJ42iXGzhtQfske4/dacqznxZAq051ZKejvWdSKtJ8Q0Yq+HbTUmO+w0G4rp9kdVNS04LFAYQSiFXH03X0BvFgnrXsI/uYXLLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzuJ8J9ZQT1nrd+zYDpOnn3+Vmeyyfpx3zVmuuT8KuI=;
 b=hw62FJPGy7/wwxQnqDuZqiKBJ0/FarpCd/B6mBiWWMtD/nSl9PszJ0WiFguLASK1ipLKs8q4SoBy1iju9wqyN4r63uc+CvL+1eyxwUZZWrmTBHi4vndJ19iQXl57Zu482X676bkBJBY0b+FptA+DvSF6+MpusfgmHk4nF1QJO2EXdJoqZU9FRdkK4ZAACiPIP7f/IpBjhwvTlFK3u9kxr/ILs7qCtO0kCJIEzyfTS3qkgK1M4eWXJGTGOVsmdJOUpVcX/cqJpmCepXunHUzbWR2svq8dRj/rj+gsEzV1p/lgpnxBnAsDpmyXcpofArBJkPAPjrVLIp3u0uxbV7B7CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6402.apcprd06.prod.outlook.com (2603:1096:400:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 08:44:42 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:41 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
Date: Thu, 22 Aug 2024 16:43:33 +0800
Message-ID: <20240822084342.1574914-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822084342.1574914-1-link@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 57638795-8c5f-41a3-c021-08dcc286aa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8TcsI1Nq2DhUDZyN96sOmRcmZLOhJUqto3ybeZRrOEABDjFNnUF7thuNEzKj?=
 =?us-ascii?Q?CP80ic6qK+7nMxRRDE/VOvUWBqih2RSFYok10gnn31Lh63QnjTI/UCSWTqTL?=
 =?us-ascii?Q?Plryxf/EScnKVhpoZQo7AiW3PTUC+K8WJQlDMOEaWBp2Lq6zmYcd1eAwmyhk?=
 =?us-ascii?Q?wYj+8qeXyjGaVFL3AoGQ6CQUhku/zMHRweP54E2XihjKi9pLisK10piK3qNM?=
 =?us-ascii?Q?JigF9nFb2r2VLpgT3bQXfqlkbIFGUdVO/3ibarV5SNFwQjwwtZfcvQf50RYl?=
 =?us-ascii?Q?NkeKjK7VQfVcmMLYf8aIxOCw709f8ZOEVO3AlR1O25KEKtfd2tqUV4AhQcbS?=
 =?us-ascii?Q?XAqgZxiLpj1XE+icZSPr395kTg5yFgLMC9Ym5J2KfvOR5YeKlB/xkgyMqRK2?=
 =?us-ascii?Q?FoDW/us0ZVaC62K37MXCFLUOV94jkh62gLCB3P0rtIrkSFiEUtFcVzMgKec/?=
 =?us-ascii?Q?P90qF1k8dnZDLX9GiqQNRj+YZp5IM2T7fYcFu1lqfG+wfq1HIMZ/2Oy36ZJt?=
 =?us-ascii?Q?LHb+x7+7wGhLd8x2atKAc55FGk4isYMTec+QdrPb+9mfm/9SBSA6znL2pph/?=
 =?us-ascii?Q?m/JjWH5aT2KkdTWNao+xyZbdafbyciNc/AVHNcRg6JO/mhpT/w1JUFvvJnuO?=
 =?us-ascii?Q?Js/vE8moJ6DO2xQXKjwRyHnhQ+yZlUXFmZ4hjL3UGYG6eDuscKSvJ2t/Aqir?=
 =?us-ascii?Q?K/wBt/+OrI/PrSDVytqm5Vik7/41rzHTqYBWO+xFSnF0xxREX+OzBtCwR3fa?=
 =?us-ascii?Q?NO1tRFYZpYpsvoDYJJmlT0uCTsNWG+IaPX6Esr5k4GXr3herqoNA6+qENRlp?=
 =?us-ascii?Q?Q2EjuXz0Z0VQNpKQk9FHZpd9A/vpFqWeyuv6V/rOYXNuXV9gw4bS/sPrZwF0?=
 =?us-ascii?Q?L/Svznh1Zvn7xmAOt+1yMeTsHz1CotI0bixZn0jrIBbHh1kLTriHwzdjO8oU?=
 =?us-ascii?Q?/9uTsuf45/IhfnO+a1l0sQPSWFo4iiTryehpOUk6zzIkYfA+wK/aI6VbSmU6?=
 =?us-ascii?Q?lJOKEPwtPkp3oPnfA4eJmGKftF0ZLB9kLPouBXQI2trzjFt8h3EU126nZh8s?=
 =?us-ascii?Q?uI1cFeYa1X2TEWNWSjW/BFpkcbKed0NSY54RjXLXS4onnU+duKde7V8P/ELv?=
 =?us-ascii?Q?81oIMiFbR6rEi4dbzBxMl01Lvq6c/MPlTzOFnjekPgzTzh2wP0uJJgN3ItFZ?=
 =?us-ascii?Q?tZgb3P/Usqawx5IIFzaDx358t4uTI8ELa1BmKAYLCuntqh9+ADCdemHz8Lyi?=
 =?us-ascii?Q?5/VbjKxUxl5pct6Qyix+XkNFG3CaBJbFECJvcWiHhE2hdJVH61Tb+mfYgCZu?=
 =?us-ascii?Q?sp3Lc59+n009MlWUC1EMepld+1TFEx7hl3IBIlothdiGxTsTP8nC98rRt/61?=
 =?us-ascii?Q?JQYM0roiuTQsKIrjQhgkD3/IDqJ2fjn/7m9ahAiAOWygPJIt3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jn4Hz8YfUYysaj8tuVOMVJ2WNEbPunMnmT7Oux4UktcICpClfQfFVaGxfVY?=
 =?us-ascii?Q?KDrVp3PbbW5ROFa7mmua1quBtAsrAHEoyaERgXsadf/UxjeqqurXzKpBIw2E?=
 =?us-ascii?Q?0HKTNQ1Z6DqAjMr1NtVOC+fA5scdL0TaZxV2zZbvT3oTj3x6S9fvQ0sDgQOn?=
 =?us-ascii?Q?Pxu8MeKGdRoTK+l8GyhXrcYvTHAfrmtLas5xkCP9WdqTr4SOTCrxFRJMTw3I?=
 =?us-ascii?Q?Y73HrM4SZYwunJ5ZUHDMucTCBvVXhsh1d/GRv2b/JqZhxkoI8HCSqAEno/kN?=
 =?us-ascii?Q?lLpak6xdJefr3MMcCB2ugZOW892PrD3yaS4Rxwv6PbQNdROHSAGcGdIS4EPC?=
 =?us-ascii?Q?W6IML1ZbbxvDzzybg/gwUvZwwwkfc2ls+qK5MtIUEFWahYKxkZkMMRs9AuIR?=
 =?us-ascii?Q?LZeorugqPvigdkFPI3KANuvu2vRnCq7+17P4aZG8YOSNaMZqpEcsLtsrb4+H?=
 =?us-ascii?Q?fYb7xDuR+ZxNhZnEqbpvnoaM9r0LAH2rAd4/dI89/AFKaQ08Do+eabnbzDL/?=
 =?us-ascii?Q?UI5NWv280lpKQQR9X3FRQifLM9lLsvlevuvjxnQZlcnRKgs5M9pmQCMPifc7?=
 =?us-ascii?Q?jcugXzKy0mdh3cLGPIPvskgxKUy0Pd0h0fsnOcO/ubswBgSMhOZ166O6SJhA?=
 =?us-ascii?Q?WOETXJD8gsnT8a61EQBNHlcOGNdlHiPTX/oYkX3DPeI4LYpU+bzcEhbVijbs?=
 =?us-ascii?Q?5wtApJBr2cffeDPGD4d3sCcjZKMfYArUhIXSLSktTP6MSAuLiJoWzZnFDGGX?=
 =?us-ascii?Q?PqHm8NFlefeA/2odwmhRvRupXo3tFReH4D4esCPZ05XNfiIm7yOfrAx+y2x8?=
 =?us-ascii?Q?ReLDBZj93STK8qDtSpUKEgQwO5zkL+UE3g9WwI0sAvjmMgGiGAFgD43L7nkY?=
 =?us-ascii?Q?YL4ecUhr5igEXParyOplL6fMjnBnGVChfpFzHT4we80wsaKSY+Z0inRrd50g?=
 =?us-ascii?Q?Y3X4ItsDNE6txMiItuaZNn4UkWfqrLh9KWVVybrEFjgsmcNPoGp4JsjXSNcD?=
 =?us-ascii?Q?axfx1wjlMuHQf8XQ6IXKrjJ3vXne3mACINzit14LhotvpK1bzbrPW+jMO0go?=
 =?us-ascii?Q?803SxhMk14649NZtdF005w9GGf09GkV6GJC0cuPgLCIH7HI5JO40vgYqJ2Jy?=
 =?us-ascii?Q?H2A0Dz99h4BUsHmz8JxyJSCa7tPQqZvtLNLhdJj4TFLs3fn9LkXlK4P4rOHt?=
 =?us-ascii?Q?YUDoWTRs59F8i/jg3DduvXzM5X+GWXBO2soQG3oK2/C2gh8w92bJeB6vjcHQ?=
 =?us-ascii?Q?2tPWCHZnmYLlgYiU3afWRH6Vb5Rgk+G1hSGlaB6Hxbd5olVnxMIb57XBAnP0?=
 =?us-ascii?Q?Zgin7enx3AeEJF7M7SdM6zOVRutqrXXardKLyoUJSuKBtIn1hyO/+QNtbVyB?=
 =?us-ascii?Q?occC2iBaXba3TE9nH4rWmIU0rXfLzlzdFywNPwTr94w85F89i8uSAZx21Ecz?=
 =?us-ascii?Q?w8+naljtvyK5Sv8udZxbJnCvVZSVgVKkKQ3Ybop0aSlf90bPN6ull64YZtVq?=
 =?us-ascii?Q?6dGAmaDL4yDIktNjUyKigqhvshkPt8DziAgp1GeAtTnkpoxZjVIKBqHgDpXX?=
 =?us-ascii?Q?FGRdip5B0zkrgA8KD0VODcL6GusDvoehrUth8fSw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57638795-8c5f-41a3-c021-08dcc286aa2d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:41.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0l9MHEH+zOwyOm3wAr5cDeLXM6Gx+svB5rGG2TwcNp219D8CeNUCpKThJdGcOu5BMJNuCHQJNLTRymBryLIxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6402
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
already been acquired, rather than being accessed dynamically.

As a result, the page fault has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
when creating a large size udmabuf, this represents a considerable
overhead.

This patch fill vma area with pfn when the first page fault trigger, so,
any other access will not enter page fault.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..0e33d25310ec 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct udmabuf *ubuf = vma->vm_private_data;
 	pgoff_t pgoff = vmf->pgoff;
-	unsigned long pfn;
+	unsigned long addr, end, pfn;
+	vm_fault_t ret;
 
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
@@ -51,7 +52,28 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	pfn = folio_pfn(ubuf->folios[pgoff]);
 	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
 
-	return vmf_insert_pfn(vma, vmf->address, pfn);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+	if (ret & VM_FAULT_ERROR)
+		return ret;
+
+	/* pre fault */
+	pgoff = vma->vm_pgoff;
+	end = vma->vm_end;
+	addr = vma->vm_start;
+
+	for (; addr < end; pgoff++, addr += PAGE_SIZE) {
+		if (addr == vmf->address)
+			continue;
+
+		pfn = folio_pfn(ubuf->folios[pgoff]);
+
+		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+
+		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
+			break;
+	}
+
+	return ret;
 }
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
-- 
2.45.2

