Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D677673B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 20:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CEF10E48C;
	Wed,  9 Aug 2023 18:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097F310E485;
 Wed,  9 Aug 2023 18:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlp4Mbohcl90UDDr48cPEIJ/b6aLyVbGHE0yd7aw3aMvm09LJUM2Hbf1kVFarx+sDQClUMWoNMHZL2vivCIVfcxRfMSqKgksgN34jVD2RSUSnD0kqWk3rE/vPefvkz8r4s8zuSIAm4V9k777TYx0Cx4ZVDOLKAG7moXzmQaYsaZrLgg7823YM5bM6rDFG6GErMZwEZMNqpyx/fCA2RJUJJYmXip5I5fX7evAcEbmL/nmpI5NMDif/M5rjcQ2ZdsFbvzicl0+TMgevOtAjxXCKM9J7C/ffI0a216O4LR6Yun2cj+g4npoeHZNqSdQ/8Q3NhyArFYa2flIcvUr9sDJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m61zdj4Slz1GaIPDwq/ULJnNRWwSwonwWGUlBUqqOe8=;
 b=VBEjyO+RGXHFy9ovwY8Q6yXzSNvT5L/4HldONQEwugYbxdxSiL5ra0vAVt6lzEFsMt8y00/tceyzL/b+Vespzr8qQjrb71ajtjc0SVysUjWXjaGWhkueP4QRs4lZtTnyOYFJhOmfcKeOCDPryHye4UgKLynKSg7Ig8h+Xxa5DY+AL7URxCIv3+Eg/mKzjK4vjTs/prIeCScTJVHtIEbZHEnUw5ub0+Hc7oMn9ODQ/aizWDw2yu6Yxj9P/e9b9aa8QcKbhHwid8qW6eYvTOv6IKpCP1J4K0M068K0QXz9dUfm8M4vFR6G8csti7os4pyQsAXCFjNGFNvihxeHF+V/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m61zdj4Slz1GaIPDwq/ULJnNRWwSwonwWGUlBUqqOe8=;
 b=qtvkpyCNIayM5SBcVDyU41rZ3p4Qr/QzMWd5dfVgnZJxEs/36bdr5eh/Pwlt+c2xZZyRKP+pM4YFSoWImmDH97tTudwDo6ycEjr0yjTYSjJ8xSGeAegQL+yv0Xfj70g5FnWrpLXcjIcsQIkGmAk6Opc1AEVsdSrvrmJS/AcKmiE=
Received: from DM6PR13CA0043.namprd13.prod.outlook.com (2603:10b6:5:134::20)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Wed, 9 Aug
 2023 18:29:06 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:134:cafe::54) by DM6PR13CA0043.outlook.office365.com
 (2603:10b6:5:134::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.17 via Frontend
 Transport; Wed, 9 Aug 2023 18:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 9 Aug 2023 18:29:06 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 13:28:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.5
Date: Wed, 9 Aug 2023 14:28:27 -0400
Message-ID: <20230809182827.8135-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dd7292-4c83-41bd-7524-08db990683ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXz8fsRbqzHYrP9pUmQ5OoOlVkjUZjqaD13YhkK9D3/8AzrsGrccbzPajVuH12dTWbGZKUx7Hdvdsn9Jx4UwFElWohgMKQvcChcZZI/EdxFb7T+F+A46mQ2MCJWNPc2TsIDJRkoeNB2VhNviDB5W4eNsWgZS6xytrXyq1UCbYdiMwQAjuL6rV63pCxhWpfpgFEgBIsPs9/si6+N8HT57sntAAbPFYFxLog9br4FIBcUkk3dUXR0v2vFo1zTtSUfJN7b5Qxe0G6DsTZZ+H/rRX4zmtZfv7TFXUBtw+pqByplDPrw6dVVcovz1my817GdzsILwUnbixxbk35HZzBApTWkGksI3bUs1OWTHnK3evlTBZxtJggh5THMPBHoWvEj8OZ2J8fPPMtfLKPFPngUgQWxCAQhD3dqYfSZyWRkuuSFJYEFZGc9TooVgqpBU0DRxLBpI+af5FoXc/s/rZWlgmMflK9oH0R6GjxqJyWwTM1NKZ+3R7omeIZ0VVbmYHjSMf/YQjpbd7X6HCyRA3qQhL1bARIaEgpSVztIse6sILnkHVHJWRdDzWG8rExY+Dbdcs4Xo7EmaT3gW6PtSjRyOoYG7Q0wZbjakNCvmwX1vU7RgsJGbWcU3+YPDid9FMGHSku0mlP11dz/8X1GZh6uVO5rbhwQ5/1RqSkv2uJG2p3rPFaZtC5tz4EqXA93olGDrUGEiXLD1hDVQEEIZHgqbEkMtwypZz2zYwlIcQrOTgyaiOESL9/ZI385yOTLfAfta
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(186006)(82310400008)(1800799006)(451199021)(36840700001)(46966006)(40470700004)(41300700001)(86362001)(8936002)(70206006)(70586007)(2906002)(8676002)(4326008)(356005)(478600001)(316002)(82740400003)(5660300002)(110136005)(6666004)(40460700003)(966005)(7696005)(36860700001)(1076003)(40480700001)(26005)(81166007)(83380400001)(36756003)(47076005)(2616005)(336012)(426003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 18:29:06.0156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dd7292-4c83-41bd-7524-08db990683ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707
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

Fixes for 6.5.  Was on PTO last week, so two weeks worth.

The following changes since commit 52a93d39b17dc7eb98b6aa3edb93943248e03b2f:

  Linux 6.5-rc5 (2023-08-06 15:07:51 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-08-09

for you to fetch changes up to 091ae5473f96ced844af6ba39b94757359b12348:

  drm/amdkfd: disable IOMMUv2 support for Raven (2023-08-09 10:58:40 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-08-09:

amdgpu:
- S/G display workaround for platforms with >= 64G of memory
- S0i3 fix
- SMU 13.0.0 fixes
- Disable SMU 13.x OD features temporarily while the interface is reworked
  to enable additional functionality
- Fix cursor gamma issues on DCN3+
- SMU 13.0.6 fixes
- Fix possible UAF in CS IOCTL
- Polaris display regression fix
- Only enable CP GFX shadowing on SR-IOV

amdkfd:
- Raven/Picasso KFD regression fix

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
      drm/amdgpu/gfx11: only enable CP GFX shadowing on SR-IOV
      drm/amdkfd: ignore crat by default
      drm/amdkfd: disable IOMMUv2 support for KV/CZ
      drm/amdkfd: disable IOMMUv2 support for Raven

Evan Quan (1):
      drm/amd/pm: disable the SMU13 OD feature support temporarily

Kenneth Feng (1):
      drm/amd/pm: correct the pcie width for smu 13.0.0

Lijo Lazar (2):
      drm/amdgpu: Match against exact bootloader status
      drm/amd/pm: Fix SMU v13.0.6 energy reporting

Mario Limonciello (3):
      drm/amd: Disable S/G for APUs when 64GB or more host memory
      drm/amd/display: Don't show stack trace for missing eDP
      drm/amd/display: Fix a regression on Polaris cards

Melissa Wen (1):
      drm/amd/display: check attr flag before set cursor degamma on DCN3+

Tim Huang (1):
      drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 26 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  8 +++++--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 15 +++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  4 ----
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 13 -----------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  8 +------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  5 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  3 ++-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  7 ++++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  4 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 ++++++++++++-----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  5 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 12 +++++++---
 16 files changed, 81 insertions(+), 54 deletions(-)
