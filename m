Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPOwBiHNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:25:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE152D78DC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F610E325;
	Tue,  3 Feb 2026 10:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DJKsys0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB21310E325;
 Tue,  3 Feb 2026 10:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHBqLhbfeScgHRgIWqdIwxXeyQgYa4KUa8XM3q5EIYHl5dvVBRgRQ8y8DQ9+MFxRYsjTn+x0RuZCWXtjuo75nv0ShjMwTGlbT09VXTUSUUbqZ7E9LI8E7s7RW7M7evHWOGtrQJEFmAPZExCryC1A4PcRdtB4FOAzCTWsXDa27M7FaBwHGlzccZcvshoiptBJeBDpNtuaw6rv2/RxDAD/JaWcbzLrlmyjGp/a+t/C3uYmBQvzIwHeLwwDWcgz1yGdag74oVZrNWFJb9Go3X7Be4kZGdn08woEpIQfF8aOVrdlPXgo4xxkWXS8A9dk503D+Auj+mzAwNVQNrdFRfjihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJv7uSUJonLy0flGfiHY2ZL2uSmRGaiZIegCS/CDOuU=;
 b=ghfD9qf7PCFOpOxa9UI3budroa6XbxaA8GuccSLn/bSTqz2FVpGuzHeyj8+cG9XOHT7GalUtn12n/eR/lp0hPyIz1sWxIGJgFOgjlmLsAn1ovquRRPS2XoDufY1IDFhrm7yVYIvA0ginaYSAxwdFgqOsjfC6zPIPu3YE1nq/0wE8jLIGru3Nq2e0pTgZg1lLb3ZAPYkoN6nf84Dma/u/rsGYC2o87zrY9YvQNhgHNokKznCtR+pJZnd5h9AVzJWtrjs8i5AkD5BCqQdvbZBPO3CTuE7MZdEdMhYh+zJElf1h9Na3XDFPf2m3UvUPpFBtlJ9MLFEV8H4/qO8fUfzqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJv7uSUJonLy0flGfiHY2ZL2uSmRGaiZIegCS/CDOuU=;
 b=DJKsys0z2TEnbnBWHefM+YmpZQAw6zURyIK14PnFlAAyJXyTq6SwFAs6YSJwJBt7/j0WYAmfQ24xSdMN9rNScy1JzAhWEJZ97qrbMqPyJzROywtxD8WU3DSIrJ2VrAYWD1dSTZpFnjPeB5gNMp7GPsUK875E6XxjlTwXuNAs9tI=
Received: from BYAPR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:c0::37)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:25:27 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::d7) by BYAPR05CA0024.outlook.office365.com
 (2603:10b6:a03:c0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:25:27 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:25:24 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/12] drm/amdgpu: allocate clear entities dynamically
