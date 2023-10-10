Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CB7BFBFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDBE10E33F;
	Tue, 10 Oct 2023 12:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EC310E33F;
 Tue, 10 Oct 2023 12:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfyYsFdNiPkXjhxLuQA9aSX8wjv8gBg+/BLN3+7C7uXLh7umCAMX86AET3VP22YIi7J69X2QZCjvOQkgfAxIBnYxn8qwG6GUSM3HGhd23BfsXJhTS+OLYtcaSh1vi1ibpq1k/7EzdNqRj7cW0qr1D9nUII2D4M5SF7zGEZrZiA2xL7aWt9Jefq7GWcUXZqjCTZ3FfJS3NQa9LTgHjr5NLo0qJ3FW309mK3V4F1VxLTJoRkMmq3DIKSyJnBG2WXht53BxCPQdacm2fpu1BoMLxg/+6CqGTaupF3BTCgM5f2C5CZ21B+cY7d/ecGdhj7Fkc9cLW4mUoKheje3Vv25/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkQgEkgJLFAS5jwaoPsD4qITFssizLRJDWY7g/AFAHU=;
 b=W0v0OaTLzszLtQb0AYjbhbjsKfDbuqa4M+lVDjCJxA6N7Cc8t7s00n3XHgWMKrXCy64q32l/IalpxEeLNsdJ4jHqp9Bszbvq9BsNbw4bRakrGbRW1fChQk3dQqC3g3LfkEMBy88WfokGgpfvhtTb2n6u3tlwtuNT9aWhw4G0olMziEbONDtdiE+ZQIQOzBFSi3tGQ5h0yJ5eidQkC2KJ77WCiiaKr3zxWgWWwAE2SMVF55D4BosLjJ+S0wZvv3zjZrkHNmFBbYwsItV5/dLgg2gM0RnYW20XZ7v50MZJUQaNWNrgIrBNZ/jxA23gqfRlpy80QohDRrS+mr+lRl1cow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkQgEkgJLFAS5jwaoPsD4qITFssizLRJDWY7g/AFAHU=;
 b=scHBtaGeNQ5ByA3RpFAoQfaZFJ3g+hRIihH9Pyj5OkDDN7DijDzGRQ207TYo2aPq/UxbHjsOBd8nQFPknhdZRuzGtF9HiCmnp+0aXHe8VoLDWhQLcwsoT/++pqTn0Eqt7fqZwf6jiDSDTycrLITrnVtPPPoIPf1pU4m0wdqq6OE=
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Tue, 10 Oct
 2023 12:59:42 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::94) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Tue, 10 Oct 2023 12:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:59:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:59:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 00/16] Introduce PMF Smart PC Solution Builder Feature
Date: Tue, 10 Oct 2023 18:29:01 +0530
Message-ID: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea318f1-4529-43d1-6c77-08dbc990c4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUVShyUtuwXtVZvj0dgqjZen3roPzt4GEzk3emQLlZJlioK2jffKOdqqpYTPpqSssKE9ruO5vJ/CEpJv3q/MDpBihE3ql431NHWOe9aIyLIlUGhuHqal2eso8Cyz04C98RUJtKm5wNTuk2ryQTcXBo8ysgp5a6ndaitmb3HgY2KsnhG+5zSbCAQWGkvJmeL8bHm2qGdWoipipFkRu1WQADYWWDIqDjx3QsyLTs53Mh9Yfsppmd6UpLy4Tj2jkle4zF+seBhmKzRx8GxrJLfhZ1WUThQIdacA9rIJOmEI4uF47F/Ufywqr7dq3zZP68zXhaWT9Rc/WldjJ7RVtz3eKczT7dV3FivHLvSNsL19W4ZstuIVe2PuBKCf8yli/YTR6i+q6HJOsoTPXPC58CQz68QXYMo/3dnka65r5+OM1XeECR5TNJ5ebz6JpvzkhVrg5AHt/IkPbj7HtLHobTv/xAMZrERqvrjdOYZVBsUOD1G9axeH2DSaL3/OQelkPI0D71uPWYAOqICAwDeIV6zRtXePJHLCmFG4lFkmrGv3mq9d8ZG6EejvbN0jALdsRK1OA3LlCq4oLvaS46O3mfcinE+vtcdhijBzFw80+2dVnTf7AjAVoe0tJ6eA4T0n2pfF8RnnwcBMPpzuDhc7wKUFYmtYZ3C0GO7AWBd+TFdSAO1lS8zign0dytRUw4ZFFlUGZzLKXBIC+biVoSe4KZOGUqU50Sper/AcRUptCZH3dG0wEAunbZBh/xeQXpFsu732h5hWUAyTUgjeCMuHuV7QPBxKJifSTZHFAJel7Zd057Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(83380400001)(426003)(2616005)(336012)(1076003)(5660300002)(16526019)(36860700001)(26005)(70586007)(7416002)(47076005)(110136005)(70206006)(316002)(54906003)(8676002)(41300700001)(7696005)(478600001)(8936002)(82740400003)(4326008)(6666004)(2906002)(36756003)(81166007)(86362001)(356005)(921005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:59:41.9273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea318f1-4529-43d1-6c77-08dbc990c4f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257
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

Shyam Sundar S K (13):
  platform/x86/amd/pmf: Add PMF TEE interface
  platform/x86/amd/pmf: Add support PMF-TA interaction
  platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
  platform/x86/amd/pmf: Add support for PMF Policy Binary
  platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
  platform/x86/amd/pmf: Add support to get inputs from other subsystems
  platform/x86/amd/pmf: Add support update p3t limit
  platform/x86/amd/pmf: Add support to update system state
  platform/x86/amd/pmf: Add facility to dump TA inputs
  platform/x86/amd/pmf: Add capability to sideload of policy binary
  platform/x86/amd/pmf: dump policy binary data
  platform/x86/amd/pmf: Add PMF-AMDGPU get interface
  platform/x86/amd/pmf: Add PMF-AMDGPU set interface

 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/pmf.rst             |  25 +
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c       | 154 ++++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   6 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  22 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  17 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  48 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |   3 +
 drivers/platform/x86/amd/pmf/Makefile         |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c           |  37 ++
 drivers/platform/x86/amd/pmf/core.c           |  68 ++-
 drivers/platform/x86/amd/pmf/pmf.h            | 202 +++++++
 drivers/platform/x86/amd/pmf/spc.c            | 197 +++++++
 drivers/platform/x86/amd/pmf/sps.c            |   2 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 507 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  55 ++
 19 files changed, 1324 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1

