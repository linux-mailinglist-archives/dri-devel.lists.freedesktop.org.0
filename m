Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614EDB9BCEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86810E7DD;
	Wed, 24 Sep 2025 20:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uEH+mpXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E547210E7D5;
 Wed, 24 Sep 2025 20:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwDDJMDkL8sjDiazCKBPUE/gCtRJ33aPdXp5lzWm9w860NZhdNPq+YdkWJPZCLsv7KKmTSx7odIqPgdqEsL9G7C2LW6oueuA3JgShdUojpregbH0XR2ckVke5XD1/TmijKG00caraF4G90dKzEBkx/5nxxssiK79yEusshXhbWkPQkfz1x1vV06nmj1eSyRZ9SDmCbxDj6spBhJ5TUkMXyj9n9/xdEPxnLljBQ4m9tQ492JLXatacnY/TTvSbr1Z9JbZ36lqRI1+GGyGVhMA07yxCvVgqWbqyRIp9xDH8Y+zMSVcp6PjHSuQq58gG5k1pexzIeZJmioCWW5ObM8PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ejr9ql0RTyT/5OR06+hgp8q0VUlQwJGaJBroz1XtzbY=;
 b=v3eBacxKv+EF5b4tCwEHf2jPOBJsyRi1hfboddRdzlTApLC7REDnWn3GikXnHLCemkrbtp76KCNWm9ASdh/huq1pfAsYm/aFFP7Egdxvji9kOLUqGwzMNrmUOR3iQulVyO7hMK0IFWtRngkh4GJmrgiGqWM0GwVVG+rSHRtp93sh9+PEogur21eGAH+PDFDt8BazIXZ2vdBiDTe/sat7qjwMm/nImoj72uWP1RIOwDdDKXchmFkEUIdcmmRFaKwMKubtzsOEI6jR2kKAXfUjMl1cJBOY+NlPS+vE+BGxwdSv2z9n5DCRgJAUBkHFlD8yVMajh2RYcUo1Q419Lk2YYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ejr9ql0RTyT/5OR06+hgp8q0VUlQwJGaJBroz1XtzbY=;
 b=uEH+mpXaClJgEEVTY2g68Xdw3PbH+gP0EAyRENhAphRleo7rvzP/N0sHyLTSP2Xz2iDE9dxONog3va7W6DRfep9Z/21b+TSEXj536RfGIlpR5JGaXc4EmL9vfYfFrqujha8LBUDLhNyP3Q5181Qe24PYlgGBirjfEN+DFNw0kmk=
