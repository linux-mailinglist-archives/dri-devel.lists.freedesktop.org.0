Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306613A9875
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D66E59D;
	Wed, 16 Jun 2021 11:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8D06E588;
 Wed, 16 Jun 2021 11:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+0o6xUpPR+qopVMNIdwKzn/zcC56Qto4cK4b1PiLeB08W+wF+Y6R2q6tI6AMZqaWff2ks8TqIufnlKQDuoiHWA1PoCU9OybXElvl7H33Xq4j6MG6y8WDNyHlGyX9dYxsDU4yEI/dJrLN/6VWx4lgxo5GfMTOPKeEip85xgLvGw/WXcmZOLBdYJWVKahl4ITZPcOd4dCYD5+mbWKPQr3eU48CoRuvyYh5mtOVtTUx5jHTCHHuRUUdqludpLbXiVERUi5Km1JEwAvnHw+cG4jQzjQ7yuN9NX6CZXA9v2PzrP4sxopSfp2+CqFMkasfbgnsRX0N5V+Q9W5nVkY07PVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qppNt2LRBbbO1TB7Q/BvNEslA/TF7EXh9dmRRhcCoo=;
 b=MK2VLcAu/Bx6JYVmw1VhJjwOragCFfDCx8blNiZwZX1Ya4leAAjvD+KJJWLVYwg0AUdYcnv0h9kooMPwi/nqxQNlvT4TX/nM4K6cWsx0Yl7xQBssgUPvSlvRKQjEWYvfTTx0GfdviiQT5z/WhZG2tm4L65mY9CEXQn4ucU6pLrl7Yibkm3u4Xu9cAAwTURtLVswY8wmG3u8C5qambBUcU+Enw++8TCmUY3uzgtuSuxr1dyKXxw/nbQOT+PqY/yv40W2+IsR4znxUZT22f1Oyv6HJq499LMBOaSSF3YsJKbEK03jDGBmHaGfmfEo/ptS64vNfdZ1oZxMADWoDV4MCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qppNt2LRBbbO1TB7Q/BvNEslA/TF7EXh9dmRRhcCoo=;
 b=WQT8760fyJUpLEg8MLxjH2XdoYMf7nHOPQwzsaGUpQxTE45RbqxhlBnkW5Pus+FaZdBYSe7A4T93z1i8KIvbbN5P2fk+uAPW4J/nF7nTPFxf39t83mT1u44IbLraaZP4pqfhpYkFTomMllD2QbG+Zdj7M9bDONgnxOUQH7UKJjXvCoVXe5gB/I1DtVs8UC4cUMv+1KSarHnJKskhaOfiyO7RcontdrdF0e4yAlzFTfoULlwQt+PBaupfCOd9KiaZJ/rbbeW73X28LZecM/bxn9kSMmMnsQdUnuhG5gAd1YSO8Th78VHGfbtE2f1Rmr+i+V62v4yL5+KQDf+72UxK/Q==
Received: from BN6PR13CA0024.namprd13.prod.outlook.com (2603:10b6:404:10a::34)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 11:00:56 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::28) by BN6PR13CA0024.outlook.office365.com
 (2603:10b6:404:10a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Wed, 16 Jun 2021 11:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:00:56 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:00:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 05/10] mm: Rename migrate_pgmap_owner
Date: Wed, 16 Jun 2021 20:59:32 +1000
Message-ID: <20210616105937.23201-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09ab3835-8a8f-4109-9d4e-08d930b60456
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:
X-Microsoft-Antispam-PRVS: <MN2PR12MB396768245370FB4216ED5448DF0F9@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVjSWc0zJSpUUDDRlZ3ttg9H1JndDGj1FTWs/0tiKhweb98CIeDKbNyDzWCNR9Uf3hMGew5hIMge4Iu8akCnG1A3L4g05HnWlP6fReOtChtX/0/6TZhLqkcsk5Z2cJWH3VAGMCw+y8f6RFJLYdIAwSnwjwT3LkzFnztREKgT7hJVx8NZw3dCcB4y1wC4sIK0TCWl1Uc7NNk7cJGgHgpu8I4gebRnQBLU9/Cs5hZr24s60VPSxvP3YKKogltYq4oNSYawFV2nux3ISbcABTOODCdEvc/OKi4cQPKghQFZ3g+JThIJ4uWcBmjxKWOfjymBsnduq45pcSYCe/X5fq/aWqSCl+nsUg1wf9ncRHF0VLmcNfPI/GDTij2iHmv0BUMGDFxSZN+WGDlXE9yaGmQmuhV1T5ErEIJEgaakwmS4Rhmm6dbsJpvnf2qds3bI2uDCss7xWfTragWIUZPRUx+t5ecJ0LUbMZO957tlGMVTclQkGcEn7clTNQLIa9y+Fsy/KpnqOVDYqbGDk55c9dXsY7TeimbQXzVuuNm5CguNdvDiaF3MZz+VUaA3RqtoEqmgFlKgpLU9h+rSeWxTIFUAJZoV8pVfWPDQJujeO/6IWbqv3eKL6KXAZw1QzmmlolyJDzu1TAPGQJBAcKU7tP9D/2+wH53YSeynU4JaxTlaHoM=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(83380400001)(16526019)(336012)(5660300002)(186003)(1076003)(82310400003)(4326008)(2616005)(2906002)(36860700001)(426003)(70206006)(47076005)(7636003)(356005)(107886003)(316002)(7416002)(36906005)(8676002)(26005)(8936002)(6666004)(70586007)(478600001)(36756003)(54906003)(86362001)(6916009)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:00:56.2863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ab3835-8a8f-4109-9d4e-08d930b60456
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MMU notifier ranges have a migrate_pgmap_owner field which is used by
drivers to store a pointer. This is subsequently used by the driver
callback to filter MMU_NOTIFY_MIGRATE events. Other notifier event types
can also benefit from this filtering, so rename the
'migrate_pgmap_owner' field to 'owner' and create a new notifier
initialisation function to initialise this field.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

