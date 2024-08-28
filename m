Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A68963072
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9910E302;
	Wed, 28 Aug 2024 18:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vYyHFY0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC1410E05A;
 Wed, 28 Aug 2024 18:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4V0UuttbkXMrwBYzqrV+6YF8Af1TMnaloyH8RE+p3HgiHgchSvlAGa6pdJdGrRo015Rk/tVIa2R29JFv+M6KVx2EHQNHP0L+EbODzScvXxt6BioV7ElP+N2rhC7jeoG/XXqdoGOz4dyoVcByO2z8sPnKBIZEqTT/Kq/cMsawP3RzB59SHvCBramRF3/W9MXV3c4W8cJr+0B4tJiOUIZNQncnz4+SuairKu8SnPvLvkJd97M4XEzTHVb+9A6YQkRK6UWOy8G148mcPqjAdVJlXd5s7oKoJF1vjA+JAQkE5VbQQUGlBR7Bj1bGZ/wbN3+WlYVtLtlpfDIKf7RhiJOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaYE4VDlz1Cio5bplV9cuMm9CQL6/Ba7OeNO1HDHSXI=;
 b=LFhG0d9PB/NGgVmHMfEA0K0KHqSI1HbTVi9Q4/QUkwhbNrgROiFAu40SP88GAweBly4I84dsjkRVShQH0l496MpH/o89rBVmgFlLy5ga51IX4uHPOxYPn6Fpcb8dVC7Gjvdfi3RyGH/Sc28gw4IQFV0XhAJDFzLsqV55sAMO1Dag1iECWwMJRZ3KORNq0ZR9qU20TBVVKgyoOIjsZKfHtY9IRJN4mqqMv8jQm/wRFk/MzwZ85fEnPYYvqzIasySk9nVemeuFnCofyBOm1Rk6ffPG1yg+GO/jCyYUhHj/zGp3C+uLMPq+rpSYLAV/11Xg0Kb/Kc1QJU9JBBYxRxi/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaYE4VDlz1Cio5bplV9cuMm9CQL6/Ba7OeNO1HDHSXI=;
 b=vYyHFY0YmFxd1yKib+mPT0U2RmJLGgkJv9lGpe3+iP9wE4imkJdoY8VR47k6vB6sFjSRJ3QhXEXdQ8QyIaZMCLqzmUvak1PHyo/OJxNx/epYLGKdNq5A2vqbdMFBFAandRkzM6sAQ1HX3jETHnX7nwXR9C8M3BYoBbwDaYUHol8=
