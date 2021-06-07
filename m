Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A239D67E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20036E844;
	Mon,  7 Jun 2021 07:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D721C6E841;
 Mon,  7 Jun 2021 07:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3PL+FxqSIhAplbnF9Jr4ysskVKh0eZGlEi4yB1/ZqNEYaRNX04AiCUB9uZ6cW2r2xf2sJqbkCVYrfv2YjcIvNCYeeYUryGkX9SqEDG/vi7L8izyH8EmGUz9GC0d2OC4bNZoGSgYmBmR3qpuLNsiak7grmn4Fz24BB5Yfjj/KmD7YFXpHUzpnQgnZGQ4h79Wm8rhIT4x7Y4dig306ypEd6j4Pp7o+oiCYxUCV47NCUMSD7T9zR9Lptp/XLuX2Ba5ynzBucGVh5LBozTIRCDEa9ey4H8bjuYjiUbkY01qM39BQ144TiA3xkJ92lAVzakvIyUS8gt8swFJMgVr3iWOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1Ns5M/+kaEP7q50Qd1RgGUv0ka0CpFUxlhrzxst08=;
 b=Lm0sbGwdB9hT42HZfUyO9rlAajCZuk5rUpDDULJDi0oV5LwjRmXaFG4iwV8JWArJSaaFIHkACKfCuNndcDccIIJIurCNKrTEMQbkdwvAIQn2mW4EZ3sRW7dV8JsMJt5B+3lxv0kg4pLfhjAXcXxrkNzrLkW2eHvNzEwb5MRLkisxsii0EyCiOFkE7/eKsabcsFH4d5UALhQMzpYXUvrnmfnIRbH1aXnc9NoQWfMpGCsSDmQhBmgpxLOPFVGJznVZ+xaXutHdn4509NTQsQ+AjagcFlvzSyooL9Tu+6Fq5cBf7YENnixNxWUxY+Al8QouTmXoVP7f6P0YbVdwTyRCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1Ns5M/+kaEP7q50Qd1RgGUv0ka0CpFUxlhrzxst08=;
 b=cnqVkPKtYl6UpimpZHW8kQqMXX6OyQgyd53hOTepJ4RiPS++XCkvmQS1ni4zTj1SVe+d8b8Uw7TgXer0a8XFxT+2VgUInDamSrFrD0DzfdPx8JGtzFRm1QjqOM5Qr1rg3wTsjjJYeqL6VftT2pDcsgRPaV/ojYP416r6a2qVoBiqBWrZPdbfQlNKZ+q5EPwfF11xfDHjO1OLMtqOTRkqbZy3OgKRMoWfMrrVv//bguOFpg/NVS73oCZVfm/fSCYna31V+psC2Gq/CtoUE3ba7z2JPsyaRbgnONb6NHE/WOpQdlPhqrFVEs4EkbWMHaYgUC06PQZ9u1XtcXzIJm6yQQ==
Received: from DM6PR11CA0035.namprd11.prod.outlook.com (2603:10b6:5:190::48)
 by BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 07:59:29 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::1) by DM6PR11CA0035.outlook.office365.com
 (2603:10b6:5:190::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 07:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 07:59:29 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 07:59:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v10 05/10] mm: Rename migrate_pgmap_owner
Date: Mon, 7 Jun 2021 17:58:50 +1000
Message-ID: <20210607075855.5084-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607075855.5084-1-apopple@nvidia.com>
References: <20210607075855.5084-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d8583b5-1f6b-492b-61a8-08d9298a2d92
X-MS-TrafficTypeDiagnostic: BYAPR12MB3095:
X-Microsoft-Antispam-PRVS: <BYAPR12MB309572A6DA8088D1C6C626D2DF389@BYAPR12MB3095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcY1zKhOmafKCsM40lPa6pJc0/IrerRya7u0WmrwLWij5h/9ImlxfGC/0vVEUb7KQaJpoX5WzyDP5dZvLVbHUWRQ4Nu9ADcQXL+GthAeI3/kMtn3VbkMgYg3nTkYnqZ07P8j8LW5jvKlIE+mStjDRlaTGSK5dGmOqrvQrL9PXEtij5D/CuTfLRBfiz+Rwl0tPZX63tXzwzf1FMzIj0lSlYinLEhstIzI9DMqSgkFt/KqNzo8e59O/Em8sW1hEZYpwb17u1OUoHrfpbbjzui5kcnuR5yG5WGmIF6wXW1Ykn8trolEdvCn+vYHyMVOpRCqWjwL53J+KatRO+hkgXTYb27DdLcaTZMvNh31Gb9hkW8P80DT5APzRue0lwjSVZwxuPRM2kVy8y++/ngM6n/cgcfiZUzQYB3SAnQLjTQQNMCqXt1e/2l+YJ1x/wd99B9Q65LTcTTg0r+I1adc34uEINt1qMikX9ntZ4zYlcYa11m3Bi/ahSGoKPKYQD7iCYk8ta0T14Vv7zhcfocE0CvOvmN4zuqcqrhRVGmNGXrupuW6rlHblVBuLfhfxO0EdYexl95twGJmT5YQmiRiOHL3tlsxz3O2asLuKHNgbucBcL/KCDH8O3+SU9kbnpDdUajEWBYE/I3N6Q722nquG+PlbmgLXHmnYSBzDDLun/6WC1g=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(110136005)(70586007)(54906003)(82310400003)(86362001)(316002)(36906005)(186003)(336012)(5660300002)(426003)(82740400003)(36756003)(47076005)(8676002)(36860700001)(6666004)(83380400001)(8936002)(26005)(4326008)(356005)(7636003)(1076003)(107886003)(7416002)(478600001)(70206006)(2616005)(2906002)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:59:29.4642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8583b5-1f6b-492b-61a8-08d9298a2d92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, peterx@redhat.com,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com
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
index 1a6a9eb6d3fa..8e428eb813b8 100644
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
index 80a78877bd93..5c9f5a020c1d 100644
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
index 05740f816bc4..e5429a44e7a3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2526,8 +2526,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 	 * that the registered device driver can skip invalidating device
 	 * private page mappings that won't be migrated.
 	 */
-	mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
-		migrate->vma->vm_mm, migrate->start, migrate->end,
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
+		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
 		migrate->pgmap_owner);
 	mmu_notifier_invalidate_range_start(&range);
 
@@ -3037,9 +3037,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
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

