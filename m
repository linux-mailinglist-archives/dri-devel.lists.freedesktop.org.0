Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CA589998
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475792571;
	Thu,  4 Aug 2022 09:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912F692608;
 Thu,  4 Aug 2022 09:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9BK+EyVHY7G10AuyP15ZMmU1bBLkLkBzg7vNG+HwqpeWxo39VNVu39UgnDdGsYt0ypJbj9K5UyNFnKuDLQ8lvj73eYHgbYghGnX3MY/y3o0HIhQBaocMBVnitZqMKBUAwOAHKiLVSBW+l9cOhMY5r57QOb9TnZr9zorrKo48jnd5tgVqqu+fWTYf5zJtE8PvJliK0Yk5BfsSEznndMJplQokkmOKqYD/twRYoseEXmfKyQSbv+gwS+nAixdlx3cSpCUuZ0JWJgxSr2aq2SO6BpOkmhbNWVbF8wcl1WrBfvdjXYn/1VxAyhG9cYnFkf9GQpp2zekpzJkUndUKlEs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKcYfIjPH1bDveC/pE2ZMqfsiZ6xzDVHGvJ/z8LHemM=;
 b=KHud8ed7FEkBbbGOyZ+jo6v/psTewjGZxOSQcpj3d51Crd3YAHTVGJw/SXOCYIyRMCCvv7+FLsY75JYbTck8JNjASey9nDFKCnWnjIn9QHJX28muRKc8YMGZdNHbaLA68+pZgbtQFTKIOgAIEEx10LH698fbQdg890SHRrLBxik/3FPaFhVLRkxFSO7zO5kHdCWTAYBI9n4CL7rBQzysjYYJEBI+C1iJUkj96lBqvmWMqyfawu8JyRkwTYCFqeZv9cI0A8THVi2DTD54vz3zWRzDjDAodcuO0d/Mze00aEXcj+AtU13hlUQgD6Ti7avIP8viwWaiFgd3UE5qImqYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKcYfIjPH1bDveC/pE2ZMqfsiZ6xzDVHGvJ/z8LHemM=;
 b=yM4BI/FH9LvZVpKtGwdQ1u21lTOrmCNfpzlbbBtPchKADvn5zLRxyRwzTe4pQwmVFpeF5ZCeZ4Y+Sr3ZkbYNb597kFdpjJ7rg21XDigguRX0ENDsLev8xeH74oiAGgXT68R+1Z7a9q0pu2JDdgGKAggU69paZCnNcNQcniD+5cM=
Received: from DM5PR07CA0068.namprd07.prod.outlook.com (2603:10b6:4:ad::33) by
 DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Thu, 4 Aug 2022 09:00:15 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::67) by DM5PR07CA0068.outlook.office365.com
 (2603:10b6:4:ad::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:15 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:11 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Thu, 4 Aug 2022 01:59:47 -0700
Message-ID: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de31f468-9d6c-4f7b-4e03-08da75f7bf49
X-MS-TrafficTypeDiagnostic: DS7PR12MB5887:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0x+8Zej/ot3o3oVzVMxUKOjiD1Ecoq/Kjy6EdzcAvlbMHpa/diINbOWj7yuRCUROpLpyvGhNT44SCgeiX8X9CZylUP++NPL4e034R5SHP2G5atW1t6NXyWdtSmd2ql+X+jUWSB2abPeMu6HHggBIIZKrANQhtFvtYbSAWv1zQaBxYvj22kkHanf2nsocDe4XdhTnSVgI3wQXApYgek1fBSJNu2ViE/+pUk0/24n9hvNvbKjmH9YadzUXlVmUgPWfkTYUPc9hoknzSbtTwltD71oJyNZErSbtnl+DtX6hIXZJtz+OP9EUOjmstjerYxsKEnosY6lGMhmImV+pI9uLix2kixJNgHV6s4x1hwhj9zH2oU6lVrpftAAQW98qt7L1QUyZ++pP4u6hkInmwkoosvv1EUs6oz2EqvHD+Smdbc9lmy4sTgqwFlK67MIj3QKzm6YHC6ijUU+XBPdehJQjCihDSq+Mo9sdkTkldHAzwBNR0xioH9fsUpGkyg5ZffJQFsN7VGRo/mpPNYXueCUg3eSbjcxxEiufQe5xZ+kXQ52fyPbD01Jsi49yrC7mCp/GI6CCuQf61Nbgxx/1F+ibNF08xWIOTNUZACT3ygG2Uvg0HztgsnakEZO9Pxf5Ho2s9i5yQ/PxgY1LXcgmL7p3qnmC+YExnFu9YfC3jNTPURicKpgrvO/RujAOKDYpRQk3FaZT/7IrCXjOv+Ub8qTYnIQ/XGIrsp49ZDCaJny74TjMuAygQzzQXrbEha4UaFiea+jiq9YMhuXxmahJzPIFdkwkRPv/yHQXiE57wvHzT6kSNsnln6bs19pDNniaooTtaP/1uF6iRwnGkfOg7QQV4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(40470700004)(41300700001)(2616005)(6666004)(8936002)(1076003)(5660300002)(16526019)(186003)(26005)(40460700003)(4326008)(70206006)(2906002)(7696005)(8676002)(70586007)(478600001)(86362001)(36860700001)(82310400005)(81166007)(36756003)(356005)(110136005)(336012)(82740400003)(54906003)(47076005)(40480700001)(426003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:15.1877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de31f468-9d6c-4f7b-4e03-08da75f7bf49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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
index 20f9adcc3235..357249630c37 100644
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
index ca89a48c2460..b4914ca75230 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,37 @@ struct ttm_resource_manager_func {
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
-- 
2.25.1

