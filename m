Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F2ABF9D6
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422510E962;
	Wed, 21 May 2025 15:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vCFnANwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648210E80F;
 Wed, 21 May 2025 15:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIQf42pqK0O5KesoWLgYck2mjtStAwn8CRFkIt6fTLE69vpIHASZUxKpMFzAJWXdKru3AsgLeLITYttatjY02V7FMXjKqynEg1VyI3F5EvmeRJkdkjlmgpP3EsM5BbsI8ED96Lc1JwHDXujtN436J3wuND1P20eWOoTAjJk8OLpUS2kVUpjIWr11x1EBmrcKveFbi28ZIJIb2yHb8aS8xCaBTKj6tufpXRb9ZcuASV6eFfhZop8y4a1LAf3cKmk/A0uKQY5BJkDajbYiJhLTOxTR5qrYfCh7SyU+B6OO3P3geI5Z209gLC0OQD504XeJTC9VWJmfF7vdGM4ZFOKXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1b89WLcsFg8CSvbQz6tPUPNbJWiERNve+JswxAVQVw=;
 b=NzPU6cNKtwNol5nvXBo9J6yhpEoEE/k861IpbyDaBnxB2WD6Bvi7k7Zl3BJtUiVsDxfXt4JzScIubgwGLAXaNk3xy78MzIL/f7N8Y8Ck4Vd2mNsMoWtcQ3CsLGW/aWcntYLIkgPYHZn1ZLuf6bolVc1fada5T6kRDPffBO3TL+cev00bZ60WqZoRWP/FDh4LQGc8zo5pjKmLjIMzH06xjN7VM0R8kKv0kV208uK2PK7Ebf2Dq10tEFpIVc/O7TFTqdHaZ3lCY80ZzyB6MnS941kLQ6sERZBROgr3RD4ZdgyPcgQpfsb8JKgRuOlgNK0IBDDPGDpojmFRIMxeT2dxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1b89WLcsFg8CSvbQz6tPUPNbJWiERNve+JswxAVQVw=;
 b=vCFnANwxMRDeL5OHh/drEEzEqsTrl9pVaqpmWVwwPW/aCWq8F3ePbcdW+IQlf7mUglPtdDf8AF7YK9zLo1mJgSna1ILIrn1rUO84zELN1fIccOFhKLRAkg5Ol3NGhK1ChzLBhofWXJYSkkg9W3XN2SlVzE+AQPb8Tgzbwjk73nQ=
Received: from BYAPR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:74::17)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 15:45:58 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::bc) by BYAPR05CA0040.outlook.office365.com
 (2603:10b6:a03:74::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:45:57 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:45:50 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Alex Deucher
 <alexander.deucher@amd.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Frank Binns" <frank.binns@imgtec.com>, Jonathan Corbet <corbet@lwn.net>,
 Liviu Dudau <liviu.dudau@arm.com>, Lizhi Hou <lizhi.hou@amd.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lyude Paul <lyude@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matt Coster <matt.coster@imgtec.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Min Ma <min.ma@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Philipp Stanner <phasta@kernel.org>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Rob Herring
 <robh@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona@ffwll.ch>, Steven Price <steven.price@arm.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <lima@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v10 00/10] Improve gpu_scheduler trace events + UAPI
