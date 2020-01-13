Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9F1394F8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5596E0FA;
	Mon, 13 Jan 2020 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053EE6E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLbka09Aauf7KWnSu5smnYSJNI53UMd2ClyTas/MmM5JWQ0988xWtIFe9dCKGLAVoXSAsqv9UCR18vx8eWmCoyGY+nqCQBYjo0obcjqYF/EFWfjvUX7XfzBPAir31n0hnYbyERPKRKpVjLCst1wQ66r20Yun6q6jd+9k3cvDjyQ/wRwsrPyiyt033bLDhuzTmiq0t8a3CANkMr5su8vif3Q+wiQQqIoM5meyYX017E+v4faOJlkAtvs6mZQGMnusO28HUSd4dRkpL7oIQ6389a5eT5xuRveq6ae9iHMATb3oKCSUovgrbgvnPr/sdi0XClH2ZoMfLZe7qTVmvEgpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BigxloxjfB4pXERXNViNNpR/XEjnHFG+mJFGOZ+Ww40=;
 b=hCI+kLk3Oih6w8xG0Z0bd9ob+e6sJ5lWl2pXXryRaJRm1QirQs3E2Wm8oDHpI8hi2QZsU1DW4neV6/V7BTrBiuDGy1/W8kfVmP3o/to01q+AW9kxM+arlVGI0yb92tAgYbxBoJR75sKZaHfRzFKz0KdnyWMGbPWD7pl57gUMMBVxSyqDDSSMFy6RFF4i5IfVUV5MA3u5gu8iIxfj7Ic0QqtFb2IMURiGHyh0LM0CfOQDo5IvEE/dpqqmAhfTo7S/10xPQ0vzIob8IaKUJ7URL795O857hhqA/J6ENOFVoCY19MXksF3zJv8N6qnpeJKr+7E15awgCX6tHRT8tCIFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BigxloxjfB4pXERXNViNNpR/XEjnHFG+mJFGOZ+Ww40=;
 b=0LatdNrSO41ERY0JCw2BuVz782QU+45HuhdrkjCgk+De5Qu+ZQ8a51JB9S8LxU2+ny2mDiB2eLNt/dz0vJv1gHA6hd5+dbODIMRkegRVsxSo386XaWgkpGGlsFaEr9Oih4VUWGtiYgOKatHleDOoISVrmwS8YH73xAKTcdbF4ag=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Qiang.Yu@amd.com; 
Received: from SN6PR12MB2702.namprd12.prod.outlook.com (52.135.101.144) by
 SN6PR12MB2847.namprd12.prod.outlook.com (52.135.106.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:37:49 +0000
Received: from SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70]) by SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:37:49 +0000
From: Qiang Yu <qiang.yu@amd.com>
To: linux-mm@kvack.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 3/3] drm/ttm: support memcg for ttm_tt
Date: Mon, 13 Jan 2020 23:35:43 +0800
Message-Id: <20200113153543.24957-4-qiang.yu@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113153543.24957-1-qiang.yu@amd.com>
References: <20200113153543.24957-1-qiang.yu@amd.com>
X-ClientProxiedBy: SG2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:3:2::34) To SN6PR12MB2702.namprd12.prod.outlook.com
 (2603:10b6:805:6c::16)
