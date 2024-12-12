Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5A9EEDF4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E453C10ECF7;
	Thu, 12 Dec 2024 15:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IHN8dQfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380110EA62;
 Thu, 12 Dec 2024 15:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKhtiTAkLc9hYWPfVw9flZxoGhm15zSuXyAugeI1C1sm75h4LYg0zpgCOsmm5XLiSn2MoCbAlmEEVIly57+z7w+pYiXu5FFB3oEzN2CjMtBg/VLJwlRQGDJGYqAjDOPMSuLcINVtLaR//Nc6j4KZbyPqUJOI8KvpcE7GCADxKmsN9HYSoWnUrDS5YH0InGJYRPVMJoPTc+ScYl6YvdWmxBZnVm1aBQ3hA5caG3akOKtPhA1T0jGKOUUa1+aaFT2GAjs5Kpb8HMi5XAiuNpSh02K0Cm23W9JITGYl4uAlaqKTDzrkzxa0q3AvBap56JTWbpiVqc+KAflBKwwzmzGyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnNQjj7uotT1b+wG3D6N5OJ5pVfY1XdEt1EWUx4xTLs=;
 b=XwDx8PFi2MjZHfMfZaQ/tCxeUXdJls+4n0Ymg3xInvUpAzz+WB9HBplwYtaO1oB0dPhQkJWife+bXcqMOGbFbkdm5cWjgwUYLT93whyx7QKVB1X5kWjC6vmr5GrImlECh1R5aCBtS4zzV3nsp+nuk5FhfFdT6BSytfFtzfuD2jW8wCw7A1/od/nllYCma+GVp2v3qES0Fl48HuFOlcSp5jFpXieRfHg6cyWFHKk06tbKHaojJtlntbOHOhhArl5cOVOy0vjV4hTbDpW5G1qaGp80pRIFga7/hYML4DsMCkkPDqhK7KC1Bg+Jpi4b0C9H1DjBSOvfqzLEg0XshYRniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnNQjj7uotT1b+wG3D6N5OJ5pVfY1XdEt1EWUx4xTLs=;
 b=IHN8dQfzp3sh7CJ1Tku0JLs2IHKr3h7EVH8SBVWyTGZbUHJBOLA0Y82nRpPJ2ElVRukMc3fiQ5+9xm4O+yHqBClu0aNGDjcBCiyri0kyuZoZZLNtix329b3R4qgYvhMOK5mtnCM11EEUpzsFkslU278/1xfRP+xjHSmlEWmjm4M=
Received: from CH2PR10CA0025.namprd10.prod.outlook.com (2603:10b6:610:4c::35)
 by BL1PR12MB5971.namprd12.prod.outlook.com (2603:10b6:208:39a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 15:52:23 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::3e) by CH2PR10CA0025.outlook.office365.com
 (2603:10b6:610:4c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Thu,
 12 Dec 2024 15:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:52:23 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:52:22 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v11 2/5] drm: make drm-active- stats optional
