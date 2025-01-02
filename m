Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F262DA00088
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461710E26D;
	Thu,  2 Jan 2025 21:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="scIf6zcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0110E26D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozTb1UGyvuFJXMWWz0F8L4FKvX+JUYs+iVagiFQdRg+SAJrHVnw+5wjAKsN+3DkHc5D5ORmI8hAb37hsTCTP/OVkfXJj3AbD6lsIuIvmjLFESEcZzXSl1QYaWk9eKtUVk3hZxKZ97TEIpb6vNYpw54oABe4MI2F4waJIZ6PVnHgCMXLo3mWM0IGbKSuz3HSNb8dqbWZMFSQnBDItSjS84OllA42JNLgpwpc3F8GKt5YMflrksFYpSLONwLpoHgzT0H0T4rCwV/mtNAhXKE/CuoGMD53IhNCMF+bsurmIqF4oikR9Nt2ogNgyl6Lf7QphfJ8ZuNBb+CMSnrBKGzjiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryl8ldvXibSQ5n41Abv9b3QulLEvie++96yMpk9v/Fw=;
 b=VAciWDHGvvgFry/3QgSmUZbvMFz27VXS+AeSVoPnaMlM21yKhDPUh5Ip69JEor+pXMa0oB7zaXy09OtRPBgZW1eovSU+ppWXpQnOMwhdyx9Oe+8iByIjqadKfPnW3SvT5LNn7q2OvrT7yxrJxqOGnUpXI2KtHVF5nfumEtYfYk3i6ZO0dVxv4VZZ+5JNTog9wTQwgx52ummb0VXTRgmYNM3H9IwRPATgeKaj1a82k+zu4UmEX97FtzDsnn+drQrsxbudjcmt8jQqixwfIsAvvmdEq4w3oHPKknFQv6BSMtrHCFPdy5usPflk6dkHhc52+X9YlTIco7HeXcZKEgJmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryl8ldvXibSQ5n41Abv9b3QulLEvie++96yMpk9v/Fw=;
 b=scIf6zcOFgsyzkxtwQ6/yDwnGz/d4H+EEwjPaILsRKLVPkrIpU8cAzK113gDq2Bo438FMdxCt+bUBUS/n3Gd5ulHP50WUnGRxHhKybNzA+4aC+TaH+JmafbmV0DSAzgyJ96wSNPBjiVHIqAI1/yNQYfY0595Lxeh2UYdN0ph5ZE=
Received: from SJ0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:a03:3a1::16)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 21:22:53 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::f2) by SJ0PR03CA0371.outlook.office365.com
 (2603:10b6:a03:3a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 21:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:52 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:51 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 4/7] accel/amdxdna: Use rcu_access_pointer for __rcu pointer
