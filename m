Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5C9085FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E21410E070;
	Fri, 14 Jun 2024 08:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wFB9KNzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DA010E070
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+2N4Xg01zRQejPuIJ8Ryk+zK/6AYMV09MUzKFbxM6ksFb5D0z1XO5YigcdJGsZnuTiVFky+jet57iDf4DXONJ+Hy8Ws+EEy2Kp9yMSSZQuGIaUmHW6Df8+DUFv1f4h99anvvTvBO42WMq123UHCkkJLJkJ9BKSRkKWw78cFiSYlqZJ5dGGe2CH1Sd5R9mAgtX/lNlPWcKfsJNewLi29Wlzd3AFaYgXcPUFSlzdQchvutShaqNmB5gi2fMOYbdTDfIxExyoz0TJN1ngX4BBfw73Fl+2EwxpKFceOhNXGRXb1KrEjNaXhQ1h0LmFeWPkwBj3AcIt/HK5j61lokZG/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stlOGVQqq7Rz1Q9Zv/EK7i/CakRpzIvnsdno9mv2v+0=;
 b=HGmOzVZrC352585i5/2jMBuqxLolCZxwTbJPOaq8ruJ50f+lcPe0YAfEl3wOXLoej0fC95iJJlDalu9FJiRT7akMDJwlHkWBGtDHHC8wDsAMPfBVdf0lb6ZZlC3NV2P7wlSkU69zhyQmbA6/UdmrijZXIUNExzUJETe1zLb3YOWD14z+UASt1paYpXobdRRbbzncXVsrIKxgfZlh76105lrtT25w8JxR4rmfu4AXjYymPF38rlsmuTtGTzWuqAccm4VkyQpvFp8uay0BaXxrBSC2/TRxev9nTC2qaNBD5DE1KbzIdG3epPq2hqqwdL5QSC8f/oIUjaauVlsX7+gV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stlOGVQqq7Rz1Q9Zv/EK7i/CakRpzIvnsdno9mv2v+0=;
 b=wFB9KNzCqgd4lrOoAaw2eZY5uvk4gP2jVfFfGqd7NPnsa988qCX7jyH/jdOt/lTGo8kWG7kwcoH6sPnpSlZZGYDUW3+3TMDtT5ixWzStKTPqJIVxwLb4RbfPxVZ9Fb3Qn1eyh805an51Xo3pAOamgznLwqXR+AwiuF8UQCl27Vo=
Received: from PH8PR21CA0001.namprd21.prod.outlook.com (2603:10b6:510:2ce::25)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 08:17:29 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::f0) by PH8PR21CA0001.outlook.office365.com
 (2603:10b6:510:2ce::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Fri, 14 Jun 2024 08:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 08:17:28 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 03:17:25 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 0/4] Improve gpu_scheduler trace events + uAPI
