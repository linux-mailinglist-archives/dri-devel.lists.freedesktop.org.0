Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA51343F03
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77AD6E0D7;
	Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8367489EFF;
 Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD8QWedBws2kTTtCxF4MfUkjTL17GBN5JYK0N3wMVJ6W2sIyGHD9XUyG9SzdS5EYJbZ/P3Ln9YX+iChCKKrz9uy4KnohpMWJrC9pKPfxKcSKH9vds7ObBpDCinUmQpRjxP56AyyVsNoRkGZwaK70V6dV6y7VXwS+Koe3Bz+YgDuZc24GmHzLnfphJrKmYDFm7KD8EQ+wvVWVGFQPSIOlzH5+RmNbAZvJZRv0edQSWzNDmGYPx9EgmmK/HATESyqGp67J4hlC7MFBqA5vKiV4IVsUZe67kR9mR53+a1kKSj7TjBw64B8zJz0w0kWbkafe5rMT9+fpJb7abDX2NW7HKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpziIVBQK7V3OK+KDPr6ZesEz4SbZR+TZ/Tt50Y9Yeg=;
 b=ZZqEsV2frWmM4J4u6nRfo9OIot5OErk269aDdgLHfMH0iFhF8bAgr1U8/Gmaf8HDba95rI2isGnKRbVTD9+uAJRVrIPOjAQbVzX2slgj5Y5QfB4HmM7OdjQ245QtRzzcDbnQoafx64VkW7nk9fK5dvmZphnCsgmKMYGI++SzDi0aeccV9/NOkgfLjOe5ZBqlO+EyI2CtrSbnzTQxAlhfSrj5/kPVSsueZCf2MOmQWa/S6xhBVXg8XQgqc7/emzQeHa/W66GYVnVvhwiN1WxIc8UZuwxRa1TotdmS9rpMfybPF7ML05m6EjQfuHb9NL2vaNzgnioU8QHFxhFBUGpQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpziIVBQK7V3OK+KDPr6ZesEz4SbZR+TZ/Tt50Y9Yeg=;
 b=DekepuOEBYlmBvHhy3XVhB+uB7U0q9XfBbMFjMmUoZUP974ALxv3l7gPhpBUU46j8setqpTTKLiEVaYkxsdPzqkgq3hQKi4NNlc9NjU3K2Bqgw43hmvp8RV6OcfluFDa/C+7tDfiTHN49+80QyYhjWqYrMUJb/eVTlfpCmQdzSU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/44] drm/amdkfd: validate vram svm range from TTM
