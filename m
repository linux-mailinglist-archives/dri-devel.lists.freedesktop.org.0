Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9DC78718
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280C810E839;
	Fri, 21 Nov 2025 10:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vOf8RhcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF7E10E837;
 Fri, 21 Nov 2025 10:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW5n6mQJRue3miGZrlRlW1jXVqDIf+sBCZ7VqQbcBr8HGFMrQvboQLsDyntLw+xFBoMK/55ssW9MUsrMY/sa+QjBimT/+j5XTNJbjx1ckbYVWBS0BZiKkRAFDaVFBz0TQ9A2YYSZ3Dk8D4rLRf7ZaChHCZbBAdnwa12+lFS606K3cm1/LQsmzTtAmjrwKflVimGzxMl7gLmSH5pZGjrgYEOSiqchds7oNW/33vV7XrJfoUlUL7paaE71EXvGmVtdwGlj90RaA1L/VS1ykp6fqhRE8KJifQoiP2ZZd5zb0LTI9YJ2+4EQfT5v5LK5VmyziEglfPm1HHIi96HABX73lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5P+grVkQ+WAmVZRzMRN22HyvXdcYUV4NmJNuigoBng=;
 b=w++kSXHIbK26uT5S/xj+KFEsTRTpg/Fbve6I7Pcw9luCVPWKrPKeBB81k43zUEI49C8KRL31jedgGH7NSkt6zHAELABz0MWGCHkx77N52scXVKB3KpVDxscFHEJxR1vP78PZyJpRccBTaIGUDB2HeLR9A2HUykRajE2oQhzGg08vQENKKOOIxiWgkZnOy30pv62g6drx32+ZbxTiily8AggKidF7+kr+SqsxZLCg91WTa7vkY61CaF9H0HD5FFhyHUH6gmNbA5UpO8DabrQ6S520zyO7HqJ2U15Y1fVMHZ4j9W25HypCEs2YgJRRW9K5pp628zUJJFVCezMtYLp9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5P+grVkQ+WAmVZRzMRN22HyvXdcYUV4NmJNuigoBng=;
 b=vOf8RhcVTNNzkGQIRW5U5vdJkC0j/3bWKgt2ZE4H21jjKqLiwvpCX5paKdPo2XlWsEoe/LeGYNozl+uWsRbOFkeXNp9ddUkuwfAfHNwoFhDrKqJW/96jQNkIXFjkJTROvWDgjEvqUIad+bMRtq0Y/wGSyKvo2A7e8fjWNNq1oWc=
Received: from MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 10:17:48 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::ae) by MN2PR07CA0030.outlook.office365.com
 (2603:10b6:208:1a0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:17:48 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:17:46 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 18/28] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
