Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA7C9AF61
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5273A10E5E0;
	Tue,  2 Dec 2025 09:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CmlC+u4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C710E5DE;
 Tue,  2 Dec 2025 09:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfvaNQYsp938asEELHza0iNsjETFmq2D7yS6vMFEoGAm04eZSRQo5rmiNBOIFURbjpbTb5A5+QBEQnS+nUyQfoe6ve13EgCPYBhm/NMm5nvx+ZEE3jDHmYIKI7XxUU0yAECWYimR3dZo57201Nm2pEeT1IiRiXinE9GsfOlLGkVTVhY8kugRCPPSxPP6dgvupYQqFBEBIrzr2BVjyz9Hj9ktznFzXKAV4keTk48tI2QvwKUoDzdiOzTMoQNmqnkLAwkM82GIH4kFD1iP37zX2X5LTVcwVxAQEw2yMd/qUTb4aSjf/nhoeR3HOoEAx4kS7Vb0hgCJmR+IaNZ+ah4H/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXCP6D0ljYaaEkyJy2IXgB5t1vGgUHMUpO8U8kcDkMA=;
 b=CdaQA/KsLV2awzmykhglthmBiG5IBq99Iy18YKOmW54e+f10rX4YBUOnHk6jbtrn50a3M2XGA5p5fp1k/HYzzCeXPW8JstjFJ5C+X9kzRMSsT1ve6/Pmu/YG3bXUs3CgLyqRJkbyCirikxyL03rlrDlO2Enu7GItgvys52UfDvfrQldexzhrvh5oWU8eyVkZvD/Wr/d+JXz5kLPmsUHwaCWFa02LqPwON78hVyoSwu5sDo6JKZot2Q1bzXSi41FozPxnAF3mYdLeBM91C9j99rxTF/xdTMj9uhGnQhNSN6ZhNoaWKfpKuQtbgMW3Vdr2UhsmMB3xIrZ2rE1VamqUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXCP6D0ljYaaEkyJy2IXgB5t1vGgUHMUpO8U8kcDkMA=;
 b=CmlC+u4PGHw+p6HSfRC02AHzgt4TmMSFH+e7OluHCT1z9m0XBTHBujwhoGBHdOzjIvp1taSDKXI7vA3IVXoA6X3C7b1g9ZqaMk86gq/7juqeSReH1AqOv72n8uUc/t53MAipetUrx8ChUGwgTrLbge3G68A2Bdc7ywzexojJz8g=
Received: from MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::31)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:51:01 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::dd) by MW4P221CA0026.outlook.office365.com
 (2603:10b6:303:8b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:51:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:50:52 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 07/13] drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
