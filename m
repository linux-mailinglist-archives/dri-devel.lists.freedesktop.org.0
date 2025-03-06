Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D416A541CF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1355010E8F5;
	Thu,  6 Mar 2025 04:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I59XWa9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24AA10E8F5;
 Thu,  6 Mar 2025 04:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL69VNVbZuGJI0dZw6xt5QlbfiOBawp9gziVMpKFjB3NW6q1rFeOEs6PnNFPAqfOsvbTf6z3FXFw6Hg5BRnpBGoJ69LWO8bfup86D6tPVt+83XdB5WWixduHN0Jv8G0W2B8uYe+5ivKk+RAUqUwo9IMVMxygORFlEmpNzQl+dW4zBGW6sW/waCLjMnrW02EqGUiJXtV22+HQo+Pzlcr182L4fmmNlXRna8YM84Un1yVFZiEZZ2cwpYLiYifbdRMK2nhnGGRCu8SljfsxZlYe6t9jqeUpKvlkESoJ1NqIHU6tBe4pWSQAbb0PM5cGr2UHf7lkuqzAGtPniVeVnsa/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hQ8nXxEormldPk5Ihmbqhigf0YDwOQEqpFjSZ1wu5I=;
 b=gt+grx6iaXeJspAU5vJWjT+UVygqhSrV54CWrQU9iqS9mz5Tp/bSGfrx8fyZYDUb+SgmaQl73tTXcxngX9PUu58SiMmrKeHG3gYuMAzmgQsGHtQXszk5ajG2N5++6ki1txAjzVKLl5Hu2szkvhDe6ge4QpyRqzqpBDe/4gOmGsxjT1QX88ZtA38VtbMM6eeY3YyE4dnabBQAmw6fW0gZm040UWnwNIsiqACSirAAPS6b4w+sKUd532f1DfXICbgK2XJwirZ7u5/Fs0T7E80Ik7jCfFThPf/7+fQYqquFeRip0FxuDq+oHQgjM4SjcCnpeqY52KtpsJae7gLtgaGjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hQ8nXxEormldPk5Ihmbqhigf0YDwOQEqpFjSZ1wu5I=;
 b=I59XWa9VungJ/LCi9fbhC1T4alEXf6fbvEuO9jql3BPG7d9MWM7/8uXu0euAXQKj9gWK5x2AdJjr/oc9hweIp2dxAN6XwIaL0i8joqRpr8B2llx+PCh9VFK10vnN94FU9J8KIQMTYnt30MWhAdgjZ3kKEQiuKC7CCBWcAYdrpFwW66G6k4IlR0iZtDRh+T0EqlO8az4koYm22GdJcl3vKXFDKZWcLvipgUInl+EWn6I2tM+TQAMCyQVv1skNV8/mnlX2u4HV886gqe8weCR7DSvEsebDZUoj/z5tbpPbgPrfXv+XQWsOmjNILv/VEItfe2kOaNpfzLlURilDQtpS8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:44:12 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:44:12 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 11/11] gpu/drm/nouveau: Add THP migration support
