Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8E58D67F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C74991317;
	Tue,  9 Aug 2022 09:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA2904E1;
 Tue,  9 Aug 2022 09:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPdmg4Exj6qhSSxjtawqqhVIVvXvrLbv4Yt62HQRMMxQz+09J9dLgJHNT3d9ktrvW1biCn+3UMCNCH/AeFnw5gqkszrPRX4AvtWuihOyYEJUV+BTejR59fM4w52Uaxu+guiXJg4lD8Nwi25iVBNZNTFHys36uUp5i+/64lbRq1Ooq6arxJrboHk4ya3GCz1wgoEh1339G6McPm2XFXHWdU7/z5LapfNneOe2crocBBccMatsvn47SX1/QzFDe7lPn22RGW9NUcPLDDGHxV7R/8etNF/nfzQuM+4VTqVDxLg+vexLKQKfOQ6RVzCazr1JaMm1pF3ACYZa8Q5kvseTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=oL0ar3oTU8S1uG3zShAHSuHx7jJ3DY5k3AzGT3ds1Vz3M+6s6h1cQOoUWeSfk7lWx1WdES1HZ/Kq0P+r/pQ2IyYxTW6DwGfP6SOHDv6KoIcShUJTZZro66pQe2Qh8cRhwBDfnhnvyf7hAEpltsSW70h7qDI08xuWb9d85/gem4FTGZvQuWXlTjj+/1FS1PpwSpihJQcSJl8/du1NBAVUz3W4I0oqJkBmPk64TlbhQ5VLn7NKOUMW9A+ecNmM8lk70ROrr1FcqlhIdgeD11XW2bXvPvrWFh302ImecsN0r6EuIqZp5mhnKSFhSsGpRZ8tabXI2vw4X0BxjnmAcqGWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=xVt8kAs+LiRKomVh1Yc9l9wMpNYkByyCMXePkTK0z3ge2B8B/+d3mVKyMJ3W8+U1HgTyS2RerxrpC9pv+gneZGA7rYLoCil1GWWHSokqrLktBM/U+MgQ/Ph2yDYipzCEXTEP6gLN5CHpPlUPN8xp6aW3WTFuCVBCG3itIvJJdlQ=
Received: from MW4PR04CA0337.namprd04.prod.outlook.com (2603:10b6:303:8a::12)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:23:37 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::55) by MW4PR04CA0337.outlook.office365.com
 (2603:10b6:303:8a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:37 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:29 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Tue, 9 Aug 2022 02:22:29 -0700
Message-ID: <20220809092230.2808-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb05057e-df6d-483c-e5c4-08da79e8d706
X-MS-TrafficTypeDiagnostic: SA0PR12MB4368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54cmivElLj5BeAX9hO6O9Ltn5aifmZ9qq7E+DIoBQJ8UBX6xR6H/gY0RjdoZGKkwEU3LgePCU1p1+6Uca6LR0Ai7kcVmUJtEK3vg40EEV0nNbTIfjylpGQT73pNEuuVORXNsZ7KK1qq75xRdwdro+2IkA3TmD2vs2G83kDT1VEokvj/VGiNQ1cL/wgYuVQlpAtYIML9cQ1J7kI1DUjmQSUYzzQlAARAz0LjqAHf9TUrH6DZr0x+xeIElievzB251snfaOeRnqHNPY1Le2flvdcNi+voQXDlvcKTRpmRWNJyUolKDrLuWPw3dTc+XttdVcOmZhyBtevnQ8rIu7NPpAuQhcUaxCYJHOM749ynVVe4hJg9Z8awFOMGroRuk3M+unBSu2EZMEwMnvXlXHCCHVyhWkWovEOPTqb9BgqdYf01KHD1tfv0lbPyG6XOQodzvAoVsHGFwNm98GCt07jvwmNHrTxMxkgEwpaH7jCWd7S9KOAGKr+PYQ8J0/+heGkzAmRqMYgUxaw3JagtrlXUFSjh1SDbFbpMPf68T54XG49nPPDkWiM/v4wz9jHBQrQPH8C+BeIEcM3msvbu8tEv/6ufPBud10qD1/0grMfELRGTNTCb7GX9s70DiojHyOYePotm2KYM6tEyee2+QZQmw9BFM/31NbCpy8IRqdqOzpcxJ/OB3fm09rVW7z0r/v7RBraVl1hXsYCt7R7v9RMcTbikI399Mf0fMinTOaUanZlyeCaXXV6FGtodVq1ZL3rcRHG5S72Ek16tJx0KMHutJTnLxrWBK+VNPlhwdBkZwqkpXv0oFh2q85cV0r/saKk5Ekt+B39ucdUzYMV2b9CupaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(36860700001)(81166007)(82740400003)(186003)(86362001)(1076003)(2616005)(336012)(83380400001)(26005)(426003)(36756003)(7696005)(356005)(47076005)(16526019)(5660300002)(316002)(110136005)(478600001)(41300700001)(54906003)(8676002)(70206006)(4326008)(70586007)(8936002)(40460700003)(2906002)(40480700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:37.1398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05057e-df6d-483c-e5c4-08da79e8d706
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368
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

