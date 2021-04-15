Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CE35FF58
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49946E99D;
	Thu, 15 Apr 2021 01:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4A6E9AD;
 Thu, 15 Apr 2021 01:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i54Wu6tC8WPmu5Hp2cW+LWiwnAwYwM+Bmdy/TypdCd2wYuwo0Kti6J/nyxBaP2viRViQwR9n+3/0jC0jjm446Pz8CWavO6OSo/Q0IHpiYfKzRixkO7INYAVpOjjkTtnOvqzDd8Z+bleYv7LnfyFML5wYy1kKTHVJFQtakE1nf8OvZg9pFLcOgrAMAuMKkrO8BCIjRW+kWcspULAxKmuo5MLs8vp1Q1opLc5hgbnVkVutcEpTOze5A9RiRXcTc+31ROa4m/gFvUqNEtsufExV5dwoY4HLKaFoFeioEYItniN+rj9LwGwPc3RfcsQEANJV0jsSTPcnd/Wi+KzJvcVGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grM4EPwik91e+B0a4fwBIb8sb8HcKwldj/x2wiPz+uk=;
 b=FFiTlIZNEe0N9fHUqRnXFzgJCC03Lk/3c2ee11nQVDexvwMS7l+8edBPz+tUCtQYuyXF6R/O85LzrdCFwMt3VhiVXPvfuHA6VsiTnrdIi/6W0T24qiutodTorIm1vjH8FcIO7uXVLjTL43i/vVDdVEzv6VJJ4Fe9BQM/IBgqxdURKeYk8/xSjIBQ0LW3p6VFqXwyBOeIk7/nfKMzj7XN9bGwaVo5FikHAmeDVldznnABb6e8kZjMQmGIoTvqPdWJBFTFWbPuMxqik1GkjznU2TNsApoOScpKzUGtPWeAhHQTMaJqS+LJJ78Ou6iLO06D9biF1Ttp9lh72gGzo23nMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grM4EPwik91e+B0a4fwBIb8sb8HcKwldj/x2wiPz+uk=;
 b=O5CE8+mX3Oa87ip27K+FUqqOZHWsiLZBpI4R8+aYcZUzG0414QiaDjd9OIwgYEch2sBRr8Q0XKN5imFrGX5Sb6SUrRyi6NW5bD1f5MBvIE509UHby3Wq0xtDxDC5cBKr52wTOkcBP+SI2JoQJNwQB7EMsyTIz9dA1S18r0DnvL0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/34] drm/amdkfd: validate vram svm range from TTM
