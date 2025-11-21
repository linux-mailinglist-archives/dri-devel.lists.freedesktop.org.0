Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A280C7871B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A827610E83A;
	Fri, 21 Nov 2025 10:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DuSitclj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4158A10E837;
 Fri, 21 Nov 2025 10:17:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMQt8SF8BuOqiiL9fG1KiH5jmRUK1E3uA04YfirFoC9OqrjpJFtMjRVoiFMk0c29X36YitDnF7lQfJMecdMJ/dN6AhoIUgp+3TDeMsd3WdjIdO4q4RaloXhnpW/NmmnYbyAj4umwK4VIduGMgxg7nxMuSYxyzGz3gaYxUDXjt7eHlGoKvtiAQBeBsViXfWBq2x0N1ewypXqf7aHRgncE8eyUx93MDti9EC2Ju0uZcyjtY2uV1sEo5sUbzSCTmI+DyvGWIWG95U7aUjXuCt4GyB7jLzE8gI9n7BkK1OSLf44tU+7Kzn6NAcE+cRcp8NKf7ePr6t3QUXXgJoSDPcZ+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSEZx1IBodQh16g/VJ9UWLIb3m5JlsfwXoC0xDCq5Dc=;
 b=j5/7J4Z6svKu44Z1o09VEP+3stlK6czrBToQmUiCsJXWCGM/7ugIglvHBiQax/i/Gxb48Gip1GgrnpCUtx1NWG11y+AM5ldWhtLfneJJLhMyMWOgfUya52OwB8gQraUR8LI/ozP/DKzIDL+hoBbgJ0/IT9GtK2TGtiBZUTlX4Zkmy6LM8kVvo9eiZQmPLw2GzzOv1ouFOLxKBXaOHWx7FV9UEHzQ/TmamxAd2kO2PyuLmnaCW+dg4eeZoHBnvxxwELY87HG+JDpw6NaYAzK2XeY8d1QepPEUNgpgTLtwXEbDmXKRFqJUF0A1PqzlKpFSz/T46zc7K0EhkvejzJ+37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSEZx1IBodQh16g/VJ9UWLIb3m5JlsfwXoC0xDCq5Dc=;
 b=DuSitcljQGPq7ONJE11YimW0N2cKq2u6s51mnITUXcXWWurOUzBv83BiqCg/0cO8v6lDZn7yAyv6vvtRiTIdLQLzxEg3hOT3vR9LVrQ8KwKGVvYULBFafNdokxez+r3lLosMbe0G+SLr4ggih0T3DvjbkuU9o9AceoJQYnfTtCU=
Received: from MN2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:208:1a0::37)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:16:37 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::b1) by MN2PR07CA0027.outlook.office365.com
 (2603:10b6:208:1a0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:16:37 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:16:34 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/28] drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
