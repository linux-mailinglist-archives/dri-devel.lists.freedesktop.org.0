Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOcuIc1YcmkpiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D16AB96
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067EF10EA19;
	Thu, 22 Jan 2026 17:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YlDklS8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012035.outbound.protection.outlook.com
 [40.93.195.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F7F10EA03;
 Thu, 22 Jan 2026 17:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDB8OhOOnf1q/21iXfIKWRhf2aoXMM0cOcchOQbh5r6m9py3/YNmm5MJ66v0wTHGlF2mGOYBH6BGkxt0hjc1P1o0KufDV1hnTKnYYY14IBdY0qtRISNPqorO+EPmaIKe5xNkub0WIr+0Fh453aj7hyEoGwB0Qs5IEkVZYVrjE8th6B7z58B6wVYMxUFdVDg1RpceYA3fxeSoIrp6bWD018s8ewsknQsbu8r+/HC+sx+bdHsKIkDF0LeT5bJd4winFzN1cyAh9o4ObWYsGO4yQn1sNyED28sI961keWDZWvfuwG6I4c36grHapedwsezT6SDNKnvWxiZntuZjFWw/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gETrCifCvmq6x1Bl3YQmis6Atat2dT+zSXLn5uNRQ/M=;
 b=We8qqLTUAADvHVYIpYy3HpZLMCMe2NXoSMGtRBu1Rj0Xdxzk/d0RyJve2+MmYqQJRd3H9d0mrfPyb27MVwX3XQSr2KW8nPG6ekx55/uTKd0TRj3p47IMlt0Sa+5cm11vJOGB+h+7MKbCQk6Q8VAc+/kLolzHiw1Wh+iSnQIpMIJRj0zd9xwaj6IFxiukersNudsgoHmhmANEONB7a+jGUGE9iIXjzp3yf6xQIA/mWf1rOYR1fLJMJQ9byjrJHJ/vPSwhk36QKxXFVju6XZUMwaIhdpjXFJm1xyWJ5ltXCQmWFxkg3sK7iFoWQfeEqbYpmY4i2sI6eaPLPt7LRnhV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gETrCifCvmq6x1Bl3YQmis6Atat2dT+zSXLn5uNRQ/M=;
 b=YlDklS8F7EI6hWWlOyzvZiKAtkCGioxs/lM59BCLt8Q8e9L42zylfMYQsJ77itWlNTm4+KufQaK5Y3R2N8hGU5uaMSRWhliiklDwyFHUEkSnoz2Y7l5Y22EK0U7F/tGw44BnNhfm6lmP7HSOwf1pUcXWlOx3QQxC4mIRijDrzyg=
Received: from SJ0PR05CA0089.namprd05.prod.outlook.com (2603:10b6:a03:332::34)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:05:08 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::db) by SJ0PR05CA0089.outlook.office365.com
 (2603:10b6:a03:332::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 17:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:05:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:05:01 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/10] drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
