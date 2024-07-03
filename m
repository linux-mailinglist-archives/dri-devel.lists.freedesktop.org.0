Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C492688D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 20:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911F10E214;
	Wed,  3 Jul 2024 18:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FdFk7q5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F3610E094;
 Wed,  3 Jul 2024 18:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8HcCuzlL2l3LUdzfbgsr71flLrNm5+Ldzu9BbkpnPdecpKX6pAFc8doTxWw4f0R7+VfPSN1J9tXRHwHBWtgj9pwnsg7x+OcSIT63RAGFnJj+DQeL9GH7Yg+yYyKpFVHhpZsMDkpvSm9RYHxnYjTgDOIyfoI0thXK3w6hxaWi+kLrysCh5BgNOTYLEymU0Iuv61r7TSeWe/BH/fnN0NMXwInzkm1VWKYXuBPd/lq78VtQ0JM/TpWTD5Se/2kU6YOgp7Is7RlmyVRajkFNaTx9+2ReAbtuek+NcHp0BQBwrwpd93hcvp7ByBIu0Gaiwa2Z2uYbIJJdmT4KVQo4gN7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvZsM+POu2EMcHg+WQtNhrcdEGudXUhhv/YedvAqPBI=;
 b=HicoX5ek+/Sazhzeb1P0RIyLvqOqMDjRjF2LiyGB5OWLzz8nBYZ3HEHAuzX13BZYMeGfiHVrpwoLo9fEot2+0aj6ld/Mt8zVsiw12upzi6JOjQafNY61S58scmReAYfc6sDxFUPSNC2QOHVWBC+QIIlhxBxB10ftBuCcF/kOYIg1qBBtMXsgWWRUL0LB1vodOM9ADu+r5ENIaLjHmync+5WDn2PAp+VAFAwUNal8QqHOc8yk5Hi+bAdlMiOFrhIcMMfZssSgZ0QJkXKJ63YiBrNT/omVE5OmZSUkVvnPEnrlki6mllGOgnvZMVDhjithyc9b5zz2bbCzRBBj9thvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvZsM+POu2EMcHg+WQtNhrcdEGudXUhhv/YedvAqPBI=;
 b=FdFk7q5dsW/dhqZIt08pqmR63XdjKTptbQlehJeK/Gmxjc2Zgwt8gpaswUQv/fp8v1r0gbilrlTN6PfiNzcokQnsJ0a08NzW9EHcocblEm7XcmE11pX59QQkgTNpBxR0f1Uf2wTt/Eli/aqvdGxpBxGg+CfC8mlCkHFRT1FWGUc=
