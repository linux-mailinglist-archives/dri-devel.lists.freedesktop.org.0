Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5815B12E1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 05:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B510E5D7;
	Thu,  8 Sep 2022 03:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E2910E29B;
 Thu,  8 Sep 2022 03:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFnZHQ2ZQRqpZ5/THR0uMi/xcxVTOjLOL71wgcAi4IbjOLLEV5GNnV1+ZcWj8KYuBP1Fvo98VIQR6mMISbRr3c9y07QW0Noz3iK54uyYhCVOFPY8Rx23f4PfQmQKHuP54YzHx1Nw8of+NoTZusXzUUnovxvx2FH83uqFW68qv9IYT7IpwzmcLbEXvmzkq/2vRkZ6IMq+I1Ql6zqCTj8+a1bLpoq/++aEFr/Ksrq0nnyV5INyveVltTr16H9TzXDv7feIDun42vKVWqQkOS/BqeQyPj9tqBzOro50zZJ2YRZwSvecsAlb7gTQ6Py4t7BYxydmLU939rzYNcbckd/TTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF9rVpXm41IVZB23gufIFrqxkA0q7NdJi5edRERZMGQ=;
 b=NlTfgo3fzmxw/LTJ+/q+BlCDJdnCEo2bznvzQX0QLGla5YhwcrdgJzBlvkOX3rdXlh/PPFTaQw5YOAJ1Er0tmz1c9kEttpk2Pp8RhKDXbtwNSvOYEANhHtPozlJPOgL2FiNnSO+J7/qFMJcUsXNPy1nlzWNxkVRPCk+RoWHW1TPXgVHyojxcYiLm3+K9sFgEg+9OqBP2GarWTvSdeqehqjK28hhJ1U3gE4gb1oPoeSVTDuWlgwPLhQ7N50LihKdgocJOP5mdrP4ZNPoHIxHJTfw65KGv2xDvqkHVreYylE4oehdSvQ21c6SOrCjBa9fgH/Hs73sAw+sTztMuNs8PNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF9rVpXm41IVZB23gufIFrqxkA0q7NdJi5edRERZMGQ=;
 b=VKROZKeFKwDuF3MJ9E33wDCwH0zE/fslzM0slrAxqOCF37HLetr7cwBVVVMhh2fwQ1u1pjkF67Ei89jkEfilNbRM5dl4baF4kW1ixFaEe4RiGyx/9KCdAjYPtZeWMeIW0TcnUCfM6QGisrSWLyd+BVqUGdVPj4TO+iXntSDgu6E=
Received: from DM6PR06CA0040.namprd06.prod.outlook.com (2603:10b6:5:54::17) by
 CH0PR12MB5297.namprd12.prod.outlook.com (2603:10b6:610:d4::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Thu, 8 Sep 2022 03:24:12 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::d2) by DM6PR06CA0040.outlook.office365.com
 (2603:10b6:5:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Thu, 8 Sep 2022 03:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 03:24:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 22:24:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.0
Date: Wed, 7 Sep 2022 23:23:32 -0400
Message-ID: <20220908032332.5880-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|CH0PR12MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b04f0b-e73d-4a2d-f8cd-08da914999b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4dnbc0DpWTvi/03xLzr2omsVW8jfxlGQbZsouAJJ3LFPGfTi0K7XxXvwuSKk3oE0TDDBX4PpaiPR6sde2dAoU7Eu//mOkw2sCRL6aR7Y7iBmrr4cGxCfAEMOYEe/Q877KVTAFNmQtR9JCnEdWCGx1BxsVxiPohfktRWXss6y8PgQ0ZvCacDN3EjVcTG5ke4vnU8ZhB07CU0xBU+GMSrI0KyBye05TxBXgOqWWNMIMJHNicSP4lIg3FurvSozoCcZdq9pHAkNV05OxQUzZFmLjI4lX0d1C5aPzFLJozyexDTxXRjmJG4ABiYp2oMyD1bHIs/UoySPEr3ITQR3vNqIOiQQScoIFkA5UYItjOtQb3wyicO7rwwjF7TacgHKMR3PD7OoWne0mGTxGbQVcloLJTQA6E8ixfL1/Y1dJ3BEIhREgriKPhb3qvZbgsiJoXtraD7SdXHLIbbhzj82YXuoxLzcqeLc7Q/gVCMEeroTBEX+MfwKQa8bJg3XEYVVKvybKrMNKyX8unQYNI+PWrukHMlHTvQ6ruPRbC/u7nrLqcNSx9LGObW6k+MHO3od8kwWVsTgvXktot72RUblPTLOyuzKzju7zqN+Dk3q34kBR6KggnngHniP0OsATB+wT8TauLzbZF0aNFjNpYdRN1ifwId4UxX71xgVPOyLpS/8XuC3W9m1dNoLWaHCz1s7YJdrHxbjnT/HhQOKFraWcWv4JZcBSZyFYRrd1Yc4SduMgr+eTC0oGoznaxczhl/eDke
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(70586007)(478600001)(8676002)(4326008)(70206006)(41300700001)(966005)(8936002)(6666004)(5660300002)(2906002)(81166007)(356005)(7696005)(82740400003)(40460700003)(26005)(40480700001)(36860700001)(336012)(16526019)(86362001)(2616005)(82310400005)(110136005)(1076003)(83380400001)(47076005)(426003)(186003)(316002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 03:24:12.3085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b04f0b-e73d-4a2d-f8cd-08da914999b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5297
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

The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:

  Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-07

for you to fetch changes up to aac4cec1ec45d72bd03eaf3fd772c5a609f5ed26:

  drm/amdgpu: prevent toc firmware memory leak (2022-09-07 22:52:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-07:

amdgpu:
- Firmware header fix
- SMU 13.x fix
- Debugfs memory leak fix
- NBIO 7.7 fix
- Firmware memory leak fix

amdkfd:
- Debug output fix

----------------------------------------------------------------
Chengming Gui (1):
      drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_header

Evan Quan (1):
      drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU 13.0.7

Greg Kroah-Hartman (1):
      drm/amd/display: fix memory leak when using debugfs_lookup()

Guchun Chen (1):
      drm/amdgpu: prevent toc firmware memory leak

Yifan Zhang (2):
      drm/amdkfd: print address in hex format rather than decimal
      drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL_RANGE

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c                   | 7 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h                 | 1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c                    | 6 ------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c      | 1 +
 6 files changed, 9 insertions(+), 9 deletions(-)
