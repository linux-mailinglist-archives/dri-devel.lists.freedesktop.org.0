Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456D350DB5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D936EC41;
	Thu,  1 Apr 2021 04:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189966EC33;
 Thu,  1 Apr 2021 04:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNs7QMa1or6aKRbZgWFeXq43orBmkzLKuSOWbni/7xxw+3mz331TQA+9Pfx0Eb6aIQx0O8E/IBMwD8wMGoczJkVDv8FnteXlf1Z9XtTJaPWb61ZCT7HZvxUWBaDGrYWYsNoJ1F4SJkIejgvD9QrcERaGAx2VliUQwDBSQZsX79gF3Hk8+SAIu429YhVHHqxsUJt3/PfM4LvIgES+hDKLmpf8vIx+fGg9BpyclBGmNSW5+Pkn/XPLh/NYwqGpzrlKomGQR6idoHl6WvcYNXlf/KNxiOd6aPPfytVuV/20ve9ZfBD5FlLzfF80ETRdLP8drb6nj53MsGov4l9Y9tXgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0wok9oRC0Yuir53+GB66hBgJIhTAm2XNT+thSY50lQ=;
 b=ByR0QegSg87bcFV4uPQKaTrZnpy1BQLffJcLgluBkaW6QzhFhNfQQmiwUqQ5o81RkBuu0srKcw3aE0ubJO6fM0R7mhiVUxXKJV0OWlj6STsdB0KBWBd6MVj2oRlcKjNWiW72sQFrp3K+bK58JGYQKt0kHz9lBr1C76QcJ6WWWZbDV8w/qSG0YB9LNyl67EY/CPBh/uD3g0DBAHSYWJyjSoMGc1n1zm9cAFVTGbNRjHuBHllPO/ZzCPMHC6nBaQh0GMJWU6dkBLo9X3jgCKOx3euof7Pr+X0vE416KFFwCWWRn+Qf9roXvrSRbTErxuJ18GsCJStv/hItlI6HlOKDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0wok9oRC0Yuir53+GB66hBgJIhTAm2XNT+thSY50lQ=;
 b=aPHBDHYZNsR1ldFYIFcj/K6KKldcbvuZTfll04GCXmYYSl1TQizVKA5RuN+f2VriI3d1xDOjo/fU3reQkFQ3lyDgqxLjqZbj69hUYIumuKRRM1cjnjWo7w1HKJwEnHHV2wBv1c9B1iCep9DvEP1LWxl3H8atCNAHv8l5xLdDbF0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:55 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:55 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/34] drm/amdkfd: validate vram svm range from TTM
