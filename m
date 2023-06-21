Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C4738B1A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7AB10E31B;
	Wed, 21 Jun 2023 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8137810E171
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbzDjKorzp9nxz31/19KFs3bUPJ3g8jgCPfxHRclZnkknjXeG+6gIBPKJJRc2VWFTQv7m6MhagnHtAsnK4FUtOgODI8BYBAdgBpyre5PfrBz+y+4ZX8fG2buLbk/usQqRY3nlkBrYFa+vjXupgAeeBEQ7CVOQlO4wWvaDLUeROX/gMD+M7nzFZ+r9lJOTkMLoPcAjY5DklH+HXmMqnEc2WKvumHnnullRvptbF99fRgTLhX2AunTNqWL0aJvgBvqoPAuLnKzAY4+MrAN3ifERJlQOJJ3yRFVyeLHU7Oi9C1MQ/npfQfFol4/TFO3TaTjGpFeQII9tdMb3duFR+cLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q99yXV6t+2sNWcmTGNh2L0AZY880dEX5rtit6wMGnaw=;
 b=EK4sXlGsnW9q4Gv6JZ7EsjqTbZO1Sh3GbHAQcrbvzAnhMFJXCprrTchYqvWkclcOkjvU9tv9jwM4x5sT5UAmtGf5mrX3mr94MKdhir220KGEKgQjDKCc1NLF0x1AZ/KfaXvOq++FEFCx7c7T/5EQRSm6QfLgnFEPq+wtaBIyVZ1Rw8IDCPYbdqn23sYxpXUTpR3dDxrHQvJrOHn8hhG7ofhPoQxT6jk1EhQz3bO76Ae6rpeZaTL/NE3Og9izTQJKZCpNzcMb5DN8rD9NIDNgcboDSKbO1AQIe5e5ZlD3OdLUU/NcwBHJnHPGVh8EiwMVnaAk0ym2uyhzj0IXSdARIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q99yXV6t+2sNWcmTGNh2L0AZY880dEX5rtit6wMGnaw=;
 b=PpEHjk5h0qd8C6S5bXLfZXmghAPrgthGg5xS3jsx86FsWTh6nih1lDwCiuEfbtuiU/XTxnHzaTftl7P+BTWTB/8M+KvW1TZb82U5qS4VM/5OnjwBo09+D3ExqFnS+9MlHIdtoOAQWwVJeudanXmp0j3cJdGooHN8zVBiPZZylKM=
Received: from DS7PR05CA0073.namprd05.prod.outlook.com (2603:10b6:8:57::27) by
 DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Wed, 21 Jun 2023 16:27:15 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::fa) by DS7PR05CA0073.outlook.office365.com
 (2603:10b6:8:57::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 16:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.38 via Frontend Transport; Wed, 21 Jun 2023 16:27:15 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 11:27:14 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH 2/2] dma-buf: allow nested dma_resv_reserve_fences
