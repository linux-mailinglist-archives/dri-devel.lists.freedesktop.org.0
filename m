Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8F6594D7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DBC10E061;
	Fri, 30 Dec 2022 05:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C22310E057;
 Fri, 30 Dec 2022 05:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmpIjZGeISoGws+ZG3bvm3SLtNkg7ywO/QwtkllaNCydP8L3ALCzVc0RwS5mGlgwxps/UkMwz01+eIfAsFFuMc6DLt6m4bVO7mVtNEB28Y7yr/Ke09iEb0G4oO8JsNt44PEIZTAczGH36kV81yLEG3aF/TzB9dkki1BqJW4MCna1oe9+SevK+PzA1m/SQS6DHcFuzoCAxq76ZSc+3G5kTR2C69MGxYUv3Q1kmnAMQRnBEN8WXDpoqNvEZDqt/WIswlFsRyCXd4IfMT9PnTGutcx7qSF4U8mG3RcP6L86zfeYy1jsDXR2Xlj1JJAzfkyKqJinL9fNjgBXckCJPBEvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO8RvO27hy6PSdAtJECJ8el6wAtncnYRBJE4qXaItH4=;
 b=k2yyS4muZL8nM0xFZFl72rtq5eem8lm2AvtCLfeNScciyPQ0f7CJQlBdp4hrVDfUunipT7cQZGv4EXCUeBh5zqJD8RW1vv/YsUDAvRVooTFcH32ePIELLR8lB5zVb1ktKgPJU04o5wm15YGUtCRMfoOzndKocWCrzijROX4LBZSKHWHeid8uL1BOJWeUVcsfpQ4vFvhxrm3xGuovql7YKj+7rromz5StCfzxZWahxEGW8IgpZrrZzc8LBV7gELpkkliyjJib5j4WBgMCzrdvU0nqmyZRLBQIQx3vy9KrDpIUdBL5FLCN5LCZwMx9qayGTV6xE4s1EptvX4Lv3VJtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO8RvO27hy6PSdAtJECJ8el6wAtncnYRBJE4qXaItH4=;
 b=IwxUy0EP2JspfZr24q66yi1i5GAxnfuR3+nygFy206qEGWiS9zvc6WQCeuY+XaNhOlxWxURRiTZZQVl0GANP3ExojyXqgflsAEft3L5uHpGj+5RoiyY2WTBm3xBBT/b+gJCdFM7CTG13yF4S6QFteh2wFclvWOzpJUSWtEUeLkg=
Received: from MW4PR04CA0278.namprd04.prod.outlook.com (2603:10b6:303:89::13)
 by MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:40 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::67) by MW4PR04CA0278.outlook.office365.com
 (2603:10b6:303:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Fri, 30 Dec 2022 05:21:40 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:35 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v3 00/11] Recover from failure to probe GPU
Date: Thu, 29 Dec 2022 23:21:04 -0600
Message-ID: <20221230052119.15096-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be9eb3a-6fb0-44fc-79b0-08daea25bb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j1T37d4GUL1cgt+k2hn1V+jAOaygxNBNqj3I9r/FgMMPjViHZqJmn61LrjnPJF/HqU7HQhzKiNbk5jcOIWrm2bOsXqphULxuFzKqlZvKKd3/6YOl0EFWCW+Qp/fW7czSMQrH9yXVWogygB7lNavqYL+H6LCUIZpaz/OCHfIiTKIbPW5k6Owi1Mq7Htatwd0BBmDKAkwVwxUZJvu6/i8SfOwx/WjbDhD2lKxBsOZ+rE+5lxkz18pwk+FHFpQ6I17iT8V1Msx/cExCxI/sI24whyuyLSanZXSSHbg3GT/VP+N5aI15FHdWtsPtnwOBzKHth4x31G4Ul2WQidQpmnMwoN4Xh8HQT079cNIcE1eqqocBQdNG+VDpkVVF04xjZuk8ImqmztBvLunQze78BDZfgC+YPFeXj3ai2M4+CQFdeiD/0Brsb7bRH6/MwjpSWki7r/opUn5AAHKON0IknCuqyueqOSOisSElElrZg65Kw2oImbUd3IRAcUH3qOlOmIKsAXdCCkeaic+b1KVq9/m86mw+ySj5s9dQcOvKR3ctwt3gg8JleF4d8ox7aWjh2nLOS1SX/VG9izgaYRzqa8zMW1GTj0LGE27MZz0mDOa28c1aU5kyOJweF9eOwX74f+TgQFd53lX0vmuOHNTGiYrC6p2tsEXcbpxycmWnTey5W87ItBnY2xndr7jbR1g2TJ66CnYLM7aHkolxXxos1qUQaAMgwOf8lAby3vmXjdAK9WE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(7696005)(40460700003)(37006003)(316002)(36756003)(6636002)(2906002)(54906003)(83380400001)(356005)(81166007)(36860700001)(82310400005)(82740400003)(6666004)(26005)(40480700001)(47076005)(1076003)(426003)(336012)(2616005)(86362001)(186003)(70206006)(70586007)(5660300002)(4326008)(8676002)(6862004)(44832011)(8936002)(16526019)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:40.4143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be9eb3a-6fb0-44fc-79b0-08daea25bb6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the first thing that KMS drivers do during initialization is
destroy the system firmware framebuffer by means of
`drm_aperture_remove_conflicting_pci_framebuffers`

