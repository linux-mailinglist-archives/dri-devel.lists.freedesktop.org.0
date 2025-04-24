Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C254A9A65C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5097B10E76B;
	Thu, 24 Apr 2025 08:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k/CrjkOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D110E76B;
 Thu, 24 Apr 2025 08:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGJs90zMc1bACi2eGEiV0VbNAckeQz6pjDU5JLIBu+ZgTY7FWz0Xcz9sX3F53AyZq9uAgSwIpE+fYYXN3CMsS8nUj9CIKgcfprPoVO1jmXLyRmvZuRhBS7ilqK4sdj8nsNYz/xPak+j55Ea0D3vZhhuRrNA8NuzQCMc0hpdNsaLHR8bj/ub/pzxMiAv+F5UroL91d/cHFRyORnsg/qIA+DYdas9/e+ejB5HoM55Sc7BGSfrffA9NgWSwEplkQjgA2LwFFrkR5+5qFGJVLkqSfpWWkyKH5IZthFdgcaZSwDOVXldRMdZCSIQ0WH79HJpLf3oKMJmWcLDzKAzcfII1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tSD/J5biPvWWJwRdEfa6+ZRmIYWhZ7uE7oXnoFb3No=;
 b=UEVYpA8rThNMzqotdfDWnsfV3sMXAZ+H3aTjsa5VB2ZimgOedKi+aI+feErDrCJR1Mb5DuB3YkjWl7F0DJICYEijC08HKHHJiFmjHZ2Ow1H+Qxq472yRmHXBUeOGhyyrHWDDl5s+QQJAAJjC2FCQUXevhdPy0lKS1TT6xfOZkuzphWGdNBkVb6AFoaCcrq/JRSaUykKdyIj97x2bpnXaUhakT9StBNV1U+nJlzZ9C+NGEy0vSTZ47kF68LN8yW/X4YgnwBdvD/KZ20sg7jpzudE1VIamvZsAJaGsIwztRTxRcU97Z1u3O7267Aai1hQCjmHLM7MyWZhYPaEAAP+UYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tSD/J5biPvWWJwRdEfa6+ZRmIYWhZ7uE7oXnoFb3No=;
 b=k/CrjkOu73xtGphmNM2f/nyjLinzWsGsQR/aSCLuJ7R8gsWUYWGqJCQTaFD/LQ82pZF5y4rhBOE5v/Ee5h2um8sxm0Epn1O4euLhS19lKWVE8kSTt1mzZ3UFC+qzdlCA8aPFOW/5QCYNoR+JsvzXAjIXKWZRaMZ887y9L8vd2UI=
