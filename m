Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5FABF9DD
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C7A10E723;
	Wed, 21 May 2025 15:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dV+7xhRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF42510E06B;
 Wed, 21 May 2025 15:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihpoZBWWfbLuqIx+coVKEulSDMFRosifjZZ+gJSTHT/7CV0S+JL9V85COaHPUdCsqxEsL6bNmOW9iUpvD0Vjcsvq2BcP+wWJTJHWHVNMe166WNosF+Qg2MN65ESH1KkkOnLnKEWsZCAXxdww3qRDA2a2UpFpnJFbNn8g0TAGwdB4TVDJWfePFRpU4Q4uCxewfKqBMK7D0Nuc7HDJYceHYgTJUVy38ac8hOL5CtMwkysOxAwAtZ8rclDmUIy/sIHxfnwIBBJx7S+HQaTO1BnsiEjEH9Ote8TNyIEhAPfXcsmT4qT/2OCIv64f8XCvwSblaORY5TgI1dmru6uAwqC2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHFOBh+KMLnECp2wCZwFZd/BmTBg98tYy7ffcp0+n8A=;
 b=Ut6EjckOc6bHqxg9D8vWp1+7xC2OVAT2JE/GwqMkfnUNI0ibGsDAz7xvwhBgt6226S6m3NZqYqYy68c9n2gA35sFOrz9uWFzlWRDHtehapK1bH+u7I23Tf+/jpDi4NKnXwRE0TxbazCRmeSsm9Sp4pJKM5mYq2OxFkXPMlyTZ0Yg6yOYPPW1W+t79JiKaWMHpTvlT9YwWjRJoQqdIN5VWZ8cnxO0KYBw5fSpTRzAX8FOK4df3GTfb+i9lVT0VOORZ22r7lnaypz8k2FeE9W3R3FS+PMnfleB5AH26rEnuQG5h7JcKH8PrYMpaoJNE1P5bFR+1HWtZQtbGvPPHPb6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHFOBh+KMLnECp2wCZwFZd/BmTBg98tYy7ffcp0+n8A=;
 b=dV+7xhRUNyT9fVU7joRcmnio1mUUMQc454bugyuYi7UijZzIYW8/G2jhNwgweX+7rQiwaoWOfZJVLTgMhry2FZIatNnkiMWPPMqlV/vmiAyQs66VvWOfsJ0DWsc/gmZX6vrZhmhb0wzXeTBr271OYMXhaskpKRCuvOtYYE5Iu34=
