Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37054CC9050
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8412610E8CB;
	Wed, 17 Dec 2025 17:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SnuNeY/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC9910E8B3;
 Wed, 17 Dec 2025 17:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKk9yPSLcmiWSQKFi6f0ha62yJOx/9Azi+EFxFolaHuamvPohUT4k6LLn9vn6OooJP/NziSjb72dfwcQBclu+Px2S4NGRubEc811sHGsBuCVlaI+SzmABaNvWOjPcuOUaUOlzSvVC3RssfkpU9DioXOTElO+b9rkA0hcxSbPfVGxTJqBykljLhYTFJF3iD9f87aFu+GGz9K3nvcG9Ci/KUThG6KAf/qin1RKwCt0DBplQ2JuBa4qOa3z+cCxEkfNWzBd9epaXzxn0J/tzn0xmWhY8l04cL4jEuV8/Pfxm0q11MYmsgpCaeFzlwKUmdlW+Ft5F7NvzNY+xnzoDecyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkB8LlkyN6xWNPqIUrqlhfDWLuylY1Ltnr87wKctj18=;
 b=B/Zc+JOaXx95cfnkFDrdmKqvaCIPrURw9bygKto6XWX2uSCd4+XkHwIYbV05EHgtJAg6uNJx0pGPqKT1dDlINsGa6Wm85mJekmrPOozdbzvVlmqvBjmFPxl2Qw/ZobtzaHlXGlcRvHd2u0tzlqxmCYZCQRG6ES5js5Gm4vBvP1C9wi4F/ZQ7ZhpZM0fhO5tscRjy0/+JDG5Immb7BW6X+GF9O4W+uGfbTG2B+Zgh1LtotMf/eJJYNZkI2OKeV77x7/Kd/ywhsOul6nOCymlw69JsobTbI8HrkAjik2jNAIHm5vBSeKNw5rwU1iRLTMAE/k1+UpP5ZJJNVoahsXQ/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkB8LlkyN6xWNPqIUrqlhfDWLuylY1Ltnr87wKctj18=;
 b=SnuNeY/lq9CkPGDOcKPkrZ7j7tFNLHtiGKiSFFtIqhs5AivL052Q0s1ojk6vuCva1Vg4JZTTmrbR9V+xpAgvsr1sZaPRyvK4lOpw01cy6Qvf2pg884oZrvI0HgMbCChpegzkT+qzOX8vXz5Eg1O2PnumAVg4SDYfJjIsLl/gyKA=
