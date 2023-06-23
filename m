Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8B73BF2B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140BB10E6A8;
	Fri, 23 Jun 2023 20:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A857C10E6A8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBms4G9QnCdoaIEoefrIE7Rqs42kKf4PUtYENgGZKPHrbm/O6yRZlSt5hQD6Vq5Tizivu3q8CLYs7b9tSjlqAJrVhxN9Rf2iPI87m/VaN6HycYtlm+sbh3cjyZNgj6DnPCo7T0J85gjVDhCBWVVWIzntIAATYvYU6UMrXCvHq21lhQCkYZUXRwsCm+O2hXzgwnGgmS5l9oTp2afd7cpA6ETKWLL+nt8FR0TH7QVdElyMgxoTZ7S4jq/gP8ESa09TzFTvq9Fge7u3K5V/dSuT/ZlJMMa3sTUMOsGWT67NcrSKKShvkieduYu/dAjxh5FBU8JSWnchkTCAALlzdobAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idRlj5/ilWsApFwFdP7AeDN3mkG4S5Lg+4QIx2n/AZQ=;
 b=c27PY1qe3jcFk+TfVDEKKjxt0VQSS2dk6QSGFqLV32vRij2V5zcrSkBvWLB6IM1+szi2jM7pQfFpBxBOiVdam26GkA09zWyetyyEpXuZsAWIlROhOKi6154TZV0SZxK9/pmbPi3juCWb+4lFZjEfcGNa5R3+b+ccgToPTV57ewsAMxjw4m+XlHrrYfMu4mt0vtdxlke2LEV4Q9fqZ+ZJIHfQzWGWaimcx0cWsac3+MPRpxhHRtGAhBdDPw5pw4Yiqfv1tkz/gtnanR+5WBwX1MkzYMCjDeylpFvTquNiLUkfXMmrMETBAQqTRS7Y0zSSEMZCFK5tbFloudS5hYQ/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idRlj5/ilWsApFwFdP7AeDN3mkG4S5Lg+4QIx2n/AZQ=;
 b=FyBtL0MPfnatnpkQnq8S8vZGTxifXTMRVIXIaKlzDcGQ4u4xUEIYOU59pAwixN1rvvbZ75PYlYn7jVXNuP0OdwteuIQxcmpEOCqxzW+rOJl4kQm/ifr1HMoXjwmB5QPk+2rDHxut7QNsE1XfN3gCEBgHawUg3OQdMxFqXhswIZk=
