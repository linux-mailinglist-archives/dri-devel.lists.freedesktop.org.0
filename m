Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648732E9F4C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827B6E053;
	Mon,  4 Jan 2021 21:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F156E041;
 Mon,  4 Jan 2021 21:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3jrI+xUKwP4dUyDzudDNv/5SEjCCTzo1c7h2CAf2dMJwL7x6wdP3nvPQAkhscqNcS9dHxVVvFz9TWhAVp2s5IJNsnWuRskXa5Tr4eaVCowLhvuL0grTWfr7OzfbVm/LF64vZZibk4md/gygJJZiizCBxY7TqLo22gn3+MV2R7aPxSSp71ZlPR1PCR4vKBPEST4Nag6vy4CT5r/8L3E/5NrxSlniNFtYmRG/rdoUlEg6h9x0lj6ptc+qEDxv7gjJYqygsTQLsiOobC8LsoKClXkzlhrQfn0ypSNRwpgoYtjLrs2vAqI2TT3q/0g2uIBN426YYo2qGZuzcfnqtHl26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKZs6h7AaEokx56lvuQbibFQCtEtNTOJRcTff2hfHEA=;
 b=CbsHEq1KzLCdcblPC652usV81OMfXROCMmhyvqnfSeOGT4hpTBMpoR618Br8GRGLQWr8Iwk9AHUYpl4IGTgh6Qua22+SX2fXI57A1ezdhEPYA85yVjUyErACeCkGHIgocMwkhk0UIQSpt3jJK7OrsbDvWN0OMIkwF9yTSQNgp2fGlTeM4NBy6qGnrNwQSbmUoDbFurSMgfVegeFhUwDVp8L0o5FgL6RsyDkJxEZBDn62KVrH1dkdhAt1GbFdrKSnlVMVR8MxTopF5zbXvlIjH6bmg6jX+FFAaQuBjIezxDdeKBtq+TKu/R7/CI/5Z4SfLy0QHsL2iuNxt8e9L1nXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKZs6h7AaEokx56lvuQbibFQCtEtNTOJRcTff2hfHEA=;
 b=Y9QNJbqQwZcujeIjcRtnl0h1J7UiorwnSdcFTpg6nU1DKL3XFEWFcMpCzXV9PrZn34x90/G/v98EjEKT8m6p6ezUYJaKk9lnW9NSXvMf+O9lfcIuhYuzdnlXQ0ZZC/LzFWsZa+MGmwrGMYxhwjGzL5uGmmtfQjAfATyjl1qBHR4=
Received: from DM5PR15CA0033.namprd15.prod.outlook.com (2603:10b6:4:4b::19) by
 MWHPR1201MB0144.namprd12.prod.outlook.com (2603:10b6:301:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 21:08:04 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::d2) by DM5PR15CA0033.outlook.office365.com
 (2603:10b6:4:4b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 21:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 21:08:02 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 15:08:02 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Mon, 4 Jan 2021 15:08:01 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <nicholas.kazlauskas@amd.com>
Subject: [PATCH v3 0/3] Experimental freesync video mode optimization
Date: Mon, 4 Jan 2021 16:07:57 -0500
Message-ID: <20210104210800.789944-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d5cf54-60a1-498f-e7a9-08d8b0f4d2e7
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0144:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0144ED8DC4302F059B95BDED8BD20@MWHPR1201MB0144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmoTHD94D4XEbHPDWHfl7S1Yq/XUKGK/352FhyuFCvyDw++W6AGTIyolNWC1Y+TLwEd4M7pMIA5Uis2K6AkAD/6MbXK7ygQEyDiSmhxAO548WsZgHrJUIseB9ZsNq10/41hNiZY57KjvhyzeaDB9lWP+OrWyow2uSTgcar4bW+B6aQQmPM8mLpqJn20v1gBphXrAuHkK7dNNseHjF5BqQBAzeSouTTzK6HXuuxniesBAMmXUd7zw7JGpMpJKnl9ks2VpXn8tzSPiMSTXBKu4PKJLdnGpXHbAXTjn8cyumgzBz6XcQdHqn59803oPztrz2vxEbWtacwYQFO63ghaoixTm/whSGFI/ZF3b3Pt/FklahZlMIRdtr61mJCb7kCcLPFEFnAobkzn8dJy1YOGXowygNSOIwtP7Cjz7HPesb7A/nQrs+mz2b7Gii6mDuwKuIocWR9KX1YOXzznjKZeITg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(26005)(8936002)(426003)(316002)(450100002)(86362001)(2616005)(2906002)(4326008)(44832011)(1076003)(83380400001)(186003)(110136005)(8676002)(54906003)(36756003)(478600001)(7696005)(82310400003)(70586007)(47076005)(81166007)(356005)(82740400003)(336012)(70206006)(5660300002)(6666004)(6636002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:08:02.8858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d5cf54-60a1-498f-e7a9-08d8b0f4d2e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0144
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 aurabindo.pillai@amd.com, wayne.lin@amd.com, alexander.deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in V4
=============

1) Add module parameter for freesync video mode

* Change module parameter name to freesync_video

2) Add freesync video modes based on preferred modes:

* Cosmetic fixes
* Added comments about all modes being added by the driver.

3) Skip modeset for front porch change

* Added more conditions for checking freesync video mode

Changes in V3
=============

1) Add freesync video modes based on preferred modes:

* Cache base freesync video mode during the first iteration to avoid
  iterating over modelist again later.
* Add mode for 60 fps videos

2) Skip modeset for front porch change

* Fixes for bug exposed by caching of modes.

Changes in V2
=============

1) Add freesync video modes based on preferred modes:

* Remove check for connector type before adding freesync compatible
  modes as VRR support is being checked, and there is no reason to block
  freesync video support on eDP.
* use drm_mode_equal() instead of creating same functionality.
* Additional null pointer deference check
* Removed unnecessary variables.
* Cosmetic fixes.

2) Skip modeset for front porch change

* Remove _FSV string being appended to freesync video modes so as to not
  define new policies or break existing application that might use the
  mode name to figure out mode resolution.
* Remove unnecessary variables
* Cosmetic fixes.

--

This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default. Enabling this paramters adds additional modes to the driver
modelist, and also enables the optimization to skip modeset when using
one of these modes.

--

Aurabindo Pillai (3):
  drm/amd/display: Add module parameter for freesync video mode
  drm/amd/display: Add freesync video modes based on preferred modes
  drm/amd/display: Skip modeset for front porch change

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 389 ++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
 4 files changed, 373 insertions(+), 32 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
