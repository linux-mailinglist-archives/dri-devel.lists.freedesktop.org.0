Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE0591173
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE718B36B6;
	Fri, 12 Aug 2022 13:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD9AB3681;
 Fri, 12 Aug 2022 13:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7pKYGBS2hno1ccWdGP5uuaE6BuKBoGpzMbu/k9SZhFc0J4kYvIo2GolDfaNZzbUomMmY5R5xV7Rgl/rbf/eMN6Wi2SB9wdAMJQ9UUTvE1LIiFH/bCVey7i8pWl4gBXafnAUUiUCyS6KIVGRbraZeq1qF3nJLJNBlkrDJG8qTIOzJRablOQvk1Giv3BjbKJdLekKrY7+dtatUN31B37+QUqDegMyvxj+igRRJ3MqbTWYpnZ86R70z5UzgX9Cx8mT5Pz9DyLGPpchKaOdm7WZ3Ww3jQ+NVXxMY/Brlmq/QljXPiKkWh9OKYEnepfPNti5ymYOG9B/6IN8yU1Maxxo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbNRQJ/zTc0t98A1TikGffsdb2mRwRw2BNjAec2m31g=;
 b=SW9x7JJokLTSz2TRCnYS8EZa9b0yaawTHBeJ9XRtAK1SqlR/P+nx/3/cs5ub+P2hlxAHRiMHhjkM7kO3kw7phF4PQCkjAlqZpGCfEQ+t36NHNwfoa206NSMqlxgPmJcP4pkQdGArU+//iLTpHL5Tvhbhs79O548K3D6ysqDuDvOUkrSVXbwrQSHqdSQIRATyxuHUIU4wi7TVKp11mesusgEiA249e7ZOqHB0iCqhyl6pGl7bApUJmcScTE6PzEcLO1LS6gq/xOCDot33+HOZVsdnVbfe7lG9YjvPekeCq7H3vFrvvudQOBOG75o0MMAg8ZO8qTj5BSzvDCM9yJ8j5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbNRQJ/zTc0t98A1TikGffsdb2mRwRw2BNjAec2m31g=;
 b=fElHmAk04ir77sEjHxafusooeaw/l7MwS7BGm5VDJA1emKkk5iGABgZMin2Gj0zNpbUsR/HL3JKxgN4Na9cgVPkcZ0Qrp/5WdjkXOJSB6nPwXGjj+CX3osvADYqahqcX4NjQ7ycUagoKSD5vENOuDI12ccxSebwiCd5Yz6PrSN4=
Received: from DM6PR02CA0158.namprd02.prod.outlook.com (2603:10b6:5:332::25)
 by BN8PR12MB3411.namprd12.prod.outlook.com (2603:10b6:408:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 12 Aug
 2022 13:31:18 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::b5) by DM6PR02CA0158.outlook.office365.com
 (2603:10b6:5:332::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17 via Frontend
 Transport; Fri, 12 Aug 2022 13:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 13:31:18 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:01 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Fri, 12 Aug 2022 06:30:43 -0700
Message-ID: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d66383-6c0b-49b5-e564-08da7c66f013
X-MS-TrafficTypeDiagnostic: BN8PR12MB3411:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8c8XtZoBQCf1OBV1GnkCBe2dZp2Zh1n+3Uggp8X+6b2aQvKN2hwlvG8GBdJn20RNcgpXP/OA8EjvHm1XWeuM7MiruTtg9Z8DJZgNRfe4z3YUZ1TmwPI4MsKsfcrykNmgI4uACziwi7eCVPX/Ysnaunjs1JfUHJVQNt5Vv7JMBP7U2b1xl5nUvHuRtfqTRtZcdVAZZIdXJVsq0WnvhAlkR8zTx2E71Jnwu/SvUfP/76a09LgM23DphqdEVFIx8JKpUH4eiAj91/LuyJ0vcGNZUOjorg6GpUi2NdOpDhj1G81k1cEJsbDAHJ/NGcKSpM7k+Gu7ilfpPXRMpEt1rMHSMO9VqQ/OMzSX4kJBZmfQXbcfklS93p1jIrcXuvziFSfSePbfk5eUYQvbfS7iTm8BfEcRu62JRTNBdZn7HQb4ev2KpbhOh9anLfrwTnJHpucFdCe94Et1ZosXgET9ZDzRQfiDApnvj21oL1ZQ0UHpX5f3B3tXDYtITunjImWsXWrmRB9PIhW/GObKRzNRyVfOfAVJesEXai9O08J20T4C81ocOEIvfDHACC2h7SIus8c5UWKfE9o1vU0R/6fv9BpBz+KPglBH/i4pVoA+b6ghWRHwbvJw0Uw6pe5XbhANcUShB3JfxWeQL2UjIGIEmdCy2qmOxOEioOP+0L+i3hSWPQmK9TZx4E7yrAOU9AF1XGl9M3gD63cfmszTJbxFB6OvO23GulLifx/Bhfxq09wSsvSuTdld9rEHIfYb2kNKhhRYTDiV7ScODzF9PuA7c4ygyshFF7k5AsvelOI5nxzYZHgVLCUjAyWrOFz0jaNx3TO4WnzMJY6Y3zycZi4mUy7H0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(40470700004)(36840700001)(186003)(336012)(16526019)(66574015)(2616005)(47076005)(1076003)(82310400005)(83380400001)(8676002)(70206006)(426003)(36756003)(5660300002)(2906002)(70586007)(8936002)(6666004)(41300700001)(26005)(7696005)(4326008)(478600001)(86362001)(40460700003)(54906003)(36860700001)(40480700001)(316002)(82740400003)(356005)(110136005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:31:18.1596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d66383-6c0b-49b5-e564-08da7c66f013
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3411
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
v5: move bits of code from patch number 6 to avoid
    temporary driver breakup (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
 drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
 3 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..f066e8124c50 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	struct ttm_resource *res = bo->resource;
+	struct ttm_device *bdev = bo->bdev;
+
 	dma_resv_assert_held(bo->base.resv);
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
-	    (place->lpfn && place->lpfn <= bo->resource->start))
-		return false;
-
-	return true;
+	return ttm_resource_intersects(bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..0d1f862a582b 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,10 +253,84 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
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
+	if (!place)
+		return true;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!man->func->intersects) {
+		if (place->fpfn >= (res->start + res->num_pages) ||
+		    (place->lpfn && place->lpfn <= res->start))
+			return false;
+
+		return true;
+	}
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
+	if (!man->func->compatible) {
+		if (res->start < place->fpfn ||
+		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
+			return false;
+
+		return true;
+	}
+
+	return man->func->compatible(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
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

base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1
-- 
2.25.1

