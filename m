Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6253676C9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499336E9AB;
	Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC726E027;
 Thu, 22 Apr 2021 01:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay9LPdfXhN9LD1vJIi7rpw+98nYsbDwgoe5u9ZiqqxEDrqe+F2m3eynWw5sG5/LLGJ095Nx3lhFXcC8bE8S47ysBfmgSJE//dq+TT9/F92V/Z3ycmwcL+eAdBdKB3glE4YzWPH5IaAonVEaxbg1UHvsGyxhbOZkf1tTMNCjVGFe8F4finlHxjlzZrNgUzEW9aiBkCqFVNyioE6nN0piNcopumww5RDQn9bdFrsVfo+NoGXiNDPhIGK1eseL3vMCsEk82CbO2tjcq8D5MGjZG9LIDiUEkLxvK7uED1p4h937dgwYBRUy/AjeBxR3oXyBsNojIXgrTAu4bUx7J/jRLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkZjhC/1rnhhkSi5MTUeQLMCe5BWmL9UkuDzzaGAfpA=;
 b=dHyV5lLgIW82wNd/4VMyX+BgWoa16lb69AXa2PPb02gnygNPc54fyGtsNzYXBf8tbL7DGvYgHgRcO65Q9dRQzR/cuymxPsnMP52SAmPalPhGYdKEWhLhF2D9LX9XcUA1pxvEhU5r+k4kk8u1nDUTegzmqY86iKncBWvdH84q1wuIvZadG++fY2RRzqFF4CRM3LbZYmOXCn9C7pNn05shg7kYEE/DUf6VBnRrU6+UmqUqzEMkNom4rRL7jD+r5od3eFvNaKALThcLZ19aUhWBUV9cY5vPQgfaFFofxm+w3XtBmJEGOWaq4vhcQzfHjtARsJS6G6GMZ9Wv6LiSERBu8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkZjhC/1rnhhkSi5MTUeQLMCe5BWmL9UkuDzzaGAfpA=;
 b=j4Q1SqpFkjHhvceCyKmDaWU1sAov04tvCZdukHC5FWCwFmPhA+evbJrN9Eihk11NRa4bmupNQmBCyIOgNGTgN1iMtlq8wu+Uv59U4NsjEZRfcK4+N/ouH8VTmt8h05c/LQKVDEgDPrwgl0VRnnTzyoIqol1UuGvVGIENM3GrQGA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/10] drm/amdgpu: Move dmabuf attach/detach to
 backend_(un)bind
