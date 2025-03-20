Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C3A6A316
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F9010E5B6;
	Thu, 20 Mar 2025 09:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I0xkYI16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B77C10E5AC;
 Thu, 20 Mar 2025 09:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u45a4wujZF00zz+XE6sUV8Zt/W9HQIF/V5D1Xoaq350CdYu0+Iy6J8Uz5jJvqBEoR9DX0OIUM1haqc3PidPeq2doMy0sMM0cGjOHGbOLUUafpMBQIf/uwoyD0hZCv9PZVXFdtkuzOy7bz+uMXELhStwVV+GNxATCPiG/77vAmtvP9OaVRVXNb1xeEh+Sj03AP2wiBK3UD4xrAHZf9tkzu87z2KJodzDwKYosRg2gqeHB/0R2LTcQ0xRabAjPjSOG/v48aa+k7I4Ka/tIwkKCaAgKy5MyihjlwQ7CO3Xymeb32DTYlt5YqL4/CcGLVVDIKB5WeUKmdjbXrqoD2EBJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uySjzVi0W3/hhvNq8nPGaasAt9phfmlmdxD4j+aHs/0=;
 b=WjSQ7BMdUMonauBGdqRM+CvP24fImXwyu6bmzruonnEpVpXkFkYtcpFLhnLWssYJlhMuxLtS/1cGsaoJwlVeE7raeMTWABzYzJxJX3CgYI+kAUe1/vQPjh65/5SJ+IGGiJTPPPZ3L/bZjFaTjKMgg2DkMwnSPt9qppQE5DrazCYrsa2bDpnI1ckB1XXaidDGZRinPPfxq1sapIyNrePoxnLpbxW1DRm6mMHzNTRXvswlC6u7NJU1Ps5PQDl0HmhPFfKv/+01A5jBlCsDTPDuNcSSEqi24XTvtXhH3Wn/Y2CeHj2y2bsEFCkDiXftqitL3zibdjl7f9jIoZ5ioUoW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uySjzVi0W3/hhvNq8nPGaasAt9phfmlmdxD4j+aHs/0=;
 b=I0xkYI16vsUSsw0HD8Qd8f3Y5fOwAfBZRVGzPMUDACF6BWrW9oUlUZ3DK5yIZs6WOFBkDAnExqj4BOHPlxLYU47Qtd+G6GRRtH7hJuaEyXTkKMjLXI+WXHfsgQxgbZNmGvipz1jDzzuLaitqs57fqqIQ0V9Re58zUVP2AZoNHgg=
Received: from BL0PR0102CA0054.prod.exchangelabs.com (2603:10b6:208:25::31) by
 DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 09:59:21 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:25:cafe::31) by BL0PR0102CA0054.outlook.office365.com
 (2603:10b6:208:25::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Thu,
 20 Mar 2025 09:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:59:20 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 04:59:18 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <lima@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 00/10] Improve gpu_scheduler trace events + UAPI
