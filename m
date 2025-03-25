Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F2A6E9B9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 07:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD0810E37F;
	Tue, 25 Mar 2025 06:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o4jZjB9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F47610E12E;
 Tue, 25 Mar 2025 06:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnQWqCeq1GQ/5otYFiobXf+G37WP+J/3+sMN6cF4OVqcyCyfxYxkAr2mf38Bo74P4A1CHPcrdmZ/gM7eoWt5HMrsqzFUPwCjnepBSqYIwunzBSyBMx8Z277uX+DpmSOrMjsUYt/4HX4QHPTKkYXgiydGVB/26sBvK+geqGQseyqMobPs+J1fEUHnD1H44YNxlNJZmhmCWBIApLvt0c/0TxTP4L7KL/56ktkX/uv8oaL4piIQdp5HSSLzCC1leQMnDAtjPBrGgDBJOlLon3L4IN5LrTv0qmY703C4lj3K2DVLv28qnT6kenkovBq9n1WwM+5/St/Q4DdsDyRG8L9mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZJZhBByjpQdsCHd2BuL0O0glR9qDpC8Nq0IijUkZck=;
 b=Uk42FaBm+2ZKUKmVtHV6jdM8qcu1bYLW2QV0uimtLNK9IUbCX/S9q1JTcdvsbXXbQPK7upZwxT1rMF97ai0NyaxPa2MA2GKk4nIucA5U3MjFYCKqqRPwYfvpcsD92KGHgD08ggDLZHabspljBgvDKlC+gt0+u9SD+DomcMcDJSvB8aH/+eVs4/DV0Vr7zLugx6lUej6eYlzzXqeUPR8ZGcVG1pBKmZNEbc21e6i+LU1DTZTg3lMEVrEgYH/lXNo4yvGFDrBLoF/LZhM4LgoI8x1FPZLs5Mwy6BenE64maCON5aKTJG73Tq2WYkeabyou4DnAg91DFc5sWk8FsmrD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZJZhBByjpQdsCHd2BuL0O0glR9qDpC8Nq0IijUkZck=;
 b=o4jZjB9+klv/pktnHFttshZiQLZ8ViiuRPtcqgOOJAhHA5PLmO5USkN3Ahsu+UvPlZbekpsiLrfiwb37s52efeNupC24a8nyfdzq+8hhI7DQPVDQ2cFdp6Zq5tSFsEEH62veXcZTLxqCg14XceeZaNv5B7NlbAXaai9MAFdTl38=
