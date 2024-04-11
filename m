Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0F8A0597
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 03:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BF410EC2B;
	Thu, 11 Apr 2024 01:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jM3azGXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4010EC2B;
 Thu, 11 Apr 2024 01:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0NwRlNB8/kcbzFPtUIChK9QSePrPVy5C1PoXytpVDjnfcKc1/9Tyk0ujyYQXRVStOxcScFDn4rbT9n+PSXQQZGSS1d1OMTFpvqWWwXGjZtCaYIyXau4AtQ185g3OgbrXguScLFk5yU6dLinwc1pDLF3yhjHaJB97gInj29J3TUDigTj3LRm3Dn1K7N/nbX28zpBgSyYr/azmcdt/v8FFwfdO6Ge8/wH/umzBuFoUL0mJLLfjpCRgm6a8BJRupslPg1CW1ZIBqou8v9vlvQi9JfBvxt0tC9SMRgbk27BvNlUS9v6lidvQbv/+mNdKiPk1LeNbQXMIy6XTA4xAMplxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaEsWaLb4CxjC6MtDADgL3AeWRGxK8QuWtAbtXbSgiI=;
 b=bzrJ/Y061g5IrZINTwGOMWqc0+8FM78zxhIjBNFGaFKeek855PEc6vGIpQJJO7OOS/8q7Nd2LQwazeoDIZuQ99hK/FBZ4E2Sq1VvuSXdHB1Y5DDYJInJcO0ZXGZ94+uy1Q/XHC0Sh7wYb4OKkEF0xWzEsDogUxXOLy3D690F/KBptmDVJDIqbZU2YqtvjM5XhFM3o3YUQvFBPdLYHdsY6fIEMXXdyp90GBbUOjmw9thV3+UxzRey9Uxab3aMspLzTBrjW9v/Z86lh4ZTteaTI+zIc1QeAr+4loDcu3BRXNgjBATtPrdM7TK08xV4ZYCM4y6dTrInD19TxqJCQHUawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaEsWaLb4CxjC6MtDADgL3AeWRGxK8QuWtAbtXbSgiI=;
 b=jM3azGXrXFsyt+im3Y3jKMtzmxAncOkxtGHzXEtmT5OShfH3wj4CIu+MOF9wN+G7BrrsGQgbLPCE+J4a3SaFdnk0HeL/sb16TvMe68WT2GIjHL8vankZNWdsGLEyi7xJzgmiHqB2HniBpVmXZWd4J06x6XjnBwBZPAaeGiUvALs=
