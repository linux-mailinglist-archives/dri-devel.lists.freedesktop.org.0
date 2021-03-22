Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED8343F39
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33BE6E2EF;
	Mon, 22 Mar 2021 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E116E2EF;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfBHFqcQ/M8n4y0xlL6RfbmD8mhEXAkiAxcNoIBUPVNgmfIiuTqiQ/8pNVokaFCVqBbME/2RDXMH4hORjwWOctDH7npaUy5hYwCfrLPidEB6OGJAYvJKRhHQBA0e5++PmzFs4mLK2IWhokJilaXgPsg6rAcb3DQHP9ishbFmEnsPclX7ZYI2uccphalxLbTd3N0bx9ITlouD0VRQ8fd6NIaOqfnXV3PAwCdCQecFz51ir6qXYifp0rt0foC7cAN9Lfo1ISRUXQvA4LnKN1NVjj1hz15Jy2HJ+jUcMF14UUFopSAC7aYXPlYzvrPqfA19otW7PNDeV7QyKuQC/ch7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h0RV2QwtgDvA+ZVdz/fvOzdSK0Ty+NCHkPWdLlzqYE=;
 b=hM8IYSKldsYaoxPv27tNI75hDbDKFsmBQdDHgwHnV8LErdJA65w22vcLqy+yvGan9LWpF//xCm7YMboAUOi+9yveQKwTaDX80A1LaQCKVZRbU1UNrjyxXXWNoBlYP7AhFtR+CFSmdDCo79EjjC/3S9QPgLC671BLsx7mS0EVjU1IvIccaHfcbBkmzf2jGs7PmXVbpL9oIUMrLtKN+vcTJGSZv0UP6n05QJ5SrtGP/hmss6UD7LArIw9VLaKycWyyo1e7+rkMsfxA2IzWAokKHwbBnL0TYspk2r1XTI4UKcij4/8D9i/ysjSBuZ8LCdR2I9MKI02b3Tvt5rRDloiU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h0RV2QwtgDvA+ZVdz/fvOzdSK0Ty+NCHkPWdLlzqYE=;
 b=Ou+jeLHb8Oql7vM9FCeZ0TQOQACLMzYaaVIS8KB6hixYq7sXGNGDQo+xityf53SXQ9GEeA2QKqFEbhdPwRqw9n0gZ7G70g5NYxhZz2voQPfFR60sMkbicjl3hd6Ces3ayRn/LHfeVqBtAKWhk3xh9F8B6q4r3YXIvxRy75j4jHY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:22 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:21 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 41/44] drm/amdkfd: Remove broken deferred mapping
