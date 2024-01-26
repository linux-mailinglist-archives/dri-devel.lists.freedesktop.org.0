Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2683DDF6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C1D10FBBF;
	Fri, 26 Jan 2024 15:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAA010FBC3;
 Fri, 26 Jan 2024 15:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSFhbn7/qYTP4bZ717OMC7whugSzcTelJfvTQ/LUhWGrC1UHEDIbO6g4K+JcK4VWcsKG2AnZFNofgQ5VHek7UEwnbpeQ0yTbpNzdEqCN7W/mYPW0lmDcxzH9jDMq3QAxmSWKyDE3xx6TQiMn92FiwkH2LuH3KcOY/Wu3FFghTrYKTmrtd8SMhFQyAarmrhWBMYDI/Lx40lvCPeQNO4b+yhEHPmBt18iAOrlifygRdUsu1vcnL8EdttmbldswNKb0ty93cHcDoWw/jB3pShNzZS/mFQFUsUq127FEcH+M9ryc9wBD7ZtrvLEWZQwsdyK1Q/CPJaghnE0aMOuE3k2jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUAyLfXzindIFO4uMNngxc60X87I31pCpT+qbGbJgOU=;
 b=UJAlEEmrwhf7h8DBj7ICPkFzF4dlVo++SlU0WUINj/0926HTHm8tZ8bU2tA+FrcI/tytMm2C5/KgsfYLEzLsouITxiLqDBzn/JdD1o7Ujx16cKjaCIYxgkISFGT7BOTOUU5pxnzapz3MnovuOG4m8E7mW9kUTZhuaaj3bp4tfbioUrNglux1N6IxZOrKtvHkAOE5LzLQIuA6BCSRn3I0cLUO25x/lKJbfN93nRLUpOJyIu2jq6zy1YoB+FpsIF5ZzcKsUbe6CP2GjlKDekqwSWUWvshOyRC3PMU7KttLtSbkygbUqVtqtRrckq5F0VhATNfTvuJ0NQp/zofQkqor6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUAyLfXzindIFO4uMNngxc60X87I31pCpT+qbGbJgOU=;
 b=0D05KNC8JiYAitRMKD36Mg7dqnU/HOkMlIhuikn/M8K6amZIbARET5D42p2DLZA9Fh8MXxwegm8vauylOYFu6jM/RDPnY9KyxBC9S7k4nN9Sxvmx2TYjiJGmM6kmfM48gzBmyMsyJqe6EMj/xtPMJAOxPZgmnxqMn/Xm69CTVEw=
Received: from SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 15:51:22 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::b1) by SJ0PR03CA0070.outlook.office365.com
 (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:19 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:15 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 0/8] drm/amd/display: Introduce KUnit to Display Mode
 Library
Date: Fri, 26 Jan 2024 08:48:00 -0700
Message-ID: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c120d5f-f084-4ac5-de2f-08dc1e86a3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /G+HCNEL52myAV+noUfcNRStOfy2jptIy7YdgeGPRq7q82ywRAsZ/6dWURBasClY1CX1hpTLrIlwjIZa0lCdJe5EbFRHwZ0Hzb3NQKVKkyrg/K43onfI1kkkudec1QoB4nregM8EnY4FpIm55mkHjVoh3Mbf7bQQdbyGFVTnrRN7gxUX5Eta9WfmTFyrusYSof2mKd7QVrTmc1+TSMejq8P/rPzzB9YZ0h/H88nIUQpHdoqud6Vz9kYuKkyj76+sPnmn4cheVkHsfM3iRmLtzHEIQ3g6tXQN+gUyv2A9u9ZptWJHeQdY6QUHeUglALo2n3rsuSAqMngSWiXl3sRgIIxAUY/6Uqf8rNUxn1mU25Q5TuidIsR2q816axfliORwP/aojwlw8SOUwKZiyQJBPipnEEx0Ua5DRq7Lil5U6xt23JKVn3GzcPA9G3UAycV8WYTgQJC+wAMkPELQe2/z6hS6tBo7onQCxFqpFTISgqAs/7eijuE4N7aH0/3CF6z2xqewf+3lAx0gURZBNlDuE/47gFzIj1OXv3XfDiJNzx3fIMBg9j0YS+Kes8sHJ/4KnLLtl1N4tutai11Tj1+n78zoPI3CTkkQBluyqAZsVrCJMwJwlsJ6b0CIUQxXZEy+YDXTBm5F1TJw4gCtcKf7zcJUChHIZzKw3uyvSLhN8RfCUBJoiZmTuI61tdcN+ww6Cys4+ANPOxeNkXb4X1Hy78+oacen+FBySqP6u2Owimd7/0Uz2V4xqHNJOeKpUXvhHl8YWUxcK1+sLkFH/O+Dbg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(70586007)(2616005)(40480700001)(1076003)(6666004)(70206006)(5660300002)(110136005)(54906003)(66574015)(426003)(336012)(26005)(16526019)(966005)(40460700003)(478600001)(83380400001)(316002)(4326008)(81166007)(66899024)(36756003)(2906002)(8676002)(356005)(86362001)(47076005)(41300700001)(36860700001)(8936002)(921011)(82740400003)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:19.7240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c120d5f-f084-4ac5-de2f-08dc1e86a3ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524
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
Cc: tales.aparecida@gmail.com, Trevor Woerner <twoerner@gmail.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In 2022, we got a great patchset from a GSoC project introducing unit
tests to the amdgpu display. Since version 3, this effort was put on
hold, and now I'm attempting to revive it. I'll add part of the original
cover letter at the bottom of this cover letter, but you can read all
the original messages at:

