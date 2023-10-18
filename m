Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D437CD4E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416CD10E38D;
	Wed, 18 Oct 2023 07:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3310E38B;
 Wed, 18 Oct 2023 07:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0vTvX9dWNKm5YYKbfqadLfFpPBeI/+Q2npPVlEBlEM2x1apCGVdUAcBhelXCWrBpapjLltffNfSr/d1TS4Txo2opaytS4W8c1vlocUT8ZduzZIFR/Xf5lm2yQbg6nXbbBXo9lXj0XPZNr5g5ANhO4lpMWEcsdonFMljn9yrGK0LYpydn3z80/U5roVelfi1C1xPnQQ4SgzjIWniWN54fm4tWLgqgxik0kPscvLbkGVhrw3+61AjJIlww09Zkq6GwFtbRj1riXAjtVmx7YlAv9gTeXwohvXXA2S86iayqkr8HyWoKGCJCs4k0SkOi7LW6y5qUdFGqpaHXzZEen/ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STcZrRhdXwtv0iL5z7IUNvXVV6BoUAwkRHZnBFbmtVw=;
 b=OSAVgVJNX5gcAyb+3DFntihfsH8DVg/7uWWqICPIEaGyj8bd+hoY7pRXll95XroyN/IRhBNoBk20mAamESBw4FqK/sfNSOIhdEKXHBl++hVetVEK7h9aS1Qk6XQZlF/JDeV6PPGbzaS8um8ZLr29qQtqZKesv5ZtsUZvY0G5C/hEaKyj0XVZiC2NQz4gr4XA5sfj4BvDZFaHAA8ts3hXQqu1G1wlU6zob62z/AJeUn+IUyWhr4pUhzeXbuzJTS//2QMo4++HrXIFO/h7iqdeHxUJ+UdfHbKOgkG1TtYfQT83DhKOqw2KwC0A3P218rNAAUZdTJO/380OMrUeUXiqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STcZrRhdXwtv0iL5z7IUNvXVV6BoUAwkRHZnBFbmtVw=;
 b=VG8CpAD5Lx3so3e8mCsqzrjMo4BypCiexzpz3YTcIBHbulMr+1PpE8NQuoFU616vvIA90fm9+UZ2fTJW/GFWg3c2AvgSonLgOyWHkQBhp+B5pfGFwooynuDIjXvGU2jm7o4Kj6tRavDEPGEtSuknl+xuAu1qiYobkC42haNY8K4=
Received: from BYAPR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:74::25)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 18 Oct
 2023 07:03:59 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:a03:74:cafe::f0) by BYAPR05CA0048.outlook.office365.com
 (2603:10b6:a03:74::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:03:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:03:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 00/17] Introduce PMF Smart PC Solution Builder Feature
Date: Wed, 18 Oct 2023 12:32:24 +0530
Message-ID: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|CH2PR12MB4134:EE_
X-MS-Office365-Filtering-Correlation-Id: 57061321-f537-4e03-f2b1-08dbcfa8669a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCvep6duwTF5pH5akdwTKB4nejHVyovYcswG8NtpScXDKEGooI+2ABuqxr17fJ02sKEpSAGY87iJRQLUGu/jU7wE3VktcN1GAhMQ8cinIVM/0vLC7uT+BX4H+HUT4lwWT9HUAG4cyXz843MrqWZP8HI+/APMGtWvAxPo3eH9gLgcPOuzGhKzg6o0j6NQ0Go8QnemI2GupltEuu+NQg2xI6oIUB1IcWTLrh9XXYl13oRBwLXpWjaoptobRRLPnFlYOd1J0tNQUL+hgX5mhWhNvXhB0w9b2DUnACDD27DQnd9aL7HYawB3U0D0svjxGMbrn4xFqVf9nHw83hblaZHuuAmuC//pqNUCB5VoHFud9wIelW3yRotQXT2VGZ1w0VqQbKPhfO3rEK38agL8XW3chrRk5cKKYzLTyI+6weVNE4jJuTyTw0tBbafAvnBnHQMkwPrEdixYwlEBMbRbjwQr6eIMBxgEs4Y0OzbsP0BFRbPX6RYrJNsKlCg8y+zTKRqRf3akG0SvsIZap97CnITGi9QQuctpDscUSVBgv9QA4fiB5jBGrhrNzgM0xPSpDARz9MbLs9F+nAKp6kqDKBg9qsZTZMfmiEXCu3IYQiKA8nY4WGhOnBwIX03cy2GmqrFEKhviYnBRMKcxFBM3Mb/DUFkLdaSmR8fSm6JaHJkRxgkB4r2F2eJ2ZIndm4wRwtEufacXCvh0/dYii6+n1so/gPJJDFAdHhHJr9yOm7xTvhBCi4wcopEtanjv0mF9NOiLgFCfvUCqiVQ+MUoxrs7a6nwqBC94jxSRonYzcd0yM8U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(336012)(426003)(26005)(1076003)(81166007)(2616005)(16526019)(54906003)(36860700001)(6666004)(47076005)(316002)(41300700001)(7416002)(921005)(70206006)(110136005)(356005)(5660300002)(4326008)(86362001)(8676002)(70586007)(36756003)(40480700001)(82740400003)(478600001)(83380400001)(8936002)(7696005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:03:58.5161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57061321-f537-4e03-f2b1-08dbcfa8669a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smart PC Solutions Builder allows for OEM to define a large number of
custom system states to dynamically switch to. The system states are
referred to as policies, and multiple policies can be loaded onto the
system at any given time, however only one policy can be active at a
given time.