Received: from DS7PR03CA0300.namprd03.prod.outlook.com (2603:10b6:5:3ad::35)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 18:47:40 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3ad:cafe::e6) by DS7PR03CA0300.outlook.office365.com
 (2603:10b6:5:3ad::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.27 via Frontend
 Transport; Wed, 3 Jul 2024 18:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Wed, 3 Jul 2024 18:47:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 13:47:38 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-fixes-6.10
Date: Wed, 3 Jul 2024 14:47:23 -0400
Message-ID: <20240703184723.1981997-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bf5d39-355c-4ad3-c0d2-08dc9b909d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XylMMwEnWg6TYiTH/uVDD2eU5V5fZ79vrOk8Lkma73cYlQp8KzojgOlADRQA?=
 =?us-ascii?Q?K0QDU2HPB2QeJJ5/7vdKQOtiuDIGiXkhhT0oXiKQu9ZnAsZ8NxSuSOdly5I9?=
 =?us-ascii?Q?aNo93k90HfSFD8aiUTc6ZZEalv7EKGbKKn3+gAxCEDO6eQSRk/+vRQuG/3TF?=
 =?us-ascii?Q?iKvYYHHVvcN12SDFDLHN6ww2mQBPrRFtUywajzCQOYV3H6vvD6siI2wXG8dX?=
 =?us-ascii?Q?qgtKuDr5oOBp/YLiDzUHdguatS/Kbk6WwIEIMwTSU446RyyQ06qvUSYJcXzb?=
 =?us-ascii?Q?JJ/7+scI4TiBs82Gj7DkQ63oyASt4jQYtMSpl6T1lJIhHjB/rvDZ6LXXYFKW?=
 =?us-ascii?Q?pDq99WYcn/5aK1rqvFQ5e8m3p/yrveGW6KtSqdx5F3QtHfBcpJpgpR9KxqBS?=
 =?us-ascii?Q?oENPjWnmA8O5utvTTM6d0W8mfgQ+e9h5UIlzvZ0BdmCYxuQlhl6wu0vTc8OG?=
 =?us-ascii?Q?uaiImiLF8zPVSxnwLOfiHo4O2s3rKvzhruQ6wtgTpqrNLX/Qenwh93YTsg7/?=
 =?us-ascii?Q?cJ66IVze2AAvPWUAfjaqoIM3/A+r1VOIXFUk98jTey9Dg3d6sJJUsE8uXAUx?=
 =?us-ascii?Q?wslYlg+IxrnJCgFs0bvUnbmXDlUEmoCKbhbrVXsAVfKPdhkF1tF4dqqUvlxg?=
 =?us-ascii?Q?VFNP+5xLPOp6lVbSOyAcV7V5lTvak9f16QmVmU6tLIllcTAh8XpV6DoNQ/WK?=
 =?us-ascii?Q?JQ7QjtptqLSHzsVJjdxEOf/mQG6iVUOTl/GET/zFNuUr/5qmUVEr4NjbKpKu?=
 =?us-ascii?Q?fG5jMrs88kjZrxKBk206AnXvrjxuq0Xrxa8F0ilTPsZAUHzgkNTV9AyQEOhc?=
 =?us-ascii?Q?gLdKmdaKh4KfCVvw7ICh83fjMiKBWLrtHcCR9ZmljMlKxTglWx7MpcGVaQys?=
 =?us-ascii?Q?9lqvyatRNlAFuRNTjTsNFQM5VMFWnIjAjieCxNijFwDlO/89IiYGFmiCzzvx?=
 =?us-ascii?Q?Sr6HIXvBRhQuuoJBD9ep8Ryyh5n5ePbsTVhYgRuHKvI8aE2xZEQtbFtVjczj?=
 =?us-ascii?Q?GeWpPDvmJW4OlG5pKj6YPwB9kURUiYMHv5x8XrawdHV7Xt9SmpVaD07XvAiP?=
 =?us-ascii?Q?R8iFP2DPMWaYhCraTcXv101d0oElLzWQUH3jdlJ8sEFc9LEK3zjrPqruZjJk?=
 =?us-ascii?Q?6OAAs8FtZ8V4nhkYSWjUqBcpB8yzW0+a3+RIRNMibnE/yPSb4GvfjpY76L3g?=
 =?us-ascii?Q?WuWCoAOn0oOQt8rTIWeEogHmK0+DyXX/SMPLw0fTPU5j6NsXupdn0e/e6/Br?=
 =?us-ascii?Q?eSqvByo7KapN6lo5Cl7e5Asgy3BzwwHKGrLIvV+ZtPQV4wDHAx3M+mjYQ9wu?=
 =?us-ascii?Q?rfqw/z9Agiz/nCjTy7yuEdeGEaAK8KyUX/QA1Vm5HGFW0xBNt9BPYsWahTJZ?=
 =?us-ascii?Q?WYTjCpOUnweMFnxsVQ9inWyPpzK5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 18:47:39.8337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bf5d39-355c-4ad3-c0d2-08dc9b909d7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
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

Fixes for 6.10.

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-07-03

for you to fetch changes up to d0417264437a8fa05f894cabba5a26715b32d78e:

  drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:34:05 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-07-03:

amdgpu:
- Freesync fixes
- DML1 bandwidth fix
- DCN 3.5 fixes
- DML2 fix
- Silence an UBSAN warning

radeon:
- GPUVM fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: silence UBSAN warning

Alvin Lee (1):
      drm/amd/display: Account for cursor prefetch BW in DML1 mode support

Fangzhi Zuo (1):
      drm/amd/display: Update efficiency bandwidth for dcn351

Pierre-Eric Pelloux-Prayer (1):
      drm/radeon: check bo_va->bo is non-NULL before using it

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupport

Tom Chung (3):
      drm/amd/display: Reset freesync config before update new state
      drm/amd/display: Add refresh rate range check
      drm/amd/display: Fix refresh rate range for some panel

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 53 +++++++++++++++++++++-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 ++
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |  2 +-
 6 files changed, 59 insertions(+), 4 deletions(-)
