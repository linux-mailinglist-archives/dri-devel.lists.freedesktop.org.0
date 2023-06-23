Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6673C26F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2453910E6B1;
	Fri, 23 Jun 2023 21:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6439510E6B1;
 Fri, 23 Jun 2023 21:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV/FFySl290eY0Q1ed2zIiu1N6jTjFDibKIRcLYH5/vSniWH5KYgaL6l1ypwWCImSt5fQeJXjb/hUuf0Z6uowaZSJzjhl7Y/E36o7wghRYRRMcjDn+rWKpzP4j/59OZ5IvpoDsJo9zILW74ee8fBAPNcg+XfiO6UzV5wuJUt39fu5yDINKqcbtNpPVh3W3THP6x/VpFqBQwJa8uWMnp2coIyRy+Y/JXBwhHBN6Pl/0e5orD77+ciTeRE64eLd3ohYgnRKXv2vZhqLuynrzHfFtW/PO7JmVl7jPZQN3F24sioDT5o3bdLA/K3MiIZwHVayrMoLg8djZMNltGd2SBhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1xYciw7LAaXUBloZLX8gSe3LOLcUKjyDTypmQMi18A=;
 b=WxxjpELMIAVAjvv9uWGac18V94LawUjWiKbpfagRnk49jtrRHchLIt8RbFpNhBtvejAzkia0qnnR8dc98ufp8JSc8jJlT0E277XXopriqv+al4VIRM/DwyOXbaRtzgQDMQjtGdAQffX4TV44bQ/EVUcBOE5bCE05xxEc8hxvyAYsvTX+7bvsgyIiGoVQPJfdsJoHHkpF2SzsQwrMsoyZUROaCxQGSmuZtY8qmNdQma1pdQKMoYcGqv+qZT9WBUcakYbna0bAbIvZPXcTQ9Oo6JmwQY8SNrMZ9Pgffto9hsLYJWlHW3XmcN9DyNKVwfY4EYKO3hNvFk91GXSgJ71ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1xYciw7LAaXUBloZLX8gSe3LOLcUKjyDTypmQMi18A=;
 b=XMl9f73qr96KQKHM3etgna4p8SGWpGBd5ryQlAXwdNouPiTz32TcURIC0KGbyg6w+YiZ7BNMRQZiBpSEqbS7l92hXQak0JuKy3etfi5K5vjTLVN9eMi/lZCOAZnFyay3UB2nirx+0k41S7Zc7uKD80/EFyMHms/+Qg+U52CeV+4=
