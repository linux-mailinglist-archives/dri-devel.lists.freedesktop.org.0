Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB2UNLPNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157DD7A02
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288210E5F3;
	Tue,  3 Feb 2026 10:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UHPjW1NS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012067.outbound.protection.outlook.com
 [40.107.200.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CE310E5F3;
 Tue,  3 Feb 2026 10:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwrvJu0UB/UlNe+nPIliPuHCaJuIYpEunwcDRjymevEnnyJgUx8suMzycjcv2cIbtD9z/Si9/CMzkJ7vGf1Kfl0IHaaRnptkwRzu4zh7x913074+HtLfaEapgKTDAVdUyNQSOo/JPGJaPwLGUaUSuyt9+5dw1+te41R3j9xUCKELUhX4jKCe8+wn+AKISv54jNxaxu5f2q+I9jG//Z+05fa3yzh8VQb76+9NXaF6ptUdYLId707XdeiYE6UbfFRbJku7MLsKkhu9W/mRhiFrDiafpZqp+X8RPMB9QNKd21Yp7tzvUmCub6orFxDkwzoV2vx3gD12+S4Lo3QEEMUzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHKvDXto/0L6CpXpoG5ot9dc8O2Ms4WIgX78JCczf1o=;
 b=ryPq4TRkTFiXq2sps1pIix0MFAUi5/qSPRvZRNLYMzPDmf/S7ID4jQG1OrlAM6eaGHXwgJTjx1n2kX37atOrDJQuIDLjjMwA/BSVxhwQ7L2ENNsdxN5suh2Jp840F2JZCUqZiTQZQzgxEwSsRIT9HCb0gkhwMGDnwBHN1lCQHikSgilwAwdDLvqbaIi2UU6m3IvuqGkFJ9yaMpeUYv1+3xBLfWPvko2Z/VPeIjeWjRSQhCfBewXbZgRoRUysKQuHUCkpxc9Pn/+TAxq62RnxBlma0oOQplwW1EdhHUVizar0JmwL3TUqKp9y4nlhSgcTUk9kVz0GAtl1WBiSAPeSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHKvDXto/0L6CpXpoG5ot9dc8O2Ms4WIgX78JCczf1o=;
 b=UHPjW1NSf2sGt//QpHCtXrfLtRDYpTax6DzUJKgxf6WDuB5fVsJgiOpjbyHFhEAEfu1rb4VvxsZmcXfWeq9tr94tINAaVe23XVW289siFLMBD2GLE6Yc9b2QN+HjjqFuH629t66jzIw64+tKQJEC57j+4pK9ehqlqZ63l7dJ3YM=
Received: from BYAPR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:e0::47)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:27:55 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::31) by BYAPR05CA0106.outlook.office365.com
 (2603:10b6:a03:e0::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:27:55 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:27:51 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v4 10/12] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Tue, 3 Feb 2026 11:22:17 +0100