Received: from CH2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:610:54::12)
 by IA0PPF44635DB8D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Wed, 24 Sep
 2025 20:06:47 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::7e) by CH2PR11CA0002.outlook.office365.com
 (2603:10b6:610:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 20:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 20:06:47 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Sep
 2025 13:06:46 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Wed, 24 Sep 2025 16:06:32 -0400
Message-ID: <20250924200632.531102-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|IA0PPF44635DB8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 846facd6-8123-43e1-c24f-08ddfba5e427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FNycJgEO3NTzFIhtXKzZKxujRJj3gmSGOMBM2GbD0Tv4tUU60SwtHjMHmkGp?=
 =?us-ascii?Q?hMUHrWaXd3ISZFf6lZcO0xUD+OGN1xZGGT939x+O/XDTvFIQGMZHuYJ6eGEE?=
 =?us-ascii?Q?SmggQQd7YLokzLXnqNt6dpR6v1Gmz67lrfpZioW24dmeQPxrUg6C/A3+FVXs?=
 =?us-ascii?Q?BhzK15k/UkIg46htbrcDtPlmbYsZZMchsyGe1pfdiBNz+0Dn4yv9InILRkdc?=
 =?us-ascii?Q?9kIR17a3byCpVFLGOvBofV6L4h4ALng1OJKkmftP/Qgkba7eSSY8dXcP85nL?=
 =?us-ascii?Q?+rHKkDPZjC0E5fJ21BnPKvym/xmUO+ta58i4QbDD63oHQqUkbfH8LhpoHm8d?=
 =?us-ascii?Q?WKG26d/0pkxd5O/QniPXSuRwHmHnNB/ELREl6bmH7jAFhauo1ECkQ2uAgJj3?=
 =?us-ascii?Q?A/Mw837wqYHAdskc9JfLJvmkqUnasUtH304pRFRjgS0uOOsDRLQwCf7y1sJK?=
 =?us-ascii?Q?rdDVxFlYRqIbNpP6ICuPqPOnklHNryq3Q9Dw8PiRmdngU7ztLkMJIT5MlCca?=
 =?us-ascii?Q?RQZS0b3NDxdFtcI31rGpezfDfDMopOKVCtwq9+FCtT+BuwuxASLhBENUrVKt?=
 =?us-ascii?Q?Sq5heaAtL1RCfAwqWS7QgWJUFfAxKejQiBck/9kj2lsKeB7Qb0SoTs8k5LXS?=
 =?us-ascii?Q?rJQrf/wzB5sF6KUkKjLJ3As+ra4EVqlbNvgU3rNrC5rfR2j2ZDmbTqDElMOx?=
 =?us-ascii?Q?SQwwPy0vbJHoDl/p1Ya9GetlyTBf9XaiWzdCSiDaYKxncUz/vl97zVpch8NQ?=
 =?us-ascii?Q?UxENJMk0op7X/vksW87hu/GM8ZI+U+JNIgNuKwaWEQotHf/dLzg3PvBb7Yu1?=
 =?us-ascii?Q?j20g5SHVgtuhuoijvB84nZQyK5k10Z3k9s72aisKnDbjMMk9DVs2DvhjzkoI?=
 =?us-ascii?Q?qjOq+OV/oc7o7v5hzl9ucYdVI8R+teXjEAcREsQzqE3/KMubVu741jNrjtsb?=
 =?us-ascii?Q?fIE1z6zf0eqDprb//VCb72HHunF0lXosIDSlTQ+5i7wy1GM7tZOCRiC6J88V?=
 =?us-ascii?Q?H27W5UM+iKHg/DyAo0/L3DTF91LWM+SjLo/hq22eA+ogjwUPU+6r98lNK2Tl?=
 =?us-ascii?Q?5TgUgMV/5HVWoU3uGWgMD4b3VI5h0DiL9QENuCwfhvOcUBkgQjb59YDEuomw?=
 =?us-ascii?Q?Nn8NxGWFQXBA+Ap2TP74LYsrmBEYyGqhLKgMM7lRLwLy5G8VAvpZj1up4UAi?=
 =?us-ascii?Q?I8jViXt/8dbdOgJDUUsXO1z9knD+4FpsCqLZDVc28GLY5La7LsyU966LnpGG?=
 =?us-ascii?Q?O1lsHjiz3b3tS9nGvLMEkK18IUOQ3mhMkyD3+hLMwEeUK50ePWhDHCckdUBm?=
 =?us-ascii?Q?6LAwQ8nCXkROgtcRasZ7HWfuvHAw1yqmYPe1fp9OgoYwmGm4ti/Ng+IgGz1n?=
 =?us-ascii?Q?VImD90j9k3ZG+UD1WObU1dBOkh0LdrsLyuP6Y4nvFEdJSwrLn7gzrq25xtts?=
 =?us-ascii?Q?RPjisglgOMPRV+RuEqY1MxBKzXeDZERo+z2z/+7LhUO06wU8D+ISoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:06:47.1274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846facd6-8123-43e1-c24f-08ddfba5e427
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF44635DB8D
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

Fixes for 6.17.

The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-09-24

for you to fetch changes up to 41b1f9fcba62b06195e625bb88c1031102892439:

  drm/amd/display: remove output_tf_change flag (2025-09-23 13:54:50 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-09-24:

amdgpu:
- Backlight fix
- DC preblend fix
- DCN 3.5 fix
- Cleanup output_tf_change

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Use mpc.preblend flag to indicate preblend

Leo Li (1):
      drm/amd/display: Init DCN35 clocks from pre-os HW values

Matthew Schwartz (1):
      drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume

Melissa Wen (1):
      drm/amd/display: remove output_tf_change flag

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 121 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 8 files changed, 140 insertions(+), 17 deletions(-)
