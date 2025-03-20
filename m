Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F86A6A318
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A6910E5AD;
	Thu, 20 Mar 2025 09:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ESJBCSfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182A10E5AD;
 Thu, 20 Mar 2025 09:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gepx/6Gh/J/AE+RgepbYeFRCSJbfBoKuVboLQtPwY1VT80lvA25hBiWwuboHyUfEYvnFV1sn5aQwensAkCOem2llwUjMfeSBGHjXHAd1vim4EOeOqxv9h/zjDpJB/y7yN22tptiOANLEXVROw866b+A54xpBgBbGMuWE6GLHriTZD2AXvyDH7wLGn9diVLlElXmvqrVwUJxXjz5BlACZOICcMpVOzmCUbFuC6OkJR2BbpnxyHbHkEbbJ1hskz/gbFJkDObNpq9gLRUUZUlpVKYVit9IC0LxzNObB1pphNNkHgDq4jGK6vZlGHXlYjZ/dWQJdIQqIESNK2Fa3bZoQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZNzdBzes7g999w4yJcMdh07FkGySZ0cq/CoJzlNF7E=;
 b=P2h4BXvriseWKPC197zJktl/4VxwRx88euLJIyDNpeShR7n3/zJo3dNj/87Oqj/ofP4gu4VuhMVi7oMfpWv+9YvWJ0AwdnXHyDkz+ank3fvGr1xehxhSCl6hGLLE9qk8fcwTMFW+TXLmVxlbPum6lpXvzOD33/or9MbjCngdkjXx694+tD+7PugME/WsMon9Oqq9/hqw4GariWXEtw6viE4nJSZgeFxZBL8y3izGoW2iWH99cR0Ua7n8V8JqrxosS0dF2nT792UIIeDvtVYq1KwUsBGLwLtFV8LPgWsQ85gu4aMMZx7Jl4F3Ui/4ZHBEeJ8oV6q+vJUqvv04agKfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZNzdBzes7g999w4yJcMdh07FkGySZ0cq/CoJzlNF7E=;
 b=ESJBCSfrCWxGg6JUYYZgEXZfQAa5eJgvjr+VFwCYH1whxEHhsIFfso2UWYLmf1nUsRz1BrDJfAGSlrZm5w/2+1mK9iu91o/W3oIAZpsIRKLu80dN94iPOhysBC2WZcEJ7bSJLHoBgnum4eYCYLl1A+6Wr2+BzofuTSaq+vXOU50=
