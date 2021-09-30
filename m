Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6C41D172
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 04:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368956EB33;
	Thu, 30 Sep 2021 02:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3A6EB33;
 Thu, 30 Sep 2021 02:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cndQF7Ojr+F3xQ8zJup+h9XyD7Z/pFpWNTGk8/D1mUADh8BFhnVQbk2sYvFiXiG03pVBajnM6ilctsXWNPmU4F5Puw61re1ITApXPvI/MvJA0lGIJwtEzfEYVmCSPQ7EyqlnGHAc1GU3UK68zFKWQNGnC1QePdyDjX9zKotzUsdY1co/QQaP0GfypI1vzFOcQDjDshorz6RGKB+tSS5Y+FV/Wc4819EKfeLdqeVUZtpuQeZY85QyI7+KJicfgol29zp+2bi3V4/Ue9i0JrVGTPTzC7zyMsh0wtYUplz/tK/91XaEDx2/G04Tio46bhAQOBCUm1Gp/3pVfPHgRQo4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eA2ocPNe7JJE6uXewQ4ACatZ79fdMpX6Fqbg02w6qdU=;
 b=ZndS7X0aRWyLhkG+3wrgSmgcon0Bxhef4Mv314xBvQXQUBCwizURmzuYYLMWBhTE/YdbPx0L5Oe6CTcIoO1eKZ3jFJQnUTPFZF8Qf9vFlfZHvFSQ3hHSijY6QgToDebVKHOtejMaQt5soWTv6xg6pxBmrS7bYsxONjNT/nS1gthmIFyRIZf90TBPMZBFMSRWZJLxzsnM59zVULiHajhTJpqdbkHM4uDwF0CN/BUTFZkuOpyJ+vPVNM5VGmE2ci6mAzzXPSBf18GeRVii2KEPdDo4uR3zyoQy7w7IZcIfr3hpGog2xwiEaCGO8GOZpELZ42OuqGM1xanprJo+jfgbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA2ocPNe7JJE6uXewQ4ACatZ79fdMpX6Fqbg02w6qdU=;
 b=EWIWqHc3YkuGrX34zpKco+Ppyqhyqe6NtWRIZLsrBylFgc90GuGYNKJsh3vtN9Lk6D8YgWZy9dBaTnTYdN/xxl4aWnPeyNqImmGgdh+kidpOA5u/D0C/mp4el0XH4LodFkDidVv+0bh8X6lWpvoRygkSikfRQe7sDpkeAtfcDHM=
Received: from BN8PR16CA0001.namprd16.prod.outlook.com (2603:10b6:408:4c::14)
 by MN2PR12MB3149.namprd12.prod.outlook.com (2603:10b6:208:d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 02:30:55 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::77) by BN8PR16CA0001.outlook.office365.com
 (2603:10b6:408:4c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 02:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 02:30:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 29 Sep
 2021 21:30:32 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.15
Date: Wed, 29 Sep 2021 22:30:13 -0400
Message-ID: <20210930023013.5207-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 154d2457-a284-48ce-3077-08d983ba53da
X-MS-TrafficTypeDiagnostic: MN2PR12MB3149:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3149253B6AF485F9BA464713F7AA9@MN2PR12MB3149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/KrX65HV5oks68EKRFqZsSQ5XVOxnjrff/0/U284yXAtYvina8uxLSGWi9QJYGSlgK8UsS2jCHzKGkX6A0E0k6wOdHsNrcUKnQrd3fhmSrPsMQOGBtgA/EI+/zmludyDJRzyxMOkpDd7YAUSfKJ8aVsPEkArp0/H5/5vIHwKzy6fCv7D62TGRymxS8MgsI6R1tVdoGejNloSJdwhPZJ996IlO5TjUU7QfLhuxOiXTeMZzwLEC6W9Nrqhzbd1RjJIlgyrrzFvV8I9WQdCO29BLN8M5qKlfd05g2SUOwvqrATevoyJafNL6k1dtr+H/rvwwf1SH7ukefdFsDQHfVBLMQ9m58PqUnlkcRUpG0AK18LbeaCKQUBXWU+qzG0TFPdXKnEPD3cmwEj8ekpUb0Z3lj5cb5XfBiuUfF8tWQNH1JXJTcUjG4fw8cciZ0lyu8SDC/QTvZ7cf1x+0Z7VDfagmkrTyMgAK51zwBtkJ91S1D13LTOvG77pAmfj1mi1p/cNgtFclx9YeUFqaias9oiksgvThamtzG2fWItsFKztjy/iPsattodxQhtub7GePO2a2jZqZItJgM/F9yHPfEr8w8J6Q2VvqOaffQMNDTnz5B+EkHRLRGB9WW8Qsh48V1ANsEKy5UqLaKhfG89eG37UEHba4gVrRVuDmPpv+wEPSoNjiWW6/2aRRzRsoXztWWbdshmRQZxJkKbFRPqIUvNwMeA96hUC4ubLZH+L0JgIW8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(110136005)(426003)(2616005)(6666004)(7696005)(36860700001)(16526019)(5660300002)(186003)(26005)(47076005)(1076003)(8676002)(356005)(36756003)(81166007)(8936002)(83380400001)(508600001)(70586007)(4326008)(336012)(966005)(86362001)(316002)(2906002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 02:30:54.3169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 154d2457-a284-48ce-3077-08d983ba53da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3149
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.15.

The following changes since commit 05812b971c6d605c00987750f422918589aa4486:

  Merge tag 'drm/tegra/for-5.15-rc3' of ssh://git.freedesktop.org/git/tegra/linux into drm-fixes (2021-09-28 17:08:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-09-29

for you to fetch changes up to 26db706a6d77b9e184feb11725e97e53b7a89519:

  drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix (2021-09-28 14:40:27 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-09-29:

amdgpu:
- gart pin count fix
- eDP flicker fix
- GFX9 MQD fix
- Display fixes
- Tiling flags fix for pre-GFX9
- SDMA resume fix for S0ix

----------------------------------------------------------------
Charlene Liu (1):
      drm/amd/display: Pass PCI deviceid into DC

Hawking Zhang (1):
      drm/amdgpu: correct initial cp_hqd_quantum for gfx9

Josip Pavic (1):
      drm/amd/display: initialize backlight_ramping_override to false

Leslie Shi (1):
      drm/amdgpu: fix gart.bo pin_count leak

Praful Swarnakar (1):
      drm/amd/display: Fix Display Flicker on embedded panels

Prike Liang (1):
      drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix

Simon Ser (1):
      drm/amdgpu: check tiling flags when creating FB on GFX8-

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 31 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  3 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  8 ++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c  | 15 +++++------
 7 files changed, 53 insertions(+), 11 deletions(-)
