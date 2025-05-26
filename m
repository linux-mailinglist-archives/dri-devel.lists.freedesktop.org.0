Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A40AC3FC5
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340510E35C;
	Mon, 26 May 2025 12:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGh5sjXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933810E22F;
 Mon, 26 May 2025 12:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuVUQ0tf7ZRCcBY9UDrIVdV0XnRoR6MCmTcjEWXhnYmOsasdNghJIs00fcGVdYnmDCmcJgCeSf0W8aSWEgN4rXESQ0m8Yp7ND6O96q5yOaLMxBsR5f65T/ir5jiF40xvHKmUrtsNajpTaDW4D6ylBL0ByAfy6UWL6JzQkZwFTm5jphoYZjy6CBMwBCVldpUARs/yyXHQDkFmFSiBDNXafo/ZX9KPLGtD0cV4W5+dnmdapkp77TUf2RCtzh+//HEuBZckRspXTH1/2ALt+svXaEfat5XWZw3si17DqqoMlqQQsbaA4a5ug+DxMtFfXZ4pE0fpsYCWx5syg0gqaFA0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+d2AgzstIZ3b5RLbY0TXbn/+KWnyvaZu1IZT4ws0Gg=;
 b=vHte5NkwBqD2HQuo+oLRP0IAJp/b0pb4ujAGdT6pZ9l7LmEHkmpdZWiFwPCtcc543VtZzRHaUvRq2LGOVIS0rE0sedGXevpLiO7rAzS3lNx8QryJ3Pbl9lO2xlyJafTktVro6TMm5EIOauI3bzA/lbwpOg+sGo0bG+9+mi6tay8NO92rlTB1bc+/LoIbSxcbT2W3ZROfD1hI37MUcVx9zeJ43KpWHRKFKsGzxlWQUU0c1vtdAJwb/1AYKai0Ofu9xuawsDFtJQMkFGEjlyd+o2zJlHRsfzn/NawWJCcJtat9C7qKyxoVfqb2eS3k2HGNPHXDiuPVpgRhbjpMD6wHyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+d2AgzstIZ3b5RLbY0TXbn/+KWnyvaZu1IZT4ws0Gg=;
 b=BGh5sjXDDLDgnQjfC03NjsVJiTGTN0Md4PTbgMYA9XIAOnIhFDY/hVzt4XAC7t2DVtGC/KI1YWtD/g+f+zsn4s4KQ7sCc4g7DaZ72IoMtJU1MBXmbCxK+gb0D8Gg5ZWlFM42og+bVUL69XKGalXK4PZyCG8aTlDuK+vqdJDfcYg=
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 26 May
 2025 12:55:49 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::59) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 26 May 2025 12:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:55:48 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:40 -0500
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
Subject: [PATCH v11 02/10] drm/sched: Store the drm client_id in
 drm_sched_fence