Date: Tue, 3 Feb 2026 11:22:08 +0100
Message-ID: <20260203102236.3456-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: fec30d0d-854f-4edb-4fd9-08de630e8cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uo3NsiKGFF2l2XGAn6T6cN0B/cit4OqAXP+6lEWczscvDiIaJU4y3Eti5AaA?=
 =?us-ascii?Q?HjmgXhgaik/al767wBfIX6pbpLPs+TQaJxsYnYOrawhN1oOg74o3ifbDrO2e?=
 =?us-ascii?Q?57kPhU2lTUIL/QQWcuJLdkUcmMACQAMJB++T8GYSFCqgIZjqJo5g+NK8/zGx?=
 =?us-ascii?Q?/h+YQYN0vcngPk9yyQGy/rGbU8KgEWcBt3FLbLtiSWg10Mg8mQEZLYfsXwus?=
 =?us-ascii?Q?4wGa4/c+FLB+dj3rFzEFfAIuAbUFofivvNjX4eQrL30ublaIZ0Aa+RvlE9pC?=
 =?us-ascii?Q?PZuOOS6JSHckOr3G9E43B3TNNKVxm738XhlhlK9OVt9Lv4ofWLRABCtOTfZt?=
 =?us-ascii?Q?j5Ppn+QQP6Y59nEqKSgq0uSReWDXF+zpWg23vldqMQuu3tBeBvE7mjto4oDh?=
 =?us-ascii?Q?JiYrGIAE56sD/fzZQ4pMx7bEAteJb/xyeph+Elmr0vlslMGq61SRybgouiji?=
 =?us-ascii?Q?IhUy2GsIKkm7pDimyPfKfQhvhv1WHZ5VcRkco0ExSAK412Uh1Cc1bKTbr80i?=
 =?us-ascii?Q?QsdkkpJ2wpxE5ZLAWc8iUt2NAx8UChsdy0Dj2o1O8Bcjl1lKG+h1NiqYXK0Q?=
 =?us-ascii?Q?BTFxgacJJwVHcf1deNJDBwLzh9+PKIt9tufp3pEaxW5ihTkSMFD5QNiH65JS?=
 =?us-ascii?Q?Up4qVRMz9M9VwmPJRke4SKTCl8+TcEjaeCRy6cJwlxI2ZonLPgHAeGjhhd9Q?=
 =?us-ascii?Q?DOtrUi9ZvF0JlF82HUmMy+fWGzMV/+r5lO+ZhW0rKJ2mFMIw/dKixW3ZmKrn?=
 =?us-ascii?Q?zlZD5psBKWuCCVDu8fdeped4vohFeddo+4WwNcfWHVj9rio0mVgVD9t61PQ0?=
 =?us-ascii?Q?pwlReumCm45YaBjpxz5e/Di5b78MXZIGSObsvdVChFsyGYGkUSvplHmXEsN5?=
 =?us-ascii?Q?jL3HBnhIWRoeKlkz749tSUTeChHjZOtCHbMY/v7fzwtfvdlMqYZqy1o/jiKb?=
 =?us-ascii?Q?Lq9Yadk+DQCkj2GRFXFtdUnvGlRGvTY5yUiUmzrQUa6DuCW721jbHTy7akhc?=
 =?us-ascii?Q?RA2Oc64J127s2cveUOQvDfKIaqGp1By6VcgkXCxDf54B+/lW6OlC5Pw6+ZAp?=
 =?us-ascii?Q?kelbT+mQYKNnPOBrzGIWoNIuqKNel+p252yG8P5c2HirT3j5hG617iF7aTZL?=
 =?us-ascii?Q?KKY79rT94tb/JlgKdcxKVDaRcGZcp05DuGlEyg87PGkCV8dKNBf8vlizrmM0?=
 =?us-ascii?Q?gIwuCveFVoVPj3T89sOSxpmEDpg7Z3Hwh8m23QdqWx3qSm8krAwJ82lVM2ut?=
 =?us-ascii?Q?xCNoDASeMbLS5wo+EtUGRxbVBNnhZI7xzlQsVJTy1nB92Hn/jAQPxtdSA+fl?=
 =?us-ascii?Q?Sua3hVpRqMm5U/Pdnnr7RqHX0QAOVV23wrkJ/S0nKXcE1/tVHm7mtGb9QLm+?=
 =?us-ascii?Q?lUbfxOj9OjOTiu5lzwOSWp4Y+X/B1hvluCYUq+wORDRTJ85dW4Q9quY13Xvo?=
 =?us-ascii?Q?UPPjVJU2px0GCnmckVkRq19vYBZYULACwq1WdBT3X75BLAe9A2fCNjrk8V0m?=
 =?us-ascii?Q?IAfv6Q4CbEqfmZG9O3S0/fdTNMaoaPJEg0t4CZR6jRFf5Q7n6yDjMovFH69Q?=
 =?us-ascii?Q?psxlZxXDeNpgPqTsZ8WQh+ARA765FWZLQAZqIrwgb7/h92piPqhCbduBxW3r?=
 =?us-ascii?Q?cVZEN18GDWKL/PB9iVLRh5F8pIYdC5IrRCfQy9UfaMx4wNT5eWXTEekl85z9?=
 =?us-ascii?Q?qf0keQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NdDRwkTy7s7HF9/M6CmTuEwKydcNfGF0PzEUxwpyas9Jp7xZUawBbvQeO9UXksN1B5FznTYk6soCUzuynjVuSiNdo5VJbMyRohkh3pFioyP9DQDt0pWIAqqcMUhvb8RrrhQJGUT4KRS61NoxhGnbFe/4zxveUJtlSgQZziLhaDyIHljygyYL1e/HpWlVgjSjjVRkQxHNDhnFrBAxo8l1IAR7dV5Is3ALxBn2wXMRDysyI23Y6I5rTbbcGlHm84va9CuFSNQTF2I9u1CoXhZNPp3LLOrj3kG9BiSLZzZnv+Prr80MuvkmVo360TvOE8ju6+8qtDHS65Bg0mUFmghy9kE5ktk3/hQsXVfrooZUkuzDtt2Yt58yFT546t71garh6/GjF4Y7mP5xRmTGZgjM1m4wkIFzxk9i2c9srmV4NEegRRF3xdiR9SaSRmJApqJ0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:25:27.4870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec30d0d-854f-4edb-4fd9-08de630e8cce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: BE152D78DC
