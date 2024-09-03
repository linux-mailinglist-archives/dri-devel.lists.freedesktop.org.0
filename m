Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381EC96976E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442E310E3AB;
	Tue,  3 Sep 2024 08:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Fv/Upo97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2075.outbound.protection.outlook.com [40.107.255.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D8810E3AB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvG6HXwlM3yBwkT+v63EveUC46NMI6rJ5PfnThKc3/Bm/IHbNrXy3k5iwksBy95f24c0uja0LDO1A27vQ6gnnr1BdNskTzrJsEqnuu0671zex14x7Aflfth05M0TVaIW54IMJ/e1pSbmaLlQEFJvnVJRvb8cftHGBcvH94GV89+xOqqlkGFSm7ELjcyShuZi4MoaOZi86ob6vkvwSbfFL7U8w1j36Qz9vBZ5e6dVK1AkkvJkKKxm2RL3uVLeDz1HIBV4yGnluVuVI7vfc09O9tfUuzg2KojVP9MF7dISfX3h3Fttx9E6xnLcaYdZmgzc49XlfSfMuHsREQMGT4NAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEl7paveOHylyyRXGVKtozPBzrcu8xkDidxcynB+u1Q=;
 b=m5vS1PosSG5y/OZasLOJ1WDOz+c7h1LdMsDsyGjxguwBNbNsfGqEwJU4BOIxGJ6YN7HqYZdG8W53ifESZpa4ReMl9kALRYYsBGVDpg9V+UQJ3UGYvAsm/vnLYuvgHCvu+TtaiBt007VlGN5SeBPX21wiFBvpKduT64+c4pA0XgbU3j83RcJpuiIEGG92kL1zqkG4K3767PeW4IO1YN3i84EYPShQPnN4ODOC6ELen/X9vkbl9YwqS478+ClGRMSqKgBTSBpjVvkHX4zzJGbinXTQWMozTPMiFY2GM1Pf+DlGA7S8MMLPbVxOHbrxo66llKjCJRBNg6dtrjG2bzThZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEl7paveOHylyyRXGVKtozPBzrcu8xkDidxcynB+u1Q=;
 b=Fv/Upo97xxwZfcJg9/oeU1OyEKf7gEV26hSI0fFmiveAeEM+JJM4FRH9SM3UNzUtp/2Uj0ryC5L7KdAwvorUedqNgw9zLkQ3KWKc3IJO4lzYM7xFjryn4Iw/08gg4yPW5m6An9vZPA8vb3WiYx6kshx4afrsPc+JEbSAns4zosdhp4YscVMb7zW4TKQN2wi1tCKF1HSj0krQ+hKbr5bmm76d59UqKppFtYgqAPz2zLGwUFiil8hcenryz/7R6tWFE9ZCyJkiMwXf3FANze8IwFVxeLSwyv2Jtuz3SuVjzWl6QQLZGc4V34Cv3XI0Cu1Ae3beAgatprZ7STiHB6wWRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:39 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:39 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
Date: Tue,  3 Sep 2024 16:38:06 +0800
Message-ID: <20240903083818.3071759-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903083818.3071759-1-link@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e5a525-5a94-4afe-000e-08dccbf43a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n0bbmmjkjKt4uVm/XCez0FN/heKCMx0xc+JjlaHzB6/DrqsP3B4uHnOzrPie?=
 =?us-ascii?Q?OZMu+dm/X7/MfNYWA+LuAuKU1pusLoalZOYivwf/w6Fpre8NBKMx5ruuGLQ1?=
 =?us-ascii?Q?KTWCTDecNBeimKFjmJLYAELIRHZ1UjOs9CiB8bAucBE7OYEO6IM5yH/2Q/HX?=
 =?us-ascii?Q?xkonAYMZTZ5/8CtlCopSjw6wQK1DszJLgxEukJ5WUJV7Da5yGnM5uZVRSvD4?=
 =?us-ascii?Q?4h4P1JdEHX/KLEVAUSj4FEkp6pu2g7QHLwjcr+95yEdkV48Dq5fUpyUAvk/A?=
 =?us-ascii?Q?6fv7seug9kXLOMl9yu9RKgE34y04zWUyMgFTTCRh7cJtJ7pVIV9bNCSgDFb4?=
 =?us-ascii?Q?n1/hfVZdgk3gKh5NQeqaQuX9epFRQQQOGIeITCUWLs123T+wJfjxL9B2YHHs?=
 =?us-ascii?Q?rYd6L3dk1HqkpzTeUEv6QgkQ+6a0/F+P15ivXPnYevUmrJnhR3fkQmsN+lfw?=
 =?us-ascii?Q?BfNzb4TA7pXiVGwYnZCjn5cftepsLuS1G5Dlg0684WMeOI6PYVk6v3hIfkXO?=
 =?us-ascii?Q?nu2B4K+M7M29CBixWR73QZ8UGbsS0s+nMKl8VKnAMPYCs85lcq+8jCG7XHAr?=
 =?us-ascii?Q?9bADJqeZCcCnB28B1zqwwU7wMrQ+8jHOXJgvk2GpqYNHP4E4K3ubqnm+axJo?=
 =?us-ascii?Q?xmRUL+QVI+ljfCpZSF79pihv800s8a7WLhJdN/PO9VXUutWMo7KD0qLE0Gii?=
 =?us-ascii?Q?jsVqNoM6n49JD7WJ/ZW/FCtODmCrt6T/o1XXgM0gpT7hOWPcR3O0KNCJO2WT?=
 =?us-ascii?Q?ucGufIdsQ1n1e464VGZgUe4sxYpo8+NmoWHDNnfQtjHT+Gjxnr8F6SKQTKe1?=
 =?us-ascii?Q?Ex44L+3rAI7XDjFqcaymrAjCc13RXi2uAlttnWRYEtgVQYBWxzhH0Qk6y6Hn?=
 =?us-ascii?Q?Hi+kzA+RaensqhV/tXFi7iD4tc3FXuUJADMmR3bah+e6OfkyiU+aEK9vECv7?=
 =?us-ascii?Q?OWMRv+2VADa5E5gkgeEsTA+BY055FlvkhZZy4vMCWiZl7Juc+Ex6ZpzZtaCq?=
 =?us-ascii?Q?af65aB8H1khkKX6Ov7hpD2un9gnRGbHf3Vb6GOBpWgCoB4HirdXh8FN0sbH8?=
 =?us-ascii?Q?B/J3QV38UDFemskhR3hGU+ttNd2Be433K5tHk7o4nGzTNniYy01FdO+eFgNA?=
 =?us-ascii?Q?ZsbokjQ+x6V556U68vmhz3DnlIGdKEkDAwyuOsvZVfSqb6WophitY4WzpAnX?=
 =?us-ascii?Q?SqUzsXsxSANHnDgWkhJ1JWV3N9UpN0M99kCVVpnLfsuxmcvuTrLrotPsgfbU?=
 =?us-ascii?Q?Os/Wl0coR+i6tN37EfE3OB5tGzaQgw0GpU6wZh0TrHSBMYUuGleoqu9r9BOa?=
 =?us-ascii?Q?ssauvK0Wji8U8XTSJd2dhR28VE+J72qkfEejIjWnDXIquF3za07ODtPZ3WRo?=
 =?us-ascii?Q?YNjuDCf7eNTOJz5H4sYoc8zvSR36F6LZ3J6UGx0TB+P3vjqcRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FjlB/p7g7cEDaiVo6iRrh7piPy6QMGpL3o1N//x1MiHckANIDwj/KRShFWB?=
 =?us-ascii?Q?9UlfVH6IKYzKxuQY2dMkMZ9uM3CXgXHjDjPHsgKLh+jlcLOBAFO0S+FWXnR+?=
 =?us-ascii?Q?YhTQv5c+pN5e+xNx0r0V6a+/V854c+EP8H/3ydlmyWmaGzZgkWiGcTO+LtNL?=
 =?us-ascii?Q?E8ddp5tg6PBx6L7inHqLW7Z7HXoWU4s785eaPHzDdNwLKHDMbkS49XCAp9y/?=
 =?us-ascii?Q?QbV+F8B2+7T4d3GXZ/hjkMnRNeu1Vn3GvMEiSPRuisNtMKOjTUJZm76RmiDM?=
 =?us-ascii?Q?pTV+i6ufSBTSEfsIpngOMSISQsw3xWGyf3+nJ8H27GSMhGOQ2TtCM3QoY2xH?=
 =?us-ascii?Q?nybeJGx3e6THpIoi5Jwhxxm75S9zKxhbbE9nkBOQ2dypGQIN5YmiQpaaFabS?=
 =?us-ascii?Q?piQAj2G7UtpJlAJoZNfzZIYv/Jm/Ge4F4pekURLOu0JmEfyX5KOSnwEfkwHF?=
 =?us-ascii?Q?ceqiZFgM/E7lhWi9Udgwx2IkNruG48osmHEDihLgxV3fp13Yyli74HW0MdVy?=
 =?us-ascii?Q?Xor+aix38TrVir2E2iQxGPk5KhqjTDoqO3ifYOHd3P7ghNEWNS+BPqwuXcXg?=
 =?us-ascii?Q?N1gluf8r2rO4ftkTHukThtyVvVCM9JSxQd6wJnzwcHKGiyRTrUKuGAWdGxfh?=
 =?us-ascii?Q?GhFJXbQnol+YezCvGnUaBbSDXLH+Es04onBaUc4FX2fT4P+nXm2s0WCYam0o?=
 =?us-ascii?Q?JB9+XZYInA3lfhr6wU72P9FHrjqbnCw+PT7sYMWApB/8Wu/FKjSWjqkrmoAY?=
 =?us-ascii?Q?EbYw1SWs+gE+JgKfsIEVf89SVMUUfha1CDYij451f+BC05B7EOrE8X3lSZFd?=
 =?us-ascii?Q?2GtNd7othV5o+xw7ZJTT60hNyOEeSdTjncTc6II7sd0nhjrtEpW4sCthh/Ne?=
 =?us-ascii?Q?Bnft/Kn0ucO2lxYizAU5+EkqMOjaFXiLzUI1+0nbGwY6y4PA64PlFW8VMeH7?=
 =?us-ascii?Q?vSQfEKI5/v89c9Q3q08rzqjIrny5daNnVvFV+0IolCAaxJh6geSSXqzcznYP?=
 =?us-ascii?Q?ilxuz3LOotWNxa1HYzatVyg18W3RPzW1Rd7RSk/lUtS23+29xbja/2sfVwNc?=
 =?us-ascii?Q?x0bcceGWhvnkewMoqbZTUwQ0mtjQHFHsb6vGzSGSOY5Zuc61fRKl9iJ7ek1Q?=
 =?us-ascii?Q?Z5pwJHTElwnguMhdR6zCQeAlh+3Aiuoa9f4SxAIsBCquthnm2Urw6bay21KH?=
 =?us-ascii?Q?sWBC1Lhwq1tMarwex0mFwqtCKWXtN8CGyHXaSCXPh7sCf6M53H5NgLlTixoU?=
 =?us-ascii?Q?8kF4MVjC24ZBOr0SpdEeKpwKeEfzlYn9mxRbq91MevXqm4KmkfODFnVve7SP?=
 =?us-ascii?Q?V6KMrCmtpO9pzlJE1pOjOzZ7Dzs+udUkKT6WzF32AMaX6osZMZFrhzfAe1oi?=
 =?us-ascii?Q?x7CuPpjKPWyPyVp5Cc+i6WlnRKiGAcIm25l3ZxKvRAFC/K4gNxKU0skuBBI/?=
 =?us-ascii?Q?Y94qd0u3MsUl9jBw9mSKagGIJmTG+Yl9sk/5O+vt/inYJdhzcNBOjd4OcEDS?=
 =?us-ascii?Q?BFm0dEtArt1v17vHy0GmfEvuX+R5SM9pvaJg84i3dJ5Y7J0i/0rKzzSyS7yw?=
 =?us-ascii?Q?8jFO8XdZBS1AhSVlj95arzl9enF0d/J0ENXnlBXA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e5a525-5a94-4afe-000e-08dccbf43a70
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:39.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB1RjU6gXPuOyOclPsR25n9UHFNZwnzI/YocektBUbcXEcbGhldYC5C3PuniuW5pi2OTVMqmHNl2fXu2N52rdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
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

This patch first the pfn into page table, and then pre-fault each pfn
into vma, when first access. Should know, if anything wrong when
pre-fault, will not report it's error, else, report when task access it
at the first time.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..0a8c231a36e1 100644
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
@@ -51,7 +52,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
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
+		if (WARN_ON(pgoff >= ubuf->pagecount))
+			break;
+
+		pfn = folio_pfn(ubuf->folios[pgoff]);
+
+		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+
+		/**
+		 * If something wrong, due to this vm fault success,
+		 * do not report in here, report only when true access
+		 * this addr.
+		 * So, don't update ret here, just break.
+		 */
+		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
+			break;
+	}
+
+	return ret;
 }
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
-- 
2.45.2