Date: Mon, 22 Mar 2021 06:58:31 -0400
Message-Id: <20210322105900.14068-16-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf9d62c0-3bc7-4ba6-e1e5-08d8ed22b3e4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367880C888425A77AE255E1392659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHUGAhtZQjM94FSCVQjBVmxTwqYb/s+QzpZttwbtxIHNRCRH+e+aMT9xppHeRSEN1oLGg/FyLt8NoGqU9rpsZx1lihF3fj3uzKeyTmGvcZcmiBfZnanPDjnG+poJDNBV9G3sPZ6mN49/SoAtdgc7+EdHFJ9tDKFXVKbrKJPUtg93qTzcHP5WHI5GZtZLC9xcAnbnknIfLjBJzHUslg6D9dRF6hlHFl46nWS0TrmwYoZnAZd+P+CaqASC9tWfNlIAMsRraBYuXdtQfuxPtvrArOgWGOS9Kx08WFgEJlTr2M3lGtJecYTQflD+XC5lnQj0U60NmywmF+c73nRP9MRzDxeQecxISh4atVzEw9Ki37cXLrSRsFgxFJo3UvqH3pubq8LOoF12skX1gvR1/RHmDNr23DjKSx7sfEBUq2CcnB6O4qj96dRydQlhKE+05WYKFHtuKkMjdg9D0yNJqd/75mmPcaf+mf+L2kKwXFUmU5SFu0CwZ0ZxBfvShO/h91vw6kpULRXojLVd6sJEOejt8g1WdnfTqso0Fib/ZsP3kyrmQeURtvVgGNU9Xp3F8kaRukDp+oDcmwLVqcGIV49OH074ZSdFSf9QI+Jq2hwhYx7XMNXzDQ8XLK/1UKe2lQJNAyzYhWVE3t6TDIWt88mR/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(15650500001)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7ztzZw1HlfKMbZ0hw+THDukf0B3L1Sim6Dc2Lh8Tr3mgDyyXyH+juU2cDcku?=
 =?us-ascii?Q?veJM/gR1gFi18eyhS0hyYmMK5ZAlXt9CHu1egnQVR54NchdcKxW8gWwJaYB5?=
 =?us-ascii?Q?cK98nMVNjnIz7hMdcSZ2zahf6GXsxD2qyN72ZnxQptYeNn+amSO5nPO/kyOk?=
 =?us-ascii?Q?X/TEwTeZDNE+x6wpRg5MzSxnyMuMBd3X7gePKk5ualTVJ8BM8+S7DN0dERwn?=
 =?us-ascii?Q?v+o2KCUGe7VDNvnarSbUZNwBG2agKO6TYu/XVflltta+lmdxcYwt+q+7R4sT?=
 =?us-ascii?Q?r0ukLEuC78uMXZ/Zj1H2fOGOEp5V4G44irTxhSgX0kt6QUZMQGN1sBkchUXD?=
 =?us-ascii?Q?YXXsaPEySFIucKRQsCAIo2GgYNcIaf+9LMHNU+/zhoxOJbVnToKHf1alrcYu?=
 =?us-ascii?Q?FJXOF1/Q5OHYmEoco9qfS9uyxJyDgQrWUqLLR8VPjitV+5ZCuRF1cqlZCC0t?=
 =?us-ascii?Q?r77ghUTDBsQ2ozjKg9kQvKfRIMxHgKmrvhTKfNzrpmQQUq+p61AwVp73Gt7Z?=
 =?us-ascii?Q?0a0mlj4nFfeQAjKCaf36Yho52+6uo3iiDJcL+ReDnFgaNGnej2TCypwtek1f?=
 =?us-ascii?Q?eSwK+cYX3S4MkboqbJlreq7hCDagEhXce9Ylt4TVdsmn9+8q47wxs97hiqxF?=
 =?us-ascii?Q?vLi1YPcLsVD1n/ePFGJfexL8V+HiPwkndg+2UmYYbEYV/FpAOJnHidHJ2cjR?=
 =?us-ascii?Q?Ct7hbThd4ariW9+I/YEK1oh/vYkWG3Sr893kXCuxgXLxavRj0CvsF8MBrIzS?=
 =?us-ascii?Q?csIoxMyYylMtT4IWJLkzAkNtxvja7XBFSce1JThLW1Qy5Xg1/29dsuIUov39?=
 =?us-ascii?Q?KhxF/OgtkFw88LmnchSHx7sI31h/sEGwqIcYNKqnvMaXYKWlXVOQ3pZg1ptu?=
 =?us-ascii?Q?DWL7HdQoNKy9Wpx83TNsrk0hCfWYp+NnlFYQQqP4EkYfnMxkTS9oJkpgdXRL?=
 =?us-ascii?Q?zIzuQESEvmRNamdW7NJvA7LfExps9TuGpEapDvgkfs6klirL7vEMNzoFeKVN?=
 =?us-ascii?Q?XGURnSCZgBDhdj8sF/riW0l/gDuLTl5QJRmo7RPu459vGbbjwI3ez2qakIj1?=
 =?us-ascii?Q?hqv6xJ743hRnUytwb7UH9fFXSp+mofCjWkbuClIodvHHdduULmZqDNfkFk0N?=
 =?us-ascii?Q?4/nqA5aEOKw+NmKxW/Ej2Ef1J9e0w3BK+1rQ1yzkNmWERe1A+81CKiTW4Z8A?=
 =?us-ascii?Q?QM6kP0BoLD03aIMchyUYKlZY2QlJa7rJ0ZMJn9h9Gm7b0gITzVmnzKWuv4Hw?=
 =?us-ascii?Q?Am8oud0nzHf8lquW+5qx9lftUj2EwFmJyxJulKUwa/Kut1afmbiacLX3ArDc?=
 =?us-ascii?Q?BxMNFsiXprSNVNxdEC45fOjB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9d62c0-3bc7-4ba6-e1e5-08d8ed22b3e4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:37.7888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70zwLFVhKm3u+s1QMA1Ei/5abK1uNZzDJwIvm0V0BjtpjCUwzAIMylzgIqKDhFqnoqK7Pfha847yJ0vfnPEe9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If svm range perfetch location is not zero, use TTM to alloc
amdgpu_bo vram nodes to validate svm range, then map vram nodes to GPUs.

Use offset to sub allocate from the same amdgpu_bo to handle overlap
vram range while adding new range or unmapping range.