Date: Thu, 20 Mar 2025 10:57:56 +0100
Message-ID: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 91573c50-aabf-4281-e7f7-08dd6795e297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0R3VFN5QzF3RXNFQWJxZ3RzK2VlN3NRQUltb1hzVFh0SGl2VmExVjdxK2J4?=
 =?utf-8?B?dldPQkc4Q1p3TlZQcE1WOFJFTWFyZDFoZWxLYm1UekZ5OFY0SE9WdkV3S3Y3?=
 =?utf-8?B?UHhwVUtLVEFkRnYyUWJOVWZoVzB2bG8rZFRENmF4Z2Z0Rjh0ZlUwcWpobEtr?=
 =?utf-8?B?MVZEQytMMjNSc3BmR3RuSlc5cnNreXhERnNOYzViMHAveURmamcvL1ZJSHBP?=
 =?utf-8?B?TllZTXozOWRDK1BXZ3MxYWZVUi9OSlFZMFh1cDhvbGFkVVZsclQvcHdxRUhp?=
 =?utf-8?B?QmttcDYzbmhwS2hNLzQwL2gyZEo3V3V5OHN2RXV2cnJWbjBHTnZac3RkNDdJ?=
 =?utf-8?B?V01DREJrZXpxME8wWWI5NDBROGswRlhQRU84RnBDa3VubE9ySHN6SU9nbjE2?=
 =?utf-8?B?T2RDTG9HeW01RngvSUhFMkMzL1hQOUZQd3BHQjJHTkt6amVTN0Z4RDJLQUhz?=
 =?utf-8?B?L1FLc3B4K2UySnpIWGsxS0pKdmxsN3RzcG5BR1VZeXFoR0hSN1ZESXRHRkpm?=
 =?utf-8?B?eXNTTGpma013alJkbnAwMmxueHFBL2RneXQyZjVxajl1S0JmYnVDVG9sZUdR?=
 =?utf-8?B?Y0RRVk5pUFBhTXVDOTdPR05rVjZEV2c2ZzRNbERHRStRQ3JIbnVQT3paczll?=
 =?utf-8?B?blN0M3laeFptVzVSbnNUanpyUXpnazFpc0V0RXoyZnUwUW5TbllJUER0ZzBW?=
 =?utf-8?B?TWJUMFh1M29rUjZtenlzUGU5YTNBUzdGR3hYeUx1SnZzOG52NkZhSWpRVVh3?=
 =?utf-8?B?T21icHAzMXpnMFlkdDN2K0VUWUlGR1laYVJmZDNLdEk0V1RwdGdaOGxvYUpk?=
 =?utf-8?B?WW9lZ2dGTVNnMjdWbE9uN281eHV2QkJ0cVBrQTJEZ1Y4dXZIZ1FUL1FKd29L?=
 =?utf-8?B?MHN0QWk2RUhCQ0lJNGp5aC9nVWFoc1kzdVhDcTJ2NndFa0MwU2VMd1FGamN1?=
 =?utf-8?B?dG1QUWNaR0dUTTlBYS9hdm5oTGZxMlNsZTIwVHhKOTgvY3l2WHlpRm5hSTEw?=
 =?utf-8?B?UGlESktTczlqQlU3VG9uQTV2a1Avb21UNXd2K0t6ZjQrWTlpeW1xZ2FDZ1JI?=
 =?utf-8?B?QTlIQTZqR24rVlJyMERtSzIrTmhHN3UyRGszclhPc0xzd1BLUHNsVUlGbFl6?=
 =?utf-8?B?VkdQOS9Cb04yY2k1Nm8xOXJWd0ZXbnZUYWloKzlhMFBGbG1qeDRXKzd1VkpK?=
 =?utf-8?B?bGJUNkhZd0doK2ZSLzhiT0dtTkg5Wk5MNEtvUzdHZlU4b0hoT3dKZ2U5U3Zl?=
 =?utf-8?B?VE9tZkJnR2REUjZ6NVkvd0ZxeFJVUkQ5eFZlNUtkZlFDaVpWOEJ4VnE2L3p1?=
 =?utf-8?B?QWQyaWczOEpvaU13N0hmZFZsaTk3dnF2Y2pZVGl6NGd0WXh4WEtrSk1LK1VO?=
 =?utf-8?B?U1V0RXoyM0IzeExhL1FGQ2NzZm1lTmRtRTFBcTVDbmpvRStBVnFoOFRNS0RC?=
 =?utf-8?B?M0cyRnBhbjZDVXBDWEpEc2UxdUM1aEt2TktwR1JzMEN2ekoxOFhlbWhoeVBZ?=
 =?utf-8?B?UVYwMUNxaE4yeTRwUmZ6K2R1cVpUaEpBa08xRjNPTWNOQ3VtTTFzSldEMEFa?=
 =?utf-8?B?UGcrYkJKYTlqRHJBbHEzR0pUZjE1QmdzbFdiZmRMd2JQMFMyVmQ2cC9Pc3Nr?=
 =?utf-8?B?TW04MFhqbGxmSWtld0JSbWdnQWQzWmJnYWRNdytGOWxOQm85dkoxSVVJSVpU?=
 =?utf-8?B?V2NoTGpPRXhUY3hhVzh6WndDbG1ieHNUSXhWSndZOE5hMDl4TEdmcDUwQ1l6?=
 =?utf-8?B?WDl4eDAxTVI2QnRiZHdYaDE2QUF5aUgzSzIxM2NmdUQzeXZGc0M1WUZIcVdG?=
 =?utf-8?B?cWV0VGp2Y0ZGMUsxLzA4RHFjRHRpREFLR0MwYlNZYkt5K2MybERqVEh0S3lY?=
 =?utf-8?B?M3ZETWpWQlFXcWYyUmRYVE5LcW1MUlJQN1dnSThrTUpMQ245Y1czNlUwRU5Q?=
 =?utf-8?Q?HxAh+1GFWA0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:59:20.5403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91573c50-aabf-4281-e7f7-08dd6795e297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
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

Changes since v7:
* uint64_t -> u64
* reworked dependencies tracing (Tvrtko)
* use common name prefix for all events (Tvrtko)
* dropped drm_sched_job::id (Tvrtko)

Useful links:
- userspace tool using the updated events:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
- v7:
https://lists.freedesktop.org/archives/dri-devel/2025-January/488117.html

Pierre-Eric Pelloux-Prayer (10):
  drm/debugfs: output client_id in in drm_clients_info
  drm/sched: store the drm client_id in drm_sched_fence
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs
  drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
  drm/sched: cleanup event names
  drm/doc: document some tracepoints as uAPI
  drm: get rid of drm_sched_job::id
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
 drivers/gpu/drm/scheduler/sched_main.c        |  11 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  13 ++-
 30 files changed, 186 insertions(+), 96 deletions(-)

-- 
2.43.0

