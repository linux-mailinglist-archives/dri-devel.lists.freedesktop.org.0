Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEF35FF73
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AD86E9DD;
	Thu, 15 Apr 2021 01:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0384D6E9B1;
 Thu, 15 Apr 2021 01:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3YfieAW3L51E/LNWmZXHim2PYXpQJQXgLN9+vvUqZPv6naraY6hxzjyfdQyzdlYx0a1s5yydLaE9MTyrsDBJlWgfl1YaBL2V9MN+vT5jkc/0NjuQMFdAQ758r5pOjK29FIugGpJK7ZVrgwpRrUIBWU+u/QO4kScPMexFfa2hNyPhOIMyYrSr2gXWxvxM2dbfJTXXaPIu7BlyhWlp+qgWRwljS9Rd6p38B1Ra8a3NOtMeJakeBDUnSxFA1BXFlqRcmO1BEtWG+t47WPeFyw6j1kVIdAut0nsvyQ4Yv9LZ51mjo+TqfYHKjPCVyLB3i0Y25y1N9b18zKLBMsS2fKQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFCytpqcKsR4iif1mJ3g7Hg0x5P8yfOnFrw7gnKnPU8=;
 b=FxkY2GBfh+rZep7ewoe5uNF8VA183RKY1mIWx2eoWma/DkDgPuAcpdwfQVM0ykpm+/1wf/3Ahr7nV6yu/TtIitGcw6Il8Lg4xTLklKBDfE9/U1uvtQ0kiObJ5H9pRk2WXREEldBpc1/pR+E/cUh/Qt5LbWoi73z/iJo2mVipUe+DTca/afty6hT98GgfsRkvvIXXOgfgmjiU6jkybto703M3nGD0sCYB6f/nVAS/JabkYLJKx4hpXb532pS2RNLc/4t3RjfB+yRFweCjT30qMD9NMQZXLNgeB9z83FyK715iEkYIE+FrOE7BfodxS8ltom7Q96rPp2p+S3PtJ8rBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFCytpqcKsR4iif1mJ3g7Hg0x5P8yfOnFrw7gnKnPU8=;
 b=DXB2rG4EDRBUuEMO+fRUZVqUgT0v71sXy1lEOYjg/otP5nz1m/c1Nf0QwPkzfTqpzHGnolbYpekuKjNKkKY+elb+iL+/FyL+NMw3MDzXBqgSyD87Mb6d3qCL9jVjUdtASscgCEx6hNjmc51a+kLYtmMmJKo+Q3ITKH8Y18wNIFo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:08 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/34] drm/amdgpu: svm bo enable_signal call condition