Received: from DS7PR03CA0360.namprd03.prod.outlook.com (2603:10b6:8:55::33) by
 DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Thu, 24 Apr 2025 08:39:40 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::91) by DS7PR03CA0360.outlook.office365.com
 (2603:10b6:8:55::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 08:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:39:39 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:39:29 -0500
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
Subject: [PATCH v9 00/10] Improve gpu_scheduler trace events + UAPI
Date: Thu, 24 Apr 2025 10:38:12 +0200
Message-ID: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 54712985-a53a-442f-999f-08dd830b8d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VE1QUnduWlMvMStxUzZqSWhneHVXRFlCczFJM3ZwSmhPYkNrZEZiMG9adE5D?=
 =?utf-8?B?Mnc3dlhldFNNRk9ma3JRWlZ1Y0tMQWhzMjdzamhmV0Zld21BMVdZZHJKWjZU?=
 =?utf-8?B?RkFoL1NJYTJLQkJ1Mm1FVitQR2E4blVsSWpkQTcySjQrQTZaZ01tVzAwKzFm?=
 =?utf-8?B?Z1lKdjJvRm9JU0hIaVYvTENiVTFaOEhHQ3VWOFZhZWFMemlEbGRVMk4vQ3E4?=
 =?utf-8?B?RjMrWGNXRDJkb1pNWmttWFA1RDBYUFJ0ZkE4OWI0TFZ2ZzF2L0hPa2djUWxC?=
 =?utf-8?B?cHpEa2VHVUlpbkpiaFdvZ252aFVaeGc3cUppWHVrKytVbUMyWVQvRXV0WDFO?=
 =?utf-8?B?Z2ZQYzk2OElkQnhINlBya2d5OE1KUUJSYnZMWGRpQkIvYmlWOFlCOENFamFM?=
 =?utf-8?B?SmNQNnVMN0xUMG1BQkQrellhS28vTFN6VFBvTlhLMjFYR1I3aEZ6K2cxTTdW?=
 =?utf-8?B?bFcvcFZFUmIwejVtVUVDOGdTYng5RW14YmJrcXZGL3hwbW9EL1M0M3JWVFZ5?=
 =?utf-8?B?N3diVGErRzh3V0hJZDJoMXpMWVRTWSttZ0ZWYmVGQ3drY2RXZjRqakhoTGV0?=
 =?utf-8?B?ZnowY1JYQW9DVGF5ZWJOTkV1b0RzeE8xRWZIUnRnam5XTnFqYjVYZG9PQ2lh?=
 =?utf-8?B?WmpvS2phbEpyRzlaOUJvNFV4S2Y2Z3dLb2tENFFiNUdPQlJZWjZWRFprZjdi?=
 =?utf-8?B?Q2J4OGJnQlVLUk1CY2hVTjc2eGU0cE5aREQxOXhMRXBmTXRUcTdEbTJrTm9Y?=
 =?utf-8?B?NlF3Q2N1dDB4NTMzNWVTaE1DTzI5ZStWWXg2WnhYMmRWYnpqNmJqNmJOZWVa?=
 =?utf-8?B?eWFIWGpHUFNYS1A4dWMvTS90SzZpNUMrL21Vb2hwVTlHVVNMV3lUMG5RZW5Y?=
 =?utf-8?B?UjBKRG9HNkY2dFk1bXo4SEJjd0dnNytZNTYreVR4Q3VMSS9BMnNHQnlER1hk?=
 =?utf-8?B?NEZ4dVRMKy9TWGd6VjA4N0dTOWs3eUc3OCtvUEFpY1puMmFPZUtjYmh4YlBE?=
 =?utf-8?B?VmpiWWhVR3RQSUVncmYvTW5sVThQZEt0OEVnN1o4ZGgzenBiSXhSWGh2TGxO?=
 =?utf-8?B?SUZzNmRWZ2YwbGhUaERIeGlmVGhDRE94MFhXRFF4dE50UUVYcEQ1TXNjL0d3?=
 =?utf-8?B?SmNaT3VROGVVRTQxTHZaRWhiV0V5SzJKRDFxRXlqUllnN0NNb1Z3RzJJQzZu?=
 =?utf-8?B?eVFrdjJQK3RsNkY4RXhSNjEzbWVmK1docWxzbngrTVdoNnpVaEJRMEw4Y0VZ?=
 =?utf-8?B?UXZWUWdzUDZKS1BoU00rcFcrSWVLODlkZTd2NXVWVU51Um4wQnFaU0RpUnM0?=
 =?utf-8?B?Q000d0NBZDF3cm9FalZYeXlWUnFFTlBBYnRRNlEvQ0dMeWZ1TzJ5a0JJS2U1?=
 =?utf-8?B?RUU1RmFVTHQyaEVBUkNaMk1ra2hJcGdrSUdFbDJ6SSt3RC9aaUZDTFE4cUVY?=
 =?utf-8?B?U0xGTkdhc0grYXhqeEF2TDdpT3FlZ2hqc2tKVmxOLzlFRVRVVS8xMFZ6QnFH?=
 =?utf-8?B?NGRodE9ITy9ZT3VkdHdIVXNNN2Y0VHVtZmVBQzJmOURoV0pqSjZvaEQzK1By?=
 =?utf-8?B?QVFmZEgyRWFGdGlON2R0STRxQ0lSNjU0bE1LMFRrS1VKSWMwZG1pK2NnZjlJ?=
 =?utf-8?B?S0IrUnRzVHVBM2ZSNU9BU2tnb0RpRXZuQ1hKeG9pSkIza0dJYUh0M1lyRzYy?=
 =?utf-8?B?dTlMaWtERFpNSis2QlBRQmxzdUNQNUkvOWE4Wkp3TFgzMkNITUp2SnFQbXhV?=
 =?utf-8?B?Y3BJVy9qTU1lbzdoSi82dVhiMnB0QXhqUzUyVlJUa1I0WU80aDBld2dNaGlC?=
 =?utf-8?B?UmNxR2pFZit4dHhPeXRSb2FVeHVKdXdTWE1kYUdmdzZWZHZWSFdzdDBUOC9k?=
 =?utf-8?B?QVlYd08xSlBzZmpJUTZWcUErTk1XcVNaWlZyVC9nK3FoWndra1U2Q3lpdkJm?=
 =?utf-8?B?Y2wwZzBUY1Q5U1dYa1FMckNNV1ZHbkR3dFNWOGVMcGJkU2gxa1RPRW5HcmE5?=
 =?utf-8?B?OVJVMDNYWWt3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:39:39.9052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54712985-a53a-442f-999f-08dd830b8d94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
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
  drm/debugfs: output client_id in in drm_clients_info
  drm/sched: store the drm client_id in drm_sched_fence
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs
  drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
  drm/sched: cleanup event names
  drm: get rid of drm_sched_job::id
  drm/doc: document some tracepoints as uAPI
  drm/amdgpu: update trace format to match gpu_scheduler_trace

 Documentation/gpu/drm-uapi.rst                |  19 ++++
 drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  32 +++---
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
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 100 +++++++++++++-----
 drivers/gpu/drm/scheduler/sched_entity.c      |  16 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
 drivers/gpu/drm/scheduler/sched_internal.h    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  11 +-
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |   2 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  13 ++-
 31 files changed, 184 insertions(+), 97 deletions(-)

-- 
2.43.0

