Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0694B6D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 08:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FDC10E65E;
	Thu,  8 Aug 2024 06:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EbG0aqqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6410E65E;
 Thu,  8 Aug 2024 06:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCbv41uWfT9WlG99J5/qzzV40aNyNbTkRiB8hOElphGVcDxCOmsJebgtQ3M/YPO5Y/gcYCahO/ckKkVGS8nlqQXKKa8SwI3ToKCKdebixLg7gJU6UQ7Pb7iJl7m3W1dXYGAMV4PEWSeVx9fhR9IGnIayL1QkGK+U4Z9eBz5r1ijOL4dNUEbJIVr+9bPc7PXkEheLlOL0ILj3x5GmuDUsDlseJxoFe9zxcVAicwX1qZbMsjO75s7XZmpg4Cg/t5/OYbAXDxXq0PPAG40SCJRMWZ1GNXE4dLBGV0czuyRO8pFsgso+yv5afhIq3Ec6FPHchftd74Bc5JqRIr4yfFwhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYrOP5vxz/5PPZTkXH3Sy94nb31dLFOZgHAaPDD5O+0=;
 b=J72DgnZxb8aFR9Sx9LPUMiihIHXfd8vjy0MW7fW8VMHbdsLP3V+/8TMCpusFNozRjP9hjnnTN/SKe0uUrlEirTvhp2U4bvUyGeAjp9uUNhHU8tqrKR7e0DokbYHDilIRwynKj65ycSJgpUr3I33YyurwtdDa9+rI3dIPs75ug7bXuZg6Hw2+A+6BXXsVjDVwSHHoVzcdx4pT/Rz5dj0Vok/7fAvzQqi6jB5fRGy0Z8hJ2HJ2DG6XQh39LQBjB9leXb+BUCefCpLe7to+vTxcoYKfTP6fmvqZUDJrMCeSn5rhB3cKyPlkORJtY+ZxfLvTpNocXC6Cx1bq+bwpDHfTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYrOP5vxz/5PPZTkXH3Sy94nb31dLFOZgHAaPDD5O+0=;
 b=EbG0aqqQ7oTe2/5E2m/BiI0p8ssw3J+lJeppwoYmpL4vs/pDHj8kdy2RdIfbkF7/Ls2G5Wgoiy7GBbjiuCO6CwjsTO7twi8dqBIZCuokXCTJ5iF164QA0uD9ok89WYK01Z7Vm3hmN1j5ZTA9aTY8PB6pokoiMneeWero4YmWmcg=