Date: Wed, 14 Apr 2021 21:23:19 -0400
Message-Id: <20210415012337.1755-17-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c52202-4519-49f0-4322-08d8ffad270a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479707B062CAFA7953D323BC924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hemrRBayBGPEIsvRZ1G+5LeyJ29JXttODOf3eDwM7FcoTxo6krOCRJd8SFqn1cKZrpmUNRlqNfvgNgSRRwBdxvRwGeCdQA5yhdt/vetv2BvQQhjbSRU2O/3eZB5/t2JuIJG1PFx2GzlXnmFmzgts4UfWX+16nhvOoQCaGPPm/qdOxQ3BhbL7s8VuAtpXl+ZqyblY6/LxqfISxjfQge9CilU/vvRNENvjCUeew5JGDn46AcXlQfMxczWtvAcrH7x07RslEtFp7xPwyUglxIzdEh71PpmX97AKNzU0XHUaE1bmlo4OKGR4NXHtmdkZXnNlMHh502aJFpi8ecrJinGj2efE3dssgQdo/cqBXYIxqave6Xiby03SwxD0ArFIQ8Lmjk9dJITh4VLDvqOlEJyfeCkg7/Matems1jw1vgfaRavI2MyfXWj8EFquFggNwTAOhIA2F48djF9WOdMMHH3K1GZYcWh3sBVXXMqIyW7QJnCKWTUlWwkZlxpaER3juG9MPaA3LuEKhfZujNQXKH8Zo/Y6sQe02PgrgojEvMQCii2Vl8p1iijKr1YCEDHZjhOnyYSTntbTEfvBwLpZy60RMaEhU99z7Id+yOiEs8DLdeTbIZdjlcvKzhR6Awgy9ZXxkmg4I+y99u4+T8OMprOsog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(15650500001)(54906003)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(30864003)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1gV8Q0ps9Ig4/DOuiIfl2ysMq/mMO+KAD//NP4N0w3Y7c7IEO1r1rKbgWKLV?=
 =?us-ascii?Q?xXYR2my3H+QaA8UZDz03rREjlJZDFkl+tlivySjLgpx9JPyQznT+wv7cBV/f?=
 =?us-ascii?Q?AbBhjhHiOv+6p6kLuW58BPBVz6Mn/VnVvGZNuK/UqjKrlO7jQ7PBXPwdnYkc?=
 =?us-ascii?Q?iQsbhYjDO27yI0VXXzCwhOpE336lPk71D6zvqfXkhFE9RiYy/wD6EaXkWzkD?=
 =?us-ascii?Q?ECXRPvkRVnCujg9vDrj26+lqb0hhLKszoe9O+F/zHGRcrX8yLKiT8ghwpzBz?=
 =?us-ascii?Q?/aRRybb/DP2swRN5sF6wwM0YAuT0Dt77DhX/KOXguGXSmOBcjNFwu2nAi0gV?=
 =?us-ascii?Q?Xng4JRvtCNjfWarGGOmmfT+m6qtF5GOrB/X7kgiZUu3TzDMP7DdUh97Vg7NO?=
 =?us-ascii?Q?hKp0QASnxTwsFqaW1fWf13crotrusKWwPMsOLR5eAKihr4aocXqJL/fG4Rdq?=
 =?us-ascii?Q?cUaBb/fAzJ3xDZTJ+sBkzKI/LtSbdYhNUIMT6FW51WSZpLrjXw+3eC87n0/Z?=
 =?us-ascii?Q?VaJ/gDd14zsCZj20V8d64qPou1RwIGfFJes0wVxUh920IdAToDORXi6j3TZ+?=
 =?us-ascii?Q?HOnnswFiBWInmYQqQ5TFWfMuJ7lLVbjBnRAmi4JRvR4ofmyUl/DCc0sTs/iA?=
 =?us-ascii?Q?tRGM6drPLXbstMe61gSyjtXFHRF9ZyRo16Lg1gvC8QwGvgQpDxBeBGWu/sEr?=
 =?us-ascii?Q?b+4cepk3ofuIwPKXd8qecZCZA5rXePRiiefG5cQFcS+KJ0PPUGWvMRmtbxSa?=
 =?us-ascii?Q?s+XL1gSlh6eeiY01eewVwT/kyIGQHAKXTHIkCoWmjstdfh6QDCsEU/yT1jdr?=
 =?us-ascii?Q?YqxMbZnrerq6qLm8jvDOPTj9bvAVZyfVI50O9lSTVWpj7C/WYOSosqPXu2kA?=
 =?us-ascii?Q?2zo78zfBysP1ttNQpZv7G6zXwwW2yq1CCcBo6H1IxbvYphmZ7HmRiNJlgFD7?=
 =?us-ascii?Q?7/OWHvhKcmw8rOiAywHqiFIpt/u/iau7dXkEyTvUvJlz4SPSNOofiuOtqpWs?=
 =?us-ascii?Q?e2wlv6Y3SWMHTWVz603tE2/d5G0XmWGUe6FaU0NLSjhbmZSCzCQQl5cX4rtQ?=
 =?us-ascii?Q?7RVeBSVlDc7+GmBWbLjLpBBbpAHGOn5uLxdaA79xSuXCMEGjwDxVooGVNPgD?=
 =?us-ascii?Q?yqRm6LAqncQpd+hZXoXsft98ksy4N04KhnclCAHIgxe8GgrPGL8VLuzWo3Ii?=
 =?us-ascii?Q?iSHcgBTrU0YvDyE+X5PYLeGE4N07dbGnizzBuKLLHTmYEZJ0NgnhzSvVX/ti?=
 =?us-ascii?Q?jluyQhn0NlaAiydSMKhKBIGHRa3AT10lfY0ji9sGSAW79nUucxV6mJSpDyC0?=
 =?us-ascii?Q?A8JjJ14TDko+2Lcx4lC0nsbH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c52202-4519-49f0-4322-08d8ffad270a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:02.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWsz/INGXMH2RSmBQkrmng1QOA4JNuxbSToMrTyZ6zB9q5aP/epwdWRhwax5YAgk8OT63SoxAeh2cxXJTHS5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 296 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  20 ++
 2 files changed, 309 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 1ffdc2422d67..b12eb00018d0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -45,7 +45,8 @@ static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
  *
- * Remove the svm range from svms interval tree and link list
+ * Remove the svm_range from the svms and svm_bo lists and the svms
+ * interval tree.
  *
  * Context: The caller must hold svms->lock
  */
@@ -54,6 +55,12 @@ static void svm_range_unlink(struct svm_range *prange)
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
@@ -218,6 +225,7 @@ static void svm_range_free(struct svm_range *prange)
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	mutex_destroy(&prange->lock);
 	kfree(prange);
@@ -252,6 +260,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->svm_bo_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
@@ -265,6 +274,210 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	return prange;
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
+	struct kfd_process_device *pdd;
+	struct kfd_process *p;
+	int32_t gpu_idx;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	gpu_idx = kfd_process_gpuidx_from_gpuid(p, gpu_id);
+	if (gpu_idx < 0) {
+		pr_debug("failed to get device by id 0x%x\n", gpu_id);
+		return NULL;
+	}
+	pdd = kfd_process_device_from_gpuidx(p, gpu_idx);
+	if (!pdd) {
+		pr_debug("failed to get device by idx 0x%x\n", gpu_idx);
+		return NULL;
+	}
+
+	return (struct amdgpu_device *)pdd->dev->kgd;
+}
+
 static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