Received: from BN8PR15CA0016.namprd15.prod.outlook.com (2603:10b6:408:c0::29)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 01:34:43 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:c0:cafe::7d) by BN8PR15CA0016.outlook.office365.com
 (2603:10b6:408:c0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Thu, 11 Apr 2024 01:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7495.0 via Frontend Transport; Thu, 11 Apr 2024 01:34:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 20:34:41 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Wed, 10 Apr 2024 21:34:25 -0400
Message-ID: <20240411013425.6431-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: e55181e6-46d1-43a4-ec10-08dc59c79001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: od0mEoiQC2klUz4y3ZkDGCj5zJK+Y56JxYe+Bk/pNXAxI6pNA8kAcU+tv1y85PCN0SSdeicCXRWvbYWisREbtxb2tenxpnqAKSJ0bH6wDWgerCD34m182KYzDd18PvOGPf0aUgVb4+9oy/5NFHCbWq0pcQmm7n/IOK+2DQwyXNS9fCATobodB1O/kRlcHcyXc7WNmyo04ER28lVEzzMBIl97qjmJPRN/wegYq1/VZxk/P4iM+a2jjTk7UfjiDFl0zTVAj0jjpYwmoqTIpmmP+bmTdg5defWBP9h4K6MQ0hCYkyct+gExYXvHawnQakcBFdK5gl7wzd8S2uKpeZtMq4gwyWoa+q1AaZ/Ui+iIX2ztZv6Ani/qk7g95k2syFaiELjC28UZ7I3XdWssUF+hHoTZf4ufQwHITMQ7i/aSll1h6KYn+vp30SyiIn2w8C+YsEuVwBHYHM1cAjP4DzMZwfn6VkCsgSc2zRcCAFF6430AwKj7xF0G45Ui5C2CR3OasWuAsTS6V8yXAdq/0GcvtL99DXD3ojW9mc3cxA798JO2hkzXtnuUa8gW7ftGdYFVJqMzi/UAjXWvtkNEwRWpMEs+aYqgEl9CHI6SAGVD8LlF+GNDb7+3fV3xwfHdmJKzLju6ObrDqJn8Vp4UahiXOaSDfVVZpXIuMNeLIx0J9LHREnRv+LYuMhmft+EaUqMCRdXmPwjARA/QaQHnmddbgg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 01:34:42.8708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55181e6-46d1-43a4-ec10-08dc59c79001
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
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

Fixes for 6.9.  Two weeks worth.  There is a fairly big update for SMU 14.0.1,
but that is a new IP for 6.9 so it should be isolated to that.

The following changes since commit 718c4fb221dbeff9072810841b949413c5ffc345:

  nouveau: fix devinit paths to only handle display on GSP. (2024-04-09 13:14:13 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-04-10

for you to fetch changes up to 6dba20d23e85034901ccb765a7ca71199bcca4df:

  drm/amdgpu: differentiate external rev id for gfx 11.5.0 (2024-04-10 00:00:32 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-04-10:

amdgpu:
- GPU reset fixes
- Fix some confusing logging
- UMSCH fix
- Aborted suspend fix
- DCN 3.5 fixes
- S4 fix
- MES logging fixes
- SMU 14 fixes
- SDMA 4.4.2 fix
- KASAN fix
- SMU 13.0.10 fix
- VCN partition fix
- GFX11 fixes
- DWB fixes
- Plane handling fix
- FAMS fix
- DCN 3.1.6 fix
- VSC SDP fixes
- OLED panel fix
- GFX 11.5 fix

amdkfd:
- GPU reset fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: always force full reset for SOC21

Alex Hung (2):
      drm/amd/display: Skip on writeback when it's not applicable
      drm/amd/display: Return max resolution supported by DWB

Dillon Varone (1):
      drm/amd/display: Do not recursively call manual trigger programming

Fudongwang (1):
      drm/amd/display: fix disable otg wa logic in DCN316

Harish Kasiviswanathan (1):
      drm/amdkfd: Reset GPU on queue preemption failure

Harry Wentland (2):
      drm/amd/display: Program VSC SDP colorimetry for all DP sinks >= 1.4
      drm/amd/display: Set VSC SDP Colorimetry same way for MST and SST

Kenneth Feng (1):
      drm/amd/pm: fix the high voltage issue after unload

Lang Yu (1):
      drm/amdgpu/umsch: reinitialize write pointer in hw init

Li Ma (1):
      drm/amd/display: add DCN 351 version for microcode load

Lijo Lazar (3):
      drm/amdgpu: Refine IB schedule error logging
      drm/amdgpu: Reset dGPU if suspend got aborted
      drm/amdgpu: Fix VCN allocation in CPX partition

Tao Zhou (1):
      drm/amdgpu: implement IRQ_STATE_ENABLE for SDMA v4.4.2

Tim Huang (2):
      drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
      drm/amdgpu: fix incorrect number of active RBs for gfx11

Wenjing Liu (1):
      drm/amd/display: always reset ODM mode in context when adding first plane

Yifan Zhang (2):
      drm/amdgpu: add smu 14.0.1 discovery support
      drm/amdgpu: differentiate external rev id for gfx 11.5.0

ZhenGuo Yin (1):
      drm/amdgpu: clear set_q_mode_offs when VM changed

Zhigang Luo (1):
      amd/amdkfd: sync all devices to wait all processes being evicted

Zhongwei (1):
      drm/amd/display: Adjust dprefclk by down spread percentage.

lima1002 (1):
      drm/amd/swsmu: Update smu v14.0.0 headers to be 14.0.1 compatible

shaoyunl (2):
      drm/amdgpu : Add mes_log_enable to control mes log feature
      drm/amdgpu : Increase the mes log buffer size as per new MES FW version

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  32 +-
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  17 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  31 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |   6 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  19 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  50 +++
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   9 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   8 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   3 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  27 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |  33 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h    |  55 +++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  18 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 347 +++++++++++++++++++--
 32 files changed, 652 insertions(+), 127 deletions(-)
