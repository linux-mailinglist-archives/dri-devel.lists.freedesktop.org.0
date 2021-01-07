Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECD2EC8A6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B66E6E431;
	Thu,  7 Jan 2021 03:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8386E41A;
 Thu,  7 Jan 2021 03:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTXBkMJUeJDGGs1delrhE5386iawKSmYYfzUDkguMOHjBXWyGXbMPMYi7PQanKp9cpGSwXAUUs+hxq5/TwNBs0jh4SHfKxrmms2cyT7ueQZsj7HpGq5ZGlgVolsiui6pJJlKJBGShY1mr1kM8RXLfqMvMAlTgT7xW7m0/zts8yAK4npfvmcrfS/YsJXALQrLa8yVXitXLc+Lt265d7A5TvtL/wzsU0kTp7L8cwWfAoIYYIVZQicS6ko5R8xvnma6zk7ZrWicXw24J849vstfdpXvBCmTyhsNYHlBLR2HeHYiV9uXRN02lxXK/08E8nthzu82ASlfl6aYzxcVNjT1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA/oDQMJIAkr++PuvzTVxmDEUy49VVKiCtt5g8vfAII=;
 b=UHI1r6ZuCjGMI3Gz5Rp2a9GOmaU/318kZRnGpZvyw2h/xKCPRHLTmiPWblMjWKnEszKfDUiCK9hMmA6heU/4WRp2V1A0KPYRdHongN5YFm8vpxhGgUvvQv4NbkhJ7uuzE7NwwYucJwPO9Ou5gwAHZ6XEHZqTshbn9b28EauAH7Lkx1DAYpcBwbd1Uzu+Y1uh+SDZ013WCSS1NV37T1IawnDZSWb8S0WfPKwerykhVFUdND8i+SE0jFnINI6pd0vlbIwj4EF00k3twd2MDV7MReZultA8furaOAP7OJbkQJtrvphnjlETuAOxdyUHN3EumB2xnPzRthe76nJnRrlegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA/oDQMJIAkr++PuvzTVxmDEUy49VVKiCtt5g8vfAII=;
 b=fe1JOOCFEY+C6Wr0YCzmOpHNESxieazju81waIit5JJa2UqQJc+FDfHfyteHurVJwncT4+6j3cZAx3/oW0kvuMj+Ayk+XjNgGJs7deef7fg/HNeVoLdZgXAmyJ7Jb90KVKlDL9D7ZCkgot9hXafMDp6EDKaSEkWNUNT66S4XQhA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/35] drm/amdkfd: validate vram svm range from TTM
