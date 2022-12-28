Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A56581CD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC32310E3B9;
	Wed, 28 Dec 2022 16:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2731710E3B9;
 Wed, 28 Dec 2022 16:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxjDnbTMap5aA8TIuKZlMMlJmKo6nI65gk0BP6IvhsnopTsN8SMOsabUg9qxWBK1/aec+YJIcE5jXLhtaqursB4IHL4u86qIPJc2FrSkmP0kqqYocvEEeAuS6Cd5NEJYmfLOSmJAEQY2jQRj0pYDk6AjjSrflhfepiNg83yMZDFMvuO4VwK2RyHdRpu22ngMwLsj0Cjdtxwxcfgh4SjTfJDI30lhhLaYC4tn9UpJOVpWsLof4gF/GhiObD4dISA94WbCYO6RtpCeOF+3V2npjp3CsPCpK6ltp/z7zRNd/4vMRGKNKUQkybJWNZan5fXoFWwn43bVQsfK5rwtLBL/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0YS+81BdYxXITmvX9vPnTZjDwH1JVA4Tpy72EtpMGo=;
 b=YjLXjUqK2b7hxfq4UaboeO8UBArNSkWJ2c4tHmNMHFXKzis8PdExz+W7xZd/XW//F/JoxP1eZ73gv0RkUQgZYaA6TSXF0qwFLN/RT6ZZK3bgQdgqChfIf9IddVF5u+2Fctl1WzWwNCC6G6W3Ujecpt1aNrMxOWY+5lLvky/J0UjgHfWBD6FoRaK0ASEmfLk3vFYfrlgUve+WT3Huo1VhPa0Hy5LTEUfFVEOz2WxHJpU1gAG8TwsGoI7TLJtPbh6Hll4TXBMDiGdwJcAlPi9MtieEjKXcbKUqq3Hm1Z7pD9aLge/Qv6xoqCxLw87CysYvBtsdJIkK0VwTLa7jTOgk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0YS+81BdYxXITmvX9vPnTZjDwH1JVA4Tpy72EtpMGo=;
 b=wRNXJ1qE7xUV7IHjJLSwplB1sbVioY2YL5pn84KCDhbMfdMMIABMrrjoj1daZqWTWgLPA683Tky8i3RqBGqiSDFf31MKyBDXE6odoUPUeQynsVWOc0gbcPv5e/Tzp6rElU4d6fT/G2TbpGcnuUGcf8LeU8+T/8P0EN9nGzFv4ek=
Received: from MW4PR03CA0088.namprd03.prod.outlook.com (2603:10b6:303:b6::33)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Wed, 28 Dec
 2022 16:31:15 +0000
Received: from CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::33) by MW4PR03CA0088.outlook.office365.com
 (2603:10b6:303:b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT089.mail.protection.outlook.com (10.13.175.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Wed, 28 Dec 2022 16:31:14 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:13 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH v2 00/11] Recover from failure to probe GPU
Date: Wed, 28 Dec 2022 10:30:47 -0600
Message-ID: <20221228163102.468-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT089:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f06102-51c7-4916-5374-08dae8f0f058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAl2GqjMTguQlUPVmLfhW7IzQ+sVK7wZl6Mdm4RjEzjw4aGkIScjFHtGp1a+VeEf4tKhWVInq8LRo33BPhaAVdutqmuUIfhO7QQhf09vcQ/NMTJYmzhgmHVHQnmuqbmuimTBIhovXEW9k1UN1ds7PLoD8snB4kOzQhVDobnS28KiAr1+xQeZClcRH9XhUvb7fYEcnk1Fjlcz1724lPn3o8a0EEkTF2by6UoyPdYYmrB4BeucUedQYzq2PX4splKIVSlXRye13rsSlf5k5sgCGir9rLO3EINL7bqKwVCXVdFn7T8fVN+lBJ4O36qefJ7klJZF/8YaluJ25hN4uBoQhCuZj92zW/jQZZgtQ3JFFYozIgzkTcYQKy0NRnj0Bm0FAjvb5pfOmlebrTyuSqOqAI7KOzBgEX3WylK8oiIfQylFmJTXOLIzRdZNOsLg+EsOQoS5jOT4apnvjCrLf3lCVUQI5HRrcyKkALcnkLXO357XRv7e25J0tJkGF4zR6bJy8cBJ56NkhGeY18ip4OisapCmT8coeqhzQIZA9zfmzZfELVki308Sq7K1o8mgd/rtBiCYoK0UUqx82+DEnvPq5eywz0zitTsiyyTAHDshWiqEyc72k4WlziooAJ5n+SWfqm3MN4q4SJSOlXKzdXLdSZD7YCzRdBRnDxgn6YfBNrpU9TZILec3B0hLJ9IuR8e1bAjhviwVmKRdQ4xW7EfjLBHfUKj7zJ41FExWoz3SE5o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(16526019)(26005)(186003)(82310400005)(36756003)(110136005)(6666004)(81166007)(356005)(82740400003)(7696005)(86362001)(40480700001)(40460700003)(54906003)(2616005)(83380400001)(1076003)(336012)(47076005)(36860700001)(44832011)(426003)(5660300002)(8936002)(2906002)(70206006)(4326008)(478600001)(70586007)(6636002)(316002)(8676002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:14.6743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f06102-51c7-4916-5374-08dae8f0f058
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
  drm/amd: Convert SMU v13 to use `amdgpu_ucode_ip_version_decode`
  drm/amd: Request SDMA microcode during IP discovery
  drm/amd: Request VCN microcode during IP discovery
  drm/amd: Request MES microcode during IP discovery
  drm/amd: Request GFX9 microcode during IP discovery
  drm/amd: Request GFX10 microcode during IP discovery
  drm/amd: Request GFX11 microcode during IP discovery
  drm/amd: Request PSP microcode during IP discovery

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 590 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 208 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  85 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  64 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 143 +----
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  28 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  25 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        | 106 +---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 165 +----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        | 102 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  82 ---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  36 --
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  36 --
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  61 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  42 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  65 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  30 +-
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  35 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  12 +-
 25 files changed, 919 insertions(+), 1203 deletions(-)


base-commit: de9a71e391a92841582ca3008e7b127a0b8ccf41
-- 
2.34.1