Message-ID: <20260203102236.3456-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5c0565-3040-4718-35d3-08de630ee4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y5KA/EQ3ivhidOFqaIaQAqUVgjtwn9+zw35scBULz1NQjixd4JOrkMQ1yTYg?=
 =?us-ascii?Q?D9lqrywawqtayhANn9vP3Q06zCv7EP8A1LhyK1Tu/siiSE2h383U+c7wkKPo?=
 =?us-ascii?Q?fvd0/PyoQrElPRRjlN/S5Tp9d6h4aqipWMENHuwYMFkfu91XmulIuvwML3YE?=
 =?us-ascii?Q?AGz3FpZr9I+aB7o1RgpyoAxvG5y2UA+VIDzIl3mbWe7YFQy6GZf2prDCrTQN?=
 =?us-ascii?Q?yGXMEq02ljXUbb8TR+fl7/AIB4kTgaHUudaXXBd01e9YOMuXtS6dsDnS/Jzr?=
 =?us-ascii?Q?hivo+JnC+hoH9IKVH8Arq8Igz6BNGMbmHoJOLwPb7ZwKnnOn33MHQB0HMWi2?=
 =?us-ascii?Q?+T9K+EkGJ7EgLx+jwEa1Z7CjPxeZ8QpbW512bnU3p8syJ+twvrSf+Fx0xihk?=
 =?us-ascii?Q?+vWayQ6Wk/Yug+d8WKCq8iP0t7tUHYf/CAHxgxzqO4pLUVZFReZU9eJhGZcR?=
 =?us-ascii?Q?RRnTZG1mwwrmfc/Dd1x7We8fG4n5hIV8Zpi/B9IEsnHQcK4D280poo6jL6HP?=
 =?us-ascii?Q?NRIGLXEXxdIpuPVsUQA+V8Mql7aLrWor/8kfIDCzr1AyzO5nyOZZWTYfDKDo?=
 =?us-ascii?Q?8NRirShGvoZhjsIpgJjtRsr+pAyltK8vu6y8X7QYYgPllW+t12mCB7VqTvM4?=
 =?us-ascii?Q?S321QgkmGRHjxJV/pVSoACTcnOMHltnwTRJOHu3V9B7OaechHL1tLHMM8BoJ?=
 =?us-ascii?Q?AG1sifj10c87YnKplp1E5MapbbMeyETVduIRTNK1sH7/g2NTVSLotTrQ9+y6?=
 =?us-ascii?Q?EYHdVLX/auqId9d0vg5bOMgFV/K0AQqAor6CpvsnUM0P72olXHjXmfP9BhtQ?=
 =?us-ascii?Q?qJgAbH42E/UWO/Pl/1zIwAv83jjgBBntnHc2+8F6ykGVFn6A8DWgOg6mFZvA?=
 =?us-ascii?Q?Bi9LUHG68rfwXbqL3zQyxIxonr8gHya6/wT2j6VtalhKoSTaXEaUGyTrWG2y?=
 =?us-ascii?Q?GpUxJSTFzvlf2HchThiBSnkKSYBBxRcMWaOMeK4FxoP+kNYMBv9FxJmV7pAp?=
 =?us-ascii?Q?QZtCwhczzugl9SVC7e7MKFgJz8E2XvQmrb9RnZzPC912jcMSWOqQuqJgO5lq?=
 =?us-ascii?Q?fzpr+zVQR+kPbM7fJyDRn2LLeymrFBjoQ3DES2EBRs2Sa9iCo3eNQUC1oXBU?=
 =?us-ascii?Q?AhCRBxUtMwWQmW5hwrjvuBAkfLuMH3vwb/ufzT7lWE5e4aTPR654eUXKh3Cc?=
 =?us-ascii?Q?czcuB71RJ6XSUWtL65f0QYjdmFhg6KtaUgtEwm4APYh2cpA3QrJ0GfxpTFPh?=
 =?us-ascii?Q?fY9pBpH72zBELUH1lqey3cAowHM7wZcLig4m4Y2Z5hGcLu/kRh//A/KoZ4Nf?=
 =?us-ascii?Q?ut+ZSnmFYqCtI1GepY/kUXb636FUAczmM58OVtvaoGaYlDjRxh1apwD3ATW5?=
 =?us-ascii?Q?ou6s/jSML2HDSfeEEkfvuM934HO7GGA4LQVaSRGKwpCsYC1s/zkdligms1QR?=
 =?us-ascii?Q?iKoZOPD75qZMBJVdMrS0GmyO9/f97GnD1l8OfKmOmrk9eFQ+w9VdS79m+Sg+?=
 =?us-ascii?Q?n4HdOo5mieU0Iu+cOlQDbdwoLVxp60TRoYZS4aDp9HvkO8Sbk7SSYySs4V40?=
 =?us-ascii?Q?4e/5P/CSKcWElwcNoh/ok8zFuX3jyiSI3gt+sMTxRtBLzAWFY03J+sSM7NAp?=
 =?us-ascii?Q?Ltic7Bdg53s8aJtdQYbOJu/OK/HAmM5rJxFzVb/tdtqCLGA5ccHbs/IJeIaE?=
 =?us-ascii?Q?OM+fZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sO22RQ5Wb+cq3nQpEpcgpfLeThdauAwm5kARBQTrWaNni8mLimqe4nGzBexSVKspN+IGgAnjfzpeRcZhJ5QjjhGLqL0wLPQ4r6kKozfZiC7u/IRZFPmzh++3Lga2n3E+mEUl2c2Xtqo4IiYQChUHsP91p0XGloQ7F9WGwyGnRQ7A7x0F8tVIFM9gkih+UdvbSJ84y7eZ6Q1ELpUSqGtV19wHNThb/AE8dVNd4TZiRebc0rpdR7G8YvjgkftaxnyprilE9noBTFkL+LzGXBMyO4CY35JOqfDYn8vkerQOPMkOP/xicq/JQU1UYs4ugND84uZM5ZgagMyC5wvrGUvDEujFRtWtU/20j+OuUcRbNv29pnbO64u80i5KDKqXB/kPiICESzK5Vs7kfhRQuDK3NrkFx8pNt7nkIL8+6mpuq+3OfdShjcEb1NkLiJdE5T0+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:27:55.0444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5c0565-3040-4718-35d3-08de630ee4ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
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
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6157DD7A02
X-Rspamd-Action: no action

