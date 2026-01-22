Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFJCGq9YcmkpiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9146AB49
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817210EA17;
	Thu, 22 Jan 2026 17:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IsnDCc+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5A210E0D8;
 Thu, 22 Jan 2026 17:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WibNUvmj/KAf4a/X5ABQG3ZWF2sug0Xz+OKvPcK7fVA50ydK7C7uO0kqKAPX5uE799a6h8HA+LciD6pD85KrbNOTCts79Mh/Eb0EEla0Kdnh7sDaCGZjBB30PiV9cNhAI2+FuLiP71lo13ZLmeJ1vBzzZjs0XljRy5AFkT05tewSbSmnLv9p9ME0KNJeZP80NuXsHhfqiAu9bQpSrxnEgS9W3jZfV7jIpz6fL/qOn9PB4t/D8TAIH8P+xjAIAnkfpb0j86XC5XYOuMMY48VbO1ietj04J7KmGWX8d5SZmc2jttYmosfodpo4gQHANdjEYFysxFdbiAgszZjl7+FwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usXrqnESmBeEeOA3Dla3+nrKwv3Y1sqP2rvVyvrXb6I=;
 b=RdN7WTvqb8tJNY0edhF2ELUcFTJ+Ewsk5qW4xhO/l+ZA7DqcltDpmDoguY+l2wGs7k/9RYAYBx34LwiV4XTn8YpGT5hYLLH6guXUZEDFFJRct4Hd0u+r6QiVcH7WdeUJALWRXnK87arzo0bs99xo1nJflTa/VjYcAnGTUW+2Nf3BMRhRjZgPU0eDM93D4FnYkobqflLkiB3jKDng5j4xST6HaMX48RLZ6avWeb0UAzkB3c1bapT+lYsIAfGVMlcAk4DulGMR/gDr1pYddIf0tANw2ZPNqsFDzLgsC3WJjNoAAph1/lAqUs4LJBRWwrhmOQnaUWCKABP6Wa9FhtjyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usXrqnESmBeEeOA3Dla3+nrKwv3Y1sqP2rvVyvrXb6I=;
 b=IsnDCc+5mMloY9/xne0AWOhc8M0edJse6zsSNkm3jWJjDm5ODlAn/hbOMiNcOQoDGWnEM9YjlvLnF38P708rE8Z2L7EIIo5rGYKT2bn7f/cSyaEeH4X6ALe3Y/rC+Mhd7zFG4QYSR8Zw5mVM074e5R3XoDu51PtiBF7Tx0ZEqIk=
Received: from SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:04:37 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::5f) by SJ0PR03CA0107.outlook.office365.com
 (2603:10b6:a03:333::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 17:04:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:04:37 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:04:35 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 03/10] drm/amdgpu: add amdgpu_ttm_buffer_entity_fini func
