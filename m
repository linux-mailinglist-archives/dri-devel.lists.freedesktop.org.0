Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77878C3568
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 09:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13C10E11C;
	Sun, 12 May 2024 07:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="31rm5TjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9F010E06C;
 Sun, 12 May 2024 07:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+alW+SOnh2/8ltJfBQrdnS529FJ7Qr2f0Mezpc1eizEi61KSDqCnxehG85Et7gI+3baUGvJolkHxQ5zC2aTnZ9jEz9W18W7IAH52Uh/8epGR3aWjpH/atnp/1SMDMJv/hw6TcLU7vpH5XwXf1pD6vQPEvOhBUs1h/6jdvMzh2m2VoA52f8wFFJiKt1dTYIJ+auxcIMQ5lrpXubhBmwQsK2VKen4sdpqO0AXhEFfS0D7TiKY8MLUJKaYi16yHghuyW2YXd4XNSfwRKXaPfAty6q3IRTRA/4IpBjuub094lydflzdbPt5LmZwsCPKx5KNZNBvfZOKGHmcPCXIHs9YyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoL14k5bXFN0MHApTLcFMHzPC1uOLx3mz9BNWMTjqgg=;
 b=k886TaCL/iLNLzAWuUxgCGdQhvAkX6jBJPCixKWCpAnJyOWfiv/XXYIGDNRqcJ6HUEZrnfELnmGg+D86/erbuuvzqHlweEDKZlHungydBWqa9kpwobDYAqRxkUaf8L4NS/KJrsMOk2ctTDwgcSiXU2l02rP0Z/qWWoFTUJVYG9C7FktsyN8MW9nUHvZuELy5zUAG9aiN7s+1rP+5uJYJ62vm55rp26Wy7Qq6KgUOgXDN/F0Q3UQC1Juh8fS+b2740vgMuxZUcCttD2rU4AN+G7r6D6WoS4DYSyoAMw6pkk5qcxN727BNZ3TQXDvmWOlL6HbCWBBuIilRK1qOndofMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoL14k5bXFN0MHApTLcFMHzPC1uOLx3mz9BNWMTjqgg=;
 b=31rm5TjFC5Oxk3VTT3PthRjZTFQNL8FW+fCn9zBS9RRqkQQH2xwyVfKqgYCK3v1CwbnfupGlzKYK/WJvKr/OnCt/HBR4QGBM2+noyBaPDh/2oqmS2emYnt6eJdVyU3FP6AqEhxLGQpEMRI50P3mf5gpnSqzCPEIGPZ8ZETbF9oA=
Received: from BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 07:59:26 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::98) by BL1PR13CA0352.outlook.office365.com
 (2603:10b6:208:2c6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.21 via Frontend
 Transport; Sun, 12 May 2024 07:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Sun, 12 May 2024 07:59:26 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 02:59:23 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <daniel@ffwll.ch>, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 1/2] drm/buddy: Fix the range bias clear memory allocation
 issue
