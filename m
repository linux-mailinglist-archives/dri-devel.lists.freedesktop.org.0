Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B+pDyNZcmmJiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:06:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56776AC6C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E331A10EA36;
	Thu, 22 Jan 2026 17:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bvhEYr1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E8F10EA35;
 Thu, 22 Jan 2026 17:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5xNmWYCInQl7GJNkDk5JOA8CaWHRUY7zwh1CDT+KbMDMijSudG+0ML4i22UPAMyDBOa7e0FUBua4ROi+/j78UlNwYPtQ5ySvUIocZ2hEKUi5JJM5TgTfLrQVSruUPK0fdkb4QvVPJSzYQHT8Y1tWiG1Zjgu0cygYoX/yM3xnlgcf+n3JXxvKeX7q4PUzWuS097VxLYT0SM6J1omn5gqeyf+4Ry14rIeVWlwq0ndIA7VuY7siAWr8OhY/FkVYgcgHYUfucTF46OQ3N/89wQ3Muyjt+KDub1+8gAH0Csx7aaZe7wAn01ahMgG+llWFBWqzdlQgnN5s/5KJTTnFvJhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+E12BjSJRQ8aCVrhy9CcwH7GSqH4gU24eJwNMmuttM=;
 b=uCISicL2T8vmrTkB5YAQmdVhHPuyW6liazpoxyo8bvERBupCX5YNbrlLTw8sdgt5b6Rn50LSoVGh/hjjWfAcbHyF6yxCi67E3cu/bXv41Sgr+JSzKqEQWJkN1P0LAxlV722qDbipIuWvIlFlOB4U+tZdUfY77G7P3cYLPw9gqSexdwBATmu9dxW482+1BDyAI9APlpk2KJ8Ix1FeMyjqOQdco9ey4gc7XGr9uUu7vuUwh6llwCrsqfqmGwoadw8GzoMuaCeA6qbPgVJVEj8Y16nIQ0tzIwjVT3LAQ4nv4zNoMW7xffUg7yz5cNwBGJW0oRckKoN3isuPB/traeY86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+E12BjSJRQ8aCVrhy9CcwH7GSqH4gU24eJwNMmuttM=;
 b=bvhEYr1ptr4VfOBItUBwlkN8P22CMM9IqQzHaJh3jf3pw5ZSM/luO0CEK1nmTiR1rlH+S7TFkpOHhjgwHn33pbGcifrzngBhIfj5zNA05bMkeDF4uFQ5bdCa+OAhoMXk2LwqeYn8VFdvNJCWTsNxTsWj/7uMS1ARP+TeAn6lBVY=
Received: from BY5PR17CA0007.namprd17.prod.outlook.com (2603:10b6:a03:1b8::20)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:06:32 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::5b) by BY5PR17CA0007.outlook.office365.com
 (2603:10b6:a03:1b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:06:32 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:06:31 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 10/10] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
