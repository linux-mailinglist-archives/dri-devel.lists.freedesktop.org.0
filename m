Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0F96E2AB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509010E936;
	Thu,  5 Sep 2024 19:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qv/p5bQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E8E10E936;
 Thu,  5 Sep 2024 19:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9sQQkboj0Civ8dwYXXTuZlzAB1D6AAWC5hxWbwEBrJn3AKW22AdSLeE6QpK2n888VUsUa28UITkOclT5nFMC7+K2fPuiWmZXMRr4iH5izpo5clWIptQwCd9VKvRC8beCSaP5cP1x2hdJDPj98nbgp66Mu26+HVlKRwt5JQ6MPe6SyoulOEvyDgHL2WmVvsRQnf3sIpkqVuYldkZYEmurpNhMQNUeoJkmRgaWIywBBu06/IlY8qel9cIpfuDHnxEu9dsPalwkViVtILsHhmhlZU4Ml8GkjbJ0jCilIO3N0xnLEoju59qLe2m9VVmMzyDFTQprh1H1KKsmv95PpOtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0u3eEGt1AaVVwlxcdG6d6ajvqdM3eN/K67csmaBecA=;
 b=WWXjI4/aleX4n91DfN25Xn8E/W9oZbJj3OX8eLhtPbQoN1mzD36ar2klIfls+cqNWvvFog+MeK+fZGHbQ6oZJIKNOupLtJOXG4i3tV4x8bobJdyKNamS/nMrewSSahefLIOzeB2jP7DuIwg2nnGuh6FqKnvIALwlMl2ixQoaQnUZGaB3AyU4j0GBBWXhXHyZS5PBwMnLcWfad9LWjsfTVKkmk+AOqLaQ8vnZn9tvU/c9r0+WDpgOgTCW9b8ta5wSYeXYBPlE2UeyMMgmbq3KQVw9x6+07XAVle9IRhDMbQNjarvUNL4vdP1/7+YIQSLHCQ5Y+hw3FianH90Md0lYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0u3eEGt1AaVVwlxcdG6d6ajvqdM3eN/K67csmaBecA=;
 b=Qv/p5bQRvkLD/N5mooIrdwXt1gvReSdpMWXhXGfGD7W4aIo8eNVmw0PC92E74qoiNDMdIiIvaNHHi7pnsORUNbQkIVXN8LcsxuSkJx7q1TSsW1l4xcQ0h/RNF5n4nInAwOLoLoz/KMMS1M51oitXhTonmGEgUoQogZ4Z2gC5Iew=