Date: Fri, 21 Nov 2025 11:12:22 +0100
Message-ID: <20251121101315.3585-13-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 594f82e0-99a5-4bcb-6642-08de28e70e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mmQFvI53Vp/thgqVV2tI7eny4kT+4QtEifkPRNDhpp9R2B9jaSejO0oyWIKh?=
 =?us-ascii?Q?FTBBmCtr4BCZI+KvBW0IrKNdvmmxuqpgs5SMKHuBRXJc5WxpVUU1GgggFzkF?=
 =?us-ascii?Q?CW0kUcwpjIbq/cBchw793qTvgI3RtWT0nmvP3Q+BKutBkxNkJBZmWMkCM6iX?=
 =?us-ascii?Q?oMXFO673phIKK3+uf4PMmLTbfuC0qS2N2hatpSb9x9ABObVusfIYClcFq60J?=
 =?us-ascii?Q?B11bPaIiPB8MsrFh2QsUYIsDP12tDlUEuxN6ny8YHWgnqcBUMJC2dgJ/Vwza?=
 =?us-ascii?Q?b1cBsKzdv6M7UjrNyhtzsyk1Em+OZ71RBnbclDUpeVbvchP7p2WgcazwQ3qZ?=
 =?us-ascii?Q?fecvQZ/L6mOk9ZcGovRhmq5j0rI2z1IjvRkD8aqNUSeMmAvQ4EIZX3u6A0c+?=
 =?us-ascii?Q?opFi0nN3xG/5xcUKuSFJum2xybxp3CkEtxOK9xAL6asmjYYFSB0QLPAbnFFs?=
 =?us-ascii?Q?1dvsm+bu1If1MILjxQoo0IMb1QtqvqS0spViguSAlBARt53gfpbOhsba47jS?=
 =?us-ascii?Q?yyyTRran7ZED7X3tMeqNH5sSZeHB+rJGmAW54kzI06BogL+KiCxKHfHbuUqE?=
 =?us-ascii?Q?ObU8aeJNse6/FjaOmrTXGJe3UCn6wgUuJD7DuTvLHdtsOq/XDhmdc/tBJ1Cf?=
 =?us-ascii?Q?swzNlEOVpkyvBZzi1CpJlFUaLmplF9/HEonzR2lWyluoHwPf4yuKxYgHk75s?=
 =?us-ascii?Q?d5RmHBOEBhHbuLKC0sgcFOnbYLocKLQhqSi5tadG/lMlLjQseldcHmxff8Dt?=
 =?us-ascii?Q?K0bupSIS+VJQKknbhS02Drtg4Dfi+gB0ZxBfd5jYDveTsxaxetX09mGbf+bv?=
 =?us-ascii?Q?ABhQWiSbTT/Om0qQ0U2ZZyjSxDB8eXgPeLmc4/37L7teHC+qdAVsLTqliSHD?=
 =?us-ascii?Q?hgXvOwXkziB79kJQL0KoGnYTp/RrG2H4ZSn97Cxa+e4X0irzR4TLC7uxrG0h?=
 =?us-ascii?Q?dZJbgDCtdjl3KMomaxhqM6Lv8LVMP02EPJ/GPHVpeEUUY06Z3QR6ZQHQ2dpw?=
 =?us-ascii?Q?AC28MOht4MDBKly0cV1cn2X+bk1By4wTvTB866+3WVI7HT21GPS6EnXdgJkl?=
 =?us-ascii?Q?vll7PDy7RlOqw/Qu63Gkk8igMOjvpRku+TadYjzBRcB6aV13Oq/VmIGBmG9N?=
 =?us-ascii?Q?0dc7EYdWysjqNxoUf3xFM2NWs50LD4Llq30hH32HyDpt47PMF+f0LEuTCO9g?=
 =?us-ascii?Q?F6PI/qs4BKKJsN6d0q2lI1oS7KM+MLZv5lIi2jK/42JfsishKdGGkdpfeIM3?=
 =?us-ascii?Q?rS4/9kygLfnd1PTuSOlt2nNI1Ww21PzES6TNpQUReFT9G6xhUZZyF9/7kiFu?=
 =?us-ascii?Q?pGoRvx0sCSkKzV+XwcRvCAOx6KY2pvU9mzoDJ6ORSxzekQqeESVgTBvsJ970?=
 =?us-ascii?Q?DjWWmU9qPE2qrBgpWVtDbP6AKOk6UgzjPkxIejvBY4KqWTELjmPpZxxqA6Ot?=
 =?us-ascii?Q?hhxJIZoLrxoxprH1Br0EfArR5tlf41HVTKJWdz/yOiJruXjAWskPjqvoIT/1?=
 =?us-ascii?Q?t2808x2tm6UJtC+CBPnOoCVKCxLKILqPmjfKFCyYYomF8VeJXATOXATgxMl3?=
 =?us-ascii?Q?laRKUH4gX/F+ABvHvpc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:16:37.0607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594f82e0-99a5-4bcb-6642-08de28e70e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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
index 1371a40d4687..3a0511d1739f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1907,6 +1907,7 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
 int amdgpu_ttm_init(struct amdgpu_device *adev)
 {
 	uint64_t gtt_size;
+	u32 reserved_windows;
 	int r;
 
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
@@ -1939,7 +1940,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Change the size here instead of the init above so only lpfn is affected */
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	reserved_windows = amdgpu_ttm_set_buffer_funcs_status(adev, false);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
@@ -2035,7 +2036,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Initialize GTT memory pool */
-	r = amdgpu_gtt_mgr_init(adev, gtt_size);
+	r = amdgpu_gtt_mgr_init(adev, gtt_size, reserved_windows);
 	if (r) {
 		dev_err(adev->dev, "Failed initializing GTT heap.\n");
 		return r;
@@ -2174,17 +2175,21 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
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
@@ -2199,7 +2204,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
-			return;
+			return 0;
 		}
 
 		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
@@ -2230,6 +2235,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 							     used_windows, true, true);
 		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
 							     used_windows, false, true);
+		WARN_ON(used_windows != reserved_windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2248,10 +2254,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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
index a7eed678bd3f..2a78cf8a3f9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -40,7 +40,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -134,7 +133,7 @@ struct amdgpu_copy_mem {
 #define AMDGPU_COPY_FLAGS_GET(value, field) \
 	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
 
-int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
 int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
 void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
@@ -168,8 +167,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
 
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