This means that if for any reason the GPU failed to probe the user
will be stuck with at best a screen frozen at the last thing that
was shown before the KMS driver continued it's probe.

The problem is most pronounced when new GPU support is introduced
because users will need to have a recent linux-firmware snapshot
on their system when they boot a kernel with matching support.

However the problem is further exaggerated in the case of amdgpu because
it has migrated to "IP discovery" where amdgpu will attempt to load
on "ALL" AMD GPUs even if the driver is missing support for IP blocks
contained in that GPU.

IP discovery requires some probing and isn't run until after the
framebuffer has been destroyed.

This means a situation can occur where a user purchases a new GPU not
yet supported by a distribution and when booting the installer it will
"freeze" even if the distribution doesn't have the matching kernel support
for those IP blocks.

The perfect example of this is Ubuntu 22.10 and the new dGPUs just
launched by AMD.  The installation media ships with kernel 5.19 (which
has IP discovery) but the amdgpu support for those IP blocks landed in
kernel 6.0. The matching linux-firmware was released after 22.10's launch.
The screen will freeze without nomodeset. Even if a user manages to install
and then upgrades to kernel 6.0 after install they'll still have the
problem of missing firmware, and the same experience.

This is quite jarring for users, particularly if they don't know
that they have to use "nomodeset" to install.

To help the situation make changes to GPU discovery:
1) Delay releasing the firmware framebuffer until after IP discovery has
completed.  This will help the situation of an older kernel that doesn't
yet support the IP blocks probing a new GPU.
2) Request loading all PSP, VCN, SDMA, MES and GC microcode into memory
during IP discovery. This will help the situation of new enough kernel for
the IP discovery phase to otherwise pass but missing microcode from
linux-firmware.git.

Not all requested firmware will be loaded during IP discovery as some of it
will require larger driver architecture changes. For example SMU firmware
isn't loaded on certain products, but that's not known until later on when
the early_init phase of the SMU load occurs.

v2->v3:
 * Rework patch 11 to not validate PSP microcode during discovery
 * Fix bugs with GFX9 due to gfx.num_gfx_rings not being set during discovery
 * Fix naming scheme for SDMA on dGPUs
 * Pick up tags for patches 1-10 for patches that didn't change from other
   comments.
v1->v2:
 * Take the suggestion from v1 thread to delay the framebuffer release until
   ip discovery is done. This patch is CC to stable to that older stable
   kernels with IP discovery won't try to probe unknown IP.
 * Drop changes to drm aperature.
 * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.

Mario Limonciello (11):
  drm/amd: Delay removal of the firmware framebuffer
  drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
  drm/amd: Convert SMUv11 microcode init to use
    `amdgpu_ucode_ip_version_decode`
  drm/amd: Convert SMUv13 to use `amdgpu_ucode_ip_version_decode`
  drm/amd: Request SDMA microcode during IP discovery
  drm/amd: Request VCN microcode during IP discovery
  drm/amd: Request MES microcode during IP discovery
  drm/amd: Request GFX9 microcode during IP discovery
  drm/amd: Request GFX10 microcode during IP discovery
  drm/amd: Request GFX11 microcode during IP discovery
  drm/amd: Request PSP microcode during IP discovery

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 647 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 221 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  85 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  64 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 194 +-----
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  28 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  25 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        |  99 +--
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 191 ++----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  98 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  46 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  61 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  42 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  65 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  30 +-
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  35 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  12 +-
 26 files changed, 1037 insertions(+), 1215 deletions(-)

-- 
2.34.1