Date: Thu, 22 Jan 2026 18:02:01 +0100
Message-ID: <20260122170218.3077-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2c06d5-dbec-485f-739c-08de59d8657d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L6+y+I20Godv0G6rExFD81FkV8EVY2zmYoDaReUOwQMGtflG4AmQF7NC+Bhf?=
 =?us-ascii?Q?9Ny3i8q6ljqqDTic+yOW36GbzCsyVxzSAo9qQzuSi7ktz8cVJ73NlJ5a13Qt?=
 =?us-ascii?Q?VEsVwxkpmIdTyMmk96Yd4/dLxI4nM6MU7cURF3j9VX3dRC5NlhtdyyBDtf4k?=
 =?us-ascii?Q?fzDMtXmrc8cuvRGWNm676PzMEWQ8Zs1+N6EBmuzOsy2nfKWvjGG0NKUwYfav?=
 =?us-ascii?Q?T1Ds+/KRdPRayDS3L1VpU60uYaFlc2rla2D62PUO8sUS4XqrLRWL8nnIjL+5?=
 =?us-ascii?Q?CIBlpM141m7IMYCh5GUqPprHDzG6fj9hnfUlT/XZg4ihCAXC1/Nqhj/xKjCU?=
 =?us-ascii?Q?nlVRqM1r7M1cZJbHhZd7PBwQNchhruNvGuG6v7TN6T1dDQXSqxm4yhcD8aDL?=
 =?us-ascii?Q?RwXGC8iecXpL+VuZhC9B7ZjqdN4v0ooWNTwknqf1W+7Yc7lGmAEwxCwTmHGj?=
 =?us-ascii?Q?9WHviAMr59M877t6zL9HEIHTTThqHjlxdQEZXrStUuY8wFKwadpcSRXrsPyP?=
 =?us-ascii?Q?LB9IObHa2+/bV1Do/vX3kRZ5V7RmrrG5V+v3p8MMeaaxfKg2T3Ir8dFGQzAk?=
 =?us-ascii?Q?x2eYiW/gZ0BQY9L+2vRzq1dkXtQMMFoB0eHnWc0pjWIMSXGIR8bBVyG+861v?=
 =?us-ascii?Q?KZ+IQcKGUNdUDu8+72LcKJQ5wJrwPAYcLfu2Z+/NA2zVYI8761U0DUMHjvgE?=
 =?us-ascii?Q?bOQMKx8dx3L4iSXJffN97YxrEGLGiWX1XJoCFVFmLvjLbMnjrpl7R1tYpc5e?=
 =?us-ascii?Q?gSbAr7QghDXx3MDXotBUWrW/3Z7giTEFuJW4/kf4tSMExOMwpYwSbHyONxEE?=
 =?us-ascii?Q?vKslJoZ1yaMD8/Rf8eCYSoJIyzqqq2tdcTYeEIly8P+RCSoQpwJdEUrsfDOn?=
 =?us-ascii?Q?4/Kq9hDuyefzC++m2v2P47N3PD2NSQP3UtlBYtjpvrXHdik90KasQk03P5fw?=
 =?us-ascii?Q?+URJOfHe5heJ+9A5c2ex/bqiwhTM75x1dwpNvGG4ZJtEuXQLuosVd83RRs3d?=
 =?us-ascii?Q?nA8vvbpet9yP3GKvY1V3JeERwCZ/zoP6x2dkp0GSZ65L927YkYz7BhaL/1mj?=
 =?us-ascii?Q?4OkHtpQFF7coxnJd05fq/7EhLYfXygmhlDs/9VOPojXgcNq3SxbfwicR3YEJ?=
 =?us-ascii?Q?gzSW47fQCrTxJ117CV077//EAKHmVhOV2hq6R0tFhn4+s4EgS90+tDZNDXyn?=
 =?us-ascii?Q?Bzmv2udLFxLv8pfT2q2kBK8QibPcO9tooU2Gwo5rS8mtxLzJ2uuH45xM2MUJ?=
 =?us-ascii?Q?Pgmway4I0FtJjjVCLFGyUY1Yd7Ndprul+/c1t1m49w2UICteXatN8n/3fERB?=
 =?us-ascii?Q?wFGASUYF9grG13IyYmDparL8C5rAmn1i04rtm4S+6tdEsWPEKg9rLiqNNXxy?=
 =?us-ascii?Q?l7RM9eljoAYzgkWivWZME+pEf0gYnj3wQiGW+ombMHvmvJaaOe7ULrPG/mWn?=
 =?us-ascii?Q?HdwOMCqjc9lwvY1xDHn/UE/XTIsft2JqXhOuc4Puo2k+izxGXvxWychA6hBg?=
 =?us-ascii?Q?Ydd2DB4KvY95U+vJyGkU3tj/pjqG06xhPHJvPNAcQqXHgrjA7SZK43YdfAIM?=
 =?us-ascii?Q?nxkOai4UcITJ05k2nBKc4MHYqBYTApJDVjkxoHK/vPmOiIqYZjGAlSjxmRBA?=
 =?us-ascii?Q?4xgtgTBbbOe5XJ06DYXNPV8vAcGetExbuWFaS3Ews9qOplMXskUNFNX6qj3n?=
 =?us-ascii?Q?0fn7LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:08.2559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2c06d5-dbec-485f-739c-08de59d8657d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F15D16AB96
X-Rspamd-Action: no action

Instead use amdgpu_gtt_mgr_alloc_entries to avoid hardcoding
the number of windows we need.

It also allows to simplify amdgpu_gtt_mgr_init because we don't
need to reserve some pages anymore and this makes the
amdgpu_vce_required_gart_pages function unneeded.

---
v5: switch to amdgpu_gtt_mgr_alloc_entries
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 66 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 27 ++++++---
 6 files changed, 63 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index dd9b845d5783..9b0bcf6aca44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -324,17 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	uint64_t start, size;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	start += amdgpu_vce_required_gart_pages(adev);
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
-	drm_mm_init(&mgr->mm, start, size);
+	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
 	spin_lock_init(&mgr->lock);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8b38b5ed9a9c..d23d3046919b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2012,37 +2012,47 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 	adev->rmmio_remap.bo = NULL;
 }
 
-static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+static int amdgpu_ttm_buffer_entity_init(struct amdgpu_gtt_mgr *mgr,
+					 struct amdgpu_ttm_buffer_entity *entity,
 					 enum drm_sched_priority prio,
 					 struct drm_gpu_scheduler **scheds,
 					 int num_schedulers,
-					 int starting_gart_window,
 					 u32 num_gart_windows)
 {
-	int i, r;
+	int i, r, num_pages;
 
 	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
 	if (r)
 		return r;
 
-
 	mutex_init(&entity->lock);
 
 	if (ARRAY_SIZE(entity->gart_window_offs) < num_gart_windows)
-		return starting_gart_window;
+		return -EINVAL;
+	if (num_gart_windows == 0)
+		return 0;
+
+	num_pages = num_gart_windows * AMDGPU_GTT_MAX_TRANSFER_SIZE;
+	r = amdgpu_gtt_mgr_alloc_entries(mgr, &entity->node, num_pages,
+					 DRM_MM_INSERT_BEST);
+	if (r) {
+		drm_sched_entity_destroy(&entity->base);
+		return r;
+	}
 
 	for (i = 0; i < num_gart_windows; i++) {
 		entity->gart_window_offs[i] =
-			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
-				AMDGPU_GPU_PAGE_SIZE;
-		starting_gart_window++;
+			(entity->node.start + (u64)i * AMDGPU_GTT_MAX_TRANSFER_SIZE) *
+			AMDGPU_GPU_PAGE_SIZE;
 	}
 
-	return starting_gart_window;
+	return 0;
 }
 
