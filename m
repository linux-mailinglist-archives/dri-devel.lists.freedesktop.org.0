Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B63C786E8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35B10E828;
	Fri, 21 Nov 2025 10:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tt9/hSmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B510E828;
 Fri, 21 Nov 2025 10:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUormmhD+IRJUOpZ067Y+fOmQf9/ODqB8ZHUpoublJedh/yZ6OM8h5nG28+tDIbn+eDNAZedJc4n9kFoAG9G7nHxwN3lQk+eqq1q72BPHk/XBMi9ld/V4W+L+vV9I/J1yAXuizqZe7wIq1KgDL/y8enJGIFXpYcPmIWIdUenDOxXVvU+2JMCIBpK4Iwe/wixo8JY0YT6GmF6W2k3Xa5bdDrAmeuCKdH00CAeROqjrgE/lDq/OuymRdsjRLNhTV7MfIYNOtULcGZ1s2Jo9qIl7ZWl0StVVNcmQDXgdZD33XoA1D3aaxfmLov0+nArExpFhBwIeL0OoZjtxCCHuD3nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xow+5i/XkAAMmPtr3fWovZuFKTY7Gp8Yc5piYCQbzUo=;
 b=LwVbACn5nZfMisD7UZeLssJ2KmbRi0R71bEuZQM4yn2tQOlAvaOYVeXo3l78iA5U0fHTEHfd2+CYq8z/Ih4DbbRSEfgoN/JaaWfHNzH4vj7yJ5t4DD/tZMrqr05vmC0SLfjTApym126d4pVpwJrUEiRAfXm/4/sSISGAQCtjFLGTEdyGoev4n6QJz+/V+lsVZTVR+wSwcWvCTDo5dwsiR76hyirmWJ7q6jx4eR4NPB22dfnXvVX4GlQoheFXd4loqmBOKZAGA4YD8cKRFV2VYzyHyykFvyTpFT3kBst84t1DCQTinrRTusH6XeL5eA+QbZ13YFwWCdKUJb7yla/R1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xow+5i/XkAAMmPtr3fWovZuFKTY7Gp8Yc5piYCQbzUo=;
 b=tt9/hSmcuNCstUx3CPN7v9ZoXAVZzGiRm47uNU+NDHVxPA/Fn1eJcp3fq9w8vzIbwR/RtIq4WXiHrjuBBLFHnc11bVQxicZjDS2YQ3wP/GcqmUsKpM11/YWvH0MCHifujLkmFHxCWTVm1FHAlg3g02sfE2PsvTiRRa53jUzrPf0=
Received: from BN9PR03CA0630.namprd03.prod.outlook.com (2603:10b6:408:106::35)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:16:55 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::24) by BN9PR03CA0630.outlook.office365.com
 (2603:10b6:408:106::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:16:54 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:16:53 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 14/28] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
