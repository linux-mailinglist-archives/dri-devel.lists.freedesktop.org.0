Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689275EF7CD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB08810E09A;
	Thu, 29 Sep 2022 14:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86910E03A;
 Thu, 29 Sep 2022 14:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=As1ei89mbGVMrRvFYS/Aa4fyeCQuA9CCB22AYTZWh5jrYwz2DIXKnUEuOvuXmVgclfn3gwhkx8/vPskHDFRI9V9Qr4yBYVOfSfooQRo5MrZuYxuJtnc0wndJF7QhP6G6zdqqvUa/w2ldmYFWnjK5EeM1L9Jtkkk+Cl3B2dV/bLe6+2KiduK0jLSTkyoANcE7mbq6NC5x/a6f0dNnluzsOeIvt4dAPdqLJr1VSNwsL3PrVuQqkNEFzVSC1z41x0THxi2hK+hdIKovXmSJ3Zz5GbTIF6ou7JC3Y73it9rlL0nCjPt2W1keuQTZFU3n75DVzIiztplCzm7u7vOsgvPcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2caXdTnH6mzTrgnjVBqAFC4pnB0Nu1tIsMhfgsIYISA=;
 b=Nf9DEcGUgyUPEZcvICiglaQqZdqFjb0iCboNCMKgR2RWMMg3muexrPp8UuRUPVQADnDrazMoxixe5kSDrLJ+Jm2Ptmahs1RbxZlI6cTKN3VatfUjP3WtweG6MX/lSFLxrG4TKsvmJKDYpFLS/ItLjEe5Vf/w+hfO113GgGDF8SIqhNbDRZpNbtjNlPwnMWSityCEbHjd9JYgM6POQOf0PBze32CrhootyJYKwvFOYPM/yDmQDt7Pf2uUnFaRllYKdNu94T9V/H2gTxTkFw4p8ieT4oGutyplkv1Q+5Z35CIUdDDG3KqU1b2Vr4sM6Aff14ZQB7G27EHXrhtLV8SMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2caXdTnH6mzTrgnjVBqAFC4pnB0Nu1tIsMhfgsIYISA=;
 b=RCbVhYsS6aT05Kqy9G2hjuSIvUUwlgLiIpOvqUuYnqt6Du5A8wT+UR1nkQXZAkI5uHRdbz7f2B3h4diTZkk9SOgdb5FPrP4+GuSkSwxyFEdjR3D4v3n1n2z1xiU3EWheYrEeeSkyZo6tIZHGABS1aRYAsOu0dQb5El8JA++YUVE=
Received: from BN0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:408:e5::16)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 29 Sep 2022 14:40:24 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::46) by BN0PR02CA0041.outlook.office365.com
 (2603:10b6:408:e5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 14:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 14:40:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 09:40:21 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Thu, 29 Sep 2022 10:40:03 -0400
Message-ID: <20220929144003.8363-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3cac35-b739-4fca-6dd0-08daa2288afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76M4k3UWPuW8DS0m/V4qqNJhNs8XNnGMQjCqM+Fs9ZXnwA12V5H1h3cGrWbsfLdBscRfxbIJ4mzw8++GvRnT7I3Pp78giP8qfFUKHg0FMFhDiBQnOYxwkUD9Z2y7zGXmWf8gaf5S9PWFJfJgNokZH2hlA1elEwZ3c52d3+7WI7pm0Zl/K8JxOt0Rb9rhDCuZwDtbe6CKjcXZGHAZgyUbDaxhEx4bJxr859DfntAsWZrAUBYuR9OSEdPMK03h1b1QeYuv6y2h+bfEhHd40z58wu8G+upzmTcvapoLK1lCzunPfnW/NQwQKii22Il3uPdqElNX+QnR0EE1/XetXQ3q0EoRRry4bQ7PaeIHp11eqZFf3OAs51W7D2J2k3bXwOPv0q4x/3l88cMHxhjSsG5t6OhvKU3lchTPj4hE6X8eqw3SH0dCsFULDPdRACCY+bOWf0TGp9zeIgSitIa0pxO8cqM+GzNY5fhjAoHIOVfjJ102jBFh1lch5InWPLWJmQDtKpCZ/Zrx42MUiRFRx6uoiZeaDBOL0QJtYUU6Fx/HOmaOum0oax+DbYK1ZxB4KGnPILFN3hnl7368TOhBp1xgMby+LemPEoKSn3IYsByOVRA2vuDB2zWLD5dz9hkuokal2q0+9SwaLvhUVa8l9Zmz6pFfVKnZh5RBrf1Rue2ro7AOe9GEFG7lnlaMhOqnIbnASdEw0FqxhbC8OP1prgnTf23dQxI6cSTLxlAz30iFPOhNfFLPDS/qL6xpviUBGM88
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(6666004)(40480700001)(36860700001)(478600001)(966005)(7696005)(41300700001)(81166007)(1076003)(16526019)(82740400003)(40460700003)(47076005)(186003)(426003)(86362001)(70586007)(70206006)(4326008)(336012)(8676002)(2906002)(82310400005)(356005)(26005)(36756003)(2616005)(83380400001)(5660300002)(110136005)(8936002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:40:23.9846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3cac35-b739-4fca-6dd0-08daa2288afb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
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

Fixes for 6.0.

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-29

for you to fetch changes up to 83ca5fb40e758e0a0257bf4e3a1148dd52c6d0f2:

  drm/amd/display: Prevent OTG shutdown during PSR SU (2022-09-29 10:07:42 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-29:

amdgpu:
- GC 11.x fixes
- SMU 13.x fixes
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 9.x fix
- Fence fix
- SR-IOV supend/resume fix
- PSR regression fix

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Update DCN32 to use new SR latencies

Aric Cyr (1):
      drm/amd/display: Fix audio on display after unplugging another

Bokun Zhang (1):
      drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV

Eric Bernstein (1):
      drm/amd/display: Remove assert for odm transition case

Evan Quan (3):
      drm/amdgpu: avoid gfx register accessing during gfxoff
      drm/amd/pm: enable gfxoff feature for SMU 13.0.0
      drm/amd/pm: use adverse selection for dpm features unsupported by driver

Graham Sider (3):
      drm/amdkfd: fix MQD init for GFX11 in init_mqd
      drm/amdgpu: pass queue size and is_aql_queue to MES
      drm/amdkfd: fix dropped interrupt in kfd_int_process_v11

Jiadong.Zhu (2):
      drm/amdgpu: Correct the position in patch_cond_exec
      drm/amdgpu: Remove fence_process in count_emitted

Leo Li (1):
      drm/amd/display: Prevent OTG shutdown during PSR SU

Nicholas Kazlauskas (3):
      drm/amd/display: Do DIO FIFO enable after DP video stream enable
      drm/amd/display: Wrap OTG disable workaround with FIFO control
      drm/amd/display: Add explicit FIFO disable for DP blank

Samson Tam (1):
      drm/amd/display: fill in clock values when DPM is not enabled

Taimur Hassan (3):
      drm/amd/display: Avoid avoid unnecessary pixel rate divider programming
      drm/amd/display: Fix typo in get_pixel_rate_div
      drm/amd/display: Avoid unnecessary pixel rate divider programming

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 27 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  4 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  4 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  8 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 11 ++-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 14 ++++
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    | 47 ++++++++++++
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  | 25 ++++--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  | 53 +++++++++++++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    | 10 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 43 ++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |  2 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |  2 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 89 +++++++---------------
 23 files changed, 283 insertions(+), 86 deletions(-)
