Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025179C86BB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398A10E7C9;
	Thu, 14 Nov 2024 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mPlmNzcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FD710E7C9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPPsRfzWN5PziSkJAA5HVbQ4qsIulTF6vybVFqRvOUGsY1swQuhl7YnTMo3dmu2jQrtXC9GS2wn5gZGZecQb7hWXM91U6CqHEUhwXeimQdJuIKtJGnaPb2zdw2xD32geUcjHhzP3rDUgyA9sKdrulroWJ/7+1It5C+FoDwlgXY2OekhCJhaw8nwqn6nt9svK67MnpcRXowe85Tnjpogptxt/CigCm4V9aFhxPRHX5Xu1wX2m0XOUNR2O/nDieqzKyhjq7+0iq1Mlx+0J1tHyMdozkCiYGCajZ9tP93Oxt+tlxbKpWD5NMHy7ySB8VeRZhQnjNJy6rVXqJnRLhN88aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjzXDpxYOqIvLecheoRvT7gV4zYnqS5q+qGXgJoODPw=;
 b=PP/e60Ln0AR0gShQlwJdV1W39VAwbzLJat0MObgilqZSqVsrb18rVhagBbXi99biGLGR22fBb3l/f1Sod8YO/8Y4gc2H9JocDj/QdOMOVqz2JAGGKr/V4NSJsA1Rqm1gmmbPu51BEq74TQAYFrgueCXPIKcPsNKocTg8XbiW8jrqNCebuJU/HA8V3ikNcs8Udhu3LveJPt/CfCnPhZ1pUNS6hsWa3d7rLCP3pkyUhBclVU2zhX/D1DFiF/ptf9Zhc/MFWpCZSnxPd91k0sDMoBv109PCW+WVkoEzrI5h701ZDIM4pONz/hjRkeHKU+mFty9DVSSKCvtIWwyoBnH/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjzXDpxYOqIvLecheoRvT7gV4zYnqS5q+qGXgJoODPw=;
 b=mPlmNzcM/k7wfxnF/aqUjN12XSh6/DHkd9tcMo5pUzd3UArFZkfgaKgTXtctlmImvjfst2c1HodYn2x2+vY8BJlnEuOYeccVj4CehDN6Vy/M0N6Ul+NMnFqesS8/86McizluN489rxHt93TKuMGX8Ri4JWDAphXsJXGL63vMyYM=
Received: from SA9PR03CA0010.namprd03.prod.outlook.com (2603:10b6:806:20::15)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 14 Nov
 2024 10:01:38 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::4) by SA9PR03CA0010.outlook.office365.com
 (2603:10b6:806:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 10:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:01:38 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:01:32 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 0/7] Improve gpu_scheduler trace events + uAPI