MIME-Version: 1.0
Received: from localhost.localdomain (221.239.222.115) by
 SG2PR0302CA0024.apcprd03.prod.outlook.com (2603:1096:3:2::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.10 via Frontend Transport; Mon, 13 Jan 2020 15:37:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [221.239.222.115]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27c02a5d-4678-40b7-196c-08d7983e8b39
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:|SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2847ECAED151D3CB1744A3918F350@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(26005)(6506007)(956004)(44832011)(2906002)(316002)(2616005)(16526019)(69590400006)(186003)(52116002)(54906003)(8936002)(8676002)(81166006)(5660300002)(81156014)(478600001)(4326008)(86362001)(1076003)(6486002)(66946007)(66556008)(66476007)(6512007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2847;
 H:SN6PR12MB2702.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBPL1YcnDPOn1t9B/bsIK/WBYEsUUxgowN6XZENysWj11TBLjiJk30D4tcdAEAS7gNku5SldqiB1l+4C7+6mU32UR8XlatlvnbTZe2R2nntKI+Nzoo/ydNSkRviZAMiA6oLpSgaGF3I+EI1Gk8gdj2ZFeXBKkv/ncukPEx3RSsMlFp2jnym25xz3Qy0QGJ1AHjMPSKJznbb6gyuMZ5Y7MDzTvg0N07oXsNUalqFAUwY+QHqvzHPPVs8+eCFRbuvCWcpwLh6YW61KlZ2j/l2OMaE3EzcY3A6lAJk5Ht5NDp+rm4PWilzzgMLg4HF00CwZ4yF5mD41UnRcJLzkFEl/gzdmVm6n+tSGOTkhCfistjFNdxkoSgLYvD/NOzZ+OKHBqrNwGsEOJNZBMcilhkE4PbIb80Ws842GggOlawRa8E8b5pVlSRGcuaJnvZcaOoAbgffY3Ik0rZrCfUIXXDmFLTIOWKZVHz6Eb/1Vc4lI1IXBaUABjdBYMFnhN8LNFoDu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c02a5d-4678-40b7-196c-08d7983e8b39
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:37:49.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSXu99Sa+Br1Ejach5zf3bZHMeNFVJsVYaHJ/KV2UlLp5jlhXTX2pNOkklcz9U9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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
Cc: David Airlie <airlied@linux.ie>, Kenny Ho <kenny.ho@amd.com>,
 Michal Hocko <mhocko@kernel.org>, Qiang Yu <qiang.yu@amd.com>,
 Huang Rui <ray.huang@amd.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Charge TTM allocated system memory to memory cgroup which will
limit the memory usage of a group of processes.

The memory is always charged to the control group of task which
create this buffer object and when it's created. For example,
when a buffer is created by process A and exported to process B,
then process B populate this buffer, the memory is still charged
to process A's memcg; if a buffer is created by process A when in
memcg B, then A is moved to memcg C and populate this buffer, it
will charge memcg B.

Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c         | 10 ++++++++++
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 +++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c         |  3 +++
 include/drm/ttm/ttm_bo_api.h         |  5 +++++
 include/drm/ttm/ttm_tt.h             |  4 ++++
 5 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8d91b0428af1..4e64846ee523 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -42,6 +42,7 @@
 #include <linux/module.h>
 #include <linux/atomic.h>
 #include <linux/dma-resv.h>
+#include <linux/memcontrol.h>
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
@@ -162,6 +163,10 @@ static void ttm_bo_release_list(struct kref *list_kref)
 	if (!ttm_bo_uses_embedded_gem_object(bo))
 		dma_resv_fini(&bo->base._resv);
 	mutex_destroy(&bo->wu_mutex);
+#ifdef CONFIG_MEMCG
+	if (bo->memcg)
+		css_put(&bo->memcg->css);
+#endif
 	bo->destroy(bo);
 	ttm_mem_global_free(&ttm_mem_glob, acc_size);
 }
@@ -1330,6 +1335,11 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 	}
 	atomic_inc(&ttm_bo_glob.bo_count);
 
+#ifdef CONFIG_MEMCG
+	if (bo->type == ttm_bo_type_device)
+		bo->memcg = mem_cgroup_driver_get_from_current();
+#endif
+
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index b40a4678c296..ecd1831a1d38 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -42,7 +42,7 @@
 #include <linux/seq_file.h> /* for seq_printf */
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
-
+#include <linux/memcontrol.h>
 #include <linux/atomic.h>
 
 #include <drm/ttm/ttm_bo_driver.h>
@@ -1045,6 +1045,11 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
 	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
 		      ttm->caching_state);
 	ttm->state = tt_unpopulated;
+
+#ifdef CONFIG_MEMCG
+	if (ttm->memcg)
+		mem_cgroup_uncharge_drvmem(ttm->memcg, ttm->num_pages);
+#endif
 }
 
 int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -1059,6 +1064,17 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
 		return -ENOMEM;
 
+#ifdef CONFIG_MEMCG
+	if (ttm->memcg) {
+		gfp_t gfp_flags = GFP_USER;
+		if (ttm->page_flags & TTM_PAGE_FLAG_NO_RETRY)
+			gfp_flags |= __GFP_RETRY_MAYFAIL;
+		ret = mem_cgroup_charge_drvmem(ttm->memcg, gfp_flags, ttm->num_pages);
+		if (ret)
+			return ret;
+	}
+#endif
+
 	ret = ttm_get_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
 			    ttm->caching_state);
 	if (unlikely(ret != 0)) {
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index e0e9b4f69db6..1acb153084e1 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -233,6 +233,9 @@ void ttm_tt_init_fields(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
 	ttm->state = tt_unpopulated;
 	ttm->swap_storage = NULL;
 	ttm->sg = bo->sg;
+#ifdef CONFIG_MEMCG
+	ttm->memcg = bo->memcg;
+#endif
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 65e399d280f7..95a08e81a73e 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -54,6 +54,8 @@ struct ttm_place;
 
 struct ttm_lru_bulk_move;
 
+struct mem_cgroup;
+
 /**
  * struct ttm_bus_placement
  *
@@ -180,6 +182,9 @@ struct ttm_buffer_object {
 	void (*destroy) (struct ttm_buffer_object *);
 	unsigned long num_pages;
 	size_t acc_size;
+#ifdef CONFIG_MEMCG
+	struct mem_cgroup *memcg;
+#endif
 
 	/**
 	* Members not needing protection.
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index c0e928abf592..10fb5a557b95 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -33,6 +33,7 @@ struct ttm_tt;
 struct ttm_mem_reg;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
+struct mem_cgroup;
 
 #define TTM_PAGE_FLAG_WRITE           (1 << 3)
 #define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
@@ -116,6 +117,9 @@ struct ttm_tt {
 		tt_unbound,
 		tt_unpopulated,
 	} state;
+#ifdef CONFIG_MEMCG
+	struct mem_cgroup *memcg;
+#endif
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
