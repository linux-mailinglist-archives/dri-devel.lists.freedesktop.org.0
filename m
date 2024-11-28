Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F619DBC4E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 19:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C6110ED40;
	Thu, 28 Nov 2024 18:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="epx7aDIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CAF10ED36;
 Thu, 28 Nov 2024 18:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWnbe2z1BCao6v7JH0YLaWgh+hJt/wefml7ROjuwdG4My9eqTHiijLl7mD62W02ZGMZkwgS/82Pv1EbhK2UkUZIrOvGdTnKwdVYRdMYPwcKvPnKaAmE7Zud4aU2QZVI32UOq7eR1LZ7EOqgbxw32XcGZNL1wr/fSZA3WctuYAEKHYO+aBQ1j4CEwvY2as3ZC8aJbEzbO+MPTBl0kEXvwfR2WX0XjzxZdbc0D11oyW0dWQcQxcDY174kD0uiiyHDMqVyRQpQ36z9dc/mX9Os7O+Upbbpnc3Rn9cCPVwez0uYw2Fk+bHpQ91YtO28alsmlC6rYrETQi9SbsCetXhqTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLHTfjcTCiXPpPtnlIDOB9p8wCkYTu0iaOqlmuXjixU=;
 b=eBx1gwZ7EX43oltYILALMSRuCQN4PEzP9QVdE9MMbB5Nm+5rJdJ88TvyTN1CmshG52jdELgwUyEkMP+jw3gzKf8NEX3bRaizPysqgMTJGCHtjz9UJndtxhrhOi6h24QXUnIEYu8QWqn87R9FUJvvEDoeziXAX/iV55ndRz/4hvItv8R4dcTS49za0y6gnGKQcyKG2xSCHNxxi3pmx7ajf9B9l5YitYQnsSCiXlaClh+7ZDdy4bftjjsjpgSIHpz0PvLOIUmA2BAxMwCcnYWCPo3/BTF34L2fZhgIXmnJ2eXWBng3h8OeDb6QVENZiNnPbIUubR3kdg/v210wU8VD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLHTfjcTCiXPpPtnlIDOB9p8wCkYTu0iaOqlmuXjixU=;
 b=epx7aDINJzsBB5aiKf658OMc9WsMD4mlynNnlGWhvBkMkB9wtPo/ncDttYqR31dEq1uWeUALArATbjvqmjdiD1xqsKa6OReedQonmcYWHyiZWGyeNSi+ELrdzmKlWXyJfF4yWevjHrGVgQeDvzCCjoK0vml17v15cDEwHB30lCg=
Received: from MN2PR02CA0019.namprd02.prod.outlook.com (2603:10b6:208:fc::32)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 28 Nov
 2024 18:54:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::20) by MN2PR02CA0019.outlook.office365.com
 (2603:10b6:208:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.18 via Frontend Transport; Thu,
 28 Nov 2024 18:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 18:54:26 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 12:54:25 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v9 2/5] drm: make drm-active- stats optional
