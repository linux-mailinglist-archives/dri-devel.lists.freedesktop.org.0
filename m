Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D1A23C9A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F610EA67;
	Fri, 31 Jan 2025 11:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dXsI0frC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5255E10EA64;
 Fri, 31 Jan 2025 11:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvZoWoYHygQu7kjhnH/0YoO8RO4s9xB4C3TH4Qy+tjIi0CtPWtsK3zud1tDRFmdVfd1v6iau0ECG4CzZ6vekUDJzKm+TJhF46Nq0NqmTrX7KwvxIJkX2bDMBQDFQDmieG2iQDfWMoc4Xxn8TGDSrUT5wI8EZ8OjjTHsyImuDso3eT65jwwEBPKO2B+Zcca2srdOGyipgdxaO9Zh168z4bJ7nG7UUfRUZxume3rnJbX1gjAokKgaiu5FcxOrhv6JpZEOo64hMwbufjV8drS7Q/LfLVs5tmvi6+62TDEKhyxu5soukvOefJexm9FODrBywl7Y9HaTzVdO2l4y8GnreLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VAGDIpQcJp40PqoDAVHv40LV5uDu0hKJbH7NwMRjaM=;
 b=iXIsCy5bjeMYnHa7ENaDSsdLgh03Nn74XAcEVPeOVlx3HPrkWqKqT5JP32j9WBDgkd2j7qNc1fGLzg4Y8lfNbzvwWh9gCZeKtrqPav28jcl6i1c5IowIW3kNI7DvmmpFULuiOeTnyMpxXTG+r7a7k85w0ZlkEGxnSVwY8oDnQiUsdW7PvKUQRVz9JzKCdvOlF0mO1sRL7mmivJwIUG6pDLS2XmCnfhmGM8cWIqPgsQCy5TYrR4/9bW8kF6hr+rLHunwzI8rdG0yANZwbX8EGqOSHwdpnVt3DBcKqVowjyvsnU9j+qTTj/gyb8sDPNmdd3k1G6ej0u3/uQWC3Hzdmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VAGDIpQcJp40PqoDAVHv40LV5uDu0hKJbH7NwMRjaM=;
 b=dXsI0frCQkDC4ecWWMF1quaC++5bdVOPn62xd73q2K1mXV0TYG7h/gxVU5Ki6+Gr3t/MFivEyKLlAV8WuwxWuBELcWYTwhk4F2iM+3Y92wrQA4nJT325DRUF7hm7Jlm0hyyX/pPnMR6LFpdMUh+o0a7Z3P8LwiutiolByAFG7JY=
Received: from BYAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:c0::22)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 11:03:46 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::de) by BYAPR05CA0009.outlook.office365.com
 (2603:10b6:a03:c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Fri,
 31 Jan 2025 11:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:03:44 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:03:40 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <lima@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 0/7] Improve gpu_scheduler trace events + uAPI