svm_bo has ref count to trace the shared ranges. If all ranges of shared
amdgpu_bo are migrated to ram, ref count becomes 0, then amdgpu_bo is
released, all ranges svm_bo is set to NULL.

To migrate range from ram back to vram, allocate the same amdgpu_bo
with previous offset if the range has svm_bo.

If prange migrate to VRAM, no CPU mapping exist, then process exit will
not have unmap callback for this prange to free prange and svm bo. Free
outstanding pranges from svms list before process is freed in
svm_range_list_fini.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 338 +++++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  36 +++
 2 files changed, 355 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 55828d6fbea9..9b1c5aa86f4a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -44,7 +44,8 @@ static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
  *
- * Remove the svm range from svms interval tree and link list
+ * Remove the svm_range from the svms and svm_bo lists and the svms
+ * interval tree.
  *
  * Context: The caller must hold svms->lock
  */
@@ -53,6 +54,12 @@ static void svm_range_unlink(struct svm_range *prange)
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
 		 prange, prange->start, prange->last);
 
+	if (prange->svm_bo) {
+		spin_lock(&prange->svm_bo->list_lock);
+		list_del(&prange->svm_bo_list);
+		spin_unlock(&prange->svm_bo->list_lock);
+	}
+
 	list_del(&prange->list);
 	if (prange->it_node.start != 0 && prange->it_node.last != 0)
 		interval_tree_remove(&prange->it_node, &prange->svms->objects);
@@ -193,6 +200,7 @@ static void svm_range_free(struct svm_range *prange)
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	kvfree(prange->pages_addr);
 	kfree(prange);
@@ -227,9 +235,11 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->svm_bo_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -277,14 +287,244 @@ svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
 	return 0;
 }
 
