Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E9584186
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246F1136BA;
	Thu, 28 Jul 2022 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6610E175;
 Thu, 28 Jul 2022 14:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQDA5nvVIOiT3TOr5ZG71pienvNuxZXiGbxCdQWwIAsdoGBLudjE9rOLvRXFCmy+jAiBoIqAbatmEAPX7nv5D4E6TKik9tkp+EjEfHHDPZXFWxKHfnfB54D/4D1ORAqJRmoC8p15b1czof/FDI6i8jv1W/B/CopmKpkqIsYYHS7JluzBMfNJqP3dQfyRcz4VBYezDx8B1sG9M8rSAutrN+jBLl62UFQ5oDRZI/wGACWnt0xoq7LftlpOeFSLk/kw6PUlZs47l4A44MyQfzful4hw0GdSl0OHXAwmb12xa3SxBV6q2AL//fz5cyo+ue64mxkDiChgsRdC/fHx1pjq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tocwWi/eTqfOMC0aL3BGG+gphvQx6vHAxfx4EVPX0ew=;
 b=ivY7LaXfvwWMtHTfXvnJ7Ekd65d7ooHc+n8Xev/m8eHmG/ubGHu4pDzAVk9FnvxSHjmUTNOVqEC/9MYhc9vmMHCT3yWmVYdk/jk/mfBtow1Nt+TJ3haNw3uyN+V07e9260NjmMArqJiAKrlqmZFdhSkHTzSJkoVnCSLPIXkHf/c1AC9RWLE6YnbAxvsBksjHmldZy5QXcjWl+CjVGZWmdOavibyC9pu8j4GqKo5cVkV/wDNtjmpLOMfXjbuZvylnv24kIlWPB+2H8qohAKSaXO42spmcefbf0PSqH7qmU49DsgDP8RXWJk6MR7zkeazjCaAcvxoJRgvsyrw1saOsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tocwWi/eTqfOMC0aL3BGG+gphvQx6vHAxfx4EVPX0ew=;
 b=ZbEqdhQbDYdJKjCfroUUu1yvmevaHrUUG1i+xlUEkouNDkIxOrBibLalS/DRNa32k1zRgWJ+oyZQEymGnUx/m3d7a7uj5odS5iN4SRtIMpl2n9u6xOiqy51Qjy3KWi7M0DyG3epV7Ey75ca5CkQa+rtHZ29sHDMi3WpfX0g7na8=
Received: from MW4PR03CA0026.namprd03.prod.outlook.com (2603:10b6:303:8f::31)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 14:34:25 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::47) by MW4PR03CA0026.outlook.office365.com
 (2603:10b6:303:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25 via Frontend
 Transport; Thu, 28 Jul 2022 14:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 14:34:24 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:34:21 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Thu, 28 Jul 2022 07:33:14 -0700
Message-ID: <20220728143315.968590-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f5a64b-e171-4a3c-84b2-08da70a6450f
X-MS-TrafficTypeDiagnostic: SN7PR12MB6768:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eo8wDfidXgYckj340aHg2SfBlrgwJJ93RIBMJ6Dxx5xBL+1XR7xXpfXW9Jx3lWa5WwoXcqfFaBFjbPbVuel/YRM6YVIBAfcdxGnvjB8pVeEBhdoyDtcpoVsH3jyQR/3PFP210oibiDEZAExQ4oXxYQnTz1YJK/sqpBwvNTmyJRrlitJ3AglSW789TrRjqakdY5U1uzeo88o1QQOodn3k3mvXAihwyD2vFrNxd7cMkImd8PUFLzCrnNrLfdtCc1g/YNfKMYj44XUH4ASCjC/mIfDJmqr2Ofwucn2apZfT+N2JlgzmfcfOxhle2XWPDH1n4MTa+VpRTIrTh33CN26h+vvKgxc0Z1ezVS5N7PGxT+SQJvB9Lm7HKILVp7YGoAgbLAu1Da+tkHL+6pLg7rYZu/9KGDtj3f1N/UuugtUkbf3ndc+ge5zSaLRAG/dWMDbrkbVqPTSwM+6CmvTyCz5J8ysO7WK6/GgZbuSwAALUsgfm0DU/skPXWx+hkETiZV71bdpIBuef7XGJVXhtwaz/m1GvgN+GUET2p1MVMyIOhvuKyOI4jwbc2HpSQnXQ9/bx6jWE2pqXf0jZyvxRMKE0V0Gsc4UDcXGKRVtRxG7BhRmMnEGgmKkgbozBf5IwMwJH/Sve2fq/lkYmwJkWbLSAUVIIwMLGAEOeT6DBQ+d5UK2jzLyBhOhhyYjWuoDraeYomkK8j4eQ3CwfzMHWW/oczjg5KOXoHtY20RADZde1rqR7jGAg9BmZqjK9B0qeFxG9EFiiHbeaVZexxcLQ/WHZUASwR0iNdj+OwQp0yjQ3csZ1NT5zi9cJno0zu0QComDT4G2NnoSsQV0RF1oF8tq7Iw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(82310400005)(82740400003)(86362001)(356005)(81166007)(316002)(36860700001)(8676002)(70586007)(83380400001)(4326008)(40480700001)(70206006)(426003)(26005)(6666004)(2616005)(16526019)(186003)(7696005)(336012)(41300700001)(36756003)(110136005)(478600001)(8936002)(5660300002)(54906003)(47076005)(2906002)(40460700003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:34:24.9998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f5a64b-e171-4a3c-84b2-08da70a6450f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768
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

Implemented a new intersect and compatible callback function
fetching the start offset from struct ttm_resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_mem.h |  6 ++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 24 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 2e517cdc24c9..18f1c22fbc2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -187,3 +187,32 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
 	*res = &mem->base;
 	return 0;
 }
+
+bool
+nouveau_mem_intersect(struct ttm_resource *res,
+		      const struct ttm_place *place,
+		      size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (res->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= res->start))
+		return false;
+
+	return true;
+}
+
+bool
+nouveau_mem_compatible(struct ttm_resource *res,
+		       const struct ttm_place *place,
+		       size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	if (res->start < place->fpfn ||
+	    (place->lpfn && (res->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 325551eba5cd..4910e0e992ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -25,6 +25,12 @@ int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
+bool nouveau_mem_intersect(struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+bool nouveau_mem_compatible(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..5dd6b4d25177 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -42,6 +42,24 @@ nouveau_manager_del(struct ttm_resource_manager *man,
 	nouveau_mem_del(man, reg);
 }
 
+static bool
+nouveau_manager_intersect(struct ttm_resource_manager *man,
+			  struct ttm_resource *res,
+			  const struct ttm_place *place,
+			  size_t size)
+{
+	return nouveau_mem_intersect(res, place, size);
+}
+
+static bool
+nouveau_manager_compatible(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size)
+{
+	return nouveau_mem_compatible(res, place, size);
+}
+
 static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
@@ -73,6 +91,8 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.alloc = nouveau_vram_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -97,6 +117,8 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.alloc = nouveau_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -130,6 +152,8 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nv04_gart_manager = {
 	.alloc = nv04_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersect,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
-- 
2.25.1

