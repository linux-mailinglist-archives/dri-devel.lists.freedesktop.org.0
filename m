Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100815A187A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 20:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184310E8D4;
	Thu, 25 Aug 2022 18:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105C510E8C0;
 Thu, 25 Aug 2022 18:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2p/APVKP/lSDmKMqNW0d5qqYVGn/SUPgLuqEwGv9j6C0dFYapNXsSTZKYB5/UZ80Fz/4201RNLsrm9QRLvb1eScPDiPrt0yI4xRZ/KX3MENwlrbvQBKVqvK3cErzc3bCE83bkhFe+RzR66csruPc1aDtJsmzlNO6siU5R3uZfWAT8/bsR9oCNTR1i+cc3REW2s3khFle7m8ui+iIxznh0kqt+8qQqLtSm+EC+p/i4pru5WXEJ+9ieW6K0iGiarmfaf1MQ1lyMB4bsQlem5gVju08/P0irz5jY7TCfIPSU9a8zG5V0h1rH9jcBOPkss5PudsbfTL6qbqV4MGV0Y6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eURbLGA+/rY/j7f+XTbse2Tx1dO4mY/ICDGI4TfrLc8=;
 b=ciPqkmg0leYvROdzG5/Q7jMBUdOxVjA250XcOQ4HTRsd5UmkvM0Fucfh2VvnUh193FekW0IT+NdYWPVLPhS4oU3ed47aiRnswlo05+wpUJ6zHRFdIkhh25I4atnUd2sjEYmHm6miX2f0V3AZUkOnYnpwuEEUWdHZfdigd90nUX4Z/ObW55hjbl1RCPcjmKH/c7BAQZH3p0AQ9zcnvHq6yCY1MEKmGon2QHpx5Kk1YsdlrV8CSPXMyOkdKCxtsGwdlR+ckY1Ssij7Y+O0W/WAIYdZDdEgOG3i4JWrdqZnWhypCF3MvEg45Ens7RaOjYccD0OlPxffPiEs4PD0junh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eURbLGA+/rY/j7f+XTbse2Tx1dO4mY/ICDGI4TfrLc8=;
 b=JxUPeVACT43Gj8+MOJwZs4xZZkcrN/idBgSfhqBuX87rPiPZsCM04NCfJDlfzfwnUqP85I42KLmFNpeVGkxxQmv+JX0vUaXLcLFzI2EPFC0AqJUPrev0QtVMELPcWauKh+r+yOGPvPhOAaSN0G9IbSHq4stQiWd5C15NlzHQJ2k=
