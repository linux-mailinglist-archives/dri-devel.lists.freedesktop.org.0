Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE87971338
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB79B10E34D;
	Mon,  9 Sep 2024 09:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bN0sBakD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9A510E34B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4WKhs7tbh27ZdL6TA8+CcO3DSRPJ/jGFBI2EpIUlkfI1AGSJMxsiEuq1NgXOxCLVtiw1VrgZgaa4oPZyUpkpmwAFNuTUB8/ofAOtReFoCjXIsrela2SW/7qwCbw0vk3CQkjg1HK4iTN+R48kkv905xY4xNfQ15K+3xrKtlnP86m0dglkHs6RFrQOFCcLE1nGff9ihZYmM3IemcmUHDusoyBhnfxt/erfwnYwY0GMW1j7z9MUfhCjQX7T4nuknKwwuvylZFxe4b8Y0aRWzrVH6dcrLIL3nVGWDV7H7rw3PcTUh3TpUodBKU8kvV1DYdJeOZMbsYs6ctmmphugeGzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jP3zJl5GHA6Cli3QdnQ25Nfb1coEB05mLki2geoKI9I=;
 b=dH6ahMdZZUiDXPP4TAkjhWctAy4e5JiQ668MJ5PdJuoSLLMdq7cE/O5wUD8kLmD6ozXh1j/Sic2+1tneDv0uaJtBUvF/aK24ZDOq2xsu5Jf7RdBGVMHKpK15zqw3rVdoYK3lgPvoaKESSgcdPkF/svI/0wIR/NlKAPvC+7ogMTlOrib4hazphxcFWT1z8zjUpo7PgULpHM8/L5vJEoQCTNkrUwaYPcOv+ng1IarquWFDExLUGIULGPvzsuOngiD7B+4xiyU2zhVBnEcI6V72L2DgvCW4Pv0WVrLbG66lve6KXvjTq9tWNCJZQ32Gja2nQjrEihS89rhumEAlGFZw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jP3zJl5GHA6Cli3QdnQ25Nfb1coEB05mLki2geoKI9I=;
 b=bN0sBakD72MFvLD7r6soltjAy5Ftzx29x/XjdMbex0lMGCvRl58GW1OEB7vM4eSQgfcV+v7aeTMvxQhPD3RjOTjMVl4Slde1+s4lQoAONP5JyrnhbIY/PnI3LKpLD2JS0WS+aO/i6p8XXge1VKVx0OnlZLidFceuGSA9ETzgi64a21UwqPnLP7+D4dZwI0wb5pTYUCwx5mk1KlJuZkeMDL1b/MLOarWN7yh9HSIinYd/6kamDiIKRH4hL9w2nY0BmjDV7TRIL1rUiUoNsGgkWXddvyshMN7KC9OXaDlFu2JrHXVmCTCz06n3unIW3eBUh7zCpIQ378O2cZaiokZedA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:15 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:15 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
