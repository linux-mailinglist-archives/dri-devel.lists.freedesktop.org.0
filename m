Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3158258D668
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8390B56;
	Tue,  9 Aug 2022 09:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2072.outbound.protection.outlook.com [40.107.212.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6464710F3B9;
 Tue,  9 Aug 2022 09:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccG53vbVM7uDPLslrZtUkIUQktyM4MGa4gndVUOJ1I/IyzbkKTmRSceGnjUcva3f5Arhb4+11idXODkFlMHmfFBLWknM/81LEkONS99WYp54rITGC5NgmZvxIDHsWaNMtgw83uCWfMjGl2b4h3O50+W2mFLviQWn1xwgDvWzySDHcxMcdGromo1F/Axq9It0u/2mRUSQ7Nf6Jxnx9JS9FlrKC5oOMB/XnVDNFXT7uY43/iAOycHKiGjnKf1AXplEyHhtNjV7F7STq7r8TX7JatmDg/85UCFSvMCzrux0n0D8J2KylzhR765CeZcR84ksYk0WThBI6XyHM64x8frjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v6w+tI5Qh2FNNZ5F9CX8rAR6L0gg/O0dShmJZ0CJ/Y=;
 b=Mzndpe4U/R3TNg3HmGrnhwuXALJOz5klKKmAxJ/msD8c+gclbhyp1YQ2BM061413eyFROAQ0m1Pme5o1W7XfaJQJRAJX7zhYCNwfdNOZ478ULhf3jLmZrvy0Hu6ESspDgsZkCJ6CHXz60HSvAJVCDTj5rg/gFlds68wegRbQGiqBAgPJIyd0Tl5wtCcuRQnSrwEXIi2As4UtZs/YvOSe6NgD0bHmlNhcV3Ko/8+xY7ziCgov8Qyzd+T+KOfPvmvEQYmv6Z4j5SeNqVprrsIdF2WsCNNeldS0lvdKZdab/t+ZPzXqI4VYZNwIKsCGF80iyXnRAwZjOGkw8YRkQTmuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v6w+tI5Qh2FNNZ5F9CX8rAR6L0gg/O0dShmJZ0CJ/Y=;
 b=oAyYolJXWHuK7n0GRzQyQDdeq1wUWFjH8kiu9P14jf2D9D7iq56jN2pmupyHKxefmQWPlwWYJ62fq3qvADsuKHxcE8D7aGRxQQ9FRYk9ma9ykXjqmHi7qGKiF8Ss4aXfENaOPaJf3Op2HZrXMgEVQT+gpAcIAWDX0REdiJLf5gg=
Received: from DM5PR07CA0051.namprd07.prod.outlook.com (2603:10b6:4:ad::16) by
 SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Tue, 9 Aug 2022 09:23:21 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::8d) by DM5PR07CA0051.outlook.office365.com
 (2603:10b6:4:ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:21 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:18 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Tue, 9 Aug 2022 02:22:25 -0700
Message-ID: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9800ff1-7850-4b3f-e154-08da79e8cdb4
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NI7wnBeq5b/cMe8zeTwfJ/7q0lWJeJzwliLudtxiOxTmzDf/mDkFaO7FagruS4V558dvsr42owMIZeGBPDKrF9Pzrn3kvkSoezaepdDXyrWXiK15jP96zMXRIMQCA/zzr3i396tQbL5MrL5mXizMScL7wb01pcmjduEEVLZM0Y9762M9Lne80pNs58ltXMcRTsilCaUh6QKXRw8bzfGAMjRZqI8WZ118vKKVr508j4YXkLQCLAChRtTD734i7T9NIKxzIqM8vZMIEFsP7F8+8aPAoVqaM4CZh7vChXtT63qBcO1fpkFNoDpRIqw/k4+e4Af/5p1MLRVJvomBdx6skKAlVkBzNSI3LvGYbod2kAoj5tit15n4DZC41xrUVMePCY5c2Uee4lOjLNog3TFyMUTULk6ZWBtdQjjUc3XUR3RFMWdzWNPryKJ6DL0FwgP/1Z+Ypw2S6uFu7fADv9L05Q3kR4Gs79O9ZPHiS088Q7QxceePdO5xUn16RokMK1k7UmPovQU8Tc3eh9PsYwZp+r7+alboH4QSVGbU3n8kI3jsaLWdZVN7N0JK7rNAip5UUXRVuOMuGsodDGNmvh4u6ByzjYiV1pxfwHE0mozgZN4+/AGf6IPhkmwWjH7/YXy0unmGpgk9KrmDeLU8rsnAHMPo7nBNnySrE/dh82YmdcQubWolVYIH2B/DaPHbsDp0KHYfyNIZL542t0pFcNYza2Q25uYI9T1serXLNWn80mW+H80bJeI7TWKxN4382/4PUOLcsAisJEHMT1NboAYxMWn3yReqrs/f4gv54/YhK7crJlLIte9Qburodk1F48z8UBzgtkW/3rxiHA0cIwYMaA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(40470700004)(46966006)(36840700001)(8676002)(5660300002)(70586007)(82310400005)(70206006)(40480700001)(4326008)(8936002)(40460700003)(16526019)(2906002)(36860700001)(47076005)(82740400003)(81166007)(356005)(86362001)(2616005)(26005)(6666004)(110136005)(54906003)(36756003)(41300700001)(316002)(336012)(7696005)(1076003)(186003)(426003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:21.5966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9800ff1-7850-4b3f-e154-08da79e8cdb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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

We are adding two new callbacks to ttm resource manager
function to handle intersection and compatibility of
placement and resources.

v2: move the amdgpu and ttm_range_manager changes to
    separate patches (Christian)
v3: rename "intersect" to "intersects" (Matthew)
v4: move !place check to the !res if and return false
    in ttm_resource_compatible() function (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 59 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..ea67976f1f60 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,6 +253,65 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+/**
+ * ttm_resource_intersects - test for intersection
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res intersects with @place and @size. Used for testing if evictions
+ * are valueable or not.
+ *
+ * Returns true if the res placement intersects with @place and @size.
+ */
+bool ttm_resource_intersects(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!place || !man->func->intersects)
+		return true;
+
+	return man->func->intersects(man, res, place, size);
+}
+
+/**
+ * ttm_resource_compatible - test for compatibility
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res compatible with @place and @size.
+ *
+ * Returns true if the res placement compatible with @place and @size.
+ */
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res || !place)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!man->func->compatible)
+		return true;
+
+	return man->func->compatible(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ca89a48c2460..5afc6d664fde 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
 	void (*free)(struct ttm_resource_manager *man,
 		     struct ttm_resource *res);
 
+	/**
+	 * struct ttm_resource_manager_func member intersects
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res intersects with @place + @size. Used to judge if
+	 * evictions are valueable or not.
+	 */
+	bool (*intersects)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
+	/**
+	 * struct ttm_resource_manager_func member compatible
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res compatible with @place + @size. Used to check of
+	 * the need to move the backing store or not.
+	 */
+	bool (*compatible)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
 	/**
 	 * struct ttm_resource_manager_func member debug
 	 *
@@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_intersects(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,

base-commit: 5727dcfd8486399c40e39d2c08fe36fedab29d99
-- 
2.25.1