Date: Thu,  1 Apr 2021 00:22:09 -0400
Message-Id: <20210401042228.1423-16-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3aa874e-7ed1-4f3a-80f5-08d8f4c5d2ad
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49165F048DC283F811FE2C8A927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uaga8qkNkDHZIiRNsBapP4SRCWbYGy5orljnxotJfGOF97BhmPvG0ooYJZd3tpGT6a7YlZkujYb0WjUxiXT2zJah2HQLrRzCKPL1JUlInoLaAmgLlBb/ufK0YShT6hebCADiIkC5bcdVQa3ruHZg0LQW4/H6xJ8pa/zAbXpVobuG3glTflAFzoZBszNTDJNoTIyROvkfJxhmqWZcwDpLKmNHne9oOctNDBAzPUfnBN45Sm3nwVH2HHNv4zPYXGnMFZ+DBaGyIApqHzJjvNhomgRkwcJSnPBIwtiKH3JuA0ojlIzvB0oKTolX30p/I+4oVFyn4ZUiFYVcXbSmZV/XuIGY7IQmLXjDownONJ1z5M/vPsJ6W2+N2YJN8evNs81nr+KcR5uMemZ61ZOzx6ecZmnbWExt8yp13/ek0wUNyYAU8+b9Ew0ycmhjKCj7TOMtRru+aWhO1TC75v6UJ3ein6Zmkf33HsxKbjh8xjMVqYbOIM9sS+n1FWB2wruGtlDoZs0vLTeaPNXOtNRVF9loK/aY3HkePbvWrcccmL6h1AGUuUJM1vtrr3U9dswHtpkN4gqivQW8r8a8DAOqBPW1or2OechuIX9g0vyC2kt57J0TiyqRppvmAlm083qVkyAe9EOwAVzFgoCG2yd9VAOTyuoPPw4fZO/h3WWLYETwvWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(15650500001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(30864003)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XQ+HP9egd7t8n/J++teywY03nUqLf6qHrumOhYdDAD/MqY/yIMtCJAUt15xV?=
 =?us-ascii?Q?DRLzpyI/1z6FBReyoTzu6/X2qwLX8lycEPtnFAM8ICsrylKZj9bgQAycpT9v?=
 =?us-ascii?Q?Dh+sG6ifHZga+rDT23QjgyksCYuiT3DXaA0E6YsTPzyUVtI5DRbszQif5TIJ?=
 =?us-ascii?Q?8niUwYJgrwzIvJ4/Lcn3+Gbk2Nk2mi5Jc8e5iovjnt0N0pG4uIQwkKDoyNM0?=
 =?us-ascii?Q?RwE4z2u/6YRrVh0BPsMw4ypxYlIJXN4c/P9XELiUtEdo8c2/YuSSb/Ma/NZS?=
 =?us-ascii?Q?lCl/TycEFRxKH/FMdHtX4b6gGX6Mh0XlT7l8w3GCrB7ueG2wT/POH1xvX251?=
 =?us-ascii?Q?w9D63k3ktQU723m+Dqo/IH1r4GpssxDRd5N7lAExviqj6hQ9O+9hnOulhd/D?=
 =?us-ascii?Q?wALmTIfR9/YgjpnVFlK5Hi1lEih05aXTgIgL9SgRBdty6ADxsYmQvGM0PZa4?=
 =?us-ascii?Q?hHvS+lBOs8jsZhc+QD7Q7RicbWGA3CjTgMzZS4Qf5k/ik7poJFhegIcHmtb2?=
 =?us-ascii?Q?Yxam0CcOBaTbhPnzNYT3WzCx6IllGrT1Q2Usu8x0JlJsRvI57kML+3wPyzD6?=
 =?us-ascii?Q?NXp3RF+QKI9QDP9Fhc6/QyxNXMER5fSoP2mt7bSNjl5QZTDO//zKNY+OP1tu?=
 =?us-ascii?Q?4drQwMA4y0ZqEp8/e8jswVev7rbtXHuCEnkcZEr6vZzggw1xO3RbA+m9/qWl?=
 =?us-ascii?Q?qryLQFMnuiuV4QqHA2M2u+c4snKoHI3TNIUe7kG2/+oy92YymBxigw1YnCxJ?=
 =?us-ascii?Q?mj6O8ma7/5wWe8XUL11NFExwcOfLyGdipzNPcMLsu0DZdPuKnjsFjr24HjCm?=
 =?us-ascii?Q?J/+ERmRdrLSogv3HpSKAaoidNqCLvquLhmngvbzylUCI+zrgjcm5zTzTKzGk?=
 =?us-ascii?Q?YsSxk893qVTqV1yasIxWmVSCtRDb2Ka91fyrv2S1u/ZTmPMPNg010hb8izhK?=
 =?us-ascii?Q?+Cqxzt4kVJPiDsJSBPjtByVW82JpODaWWxBV1e1oFZLU6OKWKxErXo6+8ps+?=
 =?us-ascii?Q?wrdjxObmRKSXMUoUstGPYak0RKaUYzbm2Ibti86yukpux3yc/xbeQo+mZBWD?=
 =?us-ascii?Q?L4Y/2Tmb8yBiZY1EzdL8nBBL3qWrwYAKa7ATz22sKl36C5CWPWpYVk//zzPq?=
 =?us-ascii?Q?CMhAMWHPxfEqwMKqApydBgRtLMehCsMq3YCPjhjj42Hx3NeRI8fGg23y4KKa?=
 =?us-ascii?Q?iaFzaCzQD4UZmyPek4IK7bf7aIgpw6iCBvTPRXKL97u9aqmRip84siWV2aah?=
 =?us-ascii?Q?/LW1xd9i23Iz8ByFpbMKfIg318jL3i5LwNHA/F6DAjCU54NH0S6qd0G2+eXD?=
 =?us-ascii?Q?a/YVPO3R8IS9NfkTfIdW4AP9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3aa874e-7ed1-4f3a-80f5-08d8f4c5d2ad
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:55.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhiBEGSuVQRVyzbsxwlW0XNBExzv5iA11c857tAebLM+K0WyKpCHR4ug+NlmoQAa2edX148vC3P93ZmcYGvD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 293 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  20 ++
 2 files changed, 306 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b0e0b243754c..f01bc3b4010d 100644
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
@@ -217,6 +224,7 @@ static void svm_range_free(struct svm_range *prange)
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	mutex_destroy(&prange->lock);
 	kfree(prange);
@@ -251,6 +259,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->svm_bo_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
@@ -264,6 +273,210 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
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
@@ -470,6 +683,32 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
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
@@ -478,7 +717,7 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy system memory dma_addr in old range to new
+ * Copy system memory dma_addr or vram ttm_res in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -504,6 +743,12 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
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
@@ -715,14 +963,16 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
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
 					dma_addr, &vm->last_update);
 	if (r) {
 		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
@@ -818,6 +1068,11 @@ int svm_range_reserve_bos(struct svm_validate_context *ctx)
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
@@ -902,6 +1157,14 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -1099,6 +1362,14 @@ struct svm_range *svm_range_clone(struct svm_range *old)
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
@@ -1507,12 +1778,20 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 void svm_range_list_fini(struct kfd_process *p)
 {
-	mutex_destroy(&p->svms.lock);
+	struct svm_range *prange;
+	struct svm_range *next;
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
 
 	/* Ensure list work is finished before process is destroyed */
 	flush_work(&p->svms.deferred_list_work);
+
+	list_for_each_entry_safe(prange, next, &p->svms.list, list)
+		svm_range_free(prange);
+
+	mutex_destroy(&p->svms.lock);
+
+	pr_debug("pasid 0x%x svms 0x%p done\n", p->pasid, &p->svms);
 }
 
 int svm_range_list_init(struct kfd_process *p)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 267545c5ceb9..15d35b63cee2 100644
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
@@ -59,6 +66,10 @@ struct svm_work_list_item {
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
@@ -90,6 +101,10 @@ struct svm_range {
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
@@ -123,5 +138,10 @@ void svm_range_list_fini(struct kfd_process *p);
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
