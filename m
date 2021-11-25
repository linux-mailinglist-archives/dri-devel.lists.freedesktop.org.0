Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3C45DDAC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FDA6E9E5;
	Thu, 25 Nov 2021 15:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2049.outbound.protection.outlook.com [40.107.102.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DDB6EA46;
 Thu, 25 Nov 2021 15:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmKWtdgXafL8ElFrvAiQlYCzNA0rdajP7vq5NgnvzPBemEFvsp3d67Djr1Zv77hfJ+3b1SSfuGqY1gULrnjqor52Csbj9lO2XPbgD3KJ8L4omDhL5wN/dGWmYYgakx1GsBgjAGquVAddnsWyde0YHqnigLW55PyrOO8g1jz2KZ1caK9yb7tZmlfSuoLTkot3zmDw2n5mMaX6ADBiOHpXFHxw5c/u5cC5x4Uh59YU1ZS2MiGU3bp5o8AegqT6ul4P6GfHzPPhgb1n70rlZ3GcNjR5XAY2q/pgxf/gDbSVoNXFOw+xw0sXD/Lt4/yvQB59H9F4bbd09B1vI9Bl7sWKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teXe7xsG9s3DyEDrBq7uUgxzUFjwEwKXcwGZV8sHmJs=;
 b=TUKzoysPBE1iFhHd638cvhzXpnm0AhRUA6xm3n8aETS/bzvzDJ/vdOsQroIlk5wZ4A5EbIGbvAlrP3fFQhFReUCW7xzgn60HlAzvkAM3NdU/wsfFS1oDDh8ljhq7HlT3Wtoeq0KnwRPw/sYmUdO43xL6y2na9l8FihHwaoioc7j2mKBCtAHlZ37GENcfjsqx8yFM5Xi3B8r8K1yE3ocgdeRzWLxT0dFnbhRTW0O5P0QwREGG25dpuQhtYLLw7ZfsprtLeMng8zwyaelbyxSZZotA6Tn1xX4DPuDAAXMRdvo/4RN2LuajsOXlz+wToQWbL93BOawQ/lyIStoi8PkZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teXe7xsG9s3DyEDrBq7uUgxzUFjwEwKXcwGZV8sHmJs=;
 b=gWV/+Iu7FryLVYdv/mMtpfyrzzwPpzCiHFIvBCI1sONQA41sYVp+mf8HdfZUhNFUeH/I/jYTBqqtUCqWhuV2C9o5hCUUtgTplizTrNabjm1IuoNL1tKgdou2Dhryq5K5mAKuAZEGjG/eVkFJoUtQnLq8j0kI/xe1toy0hPn53nI=
Received: from BN9P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::33)
 by BN8PR12MB3521.namprd12.prod.outlook.com (2603:10b6:408:9f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 15:39:41 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::63) by BN9P221CA0006.outlook.office365.com
 (2603:10b6:408:10a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:41 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:39 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 6/6] Documentation/gpu: Add DC glossary
