Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81EEAC3FBB
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0874110E335;
	Mon, 26 May 2025 12:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U+MSisGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CF310E134;
 Mon, 26 May 2025 12:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXg1ffKixIo5QLCu9LdPMNufWyb0j+2ysJ3g+6LLW8IMEF1VIH72LVnSaKJ2oU27Wk6rYRea64BVTyOsI0VgWiuraPgCnu+sEuPQ8KPXYDvGXr2j8oElVKuG99uAbAd1WqAqWu3sIVPcOH0YDaBEyo8qacgrCMvR5tkivMTm/SdsY65Cg2ZqVnoDP2wqiX6xpqLyamk6YQDhm17v70I7LtLBFNdHFMuCfLFR/Z+z9lRGU+LU6wdhluZmo/mJN9JuIY6g7w7XbbiXNF1nUee41wy072/sevzinkhniTtHSHTxVseYCJmbXHMIxnruHJwTJRzRrza7dpxJFyKKBRd0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B8P1zxfJDoyoU0W3IawYc8DH8YXTlPWkpb4fSZ9TNA=;
 b=oLH/XTiqFnCu56FvOf+qnciryrf2CTTAPqNglGIq3iDsYtbbv8xzljBEkx0SRSjF52L7ZqmhVKxy8NRTgxA0T2RpF2JGMdzSVMDrF6iHckDW1wOD/gjolakB3YNdoJ5C6mKqG868VveWGv0UdALWBj0ZPBQXqn63UFdrNS90fbDc3RqdQx7f81NxzC27oyhkWhhbdH/ZdpN9D0tvpNk3lrVw33ZKkULO1euh4Whqx3yyohE/slFRzU8LVqYpv+MRLIzYWQqRkJE87vXaBFbElsch9wNoDF6GshR/TT5Xp4OqDYYwSxQT3hyU0jLMn5d5ZezdypdoumCvwDe2TfLWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B8P1zxfJDoyoU0W3IawYc8DH8YXTlPWkpb4fSZ9TNA=;
 b=U+MSisGj84SKPUI9CT14iXrTTQNrGD9tGGIv5zEqN4bWzlyQ9nukI4MhmlfmhBFtd+/h2KEyfNtxYa3aRQig/O8VmIHv7g+rUzZEcqGQW94A65GzzfboxHcdxLkHlvTn/luFCw58EuSja+HFbOzGD4oCMVKwzRMxGWZj42z5JX8=