Date: Fri, 31 Jan 2025 12:02:58 +0100
Message-ID: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ffd7f7-c1b1-4227-f93a-08dd41e6ee35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STNkSExJc3FZUjFDeW5zdDQyWVV4RURITzdZcm8veVJSWmdpY2lmQ0MxR0hn?=
 =?utf-8?B?OWYwMjhBeWlvaXZkUzYzdU1FRnpic3BkUnIzZGpscG5vNWYwNUVFNEZUSHd6?=
 =?utf-8?B?enhkTVJ4N3Y3RnpSUjlFUnUrc09SWEQ2UnMraEw3MnpKSmJWNk83MC8wV3FV?=
 =?utf-8?B?QzR5dlhGRkxZdC9JbEg5RmZka0xTb3l4WmxHM3U4V0tKRFBHOE1IT1lNMUI0?=
 =?utf-8?B?Ris1OFJtQ0cwZ1kvdkVvYlB5QURjaEw3TFhLM0VKVCsraDFNaXV1dnE3cnBo?=
 =?utf-8?B?bDZhcHFSYlkybjRRSDB3ZnI3a05BanFXbjBqYlhLRGR1MUNQaGlSV0xEZzJP?=
 =?utf-8?B?TWdPSzlDbHRrVisyRXFlT0ZDTlhEZm5EZWJ5WnZ3d0RyWGpjL2k4UFY2OUhq?=
 =?utf-8?B?dTU1ZWdIUEFRTFRMRjF4TmQwWnY5Wk9oa01LcGxaUlNnelFod1FhUUtERUo0?=
 =?utf-8?B?NkFrallRcXo2UEQvdGRJTGJDZmErUndiaDhtNnBNTmpJbVVod0lVWFJ1ZUw5?=
 =?utf-8?B?clBhRWFuUmtrNVZPWFVPNEJnQUdUc1RsQ1NFcWNEVTg3S1R0ZmZyTDNMTklP?=
 =?utf-8?B?VmpuZ0d0Sk1XWnozdm5aOGhLQkI1S2ZER2ExdHpHS3hWL2VvNXZqS0VsSUg1?=
 =?utf-8?B?SEhDQ0QybXo0Sjl1YlZiSzY1TnMrMEtVME0xN0NUeVYzbEhUcncwcG5FMzFn?=
 =?utf-8?B?WjNpRGZzcHg5T1drTTNqTXBKMkc4VjgwWnRYRHhzZmhDNFZ0L3Y2aVFKek5U?=
 =?utf-8?B?OGM5WFdocEZydnF2aEdWbThxS28zK05DYVNqMUJVWFFXRHhPOGVvTXQ4V01F?=
 =?utf-8?B?ZGFmV0pWQ1F1SWxLazl3NmROdGQrSVpDVHRQTG1jU04ya0NYdGM4MEdGVzdu?=
 =?utf-8?B?NWdqckRoVE1mcUZ3NmdwK1A2TlEzTUxlQ21vaUdZYUJmQ0xGa0NqZDlLQkxs?=
 =?utf-8?B?d1BwSHliOTQrbTNJcmFMTG8rREwwMVc0MnRzUnVIelNKN2l6bUZ6RDNMTXF0?=
 =?utf-8?B?c2kwVy80R1ZVMlJzVmxBUmo4cnNiemFqYTdDLzFyUS9MckJIVUU4Y3RtcEhJ?=
 =?utf-8?B?RjFtK0s1cEJwY1JaTjZ1OFpmb0NGbWhDN3ExNjJpenZLMUZpbk5WOWd1WjdW?=
 =?utf-8?B?MGg5ZjZzaDdpVlJOMG9GazIySlV1ZjUwMXZmSWU3enZ2dzBMUXdpcFdYb2N2?=
 =?utf-8?B?TE11N2hBTHMzdVBVZ2E4WGtRQXRBcHFCQURTY1FId1R6V3FndDhwTmZOQXZK?=
 =?utf-8?B?QTRocGNoR0gwRHdnaG9TRmlLNkEzSEZFN0xUd3pKS2MyUVg0dFhPbTdHOUwz?=
 =?utf-8?B?SmI5d2ZEeWJVQTMrL2R5djVPMlZwb1hQSktYTzB0SFhIR3ByeHJueCtCL2pl?=
 =?utf-8?B?QlM3eXBBSlNBSWVFVW1jb0ZGSEZYUm9wTTdxNXlBZHp2cW0xVDVUckJBR0c5?=
 =?utf-8?B?WEVWSi9sMEhuVjhSaEUzUzhyZUlodlR6RUF1emlRR3dna2Vubkhxc0dZWTc5?=
 =?utf-8?B?UHB0d29iWmhJZGJCaEkzbHExWVVsVjBGTmJNU2JMb2EwekNVOVBud2llcHNT?=
 =?utf-8?B?aXpMQ3FkVVc1QVQzOWVtazRhcVlRNFp6VTRteGVZRStDS1NrSzJ4Q3dpWGt3?=
 =?utf-8?B?WFYwazZjaVNTdFo1WjA3M2QyVTdrVmpMb2V4NTJqNkU1S0VpSlh0YndFSERk?=
 =?utf-8?B?L1kwZmMyYkNSVWZrY1lpNGhjdWY0bVNIeCtuNW83YlloQzc1c0tTSDQrZTBK?=
 =?utf-8?B?UEpjSDNhUzFNRnB2dXhVQ1BkTml4eFFZM2I5c2VMQmxOd3NiQSttcTVwWjQ2?=
 =?utf-8?B?eGJPa1JLNTZnVm11SDI5cDJMZm84aVB3QWcvS3FrOFFxamMwWlVkVVlVOTA3?=
 =?utf-8?B?UUxMcDFDWjI4ZlIyQ3dpKzFHRFBWN1R2WmhPLzhpaytKaExwc244V3ZYcmNk?=
 =?utf-8?Q?NYDY5FrYiMI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:03:44.9557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ffd7f7-c1b1-4227-f93a-08dd41e6ee35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
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

Changes since v6:
* Addressed comments from Philipp, Tvrtko, Steven
* The commit storing drm_client_id in sched_fence adds an extra
field which looks like a duplicate of the owner field. Currently
amdgpu uses the owner field with some magic values, so we have to
have 2 separate fields for now, but ultimately one could be removed.
Similarly storing the drm_client_id in the sched_entity is not
really possible as there's nothing preventing a driver to use a
sched_entity with multiple drm_file instances.


Useful links:
- userspace tool using the updated events:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
- v6:
https://lists.freedesktop.org/archives/dri-devel/2024-November/477644.html

Pierre-Eric Pelloux-Prayer (7):
  drm/debugfs: output client_id in in drm_clients_info
  drm/sched: store the drm client_id in drm_sched_fence
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs
  drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
  drm/doc: document some tracepoints as uAPI

 Documentation/gpu/drm-uapi.rst                |  19 +++
 drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
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
 drivers/gpu/drm/panthor/panthor_drv.c         |   3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |   5 +-
 drivers/gpu/drm/panthor/panthor_sched.h       |   3 +-
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 123 ++++++++++++++----
 drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
 drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |   8 +-
 drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
 include/drm/gpu_scheduler.h                   |  12 +-
 28 files changed, 192 insertions(+), 64 deletions(-)

-- 
2.47.1