It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.

The only caveat is that amdgpu_res_cleared() return value is only valid
right after allocation.

---
v2: introduce new "bool consider_clear_status" arg
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 88 +++++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 +-
 3 files changed, 32 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 66c20dd46d12..d0884bbffa75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,13 +717,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
+				       bo, 0, NULL, &fence,
+				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
-		dma_fence_put(fence);
+		if (fence) {
+			dma_resv_add_fence(bo->tbo.base.resv, fence,
+					   DMA_RESV_USAGE_KERNEL);
+			dma_fence_put(fence);
+		}
 	}
 	if (!bp->resv)
 		amdgpu_bo_unreserve(bo);
@@ -1326,8 +1330,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv,
-			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+			       abo, 0, &bo->base._resv, &fence,
+			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f4304f061d7e..b7124356dd26 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -418,7 +418,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
-				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2582,76 +2582,25 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_ttm_clear_buffer - clear memory buffers
- * @bo: amdgpu buffer object
- * @resv: reservation object
- * @fence: dma_fence associated with the operation
+ * amdgpu_fill_buffer - fill a buffer with a given value
+ * @entity: entity to use
+ * @bo: the bo to fill
+ * @src_data: the value to set
+ * @resv: fences contained in this reservation will be used as dependencies.
+ * @out_fence: the fence from the last clear will be stored here. It might be
+ *             NULL if no job was run.
+ * @dependency: optional input dependency fence.
+ * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
+ *                         are skipped.
+ * @k_job_id: trace id
  *
- * Clear the memory buffer resource.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
  */
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ttm_buffer_entity *entity;
-	struct amdgpu_res_cursor cursor;
-	u64 addr;
-	int r = 0;
-
-	if (!adev->mman.buffer_funcs_enabled)
-		return -EINVAL;
-
-	if (!fence)
-		return -EINVAL;
-	entity = &adev->mman.clear_entities[0];
-	*fence = dma_fence_get_stub();
-
-	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
-
-	mutex_lock(&entity->lock);
-	while (cursor.remaining) {
-		struct dma_fence *next = NULL;
-		u64 size;
-
-		if (amdgpu_res_cleared(&cursor)) {
-			amdgpu_res_next(&cursor, cursor.size);
-			continue;
-		}
-
-		/* Never clear more than 256MiB at once to avoid timeouts */
-		size = min(cursor.size, 256ULL << 20);
-
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
-					  0, false, &size, &addr);
-		if (r)
-			goto err;
-
-		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
-					&next, true,
-					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
-		if (r)
-			goto err;
-
-		dma_fence_put(*fence);
-		*fence = next;
-
-		amdgpu_res_next(&cursor, size);
-	}
-err:
-	mutex_unlock(&entity->lock);
-
-	return r;
-}
-
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -2669,6 +2618,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		struct dma_fence *next;
 		uint64_t cur_size, to;
 
+		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2690,9 +2644,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	}
 error:
 	mutex_unlock(&entity->lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	*out_fence = fence;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index a6249252948b..436a3e09a178 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -187,14 +187,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
-- 
2.43.0