https://lore.kernel.org/amd-gfx/20220912155919.39877-1-mairacanal@riseup.net/

Anyway, this new version changes are:
- Rebase and adjust conflicts.
- Rewrite part of the dc_dmub_srv_test to represent a real scenario that
  simulates some parameter configuration for using 4k144 and 4k240
  displays.

Thanks
Siqueira

Original cover letter

Hello,

This series is version 3 of the introduction of unit testing to the
AMDPGU driver [1].

Our main goal is to bring unit testing to the AMD display driver; in
particular, we'll focus on the Display Mode Library (DML) for DCN2.0,
DMUB, and some of the DCE functions. This implementation intends to
help developers to recognize bugs before they are merged into the
mainline and also makes it possible for future code refactors of the
AMD display driver.

For the implementation of the tests, we decided to go with the Kernel
Unit Testing Framework (KUnit). KUnit makes it possible to run test
suites on kernel boot or load the tests as a module. It reports all test
case results through a TAP (Test Anything Protocol) in the kernel log.
Moreover, KUnit unifies the test structure and provides tools to
simplify the testing for developers and CI systems.

In regards to CI pipelines, we believe kunit_tool [2] provides
ease of use, but we are also working on integrating KUnit into IGT [3].

Since the second version, we've chosen a mix of approaches to integrate
KUnit tests into amdgpu:
    1. Tests that use static functions are included through guards [4].
    2. Tests without static functions are included through a Makefile.

We understand that testing static functions is not ideal, but taking into
consideration that this driver relies heavily on static functions with
complex behavior which would benefit from unit testing, otherwise, black-box
tested through public functions with dozens of arguments and sometimes high
cyclomatic complexity.

The first seven patches represent what we intend to do for the rest of the
DML modules: systematic testing of the DML functions, especially mathematically
complicated functions. Also, it shows how simple it is to add new tests to the DML.

Among the tests, we highlight the dcn20_fpu_test, which, had it existed
then, could catch the defects introduced to dcn20_fpu.c by 8861c27a6c [5]
later fixed by 9ad5d02c2a [6].

In this series, there's also an example of how unit tests can help avoid
regressions and keep track of changes in behavior.

[..]

Isabella Basso (1):
  drm/amd/display: Introduce KUnit tests to display_rq_dlg_calc_20

Magali Lemes (1):
  drm/amd/display: Introduce KUnit tests for dcn20_fpu

Maíra Canal (5):
  drm/amd/display: Introduce KUnit tests to the bw_fixed library
  drm/amd/display: Introduce KUnit tests to the display_mode_vba library
  drm/amd/display: Introduce KUnit to dcn20/display_mode_vba_20 library
  drm/amd/display: Introduce KUnit tests to dc_dmub_srv library
  Documentation/gpu: Add Display Core Unit Test documentation

Tales Aparecida (1):
  drm/amd/display: Introduce KUnit tests for fixed31_32 library

 .../gpu/amdgpu/display/display-test.rst       |  88 ++
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 drivers/gpu/drm/amd/display/Kconfig           |  52 +
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../dc/dml/dcn20/display_mode_vba_20.c        |   4 +
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 drivers/gpu/drm/amd/display/tests/Makefile    |  18 +
 .../display/tests/dc/basics/fixpt31_32_test.c | 232 +++++
 .../amd/display/tests/dc/dc_dmub_srv_test.c   | 159 ++++
 .../tests/dc/dml/calcs/bw_fixed_test.c        | 323 +++++++
 .../tests/dc/dml/dcn20/dcn20_fpu_test.c       | 561 +++++++++++
 .../dc/dml/dcn20/display_mode_vba_20_test.c   | 888 ++++++++++++++++++
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 +++
 .../tests/dc/dml/display_mode_vba_test.c      | 741 +++++++++++++++
 15 files changed, 3200 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst
 create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c

-- 
2.43.0

