Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311F95017A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4A510E2D1;
	Tue, 13 Aug 2024 09:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lDtXggFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47510E2D1;
 Tue, 13 Aug 2024 09:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beQweovu19vg63vplZVlPZM87V5joLlTXiBLz2Uf1ujTPNyRLjnY43k/S1Al5HXAktwFg1MkyhnHD728C6Xakxjla/HcD3p303reM9EJNnZNkwucaclrJv3P4loGhJHCbU2bEEjDInZZYLFGj0q8AjZ6XBWELgubOkqvUnkaQQqOpUM5rNyKhGZR2w/sKMg8gD1jruY8nMUTWRn1RZaVbRuIWSRHLWkIitH8v42LC77rg8ktn2TJAsxDuXwFkx9wDQt6E3YCqOYJgUu+Q+2AHj8QQ0x/b0hZ+cRwVjm+IcXmp6n7fnRfRgI+fU9Pad7UyYhhLZbdAiyCQsFas6ARzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxahj+yaWf5SRbDMCi1bnDFOdmAmyI+q6AKQ9dC+Kg8=;
 b=TnlAQQXU7OMklnzloPFDqWdRVdfD4CcPmaI7t0/pe0X8/Ksu26GZ02zTpxr9K+p824AQgRe6E55QfKM8rJapRcWZrrbjQPElIA4pUG19p61nkc1sWq/Kd/aa3KVzPw6KYZmASRRYG+Q0KtL5gIlz8FBEd1YSGMQOZnVStuxSa1YgjLBQnrALg7IOwyzCA9W6tsoD8obsNIsjDmPkrpN+Ljh/+19BD8tQmPAJQRzHGXcpt1SwnGcFJbLOOuTyLzeAJaTl5zqY9VRlFmN2k0wIxjnGJ2I6hYG+bXjY+UA7mXHmnGT3Bwyor+8AoLOEJzUNaxjJQsS6UxeqacnX+wbgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxahj+yaWf5SRbDMCi1bnDFOdmAmyI+q6AKQ9dC+Kg8=;
 b=lDtXggFddQ/VdNlyTRQ3yqN4thUF534de416ImQUy6bdtGHu91s0ffZWmGdZJZLdY4bHrdNURORqXpN4AVeH7UAouHhlRFGGozd8ZvVahd1U8yftwnnK2DLAALBGDC9XyHzUYRkEvqHCU/OX2N3upLmMFlkSpib69LDPeMNB9TA=
