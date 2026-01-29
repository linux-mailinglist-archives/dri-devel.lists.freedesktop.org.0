Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBb1BD1+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F58B1873
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BD10E890;
	Thu, 29 Jan 2026 15:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hw0dvui4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92E10E88D;
 Thu, 29 Jan 2026 15:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2jjfkdp7O7qTc2Y3Y4ysCmNWqsUK/ZzMvk3/dcir5xBu/y0cMxe5rQTsGmlCO4g5hPHnSTazfM0py/UhAH+0pBYP8A2ZBXwPy1nc1+SRcOehIfqOaf3mMsJwWddAEW9JF2V0C+sF3+N5UUyAV2jiN0Amje6+r9CPgZLTva8J5voFbAQU+45BOmI/JBwr8bGro5FLQvLLAELhaa5XjMvHrzc9TrYaTzRcmz7cXntaDw3XJuhy1gJOVFIpEYKkL8TuRWYJFMNkBlCOzq8deWGErPcCF3LOT7F3eBk20o3Wo42S9wuZtS9gvTi1DjpUi2G7pydgpXsvJuSBo5n5yrrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ/BCDbC5pL0wtQkveyzYrDJ44hyVidGlNd0KvVGzP8=;
 b=R7OuTo8nSXHIYbi80oobWc/riO7cv5WqAIGQElNKB1lCQIJXlGJAA1emcMGkA3UAKyboEzmgwiAUkoBmxmC8lowN3jhy/vcF0BpqfUomzKK1LikHo6IwrHfbFFjupwj3CnQNpnGKFFu36CTwTbfA3S6XRMLqL9E2nGUnzh5PAUtkv3NxnY+ResSxzEPo2CDJDOlgHS8OlRUX4UIqHV089oX5SjAeV4K1AtajslrP1vex/+hA5cGrEOhfig63YlvwZiwjdgaTFVHTKrwjUQuA/vSUkQ7nEEulBvPVTekCy5DtyQBfY9C2fp1r9WFqtCl2tW/NQKLIeoz/x/u4JMEvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQ/BCDbC5pL0wtQkveyzYrDJ44hyVidGlNd0KvVGzP8=;
 b=hw0dvui4QxYq52qalaJOJgD2X32QMTuzwHIuZq9QmHTpPbJ1cY9e4oE1THgGj3GtNmKmCClG8n+U7a6nFFHM6FQVbARXszawoQq3hjjJ80yA19ieFUXxRMhrikUYFvYQtdH0QmBr0L5lbgohdrV+etEOnEPs77LSbLtWWVVpCeE=
Received: from MN2PR05CA0061.namprd05.prod.outlook.com (2603:10b6:208:236::30)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 15:35:13 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::bc) by MN2PR05CA0061.outlook.office365.com
 (2603:10b6:208:236::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 15:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:13 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:09 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 06/12] amdgpu/ttm: use amdgpu_gtt_mgr_alloc_entries