Date: Thu, 25 Nov 2021 10:38:30 -0500
Message-ID: <20211125153830.1352994-7-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f530cb89-cee4-497b-e68b-08d9b029cc4a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3521:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35210B8DA2D850299272721198629@BN8PR12MB3521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKPF3ux+fGiB/WTcVmxIUyxtoGk/isXFc+zdFN2Kz+b+RCWWLKOjuu7Rlz0rD1DV924cm4WOYa45foxK32CieLpdmZTtZCcDa8GQv11Y3/4X+aj0z3yhfEDJ9ULqUkR3qm0NAqK0huwWZXYnjK5O6TA++pHYniSFa4dry933WQw5pfopgi3r8rujeQqyXwOll79hknRWjXOJLura3gU9zpcCukIUT5Q/EitadWoz+XlUTM2EN6Vh/EE8Ar/iZpjvdXxGJfBnUO7TuS8PFelr/CB7kl+rO+ZP9els8tMywrw4WMIEutrOQCHFnKbYu7aSC0y5TgXiVurXCbcj4ePmmLJ+JLT2iFaxE2wwsZSuhDY+x40eTdrFlThpBmYU6BEC40wH2PlsvPIarP0KYhxEiXP7kapjVyuLsOzwsJPQ4RNO3eZM55R5PiMnIlna62FEAXQauxgR99jtp2V1UleY+LfhJUDGY3Ot9rqZvJUPKuHriSywDulBVxskY8+FBNjJG6yAfUBTf1EVIynKI+N1u9uk2VKVevurd5Vii2kqU7SF4hhrlSZd57HxtGa3+VUf1WmbWhHwC/7kkrKt0ID8Pj+c47wV9Pe2XdtrPPZt4EZms6BHajRh/q3oSsd+Ckps/N6zfEndr8D37a1L3rJ0XYGOB2mUEiu2v9658XHjXNPOuhB2rKd/Y91N6WHCs31dAoGQ5kBhGHrCB7rivYFkEoDKbHOb/ahn8b9bDztSqI+6D3Znzp2kBD4pzCBLLSOa
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(110136005)(316002)(54906003)(82310400004)(921005)(81166007)(4326008)(2616005)(36860700001)(426003)(7416002)(2906002)(26005)(16526019)(186003)(336012)(47076005)(8936002)(70206006)(36756003)(356005)(83380400001)(86362001)(70586007)(8676002)(6666004)(5660300002)(508600001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:41.6795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f530cb89-cee4-497b-e68b-08d9b029cc4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3521
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

In the DC driver, we have multiple acronyms that are not obvious most of
the time. This commit introduces a DC glossary in order to make it
easier to navigate through our driver.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst   |   2 +-
 Documentation/gpu/amdgpu-dc/dc-glossary.rst | 257 ++++++++++++++++++++
 2 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/amdgpu-dc/dc-glossary.rst

diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
index 2e45e83d9a2a..15405c43786a 100644
--- a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
@@ -26,4 +26,4 @@ table of content:
    amdgpu-dcn-overview.rst
    amdgpu-dm.rst
    amdgpu-dc-debug.rst
-
+   dc-glossary.rst
diff --git a/Documentation/gpu/amdgpu-dc/dc-glossary.rst b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
new file mode 100644
index 000000000000..48698fc1799f
--- /dev/null
+++ b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
@@ -0,0 +1,257 @@
+===========
+DC Glossary
+===========
+
+.. glossary::
+
+    ABM
+      Adaptive Backlight Modulation
+
+    APU
+      Accelerated Processing Unit
+
+    ASIC
+      Application-Specific Integrated Circuit
+
+    ASSR
+      Alternate Scrambler Seed Reset
+
+    AZ
+      Azalia (HD audio DMA engine)
+
+    BPC
+      Bits Per Colour/Component
+
+    BPP
+      Bits Per Pixel
+
+    Clocks
+      * PCLK: Pixel Clock
+      * SYMCLK: Symbol Clock
+      * SOCCLK: GPU Engine Clock
+      * DISPCLK: Display Clock
+      * DPPCLK: DPP Clock
+      * DCFCLK: Display Controller Fabric Clock
+      * REFCLK: Real Time Reference Clock
+      * PPLL: Pixel PLL
+      * FCLK: Fabric Clock
+      * MCLK: Memory Clock
+      * CPLIB: Content Protection Library
+
+    CRC
+      Cyclic Redundancy Check
+
+    CRTC
+      Cathode Ray Tube Controller - commonly called "Controller" - Generates
+      raw stream of pixels, clocked at pixel clock
+
+    CVT
+      Coordinated Video Timings
+
+    DAL
+      Display Abstraction layer
+
+    DC (Software)
+      Display Core
+
+    DC (Hardware)
+      Display Controller
+
+    DCC
+      Delta Colour Compression
+
+    DCE
+      Display Controller Engine
+
+    DCHUB
+      Display Controller Hub
+
+    ARB
+      Arbiter
+
+    VTG
+      Vertical Timing Generator
+
+    DCN
+      Display Core Next
+
+    DCCG
+      Display Clock Generator block
+
+    DDC
+      Display Data Channel
+
+    DFS
+      Digital Frequency Synthesizer
+
+    DIO
+      Display IO
+
+    DPP
+      Display Pipes and Planes
+
+    DSC
+      Display Stream Compression (Reduce the amount of bits to represent pixel
+      count while at the same pixel clock)
+
+    dGPU
+      discrete GPU
+
+    DMIF
+      Display Memory Interface
+
+    DML
+      Display Mode Library
+
+    DMCU
+      Display Micro Controller Unit
+
+    DMCUB
+      Display Micro-Controller Unit, version B
+
+    DPCD
+      DisplayPort Configuration Data
+
+    DPM(S)
+      Display Power Management (Signaling)
+
+    DRR
+      Dynamic Refresh Rate
+
+    DWB
+      Display writeback
+
+    ECP
+      Enhanced Content Protection
+
+    FB
+      Frame Buffer
+
+    FBC
+      Frame Buffer Compression
+
+    FEC
+      Forward Error Correction
+
+    FRL
+      Fixed Rate Link
+
+    GCO
+      Graphical Controller Object
+
+    GMC
+      Graphic Memory Controller
+
+    GSL
+      Global Swap Lock
+
+    iGPU
+      integrated GPU
+
+    IH
+      Interrupt Handler
+
+    ISR
+      Interrupt Service Request
+
+    ISV
+      Independent Software Vendor
+
+    KMD
+      Kernel Mode Driver
+
+    LB
+      Line Buffer
+
+    LFC
+      Low Framerate Compensation
+
+    LTTPR
+      Link Training Tunable Phy Repeater
+
+    LUT
+      Lookup Table
+
+    MALL
+      Memory Access at Last Level
+
+    MC
+      Memory Controller
+
+    MPC
+      Multiple pipes and plane combine
+
+    MPO
+      Multi Plane Overlay
+
+    MST
+      Multi Stream Transport
+
+    NBP State
+      Northbridge Power State
+
+    NBIO
+      North Bridge Input/Output
+
+    ODM
+      Output Data Mapping
+
+    OPM
+      Output Protection Manager
+
+    OPP
+      Output Plane Processor
+
+    OPTC
+      Output Pipe Timing Combiner
+
+    OTG
+      Output Timing Generator
+
+    PCON
+      Power Controller
+
+    PGFSM
+      Power Gate Finite State Machine
+
+    PPLib
+      PowerPlay Library
+
+    PSR
+      Panel Self Refresh
+
+    SCL
+      Scaler
+
+    SDP
+      Scalable Data Port
+
+    SMU
+      System Management Unit
+
+    SLS
+      Single Large Surface
+
+    SST
+      Single Stream Transport
+
+    TMDS
+      Transition-Minimized Differential Signaling
+
+    TMZ
+      Trusted Memory Zone
+
+    TTU
+      Time to Underflow
+
+    VRR
+      Variable Refresh Rate
+
+    UVD
+      Unified Video Decoder
+
+    VCE
+      Video Compression Engine
+
+    VCN
+      Video Codec Next
-- 
2.25.1

