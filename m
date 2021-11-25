Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEB45DDA6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9BC6E9BA;
	Thu, 25 Nov 2021 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B206E992;
 Thu, 25 Nov 2021 15:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUpBRKZo54FChSFWw+VWlW/McE5ffcKaJdDehKnqqjCYYBzczXIRYGRQreDxsU73oUqgnNpeoyD6YkBr2xU2lIj83F5FIq5tjiuSqYefpnVfYW639tdE60ni9pMpdoXSZEuQj0Xd9jbRl844b3rAwfKT71/GFjnpckniCBC3b9LOVB40fjg7TA3xJrXRsXsrkT4Ekc2NJKhewwFPKVMsiMVYzFlsveFUMkwvSBD1C/AFVUBiYiQvyTLIhE+C0B2rEB4RRT+q/EM0X17fwoGUlKzwtNdZjwAMH9Mb9BlA+s7T+qPqn+9mK8gb7i4gDjOG7uZv84YTn29+9WmrYZ8nHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxXOWAvojSdU/R7I4G/UDTDnFRo5g7eBPwOIjvjdH3E=;
 b=eKBnKEqbh5mQiLlutiTGEG60rdb+MO2bBuWP+MHdff1lXP5B35yok418REMXJ6LGaZBaiwyFh8NaMCn2EnWeN10EcdaSkrEqW1EqcP1kM96dWasfxm3E1pzm2JeXq3iSs4+7rDW8QNspX5LWIuZMXm6rnswsq7VxyG/pUs1xSMxypg7Wl0+0xSoBWbSwGRddfHRWh4oJPb0pHPN04FqWADwQhz6lYdozrB6CtrGMFQuyvP4gzgnOMcfghm5bDJ7ga3kFzinAaqpF1F46/ak6NoIh4a8Eq98MpOoGfwHz4zUjp8Ssq8gUp0AlH+NRj5b5nTsTVel9uo66qPxkN+lUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=bestguesspass action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxXOWAvojSdU/R7I4G/UDTDnFRo5g7eBPwOIjvjdH3E=;
 b=yMdn+hT1vZHyId17SDgOGFT0bPEXxolZJ9u2wdpsBiywFYe/+H0I0MryDAuufmqkLCqvPOJbuUKb2MNJZdXWfWi2yCe0IbmTaSQaeOtn2gcn4Wn7B0r5Bydu0zSRP3xWqEL2GfejXanRSo+KuTYvClS76qKPXhRieSobQvg46n0=
Received: from BN6PR2001CA0041.namprd20.prod.outlook.com
 (2603:10b6:405:16::27) by BY5PR12MB4129.namprd12.prod.outlook.com
 (2603:10b6:a03:213::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 15:39:35 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::40) by BN6PR2001CA0041.outlook.office365.com
 (2603:10b6:405:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:34 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:32 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
Date: Thu, 25 Nov 2021 10:38:25 -0500
Message-ID: <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2525242-b58e-4a92-e4a3-08d9b029c808
X-MS-TrafficTypeDiagnostic: BY5PR12MB4129:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4129193F27C3D0CFFE05CE5498629@BY5PR12MB4129.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avAEM1DLeRt+jrsKqaP4vN/nWE1w/pGRK42uwxettnqjIoqkwBAWu207SlesQFxQglR7Ue0VygT3qKoKGKFJmFguOFxMwCkIy8SNa9XCHY3gcCWe3r4JSD4fMEa5xhcrSIKyCOI09ADaf9eDBYdEDUwsIgeQZclXeG1fIWQBOIR8oQSEPfqBDw6zDfBYeuk6NfZFf24ge3uROLV5uZy5/aaV3g1oQcOA4iJ+4rInqdpy83SYyUBiSaZdTlaUZOSWvM0p1uRebWx4a4gGJUuAP6I1Z27jEl+a22pHbw/wbs4mKCz6nSsXDE5PK7VuvAEEV1thVjikFEeYxtK+e9NE+DvsV8mRirPJRRVjYELkb5OLCDg8iXA5+tYcjEY6P6iJe3L6tsZFvC4Dwhz3Pf8oA8c8KfmX8Pl8hz/8hnEjmqp2zOKXxbRfPPyJFuRrVP9ssTff+10AecXQKheeCg5ltcilZEkI08SuPj9PWLciCjpNwmkrijNi7B/5hfWlVHH0zoNB+NJJo4lrgRxbqaz6o+QmegqxyaTL8C/Hn0rNzFuJUsIOcfIcAUb2pkugup/6VcrtOiskwoXkAi2oMJO4v8ntDrAYvrXBbnQKU3AksMneEekpx/OGt7HLexQGi52nB0hC1vVY+Za/hWpaS2UML2W+ljSxXQQT9jiAkAmp9WhJkin46CHLxDb/FBCrp6c+UUzK3Yghk+Ot2TSxhoWdNsO/IVFfRsOuY8DUzVpkyZAO4/6UepH+jNPnF5N4mo1O
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(5660300002)(316002)(4326008)(6666004)(54906003)(921005)(186003)(426003)(86362001)(36860700001)(70586007)(336012)(7416002)(2616005)(83380400001)(81166007)(82310400004)(8676002)(2906002)(1076003)(110136005)(26005)(70206006)(47076005)(508600001)(36756003)(16526019)(8936002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:34.5359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2525242-b58e-4a92-e4a3-08d9b029c808
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
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
 bhawanpreet.lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core documentation is not well organized, and it is hard to find
information due to the lack of sections. This commit reorganizes the
documentation layout, and it is preparation work for future changes.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
 .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
 Documentation/gpu/drivers.rst                 |  2 +-
 5 files changed, 76 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst

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
diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
new file mode 100644
index 000000000000..bbb8c3fc8eee
--- /dev/null
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
@@ -0,0 +1,4 @@
+Display Core Debug tools
+========================
+
+TODO
diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
new file mode 100644
index 000000000000..3685b3b1ad64
--- /dev/null
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
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
+   amdgpu-dm.rst
+   amdgpu-dc-debug.rst
+
+``Display Core initialized with <version number here>``
diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
new file mode 100644
index 000000000000..7ce31f89d9a0
--- /dev/null
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
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
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..dffe52d837cd 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -5,7 +5,7 @@ GPU Driver Documentation
 .. toctree::
 
    amdgpu
-   amdgpu-dc
+   amdgpu-dc/amdgpu-dc
    i915
    mcde
    meson
-- 
2.25.1

