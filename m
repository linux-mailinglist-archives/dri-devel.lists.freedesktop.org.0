Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47921591179
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A40B36DB;
	Fri, 12 Aug 2022 13:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456B18A365;
 Fri, 12 Aug 2022 13:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYkmK7dEOQYL58Ko9PurxVxRJgtmELHkn0j4PetHXVZbFJ9EDZAdLG62Lkk+rjQ32+3cZDjWnsR6DMetW/HFZYDnO53ZYliC2VfWQsCkxieWLyQo4cHW3y1QYV9v+JS6ZxX4kRzBXY97AUdPUXfN+WAKcyS3jpDH43zc72SgE7DLn7AbhnzH9P4pokyajjSWS3GmkZeqAdxPq1RomwMyvlrn1TP+L6s51agjWShymwlUJwZ6A1fmwNzlDVQ+SasOtHOQskgfeB8XV8gHAsnKVBhNy/OV4ucyKXZcG4OCTO5EBliJu+n8+LNVN/ER0HBdry4QW8c828FGWjgO2E3t/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=aNQW60L4wFt/yCaJwBun24KTHqV0FV/6xGj9bMeDjUpA6wYFWu8YzHcog+eT/hyDe6d9QKQCo9fpPwV/HWpuh5W750zJaxFm2dXLzInSbs89ALeQtLWgwHiWE02LFRl+liYczc1ATCaomutpmIObmqua7E3XTW1gVjV2vVHD+GDw7OMtYonmQEFf2nDGiI5hDtnH9f4HepMUFxjGNVZJUKIgGg74adUlj0NWz3+sbqHNo5S0w8g2KmOAxVM723MHQ41/oycK3Do9ClBwrTejiF7hnqPG+QEhkn4Pe3zNyM1nSywfD2JpwxGLevmXOI7qKKsPfaA6aas9XoH0uSXe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=a2zt7LKKxSg8IfIzC4k7u8GdEAgjf6WKFHPqB9CsjSki6paRj5XHO4kh/Ui2Nt3Rh7fSsGt9oYk/tSskn8YMotV0ApNeq/Is7bH9gD+XX6q6EP74ROMbc0t/zTXJHYVUJ+fvJqLsKzHoDNFKCY7+M1Gmaahm8zHcctJEXrP+KH0=
Received: from DM6PR13CA0036.namprd13.prod.outlook.com (2603:10b6:5:bc::49) by
 SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 13:31:21 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::37) by DM6PR13CA0036.outlook.office365.com
 (2603:10b6:5:bc::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.8 via Frontend
 Transport; Fri, 12 Aug 2022 13:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 13:31:21 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:17 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 2/6] drm/ttm: Implement intersect/compatible functions
Date: Fri, 12 Aug 2022 06:30:44 -0700
Message-ID: <20220812133048.2814-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9acb1431-850a-4462-3db9-08da7c66f1c4
X-MS-TrafficTypeDiagnostic: SA1PR12MB6894:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gb90X+D5fpaXMRl9Hm4IeW/oof5u9pBSBAPIjIoiAbHOdk7Ui7TrYKcEVUzkE50WLG9k7QyaQ0EQ3F94dZC9O1mZYwS24CFJXXxc6ZDSrtPng9ESPGGYsm/6O4Sx5ef9LIQM+i4xyUSDRama1kWhZXbYLGB/L/5TV/C3wt6ajbkLR/NUkWJIOvBw0w13u4IqP63YWLeBh5ewZCDn4zGY0EGdSMSsE0BlM9VQW7iHXlzxsh3FqRaAhky3rQtO0vEc5asEZm2iT5E0q+sxFBAg42AV5z3OUkQeaG1JIlvDiPxgyAmOHU0SybYkBxYYPFqHIr4k3FLLmJV/aR/YU3PlSGlPaHzem/UfLH+m3pl52fbcfbSees2lc8E/Yys02go4ZaSAHDlEq2oCHQvm8HLtJIIAOX1GeZ+7PFZ5TGNwWyuusCfM1E3pgNYR0c6CSDpD5LSE7lCKiSbhGM/7KxTI601G8YRbbSOWHs230GoNS4BiX8DQMu62mOQLqiP8+A23li4KbqH8rfQFfl99WDxiqspA1EU4cDbhK/GTxqRKK8tEY+ET6jRYCpmDE5fsTPYAxx87dfWag5cStS1PJ2fqjWqu4zyZFbLSAAnPXtTOArxQ3vFw6ii8scv9YxsP1FlECDoIgzUp8fHJiPjtUse7MDYxoI7vq7V+xF5BXxlpkLqnEOSRvMo+FpQJm/x52FyRCT9uXtW3i2t9GXWMENKPpKoTDNjbooxpwun65xfnSpsuNy9vQJqHr48kaATiidAReaTknt951HwrzcXeRsnf5wqeFCU2jLPS6NtO6/Jd1tG3pLZrd486GKMA0mRmShdYja6l4/La7IYryqI8D7+e6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(40480700001)(26005)(86362001)(41300700001)(6666004)(7696005)(40460700003)(81166007)(356005)(478600001)(36860700001)(82740400003)(47076005)(426003)(336012)(16526019)(186003)(82310400005)(2616005)(1076003)(83380400001)(36756003)(8936002)(2906002)(70586007)(70206006)(8676002)(4326008)(110136005)(54906003)(316002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:31:21.0087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acb1431-850a-4462-3db9-08da7c66f1c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894
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