Date: Wed,  6 Jan 2021 22:01:10 -0500
Message-Id: <20210107030127.20393-19-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea63d93f-1035-4ff1-e63b-08d8b2b8bd2b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39992A15992A35CAAFDFA50D92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuO3a+MzLz82YGUIUUdsrPOvWuZdYFtRETBcwU+rRXm/f8mwNpkB0YMeYMUOOeSJFqz0VGY2yZZmm4v7BLyzb9U98+oYac1Ct7pvCNhOkrvjyO0RO8RrfIdYSsMmjIoA71UdC88Rdc3gSPTaqoHdPWhb77Elfe3/Ceh2ssYmIEEhON1ZsmZsGrmaWjUrw3crPkKe3UKYh1VX3JWNmz+t3j2HHlYT+ZpOMYxqmIvZ4ADMDaY4BfY6iDCei1iooerFjmSglSeG+NFLpHGt/BC9d++xhd34+BMe3MSLXsBtRJ7rLF2tSZbEr11VUszNfIf6KiLaLmNrlP4CHS/ih2m8Yj4oH8a8AwQuFcqoTTQFaXbgrdeo8aH8nLDEaQS2Djai7WIqi+2UiAeX9e1wKTYUxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(30864003)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008)(15650500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?97BP8j0Dd/mrtX4QYfqEXjlmC+bfk6c2Yjjd3w7Hgzge0YuiGGSpmMa7K66t?=
 =?us-ascii?Q?bQWJ2K8Z36dfXDhgiyn7I/66WKt4cKu/QmmMqKZv3aUvQnl2FhlATHigeNXg?=
 =?us-ascii?Q?HA611hdDxpEdHyMUw8xpqTPIir0IKS+sRfJ1AJ2RUtznNP+rvCg8V2kHt7mC?=
 =?us-ascii?Q?3EIY17MZCl88XaYUt6+4zZA1hpRYijEg6yiRgCTyyJHE4fhl/dnJ5nKKX1+Y?=
 =?us-ascii?Q?60Oq1Twl4/xWqIvwpB4mY8F3+Du2U+z2uSy/8VINfQwWl+TDrkHPZhnkrdoM?=
 =?us-ascii?Q?bqxyBYdmnVJHolkqTTrcBwBuMj+QAavD8cKuJNggFbHSVGtT9WbJ3j98AMeW?=
 =?us-ascii?Q?jtTYCDRaaDQfBHxwp5/XF+AOdLt0xQRvdY5kIs6/nQrEakg08vfcBoBzfPXS?=
 =?us-ascii?Q?6kUQiPNh0xXJu8CH1L0ayFYMbhUvQg9kuj2FiVsFZWc1G6O7j3+XbBdElIee?=
 =?us-ascii?Q?K0uVjUZqXQHwUYnchx7Kcd5nv/jOrucpl60Sw7mksNAjOhM5k2Wtl+SI3nJd?=
 =?us-ascii?Q?w/LfWmRH0zXIXDIaCtDKvHko0klRyQTxH0p2M5C8KXve8hZpczROMonEajqj?=
 =?us-ascii?Q?pV0XicJ8wESbjvAisSTTdjvQSHODtpc1UEYMWTiq+sscPu90BUgYuHxHD8dA?=
 =?us-ascii?Q?3oR6iD/D1zutooLc8Hk1BlFPO9sgU9MJGOhwejWFcSUOqc53ZmUTyrElOlI8?=
 =?us-ascii?Q?mXboedLzuam14NqgZDTEUuKAsDYOqwWtlYE5rthOGsh2CtD4mFSndSBXAixz?=
 =?us-ascii?Q?ewwXv3/ueH28yyeb0JNOPHzoXOMv+7FoDEEVI5ua885x+QO29oaicQXbo7+R?=
 =?us-ascii?Q?qdxU5gi1fHBB6xnbg5OJZ0lcVZTyCd2XUvAck56hRRtBX1xnGOnd+Z3fnZQm?=
 =?us-ascii?Q?NHkwGAcTwvmU3jhj3ddhJD9VkhCqoZ08Ch7ybYUWut2+MHcE6PqJlAV7wGBA?=
 =?us-ascii?Q?VnPrUvLH/OBMLJ2Htku+20ws/bn6oWtB6BrASBxfkrbqz1tpz6NHA9tsMWuA?=
 =?us-ascii?Q?aEMp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:58.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ea63d93f-1035-4ff1-e63b-08d8b2b8bd2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcqjwkfHaWvqZoOVHUgT86sV0NjHg6eWwpA4Ud/sUu0oGhpYcOzfa/gqnVh3Csz53zWpPeRDYaGAu9JzrVXClg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

If svm range perfetch location is not zero, use TTM to alloc
amdgpu_bo vram nodes to validate svm range, then map vram nodes to GPUs.

Use offset to sub allocate from the same amdgpu_bo to handle overlap
vram range while adding new range or unmapping range.

svm_bo has ref count to trace the shared ranges. If all ranges of shared
amdgpu_bo are migrated to ram, ref count becomes 0, then amdgpu_bo is
released, all ranges svm_bo is set to NULL.

To migrate range from ram back to vram, allocate the same amdgpu_bo
with previous offset if the range has svm_bo.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 342 ++++++++++++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  20 ++
 2 files changed, 335 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index e3ba6e7262a7..7d91dc49a5a9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -35,7 +35,9 @@
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
  *
- * Remove the svm range from svms interval tree and link list
+ * Remove the svm_range from the svms and svm_bo SRCU lists and the svms
+ * interval tree. After this call, synchronize_srcu is needed before the
+ * range can be freed safely.
  *
  * Context: The caller must hold svms_lock
  */
@@ -44,6 +46,12 @@ static void svm_range_unlink(struct svm_range *prange)
 	pr_debug("prange 0x%p [0x%lx 0x%lx]\n", prange, prange->it_node.start,
 		 prange->it_node.last);
 
+	if (prange->svm_bo) {
+		spin_lock(&prange->svm_bo->list_lock);
+		list_del(&prange->svm_bo_list);
+		spin_unlock(&prange->svm_bo->list_lock);
+	}
+
 	list_del_rcu(&prange->list);
 	interval_tree_remove(&prange->it_node, &prange->svms->objects);
 }
