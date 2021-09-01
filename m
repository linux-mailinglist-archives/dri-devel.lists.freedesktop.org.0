Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5E3FE509
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 23:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EB66E3BB;
	Wed,  1 Sep 2021 21:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44C6E3AC;
 Wed,  1 Sep 2021 21:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0ZGY6ezaQVXpGsZ+olEwrTUo6d9ur6xxzRSjbrlR43N257fZtEvFg/cG5wmoGhC/yaIJ+hqUiy0hNvefehnEn6e5twAMtqXaqCyuUrQ0OBDkSmEJcYT0n8xerFlH/apj7zF80Stw7e35H+GMVG3xN/G0OMvg2ELeB24WbXgzJ1709RyjG5iTeBPDjIUrTyIDmW/er33U8wDLONQQt2Zgfeze5TameI+YLN7qdlAPRMSPi5666eUvN+Z+ZbCQLHG4mRkdnnp4lPd6dhZv4jtFIbGRy6T9qie1lex18gzifi1MmFz9007SNUPLGfz0WdUQuUsz9I282u2nNGMs/ngLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=08NpQy7ThYoGDtyXAN24lRhxfzkGQkbJshQb8NtjDaI=;
 b=NSH2iVxM0Ry40y68j5oM4gglRYrNRL8Vr593EhN1XuhhRQgi+xJflKecwALDlyH21dBA4wjGZ5CFlFu72jfrz9HOY7Fjecr3oLDpGrOadxBKk2qEFRclNLKdoFGDqk3rrRlW/9iAzDKTJG25Mh3B7b1T4DPCW+l+aQ1npvif3wV9X/zkNSmNaBRwFUrajO6MJlMwn51Sneq8lqFxoGjrSSc0TJf1itBI12/NF6biCT+GJRhKXrZILrloJ7kzNADK0saiiloXTMj4bUOtmdAbdULWE9u5WgAMYIoGUbH9aLaJ79jVZy58lTtENYQ2Git7D2zYC+drKm+zXRzOkY5UcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08NpQy7ThYoGDtyXAN24lRhxfzkGQkbJshQb8NtjDaI=;
 b=H06Ph3oxTCSQLdGRmvy3nqIBtM7r/F50f+us8SZ7KL7s1oSML88H+3Xcd+ocwps0uZjz/NYMw9gR5mJG7nWe94tyYuZHdkhyA+o4DooLT3IHPnnK7bTkOon3RoSvN7C/Nega6tjq0pT9wvhBfRAYgNf7EtVhrL2ZsoNWkb531RE=
