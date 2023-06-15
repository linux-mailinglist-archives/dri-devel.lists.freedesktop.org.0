Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD3730D4D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 04:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8788E10E07F;
	Thu, 15 Jun 2023 02:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974310E07F;
 Thu, 15 Jun 2023 02:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdg1jLItr+359hcslX9sKwrN33IgLbamJRKpGMKQti8dTRr+brBRCsdBjqg4XGRHDhksIMipyTenlZAl9lBKeVS+0B19O1hqdrthMUJZDNWBMtjv2ZvWOIEu0hqzBBeYTXQ0qFWbTo6D5T4Tr5J88W40zuXe6PSaeQoyHpHrNPdyZn8h7/RLi1FjLRNkmGEeRIT7W+mvQuJ31YTlt7xNZgY/kdRn34bHlrkdWzGHfuA3z9pw9I8rWTkVNsyINPp57LxBEoC2Rw2mzN0EBKHWf4zOrFH1140Pbds6dn+X7MEtfN4iTVdkt+fPUWUdYxmR2yT8vG1CGYVYQ7uSPq4Rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9WbOLNeNHAudOMb8SBZMJEy/BM9Qk6iLfy8UTEWc98=;
 b=SxYTA5gEYkme/ftjMNalW9C+PCWQ42sEvOvC4y6K94KxUFjqtuJoGwXALIHWc12HnuzAtfiBrW3GHnoE5bRUcEcR+NJX01LHtgfigc1iqdvR8X+qRK90/AXtwIoq/s1OzLiPVmKfqvA+WL3K5/MIz0WSbXSUdJvg4z+HO0iG+Y5uV/y+u3IiN/3CpTKyANHNnZbQV8K3hABGsPe0IeJ2jY0rrYdRUpDQ8BsoNY+MQNrkO6X9MPYl7r2xLif3J0mmx7ewrxUGz8ibPWw1EQbnynTDXUvpntvZcNHksgRbcVV01F1yYQavFoc83ipGwbwV2Oi9ELRFnndwfzFRSB/BUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9WbOLNeNHAudOMb8SBZMJEy/BM9Qk6iLfy8UTEWc98=;
 b=SXzNwnriOPEftTMJIxZ8GcmU28zRGBxrcK4umQn+CoJAI+dGc67b6adSJ25FVKb6A/nq2z52xqCy04R98uiJoK4ooYkrevQWAdk6qWc15doqR+OoM2Zti2IFxvsnnSYJyKDQn518Yp3PKEHpBXA2IkAu0azM8j2OM8hYT1KA1G4=
Received: from DS7PR06CA0039.namprd06.prod.outlook.com (2603:10b6:8:54::7) by
 BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 02:40:54 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::e0) by DS7PR06CA0039.outlook.office365.com
 (2603:10b6:8:54::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 02:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 02:40:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 21:40:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, radeon drm-fixes-6.4
Date: Wed, 14 Jun 2023 22:40:11 -0400
Message-ID: <20230615024011.7773-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 073fe45a-135d-4efd-f8fc-08db6d49f0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDidoeELvzQVODUSAZ84N/6OP4ZOhO/txn/Qoq3xhRX9MwaTKXufdYcOz6jfA36IzNZ1z2dhGG+C3RUt67UUamHB1fkBIYetp6Snf6t57aNEF1vzi7zRS9/ELncaNzvUBWm+ClGVpZlxgQ71p7JC0MWgmagQfV+DHXmFBzzQT9g88u8nmfekw7IkiJ0GW98VGyBHnBg3H9PdO4c54IG6f2JPZkW4DN+JQFWT0hJgC7C2aFqrOeONACiRNXV8aMo0R/obPF7j0Aqn35x06FDA85snAk86X8ZByQxfOyg8F5iWcazi9Bek5XL4965eP/kXBSz+w4uoGHHu5D20RyxY60cTrB/1V4Zklk+ekA0QcIMASwp9cf//1qFOJwB9bI9s9GESq7Sv0n44Ea4XEfMAjJcKdKLBQzj7a9fl0PsKCdB5fx3C3R+T3c8pd2/a2yvID7V+eKt13cqLjIXrBmuwZr5oHWjBuXNMH6c1tTWrvyuyUZF0QUesxPW7EL6dAOPfx+mgw71isBzmiYPmUZ8nk136defu5rCrzd9x21A121Lt1puqnLWTval35OESFttuwNg1F53Mp8nnztJb0ruteG6qkmiy+zOhykQ64tdmIBV2LnRgYjeRGnPYy+XbSdeMOHUmjavebZgV2Nefh1PqVX4OJCinqJKO05YrvNvDWmP3N+E+2+aIoBZaltnoHsnfHcJf0b5+AaguDv2afXS1Y8s5GiFcENYy2A/vzFZWbHc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(47076005)(70586007)(70206006)(336012)(4326008)(36756003)(426003)(186003)(478600001)(16526019)(110136005)(2616005)(2906002)(8676002)(6666004)(316002)(966005)(41300700001)(82310400005)(86362001)(40460700003)(7696005)(36860700001)(356005)(1076003)(8936002)(82740400003)(26005)(83380400001)(5660300002)(81166007)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 02:40:54.0380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073fe45a-135d-4efd-f8fc-08db6d49f0af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450
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

Fixes for 6.4.

The following changes since commit 858fd168a95c5b9669aac8db6c14a9aeab446375:

  Linux 6.4-rc6 (2023-06-11 14:35:30 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-06-14

for you to fetch changes up to 7c5835bcb9176df94683396f1c0e5df6bf5094b3:

  drm/amd/display: limit DPIA link rate to HBR3 (2023-06-13 17:16:35 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-06-14:

amdgpu:
- GFX9 preemption fixes
- Add missing radeon secondary PCI ID
- vblflash fixes
- SMU 13 fix
- VCN 4.0 fix
- Re-enable TOPDOWN flag for large BAR systems to fix regression
- eDP fix
- PSR hang fix
- DPIA fix

radeon:
- fbdev client warning fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: add missing radeon secondary PCI ID

Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: remove TOPDOWN flags when allocating VRAM in large bar system"

Hersen Wu (1):
      drm/amd/display: edp do not add non-edid timings

Jiadong Zhu (4):
      drm/amdgpu: Reset CP_VMID_PREEMPT after trailing fence signaled
      drm/amdgpu: Program gds backup address as zero if no gds allocated
      drm/amdgpu: Modify indirect buffer packages for resubmission
      drm/amdgpu: Implement gfx9 patch functions for resubmission

Kenneth Feng (1):
      drm/amd/pm: workaround for compute workload type on some skus

Mario Limonciello (2):
      drm/amd: Make sure image is written to trigger VBIOS image update flow
      drm/amd: Tighten permissions on VBIOS flashing attributes

Peichen Huang (1):
      drm/amd/display: limit DPIA link rate to HBR3

Sonny Jiang (1):
      drm/amdgpu: vcn_4_0 set instance 0 init sched score to 1

Thomas Zimmermann (1):
      drm/radeon: Disable outputs when releasing fbdev client

Tom Chung (1):
      drm/amd/display: fix the system hang while disable PSR

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  18 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  60 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |  15 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 101 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  18 +++-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   5 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  33 ++++++-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   1 +
 13 files changed, 256 insertions(+), 20 deletions(-)