@@ -70,6 +78,12 @@ static void svm_range_remove(struct svm_range *prange)
 	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
 		 prange->it_node.start, prange->it_node.last);
 
+	if (prange->mm_nodes) {
+		pr_debug("vram prange svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->it_node.start, prange->it_node.last);
+		svm_range_vram_node_free(prange);
+	}
+
 	kvfree(prange->pages_addr);
 	kfree(prange);
 }
@@ -102,7 +116,9 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->list);
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
+	INIT_LIST_HEAD(&prange->svm_bo_list);
 	atomic_set(&prange->invalid, 0);
+	spin_lock_init(&prange->svm_bo_lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -139,6 +155,16 @@ svm_get_supported_dev_by_id(struct kfd_process *p, uint32_t gpu_id,
 	return dev;
 }
 
+struct amdgpu_device *
+svm_range_get_adev_by_id(struct svm_range *prange, uint32_t gpu_id)
+{
+	struct kfd_process *p =
+			container_of(prange->svms, struct kfd_process, svms);
+	struct kfd_dev *dev = svm_get_supported_dev_by_id(p, gpu_id, NULL);
+
+	return dev ? (struct amdgpu_device *)dev->kgd : NULL;
+}
+
 /**
  * svm_range_validate_ram - get system memory pages of svm range
  *
@@ -186,14 +212,226 @@ svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
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
+	/* This cleanup loop does not need to be SRCU safe because there
+	 * should be no SRCU readers while the ref count is 0. Any SRCU
+	 * reader that has a chance of reducing the ref count must take
+	 * an extra reference before srcu_read_lock and release it after
+	 * srcu_read_unlock.
+	 */
+	spin_lock(&svm_bo->list_lock);
+	while (!list_empty(&svm_bo->range_list)) {
+		struct svm_range *prange =
+				list_first_entry(&svm_bo->range_list,
+						struct svm_range, svm_bo_list);
+		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->it_node.start, prange->it_node.last);
+		spin_lock(&prange->svm_bo_lock);
+		prange->svm_bo = NULL;
+		spin_unlock(&prange->svm_bo_lock);
+
+		/* list_del_init tells a concurrent svm_range_vram_node_new when
+		 * it's safe to reuse the svm_bo pointer and svm_bo_list head.
+		 */
+		list_del_init(&prange->svm_bo_list);
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
+	struct amdgpu_bo *bo;
+	struct kfd_process *p;
+	int r;
+
+	pr_debug("[0x%lx 0x%lx]\n", prange->it_node.start,
+		 prange->it_node.last);
+	spin_lock(&prange->svm_bo_lock);
+	if (prange->svm_bo) {
+		if (prange->mm_nodes) {
+			/* We still have a reference, all is well */
+			spin_unlock(&prange->svm_bo_lock);
+			return 0;
+		}
+		if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+			/* The BO was still around and we got
+			 * a new reference to it
+			 */
+			spin_unlock(&prange->svm_bo_lock);
+			pr_debug("reuse old bo [0x%lx 0x%lx]\n",
+				prange->it_node.start, prange->it_node.last);
+
+			prange->mm_nodes = prange->svm_bo->bo->tbo.mem.mm_node;
+			return 0;
+		}
+
+		spin_unlock(&prange->svm_bo_lock);
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
+		spin_unlock(&prange->svm_bo_lock);
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
+	r = amdgpu_bo_create(adev, &bp, &bo);
+	if (r) {
+		pr_debug("failed %d to create bo\n", r);
+		kfree(svm_bo);
+		return r;
+	}
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
+	prange->mm_nodes = bo->tbo.mem.mm_node;
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
+	prange->mm_nodes = NULL;
+
+	return r;
+}
+
+void svm_range_vram_node_free(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	svm_range_bo_unref(prange->svm_bo);
+	prange->mm_nodes = NULL;
+}
+
+static int svm_range_validate_vram(struct svm_range *prange)
+{
+	struct amdgpu_device *adev;
+	int r;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] actual_loc 0x%x\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last,
+		 prange->actual_loc);
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
 		 prange->it_node.start, prange->it_node.last,