Date: Tue, 2 Dec 2025 10:47:17 +0100
Message-ID: <20251202094738.15614-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: f379dd74-4f44-4e1b-6087-08de31884cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?USNQwzHR2ZW0CmD96BMSOJbN88jj64FID1tLiJX095wnkObzCKCQwSVVT94L?=
 =?us-ascii?Q?vi7E4wHOdj1XlCyuCtXTPtE+7hkw9DptuwThHdKfR5vPFMVgrusLaOabTMXU?=
 =?us-ascii?Q?P6q2aeLu7AsDRxCfTN/aMim26eRiH5P9A4NIQjwOVv2tz0BhZJtfsLbQUMjI?=
 =?us-ascii?Q?7flHrj2NamygSLfKbDaCFbt3pBuz6bXUydXihoe2VxJP74xE4vsmbK44a3m/?=
 =?us-ascii?Q?1dBegbtaLUI4PoVbS31YxBwjndSQAcmWvDSka6SKPI6dhqTeGqJDT4Nf4SCF?=
 =?us-ascii?Q?t91CQuKdxOqxUO1W6iZY2JB8xld+ZkZP62cDgW6+cDQQaK9VXmWX/MQ68/s8?=
 =?us-ascii?Q?8A71v58hlECleZJ/BtSS8VHFCvWFfV9FdogBkZX8NtNsGGBUHH0wff9L62kk?=
 =?us-ascii?Q?yCIG+K0lLPRy21h3uT4tat8ZXdHQmJr8dFYw8H3w/8p2fxk053hRssDwGB1o?=
 =?us-ascii?Q?grxFjq4yi9rrkwuQ2RGhMjM4mt5HQPRmjTqbJkq24moSOQisWHASnN6PIGFp?=
 =?us-ascii?Q?a/wMlCU0tR3hTtAAW+pEpXoSRXnfEtqevAdTnrgNztCHxznYEGdCprc+Si64?=
 =?us-ascii?Q?uqSKZQfjSJTIIWwIKbUyLJ25UnccKkQvuU+kYq3M9eVWlQpKXoN++kF+J4Nz?=
 =?us-ascii?Q?WQcHBfTM8I6n07pvEp5bXuEtduABK5lUwxP7S6Tf87DOvtbL3mqiDa3ofNza?=
 =?us-ascii?Q?tM+g+7D+4WM7eUMjjZPnYNDCGUAoq2pEs6pRxZERu0PLFKizqFrpCJY8DZH6?=
 =?us-ascii?Q?c8tt5602+w4fjdIRRUPtbl0b+OWYOkggTn8asqFGKdUZY4hU/DwKROcw99Fd?=
 =?us-ascii?Q?xXQrJcPrLYHwm5gHq20RlsTh+epBeBmon9ETS61c79FBAmmG3OWfyBKpuVOr?=
 =?us-ascii?Q?kNiJeOgJBo/w35nQV2FSUzg1aLqWBZhB3qCLgWc1M/m5rRTl3eRsrw5UYhnY?=
 =?us-ascii?Q?yg7AEdKMI6TMVV7oQHOs/maJ0Yy8zTmOINIxhJgxKEU+CfOl0o5b9l0UxOu+?=
 =?us-ascii?Q?0NaWhSAWHUsBVHg7QDar9hIHuUzZPvk+UdujGWWDCti3dsqTpt+DYGdO5Tzs?=
 =?us-ascii?Q?6myi8Uillc7FMimlaajLySeNquOH1jheDt+bXiqD9OLlSNSeuVuw+gU7SHb+?=
 =?us-ascii?Q?Lb//rENqFNGaDRdAKBlBlgIfjIFCNnyJ15n4HXyWWXfxm7kmWamWa2txY1aS?=
 =?us-ascii?Q?VGEFq3c4T19yn0I/U0SUeIKKN8lppomlasybo8AoAETID/DIgwuXHKYuj54T?=
 =?us-ascii?Q?JzAr+l27v8LZBEdXuetaHLKtJhEaCK3OjgLk0yyNeqw10laXru3szAsEK4nd?=
 =?us-ascii?Q?/HuZbNl5Ek1CXYyPPtaS/guUT1IQ0DvCl0tfXRemDgnSW69K5aXwOjqUz5xi?=
 =?us-ascii?Q?mEgfAAOH2Jgpcc7eDFO6XLRxRczTvq2qb5yM4OC1OJBM+ExGiPdInME55KX8?=
 =?us-ascii?Q?LG4MQ6U17Srjlzn6OyxzaetTnUjZeZ9k64FYjjWcnjvtb0LCLfU5PGgvkT5T?=
 =?us-ascii?Q?OBEAQTYwlKTTmvxBxlKWhusyOOKo9vYr7RtmqREqHWHRTi6FyZC17mgyzTdO?=
 =?us-ascii?Q?EBacQLmXPDbV5V4JnlI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:51:00.4638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f379dd74-4f44-4e1b-6087-08de31884cbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
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

ttm is going to use a variable number of windows so we need to get
rid of the hardcoded value.

Since amdgpu_gtt_mgr_init is initialized after
amdgpu_ttm_set_buffer_funcs_status is called with enable=false, we
still need to determine the reserved windows count before doing
the real initialisation so a warning is added if the actual value
doesn't match the reserved one.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 21 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  7 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 12 ++++--------
 6 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 895c1e4c6747..924151b6cfd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -269,10 +269,12 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
  *
  * @adev: amdgpu_device pointer
  * @gtt_size: maximum size of GTT
+ * @reserved_windows: num of already used windows
  *
  * Allocate and initialize the GTT manager.
  */
