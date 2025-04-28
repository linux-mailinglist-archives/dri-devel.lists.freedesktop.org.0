Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D0A9F48D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719A289266;
	Mon, 28 Apr 2025 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo+k6GZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE7110E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 15:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/q4g9rtSHn0FZzy9OUiKFEsf5cMlJoN/tIDCxypWeXnlkLl3RWwznnosC/+cpbVQivU1lGzYIjWfpjbrBuljwE/YpqjHe1KZxPzryHi3PRqMCGahKY5fqjnlcIN29JUffX2DVvbQsKawaNf3bOH9ce2r4UDkHAr6I9kSosqFP9oocvqQ7SCQonwAeiv1CozNIkX9BeKSCDdOwZq7KCwXBNTzrCDxSd27WacAVifpee9WH2bK6Iq2RUFgGwCq9UBDE/oZAtTuWclT8d5mEJr0KwZYT/G0viESa68hJCAuollVxVTJbSgUpzOK502gw9i8lA1Lcmf5BJ9gKs48aSSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmsCr6ilqFY8zo8IPwr/+jcTp5b6HtxHw/QM6IfuHAw=;
 b=eg3GlBH6zlbkjy8UmJlmx4TZSEoGrl2tp2hZaBGXzOOC4StwKb+m/PYeQJ0KE+0kqXO333NagTFLGoZ9j73LMSns1qhjmj7scNXBbEsHocFhmY5EIsnebrt/OE6BY2CM4zSRflGPLdLyuQkhwrjO2P3RieUwpjE/pJYlW2iMongz0+yQhfJUl/772i06LBjHHltdQWBdt1ec0I0rpkRKAY4IVY1aZyMTcczehWA9C/o7Fqac45yXtA5EOaCCFQqMoUzhbY0fb743ucKvrojnJICeFZtClitMbdaVSYZ2oxyNi5VyglaZTlm//EAMRpbxqHYCRzpM79gWprcyhBNKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmsCr6ilqFY8zo8IPwr/+jcTp5b6HtxHw/QM6IfuHAw=;
 b=uo+k6GZgRlYhg0q+grl6a/WrdBwM70ldDfmSjglK2q/RUKxsMNORWYCnEMRAyn8pYSHhAAgY0GqDWbJI1OvaQOPq9UOC/FKI7c1wgmA+Y1ezv3IIIdcGiP6vxwFwS9PsEszgkVRqovhFG3Qt51yPPyomR+VuqA7a/dDuqXBHG60dZhiJLvINSCZnpTriJj+yTE4EI6VJf+xmngnrVbKHB9dxDMHa4Faoic1Vm2QdjkdZfgDe6vUs4/eDpg6xUCICwc4dyBJLNghufXaD3KsdODJdoa3RYA7zGbh3f4gdGw3HQCqDRN3egETwR+cSIUdvPz4UbXShpJ0jdGsqMjctfQ==