Received: from SA9P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::27)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:46:34 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::1c) by SA9P223CA0022.outlook.office365.com
 (2603:10b6:806:26::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 06:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 06:46:33 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 01:46:31 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>, Prike Liang
 <Prike.Liang@amd.com>
Subject: [PATCH] drm/ttm: reserve the move fence space first
Date: Tue, 25 Mar 2025 14:46:22 +0800
Message-ID: <20250325064622.1627619-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|DS7PR12MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d305be-4857-439b-85f2-08dd6b68c808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hEy+gJQgTC3LbB1Sj1Y+/nVbknWPU9foxcfKoLTTB/4zoXEYC8kmAIj5oRUk?=
 =?us-ascii?Q?yPBvBEjHJZyJGzDYdp3yFVzAFicNF6v/7CPqGtdcUK0phs6MM1h+qVN87/ui?=
 =?us-ascii?Q?YHLeNrHEOubl27+IbkOAQRyemFIwWIpTyRqLzV+EsSfgcwjaUuwCXeBXtmGG?=
 =?us-ascii?Q?kZPD0hgesnBgaHPZEC20LXHD4FjhnsuCKwlHGnky2JrIS/A70TbCgCQCBw9P?=
 =?us-ascii?Q?ClNRkRpB2t8W12dHWG12nv4RldqsqtEyQrpq9du/LRn09btYUn2Je/s3l5yA?=
 =?us-ascii?Q?7GiakiFYVvSOW3raFakfnBEhc4XeIzCp0/MUp4gbdC8qaazhIPbjJ/11M/fe?=
 =?us-ascii?Q?GekjUrVChvzJw2SXxBZ1zAs282yvURGwvKV0p/DxvjjXYNSUjjE3Hz/3Dvvb?=
 =?us-ascii?Q?MZSRLhThU+v8EmQEQxhgrsIp7SAH48DxLbDaj7N5pzkawGQgFGpTV9iIkbus?=
 =?us-ascii?Q?Iu5Ku8GJ3oBVihIbKuEYITGiImLq51SL0bM3KouCgd0zEWAsryJ/S8dgH82a?=
 =?us-ascii?Q?T10N+Ln1+vh0WJXpN+6+iTsYuNsHxROQ7q8hSrwVX6T/0eIKDyV8bVka7TtL?=
 =?us-ascii?Q?javgIFHixVOpkJQbs9sj4rQ1Ecl5lzcZddslo+pebkjYDeiVrneN//5r9RWd?=
 =?us-ascii?Q?2t/dXonGGZtmNbD9oNZui0XBXq6LC4uP/9xX3LHPIFb9XSB4J71t7fG5hpUt?=
 =?us-ascii?Q?dTpgl/ij4jrlPeaej3TO/eZdOtYzsBh5b73BvFyCtSzZMhmuMJuGK6ygs7QL?=
 =?us-ascii?Q?vNi4faczTJbMiZ9dig0ebSEtMizEZ5P80KCYp2/qtHr/YKK71Dqb7jeI3z4X?=
 =?us-ascii?Q?G+E6xcv6HbGaIRsR3U9IHcJ70Fv43A7oc0IJX8DLlpbBHKEGP0fczN9H1Nq5?=
 =?us-ascii?Q?JSSCIqsV+h8AnrZUM1cTckXUf54jxb3IyKjNQtoqVy/67g/X9ywqUiUUfgG7?=
 =?us-ascii?Q?Nk9mI/CZj/enKY4GTb6zQPYR9IYx50u4YC/C1xgrI9gatme/i1VgQWoGVXy9?=
 =?us-ascii?Q?qc90I+68TZNFeP7lQVA7+C2r4JS87zX6NVOrpoPznBb9WPxYQh9rFrKcJf8n?=
 =?us-ascii?Q?YqYqovnnQD9uzVokH4uWEPvOP88oX+94NPcOhSqomnFWF2OmLXQORGe2iJfa?=
 =?us-ascii?Q?1hqzm1jEiSSKWrIUxQj94YQ4/NmJe07r5QnkbsgDCemt5fW+iebm+l3eTeYv?=
 =?us-ascii?Q?F8UzrXQmOcN//weoD4okqSn4ShoZ1roZbAhjSyBhbF2I+M7MVRo1Ugb2HsHX?=
 =?us-ascii?Q?zB8UtHacl3qJOR9x88bAbmIRVxFuW8wYs1gKFC21SJ7wPS/XJIxgKOn03/j2?=
 =?us-ascii?Q?qdjr5HJvLxGsoe6wiAI4TfCMpTtEPIhEWZjhK1oQ5jZQ930ype8KCXabUwaG?=
 =?us-ascii?Q?8cfBsXrr8PJeJoPDURPhrhKNsMefUmGFUWDSIPv3DZNUv4zkNIovQ9ZxzKKQ?=
 =?us-ascii?Q?GfWbSboBPyMVJZCji0Sv5RsXIP1Enek24NstG7pRoARBZt9jCtFK+aKWhS7+?=
 =?us-ascii?Q?0UL7X/qsrPAH458=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 06:46:33.2469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d305be-4857-439b-85f2-08dd6b68c808
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006
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

Reserve the move fence space before adding the fence
to reserve objection.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f9a84d07dcbc..d5eab0078360 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -646,9 +646,15 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (ret) {
+		pr_err("Resv shared move fence space failed\n");
+		goto err_resv;
+	}
+
 	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+err_resv:
 	dma_fence_put(fence);
 	return ret;
 }
-- 
2.34.1