Date: Mon, 26 May 2025 14:54:44 +0200
Message-ID: <20250526125505.2360-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adbce40-c622-4f91-4d42-08dd9c54a310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE93Wm9ZNmU4cmZqSlo4MGw5Ym1zUGxjUFVZNGlEd1AyN0FzUzhDMHdndGQx?=
 =?utf-8?B?a2RSZHZMQ24zVC8venhZaVRFTEprUC9zM3Q5azhrNDFoKzVNazFMdFMrSVJ1?=
 =?utf-8?B?TldDQ2ZhODBuQnRUb0lDbVJtQ1l4SjVkdTkyZm5EUDdpbEt0d3pyOWRTVWxl?=
 =?utf-8?B?QUlOam01WGlmUmo2Mm1meGdULzNJMzFjK0Q2SDNOamdsNEVibi9aVjJZMFcy?=
 =?utf-8?B?RFZHUDdrNFBZMGE3K0VLblJJTUU2UVdSTkVGUGxVcmhZSjQrOFozMzVPY0JX?=
 =?utf-8?B?bVJJQ2VYd2hoTFBoQWFZTFVmQlMzNVdCSWRmVnMzNXNJVCtHa2ZrZ2ZIZ1hs?=
 =?utf-8?B?T3FaaGNzbldlZGlwY2luVWhmcUxad2RsQVFNem13VDlLZ0F3RThwVTMzd1h2?=
 =?utf-8?B?VDhEN3g1NENJUytjeDBCME9KNnFkbTlySlVKNXQxZEt2QmZ6MTV6RFN6Z3c5?=
 =?utf-8?B?dFlIRTFOU1pYN1Q3N3ZNQW10bzNSRGdBbWJCa0xTbWJDWCtMbzBaOTZvU0VW?=
 =?utf-8?B?Rkx5V0MxeEtrU0o4ZXV1cjZ3bWxWRVBEOTFhZi9yNzlVcE5rbjc1OVlxbjVE?=
 =?utf-8?B?aGdnU2Q0cTdLOVhYVXFqVVVkWCszdnczRUJqeUVmYUNvanpucEowNXdBV3JC?=
 =?utf-8?B?c2tzK2xVMEFjVTE0ZnV2SldweWJWQUx3bURPTkZBcjdjNWsrZkdKVWRGV09D?=
 =?utf-8?B?RnpnNHBJSWtoME9iZFF6ZHV0eGw2ZUgwRkRmT0oxU0llalZSc3orck93S0Ir?=
 =?utf-8?B?bFdPWCtTRXB5OWVxRlFNUDUrd0oxejdObWU0MzFyMFY2eEhaSS9KY1ZUSkpG?=
 =?utf-8?B?N0VFS1FCb3dhaDdKMTM5b3laYmFUVzVTVlF0MU1RS0dwR2laOTNXZDc5dUFX?=
 =?utf-8?B?ZXR2ZnRjZFhxSFhNNHhjanh1eHR3QWdJQ0JSK3RYUDJDSmIzOThtR2d4YWJG?=
 =?utf-8?B?Zmt2NG01cXN2bzRoVGVqOVhNQWtlS3k0bmk0ZzhKcUxpcFA0MWVISXNxRVJj?=
 =?utf-8?B?TnNpM1NoVFZMQmdPalJtajNycDl0REhsbDBQZjJ0akMwL3cxMkdQM1ZQSjg0?=
 =?utf-8?B?YnRQKzFXRUkxTmcxdUhyVy9pYlV2UVpiSTFmSjk4clU5WDJyMCtzMTRJN2x4?=
 =?utf-8?B?M0NETHFQQng5VnA3N2dZbW4vTE5rQlBpYnhOQTdRclF0QmtYZFgyd2h4MFZj?=
 =?utf-8?B?dk1mdjhhS0RRU0pGa0lYY2dYemtRRy9OR21yZ014ZGhyQnA2VzVWZUFYdlhp?=
 =?utf-8?B?RE1HVjJQcFhxbFNxZFNwOHBRLzJ1T1VTUzVaVURNOUpWdCtlN2IwUUtGRWdh?=
 =?utf-8?B?ZnBjU01uR0tYNEk3K2NWRmxCRXliNjYvczJKblIySnZLTks5dUpUWGpQR1RU?=
 =?utf-8?B?aUpnbVFkb29Ha29yU01UVDk0VGJJK2RJMDl1SHlIL0grUnVYWHByL1hnUWJE?=
 =?utf-8?B?QmpEc2luYlNDcjlxUGJWSnRhVVorNE96MmhPNCtxc0hRVkZvaHZXSzMrUzg4?=
 =?utf-8?B?ZFNmTHdFYTdFOU01MmZDUjdSUy9vOU8zMUVzUkRVUGZvOWcra1lTMDVhWkJz?=
 =?utf-8?B?KzlKcWNjdHVlc04wakY4M3p3Sm53bkI0K0JIWnhYV2FVb3R3enpxNnhGQlUx?=
 =?utf-8?B?Z2kwMmxyQmp4SEtMbStHd3RQTGVuRTlkZDU0azZZQUUxanE1YmVFVnpJQ2ha?=
 =?utf-8?B?YUQ1c1VETWxVUFVqdGxxSDEzY253QjIzWE45Rm1XMXZkNlF3ajRCbG9EV3RR?=
 =?utf-8?B?UDI5L0x0WXNPWHltdzdEb2VZZ3c5dm1ocGxmSVhZaGxVcVNuTmRFUnRKdG9t?=
 =?utf-8?B?b25BMHl4TzhPQ0szb1ByWVp2dWxJaTdoNkVIdDh0STVkUTFJT2RxYkhMenNR?=
 =?utf-8?B?QmNMcThTTjhjWTZDbzRoNzd2OHZ5eFhFcmF1Z3FiMHZrSUVRZ3BtL3FFOEIv?=
 =?utf-8?B?WXl0aXREekx3dHI4Rld1M2VRYWFLekwwNTlKblFoaGRJVmp1YUtIUmswN2xB?=
 =?utf-8?B?RjQ0a1RUQ2JyNHM3YUFIMk4rRUh4TTU1dzhSb3NPTjhndVhXWnBqdzBrU1dI?=
 =?utf-8?B?bGc3MHk2WWlMUUFGUGU3QzY0SkpnQk1UUUR4UT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:55:48.2158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adbce40-c622-4f91-4d42-08dd9c54a310
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B
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
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  3 ++-
 drivers/gpu/drm/v3d/v3d_submit.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                |  3 ++-
 include/drm/gpu_scheduler.h                      | 10 +++++++++-
 26 files changed, 64 insertions(+), 34 deletions(-)

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
index f1ec3b02f15a..50d8d16eace0 100644
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
index 6200cad22563..229b9190f152 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -996,7 +996,8 @@ static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
 		const struct drm_panthor_queue_submit *qsubmit = &jobs_args[i];
 		struct drm_sched_job *job;
 
