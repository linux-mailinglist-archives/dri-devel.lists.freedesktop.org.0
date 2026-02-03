Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HGqCC3NgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:25:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11BDD78FB
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6510E5DA;
	Tue,  3 Feb 2026 10:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vNQ6debL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012070.outbound.protection.outlook.com
 [40.93.195.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A347510E5CC;
 Tue,  3 Feb 2026 10:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFoqKNhB6StP9+FUkT4TQrYSiooeDSIuqohnKrUo7e/uYl0Xk0pjd8kmRPbBasWpIDKNGeHDFCZmDXLa4AhEI4j1D+xPiaG4V4GLrVX55I+sADVFt45vdvspDoNSuLPzx/HPplxlwBkZbron8QCdPoFaWwd1BWgBs6Y22/Lc72ou6CZxz7BYh/ACU7tSnDPdtFFXZPczZSN3/qls4rc74y9Et17D7UqtALW6YEOr/UBWRPFYYxmXtLWOx7nQIumml/AKbUUkauYBvLQfkXXK4SnxSy5BstCnXQXzxITgfVzRUZmi9P3uANplJGBNGHJxVPND7XrlGFHZ4pnVH4f7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjbVLUNhXPpr2Oq9zndV8exMO0QthHxjyx7kaDC+tvs=;
 b=sbYrJ7MINMeH9JdUg5Kw0jRJrwmMVaq7d9Pjeb5VSL0rVEg3F/GCQIMgv1/2+MLHDEammzehG3OC/kPu58bjUi6MrwVGHgB8YYtqHGo8nBxZNaaQHGLY+/fuKkuoncTG3pkLCMwAMJgPTXaQW6Tgg32dQdXAIvcc9xlePS4kZfbUzZvO77KbC+SP/B3HLd90NoTssKrbm5pCoXe8VgCigSbg8Fzq8UQyW+I1bFTPxP4vuQTA1qfN8AOcPSCzJpfJceTjupbLq65u5sL34L8NLuMIGs2AwB4zq9OkHER1Tm8IbtCPsjSTWwuDQbGDNY9JdIfEaaGz0ljBLB2lFUCFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjbVLUNhXPpr2Oq9zndV8exMO0QthHxjyx7kaDC+tvs=;
 b=vNQ6debLetSS5FuR9BLf3QoF/TvtRu9uj+czkLodKBTjWG2z5ZqdKd8nT99DBJtup+79oh6l+xm4qresYZn4fzVEyuXmAeO59+2p3ULD10aLIPOrhysyM/pyIG6csucNn/1YbdvZM8wvBSJyK2pZihZ7mzIdjWVBB/mHZWBm4ys=
Received: from BYAPR11CA0037.namprd11.prod.outlook.com (2603:10b6:a03:80::14)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 10:25:41 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::b0) by BYAPR11CA0037.outlook.office365.com
 (2603:10b6:a03:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 10:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:25:41 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:25:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/12] drm/amdgpu: allocate move entities dynamically
