Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C0591187
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6A6B376A;
	Fri, 12 Aug 2022 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2959483E;
 Fri, 12 Aug 2022 13:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7PiD+KaT/U6WyMIP9/zpxTRCsr2g2/woePZhIvUXdaTpWGyCy1WNjatKM3k2y/fNCU7S/yPYA8QRpcL0Df89W7FimVeWAiyq5gh5idBFBZT3TcMwL8hxuWL6zsJS3z9fuYtlo6vn+5GqfUJ4xV0H1ptIWJB2gmmPZZp4YkvgtyXM2FzGwTdjlCK+g7bbb66fsZokurYMSUsdWRb8XXITYUeRpTSzLF76Z7qN0HGaFrywwl/kyOseIbLlwYAsqq5jYzKfgEKChWbSjroXZ/gJ5gSvHj26uPVNCjWNHRksJ7UjJ21ZjLFZBCciSqi3hxMSNs/2Lg3pI2Vo9dYtN3FPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=B+iU7fsEYe88WyjsyJO0lDY7DU0bUcd9IFd6plka28MqBkxzAtI4B/fHHbh1H4YRcjHLsdxXwSRzcHmsJqHOEmdV3jkzv693FWXMlGDnWHj+MEXdYkOUFwHCltJGYb51gSgs6lY8wo7mrFWKlPiSOqxpyyCsBeJsfprDcAnf3J9757/wu5VD+mDrsae02LCtk10Yur06MPDJJLtBapK4qzZQDKGVOcyKQkTFi4nXpf1rLeiS1PemboqXA0x7Q7RqvMtXOeCGwA+YzyB1LL7slAOMkBhLNm5Lf+ni5tQGGWtb3LbQjcvQweGtAz9DHIo+7c7Jt8/++fdPSiI3pRNPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlYFejr4HgpgRo5ypOIC9mjnjj7GZ7tzj2eg7YJF3NA=;
 b=s5jj5/hYHbWewDvCZiHbw7M1O14xQagSlUSisk2p0vQsFur+ROi3QJemen/6P4wqeGcwGjcIIvoMdSDV34YWFnOEssxLbFxu2aFSlXBQH+4zXXP+sFMhOfO+1wm89KD6EO0lSgmznDUPUV70onXLEdRZB4eBor0woyfEoNXhLfc=
Received: from DM6PR13CA0016.namprd13.prod.outlook.com (2603:10b6:5:bc::29) by
 DM6PR12MB3321.namprd12.prod.outlook.com (2603:10b6:5:3c::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Fri, 12 Aug 2022 13:31:55 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::c7) by DM6PR13CA0016.outlook.office365.com
 (2603:10b6:5:bc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.10 via Frontend
 Transport; Fri, 12 Aug 2022 13:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 13:31:54 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:52 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Fri, 12 Aug 2022 06:30:47 -0700
Message-ID: <20220812133048.2814-5-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 082471df-bd48-4200-90a8-08da7c6705f9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipsa1IFu5anqBXyXSDbd6X45DM6e5zLyTVYumYIZJ40ME8LII+1CLZUCrBDkkdcBoMBrPXyk5FpULnmqazJH/wjKtKtF4K04tPrvgGsyHwsIibYms/znPm6i94Dwx3r8wKqW/+uakFOn+Au15HRbxyDpBo6rERCtj964JYky53KFYyVTtF97rJR/GNP/EWeImGRhmIoQSKzbzrh4ib6faYCHQEqjshYF6S+H+DTjAcK4szmwx5WX/PRKscMDSUJILPuEpEnq/oazyyBAe+XuhJfKDnXv/Ea2Nylw4Ube21OAmHij3JSbb9/7HArzv+ib45Bx+RtHya8mctwJC73SjFa8sp4i0x8YMDYT6xRT/TLGuyou6OhshFy9ltkkyscQLRPwTw+DDXbDCamO+3WuiRQmAc+XCtisHOWuEVHDhhmJpSShhNY2NQfiwFHIU4NwFPBjuQjKo8TuFwGbOl8m2aS6Ms0tfVn2L6Up8iMP3WNg4i/cjg8aX6/zCa+Gv47OtgsZgYkYstEO//lk+QnsPA/LoeJINPDUexo2xIYa+hP4UKRZMY+b+stOG9CBxdA+aw3JUmp1CC9/uwgxYNGwosfNwwghs5tHAnsZJoRkLAyt3ap7ssgkXeffeaCYnVJsnF7/O7kyLuWDF5Q4h9sVMpFfS5t61Cnpmo5t4PqP1rKHBqmTRCbRW0fRKoTU5FrTJUCvt8KDqAvR3USkQMWPPKvQE29Q+XFvJMOhNyXj2ZNIFuTBRlQ8tEHcxjwNw+/HOcWxIjteYso/OXKTt+1x8++ezTwylmdbAdlPpBJprpI5eeQSVklCaEHYiIHcpReYDQDVWvE4svkJ9k0TzFRBvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(36756003)(36860700001)(83380400001)(2906002)(82740400003)(356005)(82310400005)(40460700003)(70206006)(110136005)(8676002)(70586007)(316002)(81166007)(478600001)(16526019)(1076003)(186003)(426003)(336012)(2616005)(47076005)(54906003)(5660300002)(7696005)(6666004)(8936002)(26005)(40480700001)(86362001)(41300700001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:31:54.9126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082471df-bd48-4200-90a8-08da7c6705f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3321
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

