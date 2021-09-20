Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9F4126CA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 21:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDFB6E833;
	Mon, 20 Sep 2021 19:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39E6E82D;
 Mon, 20 Sep 2021 19:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtRkdasGJMCl1dsq/hVU3j/IP58yD+4n+HOwanpkotzIEM2WrYDj8tgRUTmt/cZsmctLN4wlfEIJBpnOmoKclKtX3rhCvCi6kLNaDUPS+OjBpY4HYY0Hban8dsdLRrxd1FrrxqVkmD32NLsJEofHszYK16gKnNmR4oEhmVsYj6dPQzw1f/VrF8y7rkRpupokQShZKBMu4xeeQwCQ+sp9xvpcyK0R1D9k75l7qBkxAwpoti8aWcGdkdytpUN8DS84c2Vfp4opvOdK0JOX67VktLDJ+up0oAxVuBOoO5BcnoR6cB9UZju6Zv0dVBVDmu7uscRn3wzEq4uNuI7HFFVZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1eGYE9Md4z1qgg5BLYr8D/SKlGbZauOFHQhg51LmbiU=;
 b=hZepKZ4+9HXPkKOdAmVmJSa/+aaEpsfUPR1it+v19oYOhfYv/y1yGXLGHvtr+2+p91tV4Eu2b8EBJ2p8VkSEdUNt09oemXrcrHfds/+cnsTM5JL9Qtv4sIBkMvGQKQ64U3SEdXPktAaClFFB37bMcYjsKvQoJWAdZyjvTXwQxiFMhdl92bmMDY30FNUeoPtFDu6dY4uhn2QgStZgrEBEXUqoi9JlOlen1VJDJxXIhDYKKxRHI7YztWiTYIm2u6bOlTb6PLl//sPPitpDS7V1uJuxfO5W1GqPTN09AOuLU7Ciz4IuzaUbqO1lJTJwyf7HJbPqcj0ktVmXbWR8Rk+5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eGYE9Md4z1qgg5BLYr8D/SKlGbZauOFHQhg51LmbiU=;
 b=ObN00NujxfMzIsT+kbkg6rS2FAGEE5w5kvl2jsFsBbGAZr1sMFy8uJAYgCYZq1VFBWollGViiaq6yEthz2wZmgBeCY/Sw45OUUM4NO3/A7ZdP3RvC4QQw4mx3HXFGWUfxANRFyuPs6HhLW6JBHAZKjmPrPiqSZNxzph+ZsWg7aE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 19:20:55 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::69b7:2dfa:9867:4a1e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::69b7:2dfa:9867:4a1e%4]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 19:20:54 +0000
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 matthew.auld@intel.com, daniel@ffwll.ch, alexander.deucher@amd.com
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 1/2] Enable buddy memory manager support
Date: Tue, 21 Sep 2021 00:50:11 +0530
Message-Id: <20210920192011.221102-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from amd.amd.com (165.204.156.251) by
 MA1PR0101CA0037.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 19:20:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da9dfa6-9e0f-4045-59e9-08d97c6bc442
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB443813CDE539070D898EB255E4A09@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7zokB5J7Y0zU3vfFN+8mdarbjfVRvOuLdxa0FSt2q4EDk97tLAkr2dZNFmllOQQwmaYq7E1XdkQcKHe4nxw1GdXr6klCYsPH2RJAnubVWDbOYMr3932TdTAZxKT2jtSSXnu44i01RNZphinQA9asxK2eNFUR2bRVAfGVURgMa9BmJSyU3+Kn5GeX6jTHD6JQZqOecb9qGKS7GRe6cCsrqmEEj7YzxAXu4vNW9yndE0HeDm0FmzAA9GowWewj/RgvDDY6Dubh5B8RGwLV0YKezguGjgGE7C1rsUbxeW4424M20lwFlrrgM/W2NG41FCvYWB2E+kq7UDtMvWwJJ0mRjEj94cj7X1xabrQQTujqNuavGrA29fwMxFn7eQ4rZZavMVqLcKt10HlvGeWwtosXP/3sFlQeEpm6bABC4YF+Ngt3MG4WrVcVsCl0pSyF8n4fKHgaHbQTYIw+jaKYaARXPye/Wz2bGILF2QSC0U2VFQS0dKQ4uPxZmuz144Yl110rZ1rJXV3lkiMMtlciJZgUesVQB/IjKEz00elUZHST/BYpKEFgTQ3ivRXQt8VCgcSpzidJe/4mvvGGmAhjZNDpLp2viiNbqs7K9NEYV+jDdumj+n2fNlDHtDZiccaHkLIKwKC0kSQorDvzpxANF8JOf6DiDea3MOn1Qy1AaaLDxQhJdInOWDGCe3XOl49ALk4JseYuGuQ2b2jFiRQEYqIbrmnfmEhMRVFufeivdRPowo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(38100700002)(7696005)(52116002)(38350700002)(4326008)(1076003)(66946007)(956004)(26005)(2906002)(83380400001)(2616005)(6486002)(8676002)(30864003)(8936002)(478600001)(66476007)(66556008)(316002)(186003)(6636002)(36756003)(5660300002)(86362001)(6666004)(134034003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdkYmlrY3grVGZDYXFJRnQzcjRmWTl0ZXRscGJkV0VMTGF0YUpzTVJZWmp1?=
 =?utf-8?B?a1I3cXE5Y2NxMS91WXk0bGpoUW42WHdVUnhoTlIwanpSSzlScml2b3NuM1dy?=
 =?utf-8?B?M2xNSGh3SndQVzAyUkdkWUVydU5nNERMVW5ySGZaMmZQRWV2SWlIQWs2YkhF?=
 =?utf-8?B?VmhqQUprbytvd01TUE96VzdQWFdRRWYwcllSbC9JK0JiUzNXQkRLY3dpRlI2?=
 =?utf-8?B?c0JsUU1nMW9LTzJ2YzZRT21BWWVIS0tRS0R6dldHMHZ0V3dVcjlLNHgrQVdt?=
 =?utf-8?B?STRoRWwycS9BeTJXcEczRnZxWmFXVi9aUXIwNGN1ejZVcHc3VlZ0K1N0THVG?=
 =?utf-8?B?RldxaE5aZ21FNzBJU1N4R25KVHpkUmlQTGVpRHFMREVQT1piUUVRdHk0SDJJ?=
 =?utf-8?B?eVpvOXZoTHpxU0MxcFNaN1BhU1JGcUVXN3dxR1VHRm9kcHhzMGtWQXRqS0Nt?=
 =?utf-8?B?ajZYWnhUZ0dMZ1hybXNReUJBVFNkd0ZCQkdRWU54amlMKzl4YWZiZWhiM05o?=
 =?utf-8?B?cGpMWThkNjZtMmk2TlNSK1BrKzJ4QUVYUUYrcjQ5bUdFR0hNbzQ4a2laVTJ4?=
 =?utf-8?B?c0VXa093UGZrZ0I4VCtTQXZvOEw0YjBnRllneGNqT21JNnBqN1ZrdTBmVTc2?=
 =?utf-8?B?S0VReWJHazF6YkNabEdrVGlSWmlBZ3RWTks4TzlEOVluL3o4U3hrUGFVTG5D?=
 =?utf-8?B?bmFtUk0yRjZNZzVVbUxLdnBMV1FmWGJncDI0UDZMOHBUMFQvT09nZ3ZXdTIv?=
 =?utf-8?B?RG9RN3BmQlFMMHRWWUdrcmN1c3VHSndhTGlOdldnVEduVnpEMFJPWHVSc0R1?=
 =?utf-8?B?YkRrWDREZE1keWJpOUluQXh3UEYwYWNQNWZtdWlTeGFtcGRlbUVEb0Uxc0VE?=
 =?utf-8?B?QXJDYnFYZjlRdFUzMW5DZmROaUt5RDJTOFNGWEhNcDNQUWZDWGUzOXVvKzdY?=
 =?utf-8?B?Q2plWVBsb2ZpOVMwd1ZSM2ZRcFZWRnlONjhuUWpJNnEycG5oQkI3RE8yNGtq?=
 =?utf-8?B?ZWNsbjhUZlN5QkJtUXpGYkdsRzNKVVRibnpESWNqSGwrOUtTZ0pBcVNzUE1r?=
 =?utf-8?B?TktINWJVYVdYN2dRMis2a253cDRzam5vazRZbzljeWJ0eCt1M1c4VVNvT1JI?=
 =?utf-8?B?WTk2dGU5M1hGNXNQUnZneXp0WWszQzR3dm1GVUFiZ3Y0djRYejROMytnTTR3?=
 =?utf-8?B?ckJ5QUJ5KzBDZjQ2aEtXb3NMNHpTQ1VYeE1BYk9HNVFNK0pEMytVeWtGV3Bi?=
 =?utf-8?B?QW5TZzIxbUNya2R2S0p3d1p5bENBb05nSUdCN3RKTkxnNmo1bGRSTlYvL2xo?=
 =?utf-8?B?RlZGNVdsdXJBaVVYd2VzWUFSVHkrVkxtazNyTWJCVDB0NTA1ZlpwRUwyNk9k?=
 =?utf-8?B?bE1JcWlZeWRjaWY4djdnOGtqaUNTWmtNeW1iTlUxYzBEMFpoZXBIYmcwTWZo?=
 =?utf-8?B?a3ZNQXM5bDNxUTN0NGg0SmF1eDJRZ0lzWVhjbTUvRzVTM1k4ZUthSnBnMEFH?=
 =?utf-8?B?d3l1dHVBL2ozZjNjV0c1bjhYZklQbEVWZjBHSUdqS0tZdG53Z2dKbkF1ZUR5?=
 =?utf-8?B?QzRrR1R5V2M4VWJkekxYZmtTQlJzZlFET2lxMjNHT0NLdmtZTUNDR1FyTVFj?=
 =?utf-8?B?aXhjcDZkc29sMnlVZGsrYm1KTUZoTVNhNVB2enBxSUN3Q3Jta3E3SEx6azJx?=
 =?utf-8?B?cnFzZVJlTFRzbXRNZTBaRmNmeXFEdXVZeFVLZkRZMjhtd1hEM0FQa0RNM3o4?=
 =?utf-8?Q?Ji8pQKMtBBYCi/g1yRkNuDz5ip7QIMPYphfEgSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da9dfa6-9e0f-4045-59e9-08d97c6bc442
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 19:20:54.8301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvtLCjy5KxNTk/4roN+Y37Mwqisqot/HYooDY4Qnbqq8GGJVLIkqUFWB8ABay8wLNWtrEHEfCKAyKG6QgopENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

Port Intel buddy system manager to drm root folder
Add CPU mappable/non-mappable region support to the drm buddy manager

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Makefile    |   2 +-
 drivers/gpu/drm/drm_buddy.c | 465 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_buddy.h     | 154 ++++++++++++
 3 files changed, 620 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 create mode 100644 include/drm/drm_buddy.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a118692a6df7..fe1a2fc09675 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
-		drm_managed.o drm_vblank_work.o
+		drm_managed.o drm_vblank_work.o drm_buddy.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
new file mode 100644
index 000000000000..f07919a004b6
--- /dev/null
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright � 2021 Intel Corporation
+ */
+
+#include <linux/kmemleak.h>
+#include <drm/drm_buddy.h>
+
+static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
+			struct drm_buddy_block *parent, unsigned int order,
+			u64 offset)
+{
+	struct drm_buddy_block *block;
+
+	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
+
+	block = kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
+	if (!block)
+		return NULL;
+
+	block->header = offset;
+	block->header |= order;
+	block->parent = parent;
+	block->start = offset >> PAGE_SHIFT;
+	block->size = (mm->chunk_size << order) >> PAGE_SHIFT;
+
+	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
+	return block;
+}
+
+static void drm_block_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block)
+{
+	kmem_cache_free(mm->slab_blocks, block);
+}
+
+static void add_ordered(struct drm_buddy_mm *mm, struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *node;
+
+	if (list_empty(&mm->free_list[drm_buddy_block_order(block)])) {
+		list_add(&block->link,
+				&mm->free_list[drm_buddy_block_order(block)]);
+		return;
+	}
+
+	list_for_each_entry(node, &mm->free_list[drm_buddy_block_order(block)], link)
+		if (block->start > node->start)
+			break;
+
+	__list_add(&block->link, node->link.prev, &node->link);
+}
+
+static void mark_allocated(struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_ALLOCATED;
+
+	list_del(&block->link);
+}
+
+static void mark_free(struct drm_buddy_mm *mm,
+		      struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_FREE;
+
+	add_ordered(mm, block);
+}
+
+static void mark_split(struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_SPLIT;
+
+	list_del(&block->link);
+}
+
+int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
+{
+	unsigned int i;
+	u64 offset;
+
+	if (size < chunk_size)
+		return -EINVAL;
+
+	if (chunk_size < PAGE_SIZE)
+		return -EINVAL;
+
+	if (!is_power_of_2(chunk_size))
+		return -EINVAL;
+
+	size = round_down(size, chunk_size);
+
+	mm->size = size;
+	mm->chunk_size = chunk_size;
+	mm->max_order = ilog2(size) - ilog2(chunk_size);
+
+	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
+
+	mm->slab_blocks = KMEM_CACHE(drm_buddy_block, SLAB_HWCACHE_ALIGN);
+
+	if (!mm->slab_blocks)
+		return -ENOMEM;
+
+	mm->free_list = kmalloc_array(mm->max_order + 1,
+				      sizeof(struct list_head),
+				      GFP_KERNEL);
+	if (!mm->free_list)
+		goto out_destroy_slab;
+
+	for (i = 0; i <= mm->max_order; ++i)
+		INIT_LIST_HEAD(&mm->free_list[i]);
+
+	mm->n_roots = hweight64(size);
+
+	mm->roots = kmalloc_array(mm->n_roots,
+				  sizeof(struct drm_buddy_block *),
+				  GFP_KERNEL);
+	if (!mm->roots)
+		goto out_free_list;
+
+	offset = 0;
+	i = 0;
+
+	/*
+	 * Split into power-of-two blocks, in case we are given a size that is
+	 * not itself a power-of-two.
+	 */
+	do {
+		struct drm_buddy_block *root;
+		unsigned int order;
+		u64 root_size;
+
+		root_size = rounddown_pow_of_two(size);
+		order = ilog2(root_size) - ilog2(chunk_size);
+
+		root = drm_block_alloc(mm, NULL, order, offset);
+		if (!root)
+			goto out_free_roots;
+
+		mark_free(mm, root);
+
+		BUG_ON(i > mm->max_order);
+		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
+
+		mm->roots[i] = root;
+
+		offset += root_size;
+		size -= root_size;
+		i++;
+	} while (size);
+
+	return 0;
+
+out_free_roots:
+	while (i--)
+		drm_block_free(mm, mm->roots[i]);
+	kfree(mm->roots);
+out_free_list:
+	kfree(mm->free_list);
+out_destroy_slab:
+	kmem_cache_destroy(mm->slab_blocks);
+	return -ENOMEM;
+}
+EXPORT_SYMBOL(drm_buddy_init);
+
+void drm_buddy_fini(struct drm_buddy_mm *mm)
+{
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i) {
+		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
+		drm_block_free(mm, mm->roots[i]);
+	}
+
+	kfree(mm->roots);
+	kfree(mm->free_list);
+	kmem_cache_destroy(mm->slab_blocks);
+}
+EXPORT_SYMBOL(drm_buddy_fini);
+
+static int split_block(struct drm_buddy_mm *mm,
+		       struct drm_buddy_block *block)
+{
+	unsigned int block_order = drm_buddy_block_order(block) - 1;
+	u64 offset = drm_buddy_block_offset(block);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+	BUG_ON(!drm_buddy_block_order(block));
+
+	block->left = drm_block_alloc(mm, block, block_order, offset);
+	if (!block->left)
+		return -ENOMEM;
+
+	block->right = drm_block_alloc(mm, block, block_order,
+					offset + (mm->chunk_size << block_order));
+	if (!block->right) {
+		drm_block_free(mm, block->left);
+		return -ENOMEM;
+	}
+
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
+
+	mark_split(block);
+
+	return 0;
+}
+
+static struct drm_buddy_block *
+get_buddy(struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *parent;
+
+	parent = block->parent;
+	if (!parent)
+		return NULL;
+
+	if (parent->left == block)
+		return parent->right;
+
+	return parent->left;
+}
+
+static void __drm_buddy_free(struct drm_buddy_mm *mm,
+			      struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *parent;
+
+	while ((parent = block->parent)) {
+		struct drm_buddy_block *buddy;
+
+		buddy = get_buddy(block);
+
+		if (!drm_buddy_block_is_free(buddy))
+			break;
+
+		list_del(&buddy->link);
+
+		drm_block_free(mm, block);
+		drm_block_free(mm, buddy);
+
+		block = parent;
+	}
+
+	mark_free(mm, block);
+}
+
+void drm_buddy_free(struct drm_buddy_mm *mm,
+		     struct drm_buddy_block *block)
+{
+	BUG_ON(!drm_buddy_block_is_allocated(block));
+	__drm_buddy_free(mm, block);
+}
+EXPORT_SYMBOL(drm_buddy_free);
+
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
+{
+	struct drm_buddy_block *block, *on;
+
+	list_for_each_entry_safe(block, on, objects, link) {
+		drm_buddy_free(mm, block);
+		cond_resched();
+	}
+	INIT_LIST_HEAD(objects);
+}
+EXPORT_SYMBOL(drm_buddy_free_list);
+
+/*
+ * Allocate power-of-two block. The order value here translates to:
+ *
+ *   0 = 2^0 * mm->chunk_size
+ *   1 = 2^1 * mm->chunk_size
+ *   2 = 2^2 * mm->chunk_size
+ *   ...
+ */
+struct drm_buddy_block *
+drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
+		bool bar_enabled, unsigned int limit,
+		enum drm_buddy_alloc_mode mode)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int pages;
+	unsigned int i;
+	int err;
+
+	pages = (mm->chunk_size << order) >> PAGE_SHIFT;
+
+	for (i = order; i <= mm->max_order; ++i) {
+		if (mode == DRM_BUDDY_TOP_DOWN) {
+			if (!list_empty(&mm->free_list[i])) {
+				block = list_first_entry(&mm->free_list[i],
+						struct drm_buddy_block, link);
+
+				if (bar_enabled) {
+					if (!(block->start > limit))
+						continue;
+				}
+
+				break;
+			}
+		} else if (mode == DRM_BUDDY_BOTTOM_UP) {
+			if (!list_empty(&mm->free_list[i])) {
+				block = list_last_entry(&mm->free_list[i],
+						struct drm_buddy_block, link);
+
+				if (bar_enabled) {
+					if (!(block->start < limit &&
+							(block->start + pages) < limit))
+						continue;
+				}
+
+				break;
+			}
+		}
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+
+	while (i != order) {
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto out_free;
+
+		/* Go low */
+		if (mode == DRM_BUDDY_TOP_DOWN)
+			block = block->right;
+		else
+			block = block->left;
+		i--;
+	}
+
+	if (mode == DRM_BUDDY_TOP_DOWN && bar_enabled) {
+		if (!(block->start > limit))
+			return ERR_PTR(-ENOSPC);
+	} else if (mode == DRM_BUDDY_BOTTOM_UP && bar_enabled) {
+		if (!(block->start < limit &&
+				(block->start + pages) < limit))
+			return ERR_PTR(-ENOSPC);
+	}
+
+	mark_allocated(block);
+	kmemleak_update_trace(block);
+	return block;
+
+out_free:
+	if (i != order)
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL(drm_buddy_alloc);
+
+static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= e2 && e1 >= s2;
+}
+
+static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= s2 && e1 >= e2;
+}
+
+/*
+ * Allocate range. Note that it's safe to chain together multiple alloc_ranges
+ * with the same blocks list.
+ *
+ * Intended for pre-allocating portions of the address space, for example to
+ * reserve a block for the initial framebuffer or similar, hence the expectation
+ * here is that drm_buddy_alloc() is still the main vehicle for
+ * allocations, so if that's not the case then the drm_mm range allocator is
+ * probably a much better fit, and so you should probably go use that instead.
+ */
+int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+			struct list_head *blocks,
+			u64 start, u64 size)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	LIST_HEAD(allocated);
+	LIST_HEAD(dfs);
+	u64 end;
+	int err;
+	int i;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(size | start, mm->chunk_size))
+		return -EINVAL;
+
+	if (range_overflows(start, size, mm->size))
+		return -EINVAL;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	end = start + size - 1;
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (drm_buddy_block_is_allocated(block)) {
+			err = -ENOSPC;
+			goto err_free;
+		}
+
+		if (contains(start, end, block_start, block_end)) {
+			if (!drm_buddy_block_is_free(block)) {
+				err = -ENOSPC;
+				goto err_free;
+			}
+
+			mark_allocated(block);
+			list_add_tail(&block->link, &allocated);
+			continue;
+		}
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	list_splice_tail(&allocated, blocks);
+	return 0;
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+
+err_free:
+	drm_buddy_free_list(mm, &allocated);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_alloc_range);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
new file mode 100644
index 000000000000..50e4d819a3dd
--- /dev/null
+++ b/include/drm/drm_buddy.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright � 2021 Intel Corporation
+ */
+
+#ifndef __DRM_BUDDY_H__
+#define __DRM_BUDDY_H__
+
+#include <linux/bitops.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+
+#define range_overflows(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ >= max__ || size__ > max__ - start__; \
+})
+
+enum drm_buddy_alloc_mode {
+	 DRM_BUDDY_TOP_DOWN = 0,
+	 DRM_BUDDY_BOTTOM_UP,
+	 DRM_BUDDY_ALLOC_RANGE
+};
+
+struct drm_buddy_block {
+#define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
+#define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
+#define   DRM_BUDDY_ALLOCATED	   (1 << 10)
+#define   DRM_BUDDY_FREE	   (2 << 10)
+#define   DRM_BUDDY_SPLIT	   (3 << 10)
+/* Free to be used, if needed in the future */
+#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
+#define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
+	u64 header;
+	/* Store start and size fields in pages */
+	u64 start;
+	u64 size;
+
+	struct drm_buddy_block *left;
+	struct drm_buddy_block *right;
+	struct drm_buddy_block *parent;
+
+	void *private; /* owned by creator */
+
+	/*
+	 * While the block is allocated by the user through drm_buddy_alloc*,
+	 * the user has ownership of the link, for example to maintain within
+	 * a list, if so desired. As soon as the block is freed with
+	 * drm_buddy_free* ownership is given back to the mm.
+	 */
+	struct list_head link;
+	struct list_head tmp_link;
+};
+
+/* Order-zero must be at least PAGE_SIZE */
+#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
+
+/*
+ * Binary Buddy System.
+ *
+ * Locking should be handled by the user, a simple mutex around
+ * drm_buddy_alloc* and drm_buddy_free* should suffice.
+ */
+struct drm_buddy_mm {
+	struct kmem_cache *slab_blocks;
+	/* Maintain a free list for each order. */
+	struct list_head *free_list;
+
+	/*
+	 * Maintain explicit binary tree(s) to track the allocation of the
+	 * address space. This gives us a simple way of finding a buddy block
+	 * and performing the potentially recursive merge step when freeing a
+	 * block.  Nodes are either allocated or free, in which case they will
+	 * also exist on the respective free list.
+	 */
+	struct drm_buddy_block **roots;
+
+	/*
+	 * Anything from here is public, and remains static for the lifetime of
+	 * the mm. Everything above is considered do-not-touch.
+	 */
+	unsigned int n_roots;
+	unsigned int max_order;
+
+	/* Must be at least PAGE_SIZE */
+	u64 chunk_size;
+	u64 size;
+};
+
+static inline u64
+drm_buddy_block_offset(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_OFFSET;
+}
+
+static inline unsigned int
+drm_buddy_block_order(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_ORDER;
+}
+
+static inline unsigned int
+drm_buddy_block_state(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_STATE;
+}
+
+static inline bool
+drm_buddy_block_is_allocated(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
+}
+
+static inline bool
+drm_buddy_block_is_free(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
+}
+
+static inline bool
+drm_buddy_block_is_split(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
+}
+
+static inline u64
+drm_buddy_block_size(struct drm_buddy_mm *mm,
+		      struct drm_buddy_block *block)
+{
+	return mm->chunk_size << drm_buddy_block_order(block);
+}
+
+int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
+
+void drm_buddy_fini(struct drm_buddy_mm *mm);
+
+struct drm_buddy_block *
+drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
+		bool bar_limit_enabled, unsigned int limit,
+		enum drm_buddy_alloc_mode mode);
+
+int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+			   struct list_head *blocks,
+			   u64 start, u64 size);
+
+void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
+
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
+
+#endif
-- 
2.25.1