-		job = panthor_job_create(pfile, args->group_handle, qsubmit);
+		job = panthor_job_create(pfile, args->group_handle, qsubmit,
+					 file->client_id);
 		if (IS_ERR(job)) {
 			ret = PTR_ERR(job);
 			goto out_cleanup_submit_ctx;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6ca9a2642a4e..4ae72b211793 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2523,7 +2523,7 @@ panthor_vm_bind_job_create(struct drm_file *file,
 	kref_init(&job->refcount);
 	job->vm = panthor_vm_get(vm);
 
-	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
+	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm, file->client_id);
 	if (ret)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 43ee57728de5..a2248f692a03 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3732,7 +3732,8 @@ struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job)
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-		   const struct drm_panthor_queue_submit *qsubmit)
+		   const struct drm_panthor_queue_submit *qsubmit,
+		   u64 drm_client_id)
 {
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_job *job;
@@ -3804,7 +3805,7 @@ panthor_job_create(struct panthor_file *pfile,
 
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
index d6239e015b66..725de257d60d 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -205,7 +205,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 EXPORT_SYMBOL(to_drm_sched_fence);
 
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner)
+					      void *owner,
+					      u64 drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
 
@@ -214,6 +215,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
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
index f7118497e47a..34252bac83b9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -766,6 +766,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * @credits: the number of credits this job contributes to the schedulers
  * credit limit
  * @owner: job owner for debugging
+ * @drm_client_id: &struct drm_file.client_id of the owner (used by trace
+ * events)
  *
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
@@ -786,7 +788,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner)
+		       u32 credits, void *owner,
+		       uint64_t drm_client_id)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -812,7 +815,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..fcddaeaa9217 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -117,7 +117,8 @@ drm_mock_sched_job_new(struct kunit *test,
 	ret = drm_sched_job_init(&job->base,
 				 &entity->base,
 				 1,
-				 NULL);
+				 NULL,
+				 1);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	job->test = test;
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
index f0a6ce610948..5921293b25db 100644
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
index d860db087ea5..1270cd82ff3e 100644
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

