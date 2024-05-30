Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7168D53B6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 22:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DB310F368;
	Thu, 30 May 2024 20:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="etP8oyyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A8510F368;
 Thu, 30 May 2024 20:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmI4D0wphTPAEdqmbGzzP/s6Dep1LuEEzxDWEm2wahkIhR3DBQ6AgEmbMaZ5z3No/uZlOgmokGvnwBC2xLP8lGNGJMeNfBwiKCGXcmjBxy1eOV0zv5JEI/+PFHFF/0LFXsoPAQsoof/7U7+e7nCYu5/83LiJRuc2k4faovLLCOnpyXeN789JR9wKhNZBJOz6T8A1euFBEt5GkgDn67bcb2Oq0e9l3iAQlg/8lmiULGCs5/lKAKl/xDRvLw1PKLcJN2N8qShF8k5PjFBWwr02jNCt/FUjwJhQ80mTZEQXylgdWAw9jZNPlT6weDcNCW7ugT+VMo8cALyZWmPWl04xdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo7KQX6yGkPiG/e+M0zefcKWmnliH08aTij95I4I854=;
 b=KqSwaAKF4HRjHuJpPmm7wbYyuEGNg7Ci57l7OC+u1HfWHCFFUTo5JwDtIotvbiaOcFIJGmP6wtaNJCIPbr5zhrosNHR3ES5yJJKzHe0M/IliSYgqv8rsRP9TZMUJ6gxEqUMpRcamQf/65Caxq/GcjhDK9OLYpRxkbU7Nf+Q5eOU0RpAKOHjSeG8BE+X+2rA0kLpn0iiqTA96uBuZtbejt9/S3Z4e4bGh6TfLuZo1PLhS4e4d3mSOX0ujRpnocEJuvbNAFizCUYos+kn7Cti3aBiG5k5KzlHX2CuQq/dcb67mpX2LP3G/Lx8/sBaDgolsIETvtXtIMU6MxUpgN+hy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo7KQX6yGkPiG/e+M0zefcKWmnliH08aTij95I4I854=;
 b=etP8oyyHMOnNr+59HddgxFO0f7tCTv9LsOE6CJwQZGYcPxLtCtI0sn0TFq08fbvpup9VR/chfP6KjizOmY7GP2uGK0sa8FXKFXDs/WvPtq8HgatgZc/IPruwVGSia4df2h9Kuo+gexDKjWLH8K5/E4eWhYxeYo18p5GycMmTHCw=