Date: Wed, 21 May 2025 17:45:02 +0200
Message-ID: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4978cc-11d2-4c80-7b45-08dd987e945c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFllR0tJWVpNTFZwNm4vMDhXejBPYmZLazE4MmxKWDFUN0EyejhDNndnOHpq?=
 =?utf-8?B?d0VOY3gzdENzbmczUUdnbkQyVURQYytPVjRhaSs2S05jUHZLQUFDNXIyeWRi?=
 =?utf-8?B?LzMxZmQxc2ZkZDVSVmU4MTB4ZEYra0J6cGtlRHBIZ05uMnVvQ3NpUXVmd0oz?=
 =?utf-8?B?aDlPSkRrdm84TG0yR0JXZU4yL01LdGRyVDVERWZSUGpUQnhwRGEyVHUyV0tr?=
 =?utf-8?B?T1A3ZzVtWG1NcHVLRHlYVzRIU3M4OGhqckVmYzlCci9aVThMajUzVGpnTkND?=
 =?utf-8?B?bnk1dDhFRXB2aGxpcm0rMmNlYnEvS1c3dmVlQTRic2VJaUhQZEpIMWIvN01l?=
 =?utf-8?B?MlF6STZrdkRzZk1iR3g0QXFXZkV1UnhaTTh4Q043dWEwaEd3Vmx5ZU1TaUVQ?=
 =?utf-8?B?MXBUU0pvT1ZqNmNWMzZlZmhUYXdaYmRuSkQwTUxMY3ptVENyWS8ybHRwYjdM?=
 =?utf-8?B?R3FwWE96TDJXVFVaeEtzeHIzVVJSNG1FbnNjUzVhYWZkTTRwVEJVNWFoazlx?=
 =?utf-8?B?Rm9UWG81VlpoUFpMbmZqT00zSjJCNnBuMEl2VTFxVXZmNjFxTUIvUjk0cTFt?=
 =?utf-8?B?YWU1Um9TZXB5VzJyclkrekFZTU5Rb0pNT0FTd1dTTCtpSjJnNlFta0JSanYx?=
 =?utf-8?B?NkJlcXkzQk5ERzFwT2xrQ1haQ2QyV3hmbnhaRlU3MDhCTFp3cm0vYjYvWEp5?=
 =?utf-8?B?bGtIaE9PZndlWk1mUzJKOGYreng2Y2t3U3hEeVNtYStuSlFabUwzaTliSUM3?=
 =?utf-8?B?VnRSWTZuamZkUzM3Y2hwTTVjakZBUUlZckRabkVMWjV5VVBZMi9FTjNOUG16?=
 =?utf-8?B?a2c3RUV5WHpmRExzelprT1ZmWDBjTk9BYmF0d0lmMVpCSlUzV25qNm44dEFl?=
 =?utf-8?B?NEJXazZjcExOaEROazF1WS85SVpjUEVSYUIvWk9oVG92RExKa0krWHg5bWhD?=
 =?utf-8?B?SUxXQmx6TEhCb2loend2Y1JKbkhUR1IrM0gxMFA0c0IwMzJuM1JhMGE5MGF6?=
 =?utf-8?B?U0x6bEtueE9MSSs3NG5pMGJZZlJRSjNrZnpwKytxT3J2MTd3L3M2dWlJMzhQ?=
 =?utf-8?B?Ryt4ODRKSzYrbEh5LzNjM3MvSy8wbGNuNkt6Z2lrTklJb1BxMDAyTXlsdlA3?=
 =?utf-8?B?OEdGZ05DWVBQY21ZNFo5SFZWRUFYKzY2RThSc1BVdFJzVFpTVTNMN1E0dDhm?=
 =?utf-8?B?NmRTNmdjVzRTWWJmbnUyU2NJVkh5ZVZYaTdaOFZpeFc4cHFpeCtMM1lDR2xQ?=
 =?utf-8?B?SUVuTFdMS3RmYlpDbytidXdnS2JROTdienVKeUJJRDdFYmIydlhFTmpyK2gv?=
 =?utf-8?B?Ris4NTR1ald0bTBJNVkvOGpZaThxVStzL0YrTi8yTENpRmRHeVVTcWRHNjBn?=
 =?utf-8?B?UDVHc01aTTJSRDMxUUZXbHNyVTdORVdQNWp6TUhKYityK3JyNmMrYzFzS0ZV?=
 =?utf-8?B?c3ZGTGxKWUxQWDFSNjVhUkVLT05CNm9KcGlZaUdMU0JQSFlQSUpIWG1NekJ6?=
 =?utf-8?B?YVdsdEdMTFQ3SnQ2NXVieFEzaU5oaW82Nm81WmdSRnJnYkNhVDU0ck5tWEN0?=
 =?utf-8?B?UHRPYzZFblJjTmhaOFNHSndIRnlmdnZ6dHpwMW8xV1gvNlRJaVFJWGhYcyt2?=
 =?utf-8?B?UG16akZqdzAvZENGVkhmanY1NEpEZ1o3RG1Gb2tVUktlbGJoM1lEbGlHQ1F5?=
 =?utf-8?B?R3AzQVVVYVFEK2p5ZVdBOWRzbGlKemNERG8rUEtncTlCR01OOWczM3pXRjFn?=
 =?utf-8?B?dnlMZzgvL202a0dOdC93VTRFdi9sUUxNbklENW9XdDgzOUVTMVp4U0txNTJ6?=
 =?utf-8?B?S3pVb09rSE1QL01JaEZzS0hCNTBYRXh3czVJamJRYW9TUEJ0SVN0RnF3b1B0?=
 =?utf-8?B?cUU1Mno3NkVmeVdScnVPd0FSYzJXeGhkV3RLUlIyTENjT3hrYUp1ZVBVakc4?=
 =?utf-8?B?Q3RpYXlOaDJ5eHZGV09USml1SW1vUnlwN2d4UEpyUWUxNC9aSnU0cXNQdjE4?=
 =?utf-8?B?cFVuZkNZTThRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:45:57.7610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4978cc-11d2-4c80-7b45-08dd987e945c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800
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

