Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE89B7E11
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22F10E065;
	Thu, 31 Oct 2024 15:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fFNG6o4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5ED10E065;
 Thu, 31 Oct 2024 15:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a49Gw/cA3KxOCDBKW9Agoa2nM2hpXVuzO2F8E1LjZ5WepCtG8GByMd9AqkScGfgYr9SVSBp/k8iCrD/swvWGNWVAOk8RKOukys3y0P00xuDObInI75eXve/qvKm3r3PWSt3GkUcRKZ2fDcTLWIaTaEvHmF2EC5MHkTjqdpMzuht8TsOASZYqx/ZAJD3mJJKPbD0Tm9GdZhNfojB04izEzCKFzbHiJx9LwFWn2ftJoPEA4HGG7w+xCg/hyKh2/4tYq9iWiQURPZBroA4dCNntvKWPXjBPxBxO6CViAZtVz59JnneqoYmNGr5YG0U4i5cyO9IQ6q2vqM6WhQB9e9W28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l2xWmxgNWaCnLmEUpOGhB3zzeFk5JPLSMjh1qT5DXQ=;
 b=teG3trpKpnlkAKZB524GP0GDVGVmtj776GWk6r419p5Gb8SfzY1CyYTlxe50mRAbNE4xZ3L4FMA6Wu6bF89zlMZb+UtjAxOteewWH9/xWODeQxEMZ0dXug+pPFswT1XHzYRvV3gp7Rs11WH88t27efeZt7l0WeotiJ0itZF5AH5xLh59O5udVFZZ0Q2COP59EQhIuMaKMdB3GEkJaHx7v5+jhMDTOOYHlpLMsqZPD6pklBAjVL79lpO9skIlEyZKB/R16wyMEH9apgTrNmAMFuCFfPko4Jl9JjiYBHZF6vsh79gzF/9zwetXrfqOqXGi2yhjAE1jHcVy0RLv4nINfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l2xWmxgNWaCnLmEUpOGhB3zzeFk5JPLSMjh1qT5DXQ=;
 b=fFNG6o4BvNyXx7h29fRPqCBmG6pvV1fFGNSj/FJDY/sc1K6idKaszid43HEL7QN9Ir7uzB8ruKY+jkGpvoaeknb5aVJnErt4emEUda0Aur4EU1FpXWraBYtYMDkaUk/JEaSs8sWxMX2ETTTu6fKAJN9pBj5/DfwchM/hNlmKU54=
