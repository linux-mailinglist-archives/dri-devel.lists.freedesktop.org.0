Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F00584183
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE168113230;
	Thu, 28 Jul 2022 14:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ABF10E781;
 Thu, 28 Jul 2022 14:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+tVvqFWD3dEd8GHQOI8ATnI6tj118zD6ljOa3UtEUR/416W/CeDPq1MJwmwYkQ58dPix0UFHsyV9CXB0q+0g9ljqT3eIqDNlNjQk2rVP4C2I9DeHv/I4OXS4bGnaariPiCvNrXZ7qzUHB+l1tBlTEwvJcjVMwsM4dtjcpa9I+P5TNvAjd5kw8rz0c0I4KZojLEvmYDNDIqWCHjAQy2DeZzp6Nt5S1o/G0jkQo3VM3MFCu/kFL1mtxtvenULIY9xeUziHBxhFBbnR8m2kH4EjbQbKOu+8IBI32icPosOKPzeDgjP76j7boMRnXLhkosYvj+fl/UEIkWEw46cIiW5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlvW04LQgrybyj2m5z+qWZff1BtVdMwo9M8tIcJxNq0=;
 b=Ixquwf8c/59kxZ/KUp8aAv6AAXHQvgS/DbjAo3xVv2WZBNHGYy8jDBnbPVbYJlKOVp7iI7sw+4yRtYCHXSaNYOvdWpzCu/z8ZLg710kQdyR3y6vZ97qZqusfFgR3OAzcuM7GfVncWK8KgJ4QGRENCWJv1pRkWdRVvRNGXgPOTu9qCI6sNbvTF5/9BRc2eKTppmvPgcH9rsmDCymOXarWuYLv3Px95ll/u8+NPX5OD7/N6vgg/LRILcGHPgnF+RF2W9ydAuPdZV4zUJWTsnnlSBfzKkGit/zLoZV2Slw9O7BazbzGRujhxAw5pDuykYSUCl7Eg8OI8hRz7wChFOBceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlvW04LQgrybyj2m5z+qWZff1BtVdMwo9M8tIcJxNq0=;
 b=HoJ/N06+eYwkMAI/PhwqD5bZIX+9JX4u3QmtiheDTMMbE1Jd2S9lWr3Ct087HLdpqW/cAAMbMaeoBJCsODavMSqLFFr2I8qRnHgm2QsnYH5FMFz44uYjwPtQWpTBA+qNUV4D4yBKegY6LkhcyMsAQ3wvtvseNRJdiypJF+AI4/U=
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by DM5PR12MB2373.namprd12.prod.outlook.com (2603:10b6:4:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Thu, 28 Jul
 2022 14:34:18 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::d4) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 28 Jul 2022 14:34:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 14:34:18 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:34:09 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Thu, 28 Jul 2022 07:33:10 -0700
Message-ID: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b0e630b-e3c8-4221-c5e7-08da70a6410e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2373:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ax7XOsiBj/nbIV63V+4TC1f8wh5zGh8qfCm7YT6Y0yoUlZHpzLfRW2CTaFIVSvTz6DhVx7HFjd97A56tE/5+CkdEnR5Ng31wYn7sOqZeLNcRhCZ2N6iSfts29AuUSOpf1eZtsmMThYZg1O9Cq0XtxkAiqMDNloKvYcftVsk5cO30JIoUBlSRpO87s3W5Ec/G2h7geien3JOtYhrPgD45FG27I9MsfFpHQF04y+wq719LNM4vUdNDGqrdNL/NCT9QqBe2uLTmD9Ib+OH36yRlKKR/Nt/QhNoxuMzlIF2b+OyKEVBJX2iX6c3gITP3bv+2mxoVJ/aS4ucBq0lb1b/oCw6IF06rYoUevhWolf3vjKhs2uUlU4EbOcqc3ss/I0LFUHCugphwG2r4w6iPReFkQG1JMvDE/GPhUVfhs9GN+8OaT+uJltHwQEM9M+5QJaogJsbf02F2dPkxfKnGtZSQg/Gm5DisNbdp65UrteIs/eUIWPe7AqkmyNvDoa7a5wOVaGSPI09OQVxMp87ooVPF8AlkRkI9C2Mifa0X/AwKVI6UdV0829AuceXcvO/28esxyj+aHvCOrs1KaDt5VoMQAue+tBB4IDaeAW6MrU17od7bTIiYNR4NXrQw386dhjTTImZAFjQeBpQP2BgjvCoxf/kG16JrCVmJaTSWFJh2BkkfTm4v46ZdE99tXaXp8lJm2QeGMEyRLxNUlThWNuYHyNn7xK/O3h5YroiIDYWntTIV+GZ96J82kjWP5YX0cff3SaImhc/Ou9tHrZvwZ0SBniFtJG7ZHKD5DYqpbdni+GJCKiV/hz8NnEu3kg8SpQbxDweo3K23ZZckp0kM79E7XQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(40470700004)(6666004)(336012)(110136005)(316002)(36860700001)(26005)(41300700001)(40460700003)(16526019)(70586007)(47076005)(2906002)(1076003)(8676002)(70206006)(54906003)(81166007)(86362001)(36756003)(478600001)(40480700001)(426003)(7696005)(82310400005)(356005)(82740400003)(186003)(5660300002)(4326008)(2616005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:34:18.2997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0e630b-e3c8-4221-c5e7-08da70a6410e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2373
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 59 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 39 ++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..84a6fe9e976e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,6 +253,65 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+/**
+ * ttm_resource_intersect - test for intersection
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
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size)
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
+	if (!res)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!place || !man->func->compatible)
+		return true;
+
+	return man->func->compatible(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ca89a48c2460..93c0ac338be8 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,37 @@ struct ttm_resource_manager_func {
 	void (*free)(struct ttm_resource_manager *man,
 		     struct ttm_resource *res);
 
+	/**
+	 * struct ttm_resource_manager_func member intersect
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
+	 * Test if @res compatible with @place + @size.
+	 */
+	bool (*compatible)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
 	/**
 	 * struct ttm_resource_manager_func member debug
 	 *
@@ -329,6 +360,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,
-- 
2.25.1

