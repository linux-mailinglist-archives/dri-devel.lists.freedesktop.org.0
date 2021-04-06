Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1B354A80
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00C06E536;
	Tue,  6 Apr 2021 01:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097656E2DC;
 Tue,  6 Apr 2021 01:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbQmSm9nNTvicPo+OADMGLyNo2jMw/rQu+w5rBCxt30tHfB226DsFdayr+xveoR5kfYu664N66HWSFdOMwtfO1f/mEF2jAe3OetBN2/0o6K5o8+l3cdf3ggWjyoIvNMkM1xpyhsYsVik7DPvXxhxDIxIzbsd94rbeb0hc7ElmIxJtqSkXvGPcORNbNlHWtJNHjItfzB8PMeI7XvJ4FZq9k4AIedVWYozKuJv+5NufI+20TyF/eT2Bj0+7i+Of3CU6HHxi3WMBkJV7t3bLI3m7MbX8k1EHrC2dK+NkrYrTsyiZjNI2fTx4SUStDnCZnal8ZbayKSZmYqL9Ua0x2e2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BelkHK0985HJ8VtKAZpTR7qcKsqllCZGYazljhCW4Q0=;
 b=BYf80ls0ZZdm3/3arAtBt3OVh0L9vfTTmuyyaj0wdUA+lbU6MR2cWv7mNNJNLEF1vPHhPbC2qJ4F+ZJs+AxF4DvP8C5kbxyma0HpHfNkLdKRORhSWRY7erQrmDTeg8bRhfe9ZUn3VnhREBzOJMzxlRFssbkTpKmgANPWhyLLdkqaHIh78rFFfqLkN7XeErikXUvmMzwaMQ+qibouM8GB8h8qDWP2rQAqYri8pAccFba0yjrH3huqbqoSSvnmFJsi8pZLS9NLGYIQg3jfG3EQ6+b3Yiw0hKA0m8vpG7XjyI1X0SvKoaPTWns/x5lzg5L+zJiPfv95NQ7SM9wwnlJRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BelkHK0985HJ8VtKAZpTR7qcKsqllCZGYazljhCW4Q0=;
 b=kYQpuI0uK5EKJYdBKg3OXWAAQ+8wgVMphcHMahLgZBQWPq98YrA29PMeyN5q1rdvBtt+8BVB+dtkznYBLQjIc+7U+MqKmAtAsuTKaQkhCKcdhK5BH/O2X72FqthHdLPPICjKz6NjrussmoL2nENfsd5sJSUJNcTCbkrn42sduTY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:06 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:06 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/34] drm/amdkfd: page table restore through svm API
