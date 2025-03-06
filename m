Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F108CA556D0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AB910EA76;
	Thu,  6 Mar 2025 19:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uy2HPo8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8622C10E239;
 Thu,  6 Mar 2025 19:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBntfObY0TCuhknCrbQoh90imPzJXrh+AOaj66UqGStJI+GEc1Fn+UTDUoF7WTSqUcc1YiaDSvU59XJPnf1Gq2N/vYdmNJ948s7DEtFb3NebUrxlGq26CvZH5un+RGXJlS1IQvpv+vnDRuG8IE/c+mFTzQYl1QpBt2CsEgV7fLd1f+t+h7KQs8AHEnsqsRN1HPuzWc4kTm2yHo+UrtTd+je/9FGakj5S29sM81g+c1sEW9NPKuUmMAbAoN46FU9o4O3xvoZc28Fugd6Vo5rMps3ceNthMXmzpt5nISDtqNRSrCJtDlwZZqUJ7hXFxgjI6fkt/GEkPTxc62JoYTs4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UFaxzU9MFgEfeeSp/qCcQ8FLHTHtakGoQrl34nGWZI=;
 b=y7hSqA/XT1YnWO1l2GNtDRVbXV4VUN/6JY4oFbYRp2xBIfrA0PAkL2T1RjWSpfhMm/AXVlXp1tcRQ0cRuqlvfokVciI2TNcN9qT8EnTxrFxU+FLfkjQUf3kDHDUMulISk2q7r4AwFP/19jHFJ4CUdvJNxkgciI+5rLQiU3fpRUYrYV/R2UONosd4q3GqfiKS+r2kycqbBHrbjUFGU9kmMyBnRQB51xmtrWc4N10GQyx30TpZwbsq1lZ0DwsI6ccwJMsWXgtcDfQr4KVLl/NWvtaLm3/80a97GsEg3iYT3rX6Mfd3MpL/8y/F8W2yQHUEYkOvF4lOEE5u6SevQntSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UFaxzU9MFgEfeeSp/qCcQ8FLHTHtakGoQrl34nGWZI=;
 b=Uy2HPo8Cl0fvbkZ+cmOsu3h37oTRlvhiHVabuEpHdbK8/q18lDOZbrpZpS3e+HV6kWHhV88vldReJYZYxDEU70s1LZzcppADeyroCMh01XKt6UcstPqcz+WwdwGPC1pi/UgtMaSbhILHqkJHaHuv6mYtE+gGJxf5VuezfQ2A3QY=