Date: Thu, 22 Jan 2026 18:02:00 +0100
Message-ID: <20260122170218.3077-4-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 5866f32d-625a-493d-8a78-08de59d85314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q2oBnDRom2b9MEGTQcqE58Vx5gkXOvZoDFJcw6ky/T7Mec2y1VLGLSuj+Iz4?=
 =?us-ascii?Q?WCMaU3R6kpMapCmSDHNI9UtXaj48zhdGux0hnr/5Iuk8PENpv/tmGBn16pZP?=
 =?us-ascii?Q?RsuDG3+mDX9uTXUdCP/DzaWR7zRGC8qkKrj2iiSMErEqUDYGQ2bg3sKgZuno?=
 =?us-ascii?Q?9QYijGzg1UTLNcNdnn1aHv1UBuDHZ99mbw49XyfdR+PC1nUu2aZa/0gsGJDx?=
 =?us-ascii?Q?KFMj0Mm6hDchOy/MLeeTQbYZCgAQawUJmajZZ5IJTvTmUKydEGP2u+VqTJrv?=
 =?us-ascii?Q?k0bnZ+fiafdDWVfNq78aR6jRZywI7/I8c/Z9ueQUIUu/UM+Q5+Z3BGyGSNKE?=
 =?us-ascii?Q?j/Qf8RpgziOL8AxepiEr99BZ8mpaxN8JunyzeIZPnAva03pZazozXq98xDzm?=
 =?us-ascii?Q?XoYbvc+3J4xwxHZrvBwZsSs1Ra4IQ9o7b9VywwwAeqwNN4BoKpze7eFhyyAS?=
 =?us-ascii?Q?5CcDAQcN9V8ALgfEmsQ8RjxcVcmuH11OrVeOXsKZ1gkSQsn1j+HlaJLPWs8N?=
 =?us-ascii?Q?U4rmY2V00vnz7wJwFoUKH5l/SU2yjXi3YoJujkGxJLhShNlJ7KOUn0OJ+4CA?=
 =?us-ascii?Q?c3fUPpqIV68JQ6fG7s1Nw9jVBwR5mP5nMSelDZYnH511CnoE67WijV/HOUVj?=
 =?us-ascii?Q?WMGLqVevQXMtfi/bM+MlyF4/9VOYShfEeO7vjzMI5sUD6MfGiPq6+krc+Mp5?=
 =?us-ascii?Q?+61pYru+M3DciH76vzB4EhmWF9UPqQpPyW9YUYw6leGOadVHqLbLhQcIDwI6?=
 =?us-ascii?Q?Wr1cY/ENyEhRxjO3xeXGoHMVudzFqAzn6DhDgdRiT+quBczqKY/W/+WCBTTs?=
 =?us-ascii?Q?UWxK191rDEXUbe5i+DkO5VjwHkbbeVUKklpmoDMEJ8ANuO61HNjglbkkeZzo?=
 =?us-ascii?Q?aqXpl/1HXtafKIZX76uj4T9Rn16srec0wDxhP+B60bAfdpfY8m1GucijckiT?=
 =?us-ascii?Q?8F+HiI/OILuJo8w6Nd1/yEIO2vHnHlcNFqK87DtT4xFbbx5oIxNteyC5kjdj?=
 =?us-ascii?Q?2yDQfLMyweQeEyC+fGccSHvPohnT+VwaVe0uRBB3Cvj/5xBty0rIq7iWz09a?=
 =?us-ascii?Q?Y49MzhCUaxfnoYpYw1WJTeFC/gjY7zk/nyHI/zoDx+tBRo0Z6MxvQ6EQYjoW?=
 =?us-ascii?Q?lTWPxotvVPA1NApy5idRsQSKEa5S0KKehimy2/Ov1TYo0TxYGQo3SbVxHbmW?=
 =?us-ascii?Q?D5VWaTorhzOT/OXWFJwSJHwz4SN1gwMeAfuxnPunohfO549YJ3uCSlQbS/Yi?=
 =?us-ascii?Q?hWHf7hzHG3c60hE/W7jgEMV/Yg8WJEImZFzMap6Pfi11JZl36mYLMIfEO284?=
 =?us-ascii?Q?0L1SxqZnqmof/3Sq9BEsOKKP1TZzVcFBIkhJttzcs/loJTC36Ku+G11m32aq?=
 =?us-ascii?Q?jw3b2lVSDA4A6eR0bpMhLqqrtnBMxX2d9hg9Noi+i37AXc5wrVo04Hmg7vhq?=
 =?us-ascii?Q?D+ZWrn1IHjfbVqTsEj7qSYlgyRN6shb4KPzA5nULDNj3nnq36BwBBDsS8I0c?=
 =?us-ascii?Q?WcgUyQSMxdugBKhUhdB04dkbp80zYeS4jTVOfEgrPgCLnHi88fEKu3nw8C90?=
 =?us-ascii?Q?H1zWaSUZ01t0M/BwfYrMIRqIFMowWBJiPX1+sdVYnKL4r7i+g2elUsQhWcuZ?=
 =?us-ascii?Q?xQYWczlKs/S/OwiCV8CxueOckoAw1fv63Xk9qMkW6eFjBmd1nBP6M9oYh0lh?=
 =?us-ascii?Q?n13ipA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:04:37.3508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5866f32d-625a-493d-8a78-08de59d85314
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
X-Rspamd-Queue-Id: 0D9146AB49
X-Rspamd-Action: no action

This allows to have init/fini functions to hold all the init and
teardown code for amdgpu_ttm_buffer_entity.
For now only drm_sched_entity init/destroy function calls are moved
here, but as entities gain new members it will make code simpler.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 73 +++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5850a013e65e..8b38b5ed9a9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2013,10 +2013,18 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 }
 
 static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 enum drm_sched_priority prio,
+					 struct drm_gpu_scheduler **scheds,
+					 int num_schedulers,
 					 int starting_gart_window,
 					 u32 num_gart_windows)
 {
-	int i;
+	int i, r;
+
+	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
+	if (r)
+		return r;
+
 
 	mutex_init(&entity->lock);
 
@@ -2033,6 +2041,11 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
 	return starting_gart_window;
 }
 
+static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -2317,7 +2330,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2331,47 +2343,36 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-					  DRM_SCHED_PRIORITY_KERNEL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
+						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
+						  0, 0);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
+				"Failed setting up TTM entity (%d)\n", r);
 			return;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 1);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n",
-				r);
-			goto error_free_entity;
+				"Failed setting up TTM BO clear entity (%d)\n", r);
+			goto error_free_default_entity;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.move_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 2);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
-			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-			goto error_free_entity;
+				"Failed setting up TTM BO move entity (%d)\n", r);
+			goto error_free_clear_entity;
 		}
-
-		/* Statically assign GART windows to each entity. */
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
-							     used_windows, 2);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
-							     used_windows, 1);
 	} else {
-		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2388,8 +2389,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 	return;
 
-error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.default_entity.base);
+error_free_clear_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+error_free_default_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
-- 
2.43.0