Date: Mon,  5 Apr 2021 21:46:18 -0400
Message-Id: <20210406014629.25141-24-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb7f7109-5166-4b67-bf01-08d8f89de263
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3792FFBDE6BE0C4B9E4A757592769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DMN31d0o30kruEZUug49bn1uub2KEZyykl4wu/4PAw1DWUW/6TdD2Q3MYjS2pP4UftUm45Xs09EOsiFXwgitVSjoxUy6i9pKwhhogfj2ncfYB0k+JMlUk0QH3sNyBEwdvbXhiBX5Ex21F7rKu38UsPoWO80+KeLbQV3akcaijf27i4YcyN8+TMgMYBoanDMyrlHuuTyswxXxiGQatkdHBUJFjxCQiqchlPDg4nYjq6vo03AKlHtft8jVnlCTXBvnLi4BEiO4B5A6Hlq50bIG4KfxMcMVFbudLx3mN+UzpaSIk1lx2QFToaCX1gZCBI3eQAP5TQPY1Mtc9LcyuWjqF/q9phgbpE2P+qkp1PoIN+GqEiCv+xJ0M7B1kRYnP+/zzhUHFqL4AKRjj7xvvQICAXJ6RGrJ21DiYgePPAH9uK0h2fZvlXOCtDJxsZXpYII/xU7L26+9Ohl5Q0V5n4B6T1PVoBdRUte2W8OvV66fBdI/vO/KMLtDac1AckR1VqN0IPbYEOAmkV5sk768adK67kq27Fv35L22TNxv3Yf0QvkR/HWS0CpQRhWhl64zYTQBEGRcs2R+dLfTOw6s9kws74zE9ovYarurwA28Ppltla3ykMrJ9MsMaMziVFlF1fRJC2sUCSWN9nFufZ1JN83FMuAjxwS79DhLZ97k1eiQ7K6dsUrOXrJyb+5ml8dRcxX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(54906003)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q4ZRPB1elWTlXBHHWwiJvMLuq8LldcpzUNFWdAUtbrrGOuh4/6PRs88pml8+?=
 =?us-ascii?Q?zuF2OV6Uhxl6Yy+2JH56j8m9lTUTZ76/KD5DqG3AuOT2Fu4zSCkCDgyrfxds?=
 =?us-ascii?Q?B+iZqCA3qSnbAyhVK+NZujt7pg0qRrXqrbcRgC38y7VYopvoFsrb5n9hSFoD?=
 =?us-ascii?Q?gt4tKN3Hi7lWGauynFcoHosDc0/ZcTWm9mxi81PnCpSywZM1aDt17pQjKZPG?=
 =?us-ascii?Q?/g0yOu6Z3xsWxALi+UXKN9NHZpM3wAobR8O3xhPSctK7q4tQg+lDCIr4RNph?=
 =?us-ascii?Q?BKJR34sC1y5j7NMGC5CHOXwU7PobRm9gqvCOsLtMGnsWpsvaDF9Z6mCYB/U6?=
 =?us-ascii?Q?l/4l24dhuIE532MO9cDPoSBHmfWG81U42H8wEZYKsJ2BWo9wYV34fTnlmKv4?=
 =?us-ascii?Q?iFgSZ/jRBArVl4gAj+H/k2vmq7jWufs5BZULEOJm+TeS3rgzwjsxOx1nIpxo?=
 =?us-ascii?Q?bNTf4Dsmh91U5hghCLIVe39gkgOjjyt7GrH5CPnpJa7o/a9jVL5jRUCGtJRW?=
 =?us-ascii?Q?EJMOit1xvNiWNXPGDqox2zg8YpMZQLcIatAXgRQfPUsT8pA8YGyaxIxkpE7A?=
 =?us-ascii?Q?HlMpXdQ+Ap3eex1hV3SYdrDk4suAlngh9y4unV/He9Px5tHA2/e5R4+Fq7zi?=
 =?us-ascii?Q?srZhdnvZJPaoysOvrm5Gi5GISfqEqGP8rHHnW3ci7uim6tUmQC8B3Kn0UaQ1?=
 =?us-ascii?Q?EwI9zaXenAC5t0B+QVesgtMkZ2ys5beHJvmDZC7PC6Wq8jeysZeyQ5qZvD3G?=
 =?us-ascii?Q?CeLqDdWI2JpAWkCv659SjJkzNeD8A2u3l4pg97RYmzFxzwUXmK0ajDP1PAJt?=
 =?us-ascii?Q?8C2HqIxzn1bY5/c+ezd0yeSr6ctqOlw7UU1fnnqXQMBpJyod58ZLNdtsQhCE?=
 =?us-ascii?Q?NOGw2UBL0T6XGjfNGGO0MnXIew7p8MioX1J3lzvxPuI3sWhSZM+VmNlDF1ex?=
 =?us-ascii?Q?Fi0n3V3xhnxnB/dEqgdf4Y7hJ8WUENf5Yxq3JgqCS6A7gfpgWF6aImems/bV?=
 =?us-ascii?Q?HJQr90GsCBICqDDTrGag1SyZGTqLqWZwPDtMOhcUTz2b2bOxy/vjqlPDNUSp?=
 =?us-ascii?Q?2IhiGFZhgNpDwSJAA+ko+NSFYSnNpyQphn/9P6OIJPoQv8Q3wuM0Venn0yBS?=
 =?us-ascii?Q?T6LfMJE1AUgiUf5McknaFkUroOplwPKDD790VWfFOP1NRjmGeUEL784CqXHK?=
 =?us-ascii?Q?rxQ65OhBu2HPfrrdxQuoTW6xThjfaqwPtZUsM/NS7JZo9gbWmjr+v3QVZKjx?=
 =?us-ascii?Q?ll9Wi/pQNotJ7OVbNX9XnsWg/aKQX2FDm+v5CDi5f5SVmWqtZApJeF4gz2C8?=
 =?us-ascii?Q?NmtBomlmj+tsC2LnZRmbJfVP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7f7109-5166-4b67-bf01-08d8f89de263
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:06.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UOG7GgWX4UwVJCgygcyEH1oYnsrsWj65WRf7LyfHE/VM1rn6GugqxXkTagW/jxp3rYbWeykEVaDHKx+TGTeFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

Page table restore implementation in SVM API. This is called from
the fault handler at amdgpu_vm. To update page tables through
the page fault retry IH.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 398c9ef7464e..1e5c4dfc9de3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2001,6 +2001,65 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
 	return NULL;
 }
 
+int
+svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
+			uint64_t addr)
+{
+	int r = 0;
+	struct mm_struct *mm = NULL;
+	struct svm_range *prange;
+	struct svm_range_list *svms;
+	struct kfd_process *p;
+
+	p = kfd_lookup_process_by_pasid(pasid);
+	if (!p) {
+		pr_debug("kfd process not founded pasid 0x%x\n", pasid);
+		return -ESRCH;
+	}
+	if (!p->xnack_enabled) {
+		pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
+		return -EFAULT;
+	}
+	svms = &p->svms;
+
+	pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms, addr);
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("svms 0x%p failed to get mm\n", svms);
+		r = -ESRCH;
+		goto out;
+	}
+
+	mmap_read_lock(mm);
+	mutex_lock(&svms->lock);
+	prange = svm_range_from_addr(svms, addr, NULL);
+
+	if (!prange) {
+		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
+			 svms, addr);
+		r = -EFAULT;
+		goto out_unlock_svms;
+	}
+
+	mutex_lock(&prange->migrate_mutex);
+
+	r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE, false, false);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+			 svms, prange->start, prange->last);
+
+	mutex_unlock(&prange->migrate_mutex);
+out_unlock_svms:
+	mutex_unlock(&svms->lock);
+	mmap_read_unlock(mm);
+	mmput(mm);
+out:
+	kfd_unref_process(p);
+
+	return r;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	struct svm_range *prange;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 6cc12de8d76a..168c623f4477 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -154,6 +154,8 @@ void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       unsigned long addr, struct svm_range *parent,
 			       struct svm_range *prange);
+int svm_range_restore_pages(struct amdgpu_device *adev,
+			    unsigned int pasid, uint64_t addr);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