Date: Wed, 21 Apr 2021 21:30:58 -0400
Message-Id: <20210422013058.6305-11-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83e12367-74a5-4e7c-c1ac-08d9052e5454
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438B31A3A5FD4CB16F7BA2692469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7QGYK8PFErh7FnGiiU8TqXqPDGsvrjuabLBcQE+onSSLCPwVHjDuqeP2kjvNTSVKjO6rDkvHztDDfZHn40Zse+aCz6RyqRqafSCNnG0MQtGSpUBcej0qwbCSSjfMbcquZ7w+TOlwjOxT+5zXBITbsrcI8iGtKX7WtDXHd49jiTOwZGa60aAbhtU8ln2XddQZcOCP7cWjiXPp926Ep/yOoUBsMuUPMYh272zAL+50srODiCfQ97uVGxEpRK2p50M5lwg0JIz7B8x3y+zCa/TN0kowCSoZt6DiDQjgdodDZOqJZme5CRYzrvuN6XRVIDYtzLNcOyus94ZBNNbomGPPcTElKdwu9mrFu2+lEzXHiwkLsdE5TI5Afm81p/BX/dm9Ri8sIkYm/1bQbptOBC+ucECUHfeFafCo1jKUmTcWD2rTSq5AMZXg/R573mYl466jUEN0YeVNWsv1ffc30XQvq6Hktsn36gcP6rDmBC6mLcWvOtVSRMLL10DhzK0JaqGGt2IDE9JnyyMQW6ukPUwScykp9UkTuithsgfuOzI7gUjypHruUHGd+aBa02rPNSr0+AsBCaW602SU/ROuCcimBq9hO6b6wrHdAJMMFE/kM0lx+SaV7dCN3y8G3XoUHgOs1tdzD6bnlL0vs7OV49GUDlhA/Tkj6EzMFY5cN8YGpU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8lNE5KPRIWySUzwIJ759xjZiFNPWjX4lDUpe1DLtR+wiolWlMhIGm1BINZHe?=
 =?us-ascii?Q?dyeFFjs4uOF95hOsErF1DM2AWKwzXll9nz/uo5IsVflnk7+na7oOx7WHDSsO?=
 =?us-ascii?Q?7nkqz6bT+PNh0Vn24WazrvuKuWqgnXHsVUaDNhIz1M5eI0w53x2Q2YezW1nA?=
 =?us-ascii?Q?Y9kl3DGLIm8sf4xk+9dJavsJqpLrkPHe1o6C9En7UkwbBTSL+AzP7ULgCXZq?=
 =?us-ascii?Q?/wdkDOUYJEhgKhPc0t+QsHne5gkYn6JSDOMtIMzOSYWt18Re0EjcCy1/TFrY?=
 =?us-ascii?Q?4qJSbnt8+kgnSU6vKm+YNDV0DwjFUMIJ5qYTbFQo/6umjQHSZtSBBDYFjCRp?=
 =?us-ascii?Q?5T9rj/nCSWZxlSb+mwWZ/jR2ZvsbI5fmrcxn9Ek2ZkfGFyaS7vbn3tyfM7Q7?=
 =?us-ascii?Q?2yORjm7PUbbRjvfW2NAAma/68gQpydmgxtVikDOkkbDIekviBMV1aYiXdBCH?=
 =?us-ascii?Q?mskRTGXohGP/gSW6aWYPX7l7WG2h/4Ldb+xlrSSF6nGxjcMZpyiG4r5weHLa?=
 =?us-ascii?Q?s6PnY0gLACtGoeApShgl2E3Ij2Ev6DUyQX8jYNWvKX/vbMQLXiA86cSUUC6l?=
 =?us-ascii?Q?sK276U6sWDbsqWgt4uatovK3eulsMFIdxnT2UyKmCI7lzB8kRZnc3iboPmSW?=
 =?us-ascii?Q?wsrbZrHstKruOmBSnSNaUbC2qgVwtlbdvjslqE1IHuUvC+WLsldyKdMfcq3p?=
 =?us-ascii?Q?FIWWLN66xNjSOo4voJH56Oiyt/QNTDqj/g9SNuXi2HojVvBE24w0hVVCL0/9?=
 =?us-ascii?Q?fvgmr6YOcJd4NvEA8q3sPLyIhN2ijGNg1SdbCwh6Wbfg09dQdE0mV7hlZNLI?=
 =?us-ascii?Q?tchhO/0ox94NtTj+2EGMK6jnDHW1e8yrVFR6xxsizvViVPRZVjhYHTG6kpYs?=
 =?us-ascii?Q?1Es+HfEtivoLaOcuKvsC0giPpI+0a5d8iHh2qIThXYKXebmeoR5PSRqbdsuE?=
 =?us-ascii?Q?NyR48YuseAeX3OVAsugHkP6FmJUPtotMLdlr+94YMq/A8o5nSB2P07Vdyues?=
 =?us-ascii?Q?RgJ1ADgbcpAwYftljn/jZ5g2xDi7Y/UunlNxVMRIaMQ1VChEG7YJbPMLdpb0?=
 =?us-ascii?Q?krp+2VlXSUySpQKdWJu8K36kgqRzd/x/eHvTqp5xz0Z02ypX0BVQbwtB6MtG?=
 =?us-ascii?Q?CSP+ZfLR6ipUHA9Q7h0T6ctijOdikSHZZuKnei+pGdUtlimfgIQN9p9TuWii?=
 =?us-ascii?Q?iazhTTX9I1AEoQvVqjuABatYrFVD7jtcTLt7ZsXkeOVu++n+2uOqd9XmGQIs?=
 =?us-ascii?Q?5DSyPa2JzVylsUgFAX/Bks/ltDKW4CqGaPpSDm5fn+HDdvYRylXa+fX02D8S?=
 =?us-ascii?Q?R10Ao0TOQDOW85hLqIP1s2s0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e12367-74a5-4e7c-c1ac-08d9052e5454
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:19.2544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92QLOwWDYQ72c6yNLzybmKNhEGK/qlWxw6mYbjagb0+VemMgPQNnK80AU/i6lPWMeW9eF8W6WrQqqsfx4JxFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dmabuf attachment should be updated by moving the SG BO to DOMAIN_CPU
and back to DOMAIN_GTT. This does not necessarily invoke the
populate/unpopulate callbacks. Do this in backend_bind/unbind instead.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 51 +++++++++----------
 2 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 18a1f9222a59..68e6ce8dcf33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -582,9 +582,6 @@ kfd_mem_dmaunmap_dmabuf(struct kfd_mem_attachment *attachment)
 
 	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
 	ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-	/* FIXME: This does not guarantee that amdgpu_ttm_tt_unpopulate is
-	 * called
-	 */
 }
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7e7d8330d64b..fc2a8d681dbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -910,7 +910,23 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 			DRM_ERROR("failed to pin userptr\n");
 			return r;
 		}
+	} else if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
+		if (!ttm->sg) {
+			struct dma_buf_attachment *attach;
+			struct sg_table *sgt;
+
+			attach = gtt->gobj->import_attach;
+			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+			if (IS_ERR(sgt))
+				return PTR_ERR(sgt);
+
+			ttm->sg = sgt;
+		}
+
+		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
+					       ttm->num_pages);
 	}
+
 	if (!ttm->num_pages) {
 		WARN(1, "nothing to bind %u pages for mreg %p back %p!\n",
 		     ttm->num_pages, bo_mem, ttm);
@@ -1037,8 +1053,15 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 	int r;
 
 	/* if the pages have userptr pinning then clear that first */
-	if (gtt->userptr)
+	if (gtt->userptr) {
 		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
+	} else if (ttm->sg && gtt->gobj->import_attach) {
+		struct dma_buf_attachment *attach;
+
+		attach = gtt->gobj->import_attach;
+		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		ttm->sg = NULL;
+	}
 
 	if (!gtt->bound)
 		return;
@@ -1125,23 +1148,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 		return 0;
 	}
 
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
-		if (!ttm->sg) {
-			struct dma_buf_attachment *attach;
-			struct sg_table *sgt;
-
-			attach = gtt->gobj->import_attach;
-			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
-			if (IS_ERR(sgt))
-				return PTR_ERR(sgt);
-
-			ttm->sg = sgt;
-		}
-
-		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
-					       ttm->num_pages);
+	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return 0;
-	}
 
 	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
 }
@@ -1165,15 +1173,6 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 		return;
 	}
 
-	if (ttm->sg && gtt->gobj->import_attach) {
-		struct dma_buf_attachment *attach;
-
-		attach = gtt->gobj->import_attach;
-		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
-		ttm->sg = NULL;
-		return;
-	}
-
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