Date: Thu, 28 Nov 2024 13:54:01 -0500
Message-ID: <20241128185404.2672-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128185404.2672-1-Yunxiang.Li@amd.com>
References: <20241128185404.2672-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 505b216f-ccd1-439a-4a94-08dd0fde1527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hiRpFA1OHgfU/hjHGHFLnEqrFupFR1j17jyhwPhU8sv80ZnPIJeXZcPGcc6Z?=
 =?us-ascii?Q?nz4vSLP3+dpvgulq0aXfhAyXM25HTMl2oZMSbU/zWo2cBmdbtpEdXfkF2kcL?=
 =?us-ascii?Q?5fPT3337rw6GFsik/nqKWpsQ3hcNfZMpkxqdTLdhxie7uFx2s2OQlUd1audT?=
 =?us-ascii?Q?FtOULjDui2ZsZIqVFyl8s1RoZyuhiXtmgFY0FvqaUkZ2KIlrjuh1PHoAHo5V?=
 =?us-ascii?Q?gs8debLjKL7zxJ6RU3iom/rVVhT8V12ibEIIPA1RSUjj/rgUWx+3LySqAlP0?=
 =?us-ascii?Q?xNanQ9D4ThxJUDjhGYZqTItGddCrdx9fXbUd1ZakxyMtUakPLwnu+oRX4trn?=
 =?us-ascii?Q?Syn6Nf4JrfLnSQ2lk4ta+VmtGm95H2ACU61UG0ZTRiLS9q4BwmV7+LcnRElJ?=
 =?us-ascii?Q?1QLaqKXSxQ1Ea5VomQQpdo4YT+eucCJFlFyLuOlnmF9AtLTy5j2CzJDpVJdq?=
 =?us-ascii?Q?sSpka9Odm3h67U38NOE0MFGdkGdMgmxs6MxjEds/ruP3a8FV5xHhGwp8+c7N?=
 =?us-ascii?Q?9oWNyIgNQ+tTDf31gIooGJZsX13b52LpyQOATGCDa7NXfKLnLjEoOiyL8spR?=
 =?us-ascii?Q?rcMK+d15n0evCEQnsVveNeikuqwfACrR+CmV4H/HP84MDWfb/5p7A8I3RzUS?=
 =?us-ascii?Q?w4AqZGcgAnupuiFFbk1l2Mf98CwvcwCqKrXBd1ugLtqWTdG+KCA41pcHkzPA?=
 =?us-ascii?Q?r3gVYdQiKKaylDBdhvspVLuIVYwVqTrH86WihZBBfOaTywqYNSvobgfCMQm9?=
 =?us-ascii?Q?r78ktvzEWa9OjRrGg0VSurNQE25qa33/fMp8jBvbQT4D3LL9Uqwa4uEquxwn?=
 =?us-ascii?Q?lAHLjoC5OlVKeMvv/FfzPUL4zgbi9xJjI/+dbO2c+sz8dIugiZyTmMlXb/vE?=
 =?us-ascii?Q?lU8lAJNTYdN2JYUC5oKdULkLr3Su5BDDrkRVJgRVTxc7rxQVPNLc6tzSTCxG?=
 =?us-ascii?Q?8HuUrhQPoyOLEn6TIDK1rSZZvCsSy2awQ7E/GFEgHjz0nq8blgsjsGs08Lf0?=
 =?us-ascii?Q?X4MwBUSNZNHUPW1CPB4DkTuNgQ64SZ6pxI7rzGFKfhegSijtlenjVq9abbgg?=
 =?us-ascii?Q?TWoBhrWUw9U0yqPmtnJk9wRTWXgH+L9gfs4LBKe4JMP9R+Fe+kXftxxicflS?=
 =?us-ascii?Q?NuOB8BL5j89hgybnLFsmFlu8yeO4fBkAAdyfvzUi4FZMnotPUhaGOITwAY6Q?=
 =?us-ascii?Q?HlbSUKuP6JWEm0pnIA6gfrTkE1WsYqEKp57SUyrzy1nN9oruBpHRZZS/23Vk?=
 =?us-ascii?Q?0CZ303i17Pw+WJGNWJqT8vjb3EdeoZLYUEkL4ph1i4YCkZq/jsxDCvci7Mcl?=
 =?us-ascii?Q?rmC3zBEWPv3/B3g6AnzlmunCtz62Io84BNTqI9FlhSxDNcIDVRdEh6+AIItf?=
 =?us-ascii?Q?vJkxHwz0zqQnvSDrz9fC01njfEiDcmCVdstzvr4qNp5Gzjq12OfHdcGdtYkE?=
 =?us-ascii?Q?xwS8H2cFA7SrHflbikUfhtmzHCKgvMI2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 18:54:26.7906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 505b216f-ccd1-439a-4a94-08dd0fde1527
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339
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

