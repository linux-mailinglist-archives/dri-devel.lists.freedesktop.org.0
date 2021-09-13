Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FC4098AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1696E1ED;
	Mon, 13 Sep 2021 16:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E206E1E6;
 Mon, 13 Sep 2021 16:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzCEV6qD0KfD6JcrQyAKfw7tJ/IXVq3VAmxpaybnIuU9sAJi+JnDJvMS/UvMicGUXs81QNz1OGlV78gmBQFfuCla0JNzP0qK1UNoYmn7h8VO8j8pbR6VsN2rm6yDxKvBMIIQHgHFaFLtQl9YB39rnYHW6E1W7HlLmrlogzy1tZFcl0PQTuQFz5DgQhYar+vrJ1Bsmeettbu6CB7Hw5VBpvZ3HjVD1H4/aokQ3sZWbYvUvCnmcUnjm2Rzu3Il014sWBn+dr/oZ88Pk4C+zmAzl1Xp9jXafOELSJUmOxjYyDCobFOZS484H4Mw3C9eKzczp7FO4kKUWzj6W1eDjZI4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=UOXVlxXjaV/L2Md0yFUOqN8vU589Vv6EPVl/uvpFxgA=;
 b=kh+mD2sP7Cmh27EA6PJiJi9KWmE8R5K2TptZwA8Zwaallzw4uYwTsCqSd/jJKapBMP9FRFIIGCFY39TqhSnh2f6HsFEJh1ASmnYTPFqLLtzndpsMXHKcioErYG6wj2PDZTKOfy3U7Lh/ryd4ChmWUMJJ2pOB3sq7LnFwZMEyofx6hcjsw0h63V0zVyfAJtMfHK32XiE0HwDy2IX+R1Sf8oNfIJdyxnWVzaWihnz3jiku+nyb/6HANpq0+jDJXQQcF//rfKB27j0eernv9GG36IpVq7Gwu2k3vgvVx9IKOalm3/nz32JA2nj14vU7Yu/nrt/H7IRLVN8p5q/js/heUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOXVlxXjaV/L2Md0yFUOqN8vU589Vv6EPVl/uvpFxgA=;
 b=yKYL+lywsCwV/W7AgvDPAmLTH0oHngxjaMvsMxlV0KabRDHcMilsAjgcH8i+EZWxUgTddpJxqSz7nK9vnXCQFkm9DZxjaxhT7eFdZ85y9cZ7YF74Mn7QBEANol/axXueXvU1RLQ7e8Mb/OLkT+bTcOC3v6QDX7S/zAQAHJlnLik=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:18 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:18 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 03/12] mm: add zone device public type memory support