v9:

Previously part of the next patch in the series ('mm: Device exclusive
memory access') but now split out as a separate change as suggested by
Peter Xu.
---
 Documentation/vm/hmm.rst              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c |  2 +-
 include/linux/mmu_notifier.h          | 20 ++++++++++----------
 lib/test_hmm.c                        |  2 +-
 mm/migrate.c                          | 10 +++++-----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 09e28507f5b2..3df79307a797 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -332,7 +332,7 @@ between device driver specific code and shared common code:
    walks to fill in the ``args->src`` array with PFNs to be migrated.
    The ``invalidate_range_start()`` callback is passed a
    ``struct mmu_notifier_range`` with the ``event`` field set to
-   ``MMU_NOTIFY_MIGRATE`` and the ``migrate_pgmap_owner`` field set to
+   ``MMU_NOTIFY_MIGRATE`` and the ``owner`` field set to
    the ``args->pgmap_owner`` field passed to migrate_vma_setup(). This is
    allows the device driver to skip the invalidation callback and only
    invalidate device private MMU mappings that are actually migrating.
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index f18bd53da052..94f841026c3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -265,7 +265,7 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (update->event == MMU_NOTIFY_MIGRATE &&
-	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
+	    update->owner == svmm->vmm->cli->drm->dev)
 		goto out;
 
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d514e5d06ebf..8eb965ef0028 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -41,7 +41,7 @@ struct mmu_interval_notifier;
  *
  * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
  * a device driver to possibly ignore the invalidation if the
- * migrate_pgmap_owner field matches the driver's device private pgmap owner.
+ * owner field matches the driver's device private pgmap owner.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
@@ -269,7 +269,7 @@ struct mmu_notifier_range {
 	unsigned long end;
 	unsigned flags;
 	enum mmu_notifier_event event;
-	void *migrate_pgmap_owner;
+	void *owner;
 };
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -521,14 +521,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
 	range->flags = flags;
 }
 
-static inline void mmu_notifier_range_init_migrate(
-			struct mmu_notifier_range *range, unsigned int flags,
+static inline void mmu_notifier_range_init_owner(
+			struct mmu_notifier_range *range,
+			enum mmu_notifier_event event, unsigned int flags,
 			struct vm_area_struct *vma, struct mm_struct *mm,
-			unsigned long start, unsigned long end, void *pgmap)
+			unsigned long start, unsigned long end, void *owner)
 {
-	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
-				start, end);
-	range->migrate_pgmap_owner = pgmap;
+	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
+	range->owner = owner;
 }
 
 #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
@@ -655,8 +655,8 @@ static inline void _mmu_notifier_range_init(struct mmu_notifier_range *range,
 
 #define mmu_notifier_range_init(range,event,flags,vma,mm,start,end)  \
 	_mmu_notifier_range_init(range, start, end)
-#define mmu_notifier_range_init_migrate(range, flags, vma, mm, start, end, \
-					pgmap) \
+#define mmu_notifier_range_init_owner(range, event, flags, vma, mm, start, \
+					end, owner) \
 	_mmu_notifier_range_init(range, start, end)
 
 static inline bool
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 15f2e2db77bc..fc7a20bc9b42 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -218,7 +218,7 @@ static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (range->event == MMU_NOTIFY_MIGRATE &&
-	    range->migrate_pgmap_owner == dmirror->mdevice)
+	    range->owner == dmirror->mdevice)
 		return true;
 
 	if (mmu_notifier_range_blockable(range))
diff --git a/mm/migrate.c b/mm/migrate.c
index a69f54bd92b9..23cbd9de030b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2416,8 +2416,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 	 * that the registered device driver can skip invalidating device
 	 * private page mappings that won't be migrated.
 	 */
-	mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
-		migrate->vma->vm_mm, migrate->start, migrate->end,
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
+		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
 		migrate->pgmap_owner);
 	mmu_notifier_invalidate_range_start(&range);
 
@@ -2927,9 +2927,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			if (!notified) {
 				notified = true;
 
-				mmu_notifier_range_init_migrate(&range, 0,
-					migrate->vma, migrate->vma->vm_mm,
-					addr, migrate->end,
+				mmu_notifier_range_init_owner(&range,
+					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
+					migrate->vma->vm_mm, addr, migrate->end,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-- 
2.20.1

