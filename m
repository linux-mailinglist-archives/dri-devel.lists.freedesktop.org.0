Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8BC90D90
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 05:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453B910E7F7;
	Fri, 28 Nov 2025 04:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RTs/RKu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012034.outbound.protection.outlook.com
 [40.107.200.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7721410E789
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 04:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4oh9+qeAEadXToZwmeRCky8t44HQzAFEjw0grRKUJLFVlFpr/SrJplt9aXB5W3FL5Rq7otkFB0tbBuYHkpFHn68Qaa6+KdrC15PQxFxGwWSRSB2zCgSnqMeVhySgFVu7PlYWYi5vMPhwvei3xIBA0nx3l3yr1nud60STGcD1sEtTDiCvLXWyrnADXb1fcuVdycXsh5BHMda4WXAZik/WHLA32hnCxgEWEspYpMW+/vc4ATY5G/LkBcBHlB9d6mDfkH3pyMYh34EesfDe6H4OJ7myGkQ7AmEKJ+ekS5lJgu/mdsruzZhUG56EeYyteGwpCHf7rlRswbeQgmCLjDmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4zxis86Tbsq0XEk6uGCwOSRX1uMP5AU6BpdE/rvAjk=;
 b=xfRMnNAETOIWUXiOZYq9Ip4X2c58kloeqUNtLm7CT+oGWXS1Ms+IQBX0MvgfuGU1ENL6jdYZJvU3xSm9Ohzt1K2dSqAgFW5f5wT74io50g/861ulcMCRS1ygsahpOrSDt001eOZ8Jnr/gzH/Onl61fkftTyR8tbZygcXjv42cNh3GFWVBFDP1jXNo9oGChg/VJzl2+a1b+LjIWNHE444x4Q2RHK2w7aAUUL0T2IWPh+qgQzUBUbn31xRb+sdbPKAyYOzrNjSvzLy4ONaKIMkFUUFPXlEkll03tBfTmhsch+mX6YDOEW+Of/zbkmaeZDN+4HQ+oBCGSpRahTqpwhPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4zxis86Tbsq0XEk6uGCwOSRX1uMP5AU6BpdE/rvAjk=;
 b=RTs/RKu6lvuwldSgnVmXUfFAwZLeHfpok9QDWxq05IOLNHWTrNi8zVUnAzKlZc2fdmdzrOjh969rCJbootk9fW1a+8HEVmqs+dKFqm20TXdihiohE9HY/3XlYFqYUEmeBw88fLdYLGonBq7kl2XQx1CZhN6sl3lXe9b2PhbMC8SzBhfzt2E/lpLp7nvBgK1IJUaIuq6aDQ+S+kBKPKki3SkegnPelyhgnnIVNCfDf4RjVPd/vFXn0jUcgBsIraBWMVZ6iXAhy4DZfskRhn4AxQcAZ/zS+LWWE2RP1X1jOHxU55PEMLV1ITty4TWeO0paJGnscDkrp9IGlj01EUIv9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 04:43:00 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9343.016; Fri, 28 Nov 2025
 04:43:00 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
Subject: [RFC PATCH 6/6] mm: Remove device private pages from the physical
 address space
Date: Fri, 28 Nov 2025 15:41:46 +1100
Message-Id: <20251128044146.80050-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: d33baecb-2692-428b-725e-08de2e389b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GhmFd0KnJWpbqOeEUx92Pr91a1mYiGN2oknO1HU9CAe9ZywUhwf5QYXojf2k?=
 =?us-ascii?Q?7ugW4RFP63p5FgByuGVStY2l1osA6EC/2oiAf0jBxvfBen027l05PkglEjdh?=
 =?us-ascii?Q?yAAK2RO9NaCXlRFgusUgHhdMqPhK9CplsZnbnHEThWjJUVlsl7+0jx6j1Mt3?=
 =?us-ascii?Q?ruRrebE4luFSXMfFTtxfWHsEOxTabZJfV1VHWfe1Ciy+NbgPpaELYet+ZeGi?=
 =?us-ascii?Q?4iNmcN4dtyDF8QE6iyq7fCZoDyfy4VtKVaqrIV7CHSntJXrpUI2kmOlCUeRj?=
 =?us-ascii?Q?Nc6A2NE2l9h4D7CBMhETOid/QcsXpcLt0GdZmg6ybFM6XVSG7ezhdBsd7j5U?=
 =?us-ascii?Q?QjqKeo4MXQL/T6/ur7IMvT8FeYKzqgDRuLbPIJSdPJfgW63orzNJuQYzV14H?=
 =?us-ascii?Q?JrMzHtUenqPknnCTtKpNkBen5i2ekC6oVrWWNOnBqPJnIOSLAaNnDKFgqz8K?=
 =?us-ascii?Q?CZIjUETSAU9OJnGWYv0KCBRx0vQaEMUwhRRRMu0zXtn2OJZptnh7sjkkaw+c?=
 =?us-ascii?Q?38aYrV8UUlf8qPCb1wxNG+zwYkE4gnNwc+Ucvpjk0NvJ4yyR6w+WLGWfmh4T?=
 =?us-ascii?Q?fAcX7C9CO4G3a13iirqoy0m6KVShy6JB7uteDf+5bVUj7E6G1l1LFBn0uJA8?=
 =?us-ascii?Q?3Lu5s7h1nDI6kVa7tTjXcAnExBw/vNkpE3dswjSOpeV9WL0yaBZKglLLhUu1?=
 =?us-ascii?Q?HeVd1uBvWHD67sOeJpN4xITQ8lADICqgykPmIe12O+W/29SC9ZblJyBhzNgN?=
 =?us-ascii?Q?naEcXbSA1+ojibsjlo7SdpSemTV/kJKITVH4oIjRnPEH2GlPIGrm8iaiWk/H?=
 =?us-ascii?Q?Zf5YioEdp6JhGsl8YfcnAiWi18lR0yFLC33BzOEdRU9HNuRg/Kob4lwvM+FE?=
 =?us-ascii?Q?PYD+eSOJrJ+iBppIgQGmrDiHLv4Z+D268yt7JQJ1V0rJTBbFB6wDXehZgQvl?=
 =?us-ascii?Q?6kslOGkLiC0npfn/RRvrWs6SX+39+ZA20ag206NlQKVG2ECu2FPrrILntV2K?=
 =?us-ascii?Q?kMdmJicf0qMgkNSUdo7oqb6+1+1jHY1bEMMn2jkqTAmWsL2zDUMM5Kp3puc+?=
 =?us-ascii?Q?2kM4G1oAroB0BI65zz6rWF8rQDNNlpFr9q7JSx5IkGuSiAbUalO0j6YNG+N/?=
 =?us-ascii?Q?UqvUmu9V9b0H2PCfdfrGayhz/qYQiTmTHoK/ttNC88lQD4OXbmGFDmlOPV3h?=
 =?us-ascii?Q?l8WuFYvzzVilwZtDCIxdTRxuNOw+Tuy/FvV2B9nr/FthWCsEF0AE3slYMonk?=
 =?us-ascii?Q?O2N9NBYvd3NAm3BaMPnDdTJPIhWXLaaxcRrFyD/hEz3jeng/Mji5nyAvX11Q?=
 =?us-ascii?Q?BTXXl0z8Ec6bJEpxascNUZOAnIzsCEWYqn20npkDilEb1Cp9bdPOs53wu2X+?=
 =?us-ascii?Q?+mREvQ308ql0bgZK5ukKbjzjdAnZcz+ODi1c2Y5sTZi7551hmvJNibYVUf42?=
 =?us-ascii?Q?aVnuy1Q4gcRzLwGicHCTjI912BMmH20c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aP0KRnuYTDbX8KA9UOB5gXV5dX5qDZ6YoAj0ibBoWgZjD2FunPoBN5p1ZHK6?=
 =?us-ascii?Q?6eZ1WJSmilNr39g1zzQcKpUrxGjJoVGtNMdmgFpL68WowM0bGj55o9g9mFbe?=
 =?us-ascii?Q?lHFKzttSXBU8G8JigG1p64ND3DUvn7fxLX+cyWlZiiMjHGCTKcKwD+fBSKRl?=
 =?us-ascii?Q?7wIT4OLl3nRmdqhZZZh1nc7BetGBE/xl5ZPIMIXI3VJ2mdiKWXblQgtK6AW5?=
 =?us-ascii?Q?xeTWe82Z5VRg+CJk3yZmrUTcThZZr1okmWLW4j1sS/DSE40ARnDO1UyekHl5?=
 =?us-ascii?Q?T1GGmln5Z6GnFb0X7ZkJN3Rmsr+dHpoa4NsOWl51Qyl4rwUbflaMK/O1iv+c?=
 =?us-ascii?Q?ZrS1/iy77tfVKvTIhJjPhXJL8zpkkt0xcTR7BmCVX/tEQjg2scz/3AGiOZYF?=
 =?us-ascii?Q?hX5CtImd5lCuOru73LL9MQpho21FqoVEdG/uxroNsct3AFPdpt9n0tlIvUkU?=
 =?us-ascii?Q?vSCVOPN+aB6JoUsMyCpuBgSfFD8b/jEg2joPgursSxjyliIYaXnshPl9QmXe?=
 =?us-ascii?Q?4gIY+PV5Wvf39zTlvkfBnphLENJ4j4FPtVJPr/3u4M2o/ZEAQp6FchIeGovN?=
 =?us-ascii?Q?cGtCuYmRrFRYJ1IA0GpT09hMKXijRMNPVcU7y5PzEl3HvbFCZiwDp4UtRfoo?=
 =?us-ascii?Q?syU/xrcPCrs8NL/NiZIRbkLicooncIxIGpDiyiZWeRTX4UwpEmqQ5RYYgxQ4?=
 =?us-ascii?Q?v8T+e1EjDPY3DwgVU1aCgXMMNUyNNjl0kRixbz2+rACYk+3fsRVkGNcMC7zV?=
 =?us-ascii?Q?uvkksAayi2hS9txq6vnd/8+jKBnFgIK3Wv/txn5AN9bieA6Mf718ftOnrbP6?=
 =?us-ascii?Q?H9qDsYtD5cafDLCOkTe4JhqjHcfKRTTG7QjaBFCD8wqFWkqgpRsAjSoO/JYh?=
 =?us-ascii?Q?30mwq1nVQGY1V6WqN3jRGUDOBtcCtOBHy2DTVw2d50ykaBbZMWBAeVExdV0Y?=
 =?us-ascii?Q?ijiTRNU9ik9Z8zAXuqBD3slN6dTnebMHlu1kdK+XZTVfxpXG9Xivkpo97ARE?=
 =?us-ascii?Q?Lj38VBJIQMpNkTJSfWVfhx7Wmfd3gr5CPbmGpgGbqTEQJxJb2Ndwf0wByHFr?=
 =?us-ascii?Q?eX/BYPzzFfF91PTVb7uzpJgoyecJ2DX0CemsFVAQy/srz9RnZDBV5xUzi4T5?=
 =?us-ascii?Q?oajy7qP78i5ZPE0fop++nzI/P2wpLLBx968b5Q/XvdEk83zVLT2bJZLIZBWe?=
 =?us-ascii?Q?6oIYaoPDn4t6tKTcWhKEY2ox0kK+PzurfRWGoFF14Cz7/OMouZdEw2MPdaB9?=
 =?us-ascii?Q?3mkUmPYN50CYNctrMQneMF9Q+Y8ELRUiL6vSVC2aMpHUSaiVkwo3RoizhNvN?=
 =?us-ascii?Q?i2O6Zhzw283wvoPx55BVhjuy8k7peND1z4Ye/mkTAFSytzsVNdv4r5SCQ80X?=
 =?us-ascii?Q?lNtiN7D2bx+Z39Ssi5Zg4VRryCifcDtfqxrfGC0irW/uJEfbZzG2LksBZ6el?=
 =?us-ascii?Q?O0kK01gQWT3m10Gp2cWeQF42WkR8n5Zye2f4sktbrhCB1VmVhxpK2wJB+fFj?=
 =?us-ascii?Q?zn/CEwZnMwpiuZ7r25p2v68RtyTU7OiP0yrgUi4Hft6+2iyxmNO1Uk9rWDZc?=
 =?us-ascii?Q?xjM6ardq1PVsOAciRXrumtoT2mpP1sIy8GSMlto6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33baecb-2692-428b-725e-08de2e389b97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:43:00.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezkial5T34/PKY+kv3nS/6QwmJN0w+qojsNw27NOQFEDIdn68QaeRZzi10Up8Xy8zwJuuCDVAu/zvkGdtdkUFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

Currently when creating these device private struct pages, the first
step is to use request_free_mem_region() to get a range of physical
address space large enough to represent the devices memory. This
allocated physical address range is then remapped as device private
memory using memremap_pages().

Needing allocation of physical address space has some problems:

  1) There may be insufficient physical address space to represent the
     device memory. KASLR reducing the physical address space and VM
     configurations with limited physical address space increase the
     likelihood of hitting this especially as device memory increases. This
     has been observed to prevent device private from being initialized.

  2) Attempting to add the device private pages to the linear map at
     addresses beyond the actual physical memory causes issues on
     architectures like aarch64 meaning the feature does not work there.

