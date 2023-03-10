Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495D6B348C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 04:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACD110E928;
	Fri, 10 Mar 2023 03:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E559E10E928;
 Fri, 10 Mar 2023 03:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ2vRzyw9xDchXlBTjdKrTh0y3orz/XkoAsGHfG1qAssnnM/z9GHEuheK2FKs6kspMWqdTejwR8ZjuU4RTj9zQaRKr6SG1R6EeV1hOgEA2jLBV3CTMzAoLhUXI+zg6fY74ez+ENWF1BgxLFll2TMi/wVHELwAnICyAMh8PN4DJ6DlY6zCi1i0cgd2P6mhW8rCrHvo0UPeGGCFYugA6VFGtE9QkzPB9XX2fQ+PFX9djOECngt+BHXWNylVIDLWiW5aIyR3CqepQQ9i3Ty1BOO6S1pQO3DhFspgoG5+W2T/eFEASuFPJSthwffeNkzRDKlVKA8lvsgJ6wQCnoG1nzrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWSo2bJvMaa2KX7dvFb/a8aE4B46m+q747qWMbxqM68=;
 b=QjPUrE/0F/jiK9YEX6QbS1Pm5ExnKLJNOc2PEFQLs+LhyI/hIGF36OMU8iDA5NieJj+vcLOemhXkWt8/fZmqrTe2ykLI8Ck5E8iVVSrAOhZcO12Cj4Q5ENpKE6k3eq5pPS9sRmOKMb780RlzG80P9jcqIp95a+eWEnDR08bv1BhB1X/cOcctbW4ga0lf99cHmwrEyoJRpcTg2O3KGZeBrlkhJvQWgLfTTOfD3RB/45XxrvdpbN9J/qtOtfSSML6AT7uWQ9NnvTM+jLcdVJXN4Z6WOX0R7YkFPfjrS07oZnP4PwilgkMQY3Sp3yHwK7WGcHQ32NrY8acdUn/mEgskSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWSo2bJvMaa2KX7dvFb/a8aE4B46m+q747qWMbxqM68=;
 b=W3MfDHNMzeIPuZybgpW9/SGBQB307SNwBJBnyGm+KVy22WkY+3fKP7JLakR/8A+EADDl2u2GZn54sdrUtnHqlF/lgSvUIc9v6/RH37za3uMmhJfQqe3e57ToKJEjUhZgHB4sYZ/6gmZFRMs4dAaanQW2maapfCQ3zdu7wdAJGSg=
Received: from DS7PR06CA0036.namprd06.prod.outlook.com (2603:10b6:8:54::14) by
 DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 03:13:28 +0000
Received: from DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::67) by DS7PR06CA0036.outlook.office365.com
 (2603:10b6:8:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 03:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT111.mail.protection.outlook.com (10.13.173.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Fri, 10 Mar 2023 03:13:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 21:13:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.3
Date: Thu, 9 Mar 2023 22:13:14 -0500
Message-ID: <20230310031314.1296929-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT111:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d2d893-ebf5-4ef4-c817-08db21156b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlB0GGrHqWDHJ1U9l2ZrDbfh4xL8snJXHkFj0fKchtUvPg/dQpwT12ULHZ2yivn353UuRC1UHp2bKR3xZtlrAfuP8GddhvGD19KitR6b9ustQjXm3PfHQUxrUzN0zy9jpjP0Cyy6Hxhm43QOC0sveC4OF4NFKpl8GJaDH/bDUA8jryo4EK5c7a71OEh3PCybdtw7bj9OE0OuP57gqeugTNdeB4LhYhb8sXvd/9GrldU/PIWDYQ5CQtfhUSW/xaDGUWdZBGHYR+k4KUw8XuTEHRkydNlpvSSWXEO1mYIh1cATIX6oIbhMIIpTMK6pttFIYEF6TS3zDeduv1OJgJzFODWi8WrL0eX9O25EljgjqU7mheED2Mvnt/YjbKKmCXni3spbFGjEAMDTxzIhfpLqiF6YKp954+yOifrXBtbkCXUbH3n6YEP3TqVJaqh9MN26fKd/NBEiuOawlGy1FCXAXGjvfvDnG9eFbmluZ6kZLaotkCImwtzgqtnyOVRfPDU3X95MiNWSeqConDCEq2c1SWkn9l6o9XnAq95EbrOFqsGWX7PQ+ibu9sSia3NqK4jeaotcV4VivbiyMkGyOGet8tQGcxzm2a9dK2WCrJBVNOSaCKxuZ8zfIm1tirctxwkhk8/hWiCoW/3ZxDFIRqMFJbGANq8+UHR6sMBUFGx0ErLG2sO2EftCWPAGUsR8A/yx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(426003)(336012)(47076005)(110136005)(40460700003)(36756003)(356005)(40480700001)(86362001)(186003)(82740400003)(36860700001)(81166007)(26005)(1076003)(82310400005)(83380400001)(16526019)(6666004)(2616005)(5660300002)(316002)(478600001)(7696005)(966005)(4326008)(41300700001)(8936002)(70586007)(2906002)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 03:13:28.3660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d2d893-ebf5-4ef4-c817-08db21156b81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
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

Fixes for 6.3.  Same pull as yesterday, but drop the KFD patch that
caused a regression.

The following changes since commit 66305069eb6d17d9190cbcd196f3f7487df47ae8:

  Merge tag 'drm-misc-fixes-2023-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-03-07 05:42:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-09

for you to fetch changes up to 6ce2ea07c5ff0a8188eab0e5cd1f0e4899b36835:

  drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4 (2023-03-09 22:06:19 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-09:

amdgpu:
- Misc display fixes
- UMC 8.10 fixes
- Driver unload fixes
- NBIO 7.3.0 fix
- Error checking fixes for soc15, nv, soc21 read register interface
- Fix video cap query for VCN 4.0.4

amdkfd:
- Fix return check in doorbell handling

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv

Candice Li (2):
      drm/amdgpu: Support umc node harvest config on umc v8_10
      drm/amd/pm: Enable ecc_info table support for smu v13_0_10

Harry Wentland (2):
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs

Mario Limonciello (1):
      drm/amd: Fix initialization mistake for NBIO 7.3.0

Shashank Sharma (1):
      drm/amdgpu: fix return value check in kfd

Swapnil Patel (1):
      drm/amd/display: Update clock table to include highest clock setting

Veerabadhran Gopalakrishnan (1):
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4

lyndonli (2):
      drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
      drm/amdgpu: Fix the warning info when removing amdgpu device

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 10 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 17 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             | 14 ++--
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  7 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  5 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  8 ++-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 19 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 75 ++++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  6 +-
 drivers/gpu/drm/drm_atomic.c                       |  1 +
 15 files changed, 136 insertions(+), 42 deletions(-)