Date: Tue, 3 Feb 2026 11:22:09 +0100
Message-ID: <20260203102236.3456-3-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6f0ec9-41b1-455b-849c-08de630e9505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rHsbyInGb5tdMipnKCm/Q2Ddwy4ZrA532ehCB794YMp3NhMpYltMnzwGE3xx?=
 =?us-ascii?Q?9/3vBFtjyIKjU7yQkTBuPIOfOV+PO8lorvLAKP4YIREuBORXygVXdtomgRx+?=
 =?us-ascii?Q?IphIyNHYg4t3Ldncxig0l36R/xu7swXnXBXTJXVJXszFJBR97YDFo8TN8F5P?=
 =?us-ascii?Q?DRDmzM+PZ/sqCEUlGi1/EdpedZDNtHRSd4yCDWDt2T8tD1yTPrt+AXqA5pU7?=
 =?us-ascii?Q?woE3Xk/Xk2+APf/QXOJD/eUeQmZT0MtK1E8eyDyLsATL1yIq2P6aIcqMoW4g?=
 =?us-ascii?Q?NuBDlpBB8rdHNCjQ1pYwi6DjZdd92rUMV+9BTr7gMq3FCn7VKhgIoGPTbnBu?=
 =?us-ascii?Q?pttCrev+6BBvOzu+diIQ2zscJHU1t+hCpKaZRXs/ICVvEqiFD+P5u9mY7NuA?=
 =?us-ascii?Q?lmzmcwFahvTjD6AgzJWOhkP4V3CshdYFNlkpdLAhgdEYW+rDLPMdN5H/v26S?=
 =?us-ascii?Q?I4RTkvr94qT5J9DsYiTzvZAJ3flNxHz+WdJsiJAygz04brjZMVEtZQGT3l6D?=
 =?us-ascii?Q?xkj0sm6HSGFTqsMfekDqy2l1KDHKMN4zT+QQo5c86atJQ17PUpLEu32F1dyr?=
 =?us-ascii?Q?scp5moZpfUpyNGz/5EhcWmMOQMCkGUb7G5YlaMp3il+5lujm7c6sVLGDNVRV?=
 =?us-ascii?Q?2r+orvJTY0b+yf+QK0dlmAGUTVnW1K0uvQ3JJPY4PIMtDd/iy+GdA8asB8Bh?=
 =?us-ascii?Q?yXZQ16UyfB3Cpv2SQfCfFpe2Z/+TgdHR3xS5z4LPoWbBJwO7CtOYOYzti6sR?=
 =?us-ascii?Q?d+TwNjkvAU1glctvkcpQejpNiFZc1p9WdDJr/+DN279QUU/5TDh3/YkARDRO?=
 =?us-ascii?Q?+uA9ziemj2JWIFiyTpSC+g5nZenIIkGR0KS+Q2moY+qnNsHc/RYcteOSbHPm?=
 =?us-ascii?Q?SKeE8INm74IO4TUI21bJbjeirl6I/6299ib/Al2/xxHcuV9DmggIS6Uz1z0B?=
 =?us-ascii?Q?K6fwSzk3Y33VNVD6REetzC3lXH/ZA6cu7YIq/DH0VvS+t9pzxCUjcR4SI4gm?=
 =?us-ascii?Q?NzYRnjXzxxA3o1iXjGn2ucP26apZXESLEWGEvwTk2qwjbKZjQn2d3DjW+yHr?=
 =?us-ascii?Q?hEKDt2knSQvmCpHsw7fYVtViDXNBnG2TLxLqW5lcYlxfuIYvVbKPMCDbmORF?=
 =?us-ascii?Q?O0+5BblEs/w0YJa4Yb7RBenuNATA8wIVBCKLkPz1R1MYzVtldDlBdlDqBHTF?=
 =?us-ascii?Q?gCyyoZnFnjfdlP7tzNzqwpRFdSgsv5T9zisFiGQPL+AGBKnxyEPUqeWfutdT?=
 =?us-ascii?Q?lL1KzExSMckGfRQtNc0dxQe3itDuX4SWFtnWP759W7UBrkCRPVPPMWBCE+/Z?=
 =?us-ascii?Q?qg9nlvNfeS7m2z/3zg8aLchOTtbpIxSOyWDQzHdOuf1JTRt6BXIYGJUbcIO6?=
 =?us-ascii?Q?jFNpko7Q8/l/ubU/xkcqMlCt1gUEwAP0xBpryy7zHJfFE2qh68cCod+MMolx?=
 =?us-ascii?Q?VjV/TMU39BJ4TTdanDtDkQVaJPisGm3+wLsoo4eHmt9wTUpcQPjOC5zzAYWI?=
 =?us-ascii?Q?OA77iJW//6EWH5iDsWykhVlSNlFG3X4knLUYm4XULfpbmXYtrPOYH/Kb/HBz?=
 =?us-ascii?Q?DDMfPEIby6kFBG3dnzBv0XgogAZyOG+FE41x3CW64bnfJBp8y3s3tnMA8FQr?=
 =?us-ascii?Q?lgAhAWZ7oLw3tnSnaYKVFwuc8uNyhI8+/n9ZrR7kDKLafsLOYZY4V6TDkm08?=
 =?us-ascii?Q?kmqbxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BMenX1U9A1OFWONh2LMFIpv4dZ4Mzm7yL2pqrDNzfcAsaJ80q5strgNyD6O38YgqXqvwoRz5FbvsZntXmlahGbQ5YY0fi9vLsDLIvkVCjtigmXcAUN1HPj4lcVgbL1cnUJ+w/wplm9NfYYsEH2LuUQ6vRE7sqZVMaw9jvViXKiLtD3xC6dgOoDcIZwq400ROKpAXjaQHK0EVmppf0vuE/J9Byw1kKI5fo7gMs/WJlfHjRpNCfOOG+45N0q/W9eUIv29v+2UPEeCqy4EmQ4XhHpiyi/83y3u8yiX+q5Rxy2gUGyQDuFCGJxcCvvHTkuTRF17WvlnpPN8z8GfaGCPk/HU5d2G3oulYaN+KqVcQgQdvd7sDgTeEgouYpg2d1e/M2c4QQtAd42Ya3KICZxooUzNbLwyXvFdK8FAmC78qtEoCq+Dc5nCcwvDY1Ho7d7Pp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:25:41.2697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6f0ec9-41b1-455b-849c-08de630e9505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813
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
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: A11BDD78FB
X-Rspamd-Action: no action