Date: Thu, 12 Dec 2024 10:52:03 -0500
Message-ID: <20241212155206.5030-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212155206.5030-1-Yunxiang.Li@amd.com>
References: <20241212155206.5030-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|BL1PR12MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: cab779e1-1212-4521-aa65-08dd1ac4f806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kABN2n9uxji6I+WutztDMxOxko2yxdUzYzodWCErduX/SU+NnQ11SOaUGV4+?=
 =?us-ascii?Q?syU1/M2HGz92+0GbxJcHSapu89k8U3DCvovY061vOAvvaTtU+E/GAiA2cTSb?=
 =?us-ascii?Q?Pj+Y2UwmQL0QgvE9sHK3ndd7G0EbyK72/WsRjOQ5BXqASmLzh94kJ9dzo9X4?=
 =?us-ascii?Q?0WQTeAshYVTGE60XZcYbeCAaSEmdiX5LTYzx5MZEwhq3gaMgRYGHyMj+VIms?=
 =?us-ascii?Q?fhZEpSDwgUXUXKCRVguXSjt5XxpkC39ELCHtD/SGViWCVc/IY5MN0NT+TbWF?=
 =?us-ascii?Q?eZYWzhltNq31TnEZ+m9At8FC81vYhDLBKxOAZp77/j0tDi3KNlwypL6QXYhq?=
 =?us-ascii?Q?3PBI8BZaCAVRXjZjoR/I5cH8IqkIoqQCVoSQ1STo6gXjGu3wAeHpknRwk8mo?=
 =?us-ascii?Q?l80U22WgqaVysb+0cyYqMyBPNNFyLQ8VZn/uTCrcpXQF30tQz9JLXHXyUTxm?=
 =?us-ascii?Q?IKwRq0juGakg6VoqtCq2b0r+ajYfPPxUeOIkszf0DKDihTqbHk+YOvYhqTcs?=
 =?us-ascii?Q?c+EShETmlY0sLMZhcFwlRjBOTP1SLzgSXdRpkgGydyfQYCRRZEhdFzlT1UaA?=
 =?us-ascii?Q?rklYzgcbkgdsOuWduN/1jyzFjbEuKqAvdYXGFwTYjN2xG/LQKr2NyDZp/oB8?=
 =?us-ascii?Q?GZ5P5h8FlSug/hAo2td+MDydYRwL+WCHxqI1KcZDRKXD/nLPeKbe6euCBu8s?=
 =?us-ascii?Q?TUY7bxYgrrmW/2D5thsJdVpGxhHpBaQXuVQRLtdajz+NSS3l6rKIGHgjKJUL?=
 =?us-ascii?Q?6uFMzOTQUf4h0gRpF/Xodx9OJw8t7TWDDI5OBU/7/xVTnIRi5khTkDz/VDMo?=
 =?us-ascii?Q?dG1fEFMke54kc4BADlJOibTe8BhxuRyr99YUWpK9oAwkJnNTVYFBQkg/LxlO?=
 =?us-ascii?Q?/Guy1ZqUl5cdHKicUUO7Yfxilm2rdAVtJvKVZVkl7rwAPiLDH1afAxiq4msp?=
 =?us-ascii?Q?prQ4n4IUKdu+XQutCeyMu4D2XmS81j3m40pGfUeUPZ61SBE82qX7Y8av3IBA?=
 =?us-ascii?Q?lxR865UywevbuJl2TRHbGzgeK2XKxZjD+UG9W1gRMJRbXd38PmPmnCW6OXSf?=
 =?us-ascii?Q?Kfv9xapbR851LLEVDwEUu9CUwSs7/n86JlEQn0HppxCppw0m/kxJ8OgqSHVE?=
 =?us-ascii?Q?sdus9A8WU5i48bFrGu94n9fWy1Zaqyv8V2Eci2ZoWu4yK9WDn2wSvHcXzZFA?=
 =?us-ascii?Q?/VLoZkBo/EfNkPpRz3PlbYr9FS35nDLU0OyI0bnKZ2T8o1STqOyNWVkBPGsd?=
 =?us-ascii?Q?di1UUh8zsWQ95BQuuV27nKtOv+YQReHe9T+GAPNX+aF/qszRBv1y1HzrdQus?=
 =?us-ascii?Q?kkTq0rEjrRmo3pU9bPrLvNBX/Bmk77F2VbSa/DojhbRcgG//1JGTwWK6JTJn?=
 =?us-ascii?Q?1fOcTDFEANBlKEsy5YjQfsLRjF4WsbAoFDHTuhQX9yjfXZWa2HbHYB8oQVSe?=
 =?us-ascii?Q?3w3YOsTxVDQGuCyf6fAsppBz/3xau2Ty?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:52:23.2639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab779e1-1212-4521-aa65-08dd1ac4f806
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5971
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

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
2.47.0

