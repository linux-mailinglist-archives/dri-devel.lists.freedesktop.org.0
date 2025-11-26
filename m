Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402BC8BE94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2BB10E008;
	Wed, 26 Nov 2025 20:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BN9l9jlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012063.outbound.protection.outlook.com
 [40.107.200.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB33110E008;
 Wed, 26 Nov 2025 20:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdScFKxnU03foDR7lqkVUZbR1MiQ5nOkl9i3WlwRnsGyerPEGJHeidfDx762556jEV52MCZgb1Pk5qgJzCGrFuILblfKy9fzRe//XpQpD2EMgrZmwnEpeml4/CO25s5TZC2cwPYl+H8jHru3mAPifoPdLaJUZjIhsIK/rkFkOdarYhq1KMqgyP8pAWgpqdnuzxX3HSoimAp59G1uH6BCE/F94CBxLJmYahcG0zqO4Xnp76HIUrEmPgNzRj3VPGYm27tim/V5Ozx8kh6XntI0CNP5MG/16nlL910R4soU1poDoJ3ZtmI9tZ8cvuUlNdj2VjW4ZYqm+tmKviqhM+ePGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfLnj/QiyUx0GRkRGtE1B10zWwHc4gk8I7hs3e8odp4=;
 b=KQyH+6Xpo0cpU1twTtzNnZafE4zRg+mgc2VIQPtO4OJAfDbWT6zeGcJSoUFySNaWaOasGmKw4B9TueZ/PPPuzyYKRFIqB6v/eK9W1rvTpE2suwerxkEIUGNRAedw3PFWyclTBvbKshk5vufZQ8SW5yu14ytlw4IWxSw/Ewf+ZEv8VS1DS0ct5Yu/d9HesXheSEAP/jDcyqDQnfeIy4yDlo4O38nG93CQvfXxyaPUHdp3GAomCfHTIUrGPsF4TU6iTtrpIB3j3tUTyZzAJjmiczj2s887KEAknpWSrN4p562KcClviVyhx5+sv70QTNrqdQZk8lBbwMhTUWwNs2d5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfLnj/QiyUx0GRkRGtE1B10zWwHc4gk8I7hs3e8odp4=;
 b=BN9l9jlWrGhrmo4FslmVVnGkxW/xr3SuS59L6vbYwbN7uX9hnrD5jMhrt4ONEOQFKm6ItRUDFLMMvMrjJ+Kc0QDnhTtHOQ4Oq/4TmOifnWKOOXyeK1xKlc+oIY3jRAQ+OQZs7vIGevOod8o37sX4xoRP6ufbJZ5aQ8RdUpPXC0A=
Received: from CH2PR18CA0015.namprd18.prod.outlook.com (2603:10b6:610:4f::25)
 by IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 20:49:43 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::b2) by CH2PR18CA0015.outlook.office365.com
 (2603:10b6:610:4f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 20:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 20:49:42 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 14:49:41 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.18
Date: Wed, 26 Nov 2025 15:49:25 -0500
Message-ID: <20251126204925.3316684-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f36231d-2538-420b-8d50-08de2d2d5321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2zCujD4wkeuXt9xRgQpFCMzrjXFs8W88IO+qe/QxB2mtPfNVnl/Igd0lVKP0?=
 =?us-ascii?Q?XeD0GvUCXP1ngknPgcuGcjn8FLsG+wqaEOEOhj0HZmjDcARxU1oCUFKYH7sW?=
 =?us-ascii?Q?btfCbMtj/JVHNCq3vFUUa9NqMFul3mlfW03bRQwrN97+g6mOImTfEfgyjulA?=
 =?us-ascii?Q?5Bc/41AxAl1uVQVGSTmPYSJpHdmGgrH/caOHffebjkdA0+axFhD0Xdq6g+Nh?=
 =?us-ascii?Q?6hgfXBq4oxhcWaN3baOfUBZFCbhNrmt3UYO3843taP+Ei0MOhzaxny3hfg9n?=
 =?us-ascii?Q?pWuM3SzVx9lP+2vojSwsxuXblC1U+K28KgamAtFhAhCWoM7vAXpQQ0MaQqbf?=
 =?us-ascii?Q?EPiT5A7wDv/dkt79U5EP+MviekAJ1I1dekvjjvabYvTVAWA5X1i/rmvQCJTE?=
 =?us-ascii?Q?js4EiT5APSYHKXCGA0tq9naGNkKBHBN7c2UhtMUvuOaGr0/3G5fhz+scnIfZ?=
 =?us-ascii?Q?vOiIanFLLCZmo0yziJA3P/m6n1iuHO1VdHEKUNwSoezie/r1I1bbsuvmvYW4?=
 =?us-ascii?Q?HD4N2Jr620czvVsSIg2CgFIEB8XCQx/DL5WV4fv2FXVRf9TZKLxyKKOv6rkj?=
 =?us-ascii?Q?/pRHCo0z2DcLCq7a+M4+uIuXNV6wclCkcOdPZwftBpse1Jd35Lggg9pXPPdF?=
 =?us-ascii?Q?RxAhgPkOGdgLc0YO1J6phegjUK08QK2x4QEenXQwNToBTqCmjNiWbRM9BxkS?=
 =?us-ascii?Q?89ZBVbjRaokLoP3YFyDzrwjBUKPejfOMvGF3QzwM9lAojc8rIvPAweI2w+Ii?=
 =?us-ascii?Q?c8QFoq+KrMF9NbV271Qbzf6949I7inYBq/IKESfzCP2rwvq+lyh9Cdkez6r/?=
 =?us-ascii?Q?sU/tvTkhT7CLFCMLjzG3ZizqlbLLsV3+WQWrfxpTBHtGbEh5a3rFmT2oUAjF?=
 =?us-ascii?Q?hxweETu7xTHv0YU/lmb91qgJAj/t6+f1zzq1qpk6QqRtweJqGTmfjg/IFJv/?=
 =?us-ascii?Q?1NXTpgE8OxRcAjxnmj82Z2yX00DOQLgd0VSuvHICRiBs86sbSd8opE1Smozr?=
 =?us-ascii?Q?FgwA3S66cYcMsFTWlqHifCyTo7lBV4MgCJtzneHPR2D1ZJ81T5AiIuwfwyNk?=
 =?us-ascii?Q?HV+QYK+34BC/c2o9qf5vdGoQhv38BYSo1MjXbZ+2Nai5lcoGsVsVQXRWIUvS?=
 =?us-ascii?Q?nS5Z3Cllnxp0UnYJRmNLxkAR3rvPTegbsItnxtqKCmaaZAXFQnjyO5Xw/fvD?=
 =?us-ascii?Q?W2f0RleqZ8dQyZn9AN6p1gVv0ESAPz4iHEPVjhpLLXycJHZODXYH5zNycZCm?=
 =?us-ascii?Q?GrKodri++iz2XLswu/xDczRBVuSjrHHOWbN4ydz6oOF2fNu3PIBbbTg31Bn/?=
 =?us-ascii?Q?t0aQH7jjgaN9O0Voy0ynY0K6GW4xMqPnJCiWrIBARTaOicBD534w/uHUuDc5?=
 =?us-ascii?Q?vDY+jVltO9sKluOmqgGj3OflfVo9xEzDfDV4IE+CqmozMddlUaP39WCi6uF9?=
 =?us-ascii?Q?PRpSHMr8UZsGNGX4PZGygmavpcZQ578eABQMcZ/49ixXESZx4VGRw7G+zsGe?=
 =?us-ascii?Q?Ea5S0QHadTjljfo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:49:42.3886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f36231d-2538-420b-8d50-08de2d2d5321
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710
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

Hi Dave, Simona,

Fixes for 6.18.

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-11-26

for you to fetch changes up to 7fa666ab07ba9e08f52f357cb8e1aad753e83ac6:

  drm/amdgpu: fix cyan_skillfish2 gpu info fw handling (2025-11-26 12:34:16 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-11-26:

amdgpu:
- Unified MES fix
- HDMI fix
- Cursor fix
- Bightness fix
- EDID reading improvement
- UserQ fix
- Cyan Skillfish IP discovery fix

----------------------------------------------------------------
Alex Deucher (2):
      Revert "drm/amd/display: Move setup_stream_attribute"
      drm/amdgpu: fix cyan_skillfish2 gpu info fw handling

Alex Hung (1):
      drm/amd/display: Check NULL before accessing

Mario Limonciello (AMD) (2):
      drm/amd/display: Don't change brightness for disabled connectors
      drm/amd/display: Increase EDID read retries

Michael Chen (1):
      drm/amd/amdgpu: reserve vm invalidation engine for uni_mes

Prike Liang (1):
      drm/amdgpu: attach tlb fence to the PTs update

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c                   |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 15 +++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  8 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c           | 11 ++++++++---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c |  1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  2 --
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  2 --
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c           |  3 +++
 .../drm/amd/display/dc/virtual/virtual_stream_encoder.c   |  7 -------
 11 files changed, 36 insertions(+), 20 deletions(-)