Received: from BL0PR0102CA0049.prod.exchangelabs.com (2603:10b6:208:25::26) by
 BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 09:59:41 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:25:cafe::c7) by BL0PR0102CA0049.outlook.office365.com
 (2603:10b6:208:25::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Thu,
 20 Mar 2025 09:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:59:40 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 04:59:33 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, "Rob
 Clark" <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, Melissa Wen
 <mwen@igalia.com>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <lima@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: [PATCH v8 02/10] drm/sched: store the drm client_id in drm_sched_fence
Date: Thu, 20 Mar 2025 10:57:58 +0100
Message-ID: <20250320095818.40622-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f4a17f-46bb-4bfe-ae33-08dd6795eec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampkVzNXMzhLbjRick1wV0lrTENyeU9ZenZCYXg2NmFOVmdsbXRBQmZVc2h4?=
 =?utf-8?B?aEJxZE5vZHh1bDBIQVpUcEFla1FXRFF2UkRIRk1rTGQrNDNxMHgrQ0FWdWN2?=
 =?utf-8?B?cU56cjlHT1BMU0M3RGlyN3IvazdkSVVZZmc2T3oyNFRXSU14VWszN1BWTGxD?=
 =?utf-8?B?S3dDSzd4VUsxWlE5dEZYUDMrVEhEaFBsNFRPQjR2UmUwTkoxV0RSaHhiVjRh?=
 =?utf-8?B?WVBUektnc0t4NThWZ0NZeWsvbTVyYWl1Vi91bjE0TEllUVI1OS9MN2VVa1By?=
 =?utf-8?B?US83LzdoSmVoVGZMOHBvNUdHbHQ3bjBWUThkS29FZTBVL3VHaG9FMURHVGdR?=
 =?utf-8?B?eXF4cTVYeENYUlVYZnNrTFFsdlJIYnFnckkrdW05aEpaUno4VUVSWG1lU3Mx?=
 =?utf-8?B?NkVycnNwWFZpeG9EZFpsMi92azBWMlArd21HNFNJT3pPRTlDWUkzSzE3NE5Q?=
 =?utf-8?B?RTVPZTMyMnFkOFdBTFowaXBSRWU5ZFVoRTl4bkV3TjRaWTNkaXN4Rkx0RjJR?=
 =?utf-8?B?YjlFZUx3dUg3SWhQcFh2b2NuaVZEL3lYT2crdUNhYmkzUDZDcS81RmJMbFEz?=
 =?utf-8?B?d2dkUC9JSFhtR2d5eUNlSlNKU3d6OVptdUxYTHQrbFdwSnZHMzEwdXgwMUFq?=
 =?utf-8?B?UzUzNlR5VFN0VFBYN0JXdUJHQkZQa2F1YUpUVW94QjRVbUswR2RtOXdJenAr?=
 =?utf-8?B?UVJTaDY2dngybCtFaEc0Y0dZVW15QWFEU0RtL08vM2sxQndFTjlsVXlBRGQ1?=
 =?utf-8?B?cUp1THZJaktRNFNDeU0zNm9VT21wSnJHdWFiNllnc3RIaDlPWFZYSVltT0hj?=
 =?utf-8?B?amZaTUJjRG5oMmxRcUtoUzdmV2NGTStoQ0pXbDJhZitwNHVlak9uUVg0SmRQ?=
 =?utf-8?B?REtDdGhrK3ZGeEVRdm1DUm9wQVNpL3hpeWhWV2xZQlhrTldFcnU1MTc1NTdD?=
 =?utf-8?B?M1dsUjJVNG1WYXhiRWFZME9DRy9aeFRsd3daTjlVdGlmdXRTdXQ3T3g1Lyt1?=
 =?utf-8?B?VWdVVSsxZTltMlZxV0VNRTBjSmpFcFdXc1E2d2c4YXFEUzgvdE00MmwySWpp?=
 =?utf-8?B?Q0haYjh4bzdoQTNrVGd5NnpMYUhhbW01WUlLYUNuRFZTN3pidi9lOE91R3dU?=
 =?utf-8?B?YVlrMWV2ZFpQVk5raVBNV2lnQkFEOE91dEQ2TnNydkhPUFR0SVBpUit0VGlm?=
 =?utf-8?B?SmhOVjR1cVNTSCtzRnBjY2U5N3dPZUxuUU1oNXg3QjNGbUdFN3pKZWg5YXVP?=
 =?utf-8?B?bFpEMEc2U29hd0dmWHN2c1pHZUFIcTZLSU1LRlVFWEhlS0k4VG5CczJqRStk?=
 =?utf-8?B?QUIrRGtiQjYyWmk2cEpDSitWQlIvN3B0cWY5YjAydHQ4VDA5MUo4ZFJySFBj?=
 =?utf-8?B?Y01zVWVISTlXOEdSUmJoVnVESnB1NEhvU0xiNU5oZTJYMjZPaWdIdUhhMUZP?=
 =?utf-8?B?eXlyZ3MxcVJQVHBPZjl0K0lzbnl5MGhvUXJ4bElabkdYb2hoV2VWU3hJYmFa?=
 =?utf-8?B?TEI4bTlDL25OamZ5RVNLYTFqQmxRNml3cmVvMEZGNEE2ZW8xcmZCRW9NZjIx?=
 =?utf-8?B?MXBCNE9TTGNnbmRQVVR2dmdzb1FHWnUyOUdRUVlGNE11aUhKR1ZiMVAzNDJZ?=
 =?utf-8?B?NHBoazhFOHFmUndDZHdXQzRrT09DekZRZnVMOGJTTWlpUXdTUlRrNVZWQm1l?=
 =?utf-8?B?TGx6TXJab3dhZmRFWVQydWRVbjVhbERCVWR4aUFtajV2dnFNNEZDcGExYnRx?=
 =?utf-8?B?ZWRNMXRrT3BHTHhLRllDY3l2ak1FSUNQSThsdnl4TTZHWW5ISndhbnR1Rnpn?=
 =?utf-8?B?TU92SVk5ZW5sM0FxVFhobkxrTUh0YW1VOU5oMFFra1lyTkNzM2JuWHlYa3or?=
 =?utf-8?B?RThQU1V4dTNtWnN0U1NNVzZ6Ym10bktiOHBLK1R2TGdQV0VYcVAvVzJhMElx?=
 =?utf-8?B?VWJBdFhMWEI1S08yNkJOcy9hZFB0dk5XWmdZcXpPYm9MT2wxN3NHR1RnR1hy?=
 =?utf-8?B?a21aUlNucG1Vb2RQaVRuSVZUeTFMQk83YTZrOC9xV3ZMRStaOEo5SGt3b0VN?=
 =?utf-8?Q?dWSc+2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:59:40.9311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f4a17f-46bb-4bfe-ae33-08dd6795eec1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
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

This will be used in a later commit to trace the drm client_id in
some of the gpu_scheduler trace events.

This requires changing all the users of drm_sched_job_init to
add an extra parameter.

The newly added drm_client_id field in the drm_sched_fence is a bit
of a duplicate of the owner one. One suggestion I received was to
merge those 2 fields - this can't be done right now as amdgpu uses
some special values (AMDGPU_FENCE_OWNER_*) that can't really be
translated into a client id. Christian is working on getting rid of
those; when it's done we should be able to squash owner/drm_client_id
together.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c             |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h      |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
 drivers/gpu/drm/imagination/pvr_job.c        |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c      |  5 +++--
 drivers/gpu/drm/imagination/pvr_queue.h      |  2 +-
 drivers/gpu/drm/lima/lima_gem.c              |  2 +-
 drivers/gpu/drm/lima/lima_sched.c            |  6 ++++--
 drivers/gpu/drm/lima/lima_sched.h            |  3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c         |  8 +++++---
 drivers/gpu/drm/nouveau/nouveau_sched.c      |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c      |  2 +-
 drivers/gpu/drm/panthor/panthor_drv.c        |  3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c        |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c      |  5 +++--
 drivers/gpu/drm/panthor/panthor_sched.h      |  3 ++-
 drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
 drivers/gpu/drm/scheduler/sched_internal.h   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
 drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
 include/drm/gpu_scheduler.h                  | 10 +++++++++-
 25 files changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 00d215ac866e..8fb107305872 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -827,7 +827,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		goto up_sem;
 	}
 
