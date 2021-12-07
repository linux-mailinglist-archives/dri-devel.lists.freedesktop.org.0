Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062F646BE48
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A27B7A7;
	Tue,  7 Dec 2021 14:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D2A7B7AE;
 Tue,  7 Dec 2021 14:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb/bCQ1A49OW/+ic0nXCNiTOtanFmdBBwUcZIHjPq7suiY3yQ/ANYYM6U/f9zmjPdErqHdm+oSd87K9VezvgAxXc3kRjW3n5UoDQ8HDNyVvwc9XOGMebKSmBlcAk66rUnOzkpVTvjpiExl8It7HYmqqnstvwzS0zvVw1Ni6sQ3eFpVA4mVUuLTUun9+zHcl0v1Rjbaee3e5GX24PNGVXnrpFTaZQqK1JO2epWZ49eHTep8xURnduDTtCSxkv0eu7LsOBn6Dm39JmGjlo6P9iIM9keOLB32YiOSB+Dfw2mK+m1rpzhjbuPLItLXMnAPf2O4rVsXWTrpcqn2buEsY18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=Cr05SVhp1HKBqz4Mie95PN48vbXH9gXK8qt96IRpqwde0LicJ1eoJqKZR+y7xFAJ5A54H4RN7uZZ7Q8G2Sr+4On96CacUpOXGartD/TW/DnZ8UF/qP/hT6FlNAIwd+mRjqH1M67zUv5Ga5K/6lZoehUKb9BNWXxBaPVfkz/7sEC78BWx+PB1q157yj4sKQD094SVI/TUVtWqvIslh4y4OSSCFieXzRNiDVuf6viDsCoX5bIIo+aRRwKdzvlemwqWOJeWDwDE4/aPHO6ZRptpbyqG0nUUzyroDHtz2JYqJqABZVjgmiP5AjOpX9iZ8FleJKZpwKMte8pfZFm6dmDcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=KGbVbd9bRmaclkbgttEPrref4SPjk4n9HNU539zvuVzKwu2EDge1YxrO6hAAxTms+SZvUUWh4dU9bcL1axOcg4jWezwno7/7BzmNMZfh0tXcsAL6cl/SlkyTZkmwURENyJ7ceh6TdWXAr/36rBLEqi6mpdiast33HGeY+/7PF+U=
Received: from DM6PR13CA0011.namprd13.prod.outlook.com (2603:10b6:5:bc::24) by
 MN2PR12MB3502.namprd12.prod.outlook.com (2603:10b6:208:c9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.22; Tue, 7 Dec 2021 14:54:12 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::71) by DM6PR13CA0011.outlook.office365.com
 (2603:10b6:5:bc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.7 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:12 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:10 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 1/6] Documentation/gpu: Reorganize DC documentation
Date: Tue, 7 Dec 2021 09:53:45 -0500
Message-ID: <20211207145350.286037-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
References: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c34107ab-43f9-44a9-703d-08d9b9916e63
X-MS-TrafficTypeDiagnostic: MN2PR12MB3502:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3502BA8EF7E35A1B3EFD3D2A986E9@MN2PR12MB3502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1kZnTcFXJduIUwpFPkwQV4YJLele2u9lOplmPW65m2Lb8P9h7fl+i9g3ST91c1zVIMd1qeZ+EcnCac+JX4lwubSFo7gMlMnFFGksRJugO1RHcIRKCQOCAXCnIItrGqT+JpSai2gE38IOL93WvecMA4bhOc35CFou/hssM/KPSspWdxeytajlv7q479fq90WJNuzEn//bH04aEYIe1aTIfg8KQHTBuokYJRUfp/LfxgQtiqPW7Gzs6nplepyGSO1MzpVk+dr6MhCj2dgS72IF+SEpJOdvh70u0GKYwgaNIJIdsPzcpEYtj2MO1T3O8UoZXx4QJxuebI+zRxaKuC3WV8cPVvk1J/FgTpLLkQnuxo7Ii5CsLCwovlmsS+fOorulVGkS3GFIBkjFuq5Rzi+gm7NR6vUwZnbsLX5xap5G+3OgMrFX6jybyPtwS9MXAf96r7GrsIX6vl9tOqVCgjDqrHwCzpnYgAza7QhN6rE6hOVICir2h7l9ll14xnLqicysHhfTBhlF0e2/PZTONYA7BZAXpXelFueU4HKCeERkSrtv0gkk7rVXPtJNZgdCQTiz1dXFjCrK98e2jDBfsLL6+O3OTgk26Oy+l+kYtawn7pseNurYVJWcCa+dktgW/CIuQ10G7Gn7dyEh0bw/Qm9sXGBuCPOBhtwub8paDrtOs7ZsP2mqBjyhbY/nVF4x7kZkA0rEJ+DVOd/5qFaVL4EyUer/YO5zqwTDGK5FnYwCu7Cr6CxeA9/E2D815CNQNV3mjWvc/QeEYzTHs75JMbJj6uzG6nXW5WdHnEH1v4QHqm+WJWJhKRvfVxI0wJ7Q3yAT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(70586007)(47076005)(81166007)(36756003)(70206006)(54906003)(921005)(36860700001)(316002)(110136005)(8676002)(8936002)(356005)(2906002)(7416002)(6666004)(4326008)(82310400004)(426003)(2616005)(508600001)(83380400001)(1076003)(5660300002)(16526019)(186003)(336012)(26005)(86362001)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:12.2105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34107ab-43f9-44a9-703d-08d9b9916e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
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