Instead of using the physical address space, introduce a device private
address space and allocate devices regions from there to represent the
device private pages.

Introduce a new interface memremap_device_private_pagemap() that
allocates a requested amount of device private address space and creates
the necessary device private pages.

To support this new interface, struct dev_pagemap needs some changes:

  - Add a new dev_pagemap::nr_pages field as an input parameter.
  - Add a new dev_pagemap::pages array to store the device
    private pages.

When using memremap_device_private_pagemap(), rather then passing in
dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
be remapped, dev_pagemap::nr_ranges will always be 1, and the device
private range that is reserved is returned in dev_pagemap::range.

Forbid calling memremap_pages() with dev_pagemap::ranges::type =
MEMORY_DEVICE_PRIVATE.

Represent this device private address space using a new
device_private_pgmap_tree maple tree. This tree maps a given device
private address to a struct dev_pagemap, where a specific device private
page may then be looked up in that dev_pagemap::pages array.

Device private address space can be reclaimed and the assoicated device
private pages freed using the corresponding new
memunmap_device_private_pagemap() interface.

Because the device private pages now live outside the physical address
space, they no longer have a normal PFN. This means that page_to_pfn(),
et al. are no longer meaningful.

Introduce helpers:

  - device_private_page_to_offset()
  - device_private_folio_to_offset()