Received: from BN1PR14CA0011.namprd14.prod.outlook.com (2603:10b6:408:e3::16)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 06:38:18 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::4b) by BN1PR14CA0011.outlook.office365.com
 (2603:10b6:408:e3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Thu, 8 Aug 2024 06:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 06:38:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 01:38:17 -0500
Received: from primary-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 01:38:15 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Arunpravin.PaneerSelvam@amd.com>
CC: <lincao12@amd.com>, <Horace.Chen@amd.com>
Subject: [PATCH] drm/buddy: fix issue that force_merge cannot free all roots
Date: Thu, 8 Aug 2024 14:38:12 +0800
Message-ID: <20240808063812.1293955-1-lincao12@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lincao12@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS0PR12MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8c3695-a42f-4dfc-ee07-08dcb774b07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6AaAgSB4NVtGtGZUc+nbWKL5/sPUWietAoUViVziCrwhLmB9+jzsIC5RwRkO?=
 =?us-ascii?Q?S6sR1yJpTgCFN6UuixsI/UZySt+RiueTAcUV3g/hbtuPJfikpeFJcvpoOu9x?=
 =?us-ascii?Q?1HTMT+GdP8p+UjYWPcIXZkIu3m0dTUmnLRMC1Ca+/g5B4eSzA2H9qrqXZZ63?=
 =?us-ascii?Q?aoTMaNJnrSvzP/50zzaIe7wBjjEyFRyhzA60gDCmKEKr1qmHPbG9fEB3hdF3?=
 =?us-ascii?Q?WSiw7f5McumVlkwi5j/wS7mH3sv4iVKjtkMopp5Z4pSpQbNYEstCLqKdhUs6?=
 =?us-ascii?Q?u9FmHmOslhKKwLtQssaiURwU4gnDlhUIouejJiibn9lHou41BkxlRvX3W5oD?=
 =?us-ascii?Q?3OOSveSdw/A/Q0ejF8xgESh1UZPAkP74jqdW/StPkm3cgCKYF60AUXYaHgYZ?=
 =?us-ascii?Q?Hyh6Cc3v373WuRsVZuOZ0ZGP1Ev1/B0fMbWG5ZPX0ZTMI/wfZpzX1XtRRk56?=
 =?us-ascii?Q?ld0kmUeMkrC+QFiy+KMSfff9NiAAZygO8QHHW2WnUTB3lBoQwZSUrHhsUYc1?=
 =?us-ascii?Q?Sa9OexvpahvnoVl9yU/qzX+fW9YBP0xw3JMteEH0Elsmo7g7pNt9s6AGny1y?=
 =?us-ascii?Q?Yw4Pt7mduE5OlqqGsbHU0HOxCNxzbY+KAKW2Zv22i1iwltuz1VgyAaS6HnQS?=
 =?us-ascii?Q?6xGx/ZNhlT52YYDQbbGmcmRRq2bHCKZez+aJaULd+FPvHzrzD5qwLFqepLxC?=
 =?us-ascii?Q?XY9Jo66dUfdVyQx5a8lAp3rTQBNfR7DjbZPBNODZa+7f82JimDkXvsiwWElV?=
 =?us-ascii?Q?d6vCvx+QPCv6mY9LQ07X2G1cnQBwo2siS3Vq+iGGCsUkbe0yx8N7NwzuI8ua?=
 =?us-ascii?Q?6U2hA0BXAO4pWYw3+Gtc8FhWP4E0ctg9OmT3MKQRf21BdjW2lBvnigU+3bE1?=
 =?us-ascii?Q?XWd8kFrmUDv5nBw46qP/TWpLdl9wKUnYVsSvqtPKGf3EQU6H5ooNJKGvzvqN?=
 =?us-ascii?Q?Cdy/X8t8DXV3jMmQ1rv/Wc5vHAU+alSqa0+agwcGZpAUIb/R5xpomPUtESjV?=
 =?us-ascii?Q?4KQtfFaFGiY/hLHWOy2OxZKefrSW55Jduvlneh2FZpsjqSdA3w/8krRgJmxb?=
 =?us-ascii?Q?igmboO5Lnp/fgu/MaIBA2J17jD54vujaKr6lXEKaIySptWzYGNs3zvauUta4?=
 =?us-ascii?Q?DWs6WTvkM/hORDgeW4yvZCSqVdYK8/DFIY+Iz9RfyWDF2BEwNKURWIqEZOr4?=
 =?us-ascii?Q?z3lVHrxmpiJu9h4KK0EahaUoiYtC1viUGAr7pptNQBc5fPcJN7yqb1o1zFKS?=
 =?us-ascii?Q?VoM1qPldMQ5QbjUhBNo0zbC0CqApr8lRpdCHegrGFQEDLmaQNAh4uAIqM4FP?=
 =?us-ascii?Q?C+HzgYf2MjOrb00/WcFzpAhP7ds/gP7O1wybxGYz1MSMdtERpG99WLcRHG+3?=
 =?us-ascii?Q?1LgGAVP5ntnj59oc3id5UqGVVIj6CglCxncVWrdEDkWommO71WoTaKZFaOF+?=
 =?us-ascii?Q?wLwy06ysPxBYe7LSgBuhcA92Tg1UqtxK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:38:18.4144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8c3695-a42f-4dfc-ee07-08dcb774b07b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456
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

If buddy manager have more than one roots and each root have sub-block
need to be free. When drm_buddy_fini called, the first loop of
force_merge will merge and free all of the sub block of first root,
which offset is 0x0 and size is biggest(more than have of the mm size).
In subsequent force_merge rounds, if we use 0 as start and use remaining
mm size as end, the block of other roots will be skipped in
__force_merge function. It will cause the other roots can not be freed.

Solution: use roots' offset as the start could fix this issue.

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 94f8c34fc293..5379687552bc 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -327,12 +327,14 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	u64 root_size, size;
 	unsigned int order;
 	int i;
+	u64 start = 0;
 
 	size = mm->size;
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
-		__force_merge(mm, 0, size, order);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order);
 
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
-- 
2.45.2