Date: Fri, 14 Jun 2024 10:16:26 +0200
Message-ID: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea7842b-1c2f-4238-b5c5-08dc8c4a6e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|7416009|82310400021|1800799019|36860700008|376009|921015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RN2YHpxhX/1fXYrpRnvZMLLR+mYw4NlOBXMnKfPjZdpRzMHJDYtE0+tPTOrY?=
 =?us-ascii?Q?JnnNCu7F6MmeRUFOV4Fe5vLqoE/+coQ7O0DEyd89e1+A/D3da5xsaktwuGM6?=
 =?us-ascii?Q?nstv7/Uo3n+EHDjLb90PmIRwzLZ7kwm2APhEXwlfGilGUzaas9E4Iyi4Tlsb?=
 =?us-ascii?Q?OG16Uy/AbQnrBQuKdis2XuZa1+VvxtFCXeasfVR3LPlyS0j/4Xa26aM+Na1L?=
 =?us-ascii?Q?p+upLFTT7VFij58emPfRqM9sq78x9nSCMyh8gW8U0ZSJi4Hxg/I59YzxfdS6?=
 =?us-ascii?Q?9MyVX9DDlHIvTI7YnQRF1qTlrz64JtC4JR5bEhy0EmkEJXmcme/StR157f28?=
 =?us-ascii?Q?jpemdnYQbfKoDu1WDBsSS938upOF8z9T+JG1BJ3/E1/YesqSwKy1x0t+5Ane?=
 =?us-ascii?Q?rG/GN/9op7YVVgZA3lSTZ+PpydrG10ASbBxB17tbGCLQoH+4Om6bOqUhd4WI?=
 =?us-ascii?Q?ByOGA59K6j+7fAxbrYZtuqbpwrOXShzv0CZBW9tRKzqtUxumUSOEfLYzbojW?=
 =?us-ascii?Q?FTUDEWEiXNrEuODAYKoMAMzhU47jrx/8/PR37mEXHtxCK0pem/1A/gm0kNLT?=
 =?us-ascii?Q?L987/DKCmVORyr44GlHXfIcXWrx0laFYeXG85I/CAeISAJlS6/mhwsASRzq7?=
 =?us-ascii?Q?A7WiLhNbSvoGmlAxOsuLn4B58i+ryZ/HhDD/N2mUMqqbQvEpLty5JMU6mmke?=
 =?us-ascii?Q?SaYlWVP1ukfF2ij9CcvC9BesfAG/HnPe6U/CzMwV/c4AWysjYIriso8k+KwB?=
 =?us-ascii?Q?OkqJyRQKY+Nzi/l8JKhGO0Zm9xHRO6s7mh+8uUwLUt8RyYNvRW21NuKyqdDD?=
 =?us-ascii?Q?XWqi1+CUwtbB65eBXPtS+tDkLqhv2rCUVm4ItxIlDEcmk0edC+S12IjR+4ps?=
 =?us-ascii?Q?MPGGooelGFO5N0uGDg/ADurXoAuFwwhawKJY6fIqv94dphaa9xcEpaxuTZAE?=
 =?us-ascii?Q?QEq7M9/fvOX0uqzEwlprsUxDfSPz6ytolRQHjy0YqMX6ic5Xp/tLXEzBr59b?=
 =?us-ascii?Q?Eyv4oaT/C94GASBks9Fb2SFnWDq1zyClu2eE27gDKz1ZQPVBQsHjOSLQUBKA?=
 =?us-ascii?Q?gmkInK+KOayjmj2f+AP3Qqe4XBo0SUWi5kxviR6ieAivjO574ymx+h0wjzmF?=
 =?us-ascii?Q?XdvUvbpiONcWWOnLqKl+0wHRbXLDw33r4wyHlRd+XqxHVHXa0QQ7NJ4XFh/2?=
 =?us-ascii?Q?/tT2rkLD6nWABH9NFYyAPOd3PIiXDv+cn3F7mZ5S1ihn/jFVu2DzzZaKeH3s?=
 =?us-ascii?Q?Gb/uWVPb3PsXCqcTlLo6ArPruvvnFsO3D1VdUXbVOtlkfDVxohfG7Vxc0ldt?=
 =?us-ascii?Q?Yk+MBlTWyIV0I+XQOgFTT/x25l8xyQfoLWzzqM8hhUHrn9JttndDch9Tz5IH?=
 =?us-ascii?Q?yRxv21UlWy0dQIM3imdJHjYvI9ug?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(7416009)(82310400021)(1800799019)(36860700008)(376009)(921015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:17:28.6624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea7842b-1c2f-4238-b5c5-08dc8c4a6e7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

So, with this v5, the first 3 patches refactor and improve the
existing gpu_scheduler events.

The last one adds a documentation entry in drm-uapi.rst.


Useful links:
- userspace tool using the updated events:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
- gpuvis ticket about this series:
https://github.com/mikesart/gpuvis/issues/87
- v4:
https://lists.freedesktop.org/archives/dri-devel/2024-June/457121.html


Pierre-Eric Pelloux-Prayer (4):
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs
  drm/doc: document some tracepoints as uAPI

 Documentation/gpu/drm-uapi.rst                |  19 +++
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 124 ++++++++++++++----
 drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
 drivers/gpu/drm/scheduler/sched_main.c        |   2 +-
 4 files changed, 126 insertions(+), 27 deletions(-)

-- 
2.40.1