to take a given device private page / folio and return its offset within
the device private address space (this is essentially a PFN within the
device private address space).

Update the places where we previously converted a device private page to
a PFN to use these new helpers. When we encounter a device private PFN,
instead of looking up its page within the pagemap use
device_private_offset_to_page() instead.

Update lib/test_hmm.c to use the new memremap_device_private_pagemap()
interface.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Note: The existing users of memremap_pages() will be updated in the next
revision.
---
 Documentation/mm/hmm.rst |   9 +-
 include/linux/hmm.h      |   3 +
 include/linux/memremap.h |  25 +++++-
 include/linux/migrate.h  |   4 +
 include/linux/mm.h       |   2 +
 include/linux/rmap.h     |   7 ++
 include/linux/swapops.h  |  15 +++-
 lib/test_hmm.c           |  65 ++++++++-------
 mm/debug.c               |   9 +-
 mm/memremap.c            | 174 +++++++++++++++++++++++++++++----------
 mm/migrate.c             |   4 +-
 mm/migrate_device.c      |  14 ++--
 mm/mm_init.c             |   8 +-
 mm/page_vma_mapped.c     |  10 +++
 mm/pagewalk.c            |   3 +-
 mm/rmap.c                |  38 ++++++---
 mm/util.c                |   5 +-
 17 files changed, 282 insertions(+), 113 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..49a10d3dfb2d 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -276,17 +276,12 @@ These can be allocated and freed with::
     struct resource *res;
     struct dev_pagemap pagemap;
 