Received: from BN9P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::35)
 by BYAPR12MB2629.namprd12.prod.outlook.com (2603:10b6:a03:69::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 21:40:29 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::6a) by BN9P220CA0030.outlook.office365.com
 (2603:10b6:408:13e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Wed, 1 Sep 2021 21:40:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 21:40:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 1 Sep
 2021 16:40:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.15
Date: Wed, 1 Sep 2021 17:40:15 -0400
Message-ID: <20210901214015.4488-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902f5cb3-423b-4c13-b886-08d96d911dd8
X-MS-TrafficTypeDiagnostic: BYAPR12MB2629:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2629A598593F7A9B51C792E0F7CD9@BYAPR12MB2629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGp8hFlVCMnbUZIm2mTkqEkT5Pw7osHUp6vGyBfAWD+YDUxiATmvStCetAJ6fHC0ueXDIuqJB2J5b5kJF+P1IMWDqo6yhr2yvbKMUXoXjv8EFksBlVTpn56Jb4kQkdDeG/DIX+ugaqNTv0fF8RkXoDkwOjAxxOf7hXwz7F3K0qnzpRYk6vKhJ/6e7CQwbJiIXMgu/Z51StDDlIe5acxdTZ86mO0VFAbg/XKnKB1ek315NRKkzLZIpy6iQ7UuGWyQhDT4henTZTAfr2ZSYP/1HR+cLpv3hAdRU7Dm+n7z81vvqP8m0wDhg9PckAwq6LIS319zymzXQB17qMY7xgJt5xhAe3BAekZZzzBDaC5wqlRvmqMij4YJdsVsBrapIgUP82p/FUyq3X8oTYOalkCoolEhyhds784UG25ddZo3bPiDz8zvWD15x4qQDKogOWAtmeX8JOvw8isEusqj+h/lCO+rSzPmDZaP+2Fm4ltkxXGadgKlfstq2ibdSvg8MMeCVc2d6LqfW99NhO1Sgn0jFd8yx/sceCMNLxPQUcabYRWkkgdbFw9tbMdwSQaNrFcsgd8txP3nZz1KquG9heA0OmZoiuNsh5CuYnGgAmSJkzMeP03mZImoDI2208ZYkSQQ4+IaqjfxqSDPL6EvemO5X/wkrpcWPW89A6UHKp6phy3pjD8coXVCxXUm2GD8EcRONp5FSsJM5pjr3JXalSZOMU5Q0dPBi/7vh5Htf9Wjz3c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(47076005)(82310400003)(36756003)(70586007)(966005)(426003)(26005)(70206006)(478600001)(1076003)(336012)(6666004)(16526019)(86362001)(5660300002)(83380400001)(186003)(2906002)(8676002)(7696005)(316002)(81166007)(82740400003)(356005)(8936002)(110136005)(36860700001)(2616005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 21:40:28.7633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902f5cb3-423b-4c13-b886-08d96d911dd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2629
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

Hi Dave, Daniel,

Fixes for 5.15.

The following changes since commit 8f0284f190e6a0aa09015090568c03f18288231a:

  Merge tag 'amd-drm-next-5.15-2021-08-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-08-30 09:06:03 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-09-01

for you to fetch changes up to d6043581e1d9d0507a8413a302db0e35c8506e0e:

  drm/amdkfd: drop process ref count when xnack disable (2021-09-01 16:55:09 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-09-01:

amdgpu:
- Misc cleanups, typo fixes
- EEPROM fix
- Add some new PCI IDs
- Scatter/Gather display support for Yellow Carp
- PCIe DPM fix for RKL platforms
- RAS fix

amdkfd:
- SVM fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amd/display: setup system context for APUs

Alex Deucher (1):
      drm/amdgpu: add some additional RDNA2 PCI IDs

Alex Sierra (1):
      drm/amdkfd: drop process ref count when xnack disable

Angus Wang (1):
      drm/amd/display: cleanup idents after a revert

Anson Jacob (1):
      drm/amd/display: Fix memory leak reported by coverity

Colin Ian King (1):
      drm/amdgpu/swsmu: fix spelling mistake "minimun" -> "minimum"

Evan Quan (1):
      drm/amdgpu: reenable BACO support for 699F:C7 polaris12 SKU

Guchun Chen (1):
      drm/amdgpu: stop scheduler when calling hw_fini (v2)

Jiawei Gu (1):
      drm/amdgpu: enable more pm sysfs under SRIOV 1-VF mode

Jing Yangyang (1):
      drm:dcn31: fix boolreturn.cocci warnings

John Clements (1):
      drm/amdgpu: Clear RAS interrupt status on aldebaran

Kees Cook (1):
      drm/amd/pm: And destination bounds checking to struct copy

Koba Ko (1):
      drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform

Lang Yu (1):
      drm/amdgpu: show both cmd id and name when psp cmd failed

Luben Tuikov (2):
      drm/amdgpu: Fixes to returning VBIOS RAS EEPROM address
      drm/amdgpu: Process any VBIOS RAS EEPROM address

Michael Strauss (1):
      drm/amd/display: Initialize lt_settings on instantiation

Nicholas Kazlauskas (1):
      drm/amdgpu: Enable S/G for Yellow Carp

Philip Yang (1):
      drm/amdgpu: fix fdinfo race with process exit

Yifan Zhang (1):
      drm/amdgpu: correct comments in memory type managers

YuBiao Wang (1):
      drm/amd/amdgpu: Add ready_to_reset resp for vega10

xinhui pan (1):
      drm/amdgpu: Fix a deadlock if previous GEM object allocation fails

 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 50 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 17 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         | 11 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 23 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 25 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  6 +--
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |  1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             | 30 ++++++++++---
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  9 +---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  6 +--
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  6 ++-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |  4 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  8 ++--
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            | 24 +++++++++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  6 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  8 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  2 +-
 29 files changed, 198 insertions(+), 94 deletions(-)