-	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx);
+	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx,
+				 hwctx->client->filp->client_id);
 	if (ret) {
 		XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
 		goto free_chain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 4cec3a873995..1a77ba7036c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -639,7 +639,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
 		goto err;
 	}
 
-	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
+	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job, 0);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 5cc5f59e3018..d115fa10f8ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 
 	for (i = 0; i < p->gang_size; ++i) {
 		ret = amdgpu_job_alloc(p->adev, vm, p->entities[i], vm,
-				       num_ibs[i], &p->jobs[i]);
+				       num_ibs[i], &p->jobs[i],
+				       p->filp->client_id);
 		if (ret)
 			goto free_all_kdata;
 		p->jobs[i]->enforce_isolation = p->adev->enforce_isolation[fpriv->xcp_id];
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1d26be3c6d9d..c8c3f2601548 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -203,7 +203,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job)
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     u64 drm_client_id)
 {
 	if (num_ibs == 0)
 		return -EINVAL;
@@ -221,7 +222,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner,
+				  drm_client_id);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
@@ -231,7 +233,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 {
 	int r;
 
-	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
+	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index ce6b9ba967ff..5a8bc6342222 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -90,7 +90,8 @@ static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job);
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     u64 drm_client_id);
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 			     struct drm_sched_entity *entity, void *owner,
 			     size_t size, enum amdgpu_ib_pool_type pool_type,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3c0a5c3e0e3d..76c742328edb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -534,7 +534,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&submit->sched_job,
 				 &ctx->sched_entity[args->pipe],