-    res = request_free_mem_region(&iomem_resource, /* number of bytes */,
-                                  "name of driver resource");
     pagemap.type = MEMORY_DEVICE_PRIVATE;
-    pagemap.range.start = res->start;
-    pagemap.range.end = res->end;
-    pagemap.nr_range = 1;
+    pagemap.nr_pages = /* number of pages */;
     pagemap.ops = &device_devmem_ops;
-    memremap_pages(&pagemap, numa_node_id());
+    memremap_device_private_pagemap(&pagemap, numa_node_id());
 
     memunmap_pages(&pagemap);
-    release_mem_region(pagemap.range.start, range_len(&pagemap.range));
 
 There are also devm_request_free_mem_region(), devm_memremap_pages(),
 devm_memunmap_pages(), and devm_release_mem_region() when the resources can
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index df571fa75a44..f6e65a6d80ea 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -68,6 +68,9 @@ enum hmm_pfn_flags {
  */
 static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
 {
+	if (hmm_pfn & HMM_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
+
 	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
 }
 
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index e5951ba12a28..737574209cea 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -38,6 +38,7 @@ struct vmem_altmap {
  * backing the device memory. Doing so simplifies the implementation, but it is
  * important to remember that there are certain points at which the struct page
  * must be treated as an opaque object, rather than a "normal" struct page.
+ * Unlike "normal" struct pages, the page_to_pfn() is invalid.
  *
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/mm/hmm.rst.
@@ -120,9 +121,13 @@ struct dev_pagemap_ops {
  * @owner: an opaque pointer identifying the entity that manages this
  *	instance.  Used by various helpers to make sure that no
  *	foreign ZONE_DEVICE memory is accessed.
- * @nr_range: number of ranges to be mapped
- * @range: range to be mapped when nr_range == 1
+ * @nr_range: number of ranges to be mapped. Always == 1 for
+ *	MEMORY_DEVICE_PRIVATE.
+ * @range: range to be mapped when nr_range == 1. Used as an output param for
+ *	MEMORY_DEVICE_PRIVATE.
  * @ranges: array of ranges to be mapped when nr_range > 1
+ * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
+ * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
  */
 struct dev_pagemap {
 	struct vmem_altmap altmap;
@@ -138,6 +143,8 @@ struct dev_pagemap {
 		struct range range;
 		DECLARE_FLEX_ARRAY(struct range, ranges);
 	};
+	unsigned long nr_pages;
+	struct page *pages;
 };
 
 static inline bool pgmap_has_memory_failure(struct dev_pagemap *pgmap)
@@ -164,6 +171,15 @@ static inline bool folio_is_device_private(const struct folio *folio)
 		folio->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+struct page *device_private_offset_to_page(unsigned long offset);
+struct page *device_private_entry_to_page(swp_entry_t entry);
+pgoff_t device_private_page_to_offset(const struct page *page);
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return device_private_page_to_offset((const struct page *)&folio->page);
+}
+
 static inline bool is_device_private_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
@@ -206,7 +222,12 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+					  unsigned long zone_idx, int nid,
+					  struct dev_pagemap *pgmap);
 void zone_device_page_init(struct page *page);
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap);
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index d8f520dca342..d50684dd4ee6 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -132,6 +132,10 @@ static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
 	if (!(mpfn & MIGRATE_PFN_VALID))
 		return NULL;
+
+	if (mpfn & MIGRATE_PFN_DEVICE)
+		return device_private_offset_to_page(mpfn >> MIGRATE_PFN_SHIFT);
+
 	return pfn_to_page(mpfn >> MIGRATE_PFN_SHIFT);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6b8c299a6687..94d83897ea18 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1851,6 +1851,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
  */
 static inline unsigned long folio_pfn(const struct folio *folio)
 {
+	VM_BUG_ON(folio_is_device_private(folio));
+
 	return page_to_pfn(&folio->page);
 }
 
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 79e5c733d9c8..c1561a92864f 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -950,11 +950,18 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
 
 static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 {
+	if (folio_is_device_private(folio))
+		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
+		       PVMW_PFN_DEVICE_PRIVATE;
+
 	return page_vma_walk_pfn(folio_pfn(folio));
 }
 
 static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
 {
+	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+
 	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
 }
 
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 7aa3f00e304a..03271ad98f73 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -565,7 +565,13 @@ static inline int pte_none_mostly(pte_t pte)
 
 static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
 {
-	struct page *p = pfn_to_page(swp_offset_pfn(entry));
+	struct page *p;
+
+	if (is_device_private_entry(entry) ||
+	    is_device_private_migration_entry(entry))
+		p = device_private_entry_to_page(entry);
+	else
+		p = pfn_to_page(swp_offset_pfn(entry));
 
 	/*
 	 * Any use of migration entries may only occur while the
@@ -578,8 +584,13 @@ static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
 
 static inline struct folio *pfn_swap_entry_folio(swp_entry_t entry)
 {
-	struct folio *folio = pfn_folio(swp_offset_pfn(entry));
+	struct folio *folio;
 
+	if (is_device_private_entry(entry) ||
+	    is_device_private_migration_entry(entry))
+		folio = page_folio(device_private_entry_to_page(entry));
+	else
+		folio = pfn_folio(swp_offset_pfn(entry));
 	/*
 	 * Any use of migration entries may only occur while the
 	 * corresponding folio is locked
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 0035e1b7beec..59dae2ec628a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -495,7 +495,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				   struct page **ppage)
 {
 	struct dmirror_chunk *devmem;
-	struct resource *res = NULL;
+	bool device_private = false;
 	unsigned long pfn;
 	unsigned long pfn_first;
 	unsigned long pfn_last;
@@ -508,13 +508,9 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	switch (mdevice->zone_device_type) {
 	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
-		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-					      "hmm_dmirror");
-		if (IS_ERR_OR_NULL(res))
-			goto err_devmem;
-		devmem->pagemap.range.start = res->start;
-		devmem->pagemap.range.end = res->end;
+		device_private = true;
 		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		devmem->pagemap.nr_pages = DEVMEM_CHUNK_SIZE / PAGE_SIZE;
 		break;
 	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
 		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
@@ -523,13 +519,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		devmem->pagemap.range.end = devmem->pagemap.range.start +
 					    DEVMEM_CHUNK_SIZE - 1;
 		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		devmem->pagemap.nr_range = 1;
 		break;
 	default:
 		ret = -EINVAL;
 		goto err_devmem;
 	}
 
-	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
 
@@ -549,13 +545,20 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
-	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR_OR_NULL(ptr)) {
-		if (ptr)
-			ret = PTR_ERR(ptr);
-		else
-			ret = -EFAULT;
-		goto err_release;
+
+	if (device_private) {
+		ret = memremap_device_private_pagemap(&devmem->pagemap);
+		if (ret)
+			goto err_release;
+	} else {
+		ptr = memremap_pages(&devmem->pagemap, numa_node_id());
+		if (IS_ERR_OR_NULL(ptr)) {
+			if (ptr)
+				ret = PTR_ERR(ptr);
+			else
+				ret = -EFAULT;
+			goto err_release;
+		}
 	}
 
 	devmem->mdevice = mdevice;
@@ -565,15 +568,21 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	mutex_unlock(&mdevice->devmem_lock);
 
-	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
+	pr_info("added new %u MB chunk (total %u chunks, %u MB) %sPFNs [0x%lx 0x%lx)\n",
 		DEVMEM_CHUNK_SIZE / (1024 * 1024),
 		mdevice->devmem_count,
 		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
+		device_private ? "device " : "",
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
 	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
-		struct page *page = pfn_to_page(pfn);
+		struct page *page;
+
+		if (device_private)
+			page = device_private_offset_to_page(pfn);
+		else
+			page = pfn_to_page(pfn);
 
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
@@ -589,9 +598,6 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-		release_mem_region(devmem->pagemap.range.start,
-				   range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -660,8 +666,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		spage = migrate_pfn_to_page(*src);
 		if (WARN(spage && is_zone_device_page(spage),
-		     "page already in device spage pfn: 0x%lx\n",
-		     page_to_pfn(spage)))
+		     "page already in device spage dev pfn: 0x%lx\n",
+		     device_private_page_to_offset(spage)))
 			continue;
 
 		dpage = dmirror_devmem_alloc_page(mdevice);
@@ -683,8 +689,9 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		rpage->zone_device_data = dmirror;
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage)) |
+			 page_to_pfn(spage),
+			 device_private_page_to_offset(dpage));
+		*dst = migrate_pfn(device_private_page_to_offset(dpage)) |
 				   MIGRATE_PFN_DEVICE;
 		if ((*src & MIGRATE_PFN_WRITE) ||
 		    (!spage && args->vma->vm_flags & VM_WRITE))
@@ -846,8 +853,8 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 		if (!dpage)
 			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		pr_debug("migrating from dev to sys dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 device_private_page_to_offset(spage), page_to_pfn(dpage));
 
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
@@ -1257,10 +1264,10 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 			spin_unlock(&mdevice->lock);
 
 			dmirror_device_evict_chunk(devmem);
-			memunmap_pages(&devmem->pagemap);
 			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
+				memunmap_device_private_pagemap(&devmem->pagemap);
+			else
+				memunmap_pages(&devmem->pagemap);
 			kfree(devmem);
 		}
 		mdevice->devmem_count = 0;
diff --git a/mm/debug.c b/mm/debug.c
index 64ddb0c4b4be..81326d96a678 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -77,9 +77,11 @@ static void __dump_folio(struct folio *folio, struct page *page,
 	if (page_mapcount_is_type(mapcount))
 		mapcount = 0;
 
-	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,
-			folio->index + idx, pfn);
+			folio->index + idx,
+			folio_is_device_private(folio) ? "device " : "",
+			pfn);
 	if (folio_test_large(folio)) {
 		int pincount = 0;
 
@@ -113,7 +115,8 @@ static void __dump_folio(struct folio *folio, struct page *page,
 	 * inaccuracy here due to racing.
 	 */
 	pr_warn("%sflags: %pGp%s\n", type, &folio->flags,
-		is_migrate_cma_folio(folio, pfn) ? " CMA" : "");
+		(!folio_is_device_private(folio) &&
+		 is_migrate_cma_folio(folio, pfn)) ? " CMA" : "");
 	if (page_has_type(&folio->page))
 		pr_warn("page_type: %x(%s)\n", folio->page.page_type >> 24,
 				page_type_name(folio->page.page_type));
diff --git a/mm/memremap.c b/mm/memremap.c
index 46cb1b0b6f72..eb8dec1e550e 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,9 +12,12 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include <linux/maple_tree.h>
 #include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
+static struct maple_tree device_private_pgmap_tree =
+	MTREE_INIT(device_private_pgmap_tree, MT_FLAGS_ALLOC_RANGE);
 
 /*
  * The memremap() and memremap_pages() interfaces are alternately used
@@ -113,9 +116,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	int i;
 
+	WARN_ONCE(pgmap->type == MEMORY_DEVICE_PRIVATE, "Type should not be MEMORY_DEVICE_PRIVATE\n");
+
 	percpu_ref_kill(&pgmap->ref);
-	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    pgmap->type != MEMORY_DEVICE_COHERENT)
+	if (pgmap->type != MEMORY_DEVICE_COHERENT)
 		for (i = 0; i < pgmap->nr_range; i++)
 			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
 
@@ -144,7 +148,6 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
 static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		int range_id, int nid)
 {
-	const bool is_private = pgmap->type == MEMORY_DEVICE_PRIVATE;
 	struct range *range = &pgmap->ranges[range_id];
 	struct dev_pagemap *conflict_pgmap;
 	int error, is_ram;
@@ -190,7 +193,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (error)
 		goto err_pfn_remap;
 
-	if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
+	if (!mhp_range_allowed(range->start, range_len(range), true)) {
 		error = -EINVAL;
 		goto err_kasan;
 	}
@@ -198,30 +201,19 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	mem_hotplug_begin();
 
 	/*
-	 * For device private memory we call add_pages() as we only need to
-	 * allocate and initialize struct page for the device memory. More-
-	 * over the device memory is un-accessible thus we do not want to
-	 * create a linear mapping for the memory like arch_add_memory()
-	 * would do.
-	 *
-	 * For all other device memory types, which are accessible by
-	 * the CPU, we do want the linear mapping and thus use
+	 * All device memory types except device private memory are accessible
+	 * by the CPU, so we want the linear mapping and thus use
 	 * arch_add_memory().
 	 */
-	if (is_private) {
-		error = add_pages(nid, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), params);
-	} else {
-		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
-		if (error) {
-			mem_hotplug_done();
-			goto err_kasan;
-		}
-
-		error = arch_add_memory(nid, range->start, range_len(range),
-					params);
+	error = kasan_add_zero_shadow(__va(range->start), range_len(range));
+	if (error) {
+		mem_hotplug_done();
+		goto err_kasan;
 	}
 
+	error = arch_add_memory(nid, range->start, range_len(range),
+				params);
+
 	if (!error) {
 		struct zone *zone;
 
@@ -248,8 +240,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	return 0;
 
 err_add_memory:
-	if (!is_private)
-		kasan_remove_zero_shadow(__va(range->start), range_len(range));
+	kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
 	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
@@ -281,22 +272,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
-			WARN(1, "Device private memory not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
-			WARN(1, "Missing migrate_to_ram method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops->page_free) {
-			WARN(1, "Missing page_free method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->owner) {
-			WARN(1, "Missing owner\n");
-			return ERR_PTR(-EINVAL);
-		}
+		WARN(1, "Use memremap_device_private_pagemap()\n");
+		return ERR_PTR(-EINVAL);
 		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (!pgmap->ops->page_free) {
@@ -491,3 +468,116 @@ void zone_device_page_init(struct page *page)
 	lock_page(page);
 }
 EXPORT_SYMBOL_GPL(zone_device_page_init);
+
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap)
+{
+	unsigned long dpfn, dpfn_first, dpfn_last = 0;
+	unsigned long start;
+	int rc;
+
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE) {
+		WARN(1, "Not device private memory\n");
+		return -EINVAL;
+	}
+	if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+		WARN(1, "Device private memory not supported\n");
+		return -EINVAL;
+	}
+	if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
+		WARN(1, "Missing migrate_to_ram method\n");
+		return -EINVAL;
+	}
+	if (!pgmap->ops->page_free) {
+		WARN(1, "Missing page_free method\n");
+		return -EINVAL;
+	}
+	if (!pgmap->owner) {
+		WARN(1, "Missing owner\n");
+		return -EINVAL;
+	}
+
+	pgmap->pages = kzalloc(sizeof(struct page) * pgmap->nr_pages,
+			       GFP_KERNEL);
+	if (!pgmap->pages)
+		return -ENOMEM;
+
+	rc = mtree_alloc_range(&device_private_pgmap_tree, &start, pgmap,
+			       pgmap->nr_pages * PAGE_SIZE, 0,
+			       1ull << MAX_PHYSMEM_BITS, GFP_KERNEL);
+	if (rc < 0)
+		goto err_mtree_alloc;
+
+	pgmap->range.start = start;
+	pgmap->range.end = pgmap->range.start + (pgmap->nr_pages * PAGE_SIZE) - 1;
+	pgmap->nr_range = 1;
+
+	init_completion(&pgmap->done);
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+		GFP_KERNEL);
+	if (rc < 0)
+		goto err_ref_init;
+
+	dpfn_first = pgmap->range.start >> PAGE_SHIFT;
+	dpfn_last = dpfn_first + (range_len(&pgmap->range) >> PAGE_SHIFT);
+	for (dpfn = dpfn_first; dpfn < dpfn_last; dpfn++) {
+		struct page *page = device_private_offset_to_page(dpfn);
+
+		__init_zone_device_page(page, dpfn, ZONE_DEVICE, numa_node_id(), pgmap);
+		page_folio(page)->pgmap = (void *) pgmap;
+	}
+
+	return 0;
+
+err_ref_init:
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+err_mtree_alloc:
+	kfree(pgmap->pages);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(memremap_device_private_pagemap);
+
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap)
+{
+	percpu_ref_kill(&pgmap->ref);
+	wait_for_completion(&pgmap->done);
+	percpu_ref_exit(&pgmap->ref);
+	kfree(pgmap->pages);
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+}
+EXPORT_SYMBOL_GPL(memunmap_device_private_pagemap);
+
+struct page *device_private_offset_to_page(unsigned long offset)
+{
+	struct dev_pagemap *pgmap;
+
+	pgmap = mtree_load(&device_private_pgmap_tree, offset << PAGE_SHIFT);
+	if (WARN_ON_ONCE(!pgmap))
+		return NULL;
+
+	return &pgmap->pages[offset - (pgmap->range.start >> PAGE_SHIFT)];
+}
+EXPORT_SYMBOL_GPL(device_private_offset_to_page);
+
+struct page *device_private_entry_to_page(swp_entry_t entry)
+{
+	unsigned long offset;
+
+	if (!((is_device_private_entry(entry) ||
+	       (is_device_private_migration_entry(entry))))) {
+		return NULL;
+	}
+
+	offset = swp_offset_pfn(entry);
+
+	return device_private_offset_to_page(offset);
+}
+
+pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);
+
+	VM_BUG_ON_PAGE(!is_device_private_page(page), page);
+
+	return (pgmap->range.start >> PAGE_SHIFT) + ((page - pgmap->pages));
+}
+EXPORT_SYMBOL_GPL(device_private_page_to_offset);
diff --git a/mm/migrate.c b/mm/migrate.c
index 3c561d61afba..76e08fedbf2b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,10 +399,10 @@ static bool remove_migration_pte(struct folio *folio,
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
 				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+							device_private_page_to_offset(new));
 			else
 				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+							device_private_page_to_offset(new));
 			pte = swp_entry_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 458b5114bb2b..4579f8e9b759 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -147,7 +147,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn(device_private_page_to_offset(page)) |
 					MIGRATE_PFN_MIGRATE |
 					MIGRATE_PFN_DEVICE;
 			if (is_writable_device_private_entry(entry))