Date: Wed, 21 Jun 2023 12:23:44 -0400
Message-ID: <20230621162652.10875-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621162652.10875-1-Yunxiang.Li@amd.com>
References: <20230621162652.10875-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bada8b-91bc-4469-2cdc-08db72746024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDpL2M+YzWaL/vGtWRJW6TWLw982HwsH4ngGJ8e7FGDkhaJoQeqLtJGH9ET4/ceZqJvabvOu2JGiBhPlGdyYZb6TM2ny5vK3LqzQ5w+eRa1rxYJV0KRAD2aRHARYPgbi97VLkYfqVCdS89G+CrPgS4tDTIS24ftgF+ZQ4/6OqYFkMzDm3/W3YbMN2ZiS4n4GRAKZ0txf2ebFEkJ2LA19+kwVAcEM1JM+8AHX5QqhYQ56IG0/UeTBApzHTmloOnkq6E0Sizx1zOBQdHSn3s8ugrQL73g3JLPCCMXeXmxwpFVRJJhlzVxUDd5vGdU+i9VQgS0T++6rLTvihvf9xRXBW6Cyu0FJYVEJ3e3dyiTga9xTC8xDwYsNDh8XP1wPablWsrdTAJb8ed6lKux2iHFgbLAfncBcDf9PyPb76hRfEcL6cwETKDSO5+0tr9gV+J7mNWhb3TmpGqYZ35+YwUbtvqnctb1L1yMYBkKsoZK0DGfQCp0n9LPvFlrqyans+SYJFCm+01k3+LMvqrxGFA4r/DVl8fcEezhVI2FPs9NvZGxXk9RAC+ddCWxB9qbBZTPwi7W8AjFRcW5TALNl0das3mI/k/P39gJ4JT7F9IUrXzyCbn27TTdKPRqRJnkhq8axWNbRMSTxe1aR32A7tXSvcksV4gRT4D0mo1T5wQBioyaESLf4LgzjWb99LJsNHanuZqzm3JA8XGVqoWKU3rRQi2sZ4R8vtkLY/NP29nCSV3jmtccJQmaplokYHO8jSpv2hPeKlciICF2Cmf0LTiKJBw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(478600001)(70206006)(36756003)(70586007)(8676002)(6636002)(4326008)(41300700001)(356005)(2616005)(40480700001)(83380400001)(336012)(47076005)(426003)(82310400005)(81166007)(86362001)(6666004)(316002)(5660300002)(2906002)(110136005)(8936002)(40460700003)(26005)(1076003)(16526019)(186003)(82740400003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:27:15.7032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bada8b-91bc-4469-2cdc-08db72746024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
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

Rework the function to allow multiple invocations, the side-effect being
reserve check are now stricter and need to be enabled all the time.

This fixes issue where ttm_bo_mem_space's reserve is ignored in various
amdgpu ioctl paths, and was causing fence lost leading to soft-lockup
when VRAM is exhausted.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/dma-buf/dma-resv.c | 56 ++++++++++++++++++++++----------------
 include/linux/dma-resv.h   |  8 ++----
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b6f71eb00866..5ea97ee88cc0 100644
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
@@ -182,22 +184,26 @@ static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
 int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 {
 	struct dma_resv_list *old, *new;
-	unsigned int i, j, k, max;
+	unsigned int i, j, k, new_max;
 
 	dma_resv_assert_held(obj);
 
 	old = dma_resv_fences_list(obj);
 	if (old && old->max_fences) {
-		if ((old->num_fences + num_fences) <= old->max_fences)
+		new_max = old->num_fences + old->reserved_fences + num_fences;
+		if (new_max <= old->max_fences) {
+			old->reserved_fences += num_fences;
 			return 0;
-		max = max(old->num_fences + num_fences, old->max_fences * 2);
+		}
+		new_max = max(new_max, old->max_fences * 2);
 	} else {
-		max = max(4ul, roundup_pow_of_two(num_fences));
+		new_max = max(4ul, roundup_pow_of_two(num_fences));
 	}
 
-	new = dma_resv_list_alloc(max);
+	new = dma_resv_list_alloc(new_max);
 	if (!new)
 		return -ENOMEM;
+	new_max = new->max_fences;
 
 	/*
 	 * no need to bump fence refcounts, rcu_read access
@@ -205,7 +211,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 	 * references from the old struct are carried over to
 	 * the new.
 	 */
-	for (i = 0, j = 0, k = max; i < (old ? old->num_fences : 0); ++i) {
+	for (i = 0, j = 0, k = new_max; i < (old ? old->num_fences : 0); ++i) {
 		enum dma_resv_usage usage;
 		struct dma_fence *fence;
 
@@ -216,6 +222,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 			dma_resv_list_set(new, j++, fence, usage);
 	}
 	new->num_fences = j;
+	new->reserved_fences = num_fences + (old ? old->reserved_fences : 0);
 
 	/*
 	 * We are not changing the effective set of fences here so can
@@ -231,7 +238,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 		return 0;
 
 	/* Drop the references to the signaled fences */
-	for (i = k; i < max; ++i) {
+	for (i = k; i < new_max; ++i) {
 		struct dma_fence *fence;
 
 		fence = rcu_dereference_protected(new->table[i],
@@ -244,27 +251,29 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
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
-	if (fences)
-		fences->max_fences = fences->num_fences;
-}
-EXPORT_SYMBOL(dma_resv_reset_max_fences);
+	/* reset fence slot reservation */
+	if (fences) {
+#ifdef CONFIG_DEBUG_MUTEXES
+		WARN(fences->reserved_fences, "reserved too many fence slots");
 #endif
+		fences->reserved_fences = 0;
+	}
+}
+EXPORT_SYMBOL(dma_resv_reset_reserved_fences);
 
 /**
  * dma_resv_add_fence - Add a fence to the dma_resv obj
@@ -294,8 +303,12 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	WARN_ON(dma_fence_is_container(fence));
 
 	fobj = dma_resv_fences_list(obj);
-	count = fobj->num_fences;
 
+	/* dma_resv_reserve_fences() has not been called */
+	BUG_ON(!fobj->reserved_fences);
+	fobj->reserved_fences -= 1;
+
+	count = fobj->num_fences;
 	for (i = 0; i < count; ++i) {
 		enum dma_resv_usage old_usage;
 
@@ -308,8 +321,6 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 			return;
 		}
 	}
-
-	BUG_ON(fobj->num_fences >= fobj->max_fences);
 	count++;
 
 	dma_resv_list_set(fobj, i, fence, usage);
@@ -531,7 +542,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
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

