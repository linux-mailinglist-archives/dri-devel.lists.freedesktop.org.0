Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C4446EF3F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC6710E59D;
	Thu,  9 Dec 2021 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B50C10E120;
 Thu,  9 Dec 2021 14:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZjQt08a9QcillTJiqwQck6kSOJnsxshsCE+ARgP2aQLVb5Lz2nUb3BecScELe9QeDhWgaIZt/EL283uwE3yO/OntWTa0S9cIOk1JiAcogPqX1bFvZFc8ntUM2oa/4LvVWnzBw316CXIi6hSUzsUcSjI0E6GbzV4gVydtAc12eFB7+e+N1BDmt/IsITTlNoaagYiOjk/313XI89O2LCs1AstTeQjW+OsHV1ShYaLY1WsMR136Ez4tq2z+XORyCuTNLvcOE0Bd+SWvqeiXbhXUxd5ZxhHMc+hTJ8pJGnvdSXf92U4LJd6axF5//4yfgpwRla1X2/z7rZRjcaYlAKXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=oaez6w+JH5u9ki2tZWOHqXUXjkSCai39oNIHT0unDd7JyIGS5rEOMSY35VeSJxJ/f7kdX44IBykV5md76xZ9f6RgTNIRs6SjWvMkqFDT+Ect3/oM5/Z6emRhzibGZY11TI9H2DQRy5wQyOczZB5KVNbFfEvqzQsW91xVEUzAP/Su0PKklKI1Q5LPKB033nbXp1m2e9RghehRw7+hc5U/HS3cwjUL5hh2Gtt0rIkefKMOXU9smrPAHAFDITa60Iy4S5G9Ek1At8uttmeSXW4jxz9V2BUSFFYKImIXoqVYpN8bpmQ/AtwfmpIagEOCu2x5HcKYYEEsBnJkxKPp8ZJ4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=100ub6arTfq/wD/BSLM4BrY5ns+LLetS6tof79VsWqf0KnVUwufZ+XqbWdLk4+7N2er2OjXbbCQHJyBSIIvlADSFXBxdKJW/sTo9U97wF725w6Ksn1svYjz49Y5iYuJCUVv7NbjlqU7WFCO5p2cNxE1PgPJPgOaymXzUtVHlvGI=
Received: from MWHPR1601CA0017.namprd16.prod.outlook.com
 (2603:10b6:300:da::27) by MWHPR12MB1776.namprd12.prod.outlook.com
 (2603:10b6:300:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 14:21:05 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::78) by MWHPR1601CA0017.outlook.office365.com
 (2603:10b6:300:da::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:05 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:00 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 1/6] Documentation/gpu: Reorganize DC documentation
Date: Thu, 9 Dec 2021 09:20:42 -0500
Message-ID: <20211209142047.728572-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c170da9-19a2-4579-d493-08d9bb1f2324
X-MS-TrafficTypeDiagnostic: MWHPR12MB1776:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1776910703C177D1B37B275698709@MWHPR12MB1776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBCHSjDo9MH3d6lUOG/kyZqysswJ3m+0wq2qYW3b/ya4Nv6AMIQkmfTDpi0blY/polCWoxsbXMtYoEBkKfZ+i6HLM7vbqXyv0E8vt+MfYgitX9H9z2vsrEkKH6X9cQ20mFKzjLgR+osHjD8XF1szRv3vEou+xP3Hka7OgyhqgZQFMyZgvhj43T0Z3O1kfE+k4rSDTBLVxcgEQdkoebz2go3giLF0pGQ0D0JaJLEu0pY0cI2os/8aenpBqbKDgSYArsAOvHDrhsYIPPDXMFRrdpD6+bRhp8wuoRfbJbOI2kyeQCIZuSrI0Q/9ctWcze4YLiVqCPAJW3RwHGMvKTwJNXTtDVdAlZTT6NJG+5lhLdj6LQi3R0y77ks4Gsza1AG/6R/fYUuM6gRUlGkE3LTM/JgZ8XfgrdUvdopzU4t4nZF4UGAClUF2tHhoe03/Hj8NkcfC8dW43yz5M7LMIcz342cOeCjk5IKXXouuMHFnJcPCsMy4l5ymXiE7ivsTIKJTzInqWuyL/kIKYCqsFQySTluYDUoyO0MlRWwnePrVg67LpevW9F4m4Z9Gq0RjCW+3FP0Q0IDladZ6ryl7XPLFFBXMB6CkyZFatxx9uz4aLF8Yd0Qa3WD9vffxoY7YsMz4oN2v8AX/GKJbLJcvOYulQ/D+6C/QDrZN9F1n1hD2Ij7OWYXAm5kJKfUiWZ8/Jnwhr5jjAfX32A+nVpTdsTq1eAgZgbkbOsQDRAhvEX+KwnqomHQBqyVsIQ+lsmWrdfTLT3nZNl2wmj9PRKHCVHAqUwyWwHAx2Fe3GDpH3WHw/uQIP8ee29BUEM3FGXUNv0WG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(81166007)(36756003)(1076003)(6666004)(186003)(47076005)(2906002)(83380400001)(5660300002)(316002)(508600001)(356005)(26005)(36860700001)(426003)(82310400004)(70206006)(70586007)(110136005)(921005)(336012)(7416002)(86362001)(54906003)(8676002)(40460700001)(4326008)(2616005)(16526019)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:05.6085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c170da9-19a2-4579-d493-08d9bb1f2324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1776
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core documentation is not well organized, and it is hard to find
information due to the lack of sections. This commit reorganizes the
documentation layout, and it is preparation work for future changes.