Received: from SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::9)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 19:05:50 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::92) by SJ0P220CA0004.outlook.office365.com
 (2603:10b6:a03:41b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Thu, 5 Sep 2024 19:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 5 Sep 2024 19:05:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 14:05:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Thu, 5 Sep 2024 15:05:33 -0400
Message-ID: <20240905190533.854116-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e51a03-6dea-4cf6-4090-08dccdddc200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ygKm4u1NxXWK8FhcGeMqzuDG0w5XAq0buEnTpx518ChnGPC4Dg6iRaPy4AxC?=
 =?us-ascii?Q?Qm/9MhW3fRq61sMV+azGY+Zupeg6z4Q2kghNThAgZbY3hQcNUKEl/5mY3OXX?=
 =?us-ascii?Q?BFrdN8oXuEqMQMLBa+c93TyID2vyqhwXvUq5aLsLO4zoWXstlBT+2Fgg5NM0?=
 =?us-ascii?Q?rVMz9p1z1m/CksRhciTFNSQa41Tyd4vfOGK2SvbEEzM9KEFfMjSvq6fYVQCe?=
 =?us-ascii?Q?AVC+x4wlKXGPzKbA439DLL3OdUx3EKdysSCbF9QFdyQLV7jWbYtt7hQL656k?=
 =?us-ascii?Q?FqtD1RdLPtnfZzmmnmOzY1ex9c44KnwlUkzfEcQE5KdgKRfWqmKMQVziHu2c?=
 =?us-ascii?Q?R+1LEfF85jqHiIQPhs/Ta7E++VhQm3dqVtNuKRhPOULC9UWdk2BfgLaSQgW7?=
 =?us-ascii?Q?LwAkMnI05kTh8W1TtxXMGXbEOtWbIHJw7Iiu6TGWMwN2fCCX5Sm7Xd2US0jB?=
 =?us-ascii?Q?l2wQAgEXDAv5IKj2UQcd3jDAozS2kCPa0edDJGq6UJRg5F0cIm+nFu2kAoML?=
 =?us-ascii?Q?RxXUf9tkn1s4wcp7O7T1mpSap1dwMyOmYOXJ6aF1ZkxW1FL/a0E14gg9md0y?=
 =?us-ascii?Q?yqbunAGLtdXjq2MciRXP1x15YvHCqA156yKuRPcmJX0Hvx4FpsrqKxrHLabC?=
 =?us-ascii?Q?yImUhnYxevPtppuq4w/lm2zIeAR6f6I/LsVo8yrWqG6VCbmjH3+aqb0jZETe?=
 =?us-ascii?Q?ywjuaJW17TTI3rtR5uA3yFY7DC1Gryk+j5gW6HngOHcj2lK7yfQnQgf7+CLA?=
 =?us-ascii?Q?FDp0Tx/XEgWEodKZbv6V+u4HExO0VosP+Km6BDIyt8mIv4T09ysuiXZrupnk?=
 =?us-ascii?Q?JSk0m6yoH5CWxT8REUhzAn6DmsAY4L+xheWfWoJD1BSldyCTCFI31qYng9rO?=
 =?us-ascii?Q?rPqPDaeAJeuYWiWtsQ39ELl9k1UYCJMKx7bBPRAdBDQw3f0X/HhBh9Yk8+Y8?=
 =?us-ascii?Q?pQA+xhBiakoSPs5yCHaQ3ZyDiqsGvXBQISlKGkjvJkJ49rY3FmYbnk8pmwWa?=
 =?us-ascii?Q?vTyzug6PrWccVTIzMBZrHC0U8HyIlPmXgdpx0LaWgdnKhcGsHeQpCBSO+PlK?=
 =?us-ascii?Q?evzE8jmoj02jJj2zsgJCaI+Qn470UagFwC5eydwp/0eHOqcQ141aoVFaUhwW?=
 =?us-ascii?Q?4RMHKAaEG5FwxWLC5clvX1HmJpI7QDnf/rkDpzNcDKtQoY2hK4KEcs6QzpDI?=
 =?us-ascii?Q?lMVFE3Tr5hdMPAX1kU+c6nbNPFCchXUkQuQ1Go1CcJj9ZuLrdUz4lC5F702V?=
 =?us-ascii?Q?SReoZyr++7GcC2oMGnxKu+7TRJnM+BwoYNJDRgnCS0WCdta2thbQJj+LDYJ+?=
 =?us-ascii?Q?8FHcZBew1tOzBoRCc6DSkzmoqTfTRLubow772W4x5eFLGZFxl8sQjlQgXs57?=
 =?us-ascii?Q?BMT+JnPIQSaOLnfRmCBmn1aCljo9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:05:50.4155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e51a03-6dea-4cf6-4090-08dccdddc200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844
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

Hi Dave, Simona,

Fixes for 6.11.

The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-09-05

for you to fetch changes up to 1a8d845470941f1b6de1b392227530c097dc5e0c:

  Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs" (2024-09-05 14:46:39 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-09-05:

amdgpu:
- IPS workaround
- Fix compatibility with older MES firmware
- Fix CPU spikes when clearing VRAM
- Backlight fix
- PMO fix
- Revert SWSMU change to fix regression

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: always allocate cleared VRAM for GEM allocations
      Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"

Dillon Varone (1):
      drm/amd/display: Block timing sync for different signals in PMO

Jack Xiao (1):
      drm/amdgpu/mes: add mes mapping legacy queue switch

Leo Li (2):
      drm/amd/display: Determine IPS mode by ASIC and PMFW versions
      drm/amd/display: Lock DC and exit IPS when changing backlight

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 49 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  9 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 39 ++++++++++++++++-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  6 ++-
 8 files changed, 89 insertions(+), 25 deletions(-)