@@ -471,6 +684,32 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
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
@@ -479,7 +718,7 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy system memory dma_addr in old range to new
+ * Copy system memory dma_addr or vram ttm_res in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -505,6 +744,12 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 	if (r)
 		return r;
 
+	if (old->actual_loc && old->ttm_res) {
+		r = svm_range_split_nodes(new, old, start, last);
+		if (r)
+			return r;
+	}
+
 	old->npages = last - start + 1;
 	old->start = start;
 	old->last = last;
@@ -619,7 +864,8 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	uint64_t pte_flags;
 
 	pte_flags = AMDGPU_PTE_VALID;
-	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+	if (!prange->ttm_res)
+		pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
 
 	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
 
@@ -639,7 +885,9 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	/* Apply ASIC specific mapping flags */
 	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
 
-	pr_debug("PTE flags 0x%llx\n", pte_flags);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d PTE flags 0x%llx\n",
+		 prange->svms, prange->start, prange->last,
+		 prange->ttm_res ? 1:0, pte_flags);
 
 	return pte_flags;
 }
@@ -715,13 +963,15 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	prange->mapping.start = prange->start;
 	prange->mapping.last = prange->last;
-	prange->mapping.offset = 0;
+	prange->mapping.offset = prange->offset;
 	pte_flags = svm_range_get_pte_flags(adev, prange);
 
 	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
-					prange->mapping.offset, NULL,
+					prange->mapping.offset,
+					prange->ttm_res ?
+						prange->ttm_res->mm_node : NULL,
 					dma_addr, &vm->last_update);
 	if (r) {
 		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
@@ -817,6 +1067,11 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 		ctx->tv[gpuidx].num_shared = 4;
 		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
 	}
+	if (ctx->prange->svm_bo && ctx->prange->ttm_res) {
+		ctx->tv[MAX_GPU_INSTANCE].bo = &ctx->prange->svm_bo->bo->tbo;
+		ctx->tv[MAX_GPU_INSTANCE].num_shared = 1;
+		list_add(&ctx->tv[MAX_GPU_INSTANCE].head, &ctx->validate_list);
+	}
 
 	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
 				   ctx->intr, NULL);
@@ -901,6 +1156,14 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	if (bitmap_empty(ctx.bitmap, MAX_GPU_INSTANCE))
 		return 0;
 
+	if (prange->actual_loc && !prange->ttm_res) {
+		/* This should never happen. actual_loc gets set by
+		 * svm_migrate_ram_to_vram after allocating a BO.
+		 */
+		WARN(1, "VRAM BO missing during validation\n");
+		return -EINVAL;
+	}
+
 	svm_range_reserve_bos(&ctx);
 
 	if (!prange->actual_loc) {
@@ -1098,6 +1361,14 @@ static struct svm_range *svm_range_clone(struct svm_range *old)
 	if (!new)
 		return NULL;
 
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
@@ -1507,12 +1778,23 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 void svm_range_list_fini(struct kfd_process *p)
 {
-	mutex_destroy(&p->svms.lock);
+	struct svm_range *prange;
+	struct svm_range *next;
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
 
 	/* Ensure list work is finished before process is destroyed */
 	flush_work(&p->svms.deferred_list_work);
+
+	list_for_each_entry_safe(prange, next, &p->svms.list, list) {
+		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
+		svm_range_free(prange);
+	}
+
+	mutex_destroy(&p->svms.lock);
+
+	pr_debug("pasid 0x%x svms 0x%p done\n", p->pasid, &p->svms);
 }
 
 int svm_range_list_init(struct kfd_process *p)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 3c94899c5c40..0aab88c71855 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -33,6 +33,13 @@
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
@@ -60,6 +67,10 @@ struct svm_work_list_item {
  * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
  * @dma_addr:   dma mapping address on each GPU for system memory physical page
+ * @ttm_res:    vram ttm resource map
+ * @offset:     range start offset within mm_nodes
+ * @svm_bo:     struct to manage splited amdgpu_bo
+ * @svm_bo_list:link list node, to scan all ranges which share same svm_bo
  * @lock:       protect prange start, last, child_list, svm_bo_list
  * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -91,6 +102,10 @@ struct svm_range {
 	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
 	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
+	struct ttm_resource		*ttm_res;
+	uint64_t			offset;
+	struct svm_range_bo		*svm_bo;
+	struct list_head		svm_bo_list;
 	struct mutex                    lock;
 	unsigned int                    saved_flags;
 	uint32_t			flags;
@@ -124,5 +139,10 @@ void svm_range_list_fini(struct kfd_process *p);
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