Date: Mon, 22 Mar 2021 06:58:57 -0400
Message-Id: <20210322105900.14068-42-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fcba44f-2e9b-4e8b-a244-08d8ed22bbdd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255646BEA142CE619408CF492659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOzFvRpWPZJwvxS/iuE80Aq+L0zZm1VnTvuvXbEjw6gHh8FJlPNI+XrdUjiPvjVbfRAe79uWAXubdmNHy71YDyPntmLpGIJMmSGOtIw7KlaK3C5LQ35/YEB4dcWx5LAM9lYweu0XVoi3NyUZZAHzu86XI8i7HwX7Zo4qR3P3u7P+qxUdLkCJL9TtIyOLa1bXrjuHmQ3/7/J84hUHYYuPSNWtjlzpvgjP1s9CG+Hfyo3S4C7W78SmoXy6iuqRwD9BBeKz2vj3SJd6jKUf6EIzbQu/8pAvQjSbXrFFEmSeNXAFtdWDrS1BbkE4H+VN95jIigW/g0wbbmdIM55g4Hu/XsviN6kIwxbdas9b1OzlKXaCZGqBgaNJlsMwr5wQk1VeFjvm70Z0pqEChglHSX3Ei/dtaL68ugnX72uIIX6Ulfwrvwnuyr80qd5NhjR0LP9VUMpUm3ftzYcZed5dRIj+iwIBt/RQTssGkKfaAF35Blb8LOenn43y/z0QlqHmDvQFiUPGRXK3lL559XFIuZBGE4LyCgE0C5eBpCy1fxD0BfwHlX3ZTkKoQJtaJlsGrHESYE8qrkWsFp9JBgvECJJ7G8jADbKDLE+VdrhzE25agYRE0Lu34/bWp0KwRFj2Q2OtqJ13/KbW2dPFcuUQLYDlFaXYSobnvtmMGKeNzjP3gGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7lszXtnwJRWesomBNlJEIanHaDMp0wY72kmMju+0eHDPjcSadun97f74pUrB?=
 =?us-ascii?Q?Yxfqub2CrmN9YfhbIiv1CV0DPoJTuKp+BzE9S4ZVqn5Ge2FiYun9BPAuZi1r?=
 =?us-ascii?Q?C6CJ8el+pTpHGs5j0J17jpqMBvVkocLuYsd5lHIRdzXLguz6z7A+h11B3G+/?=
 =?us-ascii?Q?MNQ8rXAYRCaZ+m1h3scEg2PYX2OEXCK/AJp5Ovl+WBirouM5clkuD1JabN3W?=
 =?us-ascii?Q?D1CBbpSoGQTAhIWyy9kntuJ9g0aPFZk74SXx6DZMOTgHCFPzoW1UmRzlbIaP?=
 =?us-ascii?Q?podK7fszamwRykb6cC9VXPeATb9qc/PDCUD2CBEywGFAmiYDqRwgROXSRGA2?=
 =?us-ascii?Q?1PgOoHWel8gnxmtaRwws62nznDd75I6fi0qCMtXhJmt1T766MCj+/v1GLcyW?=
 =?us-ascii?Q?ep/MhfC/ZNAzgSsBPmrL8na9KSNatKFJ+W9krylFnfR28UJlMa75nY6AeinD?=
 =?us-ascii?Q?yBBjE8L7WRcJ+8wqHx3BTCo6F/+YvmZm0uYmdxkGcXpymUklvFAEtAH9EpWi?=
 =?us-ascii?Q?8GSXCSHYP2AgwJcM/hIgrLu+JP7Eov+aQ7y+zL9EVC+rajJTUlOiL0L1NFVA?=
 =?us-ascii?Q?ojqIvotwnafapxtLwLAxdKfpuClZJPQZdxx2W20N+VCLoEmICBs8ZXUaY62/?=
 =?us-ascii?Q?ERtan3cuEYPkOf+1Vta8duD/IjAOJigIYyMb5AIuaF5TumTQX1hNQIqYDhzi?=
 =?us-ascii?Q?oe+whqhg+7xJBE7HU6jHrX+K/e5WajZDkHBZiJEOPdEAaHjHj7trM3hKrbxJ?=
 =?us-ascii?Q?3lhCcutDQFio+TQk+oWIefRJlTSRI+h6/CsZLjcDfGc+EWKatYP9R3h91ich?=
 =?us-ascii?Q?C5AWvwPjnzDIZM6gqIQyKB8E+VpMdY96EMEUDwvc76O+LwDLQ28hfLxlbiIK?=
 =?us-ascii?Q?vWEePCcnqHhg7kWxUqImftKt6iwDCj+N416UaNzxriQuGi8OcTiU9H4GO2yZ?=
 =?us-ascii?Q?JGZ2RhOmSg0EcYdM1Wy9WLJmw3yyI7mSPXzQ7av+WUqHAl7w5KoTLAlpjPR2?=
 =?us-ascii?Q?7YeRi/1aRhJOK1KWWsp6/0z/nsEXxc/KJAr1iJctWlLqij2iNwWkuiv+Vae5?=
 =?us-ascii?Q?PIbi2vIBJKoDXZXaxpcz1fHkfFOIXkg0BTDm3qgddpz1N07OIOGCZFbZeHbf?=
 =?us-ascii?Q?jAI/z/Au4/suzbPgffnAKCit+rVfs+bw+0XMXvZjAap1bNK6Ukxm00cmwD1H?=
 =?us-ascii?Q?9ZZm9UpLYShil/AI4HJE63xQpd6d1rYpDM+6H3j0efEMzS+0ft1yIblCFU4g?=
 =?us-ascii?Q?ezF6NxSW6shIhJzFpAsh1p5zyypp3dPy2ydDSdOiEVRYMri3POKo4Ii0zGrP?=
 =?us-ascii?Q?uQhTE1oNZY7pV7ojOthVLWf/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcba44f-2e9b-4e8b-a244-08d8ed22bbdd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:51.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og55hli4izhHQLY5zHZsETb4hPbwusJS5ys3cROf3xoVMeMhP6n6u+7/G/uUHUWcSsPtmp93XSAIXp1rNfUT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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

Mapping without validation is broken. Also removed saving the pages from
the last migration. They may be invalidated without an MMU notifier to
catch it, so let the next proper validation take care of it.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 14 --------------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 13 ++-----------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 101d1f71db84..6748c5db64f5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -539,18 +539,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	src = (uint64_t *)(scratch + npages);
 	dst = scratch;
 
-	/* FIXME: Is it legal to hold on to this page array? We don't have
-	 * proper references to the pages and we may not have an MMU notifier
-	 * set up for the range at this point that could invalidate it (if
-	 * it's a child range).
-	 */
-	prange->pages_addr = kvmalloc_array(npages, sizeof(*prange->pages_addr),
-					    GFP_KERNEL | __GFP_ZERO);
-	if (!prange->pages_addr) {
-		r = -ENOMEM;
-		goto out_oom;
-	}
-
 	for (i = 0, j = 0; i < npages; i++, j++, addr += PAGE_SIZE) {
 		struct page *spage;
 
@@ -590,8 +578,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug("dma mapping dst to 0x%llx, page_to_pfn 0x%lx\n",
 			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		prange->pages_addr[i] = page_to_pfn(dpage);
-
 		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
 		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 081d6bb75b09..aedb2c84131e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1695,7 +1695,6 @@ static void
 svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 {
 	struct mm_struct *mm = prange->work_item.mm;
-	int r;
 
 	switch (prange->work_item.op) {
 	case SVM_OP_NULL:
@@ -1718,11 +1717,7 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 		pr_debug("update and map 0x%p prange 0x%p [0x%lx 0x%lx]\n",
 			 svms, prange, prange->start, prange->last);
 		svm_range_update_notifier_and_interval_tree(mm, prange);
-		/* FIXME: need to validate somewhere */
-		r = svm_range_map_to_gpus(prange, true);
-		if (r)
-			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
-				 r, svms, prange->start, prange->last);
+		/* TODO: implement deferred validation and mapping */
 		break;
 	case SVM_OP_ADD_RANGE:
 		pr_debug("add 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms, prange,
@@ -1735,11 +1730,7 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 			 prange, prange->start, prange->last);
 		svm_range_add_to_svms(prange);
 		svm_range_add_notifier_locked(mm, prange);
-		/* FIXME: need to validate somewhere */
-		r = svm_range_map_to_gpus(prange, true);
-		if (r)
-			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
-				 r, svms, prange->start, prange->last);
+		/* TODO: implement deferred validation and mapping */
 		break;
 	default:
 		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
