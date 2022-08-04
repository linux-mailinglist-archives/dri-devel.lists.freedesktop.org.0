Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DA5899A6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E7C9261D;
	Thu,  4 Aug 2022 09:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89A79255D;
 Thu,  4 Aug 2022 09:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZLsPTtPa3aZvAPrezWfmSucYxw9XBs2w6PTRunpu28VF6CQaho6acgGMOQSQVPysn25eOEPfmExKmX0pK1p8gdT/SK5tfGalp7ofWT/wvUlbe+qD5QF6haG859XlykgTeiNXtMcTB+dN/Xyzm7l6qxQomI5SG0WMPlR/y3xD2WuhGWOI7F5DKMyDNMy/yCouXPjkOmPTevFBQUhs3GNzTwTZYc4u9NGdqxJqGIFPqkUyXCXKdWn7sIgR4nEgSOEP8GAXBinWdtOMwwriJj7aL6cZzZZl4v5yNdPimEEh4O6qFaUmUSINQ+o836IsJ7jJYavp4pEDVXPUd6dUwD+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=mGy+VVwVbzIandQHbbCaXvbcPlIuZT1EpVUFMD+Ue4DmHI6VyS9aN6NITAD2LgfFna9LG4CgW+1MR3+ZdeclPXgV9oTVtoup//InIfwLIHff89vK71TcENU5JLCwdn9ZtE6Pn5jv2qjRdINakO5vcFssuuOi+11hZRgI1TwFU0u15Zopd3PBLNXb8YGaC69BOi4aQ97eMDIGv7if8JqdUfpEik62dXnujW71NKBSm2tx4ncW5Cn/Fj/Klx2njqfdOTW15rqZ/8KMAmL6yx7zUGehQ8OFXJAEu/KeUNycXrt+CZyNT0YCNm2L+kF+igCQCyCGtmjaVcVJwIgqo12vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=krNNu95wf8WOyka1JxxXHpUlCgkaAqFqSNUi6yl76KVQFt4eHAHKVmXsN5M5u3sMt9HREVjeh5XVTwOHS1+K99HkJtT3tHkyETOKtzb25j+o6aKWg3qEfcaPzXEhMxn1pbmORAw+Aspc2ysvACx5MXPOrhvfvikR209LJR6XoZM=
Received: from DS7PR03CA0334.namprd03.prod.outlook.com (2603:10b6:8:55::11) by
 PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 09:00:27 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::39) by DS7PR03CA0334.outlook.office365.com
 (2603:10b6:8:55::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:26 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:23 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Thu, 4 Aug 2022 01:59:51 -0700
Message-ID: <20220804085952.6137-5-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 49cb3b9b-b7d2-4a85-4d0f-08da75f7c620
X-MS-TrafficTypeDiagnostic: PH7PR12MB6761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8izh7JvnstFZ5B/Wx2Q4wTblvHi1Zabcm5qpeloqzQwdF/JlzKJEnpgLmuUttnD3QVvQ1iEE8XtFjIPImzva3+qlzRaEywTDQXm3zfk7WNSwZAY83pj6n71/sS7F1z8Zc+pcLgmh8y8fpdiTiMIUorh5QqfLFwdG6EVyYSB+JJI2Z/0E06J2V5hqzZO1mPkaUeWP+dDuPaFeNyhVmEf1aiCXvA6O37PbYUKgy+cn2Evv2y2059QYJjMNYuqvKEY6WXUcyj5U5Q1ULuBeKWORZFokCa8o4RyOWKTweJhzsoB79oYBSPiPtcR4SBg5f+uEP1JlksOdilPgHIMT067AnRSgaiWBt+W62BgDyIefmnSe0K57bHmAWcXZTqeJsBzHwOzbqFe0fFRT2dLOITp4i/e8XlOdcPR8cgtTqHPuLCbCH3hbm0JkdPeNLqJvs1lZ/Aef9OZaSN1CY2req4wi49Xif8XRN7p7Ad+5p0hZLPkcWwD46/spWuZOzol6Y6mgcPQ4f2C2IWI9r1cuq5CKv2C7gyTss+JQGRNBpDmJ1Pz6jiYvs70Di7CpGoexaW4b8Eic8GTHWPxyZY38dcKTpJrOCNjwWwP+xYR8bCp8/YJwoLRToPWekV945sS5z8KFpwVZxcyyFRzkHsknCEuuCIUNy1u8CrsNEBMxi/uW3G9bfdFBRqdeFXo20iMI2qjUHJBuo4yMFr+0DoVzDXzquMOSCASyMyhfQAU9nTIklJkWDaV8CZRuawlN3ysFz+P+wXpfx8MLh3Gf14q60UrUWGzXrBO1ryygyyhNssPDjX+anqSFhlDnw+eGCpaWsfiwLHakFuFX5/J2DmfBWpBWlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(86362001)(356005)(54906003)(82310400005)(316002)(110136005)(5660300002)(81166007)(70586007)(36756003)(2616005)(8676002)(82740400003)(70206006)(4326008)(1076003)(36860700001)(26005)(40480700001)(40460700003)(478600001)(16526019)(186003)(8936002)(41300700001)(83380400001)(7696005)(47076005)(6666004)(2906002)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:26.6630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cb3b9b-b7d2-4a85-4d0f-08da75f7c620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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
index 2e517cdc24c9..76f8edefa637 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -187,3 +187,32 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
 	*res = &mem->base;
 	return 0;
 }
+
+bool
+nouveau_mem_intersects(struct ttm_resource *res,
+		       const struct ttm_place *place,
+		       size_t size)
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
index 325551eba5cd..1ee6cdb9ad9b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -25,6 +25,12 @@ int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
+bool nouveau_mem_intersects(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
+bool nouveau_mem_compatible(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..9602c30928f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -42,6 +42,24 @@ nouveau_manager_del(struct ttm_resource_manager *man,
 	nouveau_mem_del(man, reg);
 }
 
+static bool
+nouveau_manager_intersects(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size)
+{
+	return nouveau_mem_intersects(res, place, size);
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
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -97,6 +117,8 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.alloc = nouveau_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -130,6 +152,8 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nv04_gart_manager = {
 	.alloc = nv04_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
-- 
2.25.1