Received: from PH7PR02CA0012.namprd02.prod.outlook.com (2603:10b6:510:33d::12)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 18:49:24 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::da) by PH7PR02CA0012.outlook.office365.com
 (2603:10b6:510:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Wed, 28 Aug 2024 18:49:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 18:49:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 13:49:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Wed, 28 Aug 2024 14:49:08 -0400
Message-ID: <20240828184908.125387-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d2711b-d09d-4fb2-92e5-08dcc792225d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dY8NVV6B4rb7sPcWcKAdkrRmKxi+Vsf4sLpoB5SyvtcqTVGoz2jkX4oY2nky?=
 =?us-ascii?Q?dJgpe4eY9ZdmvOMimfm9irpKeSPTUiO2c/zLDwYIvV+V+9AAqtdYULQ0tArT?=
 =?us-ascii?Q?46N7UWHLLkS6QuFoudCNovxCyZNQgBOhPKVw+aNQbdLWSYqutXdApSFl3wH7?=
 =?us-ascii?Q?+ES6EBAunkm5Vi684sv3+kbO8vj+3Cwp37NxEwfq99RIT14zCaLzsHRe9Gna?=
 =?us-ascii?Q?KUecJDezvKmJ9CEPCMIkCs+konVOW3AOOxfQTuPjRMpSgG0euA885VggVoUW?=
 =?us-ascii?Q?jVWP9F0RvE+5M8eZsh5QPFjdUsfmHcfbPKo2005Qkm7gjsDM+1mq2/lVwAQA?=
 =?us-ascii?Q?sOaEUvA2VYeATlrKEcPeREnSrue34K0Kc/coC0dRvW4nveuVwZhjSAnc7cvJ?=
 =?us-ascii?Q?cSt3ZklqV08+Z/Ee14ND9e9sd+XCqsNJ3mb3RMmgd3taStLNCPFo0KrvcH7G?=
 =?us-ascii?Q?ce2FZaK4nEv4pDAmf/MyittIqypTovbwL7+fIoty1tz+xBs1yzjQ3GYpds6b?=
 =?us-ascii?Q?9cXrBAuSI5F9WxXwbhxJzj/M/EIsj6EEHQKGpvUoqGgtjDS4Rt0If0pexJs8?=
 =?us-ascii?Q?hSnqfB7gDqI+AgPAXXpRcH+Nr6XTS2PhDsM2EQUWdx4xyBerPqoQRHcaH5ZK?=
 =?us-ascii?Q?rxxO5XEOVabsCkkS36Bc8hGRv20NK8Ziy1BpeIz1GR9h0utodF0t6hDDisCx?=
 =?us-ascii?Q?Zloq/yVKkcE3TobPWzay9ig3ADP11udNdq9FagDBL/ZfegheqiOPQ9gVFYLT?=
 =?us-ascii?Q?o8EDEoxbCXlmstwyt9Xq6sqMsW4UQ5ickqj022MDYPZbDxFN4p+Hvo0SppWa?=
 =?us-ascii?Q?g3ypq8+ukG60LRHRGmWMYjGNoYwJbekSyvVG52FQp9N7ycl27e18mVXq0GkP?=
 =?us-ascii?Q?EYtwes8NicdTXxQibZQawpKDduiEnRoROaEjY0DuxmSb8UkfhSwX9ifLtC98?=
 =?us-ascii?Q?x5yw8V+b6TanxACtGcj6AhDAxoZ3ep5SOfo34qyjp0yVo/AR+cPNJ9K+NVLv?=
 =?us-ascii?Q?iz7wfrQfsvl7P0o48vrhAqu8GTxhSxJGhm34hUuJtWaXIoRREIRThwh5/I0l?=
 =?us-ascii?Q?duZu1RYJHTljHB8HFczQqQQ0BTKFLO77lIruKRIMbvz9qBKPCPXCXFQO+fJN?=
 =?us-ascii?Q?iAaekloHImtoo8iFbeI86K7IFHc1TQ8+FtpMPJ6qyxL/RKPWLRGAeWA5O+c2?=
 =?us-ascii?Q?az1eBLkyaVLZHk400mSqSuabDJIKlfktJ4R7+evyXTxjKO+4OdyofKWC65Yw?=
 =?us-ascii?Q?4Sk8ndvHAdXV/aAy67eZedBDUo0h8xbZrzEA1XueU7fkfxhKVVdXXhQLfVao?=
 =?us-ascii?Q?FcSBBjuQwQkvYBuWXk4umf55ywGpztnlkpUMaypUqfwT0UmKGw2u8guFgZo8?=
 =?us-ascii?Q?W/79aoyVPVGRqKyYdJuhFhwg8bAe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 18:49:23.4228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d2711b-d09d-4fb2-92e5-08dcc792225d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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

Hi Dave, Sima,

Fixes for 6.11.

The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-08-28

for you to fetch changes up to 849f0d5880b7494030c4ee1e4fbaf2ca5422bca9:

  drm/amd/pm: Drop unsupported features on smu v14_0_2 (2024-08-28 10:07:37 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-08-28:

amdgpu:
- SWSMU gaming stability fix
- SMU 13.0.7 fix
- SWSMU documentation alignment fix
- SMU 14.0.x fixes
- GC 12.x fix
- Display fix
- IP discovery fix
- SMU 13.0.6 fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: align pp_power_profile_mode with kernel docs
      drm/amdgpu/smu13.0.7: print index for profiles
      drm/amdgpu/swsmu: always force a state reprogram on init
      drm/amdgpu/gfx12: set UNORD_DISPATCH in compute MQDs

Candice Li (1):
      drm/amd/pm: Drop unsupported features on smu v14_0_2

Kenneth Feng (1):
      drm/amd/pm: update message interface for smu v14.0.2/3

Lijo Lazar (1):
      drm/amd/pm: Add support for new P2S table revision

Likun Gao (1):
      drm/amdgpu: support for gc_info table v1.3

Ma Ke (1):
      drm/amd/display: avoid using null object of framebuffer

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 11 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |  6 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |  1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  9 +++-
 drivers/gpu/drm/amd/include/discovery.h            | 42 +++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 21 +++++-----
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h   | 18 ++++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  7 +++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 48 ----------------------
 11 files changed, 101 insertions(+), 68 deletions(-)
