Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D856AB3A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197FC1133C7;
	Thu,  7 Jul 2022 19:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325DB1133E2;
 Thu,  7 Jul 2022 19:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaLpmqCPkDn2XnRnctesqe+Z9CvlJv9wxqJcsuS0RMwJ138aLuFb1oXvlMozzPzx4TdWgXhYxg4nAg7WtkHFDKoU6hLfo+vAECSa1jcs5mJIi4UGca20ORZs5CPpzGGEsPhn7w8kT94dl7pSfQbVeb0iYyEyyPdeZqT5JjIrrTSe3OJGz6w0khqyNm8Xq6Hn+ov8gjajA9Y3m+p/7lplCUU4bJ3+8Tuv5PAPjQvrZvltaDWl44EYzAXxxzvofuw1RKmXivsgZ9d/WFA0W8lQPh74LhFYaN6AudJwaLLh3U+iklXUwrddd1WIr9XHQjGgY/I9vqXsQcVNkS4SjZZESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRkrS+X2EaEAzTCH5tf9k0CunO9yff/KGmrysaKV354=;
 b=U7wRuaLcMjT4TqmdCxuR/MZcoOKIXeaE5ag+zPrN84Vfz1fIuHFtkiMCshusIEV1kVXxf2dDDF4YI5o4+NXExjBCxTVXs7Yea7MQeD/NcDVIMUiGjkhgKjX5jfK7BfEj32PqcqzJfUFVydNQsh/iX2ONRc9eZTxCq3gS0LsxIDCRuf3Go6RnDG2O9BN2/G+kUeXCJfRyqQrU/QSd84awF8cw6g0E9/xrDlDUoO1QTiHvMnDR6+iZENhPZ00CSEsTryW+HPK20rx2k5J9zB7kfmhQ/hHMJ0X67g1cWZ3LX65rufFBmpLYJBVqf0+dAS8qXDjdnnfEBxfAUSs84ZnKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRkrS+X2EaEAzTCH5tf9k0CunO9yff/KGmrysaKV354=;
 b=PSYfbEQ8QUu/CKSjQpi/CiV6Oh1CigqRkHhN6S06QbOgUbM+WxVZ/suAr7yLz05aEGh5Npuh1BEAGsEADNHI5oEBZxzOCdfl+r+D2RuIoPczSp2mWy4bNs2s5GrCIvX66RTP2oqjMlCK5unJKrGguf+SiHD4pmjIyb3U7ecI2u4=
Received: from BN9P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::21)
 by DM5PR12MB1722.namprd12.prod.outlook.com (2603:10b6:3:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 19:04:09 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::1f) by BN9P222CA0016.outlook.office365.com
 (2603:10b6:408:10c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:06 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 03/15] mm: add zone device coherent type memory support
Date: Thu, 7 Jul 2022 14:03:37 -0500
Message-ID: <20220707190349.9778-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5ea18c8-9a74-469a-18be-08da604b78a8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1722:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLr/dvtf6lxBIrF4m+OlhaPZtKhFcA+7pDuK+1KWbO7MztgkOvB6rj/LeUsNs/P9bM0BH15e2M7d7FuTAM7V2iccP/wV33BfqSjgIgjTsiU3Di7+2XBStCl4RO9oQI1FWTyHSX037MMJI/R+zZeIhMpHjfWZlA8JTe83riVlbSZWdZq8t1alqLI7fbrOjMQT/Lx0YtQZyrdQYdulOfI1fAr6+0Z46Q8Vy+XoF21hJBW/Tjyubp0XSva+d434CbWiFlhQyfG+AMcvKe7JwAWZWL21FOq4dVFHPufoSFPT3T6VqrV5aWe4jd61zaKnAxBjZoBttOAVQGz9emF2igQOfiyswDympON/ORHGQ1Pt1miQ4/sFLjNX6WlaNBGZ9Zi0hBUjisbUQBW1Ca4HKH0n+Zda0EaABKXPZnuHiRCLEcjJJ2+0a4Tqbucaueez4FCWDqyf6aJ0b8o+9wqJq1cK9Kz08XvMVE/WD2TjAl3vfUEasFyPu3Hswjgtb4hnTPvLIOjeqowjAHvrdzRg4uNBm7aoOqG+If2RMpXXuxR08KsiU6vpQcPdcB17wO0WHueuIMaF8AU8mHK5CGHQxkbob+NznGmqWhwjul3H6SWCgsQRG/pey+hcCXM1jpu1p0OnVBf9tkDCIvn4P5VK0+zDiVnRzoFps+hmsR9BxIPT12MJw8fdUoXMOjzQD64dqRLLMCqD5V+0a/LvnLQhGWvEw3RA8XO7glTxXMhoS+8GZjRNxNKWQ9SvaiypGY9296Lbl1t/YT9MXG2CJY8vFtM3ruQQsJI+rYvbblBSauX0lLZctgu8ky2pm+41+rqGWfXvPIYoR8cEhu2lW6uadvoXBsXVEgZuijo1TCUfdjxN0IOxRWlAy2vViut0MgEG5i1m
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(4326008)(7416002)(40480700001)(70206006)(8676002)(44832011)(70586007)(2906002)(82310400005)(34020700004)(40460700003)(36860700001)(36756003)(82740400003)(83380400001)(186003)(1076003)(81166007)(86362001)(316002)(6666004)(478600001)(356005)(54906003)(7696005)(336012)(6916009)(426003)(26005)(2616005)(16526019)(41300700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:08.8505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ea18c8-9a74-469a-18be-08da604b78a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device memory that is cache coherent from device and CPU point of view.
This is used on platforms that have an advanced system bus (like CAPI
or CXL). Any page of a process can be migrated to such memory. However,
no one should be allowed to pin such memory so that it can always be
evicted.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
[hch: rebased ontop of the refcount changes,
      removed is_dev_private_or_coherent_page]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h        |  4 +++-
 include/linux/page_zone.h | 19 +++++++++++++++++++
 mm/memcontrol.c           |  7 ++++---
 mm/memory-failure.c       |  8 ++++++--
 mm/memremap.c             | 10 ++++++++++
 mm/migrate_device.c       | 16 +++++++---------
 mm/rmap.c                 |  5 +++--
 7 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e551616cd208..83902102ffe6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1523,7 +1523,9 @@ static inline bool is_longterm_pinnable_page(struct page *page)
 	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
 		return false;
 #endif
-	return !is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page));
+	return !(is_device_coherent_page(page) ||
+		 is_zone_movable_page(page) ||
+		 is_zero_pfn(page_to_pfn(page)));
 }
 #else
 static inline bool is_longterm_pinnable_page(struct page *page)