Changes since V1:
- Christian: Group amdgpu documentation together.
- Daniel: Drop redundant amdgpu prefix.
- Jani: Create index pages.
- Yann: Mirror display folder in the documentation.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
 Documentation/gpu/amdgpu/display/dc-debug.rst |  4 +
 .../gpu/amdgpu/display/display-manager.rst    | 42 +++++++++++
 Documentation/gpu/amdgpu/display/index.rst    | 29 ++++++++
 .../gpu/{amdgpu.rst => amdgpu/index.rst}      | 18 ++++-
 Documentation/gpu/drivers.rst                 |  3 +-
 6 files changed, 91 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
 create mode 100644 Documentation/gpu/amdgpu/display/index.rst
 rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (96%)

diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
deleted file mode 100644
index f7ff7e1309de..000000000000
--- a/Documentation/gpu/amdgpu-dc.rst
+++ /dev/null
@@ -1,74 +0,0 @@
-===================================
-drm/amd/display - Display Core (DC)
-===================================
-
-*placeholder - general description of supported platforms, what dc is, etc.*
-
-Because it is partially shared with other operating systems, the Display Core
-Driver is divided in two pieces.
-
-1. **Display Core (DC)** contains the OS-agnostic components. Things like
-   hardware programming and resource management are handled here.
-2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
-   amdgpu base driver and DRM are implemented here.
-
-It doesn't help that the entire package is frequently referred to as DC. But
-with the context in mind, it should be clear.
-
-When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
-supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
-Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
-
-To determine if DC is loaded, search dmesg for the following entry:
-
-``Display Core initialized with <version number here>``
-
-AMDgpu Display Manager
-======================
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: overview
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
-   :internal:
-
-Lifecycle
----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: DM Lifecycle
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: dm_hw_init dm_hw_fini
-
-Interrupts
-----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
-   :doc: overview
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
-   :internal:
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
-
-Atomic Implementation
----------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: atomic
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
-
-Display Core
-============
-
-**WIP**
-
-FreeSync Video
---------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: FreeSync Video
diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
new file mode 100644
index 000000000000..bbb8c3fc8eee
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -0,0 +1,4 @@
+Display Core Debug tools
+========================
+
+TODO
diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
new file mode 100644
index 000000000000..7ce31f89d9a0
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -0,0 +1,42 @@
+======================
+AMDgpu Display Manager
+======================
+
+.. contents:: Table of Contents
+    :depth: 3
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+   :internal:
+
+Lifecycle
+=========
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: DM Lifecycle
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: dm_hw_init dm_hw_fini
+
+Interrupts
+==========
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
+
+Atomic Implementation
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: atomic
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
new file mode 100644
index 000000000000..a443866332ac
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -0,0 +1,29 @@
+===================================
+drm/amd/display - Display Core (DC)
+===================================
+
+*placeholder - general description of supported platforms, what dc is, etc.*
+
+Because it is partially shared with other operating systems, the Display Core
+Driver is divided in two pieces.
+
+1. **Display Core (DC)** contains the OS-agnostic components. Things like
+   hardware programming and resource management are handled here.
+2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
+   amdgpu base driver and DRM are implemented here.
+
+It doesn't help that the entire package is frequently referred to as DC. But
+with the context in mind, it should be clear.
+
+When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
+supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
+Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
+
+To determine if DC is loaded, search dmesg for the following entry:
+
+.. toctree::
+
+   display-manager.rst
+   dc-debug.rst
+
+``Display Core initialized with <version number here>``
diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu/index.rst
similarity index 96%
rename from Documentation/gpu/amdgpu.rst
rename to Documentation/gpu/amdgpu/index.rst
index 8ba72e898099..5c8cbf514097 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -1,6 +1,6 @@
-=========================
+==========================
  drm/amdgpu AMDgpu driver
-=========================
+==========================
 
 The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics Core
 Next (GCN) architecture.
@@ -71,7 +71,7 @@ Interrupt Handling
    :internal:
 
 IP Blocks
-------------------
+---------
 
 .. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
    :doc: IP Blocks
@@ -79,6 +79,18 @@ IP Blocks
 .. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
    :identifiers: amd_ip_block_type amd_ip_funcs
 
+Display Core
+============
+
+This section covers Display core.
+
+.. toctree::
+
+  display/index
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: overview
+
 AMDGPU XGMI Support
 ===================
 
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..3a52f48215a3 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -4,8 +4,7 @@ GPU Driver Documentation
 
 .. toctree::
 
-   amdgpu
-   amdgpu-dc
+   amdgpu/index
    i915
    mcde
    meson
-- 
2.25.1

