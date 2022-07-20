Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0B57B1E8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019EA10F123;
	Wed, 20 Jul 2022 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5E710FAA0;
 Wed, 20 Jul 2022 07:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZ2Yl0cbqu3qrsJT1DvkQvuBIgUJ0FS5gcRGtwwhixjGQlm4VERVlZuGnuadZCTwMU4E7r5cMVAEA7cTR8lbqrrcvWxNlecYj/ESjf9InjYi5el7hCPTy0C0AesWLWrBZi7IEdx/QsbozakFSLiQA6ME42gTbMXqtCS//Sv4tx4xfc8Vb30Andl2DzEvC/OWI80rMG52kDQhad1o1YqhbaTGVaAEEXzDDUXBEK0wqTkh6ZAjDocr1j3fm4CmMszWwkFfwWbAQa4/NbpKR/YQnhkv4QLmTlPCNvQkpxp+3Nx3A4kZjADSd+vUzO/p6AhL0wSIB0h1INxVPgRXiNorPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DurLB9Bv3nwQyfFdCzAS9Rw3FnvqJtVeioN2PKCUOg=;
 b=eTLV8uwHiAmtl1Qy36ot1R0eXIWNrNFl9hYaq5JD1CaMAZc2R4X84uJHutX2SyoWdzQpi0Vao/z2B0+TaiqUjXxL0UHQ2JtPi3G3rWf0TV+YoQWbObLpgg3rhoUJ6cFZhC/MCngFT3djrY1F7vXlzrNnbm1wYVFkWgaXKvB9RWLaqarCAU7urscYSZhJMcbR/zA1oNfsZ4ohZHxQp6YieWth0RvRYyb9Fk4479SVKd56+XYxjFld52q0E+vZB4QiQax7d2JPGafm/cvcdIt4rf1SpUe/E1Q/P4z7reia1Jx/h019SJhG8HQgXGVBqnBEpCqQem5icvX95xdUorxnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DurLB9Bv3nwQyfFdCzAS9Rw3FnvqJtVeioN2PKCUOg=;
 b=SWwIbcAruovQ61gA5sCDOy98oD6tXL4CauWj18NkXLUSqBFrBwMkzmxvBBwYosr/kfNlwPL2xVmsAfrN6D9j2/mUDESQY5MazOfH5Q5ICXh2rPA66rcXg+B7RmMQCofmN4U961J1kgOAIWyDgAsWC+Uec2T08lq7fTuek3T0IPw=
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 MWHPR12MB1405.namprd12.prod.outlook.com (2603:10b6:300:13::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Wed, 20 Jul 2022 07:41:04 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::a2) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Wed, 20 Jul 2022 07:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 07:41:03 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 02:41:00 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/nouveau: Add intersect callback function
Date: Wed, 20 Jul 2022 00:36:05 -0700
Message-ID: <20220720073606.3885-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fac8f165-943f-4f53-dc5b-08da6a233315
X-MS-TrafficTypeDiagnostic: MWHPR12MB1405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAlJoKoctne+E7GwddBDI6Kshh5QQ058KC7rigLscgUwrmIGpTvx6ePexkPE1SPuDQzMZ3s/L3O4UsUoGs58qPHOX879yr/c0PvXVMt2tFidR/6SzKuMwHaNm4XagC2225oW6sHijsO8JQ7M9oK31vMIXlLB0ItTDhVwShlHGec1GpWxX6UGFlkuWK11ywZru2PuUoBOo8dmFtM5p2mWWlsviMJAUY8e2WOvpGpekrwtSMwk85D+i4P8/aRywLVMr4KJFWjsWEeA/0a0iLjSe8X7owXicN+SgKjASevCNkVMYEkCBXL6Dj++rc0vZsSFCaMdVw6nsskt35thIPA4q18a780IL+5HzTdp49N1g0BjPHSWCM0YmVabRnFX7fTiS84k4IH0ouOjXIbh26I5H1d6plIeq/QpVz8rTBw06bG4SRhx3opy3qMsbZ+gMhcro99g7lQ0kBjXLDM9tfEi85lmchZPvqPxFYNhwWwkQ+kFJbf2Dd8tBfD21CUyU/L2g/Pc2WpA0SK2m/F6YEx9fhopUhkD9qJrMKPoLYbbOExFEN9dnRNArxk512xQ2sjHpubK+pMWCZ/ZukUF9/HfWyc0PiJ1FOzitTfs99akb3yglLDd7vG52vYVi77A8ypFUeBDKpLECkwL83gnOLaXgGj4y6TgNJKPy2TG+wzdkh7ANwY+Tmh2sUeJbcmE1PdHcp+nM78ZqELGglQKl29eTRF2p2L0jJVG3jGLndmp9D24REHgYFvp7JUmiPJAb8Ea/EbikMoszHhvbAcBYf+7nXbnxTtcYJticftWyzrk6iKZV5ppk8MMusQoC1GSKRA+1Mfj2XS5dZsACIzXKzbk+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(54906003)(110136005)(16526019)(36860700001)(47076005)(41300700001)(4326008)(7696005)(316002)(1076003)(2616005)(186003)(8676002)(5660300002)(426003)(336012)(26005)(86362001)(36756003)(8936002)(70586007)(70206006)(356005)(2906002)(81166007)(83380400001)(478600001)(82310400005)(82740400003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:41:03.8723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac8f165-943f-4f53-dc5b-08da6a233315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1405
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
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new intersect callback function fetching the
start offset from struct ttm_resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_mem.h |  3 +++
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 2e517cdc24c9..b8a773f03c32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -187,3 +187,18 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 325551eba5cd..349fefe48e3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -25,6 +25,9 @@ int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
+bool nouveau_mem_intersect(struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..46afd57008dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -42,6 +42,15 @@ nouveau_manager_del(struct ttm_resource_manager *man,
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
 static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
@@ -73,6 +82,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.alloc = nouveau_vram_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
 };
 
 static int
@@ -97,6 +107,7 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.alloc = nouveau_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
 };
 
 static int
@@ -130,6 +141,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nv04_gart_manager = {
 	.alloc = nv04_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersect = nouveau_manager_intersect,
 };
 
 static int
-- 
2.25.1