+static bool svm_bo_ref_unless_zero(struct svm_range_bo *svm_bo)
+{
+	if (!svm_bo || !kref_get_unless_zero(&svm_bo->kref))
+		return false;
+
+	return true;
+}
+
+static struct svm_range_bo *svm_range_bo_ref(struct svm_range_bo *svm_bo)
+{
+	if (svm_bo)
+		kref_get(&svm_bo->kref);
+
+	return svm_bo;
+}
+
+static void svm_range_bo_release(struct kref *kref)
+{
+	struct svm_range_bo *svm_bo;
+
+	svm_bo = container_of(kref, struct svm_range_bo, kref);
+	spin_lock(&svm_bo->list_lock);
+	while (!list_empty(&svm_bo->range_list)) {
+		struct svm_range *prange =
+				list_first_entry(&svm_bo->range_list,
+						struct svm_range, svm_bo_list);
+		/* list_del_init tells a concurrent svm_range_vram_node_new when
+		 * it's safe to reuse the svm_bo pointer and svm_bo_list head.
+		 */
+		list_del_init(&prange->svm_bo_list);
+		spin_unlock(&svm_bo->list_lock);
+
+		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->start, prange->last);
+		mutex_lock(&prange->lock);
+		prange->svm_bo = NULL;
+		mutex_unlock(&prange->lock);
+
+		spin_lock(&svm_bo->list_lock);
+	}
+	spin_unlock(&svm_bo->list_lock);
+
+	amdgpu_bo_unref(&svm_bo->bo);
+	kfree(svm_bo);
+}
+
+static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
+{
+	if (!svm_bo)
+		return;
+
+	kref_put(&svm_bo->kref, svm_range_bo_release);
+}
+
+static struct svm_range_bo *svm_range_bo_new(void)
+{
+	struct svm_range_bo *svm_bo;
+
+	svm_bo = kzalloc(sizeof(*svm_bo), GFP_KERNEL);
+	if (!svm_bo)
+		return NULL;
+
+	kref_init(&svm_bo->kref);
+	INIT_LIST_HEAD(&svm_bo->range_list);
+	spin_lock_init(&svm_bo->list_lock);
+
+	return svm_bo;
+}
+
+int
+svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
+			bool clear)
+{
+	struct amdkfd_process_info *process_info;
+	struct amdgpu_bo_param bp;
+	struct svm_range_bo *svm_bo;
+	struct amdgpu_bo_user *ubo;
+	struct amdgpu_bo *bo;
+	struct kfd_process *p;
+	int r;
+
+	pr_debug("[0x%lx 0x%lx]\n", prange->start, prange->last);
+	mutex_lock(&prange->lock);
+	if (prange->svm_bo) {
+		if (prange->ttm_res) {
+			/* We still have a reference, all is well */
+			mutex_unlock(&prange->lock);
+			return 0;
+		}
+		if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+			/* The BO was still around and we got
+			 * a new reference to it
+			 */
+			mutex_unlock(&prange->lock);
+			pr_debug("reuse old bo [0x%lx 0x%lx]\n",
+				prange->start, prange->last);
+
+			prange->ttm_res = &prange->svm_bo->bo->tbo.mem;
+			return 0;
+		}
+
+		mutex_unlock(&prange->lock);
+
+		/* We need a new svm_bo. Spin-loop to wait for concurrent
+		 * svm_range_bo_release to finish removing this range from
+		 * its range list. After this, it is safe to reuse the
+		 * svm_bo pointer and svm_bo_list head.
+		 */
+		while (!list_empty_careful(&prange->svm_bo_list))
+			;
+
+	} else {
+		mutex_unlock(&prange->lock);
+	}
+
+	svm_bo = svm_range_bo_new();
+	if (!svm_bo) {
+		pr_debug("failed to alloc svm bo\n");
+		return -ENOMEM;
+	}
+
+	memset(&bp, 0, sizeof(bp));
+	bp.size = prange->npages * PAGE_SIZE;
+	bp.byte_align = PAGE_SIZE;
+	bp.domain = AMDGPU_GEM_DOMAIN_VRAM;
+	bp.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
+	bp.flags |= clear ? AMDGPU_GEM_CREATE_VRAM_CLEARED : 0;
+	bp.type = ttm_bo_type_device;
+	bp.resv = NULL;
+
+	r = amdgpu_bo_create_user(adev, &bp, &ubo);
+	if (r) {
+		pr_debug("failed %d to create bo\n", r);
+		kfree(svm_bo);
+		return r;
+	}
+	bo = &ubo->bo;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+	r = amdgpu_bo_reserve(bo, true);
+	if (r) {
+		pr_debug("failed %d to reserve bo\n", r);
+		goto reserve_bo_failed;
+	}
+
+	r = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	if (r) {
+		pr_debug("failed %d to reserve bo\n", r);
+		amdgpu_bo_unreserve(bo);
+		goto reserve_bo_failed;
+	}
+	process_info = p->kgd_process_info;
+	amdgpu_bo_fence(bo, &process_info->eviction_fence->base, true);
+
+	amdgpu_bo_unreserve(bo);
+
+	svm_bo->bo = bo;
+	prange->svm_bo = svm_bo;
+	prange->ttm_res = &bo->tbo.mem;
+	prange->offset = 0;
+
+	spin_lock(&svm_bo->list_lock);
+	list_add(&prange->svm_bo_list, &svm_bo->range_list);
+	spin_unlock(&svm_bo->list_lock);
+
+	return 0;
+
+reserve_bo_failed:
+	kfree(svm_bo);
+	amdgpu_bo_unref(&bo);
+	prange->ttm_res = NULL;
+
+	return r;
+}
+
+void svm_range_vram_node_free(struct svm_range *prange)
+{
+	svm_range_bo_unref(prange->svm_bo);
+	prange->ttm_res = NULL;
+}
+
+struct amdgpu_device *
+svm_range_get_adev_by_id(struct svm_range *prange, uint32_t gpu_id)
+{
+	struct kfd_process *p;
+	struct kfd_dev *dev;
+	int32_t gpu_idx;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	gpu_idx = kfd_process_gpuidx_from_gpuid(p, gpu_id);
+	if (gpu_idx < 0) {
+		pr_debug("failed to get device by id 0x%x\n", gpu_id);
+		return NULL;
+	}
+	r = kfd_process_device_from_gpuidx(p, gpu_idx, &dev);
+	if (r < 0) {
+		pr_debug("failed to get device by idx 0x%x\n", gpu_idx);
+		return NULL;
+	}
+
+	return (struct amdgpu_device *)dev->kgd;
+}
+
+static int svm_range_validate_vram(struct svm_range *prange)
+{
+	struct amdgpu_device *adev;
+	int r;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] actual_loc 0x%x\n", prange->svms,
+		 prange->start, prange->last, prange->actual_loc);
+
+	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n",
+			 prange->actual_loc);
+		return -EINVAL;
+	}
+
+	r = svm_range_vram_node_new(adev, prange, true);
+	if (r)
+		pr_debug("failed %d to alloc vram\n", r);
+
+	return r;
+}
+
 static int
 svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 {
-	int r = 0;
+	int r;
 
 	pr_debug("actual loc 0x%x\n", prange->actual_loc);
 
-	r = svm_range_validate_ram(mm, prange);
+	if (!prange->actual_loc)
+		r = svm_range_validate_ram(mm, prange);
+	else
+		r = svm_range_validate_vram(prange);
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d invalid %d\n", prange->svms,
 		 prange->start, prange->last, r, atomic_read(&prange->invalid));