Received: from BN8PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:ac::41)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 20:23:46 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:ac:cafe::8b) by BN8PR07CA0028.outlook.office365.com
 (2603:10b6:408:ac::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Thu, 30 May 2024 20:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 20:23:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 15:23:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.10
Date: Thu, 30 May 2024 16:23:16 -0400
Message-ID: <20240530202316.2246826-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b9172f-395e-4d50-2484-08dc80e66834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QHP+pj4McOmiVAsCGxnmR8mSMeiaK3QmpOrmGThcgaVKFKt0KwziDwJGF4co?=
 =?us-ascii?Q?9RmFHU0JJJqwJ61yzloBnQKsO95nbzM9T8VD/6RJXUFwvLVuF7xifJBitJM7?=
 =?us-ascii?Q?XPlL6TuDmdCKGig3IMVYrKpegJb+avyeKC++n+JbLm/mSxboLS/PEs+6F1XF?=
 =?us-ascii?Q?W3tqZwiod8xUklB73jvHamPqxBYzDS2dBZHnuyK/86liHm15Xvk4/GqDM6M1?=
 =?us-ascii?Q?bkcBL11ZqTLAMLdgFV+bMJTFk7h0gtbx5DEbxXTwdsQBvnTZspa3vXcbPhXo?=
 =?us-ascii?Q?0V7Nc6bbJoTSMsjQXniWPwHmrZTwBRBge5cfhBWyhHr+zshRf6YI71aqgLUC?=
 =?us-ascii?Q?Zp6a8qok9oqJ0GA2tYCVAZ2+1D0dhraUDQ9m1kYe5Ti8JoVfeAeU3Fiwqr8i?=
 =?us-ascii?Q?yPoKiKSpET2cy3HIu8hP1u0gvrqvSCWFXqNa24dh5k4MoF47LJyLDaG0SvRZ?=
 =?us-ascii?Q?k5Undq4Nq0iVbchIx0r2rKHPTGdhDzXtuVqhZzr+hAY0HqdkXIYGuZ/qDINA?=
 =?us-ascii?Q?O/LQWb7qi3jl0IOY9lJdGjkeQ9Du6y499LhAzobVPrC03LmuGnzbV5T2bByv?=
 =?us-ascii?Q?uH728QBzhjdRWZ/jEzXqacZUsqsUlF2GfLBFCG96C2suT/2/sXTw6jo8P5ad?=
 =?us-ascii?Q?86dBAjL72T3Gicr3Qw4LdBkZ2JS1lD2sAHDL287ht5/TF69ZlRit/9Wyq2xq?=
 =?us-ascii?Q?IJeRpLG5GsQYU7I5e/XcxDSJwQSp0OpoGAbzGhNWbxT1oi5XwHrScS3EQOGx?=
 =?us-ascii?Q?jsiscBIUw3GoD5uF/7AMFhzc9bUzRbdVh+emRm7FL76DJuKG6XgCiXMYLGw9?=
 =?us-ascii?Q?PLMHHBPL6DqJUo4ESQRvU0Vd25JFTPaASUxM74TZGwcLm4qekIPaaJenpZVh?=
 =?us-ascii?Q?aBE54wicO3vgxmSszo1Hxdl8UbLWvyr99y8KEgWpjMuhGkcxBPetbt3aUG4H?=
 =?us-ascii?Q?eKIzqeMzFNpcVkaYTSGOuV/kmP0EWiwTttpV8gNbZ4gmeFYOo00Qo/tOpt1n?=
 =?us-ascii?Q?qwgF0SJqZ4rVJflRywmcf8PNrtFd+q98fPemxwNRvddyjVm5C9h0rbtojq7j?=
 =?us-ascii?Q?Kp3Cy1Mz3b/WXbQrM+gvGIR+i8F/tqmqDzs15nSGZ0tHB3zzs7CWWyEe+aU+?=
 =?us-ascii?Q?MM6450QLas27zfoezgEjVESRbLH1dzyWaO0iSf7EijlTiGqvoO27+pVx3E1x?=
 =?us-ascii?Q?rk680MeiR+Ha1I5t3fZ1bSQd2gS8/l79XUmAyVELy68v+kfYGiCdrXMqsPgL?=
 =?us-ascii?Q?U0GK+PZDD9bgyLinHg0nYOQyBOSzX99jes0cKR/vIThbUcZDc3uoC7rAmnzH?=
 =?us-ascii?Q?645Op8Agwb3GXyq/RS21vNwv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 20:23:45.8380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b9172f-395e-4d50-2484-08dc80e66834
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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

Hi Dave, Sima,

Fixes for 6.10.

The following changes since commit 36f53d622a216ce80e568b8ca899bfbacb2592d4:

  Merge tag 'drm-misc-fixes-2024-05-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-05-23 17:07:13 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-05-30

for you to fetch changes up to 67c7d4fa267bcfe8d68fb36d938e3c6e0912b57d:

  drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly added SMU_14_0_2 (2024-05-29 17:08:08 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-05-30:

amdgpu:
- RAS fix
- Fix colorspace property for MST connectors
- Fix for PCIe DPM
- Silence UBSAN warning
- GPUVM robustness fix
- Partition fix
- Drop deprecated I2C_CLASS_SPD

amdkfd:
- Revert unused changes for certain 11.0.3 devices
- Simplify APU VRAM handling

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: Adjust logic in amdgpu_device_partner_bandwidth()
      drm/amdgpu: silence UBSAN warning
      Revert "drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices"
      drm/amdkfd: simplify APU VRAM handling

Hawking Zhang (1):
      drm/amdgpu: correct hbm field in boot status

Heiner Kallweit (1):
      drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly added SMU_14_0_2

Jesse Zhang (1):
      drm/amdgpu: fix dereference null return value for the function amdgpu_vm_pt_parent

Mario Limonciello (1):
      drm/amd/display: Enable colorspace property for MST connectors

Rajneesh Bhardwaj (1):
      drm/amdgpu: Make CPX mode auto default in NPS4

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c      | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c            | 19 ++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c             |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c            |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c               | 11 ++---------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                  |  6 ++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h                  |  1 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   |  3 +++
 drivers/gpu/drm/amd/include/atomfirmware.h            |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c  |  1 -
 12 files changed, 36 insertions(+), 35 deletions(-)