Received: from DM6PR11CA0068.namprd11.prod.outlook.com (2603:10b6:5:14c::45)
 by IA1PR12MB6068.namprd12.prod.outlook.com (2603:10b6:208:3ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Tue, 13 Aug
 2024 09:44:57 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::74) by DM6PR11CA0068.outlook.office365.com
 (2603:10b6:5:14c::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Tue, 13 Aug 2024 09:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 09:44:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 04:44:55 -0500
Received: from primary-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 Aug 2024 04:44:53 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Arunpravin.PaneerSelvam@amd.com>
CC: <lincao12@amd.com>, <Horace.Chen@amd.com>
Subject: [PATCH] drm/buddy: fix issue that force_merge cannot free all roots
Date: Tue, 13 Aug 2024 17:44:50 +0800
Message-ID: <20240813094451.1478481-1-lincao12@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lincao12@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: 2829f71f-24fb-41a4-8e3d-08dcbb7c9744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mAxXT7LQ4C0qSoaBzi5bh6qebKW6vvfasLyGRNUCuvccZMYXJsF/3HfPuIvo?=
 =?us-ascii?Q?ySP+bdrbQ+DJ+xYiYeda+UHJMxkEYtLJZzasRw34dTJJ7m41ezjwiik5A8lW?=
 =?us-ascii?Q?k4rslKNG1ULmHNYJQk3Ga+qooLLA9LawavnNbw5G9rpCj13+jecwn4mwqu5s?=
 =?us-ascii?Q?wosKlq73Pj4T8wvOkaDXXr34mAg+o4TT8FCjZ8foO+8O8QpleXP08X2j2Wee?=
 =?us-ascii?Q?ql0BbGghoKgBKXXSLXGXIAa3E113ZKend0KX5kqDuu8asGZ3YZhVYEEmZT33?=
 =?us-ascii?Q?5N4kryY3QuXxJ+G6sLTl75zAqp1gb/5v3UTUalqpufOu0N8CA6mzg310H5o4?=
 =?us-ascii?Q?pNbcGFM349OpHLB/E5mVXYGMM//LHn0wQL6eDFeeBf9kGz5KQk4/RvDtJa1L?=
 =?us-ascii?Q?MFb0K0DLt4vnQF4cJ+zLOsmPshj/39jeiSZ9P9hCokLb3eLh5WUupe3Abr7C?=
 =?us-ascii?Q?QUTz3g4qBXFGHjxWAjlmgw2C9pzjt6KBZk+eDhwXylOxn+DKBjDhUkFNz99y?=
 =?us-ascii?Q?pE0RG4Ffr1WEzGEwPNBURpn15sQEf3hjUO+hUigrCJ8NnbYtUVk3ojThig5y?=
 =?us-ascii?Q?hH+IjA8ISVWWAhoWybqmv8rSKpj1AqwzKoywwCVrqhkpx3XTBMChdzbS5PqK?=
 =?us-ascii?Q?w9IbtTfEz+cOtFU02C/sWHR0g1frqDhggVIKbTzaABf+Xw1E+NzW4T5+5drz?=
 =?us-ascii?Q?KSIzBQ3idcKJwB9LM2od3r71/Ud74fRS/nbaJNArOh0oLX8spifcQuGwYB3J?=
 =?us-ascii?Q?HXGXwJujDvoy1qNiATCIlFIEpyfT/OtbrglTXLm6BiP8zU+uGloLoYm9EDjc?=
 =?us-ascii?Q?peKv4TA0FN5AjTc9/JGsSuDNSI/S4dXF5eFzDrAcw1zFsU/Ese2VQLrYJnsZ?=
 =?us-ascii?Q?/FfzLX7Z/qYiukKqb01WSO/JiQa6cvc2+Wtw4luI5HB0nOC2eqcHGQjPjL40?=
 =?us-ascii?Q?qhh86f6EWWk/OczqhvzEs/tmXq/ORJw9SowdkbR4vWlnVYOj03974Ao6GVmz?=
 =?us-ascii?Q?Cnt0pDpwqCrJOsMmBr6dOrUwhCMhLPfbt+wAaOA1Vk3/px7rmKmqaqhfVQLk?=
 =?us-ascii?Q?R55v1aMPEfARgYoR81LQOl5JSlLoN4WWw+9ILyEzpqMpqk/cHFQOPFVQ2a+s?=
 =?us-ascii?Q?JnQ5tenKBfXHyMosoSVfppjYENKbWfZHt27X2/i5XU6OBZ/iwgwFJIc9yuYE?=
 =?us-ascii?Q?M3sA6gXoTNrgWJbJ9SmqJ4zhbVkFySM2Lrd+R6+teB7XrrP1YSyrnioSmjCO?=
 =?us-ascii?Q?zl1aQcUVQ4MuB0NeesO1BFbyRt6ynF6ik+stchFCvnLXP4XYZSanb+eiO0Nz?=
 =?us-ascii?Q?w5u+cuNQX9Sp3a8HMTArv6B9BMm9D6xEZTdnG/8vvmq36mQQ8CfYrjS0YecU?=
 =?us-ascii?Q?gBu/OaM1lcAWQGbnQcz6T9vbHnofw00xsVjdH/6USDH8BBB/mWLEOrcn4G8E?=
 =?us-ascii?Q?Y5BtXo+1FeuY6VhFB1ohDngEKdUbteEG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:44:56.6709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829f71f-24fb-41a4-8e3d-08dcbb7c9744
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
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
 drivers/gpu/drm/drm_buddy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 94f8c34fc293..b3f0dd652088 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -324,7 +324,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
-	u64 root_size, size;
+	u64 root_size, size, start;
 	unsigned int order;
 	int i;
 
@@ -332,7 +332,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
-		__force_merge(mm, 0, size, order);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order);
 
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
-- 
2.45.2