-static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
+static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_gtt_mgr *mgr,
+					  struct amdgpu_ttm_buffer_entity *entity)
 {
+	amdgpu_gtt_mgr_free_entries(mgr, &entity->node);
 	drm_sched_entity_destroy(&entity->base);
 }
 
@@ -2343,36 +2353,42 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
-						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
-						  0, 0);
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
+						  &adev->mman.default_entity,
+						  DRM_SCHED_PRIORITY_KERNEL,
+						  &sched, 1, 0);
 		if (r < 0) {
 			dev_err(adev->dev,
 				"Failed setting up TTM entity (%d)\n", r);
 			return;
 		}
 
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
-						  r, 1);
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
+						  &adev->mman.clear_entity,
+						  DRM_SCHED_PRIORITY_NORMAL,
+						  &sched, 1, 1);
 		if (r < 0) {
 			dev_err(adev->dev,
 				"Failed setting up TTM BO clear entity (%d)\n", r);
 			goto error_free_default_entity;
 		}
 
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
-						  r, 2);
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
+						  &adev->mman.move_entity,
+						  DRM_SCHED_PRIORITY_NORMAL,
+						  &sched, 1, 2);
 		if (r < 0) {
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n", r);
 			goto error_free_clear_entity;
 		}
 	} else {
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.default_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.clear_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.move_entity);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2390,9 +2406,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	return;
 
 error_free_clear_entity:
-	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+				      &adev->mman.clear_entity);
 error_free_default_entity:
-	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+				      &adev->mman.default_entity);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 871388b86503..c8284cb2d22c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -40,7 +40,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -56,6 +55,7 @@ struct amdgpu_gtt_mgr {
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
 	struct mutex		lock;
+	struct drm_mm_node	node;
 	u64			gart_window_offs[2];
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index a7d8f1ce6ac2..eb4a15db2ef2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -450,24 +450,6 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
 	}
 }
 
-/**
- * amdgpu_vce_required_gart_pages() - gets number of GART pages required by VCE
- *
- * @adev: amdgpu_device pointer
- *
- * Returns how many GART pages we need before GTT for the VCE IP block.
- * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
- * For VCE2+, this is not needed so return zero.
- */
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
-{
-	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
-	if (adev->family == AMDGPU_FAMILY_SI)
-		return 512;
-
-	return 0;
-}
-
 /**
  * amdgpu_vce_get_create_msg - generate a VCE create msg
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
index 1c3464ce5037..a59d87e09004 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
@@ -52,6 +52,7 @@ struct amdgpu_vce {
 	uint32_t                srbm_soft_reset;
 	unsigned		num_rings;
 	uint32_t		keyselect;
+	struct drm_mm_node	node;
 };
 
 int amdgpu_vce_early_init(struct amdgpu_device *adev);
@@ -61,7 +62,6 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
 int amdgpu_vce_suspend(struct amdgpu_device *adev);
 int amdgpu_vce_resume(struct amdgpu_device *adev);
 void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
 int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 			     struct amdgpu_ib *ib);
 int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
index 9ae424618556..bd47fda52e7e 100644
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
 
@@ -541,6 +536,16 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
 	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
 	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
+	u64 vce_gart_start;
+	int r;
+
+	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
+					 &adev->vce.node, num_pages,
+					 DRM_MM_INSERT_LOW);
+	if (r)
+		return r;
+
+	vce_gart_start = adev->vce.node.start * AMDGPU_GPU_PAGE_SIZE;
 
 	/*
 	 * Check if the VCPU BO already has a 32-bit address.
@@ -550,12 +555,12 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 		return 0;
 
 	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
-	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
+	if (adev->gmc.gart_start + vce_gart_start > max_vcpu_bo_addr)
 		return -EINVAL;
 
-	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
+	amdgpu_gart_map_vram_range(adev, pa, adev->vce.node.start,
 				   num_pages, flags, adev->gart.ptr);
-	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
+	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start;
 	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
 		return -EINVAL;
 
@@ -610,7 +615,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	return amdgpu_vce_sw_fini(adev);
+	r = amdgpu_vce_sw_fini(adev);
+
+	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.node);
+
+	return r;
 }
 
 /**
-- 
2.43.0