Policy is a combination of PMF input and output capabilities. The inputs
are the incoming information from the other kernel subsystems like LID
state, Sensor info, GPU info etc and the actions are the updating the 
power limits of SMU etc.

The policy binary is signed and encrypted by a special key from AMD. This
policy binary shall have the inputs and outputs which the OEMs can build
for the platform customization that can enhance the user experience and
system behavior.

This series adds the initial support for Smart PC solution to PMF driver.

Note that, on platforms where CnQF and Smart PC is advertised, Smart PC
shall have higher precedence and same applies for Auto Mode.

v3->v4:
---------
- Split v3 9/16 into 2 patches, that addresses using generic fn names
- Add softdep [Ilpo] instead of request_module()
- return proper ACPI status [Mario]
- Update comments in code [Mario]
- Remove missed double _ remarks
- handle battery status branches [Ilpo]
- Address KASAN problems 

v2->v3:
---------
- Remove pci_get_device() for getting gpu handle
- add .suspend handler for pmf driver
- remove unwanted type caste
- Align comments, spaces etc.
- add wrapper for print_hex_dump_debug()
- Remove lkp tags in commit-msg
- Add macros for magic numbers
- use right format specifiers for printing
- propagate error codes back to the caller
- remove unwanted comments


v1->v2:
---------
- Remove __func__ macros
- Remove manual function names inside prints
- Handle tee_shm_get_va() failure
- Remove double _
- Add meaningful prints
- pass amd_pmf_set_dram_addr() failure errors
- Add more information to commit messages
- use right format specifiers
- use devm_ioremap() instead of ioremap()
- address unsigned long vs u32 problems
- Fix lkp reported issues
- Add amd_pmf_remove_pb() to remove the debugfs files created(if any).
- Make amd_pmf_open_pb() as static.
- Add cooling device APIs for controlling amdgpu backlight
- handle amd_pmf_apply_policies() failures
- Split v1 14/15 into 2 patches further
- use linux/units.h for better handling
- add "depends on" AMD_SFH_HID for interaction with SFH
- other cosmetic remarks

Basavaraj Natikar (3):
  HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS

Shyam Sundar S K (14):
  platform/x86/amd/pmf: Add PMF TEE interface
  platform/x86/amd/pmf: Add support for PMF-TA interaction
  platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
  platform/x86/amd/pmf: Add support for PMF Policy Binary
  platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
  platform/x86/amd/pmf: Add support to get inputs from other subsystems
  platform/x86/amd/pmf: Add support update p3t limit
  platform/x86/amd/pmf: Add support to update system state
  platform/x86/amd/pmf: Make source_as_str() as non-static
  platform/x86/amd/pmf: Add facility to dump TA inputs
  platform/x86/amd/pmf: Add capability to sideload of policy binary
  platform/x86/amd/pmf: dump policy binary data
  platform/x86/amd/pmf: Add PMF-AMDGPU get interface
  platform/x86/amd/pmf: Add PMF-AMDGPU set interface

 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/pmf.rst             |  24 +
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c       | 156 ++++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   6 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  22 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  17 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  48 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |   3 +
 drivers/platform/x86/amd/pmf/Makefile         |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c           |  37 ++
 drivers/platform/x86/amd/pmf/core.c           |  64 ++-
 drivers/platform/x86/amd/pmf/pmf.h            | 208 +++++++
 drivers/platform/x86/amd/pmf/spc.c            | 198 +++++++
 drivers/platform/x86/amd/pmf/sps.c            |   5 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 508 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  55 ++
 19 files changed, 1331 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1

