Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C8AFC1A9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 06:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE9D10E0A4;
	Tue,  8 Jul 2025 04:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0NXs3S5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9215810E0A4;
 Tue,  8 Jul 2025 04:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4l4in5AjeGjm793Sw8PP90nXttoI6dNRtUrT3Z31xcd92/NfYNH358Tccd8oSED4JDof/GlapZUNb4DYzCJqSHBCNbOG3SCCekODcYQQ5xnpyzmUcDz6/L6MBdMdHnyULoEYE8pQufgV579kkjJ1L+0jMjfixs03zmtCT7YSuacfYHpMxgzfs4RFGmMazy0M+RejlTwylC+yageiS/wXLUzOshyP7g8ZnUh9oMrrBaKa4jP0g+mBtj8HA8hqL/yGx5FV/NDbxsW/NiyQyThgZCLFIq6o4H0TWeyw+3glscloaX5Ozo1QHIC1o/beI5fhmI6gpfaD01kOl+zet00fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB0/pPePcSiOt58jzp/3wnePr9yjz+L0J6VRMzfL4bE=;
 b=v9XV2mGwP7odJ0z5kpigntWciNqNLkJ63ZmxO3aGmUGL9Ma+dPd3qzQGTiFu5x2PlWDCuYAFQHuILCxbijmm/w4SBWU3G6680myz/GFGHVBJMjTbadHma2vqfl/kn8lOypwOpDkTSI2nKv/O3Tb2t6iFzubTbijixZr3Uo61uSkI+Lpv9COT4tapFstVd3k6JbGowuR+S5EZDQz9/GHH9AMlgZS/b6C52Uy7oUyRgMZ4uoO4gT0XLRWvpCjtxDaL0jNHLYd2H/gHe2nGp1qPcBZbt62mPn4wqcds775anpbRnJX6c4iBPdPpWKm3F9ynWHDASZ2JcsMt8jUIxmKF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB0/pPePcSiOt58jzp/3wnePr9yjz+L0J6VRMzfL4bE=;
 b=0NXs3S5dEs7SEXoUn2YaQ7jqHmAFYSPz3KhYjmlyCeTb6uuggQNxsAtpRbxGtEkVWGdAZL6Wl7DdGbxiYdz1J6dGK4iuyYTkXaQBMDRMgslMc1NH6nDfzbNL4hSaoZvp+Fh+7uL+103OtaXhcx2E1qE2+LprSLBa2XAxmoelx4k=
