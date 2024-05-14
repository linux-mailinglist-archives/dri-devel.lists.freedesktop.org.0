Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A5C8C585C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 16:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8245310EA9A;
	Tue, 14 May 2024 14:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wqRPXv1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06610E1FE;
 Tue, 14 May 2024 14:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7munSpfiQ+BlYTf6aJPRZFgOAycbOI34IaNhSL28nX7f308IpTgB0O2+gvzaB03IphJgr8rGBDA8IqDHgzZawdyTr5CGU7QMVcXospJXzWIJtUeb8LG7QhWr/c+x9mVFacE84Vz5cNdGm6jcfk9UlPyKZA/IkTNjrjaMjcVF2f43AeD/RjelcxVSYntl25+n8N+pauPjifgLvyRfzOxyQK6NZK17GmBiGSLcts1YvKl8O4W1woUTKt5yzU0+r857n+2aA08mTuejvJgZGvor8PB87lTTpLu1PL6A6ueJSo95OHua0YReilBBtqDNSenngp+IQTgbiMTndnrjUEhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/E20Z9gdCX1NEAyYnfWKNJ4Y16ui2hB1v2a6g0lSRc=;
 b=WcSD7TqF/NEZ4t5r0ct85p5/RgLj06uIilrrPGKhv0AY9f3YU/xsah/aioGBcSO+wR6EPgUR1Eoe8vWTVIc6hzX2J3hzY97kx95pDtSfdvjXQzTlLuQ5oZkV3NvwF2FNHBIAJTth7Aqyj8MY4MoBrcR7Mr0PMI/ii37vSJ05nT2T8tPWa2nakVq2KzG5CqwrtKZr23OPYW7jw9CoTkxJOfl57hI5OWZdv60XBbcHt7ijjLgd6rn/OxxxH72peJseXOld6cE2OfY0a1dw+73KTwkIy18gfvyMM2iFZGFeGUABAj07VI7AuSCT8M9t+dfzyiowoGSVOno1TI8iwiXAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/E20Z9gdCX1NEAyYnfWKNJ4Y16ui2hB1v2a6g0lSRc=;
 b=wqRPXv1TIq6RhDxBJLv2vDYQlIExjonmiyYeJy1AVAg1KWLWwWlPhIxcsjqvIdhF33yuCQD2Vk+JPVUHyPvRf0qF6bTdGwwK15wzQaA1Lk2Nwp0tOJJuusqWp5hd5AAh7R4G3OLeefkg/jtN0EaYgQ909skM5TvHEoa9wUVauUg=
Received: from BN9PR03CA0756.namprd03.prod.outlook.com (2603:10b6:408:13a::11)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 14:57:00 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::5f) by BN9PR03CA0756.outlook.office365.com
 (2603:10b6:408:13a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:56:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:56:58 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 09:56:55 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <daniel@ffwll.ch>, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 1/2] drm/buddy: Fix the range bias clear memory allocation
 issue
