Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F58244DA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D267210E4A7;
	Thu,  4 Jan 2024 15:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65410E4A7;
 Thu,  4 Jan 2024 15:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU5Kg+LhZ1seI7PLacSgOvHiPveZotfNndTFopxytGDreBiZE1fk465GvIs6I5HZTG3OUOICCiCFHerV7NEwKxdW1E6+d6Qm0/oIzxC8UAxi4B88VdU8kwhAb5LPS2ZcQuv5MB4LR42N4v3DJLGDOGSoES4ekfpqM4ZY4uumwgdyanL1WH2kW/OccHir3lJDHikvCt3Sp4c9bKpcu3uvToHqmDPH5VlMIs+xfiF2nO3nDg4zq7NHkLpM8j+0YtYQ2Vwmc2TugYECXtqgqxBmrgbhBjVP3kdQtyX7QhHQPr/0cnnR4nQ6aInlhLWBWhTafkUjCB7CzeZh1kM+Vc13WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK2189P6dHsEXEuaH+szoWIb/jatMop7TqlYiJFopI0=;
 b=NUdTpBpY4dPU+dAHmLE3JdPB+rTljnhAWFT/S+lsIZcsLgWmMIONHPLEpbfA/lR32ozJ+TaMysHE+Y7yvEyEE3/kP+2RSCeTpO8bw4ZdCJdOi121mErEwsSaMWQZ2zsWCkBsbp04yfJ65XqQuYrn2BDjQv68rbwLQ7XiEw+XVxFE5+eOftg/8Zf1WVHQdd+jnZ2NmDflHl6uyTO/g4yfkqboxnXCt9BeA3yaevu3J18RByaq4yvxVYsRD6yoBraVYFLFpJbEa7IuuiQ0zOeeOAbUCnPUojWkXmjvUkFWDsj47M9iHGIGb6Eztr1EKkpaK0BDM4Jd8NNZbiKp/Ow6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK2189P6dHsEXEuaH+szoWIb/jatMop7TqlYiJFopI0=;
 b=QZ+O+l5ZDCTNL6xalXPHSWFaTo0cNIpT9RmQTz/EF9ovbrPVHJOfB/xuLFKODJS6gTB8oqCM9eOXU9z+z10e5zu9ufe0Ndpn37Vqq5WnwtUk8Zu9cb/jJaQjM/ni70k6DLM/Wglsh/9ms1wxhzFN7SvsTVWXer9xjM1BuM31k1U=
Received: from BY5PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:1d0::23)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 15:22:00 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e4) by BY5PR04CA0013.outlook.office365.com
 (2603:10b6:a03:1d0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Thu, 4 Jan 2024 15:21:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 15:21:59 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 09:21:58 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.7
Date: Thu, 4 Jan 2024 10:21:39 -0500
Message-ID: <20240104152139.4931-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 95488dd6-39df-4edf-9be2-08dc0d38e561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBfMfV90V8HuIX+0VrBnNK70Sft6QcX5d4dNckf/lrpGszc5fz/BlGS96zjubnziOpJBDJlbBIUMSvQBqVI1Vt3/XdEJnmdX5aNQe5pKnBOAez0Ju5srGSI1b4nFhpnlGK78FYCKfCubUwDav4meTV3B+OaGSzWwaohJVTyCaMRZljAY0ZviSjzvHZVN/nGmciNBYWKoGbs2LkVjXzUplwxNW7X/BFgO1AZgtorA6MbzPEVvqvvbygPnQLQvIyzJZluZyD6H1daK69RYWtNfkyKEnI8sFS/rj/KLOQViIQ7QlTg4FY8ora9lR0rCzGQOo4F/PKXTA86iGZjyRL90HpzM4yug8q6EClIVeXUj+ga9eKH4avthcbnT4wT4P1nr5fKVXln1Zj4ayK7TPn4dOJ8tigyPEorN3tSnECzXhA2kPyoGDVec91MIlF9DSthYmRFY29N260K7JRg7qk0y37ZoYBtYxNHMAxX6naz4RNMWqdA6/9uR+Fn+JvBg2190x93GvjvifqRwRieaM8eGPBr5amUm4CXPrqhfojOivoNUImtLtWT2dav7dGN4WghEFWQMNpSelTx4pld49SD/aaQJhIt/IjmavbTSWnJHm8komijXbn3ajXugMGBWwZ+SyL0sJA7yOSo8icPVm5w5uopNDyWKorj7Rsr9EjmIJlP+0U+PFCoho5P/wiQtz17ZUvzkoBhCpRwi2kd3aZw4rC9uSITE99DVDZFKQOA5Mm1jM8X8AJxX4odypqquojR4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(36756003)(70206006)(70586007)(86362001)(426003)(336012)(81166007)(16526019)(2906002)(6666004)(47076005)(1076003)(4001150100001)(2616005)(41300700001)(5660300002)(356005)(4326008)(478600001)(82740400003)(7696005)(316002)(36860700001)(966005)(8936002)(110136005)(83380400001)(8676002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 15:21:59.5289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95488dd6-39df-4edf-9be2-08dc0d38e561
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

Happy New Year!

Fixes for 6.7.  The changes for SMU 13.0.6 are relatively big, but it's a new IP
added in 6.7 and the changes are isolated to that IP so it should not affect
anything else and this should make the IP fully functional for the 6.7 release.
The rest are just bug fixes from the last few weeks.

The following changes since commit bc2fdea0065236fdf9fbba3ac77cf5f3d0891443:

  Merge tag 'drm-intel-fixes-2023-12-28' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2024-01-03 14:17:37 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2024-01-04

for you to fetch changes up to f71cee97a644a6dfa3bc0eb69e29a53eab49b98d:

  drm/amd/pm: Use gpu_metrics_v1_5 for SMUv13.0.6 (2024-01-04 09:51:24 -0500)

----------------------------------------------------------------
amdgpu:
- DP MST fix
- SMU 13.0.6 fixes
- Fix displays on macbooks using vega12
- Fix VSC and colorimetry on DP/eDP

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: add nv12 bounding box
      drm/amdgpu: skip gpu_info fw loading on navi12

Asad Kamal (5):
      drm/amd/pm: Use separate metric table for APU
      drm/amd/pm: Update metric table for jpeg/vcn data
      drm/amd/pm: Add mem_busy_percent for GCv9.4.3 apu
      drm/amd/pm: Add gpu_metrics_v1_5
      drm/amd/pm: Use gpu_metrics_v1_5 for SMUv13.0.6

Joshua Ashton (1):
      drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR

Wayne Lin (1):
      drm/amd/display: pbn_div need be updated for hotplug event

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 110 ++++++++++++++-
 .../amd/display/modules/info_packet/info_packet.c  |  13 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  80 +++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    | 100 +++++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 153 ++++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 9 files changed, 400 insertions(+), 85 deletions(-)
