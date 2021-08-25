Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FF3F6E0A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4756E11A;
	Wed, 25 Aug 2021 04:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FDD6E11A;
 Wed, 25 Aug 2021 04:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgehTIrs7Td55mBJgbmKf0zuDpJ2hDzeWT5ty7Xnqcs9PKu2ph21kK1Mxl5m5Eoy0QY4vGnFUDSV95mJ+Zm8dLhq/ojGpVISp3EP/5bF6vhTny6XzOucNs+G5MzeyAC+Zu6JmJvaCD7DeVDDfRwB2ktZmgMqif9GFkpuGVSuYQF0z1Pyt/R2CPXQaQsDAk3R0uGJDqEa8+CPMd2AcVH9s44gJ9DCrKc3ZBbGplYWIs+bep0FE+nWYDAshb9+8UAshl8DXmYU9hj/nIiCFuQSaBJE6OFPCrXpXYyoMrgPpc6kFvtqFTHpSqTuEK7HDKa+aoTMfku6WTQgqUqFmp+6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRfI1RwCo5hW3AB7rncXDgQjMYTtir4amfvDSTe77GU=;
 b=DthLw1xAyxTgM4VPHc//gQevosf+uX7jEEfIK8I/E7WJ6u1m5EGANeqRx+XfQPbQasmA5r9608zHk8MwfLMtcElD3FFDa9UXsO5SmM9exTbmbe4u0KaCsJCa4jyUHVss5guuOkUcHpITcJlvmJka1tBVojtzCwJbV0A8qeksSFsk4MbTY510QTMa0QT9qzokOlUJLdKwM5lUZNXljL6FkqBSRhMUt091h/O99/CYd8RP2iDeCLbD29cU4GlO53z9AAXGQJjRIrFmumXKD8LnlEgm8oWFa8RQVUppQmeVuJ9ZuvQo4857KyomsVWUYS8/NpxYZ/mb+oCotH3NikK1Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRfI1RwCo5hW3AB7rncXDgQjMYTtir4amfvDSTe77GU=;
 b=1FkKvFATRZNrW90lcEehZ6AX9uwSkvPvGxb8gugvI7RVVBw7CjerlFwaljhftYtaFJwUvZLc9rR5eBaHFBD22JjdYKlglUqLALTY2knbGZa06zXJBrtilRaD6+rZLBisnpbam9znl/jTKATayiiN5u5nc9GcQRpLWUR/G+31Wpc=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:43 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:43 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 04/14] mm: add zone device public type memory support
