Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C94494593
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 02:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7317E10F472;
	Thu, 20 Jan 2022 01:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA6C10F474;
 Thu, 20 Jan 2022 01:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRy/DF+66VL50N/fux268pcUsq9qS/AmrB/I8tv+hlzGZxHmI9p0pzLvb95rqz2KoBJKJbrWyrQ2bQUlLYbYLnmwE417gbRyZb8uzyhSBdMp8oEAOtRLO6Tm2dQ9JPTh/pB/U+/1gSLqEcmG4GaBYJP95LH+sT133Fw1JL2rcMrmKB65Ls7AKa9fpMqo8Z20Y4VQnYyAATwi3bCXcu+L1katScSJkaGF5gsmPAW2MhbyrgwZYuCdVjcxf0j5b+jB1MTA7T5eFql7jsxV+fCTRXqE7wmrE2sYhBBMn9FuqJpAXpmdZFzu9vYyM+PqME97VrHAjyUHQB8EvDQ8M1uDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1bxomhd62mlYUTmZ5r2rPVit89rgn7IaZCAL+CWJAQ=;
 b=G22S6k2NdZSbF1BbG4+zJH+0VXerka6nLObFlh8gxgXDZCAx6u7j7SL+hcU19vxeS7bQ7Yp2nHlgvMfl2ZVe5LxAHgVbrun+y07+8tdyxiKWfL3udCNo94mheDMoC9qHyLbiFcxO3wh9U84VrRPlxiyOs4ZMb6jMQNhna7yhVTsDL+JT7lv89RFBIRTYzjpzudjwWtO2EbKCnlMvvMXEtdWP8TLvCRv/tGX684ZJ3/apKYvWNoP5z/LgFMCBpBd736tKHzMFl5zCfahlj5eebPdkbTXr1PqOci89337gQsB1WCM8EtDUNNrZZEq9my8C5KR7Qr0CVi/FgU2etmksKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1bxomhd62mlYUTmZ5r2rPVit89rgn7IaZCAL+CWJAQ=;
 b=XpbLPwPkq4K49v8BLMfjKH0DyeYvAwHKlKe/rU1ww5Q/bNhoEhu9DxksFknOZCyR7aUp5T1ZDj0qThwdYexuOOGeONCZ0e+OpvLLmh/7jXG9CBeMolfOFyS5fuiGFnWKt3WqkkGaIe6NWrZ4XymE4KqH50wrLshg49B8dxDx7n4=
Received: from BN9PR03CA0583.namprd03.prod.outlook.com (2603:10b6:408:10d::18)
 by BN9PR12MB5099.namprd12.prod.outlook.com (2603:10b6:408:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 01:36:18 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::a8) by BN9PR03CA0583.outlook.office365.com
 (2603:10b6:408:10d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 01:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 01:36:18 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 19:36:17 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, radeon drm-fixes-5.17
Date: Wed, 19 Jan 2022 20:35:47 -0500
Message-ID: <20220120013547.5649-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0579b12-5b11-4785-da58-08d9dbb5419c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5099:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5099EFD22AE75912587E4769F75A9@BN9PR12MB5099.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgeLCDx9gQYlt5RcBh/DQ4bHv2R78bap2S5FwtYv0afPmkZhcAbXE3DuQm7sV3CKxm4J9wGpH61jLn9sr6ES781vCViIE9rSTe2/yLEby1M4JL/DH+61H0BiouYKzmkqdFljqmqdPJ2/HanFiXtYeEvnlWMk1+171yZmmrRyBxCRWjGOeY8MobMjbzknu5nYih8NiT7An/er26dQCTaf6KK/Rc9lU0WvqritBe+qUjaa4A/2/fng9ZqwJsEm8xOLmiVuiHL7IBlLdaug9wNkLtHr6BIJXMgaYWOwCILeGnLL6BmYAKt9HtiLNWuV/uGBNjuH1Q+76dS/ZwVDPyJT7TUVF0gahtK7CJMQeUdCBoVEVWA7O/5x/wFucid/KluIF5vkBMYI/NuyNC2v317tRWweIDR+upZjOTKsU1sVe1QhWp726gVQe+JdirvlSOBg7Or6D+dRsShckNKhQg4WIUEjL+nTVvYvfNV5HSpnFvBk1+6jydt+oXidyO0pPZefY7DoVhef+eL8IEv2TzKJjLSSTjY3h4WMnwOJvsMu23sVjS2f07OQLxnrNzYZwCvF0PL0MXFdGoacmgDeGphbWE8Oi1oGkdinV1bvdSb5AAtEIkbtCzlWAo4wIE90OSDOLT6LRRnmGexnyoqTjQaeGZjbg/gIb5gnciQd2F/5Tx5aGgH9A/H/fkk250R5YOmIJJo2MPepToMIjPxEUtZeQvc5ceZQNbTl8RXkoBQwoUvtQNRGXrmAjpnRXpO7n8Znrnblr9yBr5qmU8qwdas/gIN08WATkSHcobD9cToDeZg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(2616005)(186003)(66574015)(83380400001)(8936002)(70206006)(110136005)(36756003)(82310400004)(316002)(1076003)(70586007)(26005)(5660300002)(86362001)(8676002)(6666004)(36860700001)(7696005)(4326008)(508600001)(47076005)(40460700001)(81166007)(966005)(426003)(2906002)(16526019)(356005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 01:36:18.5529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0579b12-5b11-4785-da58-08d9dbb5419c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5099
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

Fixes for 5.17.  This does not yet include the proper fix for the patch
Linux reverted when he pulled in the original drm merge windows PR.  I
was waiting for rc1.  At that point do you plan to merge rc1 into drm-fixes?
If so, I can just drop the fix on top.

The following changes since commit 4efdddbce7c1329f00c458e85dcaf105aebdc0ed:

  Merge tag 'amd-drm-next-5.17-2022-01-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-01-14 15:42:28 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-01-19

for you to fetch changes up to 4722f463896cc0ef1a6f1c3cb2e171e949831249:

  drm/radeon: fix error handling in radeon_driver_open_kms (2022-01-18 18:00:58 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-01-19:

amdgpu:
- SR-IOV fix
- VCN harvest fix
- Suspend/resume fixes
- Tahiti fix
- Enable GPU recovery on yellow carp

radeon:
- Fix error handling regression in radeon_driver_open_kms

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: invert the logic in amdgpu_device_should_recover_gpu()
      drm/amdgpu: don't do resets on APUs which don't support it
      drm/amdgpu: drop flags check for CHIP_IP_DISCOVERY

CHANDAN VURDIGERE NATARAJ (1):
      drm/amdgpu: Enable recovery on yellow carp

Christian König (1):
      drm/radeon: fix error handling in radeon_driver_open_kms

Guchun Chen (1):
      drm/amdgpu: apply vcn harvest quirk

Jingwen Chen (1):
      drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV

Lukas Fink (1):
      drm/amdgpu: Fix rejecting Tahiti GPUs

Mario Limonciello (1):
      drm/amd/display: Revert W/A for hard hangs on DCN20/DCN21

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 45 +++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 32 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 20 ++++------
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  4 ++
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  4 ++
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   | 11 +-----
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 11 +-----
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   | 25 ------------
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |  2 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   | 25 ------------
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |  2 -
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |  4 --
 drivers/gpu/drm/radeon/radeon_kms.c                | 22 ++++++-----
 15 files changed, 75 insertions(+), 139 deletions(-)