Date: Mon,  9 Sep 2024 17:18:41 +0800
Message-ID: <20240909091851.1165742-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: f636a370-eadf-4e9f-d312-08dcd0b07881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncbFvZsOtIhqiaE4UJ2/MIJI2LFlEqeg6PRnjohZzySq+9K5eImOEBfdt/vr?=
 =?us-ascii?Q?1y7WOqXbWlKN/vCeYf6ZBha7rIlJAXThtBYFMYHPm/s9MkI+Su330K8zm4xh?=
 =?us-ascii?Q?9gbHd6hgephZmKAmD+hIJTazZO4ujWxs93Jz1XXniVZqgO6djThY2xY3E8FP?=
 =?us-ascii?Q?1lex+32MOwMH+RWhUTXgrgf5IJ/KHhSYq54m6EEXEi7F0b3L/bcOP8AU/Ocr?=
 =?us-ascii?Q?bIJSqpIKWTL57NSWYpXoDOgcUNXWtClbCGRMsfcfzIkKysbd6hoXK9zUcrkE?=
 =?us-ascii?Q?CKDbz1+1aIbcZB7w9pQor67slm5CEh4vYBUATruJ2hHXRYKF2LhzhpKcizTx?=
 =?us-ascii?Q?+yC/mbQMtMJ0eWBiex6eJSQNeGiUw9qKrv40JiUbzMIhavevEt2oQKj95T0x?=
 =?us-ascii?Q?IWjN9kF6brh3n+WUq/u9SF281b+50xBwYsoTyyY9VlJVITCSsJu/BjQ738to?=
 =?us-ascii?Q?/iD0sOzliz77erJJuKJyQ1zUE4yzm5d/CyePPTt/VcNolD1CLPjTmPM1pkEL?=
 =?us-ascii?Q?qshczHjiwX3SYDcGt7wEfffTYleticfWFaF6DuGpz2mFNtQuOgEFJMVCTSSR?=
 =?us-ascii?Q?b1LNfGYeOmPmzKKyALm+QJDQ67+tfJhZkQoE+RMQEgd9/1+QsyBN49BegGM3?=
 =?us-ascii?Q?6JxT4x7UbRrR1jTqSffMKMLjnesfLtg6YE/YVFnweBjy2OIZsB6smrdJlQx2?=
 =?us-ascii?Q?TFAoQG9oF/UL5ZGRuMdhl/otUnETBHGOLuijDXcLNAMxZO6G7f1WkHctstji?=
 =?us-ascii?Q?IdHXMIoHV2qGb/goh7qpvy+c79uDkb4YK3GfmP1V6m22kkyS+Lgp3ABc+wVT?=
 =?us-ascii?Q?BRgHN8Va1L17EFbpbUpnR+k1+pwxqiHA5L4V52PwOjIwUcmG42Mu6BKGFF5P?=
 =?us-ascii?Q?1Behz26b0BHoJdTqKtyQ9U3xXyeIKBcJajB2swA1p3tpkWEZEi+H5dX/cRm+?=
 =?us-ascii?Q?Ps1K5QMXtbl/YmE4WUOQelEJ18pD20Il8LQND0sTMJV8jhgbrVjLiGNHIJpv?=
 =?us-ascii?Q?YeJNH8AdIq932hqDotyqz/pXjRjkRlW05ERFPBMCYDUFwq48mQN7WOyJkjRH?=
 =?us-ascii?Q?XQhRE/f8LsrR7hmgGDVOE5CsaNiPZMymjwkSECDM0xjkZYefLVBXsr7FJs2X?=
 =?us-ascii?Q?5awd2QqeCYTlSB5oeDbngc1OS8wtndaeWvdu2+NVmlkGwKKVzDtR9t6sywPp?=
 =?us-ascii?Q?eEJoVI2snCB+E+fJoYcdWmTVM4UfCnOhrrPv8IVV2xCgJESxQmIKxQfpTZA4?=
 =?us-ascii?Q?zST7a3QtEdfFUfAoVGSJrTaypK+wYXNayNc/8BWPCWXb+nKPV2IO+hwN79ke?=
 =?us-ascii?Q?kj9HHI+NkT5/loz08Q3f6rzXZcXgmGFBiSntAMB/nkD2ErRjwxui8AgSAZu8?=
 =?us-ascii?Q?4tyRxecOoc+De0bG5raPXQKZUfl7Pdz9unxKs0FjB+M6XGWKJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9l56f+gIFrCu+fQHxbv2Sy+F7exUClviXpkSFQlqGQaQn0IpqcW9SkAJ8Dg?=
 =?us-ascii?Q?B5XfekTUMH3thJ31/i4Y3NotwUCkgLbqtA/gdCBCICdcZZRuAGaeNusxC39R?=
 =?us-ascii?Q?TDVk4KHiBXv9F9fC5JGi1aMBO32HxxkIjY/pSEI4v7rkoq8i1BG5fcx+3AYv?=
 =?us-ascii?Q?JXkuGu7mXJfydDBFEU0TulSjj3xQbok0xD9E5B8u39eIxWIaohxxE6Tchpxk?=
 =?us-ascii?Q?SDGKN5rZ4/e9lS/IWOtQkd7wkoLRRVyGXoBZHsp14S0b/YqEC6ev1mnXDf2g?=
 =?us-ascii?Q?V0YcaHDwJmE6jbSoARG6GeStwW9ct0XC2mzin/t3EwaQ8tetCC6kqD5pTvVf?=
 =?us-ascii?Q?sJNdVvxhyvWlQDfII34AzcpPwEgdRzmeaJppiz4QYASbcoVi4GpwWFQWo6oy?=
 =?us-ascii?Q?ypktt1IMRBvmF1wpGnR4sjmrY7wy4+4/UiEpLcsQJ5Ph4zdPZ74CF6JCD4b9?=
 =?us-ascii?Q?xxnu+MoGbPSr4M76QDIWcUtoYF+k3vvtHjW2Y0W5IsN4f0lHX+a6wkjEv37Y?=
 =?us-ascii?Q?v/XNCxAyNrBOsveBpXF8vHao7HJ07FRyn9Z4Z9tmbZeXrkNK01lFkFSlxr52?=
 =?us-ascii?Q?VOKeeBgb1K5Sp86bP0/oXXPk6i7538kgr8h6ubgg2xmCoTiAmWwzWjs9cDv+?=
 =?us-ascii?Q?BnbCxVLMBwEve/QloTFw1OwlriWBpeWNHu5EqEcNqYhA4BHDXh5Ymoc9AO/K?=
 =?us-ascii?Q?Gj9251su3y2/Z/CKTZj9GOki1raXart3r2Fy+Yl4hKqVn5oUyagKCkOcVpvM?=
 =?us-ascii?Q?Z0+nDTizL0Mwy6GBSWMVudybMfbVrhjPiMINlMOFgi6WFEsSmUfC/VFS53Ir?=
 =?us-ascii?Q?eBVuZFkReBtnOQJlKoMawcqUtfddBkK6Q6FvBZhe0UHTWbm8Dji2lb22gZCb?=
 =?us-ascii?Q?kpeo9H28gUV9+pdd7UHrqTHTs6hxE4iDLWXbqU7rpVnZncPFtZb/7vgyXvUO?=
 =?us-ascii?Q?zFvcEO9Gt/VcUcZNEq0Cltiewljg5hQ5lhYIIlcdrk+lDTDIuczLdLw6dAYk?=
 =?us-ascii?Q?kcBpFuBqly1conQr6KJkqZkJmvbG/x2k3W/l48hsMi2x31Lel3zxabVt5/ll?=
 =?us-ascii?Q?R+DpVZTQc0DDJjhStqNzuja4LBODPhdAvyqM2BRmK1EBDWMmUloJfaTtlnEt?=
 =?us-ascii?Q?PhvzYFpu2ep4He2YHcEyz/ygkbkZjXaZjOd6RWEPZD48b6K+uoO0VeEhJpos?=
 =?us-ascii?Q?h52/uHmHpwIopG+nPKgjrK98pq3Ve3vun3cVaiB2duU3X0vccay/G0sj+iLJ?=
 =?us-ascii?Q?FWrdYMzauCQ/mHbK5Pa3X53kdPqh+sDMM8dmbKnUQpzQVmb1W7wVQbDonxo8?=
 =?us-ascii?Q?HZS8kA2szms2D8CRKoxdpano3UwzG+JDs29pJz0PcS099Q3SLUrbetcJ98ay?=
 =?us-ascii?Q?LJ5ROIZiFDnODEw7DlZbhAg/SuRVLjXzxBA1tflnOIutkofxnSzNRd6zki5i?=
 =?us-ascii?Q?QtC2SfE7gn0baQGrd4jjkI+Zp78j0GTEM2AMHzGmTAu2movIWyx3oPE1Pu2v?=
 =?us-ascii?Q?e2D0uqD1KdJWKK0l7T4an6k4DP15WEb1xWL10wRmIjltUzXRQac18BDBNnmH?=
 =?us-ascii?Q?+/yKZWH4NaXkFD59OUi1w7+XqZ3gg7x1bs9BZVai?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f636a370-eadf-4e9f-d312-08dcd0b07881
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:13.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rwwh51eqsbp2WVyN8VC/IUoaB4t+uHSf7+wOiIpWT+wGVpPhrE6v8cowix6ITN2y68WaupWLzQ6fc7gOdLTJcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6292
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

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
so, we can't use page array to map, instead, use pfn array.

By this, we removed page usage in udmabuf totally.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/Kconfig   |  1 +
 drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fee04fdb0822 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,6 +36,7 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
+	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index ba9dbc7caf71..aa182a9dcdfa 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -103,21 +103,29 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
+	unsigned long *pfns;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
+	/**
+	 * HVO may free tail pages, so just use pfn to map each folio
+	 * into vmalloc area.
+	 */
+	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
 
-	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kvfree(pages);
+		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
+		pfns[pg] = pfn;
+	}
+
+	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
+	kvfree(pfns);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.45.2