Date: Tue, 24 Aug 2021 22:48:18 -0500
Message-Id: <20210825034828.12927-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3712ba4f-6dc6-436c-b35d-08d9677b3bad
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45116820C0453077C0DD8C7AFDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGc4n7+PMqpVzWRzaA/O1q3F58DddO1Cc+mN0pZz4K4v6z8X63LGkVhFpWdT0dp/l3eIzWoeS2uguWow2GoVQ4d9vr6wfO8WAvu7ochAnnP1dlkoipOIpXjKpqXV95SpFdtd9nx2XHYMhvJyrt57RQ9ZqrSp+BYK8QYU+/AjYfdgPang04RLaZ8+HRnWcKpmhdre2OzYkc9ZFql68pz6f8Yvwc96sKuLNaFCuGKFCAgcqtPAuzyYdf80JYC5hVKUgptw2Op/GkeaqPP0PlZM9a5i1lcE9DPJGgI3eonqJ5MTF2bONn5SaHot9E3cYYDrwl+l294dN0YFzyd21SiestNHwrCT6sFqU7Rz3LIGgTgURBgwgWtDnUiFUYkR/GkP5zNH9POcheZYbSAcbo9b5zr5FvRixFpTUfmyrwOe4Y+UKeCe0Jnq7FuKgrwgDGLuEb3tpaol9uta9VxlIOX8pSencESkGHDYuOgRrWdmcoQKM2i5L3DfAeGmdPxV8qM2s5stAxmeK3S1rDWSvv7X7kWkVCh3o3odXJcBpuf+FnI8TjDURa1JPY/J2c/goOBCV/bHGROS2pF0G1Sw4xtTFMxI4ay6sP4h3xdcT08778PF8RaRXljDwhkOujDqynKLELeVAY7R4ojr0sb4j4AkT6eK8rqBEAlb0vDzNki7ciufkCXGEm2kZYtjSFzbzF1PKjzdOwTAp0BmWuODaEKaRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(186003)(1076003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LvSyh4Iau4a+UaTBvr9VEVhfHhAISHgyrT5Q9MTBoA3e7w78aZHKvaSch5Dw?=
 =?us-ascii?Q?vFj4zi0DgDW/Ag+FAg8CQUWgaBIyPbV3qY73JdsAeW5rOHgzeL5GMkFNmsIg?=
 =?us-ascii?Q?zD1V+0V60Lqyg3RqEwoZs5bAQ+t6XuiCVpNJOgq5d4JQA8M4btb8WWDGHcyk?=
 =?us-ascii?Q?daIE8Jhc8zSF72L2HPQBF3/bfiv7viovUUrsSkIpP9m2QcJyiYRD3nH6OElc?=
 =?us-ascii?Q?wMtjLOJqABL08+krb27Gx8vywahz9aOtLOtsPj7XUwqVDlkU+T2aFezgUBoB?=
 =?us-ascii?Q?kackAzLycGBi+jPlPfCN7NDer2PwIQl8nkPu/MEbj/d5LgjTfkAaTVDZnJ0q?=
 =?us-ascii?Q?sS52sbg8pX/4HiqpZkbaxf9QcWGPAHQ+Mv+Ei6ryxX4QFyZoHWfdqI7TKuEo?=
 =?us-ascii?Q?WdRIHWijyguWyrDnchJk35HIxrjJbkjLeXGSRsmdCV8sbtmGLDcpwaG+ZPuM?=
 =?us-ascii?Q?XEhL6lbXAOuoaHw65B0YXNqKHKXUuvYwnhmHtmL6bd/FW2MLdW0s2iA7iDD1?=
 =?us-ascii?Q?dJbNpgqnsArRP2PSSH+iEm3ZKV/9IWjjENsE+Dc2uh5QZcdaue4EA6I5QFpt?=
 =?us-ascii?Q?AgKuWkbza6f9/mOovnuY3f/W5Yq+2W/ZBt0g1Fm5Jj9UG3Gibs3wnuplmISV?=
 =?us-ascii?Q?NcPFnIMG8GgN8EKDOJgCYIYOsKWyjcpY89NefpBD2WjM3KCBeOKsWRR5IG+v?=
 =?us-ascii?Q?5jkx1w65hD32qlT3tx7JbLcjUJlhirWul97bDw/QMhC2rzGrfySlNAif8oAx?=
 =?us-ascii?Q?ssiezsKAF6kYBEUfE+SFwxUzWV3r43i61m4qijbIxUwUefYoxcMJ6/RcrUa7?=
 =?us-ascii?Q?vc00zV1jCC7wu63weK0OJ9aKTwFUGcIVhs0S3oje4Fk3el3Tn7UK1tGdNF+r?=
 =?us-ascii?Q?Urm5gToYEAarrD4UnU9zrgEmW+NNPKytTcac511Jj+m6DIJsUfyf/H3Yra58?=
 =?us-ascii?Q?erx5ragSDZh6Tf1emZynVCFaasM0e6D5IZvn82gaprr1EY1FFJ9gxJ6sBSKr?=
 =?us-ascii?Q?SdUfQ+mG+9iw8O1VRKYy616UdLM7nMNUNBhQsdRcQpATEfJRnv4bLViMkEQa?=
 =?us-ascii?Q?gldUC3bDPVqRXv9ZLL33haOhXz6FV9lto1f/PnRJ0nZJ8czSZaMHiKRPUqNl?=
 =?us-ascii?Q?3Jjc2UFf8M568Y86fatdLhkfbzP/QB2zTrTNgeU7OPy6nz4a2xv9sjqjmHlV?=
 =?us-ascii?Q?VLm/EC1gjVgjN70yemvSsXT2M/Uym3SVLe90mNhHbElD6jCQRUWTKK0FxQgX?=
 =?us-ascii?Q?cbT5LDljpO7lPvTJYHzksVFj3PUkZUnsGbclNh6kgCBG+PgOOKhPEKTIr6NK?=
 =?us-ascii?Q?FSVdReCqpR6ap7bIooct075A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3712ba4f-6dc6-436c-b35d-08d9677b3bad
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:43.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U90sx0d84clKRUOyJC7cyg5cmQSogD6ANltfX2JeuaJL3+x0bEt0pyI6/dGMVL3+5QhLI9Ocb6kV2DsFc5yXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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

Device memory that is cache coherent from device and CPU point of view.
This is use on platform that have an advance system bus (like CAPI or
CCIX). Any page of a process can be migrated to such memory. However,
no one should be allow to pin such memory so that it can always be
evicted.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/memremap.h | 8 ++++++++
 include/linux/mm.h       | 8 ++++++++
 mm/memcontrol.c          | 6 +++---
 mm/memory-failure.c      | 6 +++++-
 mm/memremap.c            | 1 +
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 77ff5fd0685f..431e1b0bc949 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -39,6 +39,13 @@ struct vmem_altmap {
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/vm/hmm.rst.
  *
+ * MEMORY_DEVICE_PUBLIC:
+ * Device memory that is cache coherent from device and CPU point of view. This
+ * is use on platform that have an advance system bus (like CAPI or CCIX). A
+ * driver can hotplug the device memory using ZONE_DEVICE and with that memory
+ * type. Any page of a process can be migrated to such memory. However no one
+ * should be allow to pin such memory so that it can always be evicted.
+ *
  * MEMORY_DEVICE_FS_DAX:
  * Host memory that has similar access semantics as System RAM i.e. DMA
  * coherent and supports page pinning. In support of coordinating page
@@ -59,6 +66,7 @@ struct vmem_altmap {
 enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_PUBLIC,
 	MEMORY_DEVICE_FS_DAX,
 	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e24c904deeec..70a932e8a2ee 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1187,6 +1187,14 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		page->pgmap->type == MEMORY_DEVICE_PUBLIC);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 64ada9e650a5..1599ef1a3b03 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5530,8 +5530,8 @@ static int mem_cgroup_move_account(struct page *page,
  *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
  *     target for charge migration. if @target is not NULL, the entry is stored
  *     in target->ent.
- *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
- *     (so ZONE_DEVICE page and thus not on the lru).
+ *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PUBLIC
+ *     or MEMORY_DEVICE_PRIVATE (so ZONE_DEVICE page and thus not on the lru).
  *     For now we such page is charge like a regular page would be as for all
  *     intent and purposes it is just special memory taking the place of a
  *     regular page.
@@ -5565,7 +5565,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_device_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 6f5f78885ab4..16cadbabfc99 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1373,12 +1373,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
 		goto unlock;
 	}
 
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_PUBLIC:
 		/*
 		 * TODO: Handle HMM pages which may need coordination
 		 * with device-side memory.
 		 */
 		goto unlock;
+	default:
+		break;
 	}
 
 	/*
diff --git a/mm/memremap.c b/mm/memremap.c
index 5aa8163fd948..2c8898ed006f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -294,6 +294,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_PUBLIC:
 		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
 			WARN(1, "Device private memory not supported\n");
 			return ERR_PTR(-EINVAL);
-- 
2.32.0

