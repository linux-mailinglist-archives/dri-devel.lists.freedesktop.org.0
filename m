Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3657FE87
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DBD99E6B;
	Mon, 25 Jul 2022 11:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE899DF2;
 Mon, 25 Jul 2022 11:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDHEzdDxAn+xhBM+h3MYX15MWqVXdMtUGuPdO+DdCTKVSG+yhVqIPbymZSk5Jnzz5uEG7Wq2RQoD2W01GmccAfP+uYEk4UQsXTwnyMCcTi7UJ+Y83wM/vcoPt3Ykz40V+/Yw0Jv/FQiM7guTXeAJnOGb9OmhneZHvZdoRJ2JB8RxpcmgQWyOmcRXHCqYqvQYdadMxl+DOOXzzjdbBDPsir85cjDz0gxIRw8n8W5TCCh/0CejS7daL6Pw+iRolmLyKsYnpyekgOyiCIh8VTS72Z/XL5JYwJKOuSAkGLG7LcDFuZTPNko1YUVP/dyrK5H3lg2imdUaSjsvlBaUqOk66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeEFRm0VhH+rSflDAl73T84i8UANSLDZe6Dv/bst3bc=;
 b=RpALZ8LeFDBuf97t7dlv+QLqp1Q1TLCfEUvtOJo6yA/StUFhg3n1aw8HUfGNXkssEdXWPPnGA1wzibNaQxyO9hjG+EEIscz93aHELcb/E91Pjce3aqdHtO5JON/GgPlW4DpT2JWZPZntWIp9VKHYL0rsYYiN0vU08GeGm7A9txhaB4fmRKA2h6rPDUk+m0KLh2POqcvQf3i1hnQ6hQtyfzvaQrseDzYLJhbmqpGyfFj7egdffuHFTuOOD80IPrtEEbffvGeFxcPCv8ciaZDnvFU2jG3v2QImphZF3mx7H403b49jA9oMfLe9fQCORK4eYj3BPqjghlureSQHg7g6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeEFRm0VhH+rSflDAl73T84i8UANSLDZe6Dv/bst3bc=;
 b=VtBba42qTAefU4sb7XNTmWsLWLHvDfLFCaBv6n7C6OhTNZ8LX0bfsyPL9eX8qQ5/KOhiADAgnnfHtSQV8VhGRyOyhIkYLAiYlV8dMtEU/j+XSFjMCZXCiDtESjC4cfVKnMuL5bfPrlZM+7PxEXZqUOZebcvjWEZngpCznh0q1+s=
Received: from BN9PR03CA0972.namprd03.prod.outlook.com (2603:10b6:408:109::17)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 11:43:29 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::1a) by BN9PR03CA0972.outlook.office365.com
 (2603:10b6:408:109::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:29 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:26 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 2/6] drm/ttm: Implement intersect/compatible functions
Date: Mon, 25 Jul 2022 04:42:36 -0700
Message-ID: <20220725114240.4844-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6998658-0e33-4efc-2b30-08da6e32e502
X-MS-TrafficTypeDiagnostic: BN9PR12MB5051:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6b0ymFEJtq5I9oqejONmg6bl/4itgk5qx7d+Y8Qc8RexVcbSHEgjevNjTY+71XPoJexElQPitpuNgYiNFYpbzIZU89743iXxZ2SEt4pDgTyz3RhH9fgZxQnTunrd40HlLVc7jAAc0ap+uVfto6/Y1cTtKGB57BbgTrHrVlSFgVH7AfOCQHFgMwX0ZMSFDWzG3YkOY4Vil8a2XOUac87DliujwRQzN10ZMHQD4AZkMQsDt8mIVZtrpTH4NKNHMCpg+OTI3qBdmC57GDgyKaDOJk9WjLWUspELE54Llh72nVhOJ++C+MovRdhtIAw1NNJFZGVZXOHS8M09K1Be2yV+cLfXf/z/WoP3hBC6anQhPequOdOd2boOc/RdujxwTN9wIcSAUrRuAqNb55CXtjlK17PEEW3pB1SkGLPBvVzd/9oBAZaz8UCABWMkcxKvUYfekeV4U7gKoodI91SX360LNJrDGXWXYCO5B3+yZ38vlf4Ohnxq81lA5lYnvM2TXmg7WbkuDRHG37wgVoicqwCr4bDf08MiplSj81pJ4c1IodlLcqN1Pxwuj5P3oBZIgo1Ay9UShzG2tmqv5kL9NEVK7DY4iKUsslANe6n+F471sPgtBp4vqjn3dOIkPyQ4LxXSXkvZDHUcKdnqSbi3kiQARysSS2ZEmPJq3JStWLBCFLcU1te2dPXtH5U7UJi99lbYIBxgmdBrxWYcubIEDhR4LjnVzXLOyr77C5vXKDsdldjGjnNJPDrcF6D3NZ8Y+vHS2KczTx6G5TdhVwOuazboXDtZ5jyk+cFRizKWpRZUg+wo/LmkXp9bp2YVsCFuVQ+41fCgTi4UjB7+XYnzVp1ZCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(40470700004)(16526019)(1076003)(186003)(2616005)(83380400001)(40480700001)(70586007)(70206006)(4326008)(36756003)(8676002)(426003)(336012)(47076005)(54906003)(110136005)(6666004)(7696005)(41300700001)(26005)(2906002)(40460700003)(86362001)(36860700001)(82310400005)(5660300002)(316002)(356005)(82740400003)(8936002)(81166007)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:29.5110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6998658-0e33-4efc-2b30-08da6e32e502
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051
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
index d91666721dc6..12b8d9b36fe6 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
+				    struct ttm_resource *res,
+				    const struct ttm_place *place,
+				    size_t size)
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
+	.intersect = ttm_range_man_intersect,
+	.compatible = ttm_range_man_compatible,
 	.debug = ttm_range_man_debug
 };
 
-- 
2.25.1