Date: Wed, 14 Apr 2021 21:23:31 -0400
Message-Id: <20210415012337.1755-29-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcfda18e-6df5-44d9-d250-08d8ffad2a84
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208CFA85B7AACD3455EB23F924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3AYqybToGVSU7/pmWp8nFYVMQUFhX699LEVscQrmPhQDGB6Vv8RcA4x9lXuFUM7j/Vgwh+3v2kXAVgyAmkwoUTIh6XQwGY50xcmto95sKq0fNO9ABBb08eYubmIIVVi/LzcK66jhdfsgQs5fzT6/Q/q7nHB0VvVKVv1UTGafiNP/PDiwvskj64GN6z8ux0LB0Jt0Ssm+DcBnNL5vTo3m5DTIQMHBrwQf7YxNYbNoVxz3yKJ4s6H3TKshRXcfi6SE6YyC5Su6WMa9P0BfDo7Ru7OtOwhsJnJiy+/aeVlx2ovz1UnpYaRtQDV9TrLsad+pUF4HNsqkuYwsucbS52vDBWJdaYCpAcb7nPS8ep8Tevxvz+IdKXHdujY6UaU3mulS6dYX41IJJjn/m9sC3/9UCZ3hy495vxtZUeYOYQPvwdaptYy2fzh+hUcUnoJzWGlxTngvFT/WqJymH2jKf8/LY5Yb3MLaOABcWOloOtiud9vhE3GBOJzC6tu4GDjtxGs9rCApstBCVNFqjkOuC98+o3KacSGhgqEM9A6UxXWTC4eGhSAQgOXlFOAQ1kX9EwcLKI5HDWCoFCqOV+i2NGjxAz/drcxPRGraiFgf9rYSNYMymQaCLbM4St4rkMnjnilteM5EhtS4WLlOVL4zEZmxn80j/nzDZOKvuCYFybbCp5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dos0jYQpdxWi/kq06vqwBOM2kJcH0bxcI7aAy7QqNvG0wZsdH/Mo1d0p60YH?=
 =?us-ascii?Q?ABT3sd3gQJhB3r6VbPmr1JwXIg+l3K0MDKN+4dppZPd9pIlFSui5/tEiT33T?=
 =?us-ascii?Q?ulMb4eWtZS+OW/oexjJhQgF0Gl9ziEscOynZXba5hXNWlSF+sIT+4FW7Tz4Z?=
 =?us-ascii?Q?wGAW+/gbx4lN4hLhWau3EZTtEH/c0guPKnPB6p3h7ickrb818QItCK6tPxdY?=
 =?us-ascii?Q?RwsnQUFLo8BG6jFdnchp3iXnECu7fsGa9oCtFoNO8AL/W/X/fX0rXErR+CK0?=
 =?us-ascii?Q?x7gO1OOpLHiJ4FneCDpfwjmx8Xrj5li4vrkfGVK6AGDGfxsmfg7VXZmy4xu3?=
 =?us-ascii?Q?7WcexTuQgsdrd4X7lvpBYli9znEWuKYfIlFGWkc81GVJBLGgbUXbpCzpd7VJ?=
 =?us-ascii?Q?cT2ubgesS7ZX7KowhVVe53sntzgQV+QbPNy7UTA97COmBF0a9HEHfSBhyCTp?=
 =?us-ascii?Q?ps2RgjEbmXltBVFjLsMOS7IZiz2yjzDcuBSHUlA0foi2G49NRWJAOqoDZm6X?=
 =?us-ascii?Q?E6BkIq2OkBoqRIlbKO7+9ljWtsQMYm4zIss/xFBYunDW5HAG/JIqQzUqMWf7?=
 =?us-ascii?Q?75QKUaz3/z0m8pEgWGzIxSpQ1GADblZcuhqPQQzQCWEv3o1g3H0n1KNJVe8H?=
 =?us-ascii?Q?jwOrVSLPZ1KVRB2uLhTrAEd5RA1LnCkKbrGypqLAvE59YhabEvNtbP9gWdxe?=
 =?us-ascii?Q?T/qnq/DzGeIntlo+DaFkaff86I7YXyKAdJfuwVdGu7qgnffCdqMd0VmCi+Y1?=
 =?us-ascii?Q?YfLZEXchBCsemA2VfAhLBNImJaavWfVNi63pyLt3l6sOQNsPjcksyX5LETGm?=
 =?us-ascii?Q?yuaKnjwCpmTOLh44bn/J7OCBS68p0VQYgIQxuOS8hDN1/Dl4dzDJllal49uH?=
 =?us-ascii?Q?lPX9QKN9iOcaZ+jFBUdkOYcoXf3uAsgjQ9YsZWU8OgVmAzuA4lLRfPOY+2AC?=
 =?us-ascii?Q?UvDcXYhPb1wQxTKqaJMbwgcL8pK2pv8lEIejDSadV5gopms18btxFa7Y0tbZ?=
 =?us-ascii?Q?RHol6OvWGmt7gogk4aaKW4uf72KSCvT3jPWwGVWcucrewEqCwjvV+tmGP0mk?=
 =?us-ascii?Q?8VHiZr+I0SYDBjuUpbyjyRMMf4EApQVBGXuur0Y20NcMCx9snd3L7GLYlshk?=
 =?us-ascii?Q?+N6QO8I4SOTHRpjASpHNrpXA7l4KdImB/eE8pW9yAi6L0GgoQbnZBnUWXVQz?=
 =?us-ascii?Q?BZQnBtjhJSnTHB9fIEItpOqu6+r8BcrH7fViZEJrGCccRb8KmWIw/1+DyTo5?=
 =?us-ascii?Q?iuWVErQKdm4HAQ/Wujg6dhk8H+3VXFtUcTidC50Mrm9i9ehdcJXI9/zxdFT5?=
 =?us-ascii?Q?1LkQmwZ2wLQFM6ee7Q8ptoDn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfda18e-6df5-44d9-d250-08d8ffad2a84
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:08.2241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEAsyQYPb7NF8zfhs569qq6QHCiDfehqbhnRu50zJVCzcYQGJTDn7O1Nn2BeOwUc5+YN4xJuyPTL7BBmsXeGQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

[why]
To support svm bo eviction mechanism.

[how]
If the BO crated has AMDGPU_AMDKFD_CREATE_SVM_BO flag set,
enable_signal callback will be called inside amdgpu_evict_flags.
This also causes gutting of the BO by removing all placements,
so that TTM won't actually do an eviction. Instead it will discard
the memory held by the BO. This is needed for HMM migration to user
mode system memory pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a66a51301643..f5ca9b8d54a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -111,6 +111,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	}
 
 	abo = ttm_to_amdgpu_bo(bo);
+	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
+		struct dma_fence *fence;
+		struct dma_resv *resv = &bo->base._resv;
+
+		rcu_read_lock();
+		fence = rcu_dereference(resv->fence_excl);
+		if (fence && !fence->ops->signaled)
+			dma_fence_enable_sw_signaling(fence);
+
+		placement->num_placement = 0;
+		placement->num_busy_placement = 0;
+		rcu_read_unlock();
+		return;
+	}
 	switch (bo->mem.mem_type) {
 	case AMDGPU_PL_GDS:
 	case AMDGPU_PL_GWS:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