Date: Thu, 29 Jan 2026 16:33:18 +0100
Message-ID: <20260129153336.7473-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd5113f-2178-43e6-0d08-08de5f4bfea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zTaCSUiXzEHofWN6EUT4YrGaLULqZrEGvo8kv5ersebMUbwHtL4xbkdXWp2b?=
 =?us-ascii?Q?qbdva2cZ+ZvPQokDj+L4+TtchPeKobhlcJlQHEwo7irPe7+zKvaiuX1tIKgS?=
 =?us-ascii?Q?qWXdG9MiDcyTCzUz5DAEa7Uolr8ZJYpepo5n6vNOar5yyjjzhYX8/fzGNlhP?=
 =?us-ascii?Q?apOdz98AIPQ8Xx0eGOdJe5yMLNDoZ2dKaDOTQJ5lsPcFpBxYcO67ZzxqTciB?=
 =?us-ascii?Q?3Yudv+jOUGRX0a0plVd2bAARNdd3TYUHtyXKnAeynn65EZu7f9ErdMg8NLNr?=
 =?us-ascii?Q?Uib7+Y+9OfqFjggCDVRYkgfmn3uj02BsmBXaDy1lcRAjp65v65lxP5PKvSa/?=
 =?us-ascii?Q?CrS3ZnBFRvi5qbJHJ9kl2CQHs83RpOIEy/+6QeSvmrkB0SBt0HYGZ95cDviL?=
 =?us-ascii?Q?rKe7K8ido11alq7srBYW0a8YD92vVfM4A90HJS4fWhYNse4VC9Bd1abCl3Qb?=
 =?us-ascii?Q?CMFCsoWISdXEhTWgvg/l3LwGobf3NLMY+dTOEc2czpIyqtBTRmQUYpmm6uma?=
 =?us-ascii?Q?Yg9fTXtGgq7U/YZbBIWDCxWb+EbA0X2+uRRucSp4VXajlPi7VPde3ZiqzXH8?=
 =?us-ascii?Q?bqlbkxmpbCw1g1uICUuMQrtYPn+UQYdcfYidHzHg7KI3wF/ncO2h7Y4ahsx2?=
 =?us-ascii?Q?nt3fia5+3QnnUb6k+F+USFvltBXhq96nkvPuPNW9/ygIAzYHv2SSnHK0D2Xz?=
 =?us-ascii?Q?2wh1R+ECbdgos5Z7JH2FxnmZTi48xC8mFOpyeBjZiNKS1SHXd6kX/0wh7u3B?=
 =?us-ascii?Q?i49RSk0V+V34QEn5dlKg4jkbLnXqZJN7TtsK6TriIIWm3rbFScHc9xXxykeW?=
 =?us-ascii?Q?pDHa0wBe5l3US+07Pxf/8FTLiM82m55HinhNvGsvW+466YfdRn3GzNTz5Wt6?=
 =?us-ascii?Q?IoNC87cbkI2c5Z2AjDmVYXRoFQkZPz5CIFN8Qg53TK3aLdUTMoLngW+Cw9Yd?=
 =?us-ascii?Q?sxdmfvW9TW7GMwyVOF+iIN2cJLRV1U2JRwyb58iXYL2kZDvfXZVfg+tFjWMW?=
 =?us-ascii?Q?ufwKdFgL+zxU69SzBUKAeGgCrtjCX/euxCC7I9UugqGPpe6ft67YAMGZLZd9?=
 =?us-ascii?Q?RCiW+QFezqPythSjMX55Gr6/80b1KRS0+ttq0ZpN/2MOB2Ac3DSP7D5myjGS?=
 =?us-ascii?Q?hJz7/FhDmMh/dSqh9ApPD4fqbKQPUTm/0Lybi3nvtEmX/gxujY9h5EpSoRF/?=
 =?us-ascii?Q?BTXBprehPE+GFreTCD9oprR0w6UGAoh4Rk+YX7jXbwwbjRTM5AxsdYn3+BY3?=
 =?us-ascii?Q?TOpadvBYIrK0OV7fgftQj/CDiU7+i1KXHTXpBEon9hzxy6KG5tMX3HLQpDbY?=
 =?us-ascii?Q?aFih+8RGRr4iZB+wfPa2tFTN1s2bdYR6WDbxFL4FcyIZBJzGpGocUjINLTNN?=
 =?us-ascii?Q?4+NMqgu3QkUhDlPCaQ5/eoJWqda78N56B6p8yHcUGccpyQZ8eFJRRZRYQBID?=
 =?us-ascii?Q?iKjJ0vJhln6XOAave1jTkEC8MkVTkNjPFiYlljBFqnwb4ho52xzCVZaJQUUE?=
 =?us-ascii?Q?P1hPxWLVdgNImtY/5+1QPxMPSwCt4kEPrgGA/lZ7uTsaIIzcnD28iZv2SQ+g?=
 =?us-ascii?Q?4CnYJzC4neuwuU93k9DOstVPxvuYlH+GHmQifBsGrs/xOawYrv6GCMa24jbb?=
 =?us-ascii?Q?lX4N3VTyxvHGyhih2m85nnFiewGZDksO+caRXeGT6xF/FVXugYSpfzcNm6d1?=
 =?us-ascii?Q?Vi1ndw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3rktIFs41IsFufUbjFl/wFbqEzWRI2A36Dtw9EcRly9bMrywKB7y0C0jwC2QpQllE7sQovRpKDXyLPviM3XG1khpE8zvD13HSl5VI2wobit1SH0dA7XZ2yij/o/v2QxDW5qQp0j70vLH9pcKRyXdfYhU6J7Ily1yBus+eLHdUR+0Ia7pS0SuDc4n7xT/l2QWXEqnozLGb7DYPdC8G2mGlyGkUd/3U4YwAk0zPlmLfx41GvJodW2SYcO5MPWtqz72P0Z5kNUxHPr0b3DdQT6ThGLzWIXsNiuHGZZB7teQAIYoYdoZgo35T9CbjJvFV6o1Vl7qRBzE3pKF7WDkD8j0wmvtHAFjC6dR4NlB3JgD30QZBRw7oeEnPkkvnuWJ+Dg+WiKZzZYytaS6M/JzCmQd/Kd+JKPabIBRzRDT/RPxZMzII3ErkuRzPDt0ht3zGohd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:13.2346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd5113f-2178-43e6-0d08-08de5f4bfea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
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
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B6F58B1873
X-Rspamd-Action: no action

Use amdgpu_gtt_mgr_alloc_entries for each entity instead
of reserving a fixed number of pages.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 66 ++++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8b38b5ed9a9c..432bb2839dcf 100644
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
+	r = amdgpu_gtt_mgr_alloc_entries(mgr, &entity->gart_node, num_pages,
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
+			amdgpu_gtt_node_to_byte_offset(&entity->gart_node) +
+				i * AMDGPU_GTT_MAX_TRANSFER_SIZE * PAGE_SIZE;
 	}
 
-	return starting_gart_window;
+	return 0;
 }
 
-static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
+static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_gtt_mgr *mgr,
+					  struct amdgpu_ttm_buffer_entity *entity)
 {
+	amdgpu_gtt_mgr_free_entries(mgr, &entity->gart_node);
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
index c43f352df953..8af0aab7608c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -56,6 +56,7 @@ struct amdgpu_gtt_mgr {
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
 	struct mutex		lock;
+	struct drm_mm_node	gart_node;
 	u64			gart_window_offs[2];
 };
 
-- 
2.43.0

