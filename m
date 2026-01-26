Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HSmOPZtd2mMgAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853488EAC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FA610E42B;
	Mon, 26 Jan 2026 13:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SKY8dO+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF3810E41E;
 Mon, 26 Jan 2026 13:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jP3p5/356GqjAIif3TFfuqAc73zzE/9DR9HyrFb28yWhu+Pg3d+5Dl6XFa6oox2wzys69nFtJcDnPk2NbdXz8XJf4vUfvlSrdL5t1LxeeC8FTi5HwvO1C0BIMhxD7CoNuIkJ7onPfd7OxtKBqZUd9Z6xuwWJPzHJjw10CEyrOs8nyOJY5jTeb/Ha23og3SgdYnuIJnf+DafYYo5WArppsQ0B1DhHbQiDOYdyPEMGliiK3djdEauacTR3LP8ey/4WrMu5zDACC5mebqbJ8401QCM2eu2EETLM5XySU0NeGjgU0abbpYMHIC49moLYeVdpUZqDvTzTrlov9ClIqW1YiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRKDFE6AOTfQN2ACGN+6ZktS7vewSJoOik36xPU8pig=;
 b=Ahsh8FdffS6c1bE9jiSTNZzM3hUA+FxGC8cpxprUefj/Ygzj2E+qs1b96+8RLOm1SBel8lnL0VbZqdnWC/0OMBXdF8IjAQKPM0GROuH65Bpg8IzCnMEc2anOSvxbpvIr9aBhUdggt+/ysayVPb22ZO9pQCKiATCY4DhRNnq7IDyULG69atDtHrfKDh3dGpnE0Aw5uDrnbE7fcP3uDz4NxP9h2XxI+hn264LZyD53MFpJ4qSLK9l4+wH0v7QizaC2UydrYKK6Qflux7aBxojgf+ig49fcgcpBimaqvuIE0igqwZNjvI5IApbMkLJgUtOX2zjuk5VZE9kIG5DTvM36mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRKDFE6AOTfQN2ACGN+6ZktS7vewSJoOik36xPU8pig=;
 b=SKY8dO+YztImVd7HY6XNYG3ZSpSw5qMV7J/1ZsbDBMKk2ODT65b3oiRzamkkaSqTCa/Uuvd9nYZd6DfiZgNjb3cb+ixZ1D5dxWqjqxZgNYWGOrERHPlUeTm/5sIKIp9ZPMDSFRXdVs/h20RTb7+u8v/pz7JvDoAUJL62QbgTG6g=
Received: from BYAPR02CA0046.namprd02.prod.outlook.com (2603:10b6:a03:54::23)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:36:46 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:54:cafe::8c) by BYAPR02CA0046.outlook.office365.com
 (2603:10b6:a03:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:36:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:36:46 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:36:42 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 05/11] amdgpu/ttm: use amdgpu_gtt_mgr_alloc_entries