Date: Mon, 13 Sep 2021 11:15:55 -0500
Message-Id: <20210913161604.31981-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbbfa199-f354-4441-f58b-08d976d1d194
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB276732833C447F48A3C0E884FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOobYzhMsMxYofykOjqleizIMSN5tDfiVE0hsdY0YIuOIytnfol5wEG9aZcb2LanI2q5wnnR851nzCi00KZvdIQhKrDHOJLwP41cSNkD+/Ha9a79O1ormnI7xxJ7hXFtKVB0scSGTpBeQwwvFnUQwuHvnxuEJR5LqzMCQjoUCwaLLBV/eJ2wAAIdxlWM1jI0Hg+hD52yStm5ywjfabfhGy2LP6naC5yLSNtHi7BTBifQ1GYTeaYWaZGbWQh4YrbPpG0blpUPdBegm6LOj613WaEaaxFXJ+xFWtPX7lCLuJnk6g4P67UN9rExMJxgh23mEXs86+x6trce9NQheDmvAxvFJpOyLaUTwlqdiQ4JLuhiVKQC5T7eGTk+g1/VxcGfin6voPiNdVB1W1cRiNoNGo9j3rKQpfcW1xl5J7EqZ8E2fDkx3tSO07LPCCVWf8GQ0tScTr1Yb4rhGUztEsJ5ZHVNstEUBDD5YZGmSGji4ViWtRC21i101DLqMYaw0Pmyyk4a30h4cJRdox8MM+7TcLbKLHqqQpoE0qYKOIL20xjqOIO81gjqzhN8pSXSSB4p6ouohT39a5RflkewQtgXPyB0DS5xjprqycCrZEM9XIAw5vQSuMJzmTp7TpSaDnV+Y6CVFD0tl36SQPZbPyfdwmKgqQGxZ3vsJyeauNuCqbX4zKJAJobMRJf0DkLZcfyeEw6sc5DLhHcK4zNqsC+Gqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(86362001)(66946007)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gk8w+pI3/M7xYZxqJXhwHh5Lc8eSZiZU8ZRdbyg/UTtr0H7VDG8rohpfjZVX?=
 =?us-ascii?Q?NhNcRWS3oTBqIbZfGm60eGJCNBVieNxKANZvYZoYlDw14HFmgu7BMontEFoZ?=
 =?us-ascii?Q?HPqgIk+wwBiQ5NUeZFsvBi4Egg3bw3sBt/dVVy1NubagmB4SJ/91Fpt2rkiF?=
 =?us-ascii?Q?ZK/LCnGifKw25Bu/RxvPhFqbXGscMH7e1NA34O2q1nJETDhsecPB4BKH+6Yt?=
 =?us-ascii?Q?FWd2or4H8W8qAuuePybfT/1Ber4UsuY71Ad0ZNjBCnz3eKEbJ2EXQzrahCb2?=
 =?us-ascii?Q?yNCGgNi50eN4xGjK3fZuEOo2UfNMXSo9c9PeGospqkykZNjQS8j8Qc0jRjFE?=
 =?us-ascii?Q?gPgwvthmVCPm7H0LGRoYGPtgzE0lHajNrigWB7Y0TslqNclgJpXpr5fDhJnA?=
 =?us-ascii?Q?1m8qdyPzm6Jmz3Kqn0BwJRSplx1grT0iEsnFbQ/PPb5DwdeLO4Ggq9uvfX8K?=
 =?us-ascii?Q?25sBoEjDr7jKsKUxxu1XRHgTnPvFZC/4TFhZjxqLR6iiDiYJH3FLvPxEbpqL?=
 =?us-ascii?Q?ke4cBbeY2yK2+8zq1Eif712GAYVyqRsANN4cx4fPWSARDeYkpcJcaZoAaBP5?=
 =?us-ascii?Q?LzRaQof2WY1GgYLRgoYHuebkG5NiIHLz8t3npIg1d+31SV+pMtaW6nxoYVWp?=
 =?us-ascii?Q?yTr13Eao3L/j27wsW09pEfqM0jbtBpFVM3tWOrOoEypEaWR4tjazuN+/pzdw?=
 =?us-ascii?Q?Y2iizfFFMHr8jcTkbTkxYg8EaznMctTm/FB95guFWbNU6CrePx4jdlpoV6bE?=
 =?us-ascii?Q?WgaAEZCBz8agBCvW7bldPIOmMz+AFheqaGAHyx0ujbKP+qJsccpTRZBPKEuh?=
 =?us-ascii?Q?0IRmUDl4GHpQteRYG/rpjrCbdPQYGqCEN1QIS3/XOroY5A5CqTHHw3sxIGK5?=
 =?us-ascii?Q?ERqGCEOvL5g9VSCpCMidcGuxTZD/BFOces9jQWTvoJtCPjCWu0Idl4s8Wl4r?=
 =?us-ascii?Q?8CUfikEbRdkimKjov8klIPCNv8GcgB5ai+dFRbwpsrrOmJHWhhF1MMocW2Gh?=
 =?us-ascii?Q?AKu+S9Wq2h3hC8CAxtnyQiUMwbm9AftjxIru9tIXX+Ui+8rkiE98ceTCrmYJ?=
 =?us-ascii?Q?6ZpAAsVYqhcw1YkoCWBQOQol20in/YGI2R9s4ClMzcLYpOgIMRMriyKQWyNs?=
 =?us-ascii?Q?meZCS1H6EgQC4bYJUHxZAXVNPzxeV9WCxfh9/V5sCrEM1kbe+QBCjyfwKERm?=
 =?us-ascii?Q?kH/EUx6eX8aO4heN5hauggKBMWlTNeEjiwp3t4fAewzhQBUEmnrtI7NAyIn+?=
 =?us-ascii?Q?b5LiCiD52j7h2y9i2m5mN4GnBEBf6d1nN4G7Mo5L+7gxWo/QnN8gm2InDUsY?=
 =?us-ascii?Q?Ny+jEwVswq0sCSSJovHJB5xj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbfa199-f354-4441-f58b-08d976d1d194
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:18.7392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btLU2jXT/AIXtTa905LBpfsfJzLxy3odS1Q+MVKTX4bivmm6ezK6L/PfLI+mRHlfJRkexGXCtuBFBPI7TtIG5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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
 include/linux/memremap.h |  8 ++++++++
 include/linux/mm.h       |  8 ++++++++
 mm/memcontrol.c          |  6 +++---
 mm/memory-failure.c      |  6 +++++-
 mm/memremap.c            |  2 ++
 mm/migrate.c             | 19 ++++++++++++-------
 6 files changed, 38 insertions(+), 11 deletions(-)

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
index ab949a571e78..685be704b28e 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -294,6 +294,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_PUBLIC:
 		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
 			WARN(1, "Device private memory not supported\n");
 			return ERR_PTR(-EINVAL);
@@ -493,6 +494,7 @@ void free_zone_device_page(struct page *page)
 {
 	switch (page->pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_PUBLIC:
 		free_device_page(page);
 		return;
 	case MEMORY_DEVICE_FS_DAX:
diff --git a/mm/migrate.c b/mm/migrate.c
index e3a10e2a1bb3..7392648966d2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2565,7 +2565,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2854,7 +2854,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or public page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2925,10 +2925,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
 			entry = swp_entry_to_pte(swp_entry);
+		} else if (is_device_page(page)) {
+			entry = pte_mkold(mk_pte(page,
+						 READ_ONCE(vma->vm_page_prot)));
+			if (vma->vm_flags & VM_WRITE)
+				entry = pte_mkwrite(pte_mkdirty(entry));
 		} else {
 			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
+			 * We support migrating to private and public types
+			 * for device zone memory.
 			 */
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
@@ -3034,10 +3039,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and public
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