Date: Thu, 22 Jan 2026 18:02:07 +0100
Message-ID: <20260122170218.3077-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d9f357-5a31-41c9-29e1-08de59d897c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mp0y8NnPverxjTO5Jo5P4Jv9FWBmEQU+hOV/ZKVQvRTfmSo339EvviQnZfAs?=
 =?us-ascii?Q?MJjlIyksGbS0LjOeb1/iT301kjSOB0t9ovrInV9mu/jZR6pUAz3wZhYq/EFu?=
 =?us-ascii?Q?ohA3OiSCuKWoJtHWRvoZHolXHmN7tijlFGNXdAeHexoqgKNCLlIpdtfutY8a?=
 =?us-ascii?Q?tN5ee/LplrvyjlyNtUtt3GvfB2BycCeVw8zRsn466m3jVy23Up/GW+g8pQYz?=
 =?us-ascii?Q?1MsG5zvdN4XcH0rGcEmkuS8/u7BaerDTG4HPtsU/d95H50+h6t3VfULeuOEL?=
 =?us-ascii?Q?mVSvijBNFnoeOVSa+jhPytt3tI8bEioeAPVxkfJ/hacBspCR1uRHNHRg1Yh4?=
 =?us-ascii?Q?orCGbH01RArlm5jEPmKrmqMtEf3mpPn6azGSIqxu2fv40lv/4IibtWh4eqaw?=
 =?us-ascii?Q?Lj/dC7lPKacQ6/9TPHFKYoudZl4XzM9CBgJwnx9dFyROIs7Bcfpaj4ToD28n?=
 =?us-ascii?Q?p+tvnoRGANRmg8SMeDOnevlztL0Xl5nGlgNh0ljDAkNGG4Px6ddvwVhonrTo?=
 =?us-ascii?Q?Tl7VDLB8Iq6y6Hw3qGOQ3Jpk7Bk9MpF0No4/hCMAgUQhXn79ZcfQzJwTuRL3?=
 =?us-ascii?Q?4AVRIlmBRUfTZaSFERRYyBRj/885B4CvBdUIHZLyIzHCevAGXEjq3S74ehfS?=
 =?us-ascii?Q?TwWB+SeZPXf1IvMGmWb+l5/w7RQ9738LdLjHQYSSNFATcGKYbYlHufbY8Nay?=
 =?us-ascii?Q?/tSCJTdJ6B73yHn3bgcrnmUUGyhcmZjAB3hP/n1e4wPty12FX5FoqEq4NyF3?=
 =?us-ascii?Q?mqwBhS3I9rA6d5wLGLxo1HR4fPp0N/DOcU37JW9IpUA695DUE3hxGsgKvu1W?=
 =?us-ascii?Q?xB13N0HV1WLuJdhdgxjc9yB0WNLcQ0RGWyzHfwuIZ3oiyvFu8lAyJy0So1UT?=
 =?us-ascii?Q?KcjzHK0wZx/T/q8GmIwBUv2df1eGG7cepVcIYSEvh/391rwfJ1e4AmhFde71?=
 =?us-ascii?Q?F2w5ZKsUT3DoqYkrCWgmxGPmXk+JBS8Gpay0anSuqnF7+KqgXW5Uf4DdbPYj?=
 =?us-ascii?Q?qFdavUshmqtn5v7fJHf2YU7Ay9DRpO8RuU77c/L7gjR3LxWAeFuEXAcOQlDM?=
 =?us-ascii?Q?YgZ2u05k2KLjhzA+eMQUIwpp3jSSNOMCdOuqBzIZrWWuNfyWDtx4hIX3oPcU?=
 =?us-ascii?Q?PXkIHVRjis8+yB6YKoMbOef8WQwL6oZCZkatTuK1V5lF+yKK7yzFncVI2LrX?=
 =?us-ascii?Q?7luHXRIG7WT+TegXJFelqdlofV4jkCIjJM0MYU01sFo8Gbr5vHcGp5WOHQV/?=
 =?us-ascii?Q?/3gLFwTXx2xf2ST75oZkqUpYmWArEJfHUDQPeb7uPWHEz6cTcqfzurx+omIV?=
 =?us-ascii?Q?Mjlo8xdvuOZ09OoYwdXac7UgJ+h65cM36LXAN0a+8nVekjBeNMRaJL+UZQtW?=
 =?us-ascii?Q?OF6sNl1ALQeph50+yH9MwHnPU6E7lk+1JcytHaRTFuAj7gF7gMU1upJ3mU5/?=
 =?us-ascii?Q?wX3p08b+Mo4SmfwsRe1H3lp+bOUDvSKp5xvgLE1pVd2YP3VC56KbH85GYpzZ?=
 =?us-ascii?Q?bTZ7xkEXhMdpQxOOZ1YV+jEt52cLculJ2KgnwK4TkMEu+PDG/FUxXVSxjmG3?=
 =?us-ascii?Q?lOUuxp06t05UgSPcIJN5zhOVUfEtag67LGzRg4CUjQnJTNwsTH2xpDQha9QW?=
 =?us-ascii?Q?wDuwtImKoNykRfe2ikJB0+ohOSyUGCyQh+myNVJRmWpDPVs+9VBxtOHRC/LD?=
 =?us-ascii?Q?vfL5iQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:06:32.5994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d9f357-5a31-41c9-29e1-08de59d897c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B
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
X-Rspamd-Queue-Id: D56776AC6C
X-Rspamd-Action: no action

It avoids duplicated code and allows to output a warning.

---
v4: move check inside the existing if (enable) test
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 362ab2b34498..98aead91b98b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3158,9 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring &&
-	    adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -4052,8 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
 		return r;
@@ -5199,8 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -5931,8 +5927,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
-					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7006c58a6992..a441de678a83 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2380,6 +2380,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
+		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
+			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+			return;
+		}
+
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-- 
2.43.0