Date: Mon, 26 Jan 2026 14:35:00 +0100
Message-ID: <20260126133518.2486-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 5347bcc9-51b9-4f50-2fe2-08de5cdff35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?idApfZBBQUQJbuMqHjEHDKCkR2rGUPj7b8aMU0qiw63u48lHxtAlFgJgfpLZ?=
 =?us-ascii?Q?a3NR8GQmEbiQMasMJsbtMqosc+4l/EXgwBYecO9eIJessoC3W9/EKIieaiHg?=
 =?us-ascii?Q?wsxiBI9eeHW2qvc99enWA3e1GjDyP6ajvlHo4WGZscMiaVxWDyzgTLHx892E?=
 =?us-ascii?Q?Nc6BSCSvzOMquIzLk/XWJlfrXrVS3mdff6nHJLoQKyU8n0eFnW/8U7n66FH8?=
 =?us-ascii?Q?5smi+2XUy+xrofAVvhKB3UMboa1rmJhebaXszKe6eJ2tmQav96vlVsSbBiMS?=
 =?us-ascii?Q?wtCpcXhTJ7oZGKiNGAGgbq7BmZnZnE7EsC2XgcULzDM9Yk98FQmHNfbE8ysV?=
 =?us-ascii?Q?jYFCB1aOGpjBEiuHKjIj3B0gJl5hrO2WPYVcpUOE0LGstCR70Vhi6fsmQmrY?=
 =?us-ascii?Q?wOAbiQXosgCIq+dSEDkUbCxiediRkIBwte9R+FBHI2yO7Oq7YrcmG9dE4deo?=
 =?us-ascii?Q?WufioYmXEOJV90PHZU65SpqkFA53f/YREi5fB1ApsVTnH07cinvkxEx6hJuj?=
 =?us-ascii?Q?7Xf0gX9MBsu0Hy9bnZW3YBkirLL7DChD1bi/muDzVNSpuUykTUEyQSwDhA8s?=
 =?us-ascii?Q?Ni76uag9RGWF7ICzZVSTGsbHzx6R7F7KI0m0lvHKJ1X3sf6rG8ghDJt8Grhg?=
 =?us-ascii?Q?STTtnZVzQv9bm8Ewdcc7VanmmBJDlNg+EO3L0vSaJMQTvHZBkjI+xqTXU5hD?=
 =?us-ascii?Q?bWUZJkItqZSb4pvL1Oru3uwSt6S1zqTpoS2YfIcKDFNShkjFXoclwgwVLfv/?=
 =?us-ascii?Q?MSbucHeWNug+To1lwMIpmHnUsOxgYP1SLlArESSOqR8UyFBQwy8H/UjEY1Fr?=
 =?us-ascii?Q?I87HRAYkyajkHDV/K+AjutHPW6jWfkz9ze/bJVtr7fwrTV947Xfhx17qUDWN?=
 =?us-ascii?Q?XKQ2PI45iaeKA3oCjs2ndmV7GdyS3eNsQb+yzQq0SfGozZZZwd/9E6B+oJJS?=
 =?us-ascii?Q?08FniDbcnj3AUmXJvd5ceJCNvjIYvsdHmi/c6vVH7j6APlyHQbAqP4w6xfey?=
 =?us-ascii?Q?oHWfTFm1pl65rVuo+RPCA2z9/ywirXG2FZeUYvZrPsOjZO4LW1bIIueKiBTU?=
 =?us-ascii?Q?UOvHzuSwS/ttGAfcQnpnkHB6T2gwAuoCJtibj0XZ7t72+mPJIMB2RYK7CmPw?=
 =?us-ascii?Q?vnyY/46JnlhD40JFa36sWTArFO6HZcsMFrSR3ewLZcSlNm1/ntJ2DbiW2HKD?=
 =?us-ascii?Q?5qvA4dIPWRT5MjwYcLuNhOZGW7NrgaxMJQm7hKKVHyvCf8IGqC9Su2TlXrTl?=
 =?us-ascii?Q?KBGlcEMRJHc5vQzNf46jh4kRlGsl4erTd+E1uWcb1Gz4dD5O082Ck3nDzEHz?=
 =?us-ascii?Q?dablkLJssvFSVrbgYxNjVLu4ydZlGXL7cKNQfSscR+RQ9Dxn30HGaROB1O8Y?=
 =?us-ascii?Q?tLBLl+M5Fg+N9mHLQ0H2tHFYBuScM2ItIdJ/+4yPSAwPEbdGLD4K8YUqjRU5?=
 =?us-ascii?Q?047WnG2lWnHYPoMgv9PYjou9w56FGPJHp/Vvb1N5o4w4yAaSWAerHr1v5LXa?=
 =?us-ascii?Q?RJjOMTtDqTdeX01azWuJ3R4eo4+9XziSPLuSvPp1NwPNp3UhmO2b2Wv32SDo?=
 =?us-ascii?Q?uuLTMTf9fNot8yk7vEN67zY4vbqG2YGy347MKaZU9FdfHk5yyHrwB2VKuVzY?=
 =?us-ascii?Q?Dec9OogG8lCRuOwWTzjWOLgEvBllcpZ4JIxq0PiCmy2eoQoQNOJZdsrIWlvL?=
 =?us-ascii?Q?u/f6Qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:36:46.2707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5347bcc9-51b9-4f50-2fe2-08de5cdff35b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9853488EAC
X-Rspamd-Action: no action

Use amdgpu_gtt_mgr_alloc_entries for each entity instead
of reserving a fixed number of pages.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 66 ++++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 43 insertions(+), 24 deletions(-)

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
index 871388b86503..5419344d60fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -56,6 +56,7 @@ struct amdgpu_gtt_mgr {
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
 	struct mutex		lock;
+	struct drm_mm_node	node;
 	u64			gart_window_offs[2];
 };
 
-- 
2.43.0

