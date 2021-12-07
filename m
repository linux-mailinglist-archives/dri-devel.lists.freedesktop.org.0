Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D046BE3A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9F6EAA2;
	Tue,  7 Dec 2021 14:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C06EAA2;
 Tue,  7 Dec 2021 14:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzgDr8c7zNX5MEvL+yc19xPD2ZjeIH/WDFsm7thmRAcfdZ/bXD4nj8NK+53VHrkKzRehM8G2v3jHamGUVF+kXOIgVy/LueKBKBIYSITpQXtejwdAIL6ah4zVS333fA7tjHEooSZB1J7QsfZbdv5FM2BGWrmqWQQfL989GqeX5WkHW4VVfH50O89JejD+3XKKeXjapmSJHpFkmHKmqcLYYGH1qMeyWEKH0BokLbqsXn6rUodBvpHUxAq8xdD6mdkBClQfO9/wSrk7FWUcsjhhHni5fh5cqOGwcymbDBJtPBAribAwAKGZ/aM69wrcL0+pz5P4r7PsQDVsq8bHCICC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFNkJzTdHpyTpYertNaeUyGecr4jOAncPcOvhdpbR7Q=;
 b=YmZL2vMR42+cB9DeY1DBlY/X3gbKTWIiieoyT1YM86PB+EKIm2ACeDGDU5SVYeATGIQ7u63/ENEMCgQuiyaGE5bWDebyBorXvFfFR4M49h8wAILNxQDLAMg1hseVKZqmEuwoz/Qu6JwsHdQKAcDKUVTP3yb/pKkkCXoMWvrVGeS9aBAUh1GwTbNTzXkMi7Fs/QQd96BlSWW60dFkYr5FeZ+dC23djquWDmFGOHSEM4mRPVIDo/82LMwc/j29RGp5Sg3aaTnLXmOpHhCvBx3bVYd4ZDgR2Dx29KnH2CM7EeLZN9sLbTex+zHQ3CwEuNAVw+FaHCtPCUvcLrpTUhGiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFNkJzTdHpyTpYertNaeUyGecr4jOAncPcOvhdpbR7Q=;
 b=x6LpXyea2v81mSsLvP05bVOtMRMGdD5HMu5izVRwyoXAbq6FmxpLsP6op2368NJEdmTYzsn74N3IljDbRKlXORYo2H3QiyJOXZO8B4IHjcceukipA097Cj5ARsElvRhYJt76Q1Endrs1ZJwWYJ4S4ob1ZFzsHEk4/x/6vUWEI34=
Received: from DM5PR16CA0030.namprd16.prod.outlook.com (2603:10b6:4:15::16) by
 DM6PR12MB3946.namprd12.prod.outlook.com (2603:10b6:5:1cb::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Tue, 7 Dec 2021 14:54:10 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::66) by DM5PR16CA0030.outlook.office365.com
 (2603:10b6:4:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:10 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:08 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 0/6] Expand display core documentation