Date: Fri, 21 Nov 2025 11:12:28 +0100
Message-ID: <20251121101315.3585-19-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a43ee9f-7c9d-4a76-2445-08de28e73871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a2N+6WfS3HVd7xaZbbezJCKTASNdqXphd8dFN4D2ua37NP5d1XfRcFPniDta?=
 =?us-ascii?Q?iWCaRvTtL92GdNUa0qNF0VeO8vkbK3gS62UZJLdNn2bFWL5+cDrz7ua9+F/P?=
 =?us-ascii?Q?vXTzq9AJoV+6y3QyGdXxahlzHWkpnUh0Q1mw3U4a9Q+OecAzkSleWtvjZJjC?=
 =?us-ascii?Q?PLpFaC9a/rk62zr3IIyz5USQTADJzY0sHPnO6uHQYMAUgVyRYcUBBjM8ciaY?=
 =?us-ascii?Q?iL98Tf2Do7D4wS7JbTivnHsBZ8KJfp4vQSqWX0NmhH96NEz8ORrTMwKSFwyT?=
 =?us-ascii?Q?zqqFOCvmSskr/I8p55p7KFUJx85cRogGZzpq1uSJzGGdSRcttefnbuAQ+xOu?=
 =?us-ascii?Q?zTl1/iNrPCNoiYGfT1GR9Y3NlFgOeRYIEc70yp02Q/RAuTX+BumUxhxMgc3d?=
 =?us-ascii?Q?Hwg78eJwEs75haGjuE2d+JS0Hyu20BzB8azaEx+2qL6U6MgOqhViwAKYZERh?=
 =?us-ascii?Q?VId+M13xh16sDUTPyLXct4dfPLll/T8RpkS0LjcKYg4I9a3BzGnc6N+jMatO?=
 =?us-ascii?Q?8y9+lC+IK4H8WXBHasVcwCbHkilffLNlxfgW92d9RU8VIXdw2ObpDXdta7zT?=
 =?us-ascii?Q?1d6q46jtUsFEkzM6JpVfMlF00aMTkBNAChoExmoTxsdmEWoF2MgHz3TdlR//?=
 =?us-ascii?Q?DN1T2+4P3JLZQqdBxwpLyu0mp56JiqBxRNQJQZVBntu64EtDLfJfyR5jFaOr?=
 =?us-ascii?Q?3wwiFqh0CCPXUk0TMg4OROfVaKB9BxtquNoggRKwjt+XFMRaaUgE5uJzlnBq?=
 =?us-ascii?Q?SNKyPJjeNYednT9A/bkTtfSaCaX6A+5SPWmzZvIbsE1ykOfBsr/1N2dhHCTR?=
 =?us-ascii?Q?zq+6mECR0kRRMCL9uLlIhwuZ7aRnxWfZreYeeRks1l18MoXOCeJ2MPUX6fBK?=
 =?us-ascii?Q?xgWmEQ7ryDXRMMywQqbzW0EyIRHi7k6SY/Mk+fpnRwwCwTJExNhjV+xOszAg?=
 =?us-ascii?Q?otP4XFsPeGcb2XAF6mxeOFIrBaZ/KBQwC8edrTAMVsGtRty/FoGyKGtVcqzf?=
 =?us-ascii?Q?nnph8bKTFOHq/dUR7RikzyQLtVIhLuzlWD++UAYj+eCSYxjIs+n1yIwr/bXa?=
 =?us-ascii?Q?I3g2QL+eskeIyxiiwaddZ/lRv6oE8sqB0zB0jkS481ecskJUVqX/LYLzV8Je?=
 =?us-ascii?Q?BclFIxnhV+q3Ex2CEPhjb1x2BNWQE3mmhvTu+NGBRZTjDz4o/RQdZaidgr4Q?=
 =?us-ascii?Q?uv5xQMR/rbAZXGeoJbjxf9uwkUCybn6QrNHNPgpmDjCxqvW8RIpSE0nviYjW?=
 =?us-ascii?Q?IrFCLoPcNZpAH+7UDocxA3ztTMclbFsQDvXk74MDO7wq18AjjF9boIQj+3JT?=
 =?us-ascii?Q?8Dgb+OMsnTunCxW99PFQq0CIFNnf8N+s8cbR4D0Tb9lN+vNVq5wTg+GI8rkA?=
 =?us-ascii?Q?zyxdbvDIzONoqyMwkiLNmE4uqSTeoOvmfQ4fcly0a3h67HoA6fHJQ3klXhlU?=
 =?us-ascii?Q?Iiyop7smt6igRAitYcMPtqHxgZpJnV8rVCGSxt/N3rraH+h7Q3NNBQJBoQuE?=
 =?us-ascii?Q?zjbzrcImlmWTPDDPya7egMd+Ulq0u/HJXYbXInlc+f7iEFnKF+0+cUEi3dk7?=
 =?us-ascii?Q?EuPYFTmzSAb9OGxl7Y0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:17:48.2255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a43ee9f-7c9d-4a76-2445-08de28e73871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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

It avoids duplicated code and allows to output a warning.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 54f7c81f287b..7167db54d722 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring &&
-	    adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
 		return r;
@@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
-					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489880b2fb8e..9024dde0c5a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2233,6 +2233,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
 		return reserved_windows;
 
+	if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
+	    enable) {
+		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+		return 0;
+	}
+
 	if (enable) {
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
-- 
2.43.0

