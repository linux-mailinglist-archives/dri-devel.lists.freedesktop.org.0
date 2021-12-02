Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C2466775
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFD16FA4D;
	Thu,  2 Dec 2021 16:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDB6FA11;
 Thu,  2 Dec 2021 16:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUfqtl3307O4icVHh05vYcKdkjHzCfWyM0hyLgTE1daRADhswJNTDwW9DfDyf1XaAk8s2vItNom6Q7TNYcTgvRDkHJ4f+aJZkpMvvAQsoNvUoDkW5oriSGzZbL7tavc/wfcB7i8vBN5hMblaUqcNl+ZDOoLkic/mEbjsssTOHHH5AU2mdFQcSSAPKJKhWCMUDGRQJpb22eq5ntFDWcAaFIEd7WqBmtvMKrnQS49dIQEgiVFLXjEh3X+Xcds6SCE+IwFlgvJ1SfdeALNH4GtUGLQMAxw0N8xMFKJFLwVzxgVJAiH9fDTC2jtVdZSYp3SpfS4LM6xzHFwr+2lRlJXuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rT9ROmAR99PLuiKB7Oxk5jxmrXpBeCpeFmz0Hb+kMFQ=;
 b=aDKijc59HJwC3ic0UUWQFo7JVBxP8ZtC0FNTU44u6YGVr6RcREdDvytNcDYx1/pd7kxunscBsVhIm+kp3RjRRcYIFGzprqaRmtsmSTBxJ8W7swdNvF5N1D58nUF+vjmA8QmbaRzfMU+I19+GC9dHCIiGGmIZKg0MR44dkYi6yjXbpAO/JOWnh4TFf2aMjuG5MSBqHt3Hl9qb0bX5m/mB5RcEF+EjKEI/gfULQJNevwyn9kXsBoWuN9fMtyqbrVW64Vv7S372/7OThG8jVDaph4PWihtp0yVERL6uBFAqZE7IWDW9ejKc5IIX2XNKVrdNx2+p7qNhZGB4M0rW6/Kveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rT9ROmAR99PLuiKB7Oxk5jxmrXpBeCpeFmz0Hb+kMFQ=;
 b=rN/c7Bnql8aaMQpo1WHF1b2PX4xzarCa9vvI6sr8JjYmKj3WeTMpwUpSqdwNEF7LCgn7J2+NJsRgcWHpZ6aP9qLsJ9AtqfeNpqPbY4dKylf6j0+Pkh09Vleza/WDiax/Al1rU0mbimv4Eh8IyGEtOBt4/cpseCFimQ9Zvclb7XM=
Received: from BN9PR03CA0137.namprd03.prod.outlook.com (2603:10b6:408:fe::22)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 16:02:00 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::83) by BN9PR03CA0137.outlook.office365.com
 (2603:10b6:408:fe::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:00 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:01:56 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 0/6] Expand display core documentation
Date: Thu, 2 Dec 2021 11:01:26 -0500
Message-ID: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37133ba5-6d6b-462f-2283-08d9b5ad1343
X-MS-TrafficTypeDiagnostic: CO6PR12MB5428:
X-Microsoft-Antispam-PRVS: <CO6PR12MB542800CC1456BC62B6C23C5398699@CO6PR12MB5428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhhZ9WkVAiz7BWPWhFPnbF4WrSSuAuR3xWoKm8Z/qM2TavGsy0ta4yECZVkkR9EkVi7iUEaqwoCXNoqz+zak8kMep8xGh/itEc0jPTmusoQaK3JtRhvX9UOaqlrLdAbFK3O7NMOgya83HLeHYLCe50hOFCeerHYP6NKMD8IhhikRoUdZSuAc855Fu7E0pdTmZGoYeCmmBMWvd2EnzeihMKjFj1531lvaDx6PDUierbY87mTBliWinu2u28owJB8MJrwFekVAjg3kwXYL/dMb5NX6fE+THbHsO9TJHU4TfFe8TI0dAnCew//V4OeznCJHm4zV2TuhqhAiKkNHWXgpsMk9mvxjMIYD9ER9418rpvSwJL8ZaAZ8fXIC+O5MNbaNEwd1DjmAimLVX9d2Sv+QSktOLLEnHoKirPeVLDTTMjgqZQ2u1f//JzbWlDgnrDD4m7PHAawolVSdFg29GysTbg5mU5gGWT3pNm3z79wpwAT1sSUpM9YL9tfyb1Tfro+988ceoh5Meu8HdAYUC8FDhpE8NVo3q5dZT6wrXsgf/zQ8ACspOVktV3Qu7M1HWv172uELaDbZ39Dx6aR9RxL/k2kcnByvz/H+vXm2boiTjBPu+S9SdyvnLV4xhniGpXxZkc7wXtm7VpXoKsqRlu5TrReiXHCnZk6gP6Dx67eSuIkCnr+TVM8aF9v+JJrw+7Wjwo+evkqKWwLR9PEngqmg/Btunl6a1B+LhDCrodjYwZpO777z/3MWgIPKROY8wgj3nxi9p80R3BcMksoSKk6ava7l1XN/iO3gXc/7px1BnlJyvqCrPEB3Ne9i59ioLvmr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(70206006)(1076003)(8936002)(186003)(7416002)(2906002)(336012)(508600001)(40460700001)(82310400004)(54906003)(70586007)(316002)(86362001)(8676002)(426003)(83380400001)(36860700001)(356005)(2616005)(921005)(81166007)(36756003)(6666004)(5660300002)(26005)(110136005)(4326008)(47076005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:00.6303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37133ba5-6d6b-462f-2283-08d9b5ad1343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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

Please let us know what you think we can improve in this series and what
kind of content you want to see for the next series.

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
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   47 +
 .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
 .../gpu/amdgpu/display/dc-glossary.rst        |  243 ++++
 .../amdgpu/display/dc_pipeline_overview.svg   | 1125 +++++++++++++++++
 .../gpu/amdgpu/display/dcn-overview.rst       |  168 +++
 .../gpu/amdgpu/display/display-manager.rst    |   42 +
 .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
 Documentation/gpu/amdgpu/display/index.rst    |   29 +
 .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
 Documentation/gpu/drivers.rst                 |    3 +-
 12 files changed, 2653 insertions(+), 79 deletions(-)
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