Received: from MW4PR03CA0315.namprd03.prod.outlook.com (2603:10b6:303:dd::20)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 15:46:26 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::4d) by MW4PR03CA0315.outlook.office365.com
 (2603:10b6:303:dd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.26 via Frontend Transport; Wed,
 21 May 2025 15:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:46:26 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:46:17 -0500
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
Subject: [PATCH v10 02/10] drm/sched: Store the drm client_id in
 drm_sched_fence
Date: Wed, 21 May 2025 17:45:04 +0200
Message-ID: <20250521154531.10541-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 3736a5da-2d9c-4557-8124-08dd987ea538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U01ZRkloZjRPSmdXa1pJTkh4bFRoZlJEUUh4ako0UGVjWWVxTXJqbGZwZDhE?=
 =?utf-8?B?S3lwSU05aTFiNHdUMU5ycTBUTTQ5aFVKZ1RSVW1xWENuMFZnRHorU01RQzh4?=
 =?utf-8?B?VldRcXVLZFBEekY0U2ZHbTRlVy9KT3dReWVoNDlxMm1OblJSaUZnOVBlOGd2?=
 =?utf-8?B?ajM3WHhHSVdRd2JoYWNMZE5MNmxTSHRGNDRZRUMwQVFraVJoMWRmK1pWbUtW?=
 =?utf-8?B?Zk11czExVzhlZzM0aFRxcERVSnJnWExaWkF3SEtkeXhUNU5nNXBEYmRqMHRx?=
 =?utf-8?B?dDVQY0FoZkpMVXh0NHB6R291WWJ5aVUxaHZWOERsSUl3em5GK0w4YWw5OEdn?=
 =?utf-8?B?cVZMaTh4Rnk0ckJudFA2eWNXTm4wODlzeDM2UE5CRERTNDJKc1pRNkNJa1ZU?=
 =?utf-8?B?K3FmcXZ6N3VHQndYMHVlME1MVHpoclEwR1ZCbjJCSGlVUjNUUWpVeFJSMzVo?=
 =?utf-8?B?bTQ2bnRTSG9mbXFscjF5MmQ4eWVSNGRDdjYzc0lzQUVQYUIwUVpFMitNZU1w?=
 =?utf-8?B?cnVkT2thUUdVT3BRYXVmN1NYMVNsZ3k5RmQxNHpmR3NCci9DVHloV3lRZzJF?=
 =?utf-8?B?SUFuMUlUZHVzR2tHQk9CMTVlbXprSHJPN2RVZ2RRRGpKNGd1ZlBVY2ViM3lO?=
 =?utf-8?B?QVlnbzY3ZVp1YWhaaFcrL0t0WjVEeXhTL09aT1FORGhsODUxU1RNanozY2dz?=
 =?utf-8?B?VkFQUVJiR2IvQTBGZEE4QS9ORUJKWkkwVnNDcUQ5VnBkY0hxWWVDUEdTRnJs?=
 =?utf-8?B?R05BS2NtOFBuWEg2SGFBemw0NHo5SElJN2hQa1JUUnZIOWZleS9DL1phOHow?=
 =?utf-8?B?SEM4UVEvd2g5UnpkU2thdGZGZmZmb1lhOXpaVUpCZCtpSjRpb2g2WHBmaHNv?=
 =?utf-8?B?aHJUdkpKY2UyUUh2R2xvNnh6RVBIdGFPWEpGMHhOSGJGQWlhREw0TWF2b1l1?=
 =?utf-8?B?cXFuZE1JSkk0L2xhQ1Z0N3FOa29XbHF0cnRnbnNzaEV1YWoxdWpJcS9lRGgv?=
 =?utf-8?B?TlF2Q3NnalFka05IdmNHTTk0VHpwZkJKUERyS1JTM2dIRnIwb1F4Rnh0NGFa?=
 =?utf-8?B?UEhsSS9ZTzNuK1FrRlFjRGxPL2NtU3JmQWZlR1Q2N0ZDdG1PT3FKZlJTYjgz?=
 =?utf-8?B?WUxZOWVncUZjUjRtaWNObWJjK3hxNTF2cWF0N2JEUjduTlI4OWpzYXFEVlNu?=
 =?utf-8?B?T2VNN0hHTHlKRmJaNjRneHBMT0I0dFZWbm9ISjNpaUpVMkRySENYTWs1Vldh?=
 =?utf-8?B?SWFUSmlkdkJhY2NUV0xweVlpc3dwbE0vOE1CTHhUdlRLL3lpZTFZaFRhTDJV?=
 =?utf-8?B?aWROQ3V6OHRDU3M4dC9tQ2U3QS9jQTBzWkJmend3VmQ4OER2NW5LQ3R1VFg2?=
 =?utf-8?B?c1BOdUxESm1EVllnY3M0bEl2VVhnQnUvbWxvcGJ6TTBPc3hpT0p5eGh3Y0Vh?=
 =?utf-8?B?TUxtTnlWR1RYWUQrRFBmTHg5TDRHeGJvU3VYaWc2bk03TWV6NTZIMlFXb0Mw?=
 =?utf-8?B?a1p5amhiU1Nkb3AyVWtib0VjZHlERmNDSWhGaVZoQTZKYTd0YTFJOFVxbEFF?=
 =?utf-8?B?c0R6Und5R2pTQWV0QUFCSHlGcnhjV2RqQ3lhcHhOY1I3MVZOeGFWaTJqYWls?=
 =?utf-8?B?LzRNdDdxVXc5OUtwSDZmZzc2NXR6UkVoam41VFRRTExVandoNGRaSkdIaERP?=
 =?utf-8?B?Vy8yUlFLeWhySGNUaGNQcGovbDYvekRUVEMweENFTzZxOVFFQVV0SEU2ejhW?=
 =?utf-8?B?K3Q0dmNSNHFVUmxIWVgza2pFWk81NHlmeFhDazJXWEdINE1GenNhUTZLNldk?=
 =?utf-8?B?bXZubGhNK3o0dlY0S1Q4QSs5QU1uYTV5ZzFNOHRaUDVjeFR0SldWeEdETWN3?=
 =?utf-8?B?Y0d4Q0RWS2wvc25MbUQzUEJsZVlEbnd5UnRsandIUUZEazlKZm9NS05CUHNU?=
 =?utf-8?B?ODQzQnpnSGdzb2RERUlIZ1VXK3hFMHRDVDU1c1pWRllKaWFFeHRjVnQ4RVFs?=
 =?utf-8?B?OFlYc1RjcEpUaVZ6aVdOaEVmbXo0cUZONnh2dng0RmVEclB4Q0tGdlZ1MmVz?=
 =?utf-8?B?Zm4yWlE2NCtYODdVS2Q3VFJVL0pTM05yb0xkQT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:46:26.0458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3736a5da-2d9c-4557-8124-08dd987ea538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335
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
 drivers/accel/amdxdna/aie2_ctx.c                 |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h          |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c     |  2 +-
 drivers/gpu/drm/imagination/pvr_job.c            |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c          |  5 +++--
 drivers/gpu/drm/imagination/pvr_queue.h          |  2 +-
 drivers/gpu/drm/lima/lima_gem.c                  |  2 +-
 drivers/gpu/drm/lima/lima_sched.c                |  6 ++++--
 drivers/gpu/drm/lima/lima_sched.h                |  3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c             |  8 +++++---
 drivers/gpu/drm/nouveau/nouveau_sched.c          |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c          |  2 +-
 drivers/gpu/drm/panthor/panthor_drv.c            |  3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c            |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c          |  5 +++--
 drivers/gpu/drm/panthor/panthor_sched.h          |  3 ++-
 drivers/gpu/drm/scheduler/sched_fence.c          |  4 +++-
 drivers/gpu/drm/scheduler/sched_internal.h       |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c           |  7 +++++--
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  2 +-
 drivers/gpu/drm/v3d/v3d_submit.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                |  3 ++-
 include/drm/gpu_scheduler.h                      | 10 +++++++++-
 26 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index e04549f64d69..3e38a5f637ea 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -848,7 +848,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
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
index 82df06a72ee0..5a231b997d65 100644
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
index acb21fc8b3ce..75262ce8db27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -204,7 +204,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job)
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     u64 drm_client_id)
 {
 	if (num_ibs == 0)
 		return -EINVAL;
@@ -222,7 +223,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner,
+				  drm_client_id);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
@@ -232,7 +234,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
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
index 59b334d094fa..7564b0f21b42 100644
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
index 5e9bc0992824..5a41ee79fed6 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1073,6 +1073,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
 /**
  * pvr_queue_job_init() - Initialize queue related fields in a pvr_job object.
  * @job: The job to initialize.
+ * @drm_client_id: drm_file.client_id submitting the job
  *
  * Bind the job to a queue and allocate memory to guarantee pvr_queue_job_arm()
  * and pvr_queue_job_push() can't fail. We also make sure the context type is
@@ -1082,7 +1083,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
  *  * 0 on success, or
  *  * An error code if something failed.
  */
