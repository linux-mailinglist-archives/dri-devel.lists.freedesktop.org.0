Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22B83DE08
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2010FBE8;
	Fri, 26 Jan 2024 15:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BE110FBE8;
 Fri, 26 Jan 2024 15:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bieElXL9kgH98927oXjpY5O+RlvQ7BmlV22eqpjcPlkN+wQfEDghPClyrxr+BaMnsNT4plB76tcD2dJCPMu42b+dbbmT3HabSujXWNCjWFWOtWwmf53u2+BAzyNlRw9VzDVlL+2UARv47Wj7TV/4saxPONN5X7FeBpPTITwd8iADo5UJEgaQuGEFh+4QxO9mbg5mLwEyfa41HQIqdXjUY0eL0rbbkOMUvaiTTmHYAjy9KKW0J3AK+E8WiFZtXQ6oKxGhDTRsEnz19ky+PqanDsTk6mrK5xeUSe0WYTFknx0R8/w9K6Kr6z31TUmlR66Kv1k0K2zXIQO+JqPT3o1ECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND5YXrI7/KUyD6sV4ioHID51OXLoPcuh8HMMxaJElpc=;
 b=dHeVA95Un00TjbWYEtkcBlIZgx+wby5ndHz8rLfDOjsGWMZz4KLQWGkClAatfpl3SW409HtZAFx614T0SnEMUbDE/pelfgOVgxt1uEom0fW6FLlD7kPnCJ5HFMxBZ15WdUS/H7kiNvbMv8OTSNVZRVubcGhTcldF9jZMHabQbJaGByAmSrMrFTF6WyHHSdld/S4U7TeVw27XYBjv/uhtyZKhSovWXJbqgNTr09szDW8J2A/Hna7eEXBVyjo2QCp4eN97fFpdmAh5mDnROFqXv0urEg8nZ5QtLRkvX4UYCstd8m1gmnb321h4AxFqOF8Di7sPajOQ+D4l1qB9zLg2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND5YXrI7/KUyD6sV4ioHID51OXLoPcuh8HMMxaJElpc=;
 b=aZy3rF9aepK12T9zWSyTprD4+wykC337Fx42xoS4//03h9LIjXA0/JLGqGSG5459fJlAEH1oUb6m8I+JN+OrzFpHkxU71UeIIlVmNrLXi/5Ph93sIdxL95npdy5h1du4K65s/ZRVPZJuNrOBWzMqlPw5JRrSrrK3xXleXLqMg/E=
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by CH0PR12MB5283.namprd12.prod.outlook.com (2603:10b6:610:d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 15:51:42 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::63) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.8 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:41 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:38 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 8/8] Documentation/gpu: Add Display Core Unit Test
 documentation
