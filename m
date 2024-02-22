Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D7885FD69
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274510E9AC;
	Thu, 22 Feb 2024 15:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rtfPl72U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7915F10E9A4;
 Thu, 22 Feb 2024 15:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq/lmBcVg3qZSyjiGx3fqIjokFmxqJNn8pnRQKHNrz9NyEjLVq93Ty54GwzP5qGkxSZfBFwtmBAjJC4bjGx5IHL/XYop4Lc7WBPG3bKLqArws8DIYAnqZD8XYz63HC6u/kDkdLfwxs6eNHz+p/QetONYvI9/wnJA+YOXs/Wj+5//GK4g2w8Qiri+jLo6XDEl36driVnAdlAiyyT318oAwdMXXG4JjCB0J6ebtm64z1jFD6WBPWRyntCqt2V1oVsUTtPbTHjZfbPIVgY0MByZTOTwAAaukSiHLiPKLMij6eDfdhbB8a8YTwkwLgjoueNsNVBW8gmK8WnBZideY0dg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVbrci4nt5hqcszVy2yN/aUSRYEICcA9XWed4U2e5PY=;
 b=cx00r1/SglcnFbwT5wwoCXaHLgmmqPjzUySh43Nh6VqpED+Dl1PkCVN3p7/MNT3G2scB8Y/vNjLtcfYeRtf+2zkpWVOqBfzZb0NlgTPHf7288HfTmDC6BQhDbDovYLHLpgekndh67xLh8IIEe8x8Rwi9Tfglo5kXdJwJ8Dz/zhlo03Z06veQ0+3UK2iPD5c7IFMrN8QSkgZoqhUc0nmNWB1npa3GuGu9qUjxo4WQUzrYQp94GUrdGXSLLYN4ILoMaxwsROyGJs4aDMQnaruG4apl47OE9r8FV1Q+XT5oABSFGRT4gK50lXjWopi8Mex2h/MoIjpTOpMCJjSCRDp6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVbrci4nt5hqcszVy2yN/aUSRYEICcA9XWed4U2e5PY=;
 b=rtfPl72UZ51BznpTfAMuGbRZDHzF0u0ZjVq3ORMGo1rZqvL9bg3IS2szxyLcGpFlqxk4tceLtJXEltJ+HtOg3Z3plYdlW/9vm4aeqRZk1gOKA+oKga8/Qa7w7/yv4it3IOn6LDT72LEmt/2EbhP8vVdLcqj8HrL2RSi4SS75RS8=
Received: from SN7PR04CA0097.namprd04.prod.outlook.com (2603:10b6:806:122::12)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 15:59:16 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:122:cafe::38) by SN7PR04CA0097.outlook.office365.com
 (2603:10b6:806:122::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42 via Frontend
 Transport; Thu, 22 Feb 2024 15:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:59:15 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:59:12 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
CC: <kunit-dev@googlegroups.com>, <tales.aparecida@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <mwen@igalia.com>, <mairacanal@riseup.net>,
 <dri-devel@lists.freedesktop.org>, Isabella Basso <isabbasso@riseup.net>,
 <andrealmeid@riseup.net>, Trevor Woerner <twoerner@gmail.com>,
 <javierm@redhat.com>
Subject: [PATCH v5 8/8] Documentation/gpu: Add Display Core Unit Test
 documentation
Date: Thu, 22 Feb 2024 08:56:20 -0700
Message-ID: <20240222155811.44096-9-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9383d1e9-f2fe-4e46-23b3-08dc33bf388a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VMiEao5lEHN6V3MA9CpGqps1f4zDmhc4MGNpYwngHtWorTB/0l9KhGgMVwv3wDxb8UIpT0kOUPCXk5FzTEVksNJDFmptR0Vw21he1mYaV8U93yQNKoCyEa54wPVFWR6dV68wXSJes2G9dc2IR7qjFdWlGZsQqOF+Qm78LrZIc+NPtG7gY+YNxXxYZgE6xH3xkVbWhl5j8zMI4geH6BoFV08zTLu2BpGS3tp9W8gYyw8hl2BInbaQNu8f0F16NhfiTm0VDiOizWBOw6OffMlcpO80OlvhVi334HJsa5vtRV0oQyyBarSSvY8q29rEkxdhswBHTWODdI34c/50N8wqF3j6WHRojIn+rN7XcR4k6zfj2MHej9lVoI5EcwGaqYSGRUOkMT0cu3X8rXOyn5zSp94p2ELTbI8KLCnj45h/N9XdOARS5LYq6gDOcuZmpTDV+T1VMlommFKJN6cBCAD6WcONamKFTHkHqBQkNHLgh7P/lIoYwi90vfzdoIehi8lQkmKSjpAV5ilYLiYlOJYzY+RPXKy5hMKxd2fPdCkDzcCBWxyA+lIMicSBUq1PTmmKJaLoM4/b/mapMb3vWDGQZAuzJTR3Pwp6Wa1MHqXq4QtMJpUQPxNkDeTKgnlmZ5IGFCfFK7j5U47pkzL3osmYWF3/amvt5AGdW7JKjTycXI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:59:15.9333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9383d1e9-f2fe-4e46-23b3-08dc33bf388a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286
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
index f0c342e00a39..e5895e658943 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -92,5 +92,6 @@ table of content:
    dcn-blocks.rst
    mpo-overview.rst
    dc-debug.rst
+   display-test.rst
    display-contributing.rst
    dc-glossary.rst
-- 
2.43.0

