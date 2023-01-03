Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A765C944
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C35810E27F;
	Tue,  3 Jan 2023 22:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E710E234;
 Tue,  3 Jan 2023 22:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zxobp6WLOIcwE/f24eVU7di3NGgmfH/9MAxtnhEXW9kbSGsZ7yLv+EJkVJwvLS6UzFQoKQvdaieKY555/8LhePHTTzfNL0w6xgY1aaHvrYbcgYYf2ovATGZTVbyEKOojpmxDzWDZLdCy3Y6IDbfUOT9R8uooKruzNZr09nP3hJqpiDkI8hLQzeH7DqiXyEvMATwTkpqNXZ5Qe6IkiZZknmjNlpN0uwNFlwV3sdML8k9nsf220T9iFPrsioFXdFWz2RbSZgzfwpUET9KpGDNjBiN5caHOeXzl8ZEnisMzjdb6r6um5W188EoXiiALdxafx92+Up9mw7CKwCkozupRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqXSe+AJMrkOBoL4uVjA4IC+WOUOOfRA8zklLZZR1Dw=;
 b=USBmF0lm9xBQDOmVOo2Eqt7CKJ6/oNRuo9Tg9FVxQdSPngjdEokYhhkn1uXODmd7AIquYR6zOCg2zJffZjTM87OuVg7nqu0nJ9MgkNOhwSrq3dRsMnSi+pp9bP7rKeq/9NGUW/1/Kfe1zvJ05EyCquiisI9DOO0ErBq0wlCdkU+Cvjqln5KDCmrfukyh+k7UsHMZDssxVT4uWfSM3BepTjWGOCgDFfmgSBPX3A6g3t2lRRGAwbkJ39UVL+nmKtyCI8oluww6+vf42BjZ1/LqdsQ7FbcPhGzdNuSoW+K3q6WNqrKhggA0tLtJYxbKKcDGt86MyP3K/oZc17qIHLp/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqXSe+AJMrkOBoL4uVjA4IC+WOUOOfRA8zklLZZR1Dw=;
 b=gLPwk9WDvrTZHisNd3yOjYX3xHKgX3pSwvAjgn1dV7XXRS4LBcwEyMgETb9bZbLtuWxTXsD2XxMAGa+UEgrZCsHFiDKndVZZ0tiHsDjQq+oEHfJfBaTr9eqeslqsnlh6L1VEYbfpt4GlgHQb4C1FBSfliUY6FUdQ3OrRa4IGxhY=
Received: from DS7PR05CA0105.namprd05.prod.outlook.com (2603:10b6:8:56::19) by
 MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Tue, 3 Jan
 2023 22:19:26 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::67) by DS7PR05CA0105.outlook.office365.com
 (2603:10b6:8:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:26 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:25 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v4 00/27] Recover from failure to probe GPU
Date: Tue, 3 Jan 2023 16:18:19 -0600
Message-ID: <20230103221852.22813-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a3aaed-1354-4942-cdb2-08daedd89361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vPGplQuXwe4/QCxca+UfPS4+C1E7YP4FKr7U6DwOWq8cKyV7TY+KaopeXPaAMwXG3NIn9BamJfyXS2lww9HpRZqAM/FknJgHsMVIn2E1m8Lu/IWRlpEXtSHweqL8AEoyk55BLMwemNz6/IznSAmoPWGNRId2IIMaoHfagksZY1K6GLrZAnaramSsDD7p639mjDIUqfwifWXxTpoaiyq9fiOanUpE21TjpN9c1JwQOHj+0wCR38A6t489s0MHDy/FMnnyx8BdSYKrArN2UxJdYSxvXah5k+gSuBmXPO2ikBonno7CeGeJBT9p4lFJnpKBz0RDAqaAgWBBaoejLcISMAPCrH6jV3iYcD3jGXSHDX21fan8oQfpXTDN4uJIQ8JenVBBwN3/i5BTe78LFqaip4djM+iw3zgwQC1F2m02srUyvV623kQo01OczZK8LzDU+HDFnmFD8ydRqTzC5/l/h4FzqOztKtHpG9vjsV4RwWpSeM0M3dJC16e0OdlGKoiiEptZ161EmaK4wtHe6OhaNGAzY+ieubPLY41kY7/MAKqeC8yF5JEMM+e617YrQMDUEo1GJIJjucREhWWRnRjSm+ghiKAppNDegk91lsC0AoKT8/seVxeYdOiZh7R/w8KwLcsp4gVGnh+kR7D9gfmBwS0a2CWii7LUZBf8rbrywPvOSisYv57+oJ24Ce9GUkxIlFLOnp6DmLMseAg6u/3cA5riOM409d51g27FqFjPQkHatT2FLChI6jR65z2R+4YuFefgEcC/eij2DDVW89iVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(6666004)(36860700001)(40480700001)(7696005)(478600001)(16526019)(82740400003)(36756003)(82310400005)(356005)(81166007)(26005)(186003)(2906002)(336012)(37006003)(2616005)(6636002)(54906003)(40460700003)(316002)(1076003)(44832011)(70206006)(8676002)(70586007)(6862004)(8936002)(83380400001)(5660300002)(47076005)(86362001)(426003)(41300700001)(4326008)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:26.6944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a3aaed-1354-4942-cdb2-08daedd89361
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
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
1) Delay releasing the firmware framebuffer until after early_init
completed.  This will help the situation of an older kernel that doesn't
yet support the IP blocks probing a new GPU. IP discovery will have failed.
2) Request loading all PSP, VCN, SDMA, SMU, DMCUB, MES and GC microcode
into memory during early_init. This will help the situation of new enough
kernel for the IP discovery phase to otherwise pass but missing microcode
from linux-firmware.git.