@@ -349,6 +587,35 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
 	return 0;
 }
 
+static int
+svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	pr_debug("svms 0x%p new start 0x%lx start 0x%llx last 0x%llx\n",
+		 new->svms, new->it_node.start, start, last);
+
+	old->npages = last - start + 1;
+
+	if (new->it_node.start == old->it_node.start) {
+		new->offset = old->offset;
+		old->offset += new->npages;
+	} else {
+		new->offset = old->offset + old->npages;
+	}
+
+	old->it_node.start = start;
+	old->it_node.last = last;
+
+	new->svm_bo = svm_range_bo_ref(old->svm_bo);
+	new->mm_nodes = old->mm_nodes;
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
@@ -382,6 +649,8 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 
 	if (old->pages_addr)
 		r = svm_range_split_pages(new, old, start, last);
+	else if (old->actual_loc && old->mm_nodes)
+		r = svm_range_split_nodes(new, old, start, last);
 	else
 		WARN_ONCE(1, "split adjust invalid pages_addr and nodes\n");
 	if (r)
@@ -438,17 +707,14 @@ svm_range_split(struct svm_range *prange, uint64_t start, uint64_t last,
 		return -EINVAL;
 
 	svms = prange->svms;
-	if (old_start == start) {
+	if (old_start == start)
 		*new = svm_range_new(svms, last + 1, old_last);
-		if (!*new)
-			return -ENOMEM;
-		r = svm_range_split_adjust(*new, prange, start, last);
-	} else {
+	else
 		*new = svm_range_new(svms, old_start, start - 1);
-		if (!*new)
-			return -ENOMEM;
-		r = svm_range_split_adjust(*new, prange, start, last);
-	}
+	if (!*new)
+		return -ENOMEM;
+
+	r = svm_range_split_adjust(*new, prange, start, last);
 
 	return r;
 }
@@ -550,7 +816,8 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	uint64_t pte_flags;
 
 	pte_flags = AMDGPU_PTE_VALID;
-	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+	if (!prange->mm_nodes)
+		pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
 
 	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
 
@@ -570,7 +837,9 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	/* Apply ASIC specific mapping flags */
 	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
 
-	pr_debug("PTE flags 0x%llx\n", pte_flags);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d system %d PTE flags 0x%llx\n",
+		 prange->svms, prange->it_node.start, prange->it_node.last,
+		 prange->mm_nodes ? 1:0, prange->pages_addr ? 1:0, pte_flags);
 
 	return pte_flags;
 }