@@ -497,6 +737,32 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
 	return 0;
 }
 
+static int
+svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	uint64_t npages = last - start + 1;
+
+	pr_debug("svms 0x%p new prange 0x%p start 0x%lx [0x%llx 0x%llx]\n",
+		 new->svms, new, new->start, start, last);
+
+	if (new->start == old->start) {
+		new->offset = old->offset;
+		old->offset += new->npages;
+	} else {
+		new->offset = old->offset + npages;
+	}
+
+	new->svm_bo = svm_range_bo_ref(old->svm_bo);
+	new->ttm_res = old->ttm_res;
+
+	spin_lock(&new->svm_bo->list_lock);
+	list_add(&new->svm_bo_list, &new->svm_bo->range_list);
+	spin_unlock(&new->svm_bo->list_lock);
+
+	return 0;
+}
+
 /**
  * svm_range_split_adjust - split range and adjust
  *
@@ -505,7 +771,7 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy system memory pages, pages_addr or vram mm_nodes in old range to new
+ * Copy system memory pages, pages_addr or vram ttm_res in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -529,6 +795,8 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 
 	if (old->pages_addr)
 		r = svm_range_split_pages(new, old, start, last);
+	else if (old->actual_loc && old->ttm_res)
+		r = svm_range_split_nodes(new, old, start, last);
 	else
 		WARN_ONCE(1, "split adjust invalid pages_addr and nodes\n");
 	if (r)
@@ -649,7 +917,8 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	uint64_t pte_flags;
 
 	pte_flags = AMDGPU_PTE_VALID;
-	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+	if (!prange->ttm_res)
+		pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
 
 	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
 
@@ -669,7 +938,9 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	/* Apply ASIC specific mapping flags */
 	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
 
-	pr_debug("PTE flags 0x%llx\n", pte_flags);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d system %d PTE flags 0x%llx\n",
+		 prange->svms, prange->start, prange->last,
+		 prange->ttm_res ? 1:0, prange->pages_addr ? 1:0, pte_flags);
 
 	return pte_flags;
 }
@@ -757,7 +1028,9 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, dma_addr_t *pages_addr,
 		     bool reserve_vm, struct dma_fence **fence)
 {
-	struct amdgpu_bo *root;
+	struct ttm_validate_buffer tv[2];
+	struct ww_acquire_ctx ticket;
+	struct list_head list;
 	uint64_t pte_flags;
 	int r = 0;
 
@@ -765,13 +1038,22 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		 prange->last);
 
 	if (reserve_vm) {
-		root = amdgpu_bo_ref(vm->root.base.bo);
-		r = amdgpu_bo_reserve(root, true);
+		INIT_LIST_HEAD(&list);
+
+		tv[0].bo = &vm->root.base.bo->tbo;
+		tv[0].num_shared = 4;
+		list_add(&tv[0].head, &list);
+		if (prange->svm_bo && prange->ttm_res) {
+			tv[1].bo = &prange->svm_bo->bo->tbo;
+			tv[1].num_shared = 1;
+			list_add(&tv[1].head, &list);
+		}
+		r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
 		if (r) {
-			pr_debug("failed %d to reserve root bo\n", r);
-			amdgpu_bo_unref(&root);
+			pr_debug("failed %d to reserve bo\n", r);
 			goto out;
 		}
+
 		r = amdgpu_vm_validate_pt_bos(adev, vm, svm_range_bo_validate,
 					      NULL);
 		if (r) {
@@ -782,14 +1064,16 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	prange->mapping.start = prange->start;
 	prange->mapping.last = prange->last;
-	prange->mapping.offset = 0;
+	prange->mapping.offset = prange->offset;
 	pte_flags = svm_range_get_pte_flags(adev, prange);
 	prange->mapping.flags = pte_flags;
 
 	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
-					prange->mapping.offset, NULL,
+					prange->mapping.offset,
+					prange->ttm_res ?
+						prange->ttm_res->mm_node : NULL,
 					pages_addr, &vm->last_update);
 	if (r) {
 		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
@@ -808,11 +1092,8 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 unreserve_out:
-	if (reserve_vm) {
-		amdgpu_bo_unreserve(root);
-		amdgpu_bo_unref(&root);
-	}
-
+	if (reserve_vm)
+		ttm_eu_backoff_reservation(&ticket, &list);
 out:
 	return r;
 }
@@ -1040,7 +1321,14 @@ struct svm_range *svm_range_clone(struct svm_range *old)
 		memcpy(new->pages_addr, old->pages_addr,
 		       old->npages * sizeof(*old->pages_addr));
 	}
