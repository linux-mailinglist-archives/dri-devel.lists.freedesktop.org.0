Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755897B9A4C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2287C10E1A6;
	Thu,  5 Oct 2023 03:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B010E3DD;
 Thu,  5 Oct 2023 03:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdvruBLS1/Lj2ux/Jxi5OnvdH6kt3CkuJWtXT35RNmlGbaud9qKvpBavfAbzHUgrsZV4sC95P4TqV/nDPbNMW6sVlIUTPSuSvWqwgfbgIYO+IEMLpTdTGNigR4VX+YSmNxSjxDsaHvZQ0K7FRLRELFTzTyO+n89Im6Q2FOJTyK5kBU2Zd4MfNcy9fmUsQxvJFsMChabN3JF8H+r720pwg5PKA5wKT167n9Reps0er4/5n6Xr8LZaA7U8So/wG/15/dmANCZDTLSpctmXNdG3sz8pgD42kkWcF+IbN3USsm8XApTleMzbER4vQZPVN9O2zJR36KhCuNEvI4nTWRDQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBB267O/8gvfWssJibDD49kJsLVMUN3dY1hnciXQ1uY=;
 b=gcOnh5wFSVG/5Orz8U6d3QfvpMZsgBtlsdLy7HOLG0nlNYnT9r+oUzk63oPWASvcyLTOezHeCBR8LoQjYEt2Uc8Y7YlF12AT+/R8HtaMTB9vZExbQ9/hOCVfAiqLZs3I0YEuKOmwK00ebuxv3E+DojUNeFcBv25YUJ5i/yzLo+rdtzgNqFQY+45eRaxf47KqsLqTFJE8OuPBuP4MF4jlOxA9TGlL+oN163ySWjDQlbHuSs5WXAqgqFs94yJ1XQWtQ1EIvqNVWRJERhUEmkD5dTADXMcVE+zMT+3dhUBjFozB4j6vfC/pmWuR/6W4OKbpNnb1lbPdvQosALpeuYua0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBB267O/8gvfWssJibDD49kJsLVMUN3dY1hnciXQ1uY=;
 b=vEYhQlVCrssWuoQqTbbOm9dKdhdBFChb1mIw4pm/Nn6GqmS/CyILx40gx81engAiQAQryDcPK2QaPiDcnulr0fT6QrnCWxJy9xPPvMR1quGSotJWMZo86pff4i/oSRT0Rwhsbym4pv1jLvVZ5z4mDURk7qR9xXSyl8Tj7B0iIjU=
Received: from BYAPR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:40::39)
 by DM4PR12MB5150.namprd12.prod.outlook.com (2603:10b6:5:391::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 03:44:36 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::17) by BYAPR04CA0026.outlook.office365.com
 (2603:10b6:a03:40::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 03:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 03:44:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 22:44:32 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.6
Date: Wed, 4 Oct 2023 23:43:58 -0400
Message-ID: <20231005034358.7824-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DM4PR12MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e75c461-35c5-46b1-6f6a-08dbc55564a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfSCGmBQGjmYICz8YgrGFIQFoRd9CJc+dU4aWX1gHHyf9+sQQHA0w125TF0WnUDJ7WRBUzVsh0qFYsKFOpJMnlGqdyRKt/aaPvikPB5KRzcWCK8hNP46zkZ8TUAHwFa/W6Tv1cufaHF76RT+dSGoYbWbIHrRLAmA0IQryqKVbh2DCd2RbyY570GiD5UW8cPCcnQxJfxQ9GxEfKwYMwXKXvhErP8kie8TrmLzq4DNZHJNOHshsqVjaAhuFe1+m89lDLhx6iMAtdeP7JbJj4TuTCO0k8B7blnLDlODa/TMMEIhpK4/CyJvH0W7gujQRht6rcP5UKKpwlByATQwrShAk9FsG1t6D8OISgZFjO51RaTu13eJJ3MSBmgrjjuc7f1nYc/NgUBfitd5Mb3DaZmdqcBU1MkNhrrIapSAoCPjl5vl7GaS3jukeTNrfeqCYV9H3QjJEpAVnGNMw2+BER9CMUf5+MdRLwZmy2C0CHP1ci5pEPoy7hyTySR+mBy0kLozJ8gl+s42rMS+mZOrPm8zQEHSgoEV2pO03HcqG1d8V7uSl7TNjXn7f8zK+xt84laU7PvbAVNvCAOxbRPzxhA4GqnDTWE3dM4KqK94Yy3qLq0WyIBOCcYrSs4+8fSWtOvociYSRK0VwuEYyq19/M+lNJLJOqov6p7Uaij0XBB+pEYH1WEXMNoHqQOjhegSxt/tvqBpTb61Lnyyk2z1MPSTo7qneq2v9B/yoNy/h4oYftpCH5FyIyKfSJvf+HwffQZN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799009)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(1076003)(336012)(41300700001)(110136005)(7696005)(2616005)(478600001)(966005)(316002)(70206006)(70586007)(426003)(8936002)(8676002)(4326008)(16526019)(5660300002)(26005)(6666004)(40460700003)(83380400001)(2906002)(47076005)(82740400003)(356005)(81166007)(36756003)(36860700001)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:44:35.3237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e75c461-35c5-46b1-6f6a-08dbc55564a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5150
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

Fixes for 6.6.

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-10-04

for you to fetch changes up to b206011bf05069797df1f4c5ce639398728978e2:

  drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to master OTG pipes only (2023-10-04 22:55:05 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-10-04:

amdgpu:
- Add missing unique_id for GC 11.0.3
- Fix memory leak in FRU error path
- Fix PCIe link reporting on some SMU 11 parts
- Fix ACPI _PR3 detection
- Fix DISPCLK WDIVIDER handling in OTG code

----------------------------------------------------------------
Kenneth Feng (1):
      drm/amd/pm: add unique_id for gc 11.0.3

Luben Tuikov (1):
      drm/amdgpu: Fix a memory leak

Mario Limonciello (2):
      drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
      drm/amd: Fix detection of _PR3 on the PCIe root port

Samson Tam (1):
      drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to master OTG pipes only

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  1 +
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |  4 +--
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  4 +--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  1 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 41 ++++++++++++----------
 6 files changed, 30 insertions(+), 23 deletions(-)