Date: Thu, 2 Jan 2025 13:22:41 -0800
Message-ID: <20250102212244.1586340-4-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a49c693-ef67-44cf-030b-08dd2b739e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ln7QHgS3rj7bLUJjcfazq1GzVU+mfM5C5390JLp91WD6+1z+hYyqXbzqPFg/?=
 =?us-ascii?Q?quERocRab4UEgiPB72dUTsZcIdc57/wCgFENWE1hIFUuZ9MizrqyBPahvOc2?=
 =?us-ascii?Q?04SmwLcxkH2MGDoUxLe42HtpJ8k3VuV1MpuvqAFPeLCQcSNf5iT40dE3IxKg?=
 =?us-ascii?Q?H1/u/BnX75mkd+lLB7I7ULJ6Brzv00zL8pjtm6/R9TQM2c9IiccIXuOFV/SM?=
 =?us-ascii?Q?llKc/pwerTXxnRDUc86wQYq6YQGG0rvfKqK/KgUjF3cFqlyNlswmRx25rJVJ?=
 =?us-ascii?Q?HLRhzhjtrkC0pC8qszdCK2eR42QdcenqtssjP5wTXkqT+y0D3fOhxpfnzIg5?=
 =?us-ascii?Q?NoZC9Fd0WlvxDGk+JQwTsCMDA9t2hF8e+DZwIc/46xOBpKLQSSeq8HjJAUOR?=
 =?us-ascii?Q?OAauc/wrpfklhsZYZ/BcTnD3DHYiwfDqPwofaf48ohVPHBEaPADjq1hgN8DE?=
 =?us-ascii?Q?uf3CCIcSIUP7ncKxs2wPDtj1jJkgG1tUhxBLi1jlN6k+dfdoO6Amrq+mbUt6?=
 =?us-ascii?Q?kO262MgCyqiZI3aNGdIZWp66aAZZZfMzXb7BeJGtQ2DKy7wZomSuOb491UhX?=
 =?us-ascii?Q?QPQfTjMHEZ9GlD22oayiyfSg1nfFRQ2g94TbEzFPweTXqtmRLBTfly1ujRul?=
 =?us-ascii?Q?LX1unO3dkdAfioYSgBytnT0ARcOWbNHOz2ftB0ZZkRD9fhQgNuVOqlEgT0J3?=
 =?us-ascii?Q?h2b8mx3dExdia7NWbX6jlozdwFZZ4xbMDaaiTfKhouuCjYjA1s/XlGE+A31s?=
 =?us-ascii?Q?tZS4rrR9UIXCNqd1l4un5LvAlyuMHCcQZJ/JpO2AN08Rc/m8mLnEPWyQG2il?=
 =?us-ascii?Q?vlB+hyc6ePrY6Y6/hlr9PZJxvJRhgGCLfHfHuEvunXMK/jJBDf03wDY82Gis?=
 =?us-ascii?Q?3tJPH5dfyZkj/eyivNPowdvEz6am5uv9j7n1XBJvl+Bi2eEI8oYVLLMSU2/K?=
 =?us-ascii?Q?lfayCiV2FM1lMgagAY8QZjbQSzUWdZ4wN12j0aU0q+qpxjB/RQs7/1qHWKho?=
 =?us-ascii?Q?Y8dYxY3IkjHPKsVZabIYsa6GW0zztHn8SR2hpqdIZoB9IkyTuZDl86NICdv6?=
 =?us-ascii?Q?HQdN+x7TK2zSbtuvYhZtiF8NfVM5CW6wM6gJmrw+0OGlQ22vylASeOSnV4M+?=
 =?us-ascii?Q?RNr07q+Gcyhg/DK1OWLA8trbJTRlUSi8CihHiWv2d7R6J7ZOQQeRN5QE8t2r?=
 =?us-ascii?Q?IWh8JuyKOgVlNl619J1bEzqQ/HoNshZw7fqvmgNvv45rIxs7azrrP5fETCHm?=
 =?us-ascii?Q?/y3zr4Ut3/ayfJFNmLezJP1TbHSvOJq8h7M32K13zG9m2xG9CBM37HzWVsqP?=
 =?us-ascii?Q?Gs//uvT6h7/wnzkOT8I8dBVH1CzP6wjiCna6FoQHlZQsrUX4H2FWDXVXlgnC?=
 =?us-ascii?Q?VQJ7/FhhFXPyreqWPqWn5AeRsnL5aC3BDusRi1HWhRwptZYh0GRJj4ZMy93D?=
 =?us-ascii?Q?tIteqR5RsBjdqIryf+7hAxb04rZYCWEzwemtbeycMLy8b0y9thGIla+CoNgG?=
 =?us-ascii?Q?1xTlKSUdFyPPfFk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:53.3241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a49c693-ef67-44cf-030b-08dd2b739e60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268
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

Use rcu_access_pointer for pid in struct drm_file. This fixes sparse
warning.

Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311210.LfeHTzLw-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 194e44fc243d..97d4a032171f 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -61,7 +61,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 		goto put_rpm;
 	}
 
-	client->pid = pid_nr(filp->pid);
+	client->pid = pid_nr(rcu_access_pointer(filp->pid));
 	client->xdna = xdna;
 
 	client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
-- 
2.34.1