Date: Tue, 7 Dec 2021 09:53:44 -0500
Message-ID: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2926432b-1044-48f1-b771-08d9b9916d6c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3946:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3946976545BFC0874C8945C5986E9@DM6PR12MB3946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzlSAfaQsUwXVSGbBxu208daJ0A3CapN2JsAgNrU0bOqc5u8LOxUlTCVh4a0a2A3zopgediN1csSArETfOszJB5VVeYmti+alhuOnsaxxkmVvhEBOJjjrsdOxFxJq6Pd2+yq3hT/TooBDtXyXLH1ZUXHsBZrEWauHU5NLkzB0pAd6rRMewTl5Yq2VBD8H41kRpwaRSi2I3Kae1kNHAu62g+JEM7kEsLSpOg3j1I+pZ1hID4RkF22EOwEXWyw4dCblU7J1G7D3nKgQVc3bOjw+A4Frq/7MJYfZW4o7BrSGm0vBAAvpgbUulRpYLw2sR4QjhfzBs9VRE2iFky9PExHM+JY0py2Itt0diTrYJpqmgwXFX9zKo2U4yzZFgh44gkzMZxPKrKRc0HkUF9UEgnLcCUKh2/id3AM/DjNdmig5HpMMjvbO/Sxy6bw/qoqlT4GpKdOSUKnr0vMJiwAIEDbI4dBBWc+TMKZbEGJAv85Cm7fOBe3MEsVn4mb+ByICLOiFqMuxzQbXEN7iL02yQZd5YZpNnR5QCMYrMXWMZLuWqGTjdI1q5sI+mpWeRr2xaafHZoV28Rtjsl7/YDk+wWJOvigOcW0rQBPMbYaJLSDTiF+wh7r4+zTeT8gVOt/0vIboHuFhWq6Lt3gQDQs7YrZReaBesXypeTs6biGCHJpTpxJP2IEcJ4eqacPgzBffYi00tsCWE2zLZqHtlQL3wACTZPTKIlFcDGuRwrLzjktXLfvzjHHChZpX8vSYVBcYF/8OVl3Nz+KemE9lw+VzksLXADrg/MRzydPRlfXmeK7lw36OkL1c+xr5yBmV/wbmi66
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(54906003)(82310400004)(8676002)(2906002)(508600001)(426003)(5660300002)(2616005)(4326008)(8936002)(110136005)(81166007)(316002)(6666004)(1076003)(40460700001)(47076005)(83380400001)(70586007)(16526019)(70206006)(26005)(36860700001)(86362001)(186003)(7416002)(921005)(336012)(356005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:10.6092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2926432b-1044-48f1-b771-08d9b9916d6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3946
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

Display Core (DC) is one of the components under amdgpu, and it has
multiple features directly related to the KMS API. Unfortunately, we
don't have enough documentation about DC in the upstream, which makes
the life of some external contributors a little bit more challenging.
For these reasons, this patchset reworks part of the DC documentation
and introduces a new set of details on how the display core works on DCN
IP. Another improvement that this documentation effort tries to bring is
making explicit some of our hardware-specific details to guide
user-space developers better.

In my view, it is easier to review this series if you apply it in your
local kernel and build the HTML version (make htmldocs). I'm suggesting
this approach because I added a few SVG diagrams that will be easier to
see in the HTML version. If you cannot build the documentation, try to
open the SVG images while reviewing the content. In summary, in this
series, you will find:

1. Patch 1: Re-arrange of display core documentation. This is
   preparation work for the other patches, but it is also a way to expand
   this documentation.
2. Patch 2 to 4: Document some common debug options related to display.
3. Patch 5: This patch provides an overview of how our display core next
   works and a brief explanation of each component.
4. Patch 6: We use a lot of acronyms in our driver; for this reason, we
   exposed a glossary with common terms used by display core.

Please let us know what you think we can improve this series and what
kind of content you want to see for the next series.

Changes since V2:
 - Add a comment about MMHUBBUB
Changes since V1:
 - Group amdgpu documentation together.
 - Create index pages.
 - Mirror display folder in the documentation.
 - Divide glossary based on driver context.
 - Make terms more consistent and update CPLIB
 - Add new acronyms to the glossary

Thanks
Siqueira

Rodrigo Siqueira (6):
  Documentation/gpu: Reorganize DC documentation
  Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
  Documentation/gpu: Document pipe split visual confirmation
  Documentation/gpu: How to collect DTN log
  Documentation/gpu: Add basic overview of DC pipeline
  Documentation/gpu: Add amdgpu and dc glossary

 Documentation/gpu/amdgpu-dc.rst               |   74 --
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   50 +
 .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
 .../gpu/amdgpu/display/dc-glossary.rst        |  243 ++++
 .../amdgpu/display/dc_pipeline_overview.svg   | 1125 +++++++++++++++++
 .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
 .../gpu/amdgpu/display/display-manager.rst    |   42 +
 .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
 Documentation/gpu/amdgpu/display/index.rst    |   29 +
 .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
 Documentation/gpu/drivers.rst                 |    3 +-
 12 files changed, 2659 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
 create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg
 create mode 100644 Documentation/gpu/amdgpu/display/index.rst
 rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (95%)

-- 
2.25.1