Received: from DM5PR07CA0094.namprd07.prod.outlook.com (2603:10b6:4:ae::23) by
 SN1PR12MB2526.namprd12.prod.outlook.com (2603:10b6:802:2a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Thu, 25 Aug 2022 18:13:18 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::74) by DM5PR07CA0094.outlook.office365.com
 (2603:10b6:4:ae::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Thu, 25 Aug 2022 18:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 18:13:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 25 Aug
 2022 13:13:16 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.0
Date: Thu, 25 Aug 2022 14:12:43 -0400
Message-ID: <20220825181243.5853-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c8bb8d-72c8-40f4-36e9-08da86c57c6e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2526:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9jHSf9AhUwjR9GtCsCmWENGcE87GReFdAKh3zRcT5vNuTMFppGnoheEx+Nb9O7whvmNv6MvARopI5zEs2RPOBrhq4iDgYXlWXY7UUFiQBS2HdQHWy9LdFu/sBZ1DOdfEFlvh+LS7wkA+Zd+UtZGg/3PSLo01Y5K6sKmWlO0SGUhxNHsjpmTT9Qteb9Od3xzssTgBA1eJrP8lQ7CSp+svBM2hUbjLumea1Q5YYkOB72X8NpyOHQVfDN/+VHUHx70KQtRzAdFZR4kmmdkFsx20xi5oKIgiT5SAb9k47iXREel0zIAWW3DLIHWnL+9kvEkhXQ+CO/l9LCy7CHD7vpJDcd0kmYnET605q15FpYbGAnHMwGxY+uizx8m1E6ZRhqBZ2A5Oqp3oIzDC4SaWlGfvmNmCMTB5zb9l6aOdrsgmKpWhJwNkZG+atqIvmtcYl9gywNBeZQR+UQViif2DbJTgl7VRqU70c5zehDTqZfjT+BvEBTZfAhvjmwJJYcHqz2G9ynPSFjOXkS6Sia+mKKlB6Zn/qtjQNKw8hUP9nodoAmJA9fT/xVQZWg9ZD01Wl6U/cYwuvGayQ0ss/chfmGW7yqBwOSwnmHEE5cSGG8GQURT52Ri17WhdZ9aSL35ZiFBAjwJlZ/BgmnsHSPjuxO4QM4wgQRBcsPo2i0dpBnxoXCymgWO5zyFVE+M55CY4e6JhuQKPK3zItNhyyYsybGsgFRR4V+TZ3jAdA71JFTpM9Bbb+UlDHVv8XrlK5+Dfp72
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(40470700004)(46966006)(4326008)(82740400003)(70206006)(36756003)(8676002)(110136005)(86362001)(36860700001)(356005)(81166007)(2616005)(336012)(1076003)(186003)(47076005)(16526019)(26005)(426003)(478600001)(5660300002)(6666004)(966005)(82310400005)(7696005)(83380400001)(40460700003)(8936002)(316002)(40480700001)(41300700001)(70586007)(2906002)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 18:13:17.9529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c8bb8d-72c8-40f4-36e9-08da86c57c6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2526
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

Hi Dave, Daniel,

Fixes for 6.0.  Mainly fixes for new IPs added in 6.0.

The following changes since commit b1fb6b87ed55ced458b322ea10cf0d0ab151e01b:

  Merge tag 'amd-drm-fixes-6.0-2022-08-17' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-08-19 09:45:22 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-08-25

for you to fetch changes up to b8983d42524f10ac6bf35bbce6a7cc8e45f61e04:

  drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly (2022-08-25 13:54:35 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-08-25:

amdgpu:
- GFX 11.0 fixes
- PSP XGMI handling fixes
- GFX9 fix for compute-only IPs
- Drop duplicated function call
- Fix warning due to missing header
- NBIO 7.7 fixes
- DCN 3.1.4 fixes
- SDMA 6.0 fixes
- SMU 13.0 fixes
- Arcturus GPUVM page table fix
- MMHUB 1.0 fix

amdkfd:
- GC 10.3.7 fix

radeon:
- Delayed work flush fix

----------------------------------------------------------------
Candice Li (1):
      drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.

Evan Quan (1):
      drm/amd/pm: update SMU 13.0.0 driver_if header

Likun Gao (1):
      drm/amdgpu: add MGCG perfmon setting for gfx11

Maíra Canal (1):
      drm/amd/display: Include missing header

Mukul Joshi (1):
      drm/amdgpu: Fix page table setup on Arcturus

Prike Liang (1):
      drm/amdkfd: Fix isa version for the GC 10.3.7

Qu Huang (1):
      drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly

Roman Li (1):
      drm/amd/display: enable PCON support for dcn314

Tim Huang (5):
      drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
      drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7.7.0
      drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
      drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
      drm/amdgpu: add sdma instance check for gfx11 CGCG

YiPeng Chai (2):
      drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
      drm/amdgpu: fix hive reference leak when adding xgmi device

Zhenneng Li (1):
      drm/radeon: add a force flush to delay work when radeon

shaoyunl (1):
      drm/amdgpu: Remove the additional kfd pre reset call for sriov

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 24 ++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            | 12 +++-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             | 78 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc21.c                 | 22 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |  8 ---
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  1 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |  2 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h | 13 ++++
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 31 +++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |  3 +
 18 files changed, 173 insertions(+), 47 deletions(-)
