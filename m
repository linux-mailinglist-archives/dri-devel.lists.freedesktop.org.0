Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E392C482459
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 15:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EA89CF9;
	Fri, 31 Dec 2021 14:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A589CF9;
 Fri, 31 Dec 2021 14:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZvwRZsu6xKsejJPgNG4XhtXghR7PbY74GIjACl/VGDMgkQSVzCjGYqok72R2cQaHC9um8+1IEE/eawSHWPFDTP5rBsx5yDidrFTXdSDWwoyu0emvl1RPWDY3fwO/0H1oP0DdIV2G08/gev8T7AKDWTsMUwiNMOd7xzo/CVl8FGctgz7WDoCaXzSfFz4ioIlQxuFCBp23q6SZAa/acLuins6LYV0ynfW3OXcvalINwjhK7feImqmhvh0VeZkG/q+EIah0IP2slC1EeEb2A7M4/iDpluyC7budXodB8DI7uvugtjnaNvs3dwV5m2pbyDLlZ9xi0xYvGOFmD7XBaBdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvF/y4JzoAbjYuT6E+VR40pRj1kGn+nBcr9kXPLCGbg=;
 b=mOO+xOn9AAvo4DOUv+3qax4ydZmYl2cOXn7BQu3TGWcqCyerfrQlZtBVz15oQEBMEFKm3ItXgAiYSRTgmhH+mM1TILmKqEOHSGMhn0XvPpRerjm0nf14Gk2K9o16sYCmiRusrSe6C4+TF0dez1M3cTIa3x8FioOSPyqJ2H2BM8ME/YmWR9EVRnPZ/DeJ4Wc7OufqXgx8u9cD/VhlzohSA7Ga0bfIYJFBwu0ycUxgBWni1YguSU14VOTQd0vT6wvoy2h65fv3aVY4fRa6VQ3XZXvR91ONQXUxVs9kMW2Fd2K1bCVn/MFnA3ZGlrAVou6nOStDQOkQ5V8sh9+x8FVVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvF/y4JzoAbjYuT6E+VR40pRj1kGn+nBcr9kXPLCGbg=;
 b=Pj7vSTYroJ/E3gyuzIS5e5409GlSB+Zns265gqhzKdVSjlaoRbVc89cnHkZUpF20Tb6mK9FdONui7ASWn4lO5leQJgxzBUz3sAmrCkWr1F0mJySkdugWt2GwCL9omgVRhVBY47I5TRz9NOLsrPfXaj7ukCLHIWBNqbeDGpMaS9I=
Received: from MWHPR20CA0007.namprd20.prod.outlook.com (2603:10b6:300:13d::17)
 by CH2PR12MB4008.namprd12.prod.outlook.com (2603:10b6:610:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Fri, 31 Dec
 2021 14:38:39 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::65) by MWHPR20CA0007.outlook.office365.com
 (2603:10b6:300:13d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13 via Frontend
 Transport; Fri, 31 Dec 2021 14:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Fri, 31 Dec 2021 14:38:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 31 Dec
 2021 08:38:37 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.16
Date: Fri, 31 Dec 2021 09:38:25 -0500
Message-ID: <20211231143825.11479-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81f8377f-009c-4c91-260e-08d9cc6b3bff
X-MS-TrafficTypeDiagnostic: CH2PR12MB4008:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4008A842904F186515534150F7469@CH2PR12MB4008.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KudU43rha2FlUAZl5411TkD2zulgdeVajqTmeyXGYyfJISW42Y1UDUqDozAtA1FhYQRM2OwC6V6NjRMKbcHqhkt9SIL9FGlRbmXHRnDlkvTQOVjPyUavu/FSL9pukv0l7bkVObYYN6vvJv7zijZtECxqfbB5AJjHKAESvj/FbWZvDNB2GBJ4YQgIGekLhxVdxZffFQVsunYV/vEQJEDiELTIwgV1TP4CwSGe4Y9BpnSmB/xDlJqly6mzqg5HQ6h8Zr5Gu2YmxWERxmUbpR4ElU4CX98MPxGx+SPWSLA9FSG2v7sZj/juML0Gc9r4MPyDOXgPqd6pSsf8OVJV4QSjx0n2u00KT9YErC/l8P31N17uIGwxzarapBhBF15ce1YSNPEIwrcRRPGv22iUE7FC4wVh1RTBvjokDTYe848BTMjMwvS9+m1TE4vuv7wh9QKlBWMW7LhXfpLyf2XBy7VgB3Aye8oOR5AJmdTEwCtHYd9M16/zcr4Oi+MqqWBaf7QDHHh3fpIKfJixTxWWG4uGSEc2fliPAKbsUvldYtCIwu38TY3SrHiA07CafnhFZHnYnH9QhoAFRPpmsorVD5bXSWLb1SIp3xc2xy3JX6bjFdsHpD5hg0cAu2RY2jTbm09RgZoURCb3t4crRDyG7dpRQIrdnF79HGl7HVX5QPCrRLHy/C6lk3ULbvruiJvTvTD9aYsNZIja50ZCV79loUEJw23uaC0sie4BEqJ6O45BsnE3l98kvDgVbWu+7fdgdDllu2733zu6p2IOdv7eyl6yx/rRieKWdwIZnQ4eCqCKC4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(336012)(426003)(966005)(36860700001)(83380400001)(70586007)(70206006)(86362001)(508600001)(356005)(8676002)(36756003)(47076005)(7696005)(8936002)(316002)(26005)(110136005)(81166007)(4001150100001)(16526019)(186003)(2616005)(2906002)(5660300002)(6666004)(4326008)(40460700001)(1076003)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 14:38:38.8217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f8377f-009c-4c91-260e-08d9cc6b3bff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4008
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

One small suspend/resume fix, and the rest is restoring the runtime pm behavior
that changed for some people when efifb dropped its extra runtime pm reference.
Unfortunately the issue has not been something we've been able to reproduce
consistently.  The patches here basically re-enable the previous behavior, but
in the driver if the device is the one that was used by the firmware
framebuffer.  It is limited to the device used by firmware since I don't want to
regress hybrid graphics laptops and other systems that have been working fine
years.  The first patch adds a helper to fbmem.c to determine if the adapter is
the one used by firmware.  This needs a more indepth analysis, but with the
holidays and the late state of the 5.16 cycle, this seems like the best option.

The following changes since commit ce9b333c73a5a8707f2f446a837a6ca743ddcffd:

  Merge branch 'drm-misc-fixes' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes (2021-12-31 11:40:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-12-31

for you to fetch changes up to b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b:

  drm/amdgpu: disable runpm if we are the primary adapter (2021-12-31 08:57:45 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-12-31:

amdgpu:
- Suspend/resume fix
- Restore runtime pm behavior with efifb

----------------------------------------------------------------
Alex Deucher (2):
      fbdev: fbmem: add a helper to determine if an aperture is used by a fw fb
      drm/amdgpu: disable runpm if we are the primary adapter

Evan Quan (1):
      drm/amd/pm: keep the BACO feature enabled for suspend

 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   | 28 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   |  6 ++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c |  8 +++++-
 drivers/video/fbdev/core/fbmem.c          | 47 +++++++++++++++++++++++++++++++
 include/linux/fb.h                        |  1 +
 6 files changed, 90 insertions(+), 1 deletion(-)