Received: from DS0PR17CA0008.namprd17.prod.outlook.com (2603:10b6:8:191::15)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 19:34:39 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::ae) by DS0PR17CA0008.outlook.office365.com
 (2603:10b6:8:191::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 19:34:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 19:34:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 13:34:37 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.14
Date: Thu, 6 Mar 2025 14:34:24 -0500
Message-ID: <20250306193424.27413-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 74120dec-15f1-4d0f-04b6-08dd5ce5ef76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5hm17/7pCrEBMaJ4zOGUByw/LTFTYCfB3J8sZ7Z5+CbDaaZg2Mb5qTkx1Cp6?=
 =?us-ascii?Q?LfXWabqE2EMG4ylYKcbacmALc0saUW4WmsP1tXkZ7TxppnNiBm3l6vU1tPoH?=
 =?us-ascii?Q?vE9al2vvUkJ4lJlc2NbxyCXJupWqCNJEAiwQy7AH4ANLqzxGCtYFni6CInJD?=
 =?us-ascii?Q?4KkRKSRzkCwx0D4cG1Xr9No781LWkh9cZs64TswruZJHaOawE7wu8GqK5b7x?=
 =?us-ascii?Q?z8iDETcxljtKlM/YFpcLRLIcXZ3xycao89eBGLDup7KXiTVWM3jRzu/d4GEl?=
 =?us-ascii?Q?BEx+6jc9zn3ns7r5N2m6VMQz5PKaiz+M3IjplOCZBUX8DvXmnWeBqY1gcOKi?=
 =?us-ascii?Q?vsyoVgIR6JxwsuPUA0idWsR5rJS/h6iwbEZwrExC+98vGrFGpihOkDayLIp5?=
 =?us-ascii?Q?qflueWfHYQANRsZ1j3NgOSLBfmnBwcBK2TF7JkoI1wJRDNnld8IlZZ1F3rAC?=
 =?us-ascii?Q?PBtvMIFLNKDt6D69zHal3b8A64Pr7qOCaAf+3ffjMa4O/d1l57ezEpx6LeA/?=
 =?us-ascii?Q?36fmhqhCrk8tGf019GEQ0Ku3g/Clae6T51l0R95qWbCjg3sVQUbeEUh/svCC?=
 =?us-ascii?Q?qyMr5H+5C9TzyRyinxt99p0xn1vzoqDZRU6Gj8OkZvOgjzxpU9BoGLfIot/0?=
 =?us-ascii?Q?OX6ocE2v5sjSzMUx/pgso9oz6xwdB5dLL84bYLsyLc37cwLZPMDHqOeho52B?=
 =?us-ascii?Q?uQoxE6ZPmq8+nWiVmkll01a+B3+PS87tPSfeKUWheDKooPF3yhsNbxWwmknx?=
 =?us-ascii?Q?U9LLlP2fAbrcNT981ZX3hdvJ6LtiAnIjfu2iLTVTJZknmvjTALYSj8LJTPtl?=
 =?us-ascii?Q?GBxQ/S83aARwcDb4X6I/KiQaFMuy+ATGtzM/7cTlbUr6xwmHSZJQtobtlqiT?=
 =?us-ascii?Q?ajik8KcmRLUTakIgHgVDyH07z2PoOpSyHxE7JbE6DQroLQ4iBVdwBiS6AmeY?=
 =?us-ascii?Q?OaUyXp70kyjVLJFEqCPrvVHW9jjuLOi1+tFypm/KbcfkeA0vPBGFWfLuOkvn?=
 =?us-ascii?Q?T9lRmlO8aiyQmOLxw8lPsSwbc0c114shaRTrc/EkDoq+HX7ItK3Hxa9Ujima?=
 =?us-ascii?Q?I4RePpfp9OB75YJatRP6troBZ5s8KULozR7waGKsNnwTLFsJbcL+FVnoPizg?=
 =?us-ascii?Q?zmOiI1YStPhIacEf2IwVMK3zdtew5Sjtoz8VQ5idq5uN1c1EIF3w5RVX3gdY?=
 =?us-ascii?Q?slLWGMQXgeq/mYbliYqAp22FXMl6nVvvUgjaBlVvj+SZ9cMZSc6i+nifYgSi?=
 =?us-ascii?Q?hW0/iBEquhtWVAK5hGhQKlLYAwgfV0c1RCGchoS+2kSolRw/15ex7FtsdJLo?=
 =?us-ascii?Q?LllqGquSdyNJPHBOoYb/3RjI1WbirpBL7Snl8B88dIfW+Z6jETNg3eP0ySpF?=
 =?us-ascii?Q?dtmX7hoUzAkBMXT9sYGfZtcRXUSS49PWgVB8IdczjXCtRdXmuGmWJdsQXj/+?=
 =?us-ascii?Q?upjeTINEemg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 19:34:39.0296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74120dec-15f1-4d0f-04b6-08dd5ce5ef76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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

Fixes for 6.14.

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-03-06

for you to fetch changes up to da552bda987420e877500fdd90bd0172e3bf412b:

  drm/amd/pm: always allow ih interrupt from fw (2025-03-05 12:34:09 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-03-06:

amdgpu:
- Fix NULL check in DC code
- SMU 14 fix

amdkfd:
- Fix NULL check in queue validation

radeon:
- RS400 HyperZ fix

----------------------------------------------------------------
Andrew Martin (1):
      drm/amdkfd: Fix NULL Pointer Dereference in KFD queue

Kenneth Feng (1):
      drm/amd/pm: always allow ih interrupt from fw

Ma Ke (1):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params

Richard Thier (1):
      drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M

 drivers/gpu/drm/amd/amdkfd/kfd_queue.c            |  4 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c |  3 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c    | 12 +-----------
 drivers/gpu/drm/radeon/r300.c                     |  3 ++-
 drivers/gpu/drm/radeon/radeon_asic.h              |  1 +
 drivers/gpu/drm/radeon/rs400.c                    | 18 ++++++++++++++++--
 6 files changed, 24 insertions(+), 17 deletions(-)