Date: Thu,  6 Mar 2025 15:42:39 +1100
Message-ID: <20250306044239.3874247-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f110281-27d0-46d2-85de-08dd5c698a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4C9B383CHoHhUCFm8mFOeWJWN1K5hxg7+7CJhHkNinYNlkgW/ReSAMxtsNoP?=
 =?us-ascii?Q?xVj41uk4nyw19pFsUSogbMnur2ruoqLFx3xp0BTPEPUgVHSGCm5ruPNRLcgW?=
 =?us-ascii?Q?4+jmpmKJ36eIQcaKVR1eKfG5fnvEe94EDiVEspfyVlRtf0Fzdcoj+K8Gf6Ll?=
 =?us-ascii?Q?BBUJP/IyxPUNdhn6fwwiaMjYTPcQLxsB4O75He1DdWIXP/YfjhiIHZlybl4n?=
 =?us-ascii?Q?sSr0zWxQ7tnbubg8wf6y4SUC2GUw+atSnmrM++3rZfwuCH7XzJhJ96xjrKAc?=
 =?us-ascii?Q?vf/wilb9kuML/PhGI4LikZw520G87bQUZjQRJKJ04AqentKqk0JKlfnaU138?=
 =?us-ascii?Q?dkXZtCGmFqT5739o+tet83vKiW6Lq0/jCtVzvirv1u21eQusr2fis9XHfyQX?=
 =?us-ascii?Q?BYp+0570zUV1rtzHY1biQ8v7aVeiF60i00U3FTacZ8FYTDQK20Y4k8LrIE7r?=
 =?us-ascii?Q?sDYJp3cKDgIXUD4OKDMQvmfu3AW0aFsVOYyaQn9olaNi+6++UXrNR9/DK/yD?=
 =?us-ascii?Q?8Pyuc27vmxryzkn2Scdj2tVQUcGxINeXvYdOGqqbEQOWlDI72xFj1Tp/HgGY?=
 =?us-ascii?Q?i7bDP5BRsxqDfLpEcBDr04HEQWu072FB5SBRgk9U0AHdhn+E9T2NUHA9RQhG?=
 =?us-ascii?Q?M02QllXXYqP9qif4RzpjVAlrR+jwyxD9EBO0Uuf2J4+tmnM0Q0EdgOkrbqwG?=
 =?us-ascii?Q?+6eb4W8mt62g8t8IlBE+9ExnDXlEnrhfOC7M3Mo9/7KQ6MWHFApsba3XkY1W?=
 =?us-ascii?Q?HT4JrCi/p/THwSaRan+3Viw942ST+UOkQFiEzt2QLnsavMF1c7H2Va4sdAi3?=
 =?us-ascii?Q?Ar2n+vCsX39ZsrjanayNb/e05qBPoyIlUDkuu9P7Wwb8Vi20ME5PeMaAmMRf?=
 =?us-ascii?Q?SdpC8XqDkBRaR3WzVxO+o+YhJXT8wCWcQf0i6g4QF2ud/izHgkoCSkTaiLb1?=
 =?us-ascii?Q?nzx+ja7MIbAVLKRPc9mujb0QVV8YQMJavG8KJsLwhO06oSCDkl3+HIa1VBSk?=
 =?us-ascii?Q?uI0ju+MZzkzABEWidOCeFimQXGVb5IjAw5Wqf93gXP02BwPgUgefmapM2ceS?=
 =?us-ascii?Q?BxKqBiepBMsHwdo87pUTsHVlDfU+nHDukNliprUHSVsSgvf9LomprJrj1bkJ?=
 =?us-ascii?Q?R5hDaRbEjkg02L4F1yVJLuNqgPj6r7VNeWKRhP5gK4nsUckiQuSfedvx8ivQ?=
 =?us-ascii?Q?EjzBbx6m03UkQ8T37yzzk0WUaldYbPJSQp3TdxsccELybNuIkp6Qo3pFKHTB?=
 =?us-ascii?Q?doN8fqz2Yw2OcJxAERz2dYpHgol92KqmtvI0f8ka1j0kJYc//P4ZOwnNJeGz?=
 =?us-ascii?Q?5vwZbSBzAbZm2lk/aNcgg+qdZ2gyQfzSHzIJ++FNmeww3/Uk9JvPX9+WCgIJ?=
 =?us-ascii?Q?j71EfY/hoaXy1ETjSMBkLviR9G6H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4swrWtKX/8sQqsXwtfVNOAzWXYNcyNUiTozyC7D9wGCOY67v2LjJyzCP1g84?=
 =?us-ascii?Q?xWa2EQiOHMsOFZFFdvQdZrSuoVC3JiD6//uCkBa+vgsGeIjxwsuTFOWrv7+Y?=
 =?us-ascii?Q?j8agKvjTagtjocl/61bh+ztA8gOBdHKyKwYlZGbp0juMOto0pSfr/3Q4SiDF?=
 =?us-ascii?Q?GfWkj3tPNsvTQKbZA5fGgnSs9Z7ClSqymQWUWuH/gH3f04Elxp0v2KQEszoJ?=
 =?us-ascii?Q?kVLFDOblR3wZkowTDFwR8dTmRLwRd7tMWtShfLgzt/uenVSgp7Jzy+xCB+oU?=
 =?us-ascii?Q?ZFQ+IilceWV8EMg6BcO0UibPH4rlPPsrcTNQB6i+9PwLVRls7ZIC5YFylxhM?=
 =?us-ascii?Q?K0+jHehjGMMXcxOSCTmylyhRegJIQfTOsndlhqow4nlORXEgqxUPXGiNw5H4?=
 =?us-ascii?Q?I5Ev2EHKrbWh354Lt0FgUKQkCHIlJ+2cVV0OXDvktTFr/i7NXEUQJXTnDDK+?=
 =?us-ascii?Q?F4X/DVv1iJbfKuApf2dMkZdoDm7j1ARqrQSzXtfjiVql37xyi0aFdMQ057I9?=
 =?us-ascii?Q?IphTewt7rNLT5GE/tY/yWq+kTVNnIJ7i9cSzEPrIlBHojrtylZld6mh6of9V?=
 =?us-ascii?Q?YjeX7dfagzLZLcub/+0+HDoYWJiOuPvkgA7XcrgLelUwx019c3cY1ifY1p89?=
 =?us-ascii?Q?zsGUhHa+FSUWDgx5hUnFPDlsLzwf1erf9XuQZjk8pk88HjT9YemvSJKIJ+RO?=
 =?us-ascii?Q?K8U4IuLWeaIsPDt1qcIJTSq/Jnij1NsztDF3BmLLyqi/1t+4LAxhTD27rbSl?=
 =?us-ascii?Q?vfe1JWqWX65GjymMXBkCe+dYmEXxInuNDLI+ImZ/u06QxVUpfE/0hCGF/XgS?=
 =?us-ascii?Q?pOVU1B2Jrx/kVWYU8zoeCOMbF/N2v93bNWEYK3VAptsaV9sfBfQEwFa/0YYt?=
 =?us-ascii?Q?rWcUiVeMyIut+1FNNvuWM9/jfturpEnHAI1i4si9vleJ49bAz5Wf3MThu/2J?=
 =?us-ascii?Q?mSV0w/AGh3H5wzo8trDrWccwouGmD2MbHvtrHykPVQwmNqTujl6Fpym5Ae3p?=
 =?us-ascii?Q?41NYfrSCQkSgwlXXB72aHJjn0MCcRoACcjlVnt50hzWwyxC/cNYZawfveA5e?=
 =?us-ascii?Q?7IDqDEHTqAP0CN97zNrxE0y5OQ/uet7VTCL/IAw09XaNBY3vyP6/9n0hak+a?=
 =?us-ascii?Q?KlY+Y9s4s/CmLr1BPovHveCR97Su1VQnbULa0Ec6gCrkTCB1gbO7a/63rjSR?=
 =?us-ascii?Q?9/qSSILXuH/nGCN4LGrOu+i7smTQRHtOT5PUNeH8q9vkmxNDeoyvuHY9EP1f?=
 =?us-ascii?Q?1gC0dor1yocvg66wEAeIoZGJsWtqTcKg+PKcY8KcIx/zupzCoV18OJLNyLCy?=
 =?us-ascii?Q?biDAoBOtExvtepuz1BFI/6F+8HbxuVaVVszTla9S7ARIsnyhw5Kd5X+R1alY?=
 =?us-ascii?Q?d1YYcRsk7CtE7Sjc2qSee//cXNmSmbsLRacvgf8cIU+v4CGv71WtBTvY6Hbs?=
 =?us-ascii?Q?w5Se6+7ZqHTFplBg04Bk8bmFcQYDv12FqCuXBZrftl8vKNBf7kxAjFe3QaRz?=
 =?us-ascii?Q?Vy0nKTOMMnZwYDwR8wQ0crNsY3m6DcUKwlR2LcjDoZy2vCXBD2snZqK80RR2?=
 =?us-ascii?Q?7OywF6O2nEd4fwRGgwUfBEozNtL/c3PEhjAZ+Y/f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f110281-27d0-46d2-85de-08dd5c698a48
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:44:12.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DITCZT9Zvq/WtnThyzIRDTbRWJAoEUVU+rTuhfmFTz/0V+nhyGhGdk+wcfm3sHumdauKzoqfTQPHX4fcE89weg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

