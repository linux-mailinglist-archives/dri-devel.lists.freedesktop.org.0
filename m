Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78381343EED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942AA89C52;
	Mon, 22 Mar 2021 11:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050889ACD;
 Mon, 22 Mar 2021 11:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKFOtZHw1tr+3e4yYKvSbZCziz0nrKdOub2g1YFCfDRcnsP/AlcHizi/ffMIsy0i3RhDKTXKCBxrDruJZLcZR2dbYq0kqKPXcr1OEY6VkFm6lQ7bIRSyWfRcLg+bBQy/ix0tgXx3XfyuPul4q1XC+w6l5yzK4ghc3Q4EQmhhBfshqdTcLuU+jDq8uzb8LKnuxVLinHmcuglfqB2ddX4KnMvrlX4giDCNUMkGKzFHKstVuj+d4xy8f4F/xgep5WXE2rB+pf9N7wJBnfD9bbqeTt763w5evmbRHDm6exTnWvtVaAH7HpTtp/icIJesbl0EJ1ahNwqbemACuPz0fNMOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKYW9UxUahbksmhRthUo0cfZQGRrkvNkqdTw7fkHdIg=;
 b=ElY044hBkkz6Ax08YHfLqpdRkMKK7ak4Z4iX8SnkExYy/6uOHz/u0TK3Hoo1DYywCpbHvTD+nj6V5lIa++ujWztbhCMZ6ehs6BWyuuZHNyTv/CpRz5uub97y1AljI29pS4HPuF+u/+eRE6YjIVfl+CUOpz2q1QZTRGwOnhBUyA2MWDF+U2TTj5G5IOoTHjBrG6OkejmE7B1NytAV5azLYOiZoOHFIKBa8ylzQwdXI3AcC+bZzqPWAbGU8yU22JqqrXTs5r/g9hYOW/Eo9sdZeg+F6jxdZptUmX9pVnE2GnUhsISUpAE8DW6bNor+1Exm8rlZyo9IKwUdEH9HgD9mHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKYW9UxUahbksmhRthUo0cfZQGRrkvNkqdTw7fkHdIg=;
 b=oPbORVEYLbWE/5MTE88aL4Mfp5kjZ60zk6b/cWmPW9IQbpQLfH2l7LbJtPaCraKYbLtQo1EPyfIbXPpJvZcDi1MIcBkMM3ar6/7eRps8YVhfQ9JKaVoLV+TpVVC1vdaGALRZRNTIn5K3MLqIPxzqkOKO7b5ktNT35SMwlz3Dlq0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:33 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:33 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/44] drm/amdkfd: validate svm range system memory