Date: Fri, 21 Nov 2025 11:12:24 +0100
Message-ID: <20251121101315.3585-15-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc83509-8aa2-477a-899e-08de28e718b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LQgvgVRMQjV9qrk7OhKuDKamk6oCeBPsOPXcH4d7UUbpZ+7lZDQ2wRJ+3GzZ?=
 =?us-ascii?Q?ouwISw6SRe4GOm3/TP3Ht8bF3TxVUdWomGibcU6bC9iUw3ghf2nwkecQHfAO?=
 =?us-ascii?Q?lQpESNL27Y4oPNhAFkcqAbhXk4ODopL/HLMxYfpG7T7D2suZK9aiiZaZz/qJ?=
 =?us-ascii?Q?nzqk6n57L2XB5RgyH9pwuHxP4CGliycph6G4pd227jnHcH4ZfAbTIqezqpnQ?=
 =?us-ascii?Q?4Q7fpaLEKoCUnMaTQHtQNeYs3TSWxZ9b6w20/H/Ri6hbvwdVCkD92nX2LIhd?=
 =?us-ascii?Q?sTTRYucODQ8CM7pD1AwyGFJ+vA8XAT2693lsO3zxcgbBX0MhL/6CaH6XsVhx?=
 =?us-ascii?Q?LzYVfwxHU+elMxUvPg68m3B9R6z/yZeCRNdM6dJizuVXx/9MeoOKFrJI4L94?=
 =?us-ascii?Q?xJvvsjKeJWnsyd22z61OFDD9vfuZMt3e+r6a2Z8zFhS0K+6xHJ7pr0L4TSK5?=
 =?us-ascii?Q?WtNtvbD3JumPN89YTTDWzuixXSCjS9Hnhm+Yw0gKBqLFzok6n67/zHBeLegc?=
 =?us-ascii?Q?iAhDarF0LyeWk9LOCBwPOSgRbGolfx0QXU7uiu9QuQQhGo7H/fOOKj+6pv6R?=
 =?us-ascii?Q?547U9CjsFPrEkg29J2JuaZ9etmWb6QqTMJ83NBJEmvttxjWV4wo0E3nMDsWX?=
 =?us-ascii?Q?7sCRq3NovbgZfTipxqNqV53uGvFNFoBm4Uyv92r4jLDl0XMKZOPV9CaCLS0l?=
 =?us-ascii?Q?jIRgL+QDR1598KMsnMy+xlptG++yMWIJTTuhxy5pI6QEF22H3AY5uilF4NC4?=
 =?us-ascii?Q?0PjtWgIEPWyXuaHEytlBxE1AQxLcAumz4o+YubbtwD0ZYURHMWLNrn27hzue?=
 =?us-ascii?Q?2Obs70JJKQ04T2gT4vHLe14jcan9hvVD28RxBEdvt70+hN7qHii0qqb+LpcC?=
 =?us-ascii?Q?idoXaQygCZNBBkPcIXuCHZct2i6xOkRKJHR4RFsSqXn/R5+FMzBbGTEj2jlu?=
 =?us-ascii?Q?pxnYXiZdoL66/ko1LPM9G4Jj1wEmAWKrONqTbTF/UOT1B1JCn711b6ET4MB9?=
 =?us-ascii?Q?HyiD1YOBJed5kr5UN0/boH28A1Kyp/xf6tbBc7jARSpINofyqvKqCrB7l/qJ?=
 =?us-ascii?Q?wtDaMQFfKsrQwcd2AVkTsP+TGkc9/uYwIe+blumxC0YoMn8DvMPqEMRgEi1I?=
 =?us-ascii?Q?DiL5urjgNw1BmhD+oJ+FGaAE/GmBx6jVcNMKEzUPANawAv1hEUA5DV8XocNx?=
 =?us-ascii?Q?tG2RLibd52GmP+jcQPHrktRNyPrpG8e/UhRdzCPoiQ6IFVMgKiH0wnyThlmX?=
 =?us-ascii?Q?XkhYuz06HadEeSzA+9cgYGzmi/nHIr/mKTBVXMx7XvZlciF7JKuXJUR1Yk0V?=
 =?us-ascii?Q?bzl+RjbHblmC4DpMooEkeUtCu0yPUeirQlqHrNsK8Ymcj2hXwLgdJdq3x6AT?=
 =?us-ascii?Q?Z5f6PSK76w2Cyib/AlrStobClg3ctO5/lJbx5nT+xBmMmIG/muL/8Wt8TgRE?=
 =?us-ascii?Q?cgaUM+FCynqu7aOhZB6PL+D9p9MeirrZ7sKSr1hb1pB+tg3u0boO4U9b/7Df?=
 =?us-ascii?Q?JYtVJ5WiZ8XzQc151W2Q61LygYXcre218BZ8aghYmejeeMj2ZOtgyVgWjSgZ?=
 =?us-ascii?Q?B1O4elvsNp2LMLaR0hE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:16:54.9828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc83509-8aa2-477a-899e-08de28e718b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496
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

drm_sched_job_arm and drm_sched_entity_push_job must be called
under the same lock to guarantee the order of execution.

This commit adds a check in amdgpu_ttm_job_submit and fix the
places where the lock was missing.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a803af015d05..164b49d768d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -163,7 +163,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 }
 
 static struct dma_fence *
-amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
+amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entity *entity,
+		      struct amdgpu_job *job, u32 num_dw)
 {
 	struct amdgpu_ring *ring;
 
@@ -171,6 +172,8 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
+	lockdep_assert_held(&entity->lock);
+
 	return amdgpu_job_submit(job);
 }
 
@@ -268,7 +271,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
 	}
 
-	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
+	dma_fence_put(amdgpu_ttm_job_submit(adev, entity, job, num_dw));
 	return 0;
 }
 
@@ -1512,7 +1515,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	fence = amdgpu_ttm_job_submit(adev, &adev->mman.default_entity, job, num_dw);
 	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
@@ -2336,7 +2339,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 
 	return 0;
 
@@ -2379,7 +2382,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 		byte_count -= cur_size;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 	return 0;
 }
 
-- 
2.43.0