Change the code to add support for MIGRATE_VMA_SELECT_COMPOUND
and appropriately handling page sizes in the migrate/evict
code paths.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 244 +++++++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 176 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 61d0f411ef84..bf3681f52ce0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -83,9 +83,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +118,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		folio_set_zone_device_data(folio, dmem->free_folios);
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +151,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +185,38 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
-
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +227,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,19 +256,31 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	tail->pgmap = head->pgmap;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -279,16 +334,21 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+		for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+			page->zone_device_data = drm->dmem->free_pages;
+			drm->dmem->free_pages = page;
+		}
 	}
+
 	*ppage = page;
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -305,27 +365,37 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		drm->dmem->free_folios = folio_zone_device_data(folio);
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = DMEM_CHUNK_NPAGES;
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
 	}
 
-	zone_device_page_init(page);
+	init_zone_device_folio(folio, order);
 	return page;
 }
 
@@ -376,12 +446,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -389,17 +459,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -410,8 +491,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -615,31 +697,35 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -653,7 +739,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -663,27 +749,33 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
 
-	for (i = 0; addr < args->end; i++) {
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
+
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -697,20 +789,24 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
 	if (drm->dmem == NULL)
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		max = max(HPAGE_PMD_NR, max);
+
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
@@ -718,8 +814,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -737,7 +833,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -746,7 +842,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 1fed638b9eba..0693179d0a7d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -920,12 +920,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.48.1

