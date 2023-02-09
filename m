Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58396690F6F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 18:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D155410E24E;
	Thu,  9 Feb 2023 17:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5110E24E;
 Thu,  9 Feb 2023 17:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVEEOa1GE0Ps2Ni6JkH/6r63boByI2P2SHsZF16GtYdmzw7p5HEfxbtt4lYip0mhD7Z0sE8QR6SPRehv7mbHkdvKPYl+FZCum1A8Sc9THW7DpS6uo82wtMBSBd5asQoAY0ZyeQNCaULoGXpj1rWVzHBL1wycRa1Z1ui4X2HBOU762PteVKvxQ3v+Isi6XDJ7A7ijQNUr0fF/mPv/OX1AIKYPh2f+zNG24hxYDjEe5G+y4Cl1sMSwwbK6LYzWbz9LTkMjwYeOI591Izo6YIc2tulwCjOeKIBiXGNLc0fG41NAC1SSylXcn2Nxf0gQQet1FtxCVK8GhUvCIIfJwdAxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+bfh/8EGWKEWt2wQf681RQb4pZ4KV+JvVSb1wjudsI=;
 b=DMIX+JYyuY5o/d78LzRGM3NEcXVQq/3HEVMjA9ElQ7JVoeT2wfiw4LZMag2aicXMQwkriFVHLrdB9LwUmx4OvyLK86AUWzt4Vy+PIV6XHpjCEaTrP44/tovWsg9us5e5kHARtvLzaoWH2lfnjSOvwHU1Yp+mohLZPDrOHSpNN+J8eZFKrmd4PHbNMjDdFmgPg9Pa/axrVkjXKWgAxlQETHmAn+9vKMgEjj4EX1/UWYw3Qy4l7x+WS8JIpf+mme56W+nV64cE9MOpiYhdlZCT67dMZ9Z7ymToNRW/1wtwRb8ERums59Q0x1auuZa34MljskVznXHLE5d0dvYSY/DDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+bfh/8EGWKEWt2wQf681RQb4pZ4KV+JvVSb1wjudsI=;
 b=MmyIVvoJcL7yvtJVHgAU3EvxSkvM+sEzVWuWQowwR+8KMtj75gVMf5GA1dIaoNWiydg2AA6r1bs5KY2+tyujXaP0FAC8GP+xp97uyc6dY12gzPMRecwqgg8oJ139Y4Q0KBP7cb6L+2xEpo7D97NVRh1x0hfcj5wXE40oaOGzOHE=
Received: from MW4PR04CA0186.namprd04.prod.outlook.com (2603:10b6:303:86::11)
 by DM4PR12MB5389.namprd12.prod.outlook.com (2603:10b6:5:39e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 17:45:21 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::16) by MW4PR04CA0186.outlook.office365.com
 (2603:10b6:303:86::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18 via Frontend
 Transport; Thu, 9 Feb 2023 17:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 17:45:20 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 11:45:18 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Thu, 9 Feb 2023 12:45:04 -0500
Message-ID: <20230209174504.7577-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|DM4PR12MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e64e08-d7a7-4dbf-c666-08db0ac56a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEn+U6BtwPWl3hlwkIlAQWPV8MfIWs48rxscCgKVq3HMrfWUqE57Ojw72PMXqCFleCf7Qpt6OltHNqrYT0vtienJKxdJkkZD5D+dP0bdMNSphxzXAjcDEIFei06x3XHDATFz1K2UldxpeaZbZsM9jH9mLCAzeXijzDzEt/j4zu78r1XLvhENerkoaY2Rmxapkvk6MmDh0DyyCR8WpFIc8afgWzoskVoBSmjF1Fl7U669YSiYlgsOymmPzYc+uR+ta3zGmTacG/hFZmLkO0rcd9+7NUOWk6X/cvdLHj53vu5PU9vPZRaQskMKCWcx8NMFbyZAbUmgF4suDesSOLqG4Smb40+oVSM1tyz1A0qkRCndTaUQU1h1rx3zRQVdVRkx7oS/Pd0fHzqFVrIDSETv9SnOT1FSZYGrNre2jQI88CHUrOaVrHL63b3FJklas+HbjKw+Ga+vvWMyUOEx/d4ugBKq3PnkcB4Bq27AMHRaAqs8EqHpGDCGwXfMwghhVL8V+g2KMuJ98QQVSMqtkwFlDU3uW4UunyBKQRt5fGIE/YxC35HXUGS6MQjAn68A8b6P1RyGIMrldBYAqx+NRjyykHzzRPpNzUaXQSLUyWNclCGFKagmahbN7l4rOaPUJobjRZudYUPWJssKPBHep5cAbgOZjLRe9caAarpPMeiLm9JUNmtEbByRtoNX2hynxpZ4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(47076005)(426003)(336012)(2616005)(36860700001)(478600001)(82310400005)(70206006)(40480700001)(2906002)(356005)(316002)(110136005)(70586007)(36756003)(966005)(41300700001)(86362001)(4326008)(8676002)(1076003)(7696005)(8936002)(5660300002)(40460700003)(26005)(81166007)(16526019)(82740400003)(186003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:45:20.9942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e64e08-d7a7-4dbf-c666-08db0ac56a4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5389
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A few last minute display fixes.

The following changes since commit c6ac406cd8ff610a2d5da298b1d3071acfcde7f0:

  drm/amdgpu/smu: skip pptable init under sriov (2023-02-08 22:33:37 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-02-09

for you to fetch changes up to e7d636476ba73e61460619bd8822e16af3cba509:

  Revert "drm/amd/display: disable S/G display on DCN 3.1.5" (2023-02-09 10:29:28 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-02-09:

amdgpu:
- Add a parameter to disable S/G display
- Re-enable S/G display on all DCNs

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add S/G display parameter
      Revert "drm/amd/display: disable S/G display on DCN 3.1.2/3"
      Revert "drm/amd/display: disable S/G display on DCN 2.1.0"
      Revert "drm/amd/display: disable S/G display on DCN 3.1.5"

 drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 +++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +++++++
 3 files changed, 19 insertions(+)