Date: Sun, 12 May 2024 13:29:08 +0530
Message-ID: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: df725afd-ccc7-4e5a-55e7-08dc72597196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|82310400017|1800799015|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fh43b9+HBiJrxTl0nNDj+Xtui4e0ujbmwY/1wRCV5qLvGY+DOcVCXENr6IY4?=
 =?us-ascii?Q?2K6Ynqd1LgQKvPCt87nbfmFGEnai5LI2P95iU2Plq71XFHmJ7HXb3xmRJ1r9?=
 =?us-ascii?Q?bfx6cysbJYglOfyQNLPQpKDEoAM8jjvrkm8MMg/F0K1fW6JC+QGMGnDg01qo?=
 =?us-ascii?Q?ophoUImAioZhNNK8a/pwVShkS7U7V41/eBYcOpuXAj9tii+itCFBweuPr3ML?=
 =?us-ascii?Q?2r0IX5RDXSrldPWdSfWmnjKS4GtE1rmK6YY9Aqw4KhE7r19KAnfIBwAeWyQ+?=
 =?us-ascii?Q?pUdj4v4nIvTdHz4zGe6GeqQ66/0SDsFitQd6gEfNxDAXjT6l8AXw4gXGhTFZ?=
 =?us-ascii?Q?pMnb+DjA+EKJBgg4lgYVKcvtZFE15J33I9ajyWd5XrZVpp0l2vb40+grhJFr?=
 =?us-ascii?Q?cc1vWNzawge0I3YS1t7kr/7rkYIB2rPpx2FaFH5USD+cw9L2246grNntU7PO?=
 =?us-ascii?Q?s6yWTtHim+meaTS4SdPP+JxV1BwtoUU7nJr02edmLvgJid10HTG1dEgq6qRh?=
 =?us-ascii?Q?k/BsfvTq14KMbeDpAHXPuHbza47M/jww8k+C2lH9mKcJEcgg3MTCTnq566u8?=
 =?us-ascii?Q?/4YEdwSwtF5PQDflZBY/3vWaWV/RvfF3fh7Qiu12yeejXTW9xRMdYxowfliQ?=
 =?us-ascii?Q?5dCkUu+et/Jhyx+vmvsmilNaelp1An/RiXDks4iHaadyIHtIrPX7YHBdfSX6?=
 =?us-ascii?Q?79PVBVTg0GC8wDINtsOpjDjsLcqlw3LX9R0CvlQ0H/2n1a17snMTZFwgoPbK?=
 =?us-ascii?Q?CPHMxGJbVmc5clPt0uM29ghLhVH+kGxg9jXVqCPiEQuYDpVa9WVrfGhLSp+I?=
 =?us-ascii?Q?OiAn4EQV51m20DpE3hCK685hcI+Zgf5NuVYQp3YvFOArW9kMIQ6UJIfv2YQm?=
 =?us-ascii?Q?StXocctpwr2OJJns27APltnqfZGifJqTVzmFXS3WZjR6GeNMAOLlplt+Nb9Y?=
 =?us-ascii?Q?oCXQf6e4ziDHuwoxt7Ul+rjcvyoLiBRxTSwOGfHghWpeR+5ZPhOYT/h45jZR?=
 =?us-ascii?Q?1/w3X75AaAl9GDnkURNQJTGmcrDprZ0n8/zdbjFHAgBaj/PG0VgB8cF0XHTI?=
 =?us-ascii?Q?JAdsEWxj0BdY5CpJ9Lr6BRGf/P06jseOtvctyxuubn/H/1dEDj0s38WH0ERR?=
 =?us-ascii?Q?LgZ1Jbmm6Ep69C/r+LfVtDwhcIMjO5z5B8+jrqUC2LNS6cSDe8wSDLknZMQp?=
 =?us-ascii?Q?cRvhhb5rPh1WDyl48JOg4OnRlbU32M0cSHW2MlAmjxxhHGzd49UP1RcV7HDV?=
 =?us-ascii?Q?+qv2B8TwLFPXx5VmOPF4GBYI0HEcjHTWK6lDb2xko0elYq6DCTVa+nuMp0UF?=
 =?us-ascii?Q?OhxZ3fweOIuIP/0YeZCARg4nVI0QRkUZvJh214miWto/3rPhQNAieu5HEKKB?=
 =?us-ascii?Q?q5yiwSyTtjCvXSnunCknc8YzydiH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 07:59:26.2632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df725afd-ccc7-4e5a-55e7-08dc72597196
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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

Problem statement: During the system boot time, an application request
for the bulk volume of cleared range bias memory when the clear_avail
is zero, we dont fallback into normal allocation method as we had an
unnecessary clear_avail check which prevents the fallback method leads
to fb allocation failure following system goes into unresponsive state.

Solution: Remove the unnecessary clear_avail check in the range bias
allocation function.

v2: add a kunit for this corner case (Daniel Vetter)

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 284ebae71cc4..831929ac95eb 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -574,7 +574,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 
 	block = __alloc_range_bias(mm, start, end, order,
 				   flags, fallback);
-	if (IS_ERR(block) && mm->clear_avail)
+	if (IS_ERR(block))
 		return __alloc_range_bias(mm, start, end, order,
 					  flags, !fallback);
 
-- 
2.25.1

