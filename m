Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914D3D6B48
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095476E824;
	Tue, 27 Jul 2021 00:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2073.outbound.protection.outlook.com [40.107.95.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE86E824;
 Tue, 27 Jul 2021 00:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl1iWfECDNSPEaj4WlZhqBq8+I7aO7djrTj2DK2Mt9a1l/bE7n0yWc24MpryIVLL1WkGe/IwgcTFBGhrEssQ3E+rSlSmsujpbPEJU4rYsAzDIylq4tT9I1IvO9LZ2L8ks7ijiQWWTrNLookSzcWBl/D0quJoED9jk1qqqAXUreRik205PGvbkhicaMkEGLZtTUgQMQc1ftyy7lbI+xRK5MsWcesyyW/6Af+1dVj0gQy3ezhW9fIJsyJ4mKLDEqkD/P63zqSy+hGYKHtSwJfPJGg7nPw9bZqoOnlNbu1ciX6/h1XdwqSo9Noev8BHmFPmttQfURgYUItCQM4CLpFfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntxb2useW3uGdBbeir2Fx2sJXz7I+893rJNeBSgriS0=;
 b=LtbnyneZCKOEYQvud8zWRUDN+ou74pybKAKkKkzsqYxODLTPlVoCy2w/MDZ3aYy0Mb9qDng01+HREd3vYMR0pXOg+aN8l4wONLhUdzI21ai4wr/FLPCXMyohz0XTMgGkUA6VpcGIlI2jpT9LsRdNNSWLtOS58Iw6UcuC3dul0e5OIwFxTkU3VML79A0qH+M43bnYFOuUD1jzUYBYH2QyvMR+j0nuG6t9BwmiilAy/GjvkDrPgkj7bAPG0/kygnQHr3Bb5lhGbCjBQMXqFWYbH5NoB8bDuRIPXOR4Sw2fdECcsgQhq6SMExgf1jYsOgDp1UA6gfiTx6JqfkY4NTUgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntxb2useW3uGdBbeir2Fx2sJXz7I+893rJNeBSgriS0=;
 b=ciRkMAZm50f837pUk30oNezV5JCliCu6fV2PHYgnsaofeMFSHTTbYoxPbifC0juUEIIexPHogi6DWS9AGzfD67j8kPBtS+5ITi6NDdQFzQi9B4ywVU8nPKwz54/BdWAOXIsxOiiIZo7OGyVsxySIxgu24U+l6Gg1ASOgr75I69U=
Received: from DM5PR07CA0160.namprd07.prod.outlook.com (2603:10b6:3:ee::26) by
 BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Tue, 27 Jul
 2021 00:53:03 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::8e) by DM5PR07CA0160.outlook.office365.com
 (2603:10b6:3:ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Tue, 27 Jul 2021 00:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 00:53:03 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 19:53:02 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <roman.li@amd.com>
Subject: [PATCH v4 0/4] drm/amd/display: Introduce FPU directory inside DC
Date: Mon, 26 Jul 2021 20:52:44 -0400
Message-ID: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac46c838-e7bb-4925-6f03-08d95098e3bb
X-MS-TrafficTypeDiagnostic: BY5PR12MB4291:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4291E50CF1F09486CAD915ED98E99@BY5PR12MB4291.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiDnrjEjGCtX/3q+VH0HSbm5vgNUzetuZ8nmnVAG6s8hwS0HsLY4vQ1VaDNVxmlbUfKWX26gcTpQvkIf0+aUl7DbhFqh8tkJN4BtMZaJ5yetoyD3yHqpZNsmtFORZI5f/u6Btuoj9TUkqIdE9cGKmLsHOe9Pc8I4bngiOc8v7bYGmINaYcT4FHAuBA6XbQKYQhPL/VEh1Rz3Kt78PiFQtfQ5aNpZJvT3f4DnbY7QReoX/9MNHWDjb2tGa4XSBm2+iBXOJc3dVsWFxZb5mKGTOeLsQ6ytRDhJ1HzZB4xmoyaBuB0Laur5kuAclhsA75cy+18TJGecnuFNRXW8ph1pj9jfSEDeBSqmvLoMdOZHoV2nMw069tbsa/ZyaHwYI1GlFeBi/DxxOjwc+ojXx8x7MaxjXpicYjSkXhgr6MCy4xJlLdIL6P6kzIAy9CBHLBFcjzAGEgR9HsLrF7XJ9OxE9+SwfOMJLpvbS7KLslKVLw7j1Eul5UC7bQQUTQMdY+a6SqLn998UmiljiE+vU3EWw2h6w0fz77Tt80UXipTdYoxAgO68X+JAxTfzumBlTDXzXCox4WirklnaEu59dLK9FNhNHbr+f3RIEJX+JvBRux5mC5xDdeCDs3SasWAwPP3qm22zX+XaJ2CwIg4Hdppee0luhbKdrFElFeEmrI9GhWudflZ/Gn9OS11TtmoK3v25yMpKDUYnRW4BE0u9mCtNiDVDuJp5oMWJLpbk8/ZVYao=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(16526019)(186003)(47076005)(8676002)(4326008)(426003)(1076003)(36860700001)(110136005)(26005)(508600001)(6666004)(6636002)(8936002)(316002)(2616005)(356005)(2906002)(83380400001)(81166007)(36756003)(5660300002)(70206006)(66574015)(336012)(70586007)(82310400003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 00:53:03.4629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac46c838-e7bb-4925-6f03-08d95098e3bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
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
Cc: Peter Zijlstra <peterz@infradead.org>, Qingqing
 Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
we isolate everything in the DML folder.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>

Change Since V3:
- Use DML as the FPU folder instead create a new folder
- Add a proper guard to x86 and PPC64

Change Since V2:
- Make sure to compile FPU operation only when DCN is enabled
  (officially, we only enable it for x86).
- Check cross-compile with ARM and x86_32. Everything looks fine.
- Avoid call this_cpu_* operations between get/put_cpu_ptr.
- Fix GCC warnings.
- Update documentation.
- Update our assert mechanism.
- Remove unnecessary wrappers.

Changes since V1:
- Use a better name for variables.
- Update documentation.
- Avoid preemption.

* See update details per commit message

Rodrigo Siqueira (4):
  drm/amd/display: Move specific DCN2x code that uses FPU to DML
  drm/amd/display: Add control mechanism for FPU
  drm/amd/display: Add control mechanism for FPU utilization
  drm/amd/display: Add DC_FP helper to check FPU state

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  24 +++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 144 ++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  34 +++++
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  41 +----
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |   2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |   4 +
 .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c  | 102 +++++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h  |  34 +++++
 drivers/gpu/drm/amd/display/dc/os_types.h     |  35 +----
 12 files changed, 358 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h

-- 
2.25.1