Hi,

The initial goal of this series was to improve the drm and amdgpu
trace events to be able to expose more of the inner workings of
the scheduler and drivers to developers via tools.

Then, the series evolved to become focused only on gpu_scheduler.
The changes around vblank events will be part of a different
series, as well as the amdgpu ones.

Moreover Sima suggested to make some trace events stable uAPI,
so tools can rely on them long term.

The first patches extend and cleanup the gpu scheduler events,
then add a documentation entry in drm-uapi.rst.

The last 2 patches are new in v8. One is based on a suggestion
from Tvrtko and gets rid of drm_sched_job::id. The other is a
cleanup of amdgpu trace events to use the fence=%llu:%llu format.

The drm_sched_job patches don't affect gpuvis which has code to parse
the gpu_scheduler events but these events are not enabled.

Changes since v9:
* fixed documentation link syntax
* fixed typos in commit messages
* spelled out that these events cannot be used before
  drm_sched_job_arm has been called

Changes since v8:
* swapped patches 8 & 9
* rebased on drm-next

Changes since v7:
* uint64_t -> u64
* reworked dependencies tracing (Tvrtko)
* use common name prefix for all events (Tvrtko)
* dropped drm_sched_job::id (Tvrtko)

Useful links:
- userspace tool using the updated events:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
- v8:
https://lists.freedesktop.org/archives/dri-devel/2025-March/496781.html

Pierre-Eric Pelloux-Prayer (10):
  drm/debugfs: Output client_id in in drm_clients_info
  drm/sched: Store the drm client_id in drm_sched_fence
  drm/sched: Add device name to the drm_sched_process_job event
  drm/sched: Cleanup gpu_scheduler trace events
  drm/sched: Trace dependencies for GPU jobs
  drm/sched: Add the drm_client_id to the drm_sched_run/exec_job events
  drm/sched: Cleanup event names
  drm: Get rid of drm_sched_job.id
  drm/doc: Document some tracepoints as uAPI
  drm/amdgpu: update trace format to match gpu_scheduler_trace

 Documentation/gpu/drm-uapi.rst                |  19 ++++
 drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  32 ++----
 drivers/gpu/drm/drm_debugfs.c                 |  10 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
 drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
 drivers/gpu/drm/imagination/pvr_queue.c       |   5 +-
 drivers/gpu/drm/imagination/pvr_queue.h       |   2 +-
 drivers/gpu/drm/lima/lima_gem.c               |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   6 +-
 drivers/gpu/drm/lima/lima_sched.h             |   3 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 drivers/gpu/drm/panthor/panthor_drv.c         |   3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |   5 +-
 drivers/gpu/drm/panthor/panthor_sched.h       |   3 +-
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 103 +++++++++++++-----
 drivers/gpu/drm/scheduler/sched_entity.c      |  16 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
 drivers/gpu/drm/scheduler/sched_internal.h    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  12 +-
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |   2 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  13 ++-
 31 files changed, 188 insertions(+), 97 deletions(-)

-- 
2.43.0

