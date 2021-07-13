Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F43C71D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A30389ABA;
	Tue, 13 Jul 2021 14:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8A36E0A2;
 Tue, 13 Jul 2021 14:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmBwsPbpbS/sF/Ln7rB2oRUkut2X23NCEhkgNjODNoq/9PnL4UMc1sIi5jjv7Bxni65TKUZtIOBew2QurkwiXbpljKsDEFyaXk6P5okRKtT9WeA48ot1MGYd3p+4iQTqeoshX68cRWrlUVIRlHhPR4a9W+a3Bg0k0AmVf0QsJJoXlGnwhoyNW2V0N2EmBsN7SWYLvh0neyKLHbjbfwykUGBv9UbwmEjO5h3tjGn9SDbw60wxQzfQ0Insro5sRO1Yfe5rexOH8aGmuWUCp0VTtlsnzEAH+LzobEnkW4ElApeQAS3DpKfphjf8cMOL/eVVN6BvdYgTSxX+Z3EuW5JZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd8IIfD0bszQJ/xagT9tftQ6EflpeXEtc1GeoG/ML3U=;
 b=ZYhFv0XbuNHEXsx4gdDeLjRc2ZOgb84sKkTLHL6OSWv59iRKAEmNfzAsDH2qiENn+SjM8GeWZAGPThi/CPf3XoJ8zDmDN7Ye+r3J2dZzK9hi//0jbAUD9LfIiS1R6hiDIL94HIrN0XiT5ID00jB7dFCHzQBY3KWwSbJJBi6Rl111c5VN1Y/UaQmCXXYahyZDxvKuITyY2v16+I/a0oOyfBfs6oCtWX1yHVEQqoB3JKqRBUjRIn+HNs81J2/MZt1VyslCs8O2rnRHzEsmWyY4LM6TNpezVneGsscXALgpDqR6IrVWONLfTxNtlgzQ6b7S96tm8giJS+b1W9/r3bD11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd8IIfD0bszQJ/xagT9tftQ6EflpeXEtc1GeoG/ML3U=;
 b=kCbIGTdMtmmpB84H5Zhkj0ikYq0m7NDQ6RlXI389khUZlPAqMk7j0Bxr22XDQEtUZbfGyu6IiFvHnmj9aeLPKjL9Hgz4lKrDt7SMxIvvP7fWGmB9r9ukmOtjgWvnIRUSdeD8HTgKgiWwXMhBs2yxX7M++Jzcs4T2H2/rXu8C45k=
