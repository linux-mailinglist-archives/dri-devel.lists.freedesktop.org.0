Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43885FD58
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9510E213;
	Thu, 22 Feb 2024 15:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zGwPRS+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523710E1C3;
 Thu, 22 Feb 2024 15:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2CygGJlWIo2sjYrXEpmUDW2lQr///RCpLpKHDIqnIg8edCxVqQJyGfg+0Wf5z66hHRZN57hmDYC2Dj1WRw3fN6YifOyPKo692BPh6nIR00nYY8H270vQ4GzD+SRBQrADHWeeSJv8yPylp2is/9MT7xwCc3yciNWlPWUAgzTNnjC8WWT5j1EShQyZqi/Vd+3IvshsYHsljz4fpkmeQAH4boJ87rGC5JP/Np80WRHrwKqHb7ThuPvNinVW52x4RES5uGz7rDbccSr21RyFWWy40JLRdPKnagwN0VbsaCXXmIwxMVBSmr9O7Ag7WNLNGwVMSE1EP6xW1IjfmBmhlQqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtVy0mxoKFfBcmamfqrV9suOoI5DYdinLuCstijPGRE=;
 b=WNo4k3Z7DBpPU2Wer1nzDZxUGgNFzntAvALkfKo6607/STDaGIi1LJ6bwrO1dsP4zd34+K0cBh0Z/LRRHBRO+Xxki0Uxv86fGI7oduwVz6Ke62/J4zFdbDgURrWnWLASlAvL2WLhARzXXog97jyD4KPfCOmhsBISJPdpGY21r9mFQOk3dip6ikbzrj4iSTOoQCQzB7VVTklBqftNU7AmUnswK1A6pcAKMXqQIPgLk9hoqS8Fuo4Y8nOemmtX4axgPJEOHvcN9aW6BRygEVOo+pcrZT3ZXmCmlSsFI6smqPB/+GQmgyyquKJMegK6rwzD32Y1uCDP8Kh9TpwFz92H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtVy0mxoKFfBcmamfqrV9suOoI5DYdinLuCstijPGRE=;
 b=zGwPRS+pvcxT3Oe7PZTwe+wjqWPCGlN7VY88+a4Wljfn4pNxiYxY6akE0mDggEt8HhTwVMRwwMs8stf18nY61VU2G5AE65PK/bD7bI0Ax3sDWaiZhRu+LLUUFtGP+2d0qmKMJ9etI1NDGiiGopCPFTSr2FiAC5kA/AduHaRmtDU=
Received: from PH0PR07CA0048.namprd07.prod.outlook.com (2603:10b6:510:e::23)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Thu, 22 Feb
 2024 15:58:54 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::26) by PH0PR07CA0048.outlook.office365.com
 (2603:10b6:510:e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 15:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:58:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:58:49 -0600
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
Subject: [PATCH v5 0/8] drm/amd/display: Introduce KUnit to Display Mode
 Library
Date: Thu, 22 Feb 2024 08:56:12 -0700
Message-ID: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddb9fd1-1c4e-4f0a-4253-08dc33bf2b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IeQRX3yeKmtPqwP/JS05up/eeuJu69Ise2ia2PCVTZFaS7PfLHn/8lM/xhEd7EqqRMAhRnFlWYH0OhGg8kJdJp7QszFElZXLyj0zRbglad03fzpazPbNogYr+qW8wABNU6n+hKhFEYYfUugUh4AslcQ0/dplX3lwLMdf8nTYFFMbPNRencr2aiho1jVzb1HMbu2gedFnitk42jyVswr2g+e33ULyLyQHsHLRaRPDuuAiY+bSLmdzqSvtZE1LH6We7SIdAg1puQN/5hfkHQs5MCO3mrcyJjOp2lzVy4RdPsMgjpBvVn07HrvV+yB0Mzt1rEsA9PCq+7jT4uYtRndDqpTLImYblgfVXmKNkQCu/ElCe4rAxFqBJEi8FVXu4Y9aRovDjdhWCmhPMa0643GqHTa4oHpKIfTv2BPH8yar7qUjSaQOPy1EuitYkgnL13vpxnnQoI0/KahBCGxmO8AqzT/TgywK6JwoKUk+iZW0Id3rSoivX5pyEb/Cc0b2WtXXZjYyC9mT7RXLP3843LrA6IW4QWvow9xDSxzGAw1CkYUciKhKC5FNWZvoLI9j0Ml481LWwR8DK9plE6WC2mPmWWHUX1WAJcmWh1ruQwIaJGHLbkgha8xkX91+EiZQ2eWTK1fD1pssbxbaMKXIaS0wzZB33I/lKzwC86UFl1wOVfU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:58:53.5773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddb9fd1-1c4e-4f0a-4253-08dc33bf2b39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

In 2022, we got a great patchset from a GSoC project introducing unit
tests to the amdgpu display. Since version 3, this effort was put on
hold, and now I'm attempting to revive it. I'll add part of the original
cover letter at the bottom of this cover letter, but you can read all
the original messages at:

https://lore.kernel.org/amd-gfx/20220912155919.39877-1-mairacanal@riseup.net/

Changes since V3:
- Rebase and adjust conflicts.
- Rewrite part of the dc_dmub_srv_test to represent a real scenario that
  simulates some parameter configuration for using 4k144 and 4k240
  displays.

Changes since v4:
- Rebase.
- Change the folder organization to better align with the display code.
- Fix the wrong CONFIG used in the FPU code.
- Drop unstable tests.

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
 drivers/gpu/drm/amd/display/Kconfig           |  52 ++
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../dc/dml/dcn20/display_mode_vba_20.c        |   4 +
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 .../drm/amd/display/test/kunit/.kunitconfig   |   9 +
 .../gpu/drm/amd/display/test/kunit/Makefile   |  18 +
 .../test/kunit/dc/basics/fixpt31_32_test.c    | 232 ++++++
 .../display/test/kunit/dc/dc_dmub_srv_test.c  | 159 ++++
 .../test/kunit/dc/dml/calcs/bw_fixed_test.c   | 323 ++++++++
 .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  | 561 +++++++++++++
 .../dc/dml/dcn20/display_mode_vba_20_test.c   | 780 ++++++++++++++++++
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 +++
 .../test/kunit/dc/dml/display_mode_vba_test.c | 741 +++++++++++++++++
 16 files changed, 3101 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/basics/fixpt31_32_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dc_dmub_srv_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/calcs/bw_fixed_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_mode_vba_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/display_mode_vba_test.c

-- 
2.43.0