Date: Mon, 22 Mar 2021 06:58:23 -0400
Message-Id: <20210322105900.14068-8-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5019bc38-b5b3-48cc-7b2f-08d8ed22b144
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367873C9C389D95F0DDBB3A992659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X1DZqh2WfHNFAxC0fcLfh56zypq1IJ4XQhC2mdxuKXXWXodlXCLESi37Pn/GH2bSvyEQu6POZIf+T8pyG+1BFmImUPvD5YjyzzHRbywhAHRhoVhDu9JHy1wTdCOsmSR9DUOA65ybM0jO4loQq0n+W9LdZo4GAnfpo1IBRmO/DvAJeGXKjnklQHdXJ2lC0z+5c3X35SoHfS7J0gmYWgFtsf+rQE2LjDGNA1XKP10MEyFOXv3mpgTTbdMNmcEjwgFiNKNOVo6zshTsGdy4+TtrPT1YM1VlUrkZQRv896/0ypWt7m7ujfai3gk/LcVC8MqfMNvAmVCBYe0DHbvFcXkMRimQm82hUVkjVF/Tp798X3uzxCOJqr7KS6EdDgsmE67bbyWCJpVr4VoOEcE3FNCrnYlLN02goueLSmdzb8F80Kw8RdSd1hyhKSG/0UeV6YLI4Dr/UDGidrugPnZwl3I7wTGBCPRFGNu1H/FfOGdLFtRBoVDR2B+Lgi4ihbZ3u7zU1Cpgs/4TXoneLGPyHbrD1LKB76ZXv3nF++dRKMglLX0525pKuWgektX29U02jBYgnJ8SZfRTcNBi56/zld+qiJ9iX4zLXe8tp7UIVWLdX02bCM9nzRO9iPHC+C2wQTxrsxU0N1GP2dD6/jA5q7pmREcEsUU0H1+h9/Yc6RwkTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(15650500001)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LUmf/b3whSwgswuamESQX+ihSddp2ZVCCilItpmdCqf9sVBVE61t7CEVqIhN?=
 =?us-ascii?Q?OeiM8ZE+muAD0IXKSRAmiKlsOwbnmFwEX9tD2jmROXTGK1PR4p2Ux3oo+avC?=
 =?us-ascii?Q?/MBikcRpqCsWY2Alt1pmggxXxHgAliwzF1xrPqO+r1LLKfFTk1MIYQkTP/pv?=
 =?us-ascii?Q?engbsSr9QEFMBeza8/+OF/ozpNctUQ9fg1V59AHth500QfucsrqnrTK0cNC3?=
 =?us-ascii?Q?5QUz9RWwxrbB3/UYJqVDP1GX+3U+B+7iyVkQDMUP1pskbUaZe7rNLXQxE5Vm?=
 =?us-ascii?Q?eFA+St7Y+umPntrrWw6xTuvGSLL6gpLxbbvpZxGaFkMdLSYikYBRhF+WVtAX?=
 =?us-ascii?Q?MWGOzRcEgcvn61G8vnickpF+/+0s3BU7ZmtEUPEc0IEphbFaQITmo9epagK4?=
 =?us-ascii?Q?cDs0OcqwYGzCoZYgo8GbEi88+zEUYwTObsw5ZBu7gelVqsdQp9zc+OIjY8uw?=
 =?us-ascii?Q?fvb+l+UamaM1xxiA5lHONS+zwTld9lHx7BgXBcSi68iguQwyDWSnX2h4PCq9?=
 =?us-ascii?Q?CXF9rshOqyD6Dtku4JuZot54mPTEOsKKY/axgPIbvQLhZ8Jnal8boHo2JgyS?=
 =?us-ascii?Q?86RfndmQoBXdKSb+fDnJa70wWJzTDzk80c6bGFO6E5YpzhbyCiMuL4mMtrDo?=
 =?us-ascii?Q?feJ8TAjf5Tiu+Ux4ziaF6FGZTyYqEjhFTcl8FpDX1Iy60kb+/kKEFeW70B4Q?=
 =?us-ascii?Q?LEZ1e22n0wcKbbVqy6+Ti3j7nAKuJvpayB+jnD46gg6LTiD4uBzVyOXYG/vg?=
 =?us-ascii?Q?RCy0pYsBPBTX3GFlFsj7bkyLRt3PCKo5YjFp2RK0g4Ua8OEx9bcg1DuuFi+y?=
 =?us-ascii?Q?XCB8HbIdNqilMlbVQoRSNUwjppaMXUcviqMZ4Ql8Lc8KRB3Md8bVPlgUrKoZ?=
 =?us-ascii?Q?h8mXUhy5GxR+rRmy+OUzhu/MhQuIol7yUAia0yOmX4AKsoYiNLjEw6Mdq5Ix?=
 =?us-ascii?Q?gB5WQyI3uWGjOGS7uF1UqraX4dq0zlYnSEHN4rWmHxH7tqjBQWnUMwyVccrG?=
 =?us-ascii?Q?8e0KmUZcwhfai8wKmN3KlV/KOGW53p9oeC83XhmvW/qEPocij0SMC2qcoG0M?=
 =?us-ascii?Q?6UbK//G/r288b7jxh37YWU7sPrnrFn45LQlp+A8syIE4u2DLA/yIxVrGfO5e?=
 =?us-ascii?Q?Pwzzh73yAk44UAJ3cAKUhcdhrj33xJHxpiHL27cP2+Eu818DJ8ryl+6l/+iL?=
 =?us-ascii?Q?ciHE6wBlpdty9OHge4627LO+EkVzas7+TBVdB9WGpYhVPmv7Qq/sEOsW1Ndp?=
 =?us-ascii?Q?OJtVJMSQ4kVckqn0porDB1xXZQ5NitWIKkrVBYnL+knyNlwT5vr3VkyGhOwz?=
 =?us-ascii?Q?BK21IPsoGVj1yJuPuZeBGPND?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5019bc38-b5b3-48cc-7b2f-08d8ed22b144
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:33.3901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI/ndT2W8PP9UWjGgbcGhIpPbnUYOqgF2aTQ44FE3+LGNR8jNymS8+W7zdHi1DZjs1KNDgvWEUr/FbeT/oOCxQ==
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Use HMM to get system memory pages address, which will be used to
map to GPUs or migrate to vram.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 103 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   4 ++
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index e57103a9025e..6024caf7373f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -28,6 +28,15 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+static bool
+svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
+				    const struct mmu_notifier_range *range,
+				    unsigned long cur_seq);
+
+static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
+	.invalidate = svm_range_cpu_invalidate_pagetables,
+};
+
 /**
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
@@ -46,6 +55,18 @@ static void svm_range_unlink(struct svm_range *prange)
 		interval_tree_remove(&prange->it_node, &prange->svms->objects);
 }
 
+static void
+svm_range_add_notifier_locked(struct mm_struct *mm, struct svm_range *prange)
+{
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange, prange->start, prange->last);
+
+	mmu_interval_notifier_insert_locked(&prange->notifier, mm,
+				     prange->start << PAGE_SHIFT,
+				     prange->npages << PAGE_SHIFT,
+				     &svm_range_mn_ops);
+}
+
 /**
  * svm_range_add_to_svms - add svm range to svms
  * @prange: svm range structure to be added
@@ -65,6 +86,18 @@ static void svm_range_add_to_svms(struct svm_range *prange)
 	interval_tree_insert(&prange->it_node, &prange->svms->objects);
 }
 
+static void svm_range_remove_notifier(struct svm_range *prange)
+{
+	pr_debug("remove notifier svms 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+		 prange->svms, prange,
+		 prange->notifier.interval_tree.start >> PAGE_SHIFT,
+		 prange->notifier.interval_tree.last >> PAGE_SHIFT);
+
+	if (prange->notifier.interval_tree.start != 0 &&
+	    prange->notifier.interval_tree.last != 0)
+		mmu_interval_notifier_remove(&prange->notifier);
+}
+
 static void svm_range_free(struct svm_range *prange)
 {
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
@@ -112,6 +145,56 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	return prange;
 }
 
+/**
+ * svm_range_validate_ram - get system memory pages of svm range
+ *
+ * @mm: the mm_struct of process
+ * @prange: the range struct
+ *
+ * After mapping system memory to GPU, system memory maybe invalidated anytime
+ * during application running, we use HMM callback to sync GPU with CPU page
+ * table update, so we don't need use lock to prevent CPU invalidation and check
+ * hmm_range_get_pages_done return value.
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
+{
+	int r;
+
+	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+				       prange->start << PAGE_SHIFT,
+				       prange->npages, &prange->hmm_range,
+				       false, true);
+	if (r) {
+		pr_debug("failed %d to get svm range pages\n", r);
+		return r;
+	}
+
+	kvfree(prange->pages_addr);
+	prange->pages_addr = prange->hmm_range->hmm_pfns;
+	prange->hmm_range->hmm_pfns = NULL;
+
+	amdgpu_hmm_range_get_pages_done(prange->hmm_range);
+	prange->hmm_range = NULL;
+
+	return 0;
+}
+
+static int
+svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
+{
+	int r = 0;
+
+	pr_debug("actual loc 0x%x\n", prange->actual_loc);
+
+	r = svm_range_validate_ram(mm, prange);
+
+	return r;
+}
+
 static int
 svm_range_check_attr(struct kfd_process *p,
 		     uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -581,6 +664,18 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 	return r;
 }
 
+/**
+ * svm_range_cpu_invalidate_pagetables - interval notifier callback
+ *
+ */
+static bool
+svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
+				    const struct mmu_notifier_range *range,
+				    unsigned long cur_seq)
+{
+	return true;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
@@ -732,6 +827,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	/* Apply changes as a transaction */
 	list_for_each_entry_safe(prange, next, &insert_list, insert_list) {
 		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
 	}
 	list_for_each_entry(prange, &update_list, update_list) {
 		svm_range_apply_attrs(p, prange, nattr, attrs);
@@ -743,6 +839,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			 prange->svms, prange, prange->start,
 			 prange->last);
 		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
 		svm_range_free(prange);
 	}
 
@@ -753,7 +850,11 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	 * case because the rollback wouldn't be guaranteed to work either.
 	 */
 	list_for_each_entry(prange, &update_list, update_list) {
-		/* TODO */
+		r = svm_range_validate(mm, prange);
+		if (r) {
+			pr_debug("failed %d to validate svm range\n", r);
+			break;
+		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c46cdad9d1a3..f35a178c607f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -44,6 +44,7 @@
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
+ * @hmm_range:  hmm range structure used by hmm_range_fault to get system pages
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -51,6 +52,7 @@
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
+ * @notifier:   register mmu interval notifier
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -67,6 +69,7 @@ struct svm_range {
 	struct list_head		update_list;
 	struct list_head		remove_list;
 	struct list_head		insert_list;
+	struct hmm_range		*hmm_range;
 	uint64_t			npages;
 	unsigned long			*pages_addr;
 	uint32_t			flags;
@@ -74,6 +77,7 @@ struct svm_range {
 	uint32_t			prefetch_loc;
 	uint32_t			actual_loc;
 	uint8_t				granularity;
+	struct mmu_interval_notifier	notifier;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