Received: from BY5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:1e0::31)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:18:42 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::7c) by BY5PR03CA0021.outlook.office365.com
 (2603:10b6:a03:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 17:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 17:18:41 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 11:18:40 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.19
Date: Wed, 17 Dec 2025 12:18:21 -0500
Message-ID: <20251217171821.2033671-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c8c501-2491-4a55-d366-08de3d905328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t2HUdCvHrRrhq5RMEfrJMjCFt8jcWImlISb/S/IzwMcoWO9GjTI3bCCI1ICq?=
 =?us-ascii?Q?NX8+B2Ns78K33uAcPT7RL/Ubi8M1Srg4GAXCe11AeGU7BlmlcPM+xNKqVTWr?=
 =?us-ascii?Q?QrbLdaSERTmmd2nRsq+m1NZJwXjBPGWqIdRvRoKr4uXiFtsGPMC3reAMgPlS?=
 =?us-ascii?Q?z6VgSWOs88SdXcEztQrikjAre1BXPpn6ZhfJgvCb90rND/O9Gmvu5E2VdQNg?=
 =?us-ascii?Q?iXmLTUp03J5CZHhIiia/ehtdUfR3BIOfo7XjulMM5RY9CpyCKULgHAKgB4aR?=
 =?us-ascii?Q?5A4Q19kK+7U2RQ7Dt+5tpW7+pIom1Orv7QY15LRnyK4evuqpe1Yfzm10FcoC?=
 =?us-ascii?Q?qfFQFCx2mzcwx+bSL4bf8cdTs7PJiR3T/mDUvmMYGzUem2VixJoeTxbVjl18?=
 =?us-ascii?Q?H6sJ+EzFF/G+HcLFrYRASCgxOAQgWxGIdPHMtEVJi0DT61TpY+3InvVmPyaJ?=
 =?us-ascii?Q?XuEBSamhft/AUo3Jf/E/Rb87pOe2brWDkLgD5zuSycgobTKIG0sTiggW3DD3?=
 =?us-ascii?Q?9w9PAB818AR2wid0ej395D2qfUPJR0cs8R5JcH9LrSXQKzWECVRHbkHYezMW?=
 =?us-ascii?Q?tCAeRcpE3aytZNf9It4rMD3crmBBG1KyTwPgvN4HYv55m1Je5nDWppTe4kSp?=
 =?us-ascii?Q?igxumc28ii/4hmAUHxKN81vcJfX94nVxVCu5XPsuV2r7LLoE2ZqmNoSGgVVj?=
 =?us-ascii?Q?LDjq12+57b6kSO6SBbuyag/8nahQYJIUxVVUgdHroR9eV1lT7SOs+Ew738JH?=
 =?us-ascii?Q?vsipyVXEWibPHpNY7DP63dxHPqKIjlLa8gPeuO86zh24Z+ZPkGc1e2AjO7Ga?=
 =?us-ascii?Q?UjOQP3zK/fPcg2xNCiDONb0V5YfOe8MxQSov5HL+SKNwBzg+y9+tCZ6NSUuX?=
 =?us-ascii?Q?lAoNP+85HkLs+HITT7Y5tOKIkBL4RpXoN7zxvnl9uVjiggi9TA8o2uoFtkSN?=
 =?us-ascii?Q?zLnKyl9xh3li01Fw/CqweF9bhXvQIm7WvgtD0EnaBhjxIZ7dQD/GnGz0RR4v?=
 =?us-ascii?Q?ERIBJzU+cUHxgbDJNEc8PLbu6LHQw3dOxZ3YrrZLUVjXfZULxmiiXj0pMoxD?=
 =?us-ascii?Q?fA9Tq2ArLtqLGcKSHl2hgpc0XWFknI7Zd55/+VRNsVoaMm09GzY96sH0Sr8t?=
 =?us-ascii?Q?k3Sh8foa2AsTxLVljJfNFjBVK9akONnmorljX0zytZcfSB+vXpXpNpAorJXk?=
 =?us-ascii?Q?WhmpACjAi96298NzldRj1Eja4BvicJ7Ht51m3y8U/4DCWeyxOx4CMmtpPFej?=
 =?us-ascii?Q?vDOp6FMEmnzF2NFLKssvKLU928e10a2qYdI0GYy8IhByTlhj70a2iUpR6NSz?=
 =?us-ascii?Q?G0Qbhj7UmQ5d6VWd9pO/uFuZXRvr494VWUvd/xWZtouJ26LE2tlX8iVF9U7y?=
 =?us-ascii?Q?nLIyEtTbYaw6YvH8DaIC9o1OhhZAHzSbK9aciCYy0m33mxjhRf98hU1s9VIL?=
 =?us-ascii?Q?5LUUzns0o1bnIVT1CvXd24sB0LFoYu7D/Rz/FrAuPrKukvytyA8wI789shG+?=
 =?us-ascii?Q?5YNAa9F0jSyJFI5tVcJTpMHtGb8kh03BPrqJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:18:41.1629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c8c501-2491-4a55-d366-08de3d905328
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
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

Fixes for 6.19.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2025-12-17

for you to fetch changes up to 969faea4e9d01787c58bab4d945f7ad82dad222d:

  drm/amdkfd: Fix improper NULL termination of queue restore SMI event string (2025-12-16 14:17:32 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2025-12-17:

amdgpu:
- Fix no_console_suspend handling
- DCN 3.5.x seamless boot fixes
- DP audio fix
- Fix race in GPU recovery
- SMU 14 OD fix

amdkfd:
- Event fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix a job->pasid access race in gpu recovery

Brian Kocoloski (1):
      drm/amdkfd: Fix improper NULL termination of queue restore SMI event string

Charlene Liu (1):
      drm/amd/display: Fix DP no audio issue

Mario Limonciello (AMD) (1):
      drm/amd: Resume the device in thaw() callback when console suspend is disabled

Ray Wu (2):
      drm/amd/display: Fix scratch registers offsets for DCN35
      drm/amd/display: Fix scratch registers offsets for DCN351

mythilam (1):
      drm/amd/pm: restore SCLK settings after S0ix resume

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 10 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  8 ++---
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  8 ++---
 .../display/dc/resource/dcn351/dcn351_resource.c   |  8 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  5 +++
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 37 +++++++++++++++++++---
 8 files changed, 62 insertions(+), 21 deletions(-)
