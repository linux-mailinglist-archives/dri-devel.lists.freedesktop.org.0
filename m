Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C4858042
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0510EB98;
	Fri, 16 Feb 2024 15:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KAPURCFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39E10EB87;
 Fri, 16 Feb 2024 15:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW+TwpH2n2+ck2NYyISYiD388NlIw9fw/6r/7+KoqqU+dWxHpn+SdfiZr02+f6oa6w8fWXcE2JuZ4hy3XUwmPGiJWesNGQUvGThycsLckPidgewNJj0mIlSijDiyVRuUxxLeg/ekUzjCUhFZxn0U2/vlrGMWf3zo4D+8pO/qkX6rkkuQM4o0EI5/N+nrMKdm1lnzigjupaoHhopJkbTnPN7MA+34xCeUFYuYe3//5CpaNeqcipDpUlKBO4/myf91kXXL1qNE1osG8qKKJJWPmOeqIktHR9fmIuFOS36T94azxcjHYaL+nSWkPx5dpbVE0VV6W0Nzt/E9WoLUg6kDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U3zV3sEGElroYDGbHO+ERJDMOuX0a4RKCfE0j5zTZY=;
 b=Bb+MqWARUtQmjeRtIjHqYMmx/msTXzCjKkGrs6CxM2NP0r/VDC/wDYbTgGsNSayLtNXLqYpQ86OD6pHzDZ9QR4SBmNPJqjgYpFLBBzZaVjbgh8UwThl8pCn0htm88LRKbdSmASS5PSRFRZbBj8/g41G6BmDOF/pb7IwSgmgRq4PRKdJXdOM0Aip4043VONHOVu1PgVJZtte+JVBK/LqrD3yth4kB3873VVqJ7IVrjs8uCrxtO+wT5x7VKrUgLdMQatbrQVdgOU6UZk5i9ByTytCD6nGNx9DGN83FCw1NgHY2wyfC/CIkUlhsEsTKi1dVBY38bVPJgsWrUcPaWsfIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6U3zV3sEGElroYDGbHO+ERJDMOuX0a4RKCfE0j5zTZY=;
 b=KAPURCFH4rRGDacY0vQp326ZICXYdv64vEGU/wSZ1pu/blKSkpUuRhniMxPO2vB4KaVA9kaTsRKVPRFKpgcBHWTUDPhRYCHiGyd253PZgbHETP6SOS2RDkJQoIJe3lBhvfTKqk2gC/Yh8aLfnxaMVXjHqgb3gr/fAS2Lr+/MPD0=
Received: from BLAPR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:36e::22)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 15:10:48 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::7d) by BLAPR05CA0016.outlook.office365.com
 (2603:10b6:208:36e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.13 via Frontend
 Transport; Fri, 16 Feb 2024 15:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:10:48 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:10:44 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 0/8] dma-fence, drm, amdgpu new trace events
Date: Fri, 16 Feb 2024 16:09:49 +0100
Message-ID: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: f07abcd6-8df3-4db7-5974-08dc2f0174e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uH84eeJoWKLI/eSsCfbp7/GsecWf1O3FUsVAwSFhkDBWF8FbLetVLFmXXpT7zDALpG9SznPyRXXifvkLWqvl6YL2VZc1GLli9C56ADWNdkDVzBmrU6bJjWYCZGPtzygxva1MZaz9J55lGwMWEMP1wTghwX/kpYz6AtIVsHj+PI8aKDllhOHnpKSCqH8ttKql6Jxer1vfJNNBCreHeeApxBiKz2FZs1i/xWDyccop3hS+t9Pi+6dDTFk/6tDmu+3e1wjN5MvmiBIAvL2Px+vNEu9OKlWw51eWJZxVUiXCJHh8jIK76iHWJz4VGD9TcD81a6pliC66V52kr0BLsmToysbq/QDnxS0EySsh5/Wc8YZ78mW18wyIhlvxM6wvAhJJhDjpOLbMpLUScO5IsqbxzQWU8J5i18Xep0FFAcwBTMCYd39Ta1MIckj6F/FANlxvQrLJQAUn4yXXjqRqZhttQWs9E3jGWeSBDawraUQRRzh4uSpIguoddZL69UUeFkZkIWxx3HhtfbNQ41tlJhXvJ9TqwjaZkHu7XhcGOvcjIoXacsfumQoZu1hbkSIq//AdmJ1milBgam1tiv5lLfyugsAnSLPbSygRrHB7aAXk4n+nKizDoI5GeMvAotFS846ba9wrHaaJHCC93J9mmVQhjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(36860700004)(186009)(46966006)(40470700004)(7696005)(966005)(70206006)(86362001)(356005)(2906002)(82740400003)(5660300002)(8676002)(70586007)(8936002)(81166007)(336012)(921011)(26005)(16526019)(478600001)(110136005)(36756003)(41300700001)(316002)(426003)(83380400001)(2616005)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:10:48.1893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f07abcd6-8df3-4db7-5974-08dc2f0174e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

This series adds new events to make it easier for tools
like gpuvis or umr to graph the GPUs, kernel and applications
activity.

UMR patches using these events can be found here:
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37

V1:
https://patchwork.kernel.org/project/linux-media/patch/20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com/

Changes from V1:
* uses trace_dma_fence_sync_to from dma-fence-chain.c
* new amdgpu events
* new drm plane commit event

Changes from V2:
* uses trace_dma_fence_used_as_dependency from drm_sched_job_add_dependency
* add devname attribute to the trace_amdgpu_sched_run_job event
* addressed review comments

Pierre-Eric Pelloux-Prayer (8):
  tracing, dma-buf: add a trace_dma_fence_sync_to event
  dma-buf/fence-chain: use trace_dma_fence_sync_to
  amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
  drm/amdgpu: add a amdgpu_bo_fill trace event
  drm/amdgpu: add a amdgpu_cs_start trace event
  drm: add drm_mode_atomic_commit event
  drm/sched: use trace_dma_fence_used_as_dependency
  drm/amdgpu: add devname to trace_amdgpu_sched_run_job

 drivers/dma-buf/dma-fence-chain.c         |  4 +++
 drivers/dma-buf/dma-fence.c               |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  |  9 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h  |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 42 ++++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 ++
 drivers/gpu/drm/drm_atomic_uapi.c         | 21 ++++++++++++
 drivers/gpu/drm/drm_trace.h               | 23 +++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c    |  4 +++
 include/trace/events/dma_fence.h          | 27 +++++++++++++++
 12 files changed, 133 insertions(+), 8 deletions(-)

-- 
2.40.1

