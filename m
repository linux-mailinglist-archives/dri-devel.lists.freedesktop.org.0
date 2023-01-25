Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505967AF39
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5116210E768;
	Wed, 25 Jan 2023 10:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D00310E37A;
 Wed, 25 Jan 2023 10:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epF+9rQy8SPy4OiP3+0Z9fNmuxHz6iiYiSPjtZI3yD2t3Gok6U5qtl9co8YaDKDESUDVZhb1+JNuMgqnCDMPJQovcBvzwhZ9uHE79jjEyQhakI/AD0e6IzLxs1Rdc0GqeRIjMm/URSfMihpVGbSFe6HDcrSsCATGb9mPfm95bOPr2wLJ+xQAjRtdCP5664O9bv3dwtCZ4QkAHxELFnN7I2qHg5mWgz/EWfrvjl1wc1z5l2fc9KNTTJXSaEq7cMQv8l5tS/ahRdesfOrSIJhyj5YkB0UgCoEngEtGvs6CdP2H8BE5amJYhqHg/3WC4J6n8e56vlHwlZ8M36qGgXB4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHYZa/ZbmjxYTLo3XR1Skukn38Cs2A2GS5sxMyOmWRY=;
 b=LOvSg5hHoY6/PFd4bpuSwBq6VHI78osNycZQsroY063JOVNRha0cThgJRgoixMgrwU6/JAEewYNNbnPf7ZBVcbYqoR9CZ3bW+ST1vLAC9HDEOdmZowqIowCAusXwYFM4+kp3gmf1vikgp/POBpl1xNKOyNnMGD4K1tNASQfGBfoErtRLroMGzFODKj18H5u3igLRyuI41k7RClzc91ifxJixzo2xDPsOIcV1eGH5UjdE6OUoqGl0pueqTB9t6wLqJoHD0CT3TuJ4NdH9HNc9/mTPd76YTOxY8MkYEg3SxYZjVu+aorVhmevHJ540TNPoiuo0FOYF7p2syCqhcWcqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHYZa/ZbmjxYTLo3XR1Skukn38Cs2A2GS5sxMyOmWRY=;
 b=LgBwQt5hrGe2MTyWFJJUTdyO7t/M/veVqrnpX8vGzJfAXRkwiiznSFhkDpkMe2jcBmad0o5qr/n692LWCupz6hYplftW428weIvua4YvHlTdsEhz27IOAsgLBp8hrJuVnncSNaosYLX+eRJRJuluD2UUij42XrdA1jg+ivDole4=
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:03:52 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::c5) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 10:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:03:51 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:03:47 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 2/4] drm/ttm: Clean up page shift operation
Date: Wed, 25 Jan 2023 15:33:13 +0530
Message-ID: <20230125100315.6214-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
References: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c1b39d-27f0-472b-1bf5-08dafebb75d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgjfNI7aU1dPs0AFJW0cpQg+q1BjflxJBVBP6OrXIJwgPbMHp1ogjghO0AIK8aXimsUd6VJA2kEu4dSVrIUAJ6c+SDZzWUBNZTk323MIKtT4hsmgff8V/egyDa7obS7eUtlbAhkDBY3jVjkSUgcM99a01BLd/zjUIohXkEfJ+uxcBn+u8mspSjMG82Qq6547hg8AFSf9AVw9v3/N8M4pV1odmsBIF22iKJ80aGcsdeD+edKKrdmvV8cmsQ0Co0xiDqKBHli9xypBojDNsROBhOUVBj5DPFoCXKHMi4s2kOemw93CjKkFHf7X4R4FkI/K+OTixpDVfmXjuRi6jgQkph57cGwaXP3nqUM+u3fulyr0uhloz7G9sUuUcRl+sMHjVwzs/y/qaQ2j/BNMTCkoa8igSTY+mV/MJpGA/OqUBEspOOxe7HkwsObGtTaGaIUDMOuRWhuVMWEGFaTKY2i9cLZbXknvLZN32w/Rv4OjZiuanUIyomOlIqaD6adcw7Tt5i0ZwQSjdaNL23Yf6x3p8BGAZt+t6cx5ZRryHZfvBBDCAdnGVO2y9XlvUfW/joWECF2IAV66RH1n+wWoppzUB6VW1ac61MnMlEZVhtyNAdpUKM0AU/BmoBMd8YjTDwAdtq+tGd/qqXHO+YG8H0F2jSgB8opWVwCRARFMuP/Za4fWfNChvNDugkduyWwWygEK+Wu9058TrQwcinRIYNLVcLTGALPJTmialQvCIx2HVF0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(2616005)(478600001)(8676002)(186003)(450100002)(36756003)(1076003)(70206006)(70586007)(110136005)(7696005)(356005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(16526019)(316002)(40480700001)(40460700003)(6666004)(4326008)(82310400005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:03:51.3918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c1b39d-27f0-472b-1bf5-08dafebb75d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.
v1 -> v2: fix missing page shift to fpfn and lpfn
v2 -> v3: separate patches based on driver module

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..3703cbc6d368 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
+					  node->base.size,
 					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  place->fpfn << PAGE_SHIFT,
+					  lpfn << PAGE_SHIFT, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
@@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (node->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= node->start))
+	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
+	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
 		return false;
 
 	return true;
-- 
2.32.0