Received: from MW4PR04CA0222.namprd04.prod.outlook.com (2603:10b6:303:87::17)
 by SN1PR12MB2573.namprd12.prod.outlook.com (2603:10b6:802:2b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 14:06:40 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::c9) by MW4PR04CA0222.outlook.office365.com
 (2603:10b6:303:87::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Tue, 13 Jul 2021 14:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 14:06:40 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 09:06:37 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, <christian.koenig@amd.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <anson.jacob@amd.com>, <hersenxs.wu@amd.com>,
 <jerry.zuo@amd.com>, <sunpeng.li@amd.com>, <aric.cyr@amd.com>
Subject: [PATCH v2 0/4] drm/amd/display: Base changes for isolating FPU
 operation in a single place
Date: Tue, 13 Jul 2021 10:06:08 -0400
Message-ID: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ddf8c9c-1afd-4f7f-2b7d-08d946076fb0
X-MS-TrafficTypeDiagnostic: SN1PR12MB2573:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2573B63DF163975C3A54A38298149@SN1PR12MB2573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+keckb8ExSR4+LIydNjUpZEGfuLI2Fs2UwmH2KftQrfQZErQmqOwMWKyu4FhlY9xojKSGWO5kaQsx+iWvZBeMK8QKbkpldV9DW7bHlAXKd1w5eM8NpMT/lbbiDIim+bZxjjDOiRjHpy0D9FTSYCsZ6g3hv2JQtg627JR8aWRwAHTxtToGuv+25NsMjV7mdV5LPh2aSwYHE1/o/XY9iXb9I+AxIySRd0zcUsa72aw1lHrTtPup15YPqtMMDzRCJATc2WBYyigJl2Wu1gJGFtKjkoWpSeXfaXt23WXRz8NO6YYdVjJcN6tn/2fSiT8jD+PLDe1Lre9x+g3ym5awPHRv5HpHU92BhxQdgLj6tvjxRNObYVfsTOiag+Qmd/FHCyTNhKO9WOMipMR/kjwD3sWQ3c9fif1QA3e8zE2DIXSDnQZSyizqxGBQpDy8mk+VUkk0RIKIP9pnUbjyifOSnMs/E9sTCgux2huPobo15NQGVdfrePWVTzSHczYGL8B06OvdaGE9GsTgi0GjKuyP9LSb/PriTpl+kyY22bUihxzmpRJ+rNq+TD3zFqYsV/dFOkLNL3L2/eQxHt+Jq6ly4Z8GJT6HYwHYaf6jsNJ11coDB0C13NMlkwX7CWqhOcho/4OcMWKSzpBcjBQew2x8Dua6T0IvH3Qt+t+QXE3EAbtxCQ/Lvjln3pTzLaIGqzowLNOgvHWnIYJ3HVITLd4EY3ikxtVO4VyzSwr8jjC86/PaD5MpaPKcKkgJy/1aapM3mh
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(16526019)(1076003)(5660300002)(26005)(186003)(921005)(6636002)(82740400003)(8676002)(82310400003)(2906002)(6666004)(36756003)(478600001)(36860700001)(70586007)(70206006)(86362001)(47076005)(83380400001)(316002)(81166007)(54906003)(336012)(356005)(110136005)(4326008)(2616005)(8936002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:06:40.0468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddf8c9c-1afd-4f7f-2b7d-08d946076fb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In the display core, we utilize floats and doubles units for calculating
modesetting parameters. One side effect of our approach to use double-precision
is the fact that we spread multiple FPU access across our driver, which means
that we can accidentally clobber user space FPU state.

# Challenges

1. Keep in mind that this FPU code is ingrained in our display driver and
performs several crucial tasks. Additionally, we already have multiple
architectures available in the kernel and a large set of users; in other words,
we prefer to avoid a radical approach that might break our user's system.

2. We share our display code with other OSs; thus, we need to maintain the
interoperability between these two systems.

3. We need a mechanism for identifying which function uses FPU registers;
fortunately, Peter Zijlstra wrote a series a couple of months ago where he
introduced an FPU check for objtool. I used the following command for
identifying the potential FPU usage:

 ./tools/objtool/objtool check -Ffa "drivers/gpu/drm/amd/display/dc/ANY_FILE.o"

4. Since our code heavily relies on FPU and the fact that we spread
kernel_fpu_begin/end across multiple functions, we can have some complex
scenarios that will require code refactoring. However, we want to avoid
complicated changes since this is a formula to introduce regressions; we want
something that allows us to fix it in small, safe, and reliable steps.

5. Unfortunately, for legacy reasons, we have some problems in how we program
our FPU access, which in some weird scenarios can generate situations where we
try to enter in the fpu mode multiple times or exit too early.

# Our approach

For trying to solve this problem, we came up with the following strategy:

1. Keep in mind that we are using kernel_fpu_begin/end spread in various areas
and sometimes across multiple functions. If we try to move some of the
functions to an isolated place, we can generate a situation where we can call
the FPU protection more than once, causing multiple warnings. We can deal with
this problem by adding a thin management layer around the kernel_fpu_begin/end
used inside the display.

2. We will need a trace mechanism for this FPU management inside our display
code.

3. After we get the thin layer that manages FPU, we can start to move each
function that uses FPU to a centralized place. Our DQE runs multiple tests in
different ASICs every week; we can take advantage of this to ensure that our
FPU patches work does not introduce any regression. The idea is to work on a
specific part of the code every week (e.g., week 1: DCN2, week 1: DCN2.1,
etc.).

4. Finally, after we can isolate the FPU operations in a single place, we can
altogether remove the FPU flags from other files and eliminate an unnecessary
code introduced to deal with this problem. We can also remove the thin layer
added in the step 3.

# This series

To maintain the interoperability between multiple OSes, we already have a
define named DC_FP_START/END, which is a straightforward wrapper to
kernel_fpu_begin/end in the Linux side. In this series, I decided to expand the
scope of this DC_FP_* wrapper to trace FPU entrance and exit in the display
code, but I also add a mechanism for managing the entrance and exit of
kernel_fpu_begin/end. You can see the details on how I did that in the last two
patches.

I also isolate a simple function that requires FPU access to demonstrate my
strategy for isolating this FPU access in a single place. If this series gets
accepted, the following steps consist of moving all FPU functions weekly until
we isolate everything in the fpu_operation folder.

Changes since V1:
- Use a better name for variables.
- Update documentation.
- Avoid preemption.

* See update details per commit message

Best Regards
Rodrigo Siqueira

Rodrigo Siqueira (4):
  drm/amd/display: Introduce FPU directory inside DC
  drm/amd/display: Add FPU event trace
  drm/amd/display: Add control mechanism for FPU utilization
  drm/amd/display: Add DC_FP helper to check FPU state

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  24 ++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 114 ++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  34 ++++++
 drivers/gpu/drm/amd/display/dc/Makefile       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  41 +------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |   2 +
 .../amd/display/dc/fpu_operations/Makefile    |  58 +++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 104 ++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h |  33 +++++
 drivers/gpu/drm/amd/display/dc/os_types.h     |   6 +-
 13 files changed, 382 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

-- 
2.25.1