No functional change for now, as we always allocate a single entity.

---
v4: stop using adev->sdma.num_instances
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 35 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 71316b3d4a29..75cb354084a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -399,7 +399,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entity,
+				       &adev->mman.move_entities[0],
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -412,7 +412,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(&adev->mman.move_entity,
+		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
 				       abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2346,7 +2346,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 num_clear_entities;
+	u32 num_clear_entities, num_move_entities;
 	uint64_t size;
 	int r, i, j;
 
@@ -2364,6 +2364,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		}
 
 		num_clear_entities = 1;
+		num_move_entities = 1;
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
@@ -2400,14 +2401,20 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			}
 		}
 
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-						  &adev->mman.move_entity,
-						  DRM_SCHED_PRIORITY_NORMAL,
-						  &sched, 1, 2);
-		if (r < 0) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n", r);
-			goto error_free_clear_entities;
+		adev->mman.num_move_entities = num_move_entities;
+		for (i = 0; i < num_move_entities; i++) {
+			r = amdgpu_ttm_buffer_entity_init(
+				&adev->mman.gtt_mgr,
+				&adev->mman.move_entities[i],
+				DRM_SCHED_PRIORITY_NORMAL, &sched, 1, 2);
+
+			if (r < 0) {
+				for (j = 0; j < i; j++)
+					amdgpu_ttm_buffer_entity_fini(
+						&adev->mman.gtt_mgr, &adev->mman.move_entities[j]);
+				adev->mman.num_move_entities = 0;
+				goto error_free_clear_entities;
+			}
 		}
 	} else {
 		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
@@ -2415,8 +2422,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		for (i = 0; i < adev->mman.num_clear_entities; i++)
 			amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
 						      &adev->mman.clear_entities[i]);
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-					      &adev->mman.move_entity);
+		for (i = 0; i < adev->mman.num_move_entities; i++)
+			amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+						      &adev->mman.move_entities[i]);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2424,6 +2432,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		kfree(adev->mman.clear_entities);
 		adev->mman.clear_entities = NULL;
 		adev->mman.num_clear_entities = 0;
+		adev->mman.num_move_entities = 0;
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e98d458b8029..cd24ca851b6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,9 +72,10 @@ struct amdgpu_mman {
 
 	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
-	struct amdgpu_ttm_buffer_entity move_entity;
 	struct amdgpu_ttm_buffer_entity *clear_entities;
 	u32 num_clear_entities;
+	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b3d304aab686..7b089d22c367 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -136,7 +136,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	u64 size;
 	int r;
 
-	entity = &adev->mman.move_entity;
+	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->lock);
 
-- 
2.43.0