Received: from SA1PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:2d3::19)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 15:15:56 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:2d3:cafe::29) by SA1PR03CA0006.outlook.office365.com
 (2603:10b6:806:2d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 15:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 15:15:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Oct
 2024 10:15:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.12
Date: Thu, 31 Oct 2024 11:15:39 -0400
Message-ID: <20241031151539.3523633-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf2286f-7000-40f8-9f45-08dcf9beeb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NJrrKwj0Y3xkGNhiSCszYsVSdQxseLONzyEZwS+79S09Io0eCJzDD8tK6SmW?=
 =?us-ascii?Q?Y3I8i85pCaIVDsPGNG1piGsGcuEDACDs+FnPN/rfChAqHPqAUXzZ+xUAPnuc?=
 =?us-ascii?Q?biIyQovsAEqtKqRrJfYoB8fT7My6SH+Ky/Ahnf6WT4dRAEVjNenOYwy68JiQ?=
 =?us-ascii?Q?RyySELGcRJT3+EJ0WxY5u/57IcX9ETC1jhWkdrb31F4jAYVBZ6ou0JjTB5qC?=
 =?us-ascii?Q?7BecN7X3JRITABM8KGaj0J8FC6JEVvG344NlXC/b+xsIA3zbUvM/BYdJ3eDV?=
 =?us-ascii?Q?jvUMeIpz5nlMIZb4FC8+bc5QD9UrKRnEVsFHiW2sga2vPQf6UcRfQqBKH07A?=
 =?us-ascii?Q?5KC5WAnF9DOp2xdByeJ+/AgDM+I5/VkOcNNXtAUclVU7T29Q1xPUTHjg2hjp?=
 =?us-ascii?Q?5I1t7TQDMGt/CEqRLW3A6rgi78oO+hqWq1EE0MQBJlXiIkUhwFtu+92l9ll4?=
 =?us-ascii?Q?Jkpg59iJq9uoHy4hW+6br86K2Vz1Hd7HiD5ur7UNzgLfxVfrWNQbcC3Cps6Q?=
 =?us-ascii?Q?+1pm/V27RNYf/Qkauji4/KIi7JvyeGDx/0qmDJwVi9VhfuZeiAPGBK2grDli?=
 =?us-ascii?Q?KoBI0TTLCglI9EWhs0obzAP95f9U2VPBxvLlbWJ/MTmY4qBfvtaws9qE6Ogy?=
 =?us-ascii?Q?Fvxs+kWumFz8Km8Xme2+sSEBgGF1PA2Qek7k/3bhiU6vy8i8cEcESuSpMuAn?=
 =?us-ascii?Q?/KQt8yRuePXwuTtx6qZ6WdAt6j87wPa/M2typI5xgl7y+Z5tm6cI/7OoIule?=
 =?us-ascii?Q?cP/ZmhpwCq/3G7zHhNHAiJFSZ56zswJhePekuxdh80GWnaUNqu02L2H1XZY8?=
 =?us-ascii?Q?M64dOaKc1wQgyxvUS+1BuFQBpkQhT5rS7Ak5zcXIgqgrO9uJcGVLZK84sTyd?=
 =?us-ascii?Q?UUKseoUujhSGY5Ef6fZNK8A+bEAFs3dy6P/YceMj/+Mg8FkeSi5y8fhXbO7J?=
 =?us-ascii?Q?x7AWHgMqJSpXS9J9/D1LZp/jjWbebsJqW40HUP17DCq5yHN2I9AVt9BbHhMD?=
 =?us-ascii?Q?ZOwoQzW7/5TFxUZOq5HwPhuZWxhnIUjnJ39zeyJJDegFwN6VPrcbi9g1jtCo?=
 =?us-ascii?Q?gMwS47vQx553CDVxpx2XXB4toK6rXHgxba7atp8/fy3Hvzy1L2e04otlzzjp?=
 =?us-ascii?Q?91JhyP6Cx4D3DpwS3c8unrJTYH5OIZoxKsO7azKpRBD5/4+3Ia8zevODOMmy?=
 =?us-ascii?Q?BAuLmLxLQ7LYr6BhwKNLD5pFZYSnXJZTRYZ5W0ZvLL4jrrTeH50UpA1PWTwa?=
 =?us-ascii?Q?MjAPPhH5B9Thr7z9QOM53xSX+mLjNDbv1gREM1thfYt7JOgaezKREMbvdND2?=
 =?us-ascii?Q?Y65bfrmlkBj57mXS86vGxqX+QMc97vhrMC/v7gltnBofMjwjPfoNXWWnPE2N?=
 =?us-ascii?Q?NQ6RtNA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 15:15:56.4969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf2286f-7000-40f8-9f45-08dcf9beeb40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
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

Fixes for 6.12.

The following changes since commit 4d95a12beba146b0ca2de59c7ce905bc0aadfd0c:

  Merge tag 'drm-xe-fixes-2024-10-24-1' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2024-10-25 16:55:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-10-31

for you to fetch changes up to 935abb86a95def8c20dbb184ce30051db168e541:

  drm/amdgpu/smu13: fix profile reporting (2024-10-28 17:19:45 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-10-31:

amdgpu:
- DCN 3.5 fix
- Vangogh SMU KASAN fix
- SMU 13 profile reporting fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu13: fix profile reporting

Ovidiu Bunea (1):
      Revert "drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35"

Tvrtko Ursulin (1):
      drm/amd/pm: Vangogh: Fix kernel memory out of bounds write

 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c    | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c     | 4 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 6 +++---
 3 files changed, 7 insertions(+), 4 deletions(-)