When memory stats is generated fresh everytime by going though all the
BOs, their active information is quite easy to get. But if the stats are
tracked with BO's state this becomes harder since the job scheduling
part doesn't really deal with individual buffers.

Make drm-active- optional to enable amdgpu to switch to the second
method.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
CC: dri-devel@lists.freedesktop.org
CC: intel-gfx@lists.freedesktop.org
CC: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  1 +
 drivers/gpu/drm/drm_file.c                 | 13 +++++++------
 drivers/gpu/drm/i915/i915_drm_client.c     |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c         |  1 +
 include/drm/drm_gem.h                      | 14 ++++++++------
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index df2cf5c339255..7717e3e4f05b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -97,6 +97,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 		drm_print_memory_stats(p,
 				       &stats[i].drm,
+				       DRM_GEM_OBJECT_ACTIVE |
 				       DRM_GEM_OBJECT_RESIDENT |
 				       DRM_GEM_OBJECT_PURGEABLE,
 				       pl_name[i]);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e285fcc28c59c..fd06671054723 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -884,7 +884,9 @@ void drm_print_memory_stats(struct drm_printer *p,
 {
 	print_size(p, "total", region, stats->private + stats->shared);
 	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+
+	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
+		print_size(p, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
 		print_size(p, "resident", region, stats->resident);
@@ -917,15 +919,13 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (obj->funcs && obj->funcs->status) {
 			s = obj->funcs->status(obj);
-			supported_status = DRM_GEM_OBJECT_RESIDENT |
-					DRM_GEM_OBJECT_PURGEABLE;
+			supported_status |= s;
 		}
 
-		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
+		if (drm_gem_object_is_shared_for_memory_stats(obj))
 			status.shared += obj->size;
-		} else {
+		else
 			status.private += obj->size;
-		}
 
 		if (s & DRM_GEM_OBJECT_RESIDENT) {
 			status.resident += add_size;
@@ -938,6 +938,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
 			status.active += add_size;
+			supported_status |= DRM_GEM_OBJECT_ACTIVE;
 
 			/* If still active, don't count as purgeable: */
 			s &= ~DRM_GEM_OBJECT_PURGEABLE;
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index f586825054918..168d7375304bc 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -102,6 +102,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	for_each_memory_region(mr, i915, id)
 		drm_print_memory_stats(p,
 				       &stats[id],
+				       DRM_GEM_OBJECT_ACTIVE |
 				       DRM_GEM_OBJECT_RESIDENT |
 				       DRM_GEM_OBJECT_PURGEABLE,
 				       mr->uabi_name);
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 6a26923fa10e0..54941b4e850c4 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -229,6 +229,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 		if (man) {
 			drm_print_memory_stats(p,
 					       &stats[mem_type],
+					       DRM_GEM_OBJECT_ACTIVE |
 					       DRM_GEM_OBJECT_RESIDENT |
 					       (mem_type != XE_PL_SYSTEM ? 0 :
 					       DRM_GEM_OBJECT_PURGEABLE),
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bae4865b2101a..da11c16e212aa 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -48,19 +48,21 @@ struct drm_gem_object;
  * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
  * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
  * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
+ * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
  *
  * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
- * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
- * it still active or not resident, in which case drm_show_fdinfo() will not
+ * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
+ * and be active or not resident, in which case drm_show_fdinfo() will not
  * account for it as purgeable.  So drivers do not need to check if the buffer
- * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
- * as purgeable even while it is still busy on the GPU.. it does not _actually_
- * become puregeable until it becomes idle.  The status gem object func does
- * not need to consider this.)
+ * is idle and resident to return this bit, i.e. userspace can mark a buffer as
+ * purgeable even while it is still busy on the GPU. It will not get reported in
+ * the puregeable stats until it becomes idle.  The status gem object func does
+ * not need to consider this.
  */
 enum drm_gem_object_status {
 	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
 	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
 };
 
 /**
-- 
2.34.1

