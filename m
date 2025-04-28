Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E3A9E9A1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5B10E3C0;
	Mon, 28 Apr 2025 07:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jZVxGIjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011025.outbound.protection.outlook.com [52.101.129.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BF610E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioFguwV37/FABB2LOaI06/CaB7CaqUNQnbnisgG3eEBWueFT0c3VBe7QwpgGOZlUllu2y81LrBbF0wwiPhiOubN68fo3xXzdHPOH1xD4WBNbyOGcN7Yonu5V8kTTjobnmZ2k/Aao0H3GhQfXxankxpJMYZS9x/bpYCRqdOfGzM8rhS9zUM/IUubTb8pH1FSfVsW0qa8mt3vVauL0hu0qJ5QmdoQMHe8EBwHGLX5yrzjJPFfpXOvmkAV9vtNyUB/DN+dcaOwx+UweVzdL3695Wg5p3VnhKZq4oiVPLm1hrcokQ3o7cUNScOhVGWvFiylAnAEdyQwNc28sUES8o8A9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U46C7+zfXZfeRyQIoCGJYfchuHBaajWgN5LgDUiKkwU=;
 b=c3NhS+KJ2Yy7mxyq8qWknx3wsQukS8dq8Or3Yjrv3FcXQRGqeWmISXjRkg7MYwi1CkwAyk/3oWsa/lwy7V+fvsf0kY/eDfTulBjzzkhrsmOLcvCTgfjCnPp8UPLkdEaWALonghmlsew4r7BfF2fZ+ogik0ZdM4W256rf9PKyQ8DCapVH2W78XaY4L1/unKxnqQAciIVW3+v3lRnAgZoatMpJweeBzQ3egn5Who0MG8lp6CBfFhLd2vRcOsHufme0K62cRi3xnrib9zcZhVnxPKfDm+yqplsLUp9QEOys2qnI+kr5KvZgyLzqIlCuHEB61diyPsuMSTSVqkxZwlsbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U46C7+zfXZfeRyQIoCGJYfchuHBaajWgN5LgDUiKkwU=;
 b=jZVxGIjL7RGvu/Yr2cmuIlK1Ft96J1wuBWj18KKLI4x6ogLayrQ2X8v7z6mLeHF9VHa4OFnTrqVqVpjCpjqurqNhwLkeShYMXnhwhy9Y6TRPhrO1DXXDCBr8BwPWciZlxAQKxgBJrzIwf46f71AFFBCHT2Vt9HvLT14GDpWwhvWBgStCiTPm2khKTgMsQHR7lSWri/sHZGyCyW7jIWFL5wTLvDgC3TShjBnWE58dEla3vcUwU/peLnaHSAOLv5P2tldGhHWDgYxGmC4vZfFE6FCC4SkweaKP3LsOQoWm0b/KFMzyVSG0InnphecHylND950Jjj8oiNt/eQZJ2x7dww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB7093.apcprd06.prod.outlook.com (2603:1096:405:ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:40:51 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:40:50 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: [PATCH v2 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Date: Mon, 28 Apr 2025 15:38:29 +0800
Message-ID: <20250428073831.19942-2-link@vivo.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428073831.19942-1-link@vivo.com>
References: <20250428073831.19942-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdcdce9-b8cb-41fe-9d3c-08dd8627ff9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xK25BAjJj4fRW7ZKcZMupvU3BwrGwMYrJiBjDh6vXKjK0wOr+9bQDj3PIi/Q?=
 =?us-ascii?Q?d7i6mmh6pU6mUGgrtPDrS9V7R/9qlvzd61ydCf4kVCX6g4b3bvRFwWm4K8L+?=
 =?us-ascii?Q?8HbwrtJBsq9A+UONvF0JlNmnG3Kyxqx5ilBVuKN6UAn649i41zzfU4HUhWRx?=
 =?us-ascii?Q?u/Mj6QHEtAOw7dyfXizQXggCkBW1fn/PPDbmpO1br9uRdT3WOt4BugsmjEMX?=
 =?us-ascii?Q?F8ooRKIR92PPd265JKlvcFNs+Tfyth3L4IYNW4tYuVWQFvtJ5AfRNg9v6Cz+?=
 =?us-ascii?Q?LEmy8h7PU61bUtPRxZJ3zFhPkYChqs4JPz1pEggfEixfSVfJ6wf6SvGthsW4?=
 =?us-ascii?Q?XfMcabKa7P/9NomsxJ7/4UfI1Lr2cwaWTlTBz8921jEPv9STEnbO7vwhl604?=
 =?us-ascii?Q?SpSlOpXHS8IlNRDbLHnSNByQgvmZ4nQY6dSfiDmnvEJy+6CrnxUtM7MbbSm8?=
 =?us-ascii?Q?LpskG4Fp9oR+TVy4G6wPnJ5vtJHFpfJIIaV4ylkvqVRfbvCRHIbbVNf3dTxQ?=
 =?us-ascii?Q?er+FXrRtEzFjGvX0BwRn8fqZGIpILUdDzpo6EB3LrliFWMIjzS2WEi5ZTVGH?=
 =?us-ascii?Q?I94MDJx/gELpPuZ2DuMbnfekZW+jdeazMGr5r2+s+27kDkq7UAO2REmyZdPc?=
 =?us-ascii?Q?1MdKNcYzH65rGsEsFn+oSaeGvGcr8BaWZgOz+DEytCh92yKU6wK1tll1WYkl?=
 =?us-ascii?Q?i/7strCIxqbumbe3f+ZqgZFHEaeG0GaghNmHnQaF0ynjR8P734h11z2RQ2IF?=
 =?us-ascii?Q?LrGyHjppKM0dQJ3IFZA2034aPrJ4RTTLwGellzty4jgfwmzS9NFjMskD6yf1?=
 =?us-ascii?Q?lZEkHikATTnAmbbvJVkje4JYCuv1xhR1mnZFSgxsi50uscFKNAk+YWL/gS+Q?=
 =?us-ascii?Q?GwTAov/LaeY8papoW1lhfQzTIyFLjisoYmgJM1TKocHCxWHi08my0VHYJrrY?=
 =?us-ascii?Q?3due1I70gCkcBwtQLvbjgROXEo7UglwEcJJNZ9hP3Rd7LinV5xf7NiNaeYmv?=
 =?us-ascii?Q?49rF7AICaUA2xGhuD0VHvTNSQZdxNdqi+eAlivCuOHkeXZRyJsbQr9i/9yIX?=
 =?us-ascii?Q?b9e6GlMDW5Qigh2vL603b9hz6TN8U9wDoD9TmUOW/TmI8OEp59fJiCmqpS4Z?=
 =?us-ascii?Q?hlLwxEQY6m99aM1cG15y+Hejp2t42MPsRKulXY7nJcRrJXPkYvtXgUgQghuv?=
 =?us-ascii?Q?f4gjq83y9AZVBmgrXgXG9QF1alPpbypdn6Toj9wOIB+tRtvg59kFVzWM1/Lt?=
 =?us-ascii?Q?Z1sI0iLSvFDmX5DPGGEm8vHwwhLpzEz7YmaWMRIsWZ57D6CeP1vc1DNc/YUS?=
 =?us-ascii?Q?1JZfVAXatWsja3XLIt7mZ/zdHq4ey3esEIQvcnzbpwo82lZq/0S5/AbH1O0U?=
 =?us-ascii?Q?dYWZPneADpIC8YRl2lXiFrgMAnGNI1CWg0zq3IVteEAwS+42CcjuCdJLIkUX?=
 =?us-ascii?Q?d4xZEbfVqHMff8ZMq3aCS19706R39WL/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fllX+KemW/XwtT97Se7VvtRtaLx8anTU66iwXRl8V7daP0ee4AWrqgXNyn0W?=
 =?us-ascii?Q?ybzKQq0tspe6ElrtfaG9NlaR8UeSJjM2kPr7AQHz+cbhpgY7acRNWzYkwowl?=
 =?us-ascii?Q?wNul2RHAxtqFg4SDbK/1OciqWdyL9z7pWl2jvfnN2cguA24qJD84OQ5ODBwP?=
 =?us-ascii?Q?ws36iWmlNzxafZ2KC0RZV10VE3G7Q2SUxVYGIchqKOE40yMuSu460rAmYKMD?=
 =?us-ascii?Q?NImjGMxJ8X1FFwdBqNvGDOKgHCVO0mc1fwcNE3Kr17kqyZhMz7x8fSXMQJNq?=
 =?us-ascii?Q?zhiZd7pft9wLnVjZuIHaI2oBCTQB/jAnY2iYumMtLUI9gu+Q+GxnqTXTwTWM?=
 =?us-ascii?Q?tO0MRpLP/sfFvxrwoO7Xezyn6/u+BZNPbqkOiMZSinYp8mmty3ifoDpQi0Qt?=
 =?us-ascii?Q?VH5c7cb2jJlw3O5jcdLcXeAl6RcRvAgN3R02kyv8bA29V7YhbNFMw4tHWhlz?=
 =?us-ascii?Q?98VgcWrYoaZoUGAmuoMGL11XyvmLJbH+92tcmbk+zn1IQNdsC9O4vnX/PiHi?=
 =?us-ascii?Q?8phVn6fofC+T5V/PI1ZicH9EgzWxzOEqJybtTSnupJTMe69jxl8joILw4vNC?=
 =?us-ascii?Q?o2RDemyalJz1C2n2GjDb8LUkv6G71l74Or92rZy/AziedXWdHCU+uCwGZsWx?=
 =?us-ascii?Q?0NuqKLLlQI9gO8j0asK8wnb+NSVOvLcRwLXHE0KJ601mc146pdYkzl0IVuHt?=
 =?us-ascii?Q?KgKmQ5cQRMHQo82frks27/y65PnYN1ZsjjPv5Nh9v7vP9qtauXMV6dGo51PL?=
 =?us-ascii?Q?RMN7+b9um88hMdE52LqYw9SIzRr7xsrW4n+WtF1QNrTbSQJF8IEtksXdE3Jp?=
 =?us-ascii?Q?WoUST10UAl9IjkufGl72fxtIu95URD7QhFtWPAk/ZFKrN/gVL+edU19jPuXy?=
 =?us-ascii?Q?TKv+8YZ0u9QqiQOriMi2ipD53PRHCWruEYh17cHVM717ecdqxGPZMc93H53z?=
 =?us-ascii?Q?iI0AshcpoM339lA6Fd1sRW7zkEMmgv84/dtbaMMZm0Dz/yozZY0kP03POsaa?=
 =?us-ascii?Q?M1bVqyv7v/KuSDgjKSjDThY+pxeF+jJqKV7HO7t3ygizTUl2pAg3dWr0GHzA?=
 =?us-ascii?Q?bRJDqwpwqmlnYyDcm5hJtbiVBNaz2CY8wufd4GX77FeSllWNfSYjVyUFYT3G?=
 =?us-ascii?Q?fidT9E2bIY5XQyRWTsPZtYYogZWQjcTbtpxrHOvI1SECQwGGXTplWF7FMM9K?=
 =?us-ascii?Q?UQZGFZzk8m+HGq6+FNER6pcyMcu9YsJnTblQVsKaDKE5GWXlIgZ9iHVhMUOl?=
 =?us-ascii?Q?LzHmGqAfIBOAujSDhMT3VOqpSew4GR3878pJyENa4F4QlZKJvOVteVcH2pDO?=
 =?us-ascii?Q?wWjG9v6ytt6Ogn8VIEw2cpkBar1PgP+5tifmyjHil3zEsxm4DWLsusnMWG87?=
 =?us-ascii?Q?R9LwpQVTc9V5xxzhLvPlWvuCaPd3NhrGxYUJBQwqHUQ+vtymNs0W5Z8so+85?=
 =?us-ascii?Q?6YuDVA0NRA8KRopN0+dZECL3KTyqz6kMR3KZVwCCDgR4yAyCz2qcACwzPr+z?=
 =?us-ascii?Q?66W19yyYmrL/DEdktZDZgC2TsLkDH/bdayz8XP9phojxtc3hE4XI72tqFq5U?=
 =?us-ascii?Q?FXMyhpAv8h7GsNe3Dxee/pjSLGiLH+gwXMLa1ZiY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdcdce9-b8cb-41fe-9d3c-08dd8627ff9a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:40:50.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WsZRhZNbRCS4eOFMVoahYTMG8oKTbLR6une30jWqOWpnbSY3OvKTHn653HSyNhY7VkRrvmXH6KcGurVO+nxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7093
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

This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.

We cannot use vmap_pfn() in vmap_udmabuf() as it would fail the pfn_valid()
check in vmap_pfn_apply(). This is because vmap_pfn() is intended to be
used for mapping non-struct-page memory such as PCIe BARs. Since, udmabuf
mostly works with pages/folios backed by shmem/hugetlbfs/THP, vmap_pfn()
is not the right tool or API to invoke for implementing vmap.

Signed-off-by: Huan Yang <link@vivo.com>
Suggested-by: Kasireddy, Vivek <vivek.kasireddy@intel.com>
Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca8
---
 drivers/dma-buf/Kconfig   |  1 -
 drivers/dma-buf/udmabuf.c | 22 +++++++---------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fee04fdb0822..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,7 +36,6 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
-	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..79845565089d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	unsigned long *pfns;
+	struct page **pages;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	/**
-	 * HVO may free tail pages, so just use pfn to map each folio
-	 * into vmalloc area.
-	 */
-	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
-	if (!pfns)
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++) {
-		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
-
-		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
-		pfns[pg] = pfn;
-	}
+	for (pg = 0; pg < ubuf->pagecount; pg++)
+		pages[pg] = &ubuf->folios[pg]->page;
 
-	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
-	kvfree(pfns);
+	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.48.1