Received: from BN8PR15CA0049.namprd15.prod.outlook.com (2603:10b6:408:80::26)
 by SJ2PR12MB8942.namprd12.prod.outlook.com (2603:10b6:a03:53b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 15:34:57 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:80:cafe::dd) by BN8PR15CA0049.outlook.office365.com
 (2603:10b6:408:80::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Mon,
 28 Apr 2025 15:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 15:34:56 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 08:34:40 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 08:34:39 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 28 Apr 2025 08:34:38 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: Remove unneeded include
Date: Mon, 28 Apr 2025 16:34:35 +0100
Message-ID: <20250428153435.1013101-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR12MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 8498084e-9104-4c71-1871-08dd866a3ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0eGJyV2QjLLSQq+uaWXsQZbPWpaDrES8FEb4kUabiRNT8KZ82zu6LjVd8oi8?=
 =?us-ascii?Q?pP1KNZMTMtt7qPAAllINRXCMM3oij04+IORHPveuoza5v0RgTJi5RMM+S884?=
 =?us-ascii?Q?WFdCmCb68vE6MJfc/br7orR4QArVhmzhwtW4tK0j6LZjG2MaG7m3by53ersq?=
 =?us-ascii?Q?xA69QZU1XgaphxuWKCteUedAZMSr0xRXBrpuyr+lwNXmNQ3/p1pjnx01LqIz?=
 =?us-ascii?Q?h9+wsjl94FFuS8temghNwdpVSeaNAUgcN1ia6hAMTw0rtPMDFwShSBDqGH8j?=
 =?us-ascii?Q?/7p9DlR5C7vzzuHTJohwE3bp85njE6YuDjOaAJl/fiPLjNEPV0QAaubP7OGv?=
 =?us-ascii?Q?YdwS9iXPtndnf3wv1st1KFJcFjWQYmrZzMrQYkEhmOqlmM3DHR0E0hmpWjub?=
 =?us-ascii?Q?WyQEWtD6mmCcm8OJMoN0Pt/GGOO/YFjVtAHhjPVYgV2j9lUPLB5dE5oL8yCL?=
 =?us-ascii?Q?VK9RIAJC2d/wS3nxwisXW8GkFyJVCPMhqAbrO5dzPTzHVNAGNXVjYErAbDut?=
 =?us-ascii?Q?Jf/yshFz8j9m1pklRXtNjE47BCf7t57taUYSSH89f/j22pP+esWPg5Vse2ay?=
 =?us-ascii?Q?8lerisR+3irUafqbksVpuIkSsa2XP1t3law7Jwh9HQ/KDFedpumm5r374sJR?=
 =?us-ascii?Q?URPiuXtncUtJAdnInbK3k9tPNaDS5I6mdHe1PfgnEMprBL+uOB2uDmWdM684?=
 =?us-ascii?Q?5T87CPveMeRjg0cNhBip0GRM0Mow8YrmcAn3hKc6tgjdBXnDxleyxAj0SXeP?=
 =?us-ascii?Q?NZ5C6zSKAJ3hPLoRtymX2E8EVOnVsLvijO2Qhw/MunHRiMU5D9BPlYZGHuQC?=
 =?us-ascii?Q?8FceaKj4Tye2nm6OsV75FxzwkJcDghAd2SqMMKIwZy1RKpwWPi24q4JO3LOR?=
 =?us-ascii?Q?PBDPfFSZ0lexfZv6JEvSQRScIKrg84AzUqc/CL8FGk6Ynvi7aUfwLm4vzhj3?=
 =?us-ascii?Q?g5+C11RpBJDWCdTDT2RLG1DRd+7m+9+MN6ebqrFJ9jLkHywbxpzLXLImxtkC?=
 =?us-ascii?Q?/R0o1Hni9Rj8a5cspEJU9XLG+e3F7Y9qN6PHos6DdfGY8zq+f6UhmnvVeLHI?=
 =?us-ascii?Q?NcM/iE8zIeNFi1gxwhxLCrZcWJolwcdBR6Q79JxN7C61tT9kDaJV7yuxCdVp?=
 =?us-ascii?Q?8Hc6R0zN3N/MJSUkfPTvSRrHPbA2RWyT+gM9ZYftYCXdy+z6DP3Lba9H0Q0h?=
 =?us-ascii?Q?aMYctfrvmO/xh3SG0YlY58WW728rNaTC/2uKgqthTdRx422MbocAnlxcqPNy?=
 =?us-ascii?Q?8SniIwtG4qbMuiBrAm0gBmQ+K8zZ6gHXAcAj4OSDaz6ZXagdwtjKhc3Bq8Y5?=
 =?us-ascii?Q?OMFz8D04c/LbmyY1H4wV2AP+EYh3loKhJsrfsOU/1k832lzHcJjEl0f27LD4?=
 =?us-ascii?Q?hQfDQ6k6SAr7PnpJJ5UVIGTE5mSRTnKgzy9NFgfgjyjpPWN3M2FXnzmRfaSE?=
 =?us-ascii?Q?0qXD/BPXnv2Lig8xU8mN2eR7pDO85Dycb17NHjTgPDGUepmXlL6j0WTKTFJH?=
 =?us-ascii?Q?QKZ477eWauVY/YUxJ+seOmAzI0MM0Vt7FyqG?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 15:34:56.6417 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8498084e-9104-4c71-1871-08dd866a3ada
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8942
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

The header file 'tegra_drm.h' is included in gem.c, but this file is
already include 'drm.h'. Although there is no harm in including this
file again, it is also not necessary. Furthermore, the header file is
located under 'include/uapi/drm' so ideally the full path would be
used to be explicit. For now, just remove from gem.c.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ace3e5a805cf..dbc1394f96b8 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -17,7 +17,6 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
-#include <drm/tegra_drm.h>
 
 #include "drm.h"
 #include "gem.h"
-- 
2.43.0

