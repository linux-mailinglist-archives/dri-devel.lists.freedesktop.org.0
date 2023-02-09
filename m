Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34568FF8D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EA310E09E;
	Thu,  9 Feb 2023 04:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F610E09E;
 Thu,  9 Feb 2023 04:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sep0FdBlLj8IpNFE6326Qx91wxH1TdddfZ0ybr3HOomLL/gPmHzduRDYzecHgaDWCn/sCPLm2yWScTGxmJJtpRNdtkug1hjXTzrB0wNJ6cr35OBqY03whD/qUyNobn2d5zraVCfbeWwZ6nsx194/EniVD9MI7F25ALPbMhlGU3SIVvXxdselFFS3Q/bR4oR1p+tijgnYt12Jfa/ZsNFGsbiS+VXLFR6nHCYxBRXsXr7vJvF+e8/7mptj2TlIxgeiuPkzbwVcEK3g0XB06Z4eoC9qHyaFH6UK2ShiMZQhMj2k3oUL7W+Kc5hpzwZJEfgRmby1V9GY3dZjxKtGk0MpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkBA5gS65k98TIjI6A3lhNibeWtV57JzNse1WkfD2wk=;
 b=QyA/Tuuv1F1Ep4z6i1j2u0YLapKxaVjJtVUITOOriHd5gyojvYjwwWIIW4IkBh9TpnXmfpEvaIknHEaXCGtijIauIaymMTHydX8++taG2lUVSq0TaaTP9w5nrF05Kut9UCTzZhZT+nA/yaB+i4DAD4b/kwPQUEEnmnbT8jRGNW6ISImgtLgdsHGMjNMhvS7C8wCgetjz0f9yinG0CoMRQpIJ+EQMliKyHXQnaktDh4VbDo6JZU5w8iXmFQmd5iaLlNsCywvM0dEOs3L1YBX6b3V/L7WZj9N28fkBDc5F86Xclo1/gqiN6hVfKxVoCKTDApyVRC/3HWpYv5UAVvRXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkBA5gS65k98TIjI6A3lhNibeWtV57JzNse1WkfD2wk=;
 b=E/73un+g17sqK6eyJOUKYj2mKzgU3IxZsygxZlw+xJDVH6EhcHGaY9WyOHt3iLL/NHdN8x2/vK2CDsjJnxS0IsOJtKeO5CvBuBgKa49KJyRnptjRaoEC17OrgmO90dFWLUyhknOmKUhxYCf3rIw8ksfhwtj3x0cUe1Q+s0pgalI=
Received: from DS7PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:3bb::6) by
 MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 04:53:38 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::72) by DS7PR03CA0061.outlook.office365.com
 (2603:10b6:5:3bb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Thu, 9 Feb 2023 04:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Thu, 9 Feb 2023 04:53:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 22:53:35 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Wed, 8 Feb 2023 23:53:21 -0500
Message-ID: <20230209045321.565132-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT035:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef484d8-c528-4843-1bfe-08db0a599b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDHeMSMRxXnAy1lORyV0kwvSbNcwMcKWuILerWr1SIQfDjBlNWxNU2ZSmydiP9Dy91WbKEDx4QFdl0UBvdnwCZxUFSHe/PNmTF3TcO4RxzZc5eQk2Sn11I2gX99V8bh1nFCowKR3O0XxV7OVOMlFHRgjD4G5TeXCJ6Ne9/L4gfYr2hDz4mJ1mj5nzv++QNyWFWfKYzhqiuDJC5UsRdAvRPJ27CpR578Wncc61Y1lmoAOEgSPQdnTrPxUmMpMYltyfZNLKloKcI/54BbpUc8ZLqseEXhLfdtiZcpAI/5M8YmJAGmNxdMNQN5/uFcwJQqZLHHflyPmymxt7Aw8QGPrw/4sl+Vef2/tjtKtBJhjFDn6YzfIWA3ZN2hgyob8aOvehKfClCx6M2K8Qh9oFch40Z63OFkuQWAvbns5aItRbWQwyHPfjQfO0+Jtl2nlvtfOJsX0R4l5jeGR3RS6uXdHQQS9N8tm4I4F5L2gl0p2+6TSDuw+ctAaRbJAblwBrvXqerY8ErI11iPfpcTelySMXmj0lyglIxMXjn9SFrZKdbTnth28m5/sAdeAqsA/HRiwmB26F0ycsWw+TKVCZAnGcmeKn9VZPMZ4QpdQf3/NM73tX0H2/z6ApeJZcU3QmqWaxZY5AdiYq+6QoL/cpAmjbSpgUnqv1cI5PkJDm2f7SUZmJYvllE3ex0pmnlb2o4vc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(2906002)(5660300002)(356005)(82740400003)(81166007)(478600001)(7696005)(966005)(47076005)(83380400001)(1076003)(426003)(26005)(336012)(86362001)(6666004)(36756003)(16526019)(186003)(41300700001)(40480700001)(82310400005)(8676002)(36860700001)(70206006)(2616005)(4326008)(8936002)(316002)(110136005)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 04:53:37.8196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef484d8-c528-4843-1bfe-08db0a599b6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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

Fixes for 6.2.

The following changes since commit 04119ab1a49fc41cb70f0472be5455af268fa260:

  nvidiafb: detect the hardware support before removing console. (2023-02-07 08:42:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-02-08

for you to fetch changes up to c6ac406cd8ff610a2d5da298b1d3071acfcde7f0:

  drm/amdgpu/smu: skip pptable init under sriov (2023-02-08 22:33:37 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-02-08:

amdgpu:
- Flickering fixes for DCN 2.1, 3.1.2/3
- Re-enable S/G display on DCN 3.1.4
- Properly fix S/G display with AGP aperture enabled
- Fix cursor offset with 180 rotation
- SMU13 fixes
- Use TGID for GPUVM traces
- Fix oops on in fence error path
- Don't run IB tests on hw rings when sw rings are in use

----------------------------------------------------------------
Alex Deucher (4):
      drm/amd/display: disable S/G display on DCN 2.1.0
      drm/amd/display: disable S/G display on DCN 3.1.2/3
      drm/amd/display: properly handling AGP aperture in vm setup
      Revert "drm/amd/display: disable S/G display on DCN 3.1.4"

Evan Quan (3):
      drm/amd/pm: add SMU 13.0.7 missing GetPptLimit message mapping
      drm/amd/pm: bump SMU 13.0.0 driver_if header version
      drm/amd/pm: bump SMU 13.0.7 driver_if header version

Friedrich Vock (1):
      drm/amdgpu: Use the TGID for trace_amdgpu_vm_update_ptes

Guilherme G. Piccoli (1):
      drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini

Jane Jian (1):
      drm/amdgpu/smu: skip pptable init under sriov

JesseZhang (1):
      amd/amdgpu: remove test ib on hw ring

Kenneth Feng (1):
      drm/amd/amdgpu: enable athub cg 11.0.3

Kent Russell (1):
      drm/amdgpu: Add unique_id support for GC 11.0.1/2

Melissa Wen (1):
      drm/amd/display: fix cursor offset on rotation 180

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  8 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 46 ++++++++++++++--------
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |  5 ++-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h | 29 +++++++-------
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  6 +++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 13 files changed, 71 insertions(+), 41 deletions(-)