-				 1, submit->ctx);
+				 1, submit->ctx, file->client_id);
 	if (ret)
 		goto err_submit_put;
 
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 1cdb3cfd058d..907d3f735a3f 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
 	if (err)
 		goto err_put_job;
 
-	err = pvr_queue_job_init(job);
+	err = pvr_queue_job_init(job, pvr_file->file->client_id);
 	if (err)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index eba69309bb6c..c2169e8a855d 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1069,6 +1069,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
 /**
  * pvr_queue_job_init() - Initialize queue related fields in a pvr_job object.
  * @job: The job to initialize.
+ * @drm_client_id: drm_file.client_id submitting the job
  *
  * Bind the job to a queue and allocate memory to guarantee pvr_queue_job_arm()
  * and pvr_queue_job_push() can't fail. We also make sure the context type is
@@ -1078,7 +1079,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
  *  * 0 on success, or
  *  * An error code if something failed.
  */
-int pvr_queue_job_init(struct pvr_job *job)
+int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id)
 {
 	/* Fragment jobs need at least one native fence wait on the geometry job fence. */
 	u32 min_native_dep_count = job->type == DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
@@ -1095,7 +1096,7 @@ int pvr_queue_job_init(struct pvr_job *job)
 	if (!pvr_cccb_cmdseq_can_fit(&queue->cccb, job_cmds_size(job, min_native_dep_count)))
 		return -E2BIG;
 
-	err = drm_sched_job_init(&job->base, &queue->entity, 1, THIS_MODULE);
+	err = drm_sched_job_init(&job->base, &queue->entity, 1, THIS_MODULE, drm_client_id);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
index 93fe9ac9f58c..fc1986d73fc8 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.h
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -143,7 +143,7 @@ struct pvr_queue {
 
 bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
 
-int pvr_queue_job_init(struct pvr_job *job);
+int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id);
 
 void pvr_queue_job_cleanup(struct pvr_job *job);
 
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 9bb997dbb4b9..f46f961afc56 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 
 	err = lima_sched_task_init(
 		submit->task, submit->ctx->context + submit->pipe,
-		bos, submit->nr_bos, vm);
+		bos, submit->nr_bos, vm, file->client_id);
 	if (err)
 		goto err_out1;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 825135a26aa4..c9959fc3be47 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -113,7 +113,8 @@ static inline struct lima_sched_pipe *to_lima_pipe(struct drm_gpu_scheduler *sch
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm)
+			 struct lima_vm *vm,
+			 u64 drm_client_id)
 {
 	int err, i;
 
@@ -124,7 +125,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	for (i = 0; i < num_bos; i++)
 		drm_gem_object_get(&bos[i]->base.base);
 
-	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
+	err = drm_sched_job_init(&task->base, &context->base, 1, vm,
+				 drm_client_id);
 	if (err) {
 		kfree(task->bos);
 		return err;
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 85b23ba901d5..1a08faf8a529 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -88,7 +88,8 @@ struct lima_sched_pipe {
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm);
+			 struct lima_vm *vm,
+			 u64 drm_client_id);
 void lima_sched_task_fini(struct lima_sched_task *task);
 
 int lima_sched_context_init(struct lima_sched_pipe *pipe,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..d9be0fe3d674 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
-		uint32_t nr_cmds)
+		uint32_t nr_cmds, u64 drm_client_id)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
@@ -54,7 +54,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
+	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue,
+				 drm_client_id);
 	if (ret) {
 		kfree(submit->hw_fence);
 		kfree(submit);
@@ -693,7 +694,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
+	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds,
+			       file->client_id);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
 		goto out_post_unlock;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index d326e55d2d24..460a5fb02412 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
 	}
 
 	ret = drm_sched_job_init(&job->base, &sched->entity,
-				 args->credits, NULL);
+				 args->credits, NULL,
+				 job->file_priv->client_id);
 	if (ret)
 		goto err_free_chains;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..f4f20d11ecd9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&job->base,
 				 &file_priv->sched_entity[slot],