-
+	if (old->svm_bo) {
+		new->ttm_res = old->ttm_res;
+		new->offset = old->offset;
+		new->svm_bo = svm_range_bo_ref(old->svm_bo);
+		spin_lock(&new->svm_bo->list_lock);
+		list_add(&new->svm_bo_list, &new->svm_bo->range_list);
+		spin_unlock(&new->svm_bo->list_lock);
+	}
 	new->flags = old->flags;
 	new->preferred_loc = old->preferred_loc;
 	new->prefetch_loc = old->prefetch_loc;
@@ -1371,12 +1659,16 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 
 	svm_range_unmap_from_gpus(prange, start, last);
 
+	svm_range_lock(prange);
+
 	unmap_parent = start <= prange->start && last >= prange->last;
 
 	list_for_each_entry(pchild, &prange->child_list, child_list)
 		svm_range_unmap_split(mm, prange, pchild, start, last);
 	svm_range_unmap_split(mm, prange, prange, start, last);
 
+	svm_range_unlock(prange);
+
 	if (unmap_parent)
 		svm_range_add_list_work(svms, prange, mm, SVM_OP_UNMAP_RANGE);
 	else
@@ -1435,10 +1727,18 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 void svm_range_list_fini(struct kfd_process *p)
 {
+	struct svm_range *prange;
+	struct svm_range *next;
+
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
 
 	/* Ensure list work is finished before process is destroyed */
 	flush_work(&p->svms.deferred_list_work);
+
+	list_for_each_entry_safe(prange, next, &p->svms.list, list)
+		svm_range_free(prange);
+
+	pr_debug("pasid 0x%x svms 0x%p done\n", p->pasid, &p->svms);
 }
 
 int svm_range_list_init(struct kfd_process *p)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 2a76e89dec04..8e2b63a134f1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -32,6 +32,13 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+struct svm_range_bo {
+	struct amdgpu_bo	*bo;
+	struct kref		kref;
+	struct list_head	range_list; /* all svm ranges shared this bo */
+	spinlock_t		list_lock;
+};
+
 enum svm_work_list_ops {
 	SVM_OP_NULL,
 	SVM_OP_UNMAP_RANGE,
@@ -61,6 +68,12 @@ struct svm_work_list_item {
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
  * @dma_addr:   dma mapping address on each GPU for system memory physical page
+ * @ttm_res:    vram ttm resource map
+ * @offset:     range start offset within mm_nodes
+ * @svm_bo:     struct to manage splited amdgpu_bo
+ * @svm_bo_list:link list node, to scan all ranges which share same svm_bo
+ * @lock:       protect prange start, last, child_list, svm_bo_list, pages_addr
+ * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
@@ -92,6 +105,12 @@ struct svm_range {
 	uint64_t			npages;
 	unsigned long			*pages_addr;
 	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
+	struct ttm_resource		*ttm_res;
+	uint64_t			offset;
+	struct svm_range_bo		*svm_bo;
+	struct list_head		svm_bo_list;
+	struct mutex                    lock;
+	unsigned int                    saved_flags;
 	uint32_t			flags;
 	uint32_t			preferred_loc;
 	uint32_t			prefetch_loc;
@@ -106,10 +125,27 @@ struct svm_range {
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
 
+static inline void svm_range_lock(struct svm_range *prange)
+{
+	mutex_lock(&prange->lock);
+	prange->saved_flags = memalloc_noreclaim_save();
+
+}
+static inline void svm_range_unlock(struct svm_range *prange)
+{
+	memalloc_noreclaim_restore(prange->saved_flags);
+	mutex_unlock(&prange->lock);
+}
+
 int svm_range_list_init(struct kfd_process *p);
 void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	      uint64_t size, uint32_t nattrs,
 	      struct kfd_ioctl_svm_attribute *attrs);
+struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
+					       uint32_t id);
+int svm_range_vram_node_new(struct amdgpu_device *adev,
+			    struct svm_range *prange, bool clear);
+void svm_range_vram_node_free(struct svm_range *prange);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