-int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size,
+			u32 reserved_windows)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
@@ -283,8 +285,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	start += amdgpu_vce_required_gart_pages(adev);
+	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * reserved_windows;
+	start += amdgpu_vce_required_gart_pages(adev, start);
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d3d0419397c5..5e40d47398a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1906,6 +1906,7 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
 int amdgpu_ttm_init(struct amdgpu_device *adev)
 {
 	uint64_t gtt_size;
+	u32 reserved_windows;
 	int r;
 
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
@@ -1938,7 +1939,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Change the size here instead of the init above so only lpfn is affected */
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	reserved_windows = amdgpu_ttm_set_buffer_funcs_status(adev, false);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
@@ -2034,7 +2035,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Initialize GTT memory pool */
-	r = amdgpu_gtt_mgr_init(adev, gtt_size);
+	r = amdgpu_gtt_mgr_init(adev, gtt_size, reserved_windows);
 	if (r) {
 		dev_err(adev->dev, "Failed initializing GTT heap.\n");
 		return r;
@@ -2173,17 +2174,21 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
  *
  * Enable/disable use of buffer functions during suspend/resume. This should
  * only be called at bootup or when userspace isn't running.
+ *
+ * Returns: the number of GART reserved window
  */
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
+u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 used_windows;
+	u32 used_windows, reserved_windows;
 	uint64_t size;
 	int r;
 
+	reserved_windows = 3;
+
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
-		return;
+		return reserved_windows;
 
 	if (enable) {
 		struct amdgpu_ring *ring;
@@ -2198,7 +2203,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
-			return;
+			return 0;
 		}
 
 		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
@@ -2229,6 +2234,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 							     used_windows, true, true);
 		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
 							     used_windows, false, true);
+		WARN_ON(used_windows != reserved_windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2247,10 +2253,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	man->size = size;
 	adev->mman.buffer_funcs_enabled = enable;
 
-	return;
+	return reserved_windows;
 
 error_free_entity:
 	drm_sched_entity_destroy(&adev->mman.default_entity.base);
+	return 0;
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 6e04f80b6a75..2b9f143ab968 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -40,7 +40,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -135,7 +134,7 @@ struct amdgpu_copy_mem {
 #define AMDGPU_COPY_FLAGS_GET(value, field) \
 	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
 
-int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
 int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
 void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
@@ -169,8 +168,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
 
 int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
-					bool enable);
+u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
+				       bool enable);
 int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct amdgpu_ttm_buffer_entity *entity,
 		       uint64_t src_offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index a7d8f1ce6ac2..56308efce465 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -459,11 +459,13 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
  * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
  * For VCE2+, this is not needed so return zero.
  */
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
+u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end)
 {
 	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
-	if (adev->family == AMDGPU_FAMILY_SI)
+	if (adev->family == AMDGPU_FAMILY_SI) {
+		adev->vce.gart_page_start = gtt_transfer_end;
 		return 512;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
index 1c3464ce5037..d07302535d33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
@@ -52,6 +52,7 @@ struct amdgpu_vce {
 	uint32_t                srbm_soft_reset;
 	unsigned		num_rings;
 	uint32_t		keyselect;
+	u64			gart_page_start;
 };
 
 int amdgpu_vce_early_init(struct amdgpu_device *adev);
@@ -61,7 +62,7 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
 int amdgpu_vce_suspend(struct amdgpu_device *adev);
 int amdgpu_vce_resume(struct amdgpu_device *adev);
 void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
+u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end);
 int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 			     struct amdgpu_ib *ib);
 int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
index 9ae424618556..dd18fc45225d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
@@ -47,11 +47,6 @@
 #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
 #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
 
-#define VCE_V1_0_GART_PAGE_START \
-	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
-#define VCE_V1_0_GART_ADDR_START \
-	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
-
 static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
 static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
 
@@ -541,6 +536,7 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
 	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
 	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
+	u64 vce_gart_addr_start = adev->vce.gart_page_start * AMDGPU_GPU_PAGE_SIZE;
 
 	/*
 	 * Check if the VCPU BO already has a 32-bit address.
@@ -550,12 +546,12 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 		return 0;
 
 	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
-	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
+	if (adev->gmc.gart_start + vce_gart_addr_start > max_vcpu_bo_addr)
 		return -EINVAL;
 
-	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
+	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_page_start,
 				   num_pages, flags, adev->gart.ptr);
-	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
+	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_addr_start;
 	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
 		return -EINVAL;
 
-- 
2.43.0