Date: Fri, 26 Jan 2024 08:48:08 -0700
Message-ID: <20240126155022.1184856-9-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
References: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CH0PR12MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: 197224d9-d691-40e3-7e98-08dc1e86b0bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3FBHXRxkj2aDQbZ9VydwGkgnxuNCpMLRTPZPyixv9Sr7wwDuWiCH2gGX785Bng8LtYTNWj4Xv1dszvodOsmYeYTL5oI5gUR8CKdkQXBJka8diRRl3dNXWn2JQ6uEdnd+2OVW7kQ86XfGkDbfrEIk2Zt8LQu+Cej+8qJTyHMOLHRhJagQzoTSV9e72x4EtX97e6U0eE11C56bLRp2xRzsfRIodeN3+I83NFz4fJ1GeW3Fsw6eluo091nEzZe2fTpfJgAfVsJm/B/bIFsHotH2k9X/BxRWrwTRz2IVDF+YtLYsMHMf0fqFkknsLu02kNfmR1wwHK4AtPkgE021U9mgYGEolZY7tr9vacEkGghY1XEDiVMwUNnbpRh1TaauR5ZYEBPpVJ4QHJUIzG+1HoQD+fsHm5KAfUY6qfs7/gaxiL4f8CfC0SKo9UldDhiEgpgwghB9BS7/Q0GmQWIBBepKrmb+GQsGv37YInkDR1/NkzYzh0Wd3SPrbzZaMwQQ1A8fXSHk3Nex11f5sKPvls7VpNYdeTdHsjW9yPpY6tZMZKVQKgqc8ApnLcXQcmcdS5xCnLEgna/Wysi4JFdF9MgNtUH2BlbCZa/4dl90Z3h6CId4mzBBiJxby385npjBM33zio2eT0034/7THMiJqbNN8VHwmASpNmTak8CbTizwQ816WHNcpK9qMSbxkYzalwwMttCY6HUqic/xmaDONMhj6AQR3tfWGRTZKk1EN43gvs71uFiY1QpTrAg/o11UUJkAKDNiEx7qXeFm64lSIl/l1cPf25YG6fqK6vHsGYGMc0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(46966006)(40470700004)(36840700001)(921011)(40480700001)(40460700003)(66574015)(6666004)(2616005)(1076003)(26005)(426003)(478600001)(336012)(16526019)(110136005)(86362001)(70206006)(54906003)(70586007)(316002)(4326008)(8676002)(83380400001)(8936002)(47076005)(41300700001)(82740400003)(66899024)(5660300002)(36756003)(356005)(81166007)(36860700001)(7416002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:41.6433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197224d9-d691-40e3-7e98-08dc1e86b0bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5283
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

From: Maíra Canal <mairacanal@riseup.net>

Explain how to run the KUnit tests present in the AMDGPU's Display
Core and clarify which architectures and tools can be used to run
the tests. Moreover, explains how to add new tests to the existing
tests.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../gpu/amdgpu/display/display-test.rst       | 88 +++++++++++++++++++
 Documentation/gpu/amdgpu/display/index.rst    |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst

diff --git a/Documentation/gpu/amdgpu/display/display-test.rst b/Documentation/gpu/amdgpu/display/display-test.rst
new file mode 100644
index 000000000000..a8c136ce87b7
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/display-test.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+========================
+Display Core Unit Tests
+========================
+
+Display core provides a set of unit tests, currently focused on the Display Mode
+Library. The unit tests use KUnit (Kernel Unit Testing Framework), a common
+framework for unit tests within the Linux Kernel.
+
+This section covers the specifics of the tests for the AMDGPU driver. For general
+information about KUnit, please refer to Documentation/dev-tools/kunit/start.rst.
+
+How to run the tests?
+=====================
+
+In order to facilitate running the test suite, a configuration file is present
+in ``drivers/gpu/drm/amd/display/tests/dc/.kunitconfig``. This configuration file
+can be used to run the kunit_tool, a Python script (``tools/testing/kunit/kunit.py``)
+used to configure, build, exec, parse and run tests.
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
+	    --kunitconfig=drivers/gpu/drm/amd/display/tests
+
+Currently, the Display Core Unit Tests are only supported on x86_64.
+
+Moreover, the tests can also be run on real hardware or in other emulation
+environments. To include the Display Core Unit Tests on a deployable kernel,
+you might add the following config options to your ``.config``:
+
+.. code-block:: none
+
+	CONFIG_KUNIT=y
+	CONFIG_AMDGPU=m
+	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_AMD_DC_KUNIT_TEST=y
+	CONFIG_DCE_KUNIT_TEST=y
+	CONFIG_DML_KUNIT_TEST=y
+
+Once the kernel is built and installed, you can load the ``amdgpu`` module
+to run all tests available.
+
+Also, the tests can be added to the kernel as built-in modules, by adding the
+following config options to your ``.config``:
+
+.. code-block:: none
+
+	CONFIG_KUNIT=y
+	CONFIG_AMDGPU=y
+	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_AMD_DC_KUNIT_TEST=y
+	CONFIG_DCE_KUNIT_TEST=y
+	CONFIG_DML_KUNIT_TEST=y
+
+In order to run specific tests, you can check the filter options from KUnit on
+Documentation/dev-tools/kunit/kunit-tool.rst.
+
+How to add new tests?
+=====================
+
+Tests covering different parts of the Display Core are always welcomed. Adding
+a new test is a simple procedure, that consists in creating a unit test file
+and adding the following guard to the end of the tested file when you are
+testing static functions:
+
+.. code-block:: c
+
+	#ifdef CONFIG_MY_KUNIT_TEST
+	#include "my_kunit_test.c"
+	#endif
+
+If you are not testing static functions, you should use the Makefile placed on
+``display/tests``. In order to add a test to the Makefile, you can just add
+the following entry to the Makefile:
+
+.. code-block:: make
+
+	ifdef CONFIG_MY_KUNIT_TEST
+		DC_TESTS += my_kunit_test.o
+	endif
+
+The ``display/tests`` folder replicates the folder hierarchy of the ``display``
+folder, so this must be considered while adding new tests.
+
+More information on how to write unit tests with the KUnit API can be provided
+on Documentation/dev-tools/kunit/api/test.rst.
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index f8a4f53d70d8..9b13f0f3524f 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -29,4 +29,5 @@ table of content:
    dc-debug.rst
    dcn-overview.rst
    mpo-overview.rst
+   display-test.rst
    dc-glossary.rst
-- 
2.43.0

