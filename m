Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8C6654A6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34B110E2B4;
	Wed, 11 Jan 2023 06:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B6510E2B4;
 Wed, 11 Jan 2023 06:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdPCo2hInZPaTZdE+4JKMNjuHPDOUMGI+JmWzmKvA526eGUlJNabRuMjqzfy68Od8OcLeAE1Rze7Ssn8a/Nhi+dPTTlji1wOtKNnr+Np71ZefMKK6ByK75S4DOmi9SElPH/LTvxSEjqPLqjfY0ossxjaMCfM7bmb6qNKmZvdXoo8xU761HB8KmGx4M5+dF4A6wWvXheCJAY7P8IM6bHixCAVjXzgvP33W+PcrpN/Mh1X3mdU/0HaYgGX7I5tMAZfbQhKmXUPP95eWjtPLWJ2xtpXcs75aiCv79S9fOJ6jUuCYLSg5kpmW6QL26FAdmNlVVQNJijra2F3DrIf/9Hj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J36ujkX+0UDjua0ogtvB3WrqgQBNDYJ92flaESATsSk=;
 b=H7hZJcfrPZohAHGcNxGfOXXq4MgeVrlud6tMZ/awMpKxBIwT7ahCbLAK9mdWhoL+pxbS5mPpTfqBX34vkC1WL/DeAxmLbZGJfCC/RgjP7lnjAad10irLXvjxuEvgzdNTRzuXtzRGFfKbCFIwh62v6dWtp0vxpvfKS4kg4rh6L+M4tt4/2ayFFOJ4kOHk43e2dtyvGXqTu2x1pol+5aaCxBc35qSUQoYv034IJfPmu6Oe5eS7powWy3oXW4al71pvtcCk3NsDnec1ZCr4Bn7GFXt8sQRZ+nmlAxg4sUHc3FbhAc/TahOT8gr03MzmKrOfaFeLlVr+OM0oc3a6UtW+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J36ujkX+0UDjua0ogtvB3WrqgQBNDYJ92flaESATsSk=;
 b=1SA4tb1bESnJ5PHmzHpKJrv3r4//q5f8DjBlt+NFBRJvUEEZ/Sq3qSmduhxkk262oxL49dLvcJknub7b6n2vHLqC71og5RlQjNuKz/znpX7E9hkWmm52Af4tv0SMXwmwujK9vYFC18lwR2NMrCTEg8cSDI/Bgb5uzEISuDYvJlM=
Received: from DM6PR13CA0040.namprd13.prod.outlook.com (2603:10b6:5:134::17)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 06:36:14 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::32) by DM6PR13CA0040.outlook.office365.com
 (2603:10b6:5:134::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Wed, 11 Jan 2023 06:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 06:36:14 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 00:35:46 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/4] drm/ttm: Clean up page shift operation
Date: Wed, 11 Jan 2023 12:05:21 +0530
Message-ID: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a84728e-0479-47e7-19e9-08daf39e22f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucwbCfSJXHaNRQnP6QkqSIrIkDa+EeADrYlK7mZorwUhAwMJyOQwXq26/stn8oiKQOPTkDjWTP/rVXLeFchC2iWvCUgBPwhsC65W8UatVtqOkEz4UKh5cIn97uUQHyGZPg7ZUx/Gj6DMmyk18DiFHAy6Ss3wes/FtEadcMF3QzLFQBLRodRVIf6SPHdrsoiDU4SNSXdo1mXb923VFgas4cAgtdmMMXHtU1xit0lhpXbYyr+lE0mUDZlj7+pXg6UZKvncgk3Wlwn9MyDiKV7zwzyW+l7JlYRQfEVa75kh45kwrJ7h8J0GnrUJN1x77OII3FyflfdXc1jCjJU5Kh0bY31hWsdhOnE3sFIA29k0Qw1VNBeTI+glTquaey/enjQs4SlrhYvKRXXF9k+wEAb2HeEmIKx2Re80NGUO/pK/AQl8oFZNjXoqdjRzAw1NoHmSMhvvIumAsqNDPs68/R4BaQojvRpSoxs6cyZm+OpaB+r5a63VT588Osu9/l3JRwmYXxMn0nPtwMyQoSzCsJ0J62ryNnyZquhAqz6P+UA5Lusb++vh2ewWB1VN/xjDjPkZg3WXBROPXeKnSSBpnQUYnHnb9DXJBSn7AK9iklIeZza/PVlaOAKgFC1JGGvPO5+IFx0dY9Se/03H8K2NrKMfA+axdbIpDZx8nOBlIA1F5/Ues8GVTADWa89hLJJZHRCW8EK5r05BHufDaQalpQpBZYELVdsl02/+8eNZLEaGA7s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(8676002)(83380400001)(82740400003)(86362001)(36860700001)(356005)(81166007)(2906002)(5660300002)(70206006)(4326008)(70586007)(82310400005)(41300700001)(40480700001)(1076003)(6666004)(426003)(186003)(450100002)(47076005)(336012)(16526019)(2616005)(26005)(54906003)(40460700003)(8936002)(110136005)(316002)(7696005)(478600001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 06:36:14.2264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a84728e-0479-47e7-19e9-08daf39e22f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.
v1 -> v2: fix missing page shift to fpfn and lpfn
v2 -> v3: separate patch’s based on driver module

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