@@ -238,21 +238,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (mpfn & MIGRATE_PFN_WRITE) {
 				if (is_device_private_page(page))
 					entry = make_writable_migration_device_private_entry(
-								page_to_pfn(page));
+								device_private_page_to_offset(page));
 				else
 					entry = make_writable_migration_entry(
 								page_to_pfn(page));
 			} else if (anon_exclusive) {
 				if (is_device_private_page(page))
 					entry = make_device_migration_readable_exclusive_migration_entry(
-								page_to_pfn(page));
+								device_private_page_to_offset(page));
 				else
 					entry = make_readable_exclusive_migration_entry(
 								page_to_pfn(page));
 			} else {
 				if (is_device_private_page(page))
 					entry = make_readable_migration_device_private_entry(
-								page_to_pfn(page));
+								device_private_page_to_offset(page));
 				else
 					entry = make_readable_migration_entry(
 								page_to_pfn(page));
@@ -650,10 +650,10 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (vma->vm_flags & VM_WRITE)
 			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+						device_private_page_to_offset(page));
 		else
 			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+						device_private_page_to_offset(page));
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -923,7 +923,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(device_private_offset_to_page(pfn));
 	if (!folio)
 		return 0;
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7712d887b696..772025d833f4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1004,9 +1004,9 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
+void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
+				   unsigned long zone_idx, int nid,
+				   struct dev_pagemap *pgmap)
 {
 
 	__init_single_page(page, pfn, zone_idx, nid);
@@ -1038,7 +1038,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * Please note that MEMINIT_HOTPLUG path doesn't clear memmap
 	 * because this is done early in section_activate()
 	 */
-	if (pageblock_aligned(pfn)) {
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE && pageblock_aligned(pfn)) {
 		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e9fe747d3df3..9911bbe15699 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -104,6 +104,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
 static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 {
 	unsigned long pfn;
+	bool device_private = false;
 	pte_t ptent = ptep_get(pvmw->pte);
 
 	if (pvmw->flags & PVMW_MIGRATION) {
@@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		if (!(is_migration_entry(entry)))
 			return false;
 
+		if (is_device_private_migration_entry(entry))
+			device_private = true;
+
 		pfn = swp_offset_pfn(entry);
 	} else if (is_swap_pte(ptent)) {
 		swp_entry_t entry;
@@ -125,6 +129,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		    !is_device_exclusive_entry(entry))
 			return false;
 
+		if (is_device_private_entry(entry))
+			device_private = true;
+
 		pfn = swp_offset_pfn(entry);
 	} else {
 		if (!pte_present(ptent))
@@ -133,6 +140,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		pfn = pte_pfn(ptent);
 	}
 
+	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
 	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index f5c77dda3359..5970f62bc4b2 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -1003,8 +1003,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
 		if ((flags & FW_MIGRATION) &&
-		    (is_migration_entry(entry) ||
-		     is_device_private_migration_entry(entry))) {
+		    (is_migration_entry(entry))) {
 			page = pfn_swap_entry_to_page(entry);
 			expose_page = false;
 			goto found;
diff --git a/mm/rmap.c b/mm/rmap.c
index 9642a79cbdb4..5aef8223914b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1873,7 +1873,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long nr_pages = 1, end_addr;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 	int ptes = 0;
 
@@ -1980,13 +1980,20 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
-			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			swp_entry_t entry = pte_to_swp_entry(pteval);
+
+			if (is_device_private_entry(entry) ||
+			    is_device_private_migration_entry(entry))
+				nr = swp_offset_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = swp_offset_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2300,7 +2307,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 
 	/*
@@ -2370,13 +2377,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
-			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			swp_entry_t entry = pte_to_swp_entry(pteval);
+
+			if (is_device_private_entry(entry) ||
+			    is_device_private_migration_entry(entry))
+				nr = swp_offset_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = swp_offset_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2436,7 +2450,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 			writable = pte_write(pteval);
 		} else if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
+			flush_cache_page(vma, address, pte_pfn(pteval));
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
 				/*
@@ -2538,21 +2552,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			if (writable) {
 				if (is_device_private_page(subpage))
 					entry = make_writable_migration_device_private_entry(
-								page_to_pfn(subpage));
+								device_private_page_to_offset(subpage));
 				else
 					entry = make_writable_migration_entry(
 								page_to_pfn(subpage));
 			} else if (anon_exclusive) {
 				if (is_device_private_page(subpage))
 					entry = make_device_migration_readable_exclusive_migration_entry(
-								page_to_pfn(subpage));
+								device_private_page_to_offset(subpage));
 				else
 					entry = make_readable_exclusive_migration_entry(
 								page_to_pfn(subpage));
 			} else {
 				if (is_device_private_page(subpage))
 					entry = make_readable_migration_device_private_entry(
-								page_to_pfn(subpage));
+								device_private_page_to_offset(subpage));
 				else
 					entry = make_readable_migration_entry(
 								page_to_pfn(subpage));
diff --git a/mm/util.c b/mm/util.c
index 2472b7381b11..5f2aef804035 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1241,7 +1241,10 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	struct folio *foliop;
 	int loops = 5;
 
-	ps->pfn = page_to_pfn(page);
+	if (is_device_private_page(page))
+		ps->pfn = device_private_page_to_offset(page);
+	else
+		ps->pfn = page_to_pfn(page);
 	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
-- 
2.34.1