Received: from SA0PR11CA0175.namprd11.prod.outlook.com (2603:10b6:806:1bb::30)
 by CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 21:18:23 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::14) by SA0PR11CA0175.outlook.office365.com
 (2603:10b6:806:1bb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 21:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.11 via Frontend Transport; Fri, 23 Jun 2023 21:18:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 23 Jun
 2023 16:18:21 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>,
 <torvalds@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [pull] amdgpu drm-fixes-6.4
Date: Fri, 23 Jun 2023 17:18:07 -0400
Message-ID: <20230623211808.7667-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: abb9b466-e23b-4d79-7ef0-08db742f603f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yv52HkUrImWkCcNOLxBpXKAcZjiUrGOBCzxFqBBTK/eYQL2RruYT076mHT/+iJJ0LxUsmsr31Eww+teGYHQ9mVTfWxqV5w2sgmuonl5X1hfwcV0qunwb5UGQzCRyiy5hfOAdC5zQ61sxbJH78t5Lpb8YsyuzSpLcmyfqvacIndn1jaQip7y5BbB0vCU/DaOTzO+MBKo5gEEKCB9eQqwqK4jRk1CaK+r+lTeK8B43Jfb4dLukafVMQWB+gsclLOJMhW4G/xxQbtJIYOzAs5MTjjdMGB4FmY47uO6d9jJWesNxEXqdEE5TY385pxzydZrj0rTcJA09TC+RTMULi39XRPhOOA6JHbezZpxmPX0fzgWYVp2JGr6Wl5A11WZk2TpRkmakShNYrFC6LypCjefeVJ1R5Rfwbs15IxwA2c9KrLm4iwlNBWiuCQ4kKKhrqJEF04J9/W5zUzk9SEB8ySMJOZlgrCvocJqDjAvbu+82T3Bt1NUNPgu6+T8GxcE+Eh8jHkn+CpDe5qm5qdxxhePUZ1ura27VQv0owam5K1pmOHx8WsdZC/H2f5D/NsisYcKqJmFcxVyu+3sr9Pjm19DYijCDbnPKUbwfIwk4GmjtroyFQa7tntMSPViRNjAnW0+MK8ZRxuxNqNDt+1z+w/x8n0uWI3l5H2jzjw1sNCIm7ACcyW6gtNMLjgKHUvKSRMGigqi8MNJNOK1Sc5hWGZg+33E3h+BtsfFEruHlHv0gwl5D7y5ZSXG+ReWj+0bQxNPE
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(7696005)(82310400005)(82740400003)(356005)(6666004)(83380400001)(81166007)(2616005)(47076005)(1076003)(426003)(16526019)(26005)(336012)(66574015)(966005)(36860700001)(41300700001)(86362001)(110136005)(186003)(478600001)(316002)(40480700001)(70206006)(36756003)(70586007)(4326008)(5660300002)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 21:18:22.9491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb9b466-e23b-4d79-7ef0-08db742f603f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578
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

Hi Dave, Daniel, Linus,

Last few fixes for 6.4.  Dave already sent out the drm-fixes PR this week.
I was out of the office earlier in the week and just got this out now.

The following changes since commit 9bd9be5cbaf8a8faa175ef4fba04a5623281debe:

  Merge tag 'drm-misc-fixes-2023-06-21' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-06-23 12:16:48 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-06-23

for you to fetch changes up to 134ea95255cf359a2e6d70308c15243c3fdf8eaf:

  drm/amd: Don't try to enable secure display TA multiple times (2023-06-23 16:44:45 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-06-23:

amdgpu:
- BO locking fixes
- MCBP fix
- GPU mapping clear fix for always valid BOs
- ASPM fixes
- SDMA4 hang fix
- Misc display fixes
- Parade TCON PSR hang fix
- SMU13 fixes
- Gang submit fence fix
- Secure display fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/sdma4: set align mask to 255

Christian König (3):
      drm/amdgpu: make sure BOs are locked in amdgpu_vm_get_memory
      drm/amdgpu: make sure that BOs have a backing store
      drm/amdgpu: fix number of fence calculations

Evan Quan (2):
      drm/amd/pm: revise the ASPM settings for thunderbolt attached scenario
      drm/amd/pm: update the LC_L1_INACTIVITY setting to address possible noise issue

Hamza Mahfooz (1):
      drm/amd/display: perform a bounds check before filling dirty rectangles

Ilya Bakoulin (1):
      drm/amd/display: Fix 128b132b link loss handling

Jiadong Zhu (1):
      drm/amdgpu: Skip mark offset for high priority rings

Kenneth Feng (1):
      drm/amd/pm: add abnormal fan detection for smu 13.0.0

Leo Chen (1):
      drm/amd/display: disable seamless boot if force_odm_combine is enabled

Mario Limonciello (2):
      drm/amd: Disable PSR-SU on Parade 0803 TCON
      drm/amd: Don't try to enable secure display TA multiple times

Samuel Pitoiset (1):
      drm/amdgpu: fix clearing mappings for BOs that are always valid in VM

Sung-huai Wang (1):
      drm/amd/display: add a NULL pointer check

Tao Zhou (1):
      drm/amdgpu: check RAS irq existence for VCN/JPEG

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 81 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             | 13 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +
 .../drm/amd/display/dc/dce112/dce112_resource.c    | 10 +--
 .../dc/link/protocols/link_dp_irq_handler.c        | 11 ++-
 .../drm/amd/display/modules/power/power_helpers.c  |  2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  1 +
 16 files changed, 108 insertions(+), 62 deletions(-)
