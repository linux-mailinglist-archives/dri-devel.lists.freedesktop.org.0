Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56C7B3F3A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EB410E0BE;
	Sat, 30 Sep 2023 08:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674510E0A0;
 Sat, 30 Sep 2023 08:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlL0XyAXfnl5Nim7cWbrnYNLoucsY8zdq8RwVSiD00I4a7vLITc6ZSwnpeTQzlIEKkdsUJuMk5O1LY717otYwcgFWm1NnWBfE/LbOIbc7TANwvXoI87hIWMOiEwoicMBQsXzJTwKbNOJD/gJcuI8neUcvkatoooVlCdU7ScexrMoTefGOO/1GrmqaLM2AUak+8hZkr+IePwkL4sbYjkr4gN3vg20jq/cESdnPbJxaBYG/lRuzyKOI2eh8FQ8YJJCsBRgJbsNq/eACFTn4riLBnU1zMZpFzSVC9fODfv4tIjtC06eOl9QD4ePNNVuJ4vrMax+514SlrxR0QHRiF+OPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xznw8yEABrK66G1ndabmW3NPXz0h1ZdAS56RH8cQQDQ=;
 b=iwI1tN7HW0384owlnNgvskv1oCKIV2dHH7WsXncFQyCDYPNfVAWQJ1tZ8DmGv8y6QRw3aPm/YHm0Q9NbiGVZcwNwmsEp9vaEZOKKIsZ+BMDKhs9M+JJ8qL3/GQelEWiUYNHZQjFskxSAG1wifvFdfCqTVYRNbKjnTPmyp3V/PJqO4ww6WDnnMBkKQjktbzs2sMr1gFp8+CxrG58HDxcSMU5gYBTIr30GKvYtlJOlM+/JKq/Ga/QAD0AaM6RIw6Ys6U518lmh/QofEQezWTOgv+5znLzhYrpg+wGAt6Z+2ADi+H0ZmkmhOkt52f56FATlB248DJrPb6Zce2C32qeWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xznw8yEABrK66G1ndabmW3NPXz0h1ZdAS56RH8cQQDQ=;
 b=LNyRwOoLYIZHBvODpDWPbWJiEjHBc+dbTlLR/+27febITRfEs0HmcLZZmT0UHD+wDWBzRvwenOQGDgTgX2QZ3KGPpquH421CB9Aul3SiEP4FTLWcHeO1JMRKVivKEVxSh6UllFey6376DbJVCKfbw4BpQUpX/239Sg8z5ERxnT0=
Received: from BL1PR13CA0063.namprd13.prod.outlook.com (2603:10b6:208:2b8::8)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Sat, 30 Sep
 2023 08:38:16 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::f3) by BL1PR13CA0063.outlook.office365.com
 (2603:10b6:208:2b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.17 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 00/16] Introduce PMF Smart PC Solution Builder Feature
Date: Sat, 30 Sep 2023 14:06:59 +0530
Message-ID: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b09adbc-1861-4b93-aa09-08dbc19096d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3tkbdPDaPNF2mw71ZEKoZkkYVJ+SthkseTctEbGRg2wp77wp8+0SaQ6hPb0c1xpGKX51oWTcH/GA44tKs2692BIt0QlDNMCSDYmzSMa1+PcbWXgc0Nk+5dpg1McrZjC4fAox6J5EQ6K2ucvWXWjP2/WswVsHi6j7jP7BOaR74traavrbCqH91Fu1MA5BCt6LZOmTAG0CoOxqkIHARlJh1dqW1XjHAvRLKqJIxSbwpY5PXM5QpvdA1Wj48YzAn/5cPUny7eD6/UoeO0iSOM2y9H381bEjesOrZQ7AW7FhrEW3ArHLNZ3C1xUVi8oce3erTAbS1glxMkZOkgsF84ROfqVBw0dCQQ3l1GPQCq5t1iVoSpVY48ewt9BlGqlhRAksndspd18ZAwNNmq44bKZ7TsswWd7htKcYsX9WglRsSCYPYQrh7XsFrNvu+FkV73l8qUxxooIokugv/dLSPr8MYSZXVoV61YTj75hhRo1Vo04PRFrgRJDbh7PRfzBoT5nwyN9xoGuMItWfUd8FcyQ7k4FMWq4Loygn5gGUik9ywUo49eZNfh5+DgZtOxxakcdco99zIQfVsm81wBlAzA5aw9+0pfGOUyFGtOrl3oi+0+Z/mnZd0t+QrgryBhHfiWGyPh5fYJr6rxY2bZixDZWTP4NZokldGyEeNflUDWsLy7UI4US3dRacXp6wL0QyGF07oS7uA9WWdRDRpnSNeMx/MlFCDOy+zEAcsVUyE4wzp4LoDR8O70LsLhNqCNqEw+OUAQulrAzKv8Ej2x/4Hjp1/7SinmQfBt4QSa4JwHc7qQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(336012)(426003)(2616005)(1076003)(16526019)(26005)(36860700001)(81166007)(921005)(356005)(82740400003)(86362001)(36756003)(40480700001)(83380400001)(40460700003)(47076005)(316002)(54906003)(4326008)(8676002)(8936002)(5660300002)(41300700001)(70586007)(70206006)(110136005)(2906002)(7416002)(7696005)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:15.2559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b09adbc-1861-4b93-aa09-08dbc19096d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
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

V1->v2:
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
 drivers/platform/x86/amd/pmf/core.c           |  52 +-
 drivers/platform/x86/amd/pmf/pmf.h            | 201 +++++++
 drivers/platform/x86/amd/pmf/spc.c            | 197 +++++++
 drivers/platform/x86/amd/pmf/sps.c            |   2 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 515 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  55 ++
 19 files changed, 1317 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1