-int pvr_queue_job_init(struct pvr_job *job)
+int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id)
 {
 	/* Fragment jobs need at least one native fence wait on the geometry job fence. */
 	u32 min_native_dep_count = job->type == DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
@@ -1099,7 +1100,7 @@ int pvr_queue_job_init(struct pvr_job *job)
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
index 5deec673c11e..9722b847a539 100644
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
index 7934098e651b..954f4325b859 100644
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
index b87f83e94eda..d5c2c6530ed8 100644
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
index 446ec780eb4a..2af860c9068a 100644
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
index 829579c41c6b..9cd3b591f3c2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -764,6 +764,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * @credits: the number of credits this job contributes to the schedulers
  * credit limit
  * @owner: job owner for debugging
+ * @drm_client_id: &struct drm_file.client_id of the owner (used by trace
+ * events)
  *
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
@@ -784,7 +786,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner)
+		       u32 credits, void *owner,
+		       uint64_t drm_client_id)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -810,7 +813,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..09ffbdb32d76 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -35,7 +35,7 @@ drm_mock_sched_entity_new(struct kunit *test,
 	ret = drm_sched_entity_init(&entity->base,
 				    priority,
 				    &drm_sched, 1,
-				    NULL);
+				    NULL, 1);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	entity->test = test;
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
index 1a7e377d4cbb..6fe3b4c0cffb 100644
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
@@ -629,7 +636,8 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 
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