-				 1, NULL);
+				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..bd8e1900c919 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -989,7 +989,8 @@ static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
 		const struct drm_panthor_queue_submit *qsubmit = &jobs_args[i];
 		struct drm_sched_job *job;
 
-		job = panthor_job_create(pfile, args->group_handle, qsubmit);
+		job = panthor_job_create(pfile, args->group_handle, qsubmit,
+					 file->client_id);
 		if (IS_ERR(job)) {
 			ret = PTR_ERR(job);
 			goto out_cleanup_submit_ctx;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..e0c79bd2d173 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2516,7 +2516,7 @@ panthor_vm_bind_job_create(struct drm_file *file,
 	kref_init(&job->refcount);
 	job->vm = panthor_vm_get(vm);
 
-	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
+	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm, file->client_id);
 	if (ret)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4d31d1967716..56bac7a765ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3729,7 +3729,8 @@ struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job)
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-		   const struct drm_panthor_queue_submit *qsubmit)
+		   const struct drm_panthor_queue_submit *qsubmit,
+		   u64 drm_client_id)
 {
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_job *job;
@@ -3801,7 +3802,7 @@ panthor_job_create(struct panthor_file *pfile,
 
 	ret = drm_sched_job_init(&job->base,
 				 &job->group->queues[job->queue_idx]->entity,
-				 credits, job->group);
+				 credits, job->group, drm_client_id);
 	if (ret)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index e650a445cf50..742b0b4ff3a3 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -29,7 +29,8 @@ int panthor_group_get_state(struct panthor_file *pfile,
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-		   const struct drm_panthor_queue_submit *qsubmit);
+		   const struct drm_panthor_queue_submit *qsubmit,
+		   u64 drm_client_id);
 struct drm_sched_job *panthor_job_get(struct drm_sched_job *job);
 struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job);
 void panthor_job_put(struct drm_sched_job *job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..d208d384d38d 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -206,7 +206,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 EXPORT_SYMBOL(to_drm_sched_fence);
 
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner)
+					      void *owner,
+					      u64 drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
 
@@ -215,6 +216,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 		return NULL;
 
 	fence->owner = owner;
+	fence->drm_client_id = drm_client_id;
 	spin_lock_init(&fence->lock);
 
 	return fence;
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 599cf6e1bb74..7ea5a6736f98 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -24,7 +24,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *s_entity,
-					      void *owner);
+					      void *owner, u64 drm_client_id);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bfea608a7106..501eae13acb3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -764,6 +764,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * @credits: the number of credits this job contributes to the schedulers
  * credit limit
  * @owner: job owner for debugging
+ * @drm_client_id: drm_file.client_id of the owner
  *
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
@@ -784,7 +785,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner)
+		       u32 credits, void *owner,
+		       uint64_t drm_client_id)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -810,7 +812,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 4ff5de46fb22..5171ffe9012d 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -169,7 +169,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->file = file_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 1, v3d_priv);
+				 1, v3d_priv, file_priv->client_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 1905ca590965..f4679cb9a56b 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
-	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
+	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
+				 q->xef->drm->client_id);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 50928a7ae98e..032214a49138 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -305,6 +305,13 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+
+	/**
+	 * @drm_client_id:
+	 *
+	 * The client_id of the drm_file which owns the job.
+	 */
+	uint64_t			drm_client_id;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
@@ -587,7 +594,8 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner);
+		       u32 credits, void *owner,
+		       u64 drm_client_id);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
-- 
2.43.0