v3->v4:
 * Rework to delay framebuffer release until early_init is done
 * Make individual IPs load microcode during early init phase
 * Add SMU and DMCUB cases for early_init loading
 * Add some new helper code for wrapping request_firmware calls (needed for
   early_init to return something besides -ENOENT)
v2->v3:
 * Pick up tags for patches 1-10
 * Rework patch 11 to not validate during discovery
 * Fix bugs with GFX9 due to gfx.num_gfx_rings not being set during discovery
 * Fix naming scheme for SDMA on dGPUs
v1->v2:
 * Take the suggestion from v1 thread to delay the framebuffer release until
   ip discovery is done. This patch is CC to stable to that older stable
   kernels with IP discovery won't try to probe unknown IP.
 * Drop changes to drm aperature.
 * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.
Mario Limonciello (27):
  drm/amd: Delay removal of the firmware framebuffer
  drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
  drm/amd: Convert SMUv11 microcode to use
    `amdgpu_ucode_ip_version_decode`
  drm/amd: Convert SMUv13 microcode to use
    `amdgpu_ucode_ip_version_decode`
  drm/amd: Add a new helper for loading/validating microcode
  drm/amd: Use `amdgpu_ucode_load` helper for SDMA
  drm/amd: Convert SDMA to use `amdgpu_ucode_ip_version_decode`
  drm/amd: Make SDMA firmware load failures less noisy.
  drm/amd: Use `amdgpu_ucode_load` helper for VCN
  drm/amd: Load VCN microcode during early_init
  drm/amd: Load MES microcode during early_init
  drm/amd: Use `amdgpu_ucode_load` helper for MES
  drm/amd: Remove superfluous assignment for `adev->mes.adev`
  drm/amd: Use `amdgpu_ucode_load` helper for GFX9
  drm/amd: Load GFX9 microcode during early_init
  drm/amd: Use `amdgpu_ucode_load` helper for GFX10
  drm/amd: Load GFX10 microcode during early_init
  drm/amd: Use `amdgpu_ucode_load` helper for GFX11
  drm/amd: Load GFX11 microcode during early_init
  drm/amd: Parse both v1 and v2 TA microcode headers using same function
  drm/amd: Avoid BUG() for case of SRIOV missing IP version
  drm/amd: Load PSP microcode during early_init
  drm/amd: Use `amdgpu_ucode_load` helper for PSP
  drm/amd/display: Load DMUB microcode during early_init
  drm/amd: Use `amdgpu_ucode_load` helper for SMU
  drm/amd: Load SMU microcode during early_init
  drm/amd: Optimize SRIOV switch/case for PSP microcode load

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  60 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 276 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 245 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h     |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 103 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 117 ++------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 101 +++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 101 ++-----
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  98 ++-----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  89 ++----
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        |  80 +----
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 129 +-------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  75 +----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  27 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  47 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  30 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  55 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |   5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  89 ++++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  40 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  17 +-
 36 files changed, 751 insertions(+), 1174 deletions(-)

-- 
2.34.1

