Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF958999B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABF491F9A;
	Thu,  4 Aug 2022 09:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF590F74;
 Thu,  4 Aug 2022 09:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2pGEz6jfFHH5GriH2hwpa4HZphqau8B/4DZyq5Vl2qN825jFHYG85WOSuKeiV4IM+w6CkR3cLNDyGg4ituYzwRLwdks+7LC33IVXJrzYFrWFY+C1ZqJddtE7tahqddbY8KtA0yn8b4tYtFRWdzrW8CP4KLw6suMgRx0DTiDfifD9Lfg4+dYUTXXe9jgFLhyCY+py9XW8E3UyHwvZNPfOni8yWE6OL5hiq2WkqLhZV5vHwIVL6neUJ0s0kZ+vi4fYQSi1QVZ5bsjVV4o8armv0YnStjdva6oB4QBBScNSL9V+i11yWIFfevfI+lbxauz2fyhwkjQW6PxDEPJmNqwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=WyVr+AvS5rfOEi4g4f1aUUtBh+rZ4TwaTMtPVuDydMrnI/+k4cvV/xOlUfHfUT/RSaObWIhE/DFMwa0xb3pyuwLcbpKK194d+6RuM8sOyfxZpC3yrvVjaSEOEXBwt7c+gMprHwQqmOM6gBxNI+f9ulhB5v+34RAHxr5UFhYCzKb4DLCY32Fl5eOUsfHvPUhSLAXVD3sMCr0TnE5N/seTKZkkJAFPGR3ZnTcD5d4FXrKYQybKBBZcNEbazIIbFOTeshbfL/ofMkOMXZ7Z4eWrvGiretVDkAbsZLnn0fYWw7YrBWgGpbIK7TtMvTJTLT0v4XxIybB/5UMDmwmrSSPrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=F4f1Y5D0EsyvecbuuWAlcuTeB2YSn5oCI6QosU4g/GuDBn1dwg83XY633jJyuNhTOAxfxYwVUTlWkSIoBparoIZx2VBMDJt15bxtSsJt093+tWB9T88a5BB4b1M8ehRWlW9x9vkiRa/2nFEk7opVqPqtcLRfl9/SJMxuhImaEC4=
Received: from DM6PR10CA0014.namprd10.prod.outlook.com (2603:10b6:5:60::27) by
 MWHPR12MB1277.namprd12.prod.outlook.com (2603:10b6:300:f::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Thu, 4 Aug 2022 09:00:18 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::16) by DM6PR10CA0014.outlook.office365.com
 (2603:10b6:5:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:17 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:14 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 2/6] drm/ttm: Implement intersect/compatible functions
Date: Thu, 4 Aug 2022 01:59:48 -0700
Message-ID: <20220804085952.6137-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999ef677-efa4-4fd5-f72e-08da75f7c0b7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIrBAXSgwH4gSkZhdG8RjraFS0B0AQaHzyinTpLTkU/fZWd+Ll2t7ULJkXz/6PRRVy1tqvT8NOLDmVVHg1ZBc5wX+C9X9x0D7drZ8CDTZadPSTVOOkVEcHqVAbIFXcLPOySivoCEL0bfht3qvJzgxBazM7msG2KLvSiZQVi7o1hNBvm6ReTl84J+D0SnLsOWyTkqLbD/XCvahAno2AnDyON0DFgx50mBsTedGbSnWOYQfGk59LaC4yloszcPA+KlMzSKJ8iEybSyQ6C0X15vnVEk+m9/M7X531tisyKIk4jakKg2edFuEOG3t7X29vf5oUq6FZTwfwc/eiT0bMhBIaGZohz4E+Umzf1zUDkJ5RX5iQbaAK9COWy8zyjkU8FpTKGjLJq1mdNmFnAk6Qwb4j+pJu6K/2auuam45CHKJAxTjbmjrB8Bh+QNRwbrW1wXhjviuMplT95C8A0N7dcDqdxyoMzIRnCKUZhJJfLliWCfAixKRbsatYfDN7Ni4scmU7EwaS94lMGU3iUH88Bo7SHo9eFTANQTaftDACjU0e63TZXpdQ8osZwUXQlkFl7p2oxamcEjfgGWk1AlWiLpb/c3hbPau154lGWfVg//3XJM/7dF/YHk8LURaS5Qr8h9EXmNRl1YEUZ/8Wj6a8WXF1dzLiBDN9GGXrZPblWUR7lKXAYgiUESdE6b4Pf8hhq4tMZ+zJ2+3CAZrElzn+LKu9aBZP5ArDKFW+Vpq2idC0eIigAVK8dvdxUCu01wHjzPo399kmrBOZGa7CbsOr/tjtR2EiyTa+VP2uWdyWCu6IW3IsMaFET6ZQPWuYa0xFqyVLTFPY0mGYO94+uEaGxt3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(40470700004)(316002)(110136005)(82740400003)(54906003)(40460700003)(86362001)(356005)(81166007)(36756003)(36860700001)(16526019)(186003)(82310400005)(1076003)(336012)(426003)(83380400001)(478600001)(40480700001)(41300700001)(2616005)(7696005)(6666004)(47076005)(26005)(8936002)(5660300002)(2906002)(70586007)(4326008)(8676002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:17.5906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999ef677-efa4-4fd5-f72e-08da75f7c0b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback functions
to ttm range manager fetching start offset from drm mm range
allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index d91666721dc6..4cfef2b3514d 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (node->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= node->start))
+		return false;
+
+	return true;
+}
+
+static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	if (node->start < place->fpfn ||
+	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
+
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
 				struct drm_printer *printer)
 {
@@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.alloc = ttm_range_man_alloc,
 	.free = ttm_range_man_free,
+	.intersects = ttm_range_man_intersects,
+	.compatible = ttm_range_man_compatible,
 	.debug = ttm_range_man_debug
 };
 
-- 
2.25.1