diff --git a/include/linux/page_zone.h b/include/linux/page_zone.h
index 2a7a347173ee..a5d90ef13394 100644
--- a/include/linux/page_zone.h
+++ b/include/linux/page_zone.h
@@ -59,6 +59,13 @@
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/vm/hmm.rst.
  *
+ * MEMORY_DEVICE_COHERENT:
+ * Device memory that is cache coherent from device and CPU point of view. This
+ * is used on platforms that have an advanced system bus (like CAPI or CXL). A
+ * driver can hotplug the device memory using ZONE_DEVICE and with that memory
+ * type. Any page of a process can be migrated to such memory. However no one
+ * should be allowed to pin such memory so that it can always be evicted.
+ *
  * MEMORY_DEVICE_FS_DAX:
  * Host memory that has similar access semantics as System RAM i.e. DMA
  * coherent and supports page pinning. In support of coordinating page
@@ -79,6 +86,7 @@
 enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_COHERENT,
 	MEMORY_DEVICE_FS_DAX,
 	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
@@ -191,4 +199,15 @@ static inline bool is_pci_p2pdma_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
 }
 
+static inline bool is_device_coherent_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_COHERENT;
+}
+
+static inline bool folio_is_device_coherent(const struct folio *folio)
+{
+	return is_device_coherent_page(&folio->page);
+}
+
 #endif /* _PAGE_ZONE_H_ */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index a2df2f193f06..a9853f2b0d9b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5664,8 +5664,8 @@ static int mem_cgroup_move_account(struct page *page,
  *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
  *     target for charge migration. if @target is not NULL, the entry is stored
  *     in target->ent.
- *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
- *     (so ZONE_DEVICE page and thus not on the lru).
+ *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is device memory and
+ *   thus not on the lru.
  *     For now we such page is charge like a regular page would be as for all
  *     intent and purposes it is just special memory taking the place of a
  *     regular page.
@@ -5703,7 +5703,8 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_device_private_page(page) ||
+			    is_device_coherent_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index da39ec8afca8..79f175eeb190 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1685,12 +1685,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
 		goto unlock;
 	}
 
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		/*
-		 * TODO: Handle HMM pages which may need coordination
+		 * TODO: Handle device pages which may need coordination
 		 * with device-side memory.
 		 */
 		goto unlock;
+	default:
+		break;
 	}
 
 	/*
diff --git a/mm/memremap.c b/mm/memremap.c
index b870a659eee6..0f8f08f8a991 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -315,6 +315,16 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			return ERR_PTR(-EINVAL);
 		}
 		break;
+	case MEMORY_DEVICE_COHERENT:
+		if (!pgmap->ops->page_free) {
+			WARN(1, "Missing page_free method\n");
+			return ERR_PTR(-EINVAL);
+		}
+		if (!pgmap->owner) {
+			WARN(1, "Missing owner\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
 	case MEMORY_DEVICE_FS_DAX:
 		if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
 			WARN(1, "File system DAX not supported\n");
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5052093d0262..a4847ad65da3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -518,7 +518,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or coherent page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -594,11 +594,8 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 						page_to_pfn(page));
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
-		/*
-		 * For now we only support migrating to un-addressable device
-		 * memory.
-		 */
-		if (is_zone_device_page(page)) {
+		if (is_zone_device_page(page) &&
+		    !is_device_coherent_page(page)) {
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
 		}
@@ -701,10 +698,11 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 
 		mapping = page_mapping(page);
 
-		if (is_device_private_page(newpage)) {
+		if (is_device_private_page(newpage) ||
+		    is_device_coherent_page(newpage)) {
 			/*
-			 * For now only support private anonymous when migrating
-			 * to un-addressable device memory.
+			 * For now only support anonymous memory migrating to
+			 * device private or coherent memory.
 			 */
 			if (mapping) {
 				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
diff --git a/mm/rmap.c b/mm/rmap.c
index 5bcb334cd6f2..04fac1af870b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1957,7 +1957,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (folio_is_zone_device(folio)) {
+		if (folio_is_device_private(folio)) {
 			unsigned long pfn = folio_pfn(folio);
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2131,7 +2131,8 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
 					TTU_SYNC)))
 		return;
 
-	if (folio_is_zone_device(folio) && !folio_is_device_private(folio))
+	if (folio_is_zone_device(folio) &&
+	    (!folio_is_device_private(folio) && !folio_is_device_coherent(folio)))
 		return;
 
 	/*
-- 
2.32.0