Received: from SA0PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:d3::6)
 by CY1PR12MB9557.namprd12.prod.outlook.com (2603:10b6:930:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 04:22:30 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::11) by SA0PR11CA0001.outlook.office365.com
 (2603:10b6:806:d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.28 via Frontend Transport; Tue,
 8 Jul 2025 04:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 04:22:29 +0000
Received: from amd.com (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 23:22:27 -0500
From: Geoffrey McRae <geoffrey.mcrae@amd.com>
To: <Felix.Kuehling@amd.com>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Geoffrey
 McRae" <geoffrey.mcrae@amd.com>
Subject: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Date: Tue, 8 Jul 2025 14:22:19 +1000
Message-ID: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|CY1PR12MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 20774a65-23cb-46fe-a5b5-08ddbdd70d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UCFKhOw7d93JgzgBzd9K1NeCq7XLHmnmqOrQON6hyCCVozvpXStulr3JPP8+?=
 =?us-ascii?Q?wIq3tHKRsM0Uzh2rm9g9u7S90yHCtB5OK9jmherRBfwrzAQUZX47cRUlOppK?=
 =?us-ascii?Q?f3pgZcc4UfVTE/Y+2OsnqwlojRknMR56jLOp40G0e8ASVKC1rQiWcWtgKv1Y?=
 =?us-ascii?Q?DY3a5LO54dc2wZHEMPv3QMgk6oMOoCAC/DmJXxrCeuKsX+9xVLMqX28nTxO6?=
 =?us-ascii?Q?sdeg7ukheyqzCbPtUK976pd3z6sicm91fFpxReuUlYleSqAOWmQwsFqvc20E?=
 =?us-ascii?Q?9iP1dw/lyhkRa83tXoHvHcPsmBa8RnvO2POSzl0V1tPkkjxo3txsdGlYm5m8?=
 =?us-ascii?Q?DsE86wALo1ap9+LFUSpER8exDQtKbt4ILPzOsCXPS03bT/tTAdaK6aiyQjqY?=
 =?us-ascii?Q?gIlHdV+uKh0Ajf7C8FyNLLlDTW5gi8SIcBBJBGx7i6U0GuBXgXEg7H3qdo21?=
 =?us-ascii?Q?46AVKeCkbkwMlP6rQcQAdKJuR11DbS7z74lJSbKFB0M/Sm08xxCpOYFxYxc8?=
 =?us-ascii?Q?Bbna/iIC5JfY3DWzV/XVnAIAEP6JQabNqfQkI3d5dZD7S203Dt/7Durd9Cov?=
 =?us-ascii?Q?ScArFNAlvlTeoMhkU4d5HC0+uYyyKd+Xmd5n7ttBl3o5lFd1Xadp/Tduc3XZ?=
 =?us-ascii?Q?1ZZbyqNuVq9X06sLKQzMrfCqbTKqPAy7n4LU/nxU638io8ST5H4B2gntdLeH?=
 =?us-ascii?Q?juPVOIIWqVmeNVqjKNLTfvm4sE9AdwP+lEcEUaYZF6FOaSPAiCvy0KKZ0bKO?=
 =?us-ascii?Q?PakEq/G9fbazgBWywBElCDucb5G7n5ckDdM26KnDsk7QZIa2AOVQbRVdf3b9?=
 =?us-ascii?Q?KY39hwgop3bWTTsTvuhaVjmu7L2fIGJaHIRKB7FEaRUNaYY1F+gTXbDveVDr?=
 =?us-ascii?Q?IdN5WGzFHeo1p4PXJAHh7GJbmzdzNDwHQ4Ohn4bI2Z+B0NSx5IlpYsZcM921?=
 =?us-ascii?Q?Ab01Ah0kMYDdmVdcj8S0Am5eNMHaiTpQjJLvUpvkfU+c7EAn9rOayH6NbaSC?=
 =?us-ascii?Q?Adr6c6Vegx107rhLgtdCRpbjd8b4baG5F3bZebMvf18i1LEtx57ynJMtIJsN?=
 =?us-ascii?Q?5Li0EMkQQewgFgyP9lZ4HjAt/Dj2BxFwCADdSs6tDmFJSGwlIQxgBUNVyGzY?=
 =?us-ascii?Q?Xva1VGqa0B7v4C29lA9ZtCucUyW8giWz47Am/5ODYAfidJsp2Omm84YORhoe?=
 =?us-ascii?Q?+Cy/d2IlsPF4Q/hMCA72FJkNT3j7Uq/+8oZnLCMoSDcjysZyU2tNbyCn8IHR?=
 =?us-ascii?Q?LDPyyPNbzvs33+FUoXACqZHjM3ZdTgCquFeEmworNATCL01hHVH1TNlkgOx0?=
 =?us-ascii?Q?vnvnp09LUMesCE+6VhUhRqsEuugkpij20MKXmWUaMDtTCqkrioHcNcBIHxIT?=
 =?us-ascii?Q?BcFGI7vaH9pPFwDO/FvBw1fOetF8iPa6y/ZGFOMA7/SQhVFgUDEHvlMeTyAC?=
 =?us-ascii?Q?b7XbPeEBq2sN+ZZkj6+jxU5cK2tBJw2whqCbsFueJzKMjeBe7VyoEzlZOHqn?=
 =?us-ascii?Q?4mwB37UI+M6rLBn6JKMdClP3ojo1igNwmwxv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 04:22:29.8568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20774a65-23cb-46fe-a5b5-08ddbdd70d89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9557
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

Some kfd ioctls may not be available depending on the kernel version the
user is running, as such we need to report -ENOTTY so userland can
determine the cause of the ioctl failure.

Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a2149afa5803..36396b7318e7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	int retcode = -EINVAL;
 	bool ptrace_attached = false;
 
-	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
+	if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
+		retcode = -ENOTTY;
 		goto err_i1;
+	}
 
 	if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
 		u32 amdkfd_size;
@@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			asize = amdkfd_size;
 
 		cmd = ioctl->cmd;
-	} else
+	} else {
+		retcode = -ENOTTY;
 		goto err_i1;
+	}
 
 	dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr, arg);
 
-- 
2.43.0

