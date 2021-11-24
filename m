Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10245CEDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6053C6EC71;
	Wed, 24 Nov 2021 21:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8F6EC6F;
 Wed, 24 Nov 2021 21:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1/rc+jlXlbSKTz7KHKXuQJY0pG9RMksrYWxdRpKodRm+CKU8Ht6nh10MPWlfPOD7qHvR2mXYqJaGJILCStwBN90A+vIrUSFdTbjk+VsZT3p8n3Q0Za5Zmk9uiVy6zTXjYmFxhcBoNhy2u/U/K71n6bL2Nbt0JZjMj70UgLGizrLlfYo7tVBPSm2yACaTF8Am6HznLsq5C5iwh+K9JUItBw47HKeBbXIT9Rq3tf+zKyD22yI2ttfEU0Woq7qX1G2ylhY/phBEOqfc/h8ecdeLHd9gYRkWpwI/VaT0AVAsRJZonnViT/JQJoGxScSmZcIHkX4DuCEQNN/B1SjDUyoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R15u1lVwbimC36qbP51dWET+4ivxZn9U5krzHG+pyKc=;
 b=GdKZaF5fcarfejFFgwwzttXqXVLUGA/6w+LifUWB1oCGTTbF0gb9AzIuWpw9TNNE07tHLsJfFenUuvymdEhvW/rbNsAD0Vopof3inWivQNocbrk3uRERUfgfxV1kiiSWlli5sGJlPty2CLkBv6Fc3DsPW9H8lWaXMUrdUVCVEjKdycYjsDASZG6CS+ZF86p3Qh7w+d+hRQh4/kJiU/yaYFef0GNH/XrfHP98BkdLIA3x78oHX56z/4d33D6eoeQNslXM+NAgnKUz7v6a49CNB8jsjcVxTb6D1gdbFvhY8H+kJpnbStEPqtTB3vhDJA7CgR4KFhITgDrfWoobVxhr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R15u1lVwbimC36qbP51dWET+4ivxZn9U5krzHG+pyKc=;
 b=WF9piwORwzknHHQvMVxaA0oQiOwA37yhRIwe9N9xcE3t6g8FsyFIaJ4a3L/TApcE1xSSQga03NnNYRbffvYlb9Ob/vUe5dQ/x8gJ8i1UKvbEPzO5jyinPxjaicLhxvBRBeYof78QhLSJaOWQ+0PUvvjh8LjxBDtAEJmC/dxDYP4=
Received: from BN1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:408:e2::30)
 by DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 21:21:12 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::bc) by BN1PR13CA0025.outlook.office365.com
 (2603:10b6:408:e2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Wed, 24 Nov 2021 21:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Wed, 24 Nov 2021 21:21:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 24 Nov
 2021 15:21:09 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.16
Date: Wed, 24 Nov 2021 16:20:56 -0500
Message-ID: <20211124212056.6327-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 749b3d8f-86d1-47f8-d5e6-08d9af9056ce
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5070964702D3B74339FDA622F7619@DM4PR12MB5070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHVO0EURsx5NaJ0BjpGxm/N0OxPzLorkx8BM3q47HiZJ4zb/96vNgOs1pifzcNB2PtjO2EedgEJPp5AFQbwsIdsnUwCz984LA4wmXWZgwanH2M5/c7lPQt/2do7clsmlY9RbQWf5DpxuK/fu27ufiWdcyv8GEqgoZtHsv2s9Pje1tIHqYSQ6bsL4Inm0c19MATrXAdfbF6kdMzkGkIjdabthiMBgmV8lfdbuH/mjty54c8IkxYw+l/Dx4fbHoHr/xfY6WH9K7/iZhQzMbsqVt5igEAk5uyLbrwIPOlpp/dhdSJ8HJsx1/G38+1XUGXC69LFUTGqOPYqTR4fdHoPBMt05RI3j6sGg4JD3eHWBCAsOxAgnH2Sd0smn4c/kA/2xl9w7U9FCprwsgKVIoZDeTkGxWNOGG1SPMpyr1+RSmHu8C1hAp8bFc8NVkh/2WcRyA1/2m3YNhgmIJu/Q+EqyqRRtI+EKO0gSwpP7l2mYojBxBIkuusunWaJUTsXejTG0InjZLoegE48LtRGcfOY68ehF5ZkCoNyLLi48tiLfMGVkCZar7Rwa5ipfQxkeMwU5x+FbVLH9i0U3E+uEsdYj6oW2fcfm9TWhzgIOElmKbHum/NAGJeJM+uIY033RdpkuwZI4UQaar8LCO6BqXPpJ7v0loNkY/6nBi0QwtJ/IFgZcWKLZ0kSru9M+Ob4d4OSODQpdOzrTZX0FflBqQV5oekUioEtYFjy+u9wGpTXTd9U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(316002)(8936002)(47076005)(36860700001)(86362001)(966005)(82310400004)(8676002)(2906002)(2616005)(7696005)(426003)(6666004)(5660300002)(110136005)(508600001)(4326008)(4001150100001)(336012)(70206006)(36756003)(70586007)(81166007)(26005)(83380400001)(186003)(1076003)(356005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 21:21:11.5583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 749b3d8f-86d1-47f8-d5e6-08d9af9056ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5070
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

Fixes for 5.16.

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-11-24

for you to fetch changes up to 692cd92e66ee10597676530573a495dc1d3bec6a:

  drm/amd/display: update bios scratch when setting backlight (2021-11-24 15:14:36 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-11-24:

amdgpu:
- SRIOV fixes
- dma-buf double free fix
- Display fixes for GPU resets
- Fix DSC powergating regression
- GPU TSC fixes
- Interrupt handler overflow fixes
- Endian fix in IP discovery table handling
- Aldebaran ASPM fix
- Fix overclocking regression on older asics
- Backlight/ACPI fix

amdkfd:
- SVM fixes
- VMA removal race fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/gfx10: add wraparound gpu counter check for APUs as well
      drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
      drm/amdgpu/pm: fix powerplay OD interface
      drm/amd/display: update bios scratch when setting backlight

Felix Kuehling (1):
      drm/amdgpu: Fix MMIO HDP flush on SRIOV

Lijo Lazar (1):
      drm/amdgpu: Skip ASPM programming on aldebaran

Nicholas Kazlauskas (3):
      drm/amd/display: Fix DPIA outbox timeout after GPU reset
      drm/amd/display: Set plane update flags for all planes in reset
      drm/amd/display: Reset link encoder assignments for GPU reset

Philip Yang (6):
      drm/amdgpu: IH process reset count when restart
      drm/amdkfd: process exit and retry fault race
      drm/amdkfd: handle VMA remove race
      drm/amdkfd: simplify drain retry fault
      drm/amdgpu: enable Navi 48-bit IH timestamp counter
      drm/amdgpu: enable Navi retry fault wptr overflow

Yang Wang (1):
      drm/amdgpu: fix byteorder error in amdgpu discovery

Yi-Ling Chen (1):
      drm/amd/display: Fixed DSC would not PG after removing DSC stream

shaoyunl (1):
      drm/amdgpu: move kfd post_reset out of reset_sriov function

xinhui pan (1):
      drm/amdgpu: Fix double free of dmabuf

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  12 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  12 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  15 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  46 +++++++--
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |  34 +++----
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 111 +++++++++++++--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  24 ++++-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  20 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  24 ++---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  28 +++---
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  58 ++++++-----
 28 files changed, 279 insertions(+), 186 deletions(-)