Date: Thu, 14 Nov 2024 11:01:03 +0100
Message-ID: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f2199d-282e-46ab-6a41-08dd049354a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGYwYmxSbWhudGVvMi9pWndQQ0dicUFQbXd5OU1PbXAzT1dnUWlRUWJ3NkQ5?=
 =?utf-8?B?UkFNUEpKUERqUUpTcnZWS0tjNGh6RHVWY0ZXYjE4REo2V045RDdTN3BlY1U1?=
 =?utf-8?B?ZHA5U1RNanV5N0VJZXg4Vk1xWkFSN3AxWUlxb29UYjFmOC9DOG5tVnRKQXcw?=
 =?utf-8?B?ekFWaEhYeXNpNTBKb2VQd251RENOOFI2MkM4TlNhejVvVkwrS0F2citUS2lk?=
 =?utf-8?B?UFc0VFpjb0RMWlFSUjg5Q2ROcGtWVWpWdEc3T093K0dsUTM3aXVMVVByV0h6?=
 =?utf-8?B?cnp0eVZhQWx6c1hqNEM3b2ZRaGtRYnlFeStrNDBXMHJhdVh5VFp4cFUwWk10?=
 =?utf-8?B?empyWHhhd1NHWUFCTmNQSS94UnpwZ3c0VUQ2eEFWdVZDMTdUVW10Qk1oMHBY?=
 =?utf-8?B?bGg3aDhGYjhJS2hWaFlOTGM0citCUWVzMmVzQmNwbk9mUXQ2MVBaUjhaM3Rw?=
 =?utf-8?B?VUdsL3E3WHgvNHpIczlOdHh3bFAvZDV4c1FBRjFrdWt0RERNNEpHOG80dU4x?=
 =?utf-8?B?d0tad1B0aWpoUG9UQ3RwZ2xESkpDamFUblI1LytVUm5HQUxyR09zeERuTnVC?=
 =?utf-8?B?V1RSM0xaWmV1blVlbnozR1h1a1orcm95NWo3VVpKdTQrQ3VQSjlQVVk4S2Jo?=
 =?utf-8?B?bkFIV1dpQ29rd0NuaXI5cWdlaGIzditKNE03cDc2ZUhkWnpDQ1lSNml5UjZa?=
 =?utf-8?B?WHcwWEZjaEFiNDg1Rzd3dFBmSkJTcTIwcXozSVdZem5MRG9GdkM1eUhuQThQ?=
 =?utf-8?B?TFo0REw1NmxRNzJVR0NYaEVxcUJRNy9UWmYzWmRUWkNCY041YWhMYmt0T3Rk?=
 =?utf-8?B?cmhCU0srS1JxU0xuWXFVRi90ZGFnMWt4WnhOZkUzRktoR016eFg1N2doWEJh?=
 =?utf-8?B?NW5EUU9nTFo3azhzYkRKMElxMHMvcEtQQ1dEYkZSeTMxSktIRHAvNmQvQTFt?=
 =?utf-8?B?M256UjV6bXN1aDRvV1BBVkxxbjJGdUFpUjlpMHZUeFZlU09zWnJsRmZQSkdn?=
 =?utf-8?B?T0M1SXVKSDczajlaMVErbzhHQkRrdWF2WGFVV1IzOXBTSFhWZ0Zwa2w3NEZm?=
 =?utf-8?B?MGJ2L3pFamFYTVJTL21SbTZua0pzTEI5ODdvb3BBdUhMaTc4NmkxaFJaMHc0?=
 =?utf-8?B?YjRWbjVjaDBoVlBJenlEbk9vU0VDVFQ5YlVnd3c4OHgwNXdxUkxXeElySUY0?=
 =?utf-8?B?RS9YVXptTWV0bGdLcXlSMWR5cC9YZXNzZGhOZmwzL3ZDQ2ltYngrRUFKU21R?=
 =?utf-8?B?UW1oWUU5d21pSVlxbWdNR3hWVEJSVWlrYTRpaDB4eTllSllidjFBVlRpZVRF?=
 =?utf-8?B?MEU0R2xJWnkyTjRmNlBqaktQTnlmWVFWTTg3ZHVlZUgwR1E5UDM5NGlmV2py?=
 =?utf-8?B?ZE1uN3RuK0JSVWtlN0NUWEI0aTdFUTQ1SnN6UnA1dyt2S3dpeS9PbTJTZlBv?=
 =?utf-8?B?cEREU3kzQ2hIejRKdEhYU3ljVzVZQTlUemhoby9BK3FpcSt5VnlNbkMvazQ2?=
 =?utf-8?B?NzlyK3lQUE5LSkkvV2FIN0cwendlZHg3aDlVbUVMWU1LZFZKNUNGdHFqQTRi?=
 =?utf-8?B?bHRscU9WSEZsRGVpOURtdWd3TlNMd2RBMGhzNlJFYnpNRjVoMVRQNUszZFA4?=
 =?utf-8?B?bllmUEJJNFV0OW9YZG1IWDNSQXJ6bEZCYVp6bGxhTVc2THBrWVZlTDNxOWFK?=
 =?utf-8?B?MjYraUQ4K3ZGem5oeDhCUHNwd3l4K2hsOThOWmtNSTlKakdVVnBZeG92a0xT?=
 =?utf-8?B?Nnd2V3pub2NHbnZFUXhSRzdOVmZMZWk2WVdrNEoxanplTXhXRGtMRnpLeVJa?=
 =?utf-8?B?em9nbzUyQlBnRDFwWTlrOXYyLzJwSVNFRXhyOU9kVVZVZVpFc3RJaDZueHRi?=
 =?utf-8?Q?262ZzrRam1SHX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:01:38.2109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f2199d-282e-46ab-6a41-08dd049354a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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

The first patches extend and cleanup the gpu scheduler events.

The last one adds a documentation entry in drm-uapi.rst.

Changes since v5:
* Addressed Christian, Maíra and Lucas' comments.
* Added patch 1, 2, 6 to include drm_client_id to the events. This
  is required when a single app uses multiple fds for the same device.
* Validated that the patches don't break gpuvis

Useful links:
- userspace tool using the updated events:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
- v5:
https://lists.freedesktop.org/archives/dri-devel/2024-June/457827.html


Pierre-Eric Pelloux-Prayer (7):
  drm/debugfs: output client_id in in drm_clients_info
  drm/sched: store the drm client_id in drm_sched_fence
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs
  drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
  drm/doc: document some tracepoints as uAPI

 Documentation/gpu/drm-uapi.rst                |  19 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
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
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 121 ++++++++++++++----
 drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
 drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |   8 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  12 +-
 23 files changed, 181 insertions(+), 57 deletions(-)

-- 
2.43.0

