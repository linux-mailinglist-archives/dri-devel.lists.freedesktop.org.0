Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD460623C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAAA10E5DF;
	Thu, 20 Oct 2022 13:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747710E4BD;
 Thu, 20 Oct 2022 13:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mueup7uWRxfsV7jnnyjtnF2/6X28aOMqoji6hXW0/nF/ADA38We1APB2eL3qrCiO3fIBoIauAwSmC8aAiRNcdBN+efFuBdhH4keOa1QG02BOjaes4j3eYsyaZoROABegk7MHLCiKqrZ5aRsByr5MlVPfZA+1vdNyW3l6I3kEiCqlc/dQ2ylxHAHNYnAKAsPR2Y9Uiuyua8O8fHNeO3XxizH5co+3ovxK0ETpGttJddSrYg3ncJUpUXkimLKpgtnujbvAFi7ZIGKUIRAINz0LsWR3EoSAEiN0Y2lhrBPqnK5XH3GpHnuh3IEr+jCDANI4RjH0pWzdoxBh+0F/Py0Ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkTfoFvNxTDKdXM8tburAr/WK5T+MnaL19yDGYVNBc0=;
 b=FX34Y3mVnJ5tVOJ17zn2Ic6Ew5iZczn7KsWsx0qRLhUOtbxlrqeD94yRynvx2eNWmV1CoE0+Nliywu6Uc4MFhiqsgK3PUVkm6tMdA3TTmBxvFY5+4bGwSX1k9BR7e+vwXHnJxKpAsPZXQHJSbwEH2hCfIyLbIvVTH/3qKoDxSRYJT2MAm9edUTpqeBwFrUVtFgOrzLyFAU0wk2vxayu60ctbfJK5kL87jVcgKLxGULyKx2HLdr4MIBszh5YavQ7dTbRt7bEk/ZYenT6z/hmcKHK06pzmIx6BscMA89VVfIlf3EH+kegnxUHnd1EJVg+6fhl4JPB2NqxsfZAcfsjWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkTfoFvNxTDKdXM8tburAr/WK5T+MnaL19yDGYVNBc0=;
 b=yFztzNx2w5CDfBzBRDHSQ7AP4U94CVA0DpzbcOjRnVZ3JBMHaOqA5K8g3TOjkCyIZ8MSA5DjAVS6PLbrL518TBJhthHOay1M1xgQbQM/I0fvwx7teNvFdVmvhA16FL2Rppo69znwhGzOKRyeKUMMdZ+3S4/Da3pB1ATwVQay9EA=
Received: from BN0PR08CA0028.namprd08.prod.outlook.com (2603:10b6:408:142::27)
 by BL1PR12MB5061.namprd12.prod.outlook.com (2603:10b6:208:310::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 13:52:40 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::5e) by BN0PR08CA0028.outlook.office365.com
 (2603:10b6:408:142::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 13:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 13:52:40 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 08:52:39 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Thu, 20 Oct 2022 09:52:25 -0400
Message-ID: <20221020135225.562807-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|BL1PR12MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d8d231-1a26-4a6d-1ab2-08dab2a25ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjX3ooe6KWODnlVQES+NovCgK4hfbtC3kjixd92EgjnQCq+XU31zxczR5B7HAIiD5BEck7ubUbYwusDLPW/HBRvALpTC49F7LTSHvc/7RZQkk8vldT8F8yzi6Ai5BImQmUExN3QJrE7b5xSTRFF8juM5lJUZmUFzXkmUzgrn+DqTCgQw+R8m+c41N7/elIowMg/v7acyJTmnrxlgP+ZyS5Zjk/bdEZQJg0lAxCxtJdXb7Tx+kdKwckeEaV8HvyS+zsCe8b72Vf22kSqvG0HlSxaYJxp0i5KBdzjDWdBWct9z7Ja0PTzAZikuyzMxIeFjxkN1U9jeeSghdvrk5hNuZlHqp22zWeXTxNXXOGYo/Fxw/WQ44acHA2vMuoeNHEttlHc/cdswnaanx6bnsQzY0Nl/+bk1favrf34PafOxR0lOZ21zi1XqXcTxKJXF5q7C1BbhyeV7R+HaZWLhg1w57GL3nydGgBrneuajFp6Hx8ViQf5tmaSmlowizjV1ZqNpNh88GBJwR1p/DChzKY0XTlda4P8mo8/r3dNR72X3C775Txtfjia1HMOYPfNvYUhYijTUZcDqpA3e/R12hWdQYixKrX/TX4kZkFG8wTSiMo1Qm/5bpneU7qkYt3Yc6asWVO2P3DjW1t/ao+NXT1NKpAPmxKBGasPM27LUr7h5bvx35YxZHnF4ycfDvY5zdPkG5qMP274BWdWYQwHPWAj6Rm/Lfgej7e1XZfhAs5Mvi/19nFVMgLWj3c4+2vWzcumk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(110136005)(36860700001)(4326008)(70206006)(8676002)(70586007)(316002)(2616005)(16526019)(186003)(1076003)(2906002)(5660300002)(6666004)(40480700001)(336012)(83380400001)(86362001)(426003)(40460700003)(47076005)(7696005)(41300700001)(26005)(36756003)(4001150100001)(4744005)(8936002)(478600001)(81166007)(356005)(966005)(82740400003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 13:52:40.3125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d8d231-1a26-4a6d-1ab2-08dab2a25ac4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5061
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

An important regression fix for older APUs for 6.1 and stable.

The following changes since commit 8273b4048664fff356fd10059033f0e2f5a422a1:

  drm/amdgpu: Fix for BO move issue (2022-10-18 22:14:07 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-10-20

for you to fetch changes up to 50b0e4d4da09fa501e722af886f97e60a4f820d6:

  drm/amdgpu: fix sdma doorbell init ordering on APUs (2022-10-20 09:35:51 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-10-20:

amdgpu:
- Fix gfx9 APU regression caused by PCI AER fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix sdma doorbell init ordering on APUs

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c |  5 -----
 drivers/gpu/drm/amd/amdgpu/soc15.c     | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)