@@ -656,7 +925,9 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, bool reserve_vm,
 		     struct dma_fence **fence)
 {
-	struct amdgpu_bo *root;
+	struct ttm_validate_buffer tv[2];
+	struct ww_acquire_ctx ticket;
+	struct list_head list;
 	dma_addr_t *pages_addr;
 	uint64_t pte_flags;
 	int r = 0;
@@ -665,13 +936,25 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		 prange->it_node.start, prange->it_node.last);
 
 	if (reserve_vm) {
-		root = amdgpu_bo_ref(vm->root.base.bo);
-		r = amdgpu_bo_reserve(root, true);
+		INIT_LIST_HEAD(&list);
+
+		tv[0].bo = &vm->root.base.bo->tbo;
+		tv[0].num_shared = 4;
+		list_add(&tv[0].head, &list);
+		if (prange->svm_bo && prange->mm_nodes) {
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
+		if (prange->svm_bo && prange->mm_nodes &&
+		    prange->svm_bo->bo->tbo.evicted)
+			goto unreserve_out;
+
 		r = amdgpu_vm_validate_pt_bos(adev, vm, svm_range_bo_validate,
 					      NULL);
 		if (r) {
@@ -682,7 +965,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	prange->mapping.start = prange->it_node.start;
 	prange->mapping.last = prange->it_node.last;
-	prange->mapping.offset = 0;
+	prange->mapping.offset = prange->offset;
 	pte_flags = svm_range_get_pte_flags(adev, prange);
 	prange->mapping.flags = pte_flags;
 	pages_addr = prange->pages_addr;
@@ -690,7 +973,8 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
-					prange->mapping.offset, NULL,
+					prange->mapping.offset,
+					prange->mm_nodes,
 					pages_addr, &vm->last_update);
 	if (r) {
 		pr_debug("failed %d to map to gpu 0x%lx\n", r,
@@ -710,11 +994,8 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
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
@@ -929,7 +1210,14 @@ struct svm_range *svm_range_clone(struct svm_range *old)
 		memcpy(new->pages_addr, old->pages_addr,
 		       old->npages * sizeof(*old->pages_addr));
 	}
-
+	if (old->svm_bo) {
+		new->mm_nodes = old->mm_nodes;
+		new->offset = old->offset;
+		new->svm_bo = svm_range_bo_ref(old->svm_bo);
+		spin_lock(&new->svm_bo->list_lock);
+		list_add(&new->svm_bo_list, &new->svm_bo->range_list);
+		spin_unlock(&new->svm_bo->list_lock);
+	}
 	new->flags = old->flags;
 	new->preferred_loc = old->preferred_loc;
 	new->prefetch_loc = old->prefetch_loc;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 4c7daf8e0b6f..b1d2db02043b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -32,6 +32,12 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+struct svm_range_bo {
+	struct amdgpu_bo	*bo;
+	struct kref		kref;
+	struct list_head	range_list; /* all svm ranges shared this bo */
+	spinlock_t		list_lock;
+};
 /**
  * struct svm_range - shared virtual memory range
  *
@@ -45,6 +51,10 @@
  * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
+ * @mm_nodes:   vram nodes allocated
+ * @offset:     range start offset within mm_nodes
+ * @svm_bo:     struct to manage splited amdgpu_bo
+ * @svm_bo_list:link list node, to scan all ranges which share same svm_bo
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
@@ -68,6 +78,11 @@ struct svm_range {
 	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
 	dma_addr_t			*pages_addr;
+	struct drm_mm_node		*mm_nodes;
+	uint64_t			offset;
+	struct svm_range_bo		*svm_bo;
+	struct list_head		svm_bo_list;
+	spinlock_t                      svm_bo_lock;
 	uint32_t			flags;
 	uint32_t			preferred_loc;
 	uint32_t			prefetch_loc;
@@ -95,5 +110,10 @@ void svm_range_list_fini(struct kfd_process *p);
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