X-Rspamd-Action: no action

No functional change for now, as we always allocate a single entity
and use it everywhere.

---
v4: stop using adev->sdma.num_instances
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 55 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 +-
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1fb956400696..bf98be8fd007 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1325,7 +1325,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0977a10679dc..71316b3d4a29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2346,8 +2346,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	u32 num_clear_entities;
 	uint64_t size;
-	int r;
+	int r, i, j;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
@@ -2362,6 +2363,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			return;
 		}
 
+		num_clear_entities = 1;
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
@@ -2374,14 +2376,28 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			return;
 		}
 
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-						  &adev->mman.clear_entity,
-						  DRM_SCHED_PRIORITY_NORMAL,
-						  &sched, 1, 1);
-		if (r < 0) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n", r);
+		adev->mman.clear_entities = kcalloc(num_clear_entities,
+						    sizeof(struct amdgpu_ttm_buffer_entity),
+						    GFP_KERNEL);
+		if (!adev->mman.clear_entities)
 			goto error_free_default_entity;
+
+		adev->mman.num_clear_entities = num_clear_entities;
+
+		for (i = 0; i < num_clear_entities; i++) {
+			r = amdgpu_ttm_buffer_entity_init(
+				&adev->mman.gtt_mgr, &adev->mman.clear_entities[i],
+				DRM_SCHED_PRIORITY_NORMAL, &sched, 1, 1);
+
+			if (r < 0) {
+				for (j = 0; j < i; j++)
+					amdgpu_ttm_buffer_entity_fini(
+						&adev->mman.gtt_mgr, &adev->mman.clear_entities[j]);
+				kfree(adev->mman.clear_entities);
+				adev->mman.num_clear_entities = 0;
+				adev->mman.clear_entities = NULL;
+				goto error_free_default_entity;
+			}
 		}
 
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
@@ -2391,19 +2407,23 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		if (r < 0) {
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n", r);
-			goto error_free_clear_entity;
+			goto error_free_clear_entities;
 		}
 	} else {
 		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
 					      &adev->mman.default_entity);
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-					      &adev->mman.clear_entity);
+		for (i = 0; i < adev->mman.num_clear_entities; i++)
+			amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+						      &adev->mman.clear_entities[i]);
 		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
 					      &adev->mman.move_entity);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
 		ttm_resource_manager_cleanup(man);
+		kfree(adev->mman.clear_entities);
+		adev->mman.clear_entities = NULL;
+		adev->mman.num_clear_entities = 0;
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
@@ -2416,9 +2436,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 	return;
 
-error_free_clear_entity:
-	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-				      &adev->mman.clear_entity);
+error_free_clear_entities:
+	for (i = 0; i < adev->mman.num_clear_entities; i++)
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.clear_entities[i]);
+	kfree(adev->mman.clear_entities);
+	adev->mman.clear_entities = NULL;
+	adev->mman.num_clear_entities = 0;
 error_free_default_entity:
 	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
 				      &adev->mman.default_entity);
@@ -2568,8 +2592,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 
 	if (!fence)
 		return -EINVAL;
-
-	entity = &adev->mman.clear_entity;
+	entity = &adev->mman.clear_entities[0];
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index bf101215757e..e98d458b8029 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,8 +72,9 @@ struct amdgpu_mman {
 
 	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
-	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
+	struct amdgpu_ttm_buffer_entity *clear_entities;
+	u32 num_clear_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
-- 
2.43.0