Date: Tue, 14 May 2024 20:26:35 +0530
Message-ID: <20240514145636.16253-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f910886-b6d2-403f-e809-08dc74261a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jIaTX8Jh/p+4QSyMZSnMhu+BelEulj1tRz7/NlLus4MVXoMyF42YMA52VMcV?=
 =?us-ascii?Q?4YSBLXVI47v2EiWzYuAyeFF9M6QPWBogqoKFKPa2ctw8f8p/W9oU+16p93I+?=
 =?us-ascii?Q?CyDYHesbohiyvs/0zerzPbunVo1iW7ZyIkArrDZx2IDN8LMaquRGfU07VzzP?=
 =?us-ascii?Q?qAROcWQcrlSe9SIJ4FwkECc6b8DRGq+rn/UBPjsQ+tVe/ErQKL2jCkbp2by4?=
 =?us-ascii?Q?0K8iCdRYWxYTe8pPFOPMhsZgk+8rvz9MjLqWdtWhUyui4gWdCY8zJtADodpa?=
 =?us-ascii?Q?i1Ulz1Ox4Kkmz2n5TVVfmIxdYZODdGRGsWgcailwtsydN5rMXjRcnhUrt0y9?=
 =?us-ascii?Q?qPyNM/luLMOAn6pUL5T6cpz5pHypR5awvvCNT/etXau67sQdjfdrcQnRmGMA?=
 =?us-ascii?Q?XD2Uz9iArzi6y8SU+VZ9++oCRi4j4bJK0ex3t6Tcn43xejEkrBPr/rvjsSJd?=
 =?us-ascii?Q?RFbSbJs1G5kHXY+L/LCuKxvj2QlhvC3FUF0OoQZbgqOGD05RNyORlIfPlot7?=
 =?us-ascii?Q?MXKjon6zsi01xbwOxWd/45Hes5jwq5Z0sDG0G/9kcn3P9ydAQdwcQCIMEESr?=
 =?us-ascii?Q?750wvQTwxpqXcyxppguaWvMj2HPqYMkZv9Wsitq2PM4ab4yWuUjoXCyeqXH3?=
 =?us-ascii?Q?tAgOXKNNwyI/c8gcrtMkRZPOZB/6Kdr4RGcDjUqsoHoqQhlEJvzi4MOKEW+H?=
 =?us-ascii?Q?DlnVpl36eNFiG8MnQILA5JFijePi59+F+Eik9FICaFzBRhh3Ew6ddINHliEJ?=
 =?us-ascii?Q?nYD+oY6zBcmXw0mWsyY1ekU2T7Ds4t+6Owa1ld870NIejd5+HTgZx+xqkRxe?=
 =?us-ascii?Q?xf+dx2VOenVeM1oGt3nUHW/FpzqeRcC2YvdcZejruRTKYeoeDGvuhdiI/tta?=
 =?us-ascii?Q?GbWNVHzogCaloR/12PvIKrnG1lJ2mgDhfapFg+SFhlLG79B4qf0dRGJmrsWu?=
 =?us-ascii?Q?ef5SEhCIP6hEIqCM2zoC4ls0y+rETsug6HLqiUcnpV0Tfv6gudWQvx3xFH5K?=
 =?us-ascii?Q?gYhn0GAo08jTO0Hr7KP6v74hBA7DKI1xJ2Uinm/o1itGkf58+37gTCCXA+kz?=
 =?us-ascii?Q?49Uh9bNAIauQsH7aK2z/F6Kp+726dNISdabT2TnZYdl3pz+2lUPkv9H3+7Vt?=
 =?us-ascii?Q?NA1Ov2gF4W/QIp99mQvXaRMpOZWN4N7BiKTtV2IXOusYURxhL+uKN1vVj+AW?=
 =?us-ascii?Q?vVNK4ZYCUroDkFljTyhlj1mvURwNXCRFWHvsSeP4FaYs/BTLNm9mJOZCnBb1?=
 =?us-ascii?Q?eR/UeGrKeuPXjtzAEuxczEP7ixRONFiTpObsUc8Z6ws5uPsH9Yvo/kkUIYE6?=
 =?us-ascii?Q?yuACciSJ3uh8LUBUzgLOIkeUc7HNQ81cH4RzF73RCDmcs8pVuCuY1cloKaEY?=
 =?us-ascii?Q?3fXBUCRH8exfO4cC2prB3+v3xlJK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:56:58.3172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f910886-b6d2-403f-e809-08dc74261a99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
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
 drivers/gpu/drm/drm_buddy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 284ebae71cc4..1daf778cf6fa 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -249,6 +249,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	mm->size = size;
 	mm->avail = size;
+	mm->clear_avail = 0;
 	mm->chunk_size = chunk_size;
 	mm->max_order = ilog2(size) - ilog2(chunk_size);
 
@@ -574,7 +575,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 
 	block = __alloc_range_bias(mm, start, end, order,
 				   flags, fallback);
-	if (IS_ERR(block) && mm->clear_avail)
+	if (IS_ERR(block))
 		return __alloc_range_bias(mm, start, end, order,
 					  flags, !fallback);
 
-- 
2.25.1