Received: from SJ0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:a03:2c0::6)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 12:55:34 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::66) by SJ0PR13CA0001.outlook.office365.com
 (2603:10b6:a03:2c0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 12:55:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:55:30 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:22 -0500
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
Subject: [PATCH v11 00/10] Improve gpu_scheduler trace events + UAPI
Date: Mon, 26 May 2025 14:54:42 +0200
Message-ID: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 593ebef6-bda9-4046-d91f-08dd9c54986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHI1OFRDMG1hYy9xYkxmMGNDNUFxMjBSMEYxWklWMlhFeFR2bGNMWVNESUpz?=
 =?utf-8?B?aVJJNS9oem1hbGkvN3RwSjA1cnFKUUEwRkJGL0dheGpnT2xJWGN6ODgwSGpw?=
 =?utf-8?B?blViMkIxOHMxZVMxUkNscWM4a1NiaXhld3FPY3BpM2pzWnVlN2dxY2ozQm5r?=
 =?utf-8?B?Uzd1VUYrbnQ5blRudGZFU0JOUjFrMFdrUGhVeHYva1oyVGM1Ri9LVHJHUlRW?=
 =?utf-8?B?TmZhNCszNTJjdmJtOWZyUWNCRlpKa1EvVlNDaGdKeGVkdFB4N09tOVh4REhP?=
 =?utf-8?B?a1hRMnc2Z1BWT2NVYlZ1Wm9rOHZ2M2tkeHcyRmlkVGJ1SnQvalZDaWZXWGR5?=
 =?utf-8?B?K2dRNmV0TFZsWkRTVU82VE5TSzg2enJyYmQwT0RiSTd4bFE1TFJQdTBvd21I?=
 =?utf-8?B?alg2WHVPS0Z2cDkvVFYyT0d3Q0NzNThFU1F3MHZYN2lVNVp0T1kvSzcxOHhU?=
 =?utf-8?B?SEZqTmdrQndxWk80UmxHR1czWnBBTUxGLzA4bzk0K0FLbjNqL0xmYWhQVExI?=
 =?utf-8?B?c3ZYVEtlQ29WNUloTHJvUTlsRFVWUlVpbVBlNnA5MDd3VTVZblhkcTdoRCta?=
 =?utf-8?B?Ump0dnA0UUV2dTBIamJEV0Q0QmthM1VKSEFaZUpjQVpVaXcya3pQNkZWSDU0?=
 =?utf-8?B?RTJtWCswRUJ6bmdrZDRGVGUrWkswWC9PRzJnSHhXbnpkc3ZKT3FkZkpxTDk1?=
 =?utf-8?B?R3BFZ3dYdC9hRktiUWRhU0pydzJXcFpiUzBoblluRVEwS0dRSG5sZDdEeG1S?=
 =?utf-8?B?THVjSFBpL2Fid1RrRDd3dDR2Ry8vbWlRUzh1NUtYbW9veFpjZW5TZXZIZVV1?=
 =?utf-8?B?ZkhkUUNqclFza0pGUG5OTHYxV1UrTFpOV2VUVFpPU25ZQzZHcmUrQnZlOUcr?=
 =?utf-8?B?Wk5sNDFrR2RWdnhuVmRmeTB4NkxDYnk5UVlHckRCdE5oYVRsekhjQUVQQzVp?=
 =?utf-8?B?NFErTTNWendyL0U4aDNKK0JuVVAydkJGZTBNZGp3cFZwcERmTFdoR1ZIbUF3?=
 =?utf-8?B?S1lLUHJNTEpFeHpORG5ka1NEeWxiNU1wanU1dHdJYTBBUUEwK2ZjSHljQXMx?=
 =?utf-8?B?RVVUZW8zZ25HNzNzTlF5amM4c3U2aSt4b05vTXhNS0ltRkVyM3dSS2crdWo2?=
 =?utf-8?B?VzBUKzNYVFpUOVR0SDNVbE5qc1FpbzVscVBZZnE1L0tJSUlDa3RaTlBDWlEw?=
 =?utf-8?B?VWhRaVBqLzZlMk5ZcTJRUDA0M21HelJqL1BxQko3V2FscWVJL2dPaXVraTQy?=
 =?utf-8?B?Qk5sOWRyTGJ3QWZKU3oveVM0Sk93K2JxS1Z3eFAvQ3YvYmdtd1J1MTc0NFVv?=
 =?utf-8?B?bGlrL0k0ME1SOW93MHlubFVDSXNCOHVpQkNvcjRTWlAzQmFCREVxWkI3V3JP?=
 =?utf-8?B?d0Z0R0RlWnZTcTdQT0VUamZyMTNwR2ZZODV2MU1qOVpzcnVCeXVST1NWbFdY?=
 =?utf-8?B?TlA2cGh0NHVLNzR6Y3FHYjB5YklFRmRudVNmL2psR2VnVU1ndjNnMnlmYTZJ?=
 =?utf-8?B?dHR3R2lhVEdabkZRUUtVR2NpQTkwYjNlZ05uTFE5Y09acjBqNjB2Y0d3eVlI?=
 =?utf-8?B?cHlCSUtDall6RDlab082WitCMHdTY2JWNGdzcjB1OERSaGNFRFJTTnEyQ1Bo?=
 =?utf-8?B?MTd3VzNzUnhXSVV0dXhiZ0dseXIwNlRqMElCY3cyVnpqRklEdzJoZkZEb2RT?=
 =?utf-8?B?Z3pjUUVYcy9oQ29VM0Y3ek5QdTgwZDlEQzBMd0l0R0crNlE3ZEVhUGhOVTNy?=
 =?utf-8?B?UE9LRlEzOHA0Q1lxYlVsRU9sbDhzNGxwRHJrZTdDajI4V2pHSWhtUkc0QnVD?=
 =?utf-8?B?OExQd3BDaWNFekdNQi9JTjdqQmlkTzdRczZhNlNnUHUrdytqR2kwdk1nc2U5?=
 =?utf-8?B?VVNWSWIwUHJhczBCTU8zd0tqL3BDRXRLVm1oSVQxVTcrSk93ckpXcDNvcEJ1?=
 =?utf-8?B?MlFEY1N0WWhibDBTcGlON2M1YWM5OEhBOXF1U2RnN2FTbjlZRnUwUitVamY2?=
 =?utf-8?B?NFFHSGdWWEFnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:55:30.3756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593ebef6-bda9-4046-d91f-08dd9c54986d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
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

Changes since v10:
* fixed 2 errors reported by kernel test robot
* rebased on drm-misc-next

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
 drivers/gpu/drm/lima/lima_trace.h             |   6 +-
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
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |   3 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  13 ++-
 32 files changed, 191 insertions(+), 101 deletions(-)

-- 
2.43.0