Received: from CYXPR03CA0023.namprd03.prod.outlook.com (2603:10b6:930:d0::18)
 by SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 20:01:40 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::41) by CYXPR03CA0023.outlook.office365.com
 (2603:10b6:930:d0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 20:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.11 via Frontend Transport; Fri, 23 Jun 2023 20:01:39 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 23 Jun
 2023 15:01:21 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
Date: Fri, 23 Jun 2023 15:59:56 -0400
Message-ID: <20230623200113.62051-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621162652.10875-3-Yunxiang.Li@amd.com>
References: <20230621162652.10875-3-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SA1PR12MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a5524e-8f70-43b6-74bd-08db7424a870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5VTj3AoRx9nBJtqwaCWcYe2lUEbEapJB24x3zMNxRzN7H/yWDU3jHWCP7W1myttbNsXq7lNTZJbQjCs3XAuqdoJyA2EbbCD1DgEmHvmEm5vbwMEPjZOFuMLN0tc3GHGXEVl52C6C/VtjU5veT3zQGYMjJkdsUyWYNteqW5EPxXcP0doso9mrTFGZVaYSBkPrAG5XvKt6u4JY0UeBO7Cxx1itEK+06oyfmbDnmVriCf9bWak2K31gqTS4nDCjbhhxwmPGURmdnomgJzGCTb5XByfHO2Q0KOtla9SFBmHoMAXjWxg9kDgQT4yS4/OQAEgT/79glaARAiTD5zfri44ZaVVISVD6pSqCYO/f5Xlr62FS/k/NczetSM84iN7FSuciHqZBBLbND6yjxIKIIGIxM0KISn1Q6x5hREiljsmO7WZfmsGBPR0+d+hNKM0mI/9k1fa6a9cy52PRhJrp9d4haNln1fnG3Ig8tmn6iDECu9Bm+MgOoEM5eVAwAnjmlspNNH0e/sDq86WNmeL/Let5UVQYRA+Ri4NmKht/xDdvZuMPLpQlptgmdms6bCCQIo1gW4BKdli0cFHkbl4M9ctU6+03W6s7O3WlOcY2LWgH/7HtO21RJj2RHgToKAARLlWCJHZJ0WV3e1UlQXxBQj/9g1CTApNVoRcMMBmYJ1LGE0Q+YUjYs9MxvWlFa6gJdxl3GmCvUXx4/UZUgKjZgN82GrDJfLXTxkSMlti3rN/NT4bCDZCDt52/IVHqhr+Oq6s3mIEeCfL8PkhbTRShMbBBw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(8936002)(8676002)(36860700001)(2906002)(41300700001)(6666004)(356005)(81166007)(36756003)(70586007)(40480700001)(6916009)(70206006)(86362001)(316002)(4326008)(82740400003)(478600001)(82310400005)(40460700003)(2616005)(5660300002)(83380400001)(26005)(426003)(336012)(1076003)(186003)(16526019)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 20:01:39.4925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a5524e-8f70-43b6-74bd-08db7424a870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling dma_resv_reserve_fences a second time would not reserve memory
correctly, this is quite unintuitive and the current debug build option
cannot catch this error reliably because of the slack in max_fences.

Rework the function to allow multiple invocations, also make reserve
check stricter. This fixes issue where ttm_bo_mem_space's reserve is
ignored in various amdgpu ioctl paths, and was causing soft-lockup when
VRAM is exhausted.

v2: try to avoid memory corruption if possible.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/dma-buf/dma-resv.c | 56 ++++++++++++++++++++++++--------------
 include/linux/dma-resv.h   |  8 ++----
 2 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b6f71eb00866..d9a1831ae7f9 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -62,7 +62,7 @@ EXPORT_SYMBOL(reservation_ww_class);
 
 struct dma_resv_list {
 	struct rcu_head rcu;
-	u32 num_fences, max_fences;
+	u32 num_fences, reserved_fences, max_fences;
 	struct dma_fence __rcu *table[];
 };
 
@@ -107,6 +107,8 @@ static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
 	if (!list)
 		return NULL;
 
+	list->num_fences = 0;
+	list->reserved_fences = 0;
 	/* Given the resulting bucket size, recalculated max_fences. */
 	list->max_fences = (size - offsetof(typeof(*list), table)) /
 		sizeof(*list->table);
@@ -173,7 +175,7 @@ static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
  * locked through dma_resv_lock().
  *
  * Note that the preallocated slots need to be re-reserved if @obj is unlocked
- * at any time before calling dma_resv_add_fence(). This is validated when
+ * at any time before calling dma_resv_add_fence(). This produces a warning when
  * CONFIG_DEBUG_MUTEXES is enabled.
  *
  * RETURNS
@@ -182,22 +184,27 @@ static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
 int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 {
 	struct dma_resv_list *old, *new;
-	unsigned int i, j, k, max;
+	unsigned int i, j, k, new_max;
 
 	dma_resv_assert_held(obj);
 
 	old = dma_resv_fences_list(obj);
 	if (old && old->max_fences) {
-		if ((old->num_fences + num_fences) <= old->max_fences)
+		num_fences += old->reserved_fences;
+		if ((old->num_fences + num_fences) <= old->max_fences) {
+			old->reserved_fences = num_fences;
 			return 0;
-		max = max(old->num_fences + num_fences, old->max_fences * 2);
+		}
+		new_max =
+			max(old->num_fences + num_fences, old->max_fences * 2);
 	} else {
-		max = max(4ul, roundup_pow_of_two(num_fences));
+		new_max = max(num_fences, 4u);
 	}
 
-	new = dma_resv_list_alloc(max);
+	new = dma_resv_list_alloc(new_max);
 	if (!new)
 		return -ENOMEM;
+	new_max = new->max_fences;
 
 	/*
 	 * no need to bump fence refcounts, rcu_read access
@@ -205,7 +212,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 	 * references from the old struct are carried over to
 	 * the new.
 	 */
-	for (i = 0, j = 0, k = max; i < (old ? old->num_fences : 0); ++i) {
+	for (i = 0, j = 0, k = new_max; i < (old ? old->num_fences : 0); ++i) {
 		enum dma_resv_usage usage;
 		struct dma_fence *fence;
 
@@ -216,6 +223,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 			dma_resv_list_set(new, j++, fence, usage);
 	}
 	new->num_fences = j;
+	new->reserved_fences = num_fences;
 
 	/*
 	 * We are not changing the effective set of fences here so can
@@ -231,7 +239,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 		return 0;
 
 	/* Drop the references to the signaled fences */
-	for (i = k; i < max; ++i) {
+	for (i = k; i < new_max; ++i) {
 		struct dma_fence *fence;
 
 		fence = rcu_dereference_protected(new->table[i],
@@ -244,27 +252,25 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 }
 EXPORT_SYMBOL(dma_resv_reserve_fences);
 
-#ifdef CONFIG_DEBUG_MUTEXES
 /**
- * dma_resv_reset_max_fences - reset fences for debugging
+ * dma_resv_reset_reserved_fences - reset fence reservation
  * @obj: the dma_resv object to reset
  *
- * Reset the number of pre-reserved fence slots to test that drivers do
+ * Reset the number of pre-reserved fence slots to make sure that drivers do
  * correct slot allocation using dma_resv_reserve_fences(). See also
- * &dma_resv_list.max_fences.
+ * &dma_resv_list.reserved_fences.
  */
-void dma_resv_reset_max_fences(struct dma_resv *obj)
+void dma_resv_reset_reserved_fences(struct dma_resv *obj)
 {
 	struct dma_resv_list *fences = dma_resv_fences_list(obj);
 
 	dma_resv_assert_held(obj);
 
-	/* Test fence slot reservation */
+	/* reset fence slot reservation */
 	if (fences)
-		fences->max_fences = fences->num_fences;
+		fences->reserved_fences = 0;
 }
-EXPORT_SYMBOL(dma_resv_reset_max_fences);
-#endif
+EXPORT_SYMBOL(dma_resv_reset_reserved_fences);
 
 /**
  * dma_resv_add_fence - Add a fence to the dma_resv obj
@@ -293,6 +299,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	 */
 	WARN_ON(dma_fence_is_container(fence));
 
+retry:
 	fobj = dma_resv_fences_list(obj);
 	count = fobj->num_fences;
 
@@ -309,7 +316,17 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 		}
 	}
 
-	BUG_ON(fobj->num_fences >= fobj->max_fences);
+	if (WARN_ON(fobj->num_fences == fobj->max_fences)) {
+		// try our best to avoid memory corruption
+		dma_resv_reserve_fences(obj, 1);
+		goto retry;
+	}
+	if (fobj->reserved_fences)
+		fobj->reserved_fences -= 1;
+#ifdef CONFIG_DEBUG_MUTEXES
+	else
+		WARN_ON(1); // missing fence slot allocation
+#else
 	count++;
 
 	dma_resv_list_set(fobj, i, fence, usage);
@@ -531,7 +548,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
-			list->num_fences = 0;
 		}
 
 		dma_fence_get(f);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..9b2d76484ff4 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -311,11 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-#ifdef CONFIG_DEBUG_MUTEXES
-void dma_resv_reset_max_fences(struct dma_resv *obj);
-#else
-static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
-#endif
+void dma_resv_reset_reserved_fences(struct dma_resv *obj);
 
 /**
  * dma_resv_lock - lock the reservation object
@@ -460,7 +456,7 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
  */
 static inline void dma_resv_unlock(struct dma_resv *obj)
 {
-	dma_resv_reset_max_fences(obj);
+	dma_resv_reset_reserved_fences(obj);
 	ww_mutex_unlock(&obj->lock);
 }
 
-- 
2.41.0

