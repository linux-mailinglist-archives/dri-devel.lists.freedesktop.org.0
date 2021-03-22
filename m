Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBE343EF5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2F589F19;
	Mon, 22 Mar 2021 11:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1FC89BAE;
 Mon, 22 Mar 2021 11:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ead8+lu943YuTMTngJfmgCVKFSBwrUGYI7NlSV4F6np4H6prF0jQYb5RE4cI5u6lPPJ630RBeuRMgTpM8nvrLINLqHyE3xmb6L6O8IlvJrN++9FrR3TnxkHMBftqSJJtmkrFEpepgNIhxuZ9LJf/dKR6B6mpuBK30bt7BIW0E+rIzWVVZJtAZWN/7yLN1/ahs+mQoDJxlNH1cBOWiAMpionJMaN58sKg0qZjRGAvUfljSS3IBem07lvy+V/hdaqk5Pq4yrWKl9u3tKo4thmpUf2ek6OPoiWE7hfPvUDMYi7wtEX6NnDbkMma/3NU2VwmNtMrBbw8e19fT/fHT/PRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epi4MJAZ/bhbWerSJ8ZE/JFgIX+o9R2KTuuUA0TdN9U=;
 b=bNLKTmlELbkO/RjuNc2Qn1v5Y8VuVNJQTLdUVQwK9Uwq/GU104IRuzPVdbWNba61ip0ky0yK6wIt4R5gUelMb0530JkOtidZmteyR28XTOni2rprpNToEOFqMP5bN8E0IWG59eQsxJ3dLlS3MeqVUnASdc33lpzpFP/6aTR8AOblBVTvbkB6y2eJAbvgpZBryhapl8cgTxy/xbHH9FhKCKgXn+xTCDASpq8v86BYUOFh3iEQGTtgg9hHk92nnOf5xzkk/Vy8WrbcpVQ90wA5afedPz1/vzVZYSlD+dtnguw1MVIky3XWMRkv0DpWKLVOEklNqKuRjOLjfavDGgol7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epi4MJAZ/bhbWerSJ8ZE/JFgIX+o9R2KTuuUA0TdN9U=;
 b=zS2i/02EWUrLXPc6rcaj5OmM99wRxxYY7rs3svYFcCeq8hh4LQ+wBwlKEYOsUWXCb/WMBz808n8RX66O0yWCV5EwLeHV4V0+m18THK3qnELUiDpmsSB0nUXiEPLcV8Pcd8S7LLfmH16AFJWMNXn3673NsVv8m1Vi3eYgzlkMhkQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:34 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:34 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/44] drm/amdkfd: deregister svm range
Date: Mon, 22 Mar 2021 06:58:24 -0400
Message-Id: <20210322105900.14068-9-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68c72243-fd66-4327-e2bd-08d8ed22b197
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678304C4FE0025F9361A7FC92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAhmJ8yfuD2nUlWpo8bvdqnVDQW0vk9a8rM5JxG3PiyO6rHFy79Onz7cowzhQNFj21yGc5CXQGfYrSjYwnzMJQu3Sd9DRcMVpO04KrtifQ71veM0o1G29GZyUXeRjq+ZSUxfFu7IAiYT0B7d7QRJe7HGU+5l0Iamfoe7B/6DmpCGGhiYb8ECQkjoH3i7k1TnaZg0SqSDcTJ2Hylzvx+eZwUhxdocDCNqWidv0y4YcgRphWHGmoKUHcrxgo2UzLrOFT4KIoxRpQJUwm81JVPJsAh6q6Fdcp/nqQDVIIDFOJrxekILE06FDKodsHScUPOd+50cbZQoAiGNu0zfXmbU2w0vRjayitGeGFWHTnh1ANdeFtWuH1tBDkY3OJwUPpksKoumEZuQXXj1UYiomRDMoHPkxGEhlMQMScfNK6R3thuMTokLMj2LXG2BNy+91MyBEy9eR1blA8yx8V+Rki41jpo1W0NroYQB5Tq4FZ3inUj0yMCVsXA4iKg/esv/qt2nzfH2I0wZg91VXjH2MAIT5Dljhlq7zAxIzmvl3FtYea4LyarRWqFXyG/hgRt5HQ/zepvTgy1KY+d4Y6o6jnbTN4a7ILyI9GnISK5+HlQq84CfC9F4H8KpTvgMBWJf4ZtnbY5QmxFzsiZ7t0p7TCNiv0xocYEzPPdc5ir0RjAbX3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VFHPDizAZ8f8wntBPazoHZ+NeGYlGkf3c8QQ6lJT/RaYKr3mvDG8ziibc2/v?=
 =?us-ascii?Q?xsb+8zGcBJKKYxxNlbNEVfGYiSZ1iPY6vA1FvF5BSxioP/awIo1waoZuvEp2?=
 =?us-ascii?Q?vFnRMwUQPhwPFJwTlk6abncTCWL8ekd6BID2nhIWqYAquhg6KKoZLFwcuC1A?=
 =?us-ascii?Q?TEy9ih6Gv8Nw5j9qQvK4zknE52XzLr2Ufnz/uW3Y+7Ijtpk4XgskBVshXYGI?=
 =?us-ascii?Q?n0JwNoYHsTvxV+7SiNDIpcK6OS7gq0cK+j1bcfByhmt76ZQsRLAjcYyDXl4U?=
 =?us-ascii?Q?sl69rOEqarfp/VEsY2IQqZmwqzLmwbOIVh1kYiLSMAtRf2BY+vkQopwc+dH5?=
 =?us-ascii?Q?iTA9YhsywsORWr1ceKL1vkQATJzoIxXRH+Zb+Z3HpcddlxkkkDSfkyifd2FL?=
 =?us-ascii?Q?lxEmrW/J0X0ZeXj3s7B8BqU1/pFZy49n3bHjKkt8KiF7l5gAolXjqhzORPcC?=
 =?us-ascii?Q?+jBV3ry46KISm//9ILlK//IDY9XD2BtHpS0p1mY4Qu1tyDd0wLgul4OUdLVI?=
 =?us-ascii?Q?PcIe1QiBZTcTC5EmNpyQbDo2bqNCKMpu2mWk/ACA6TcOC4XvKl2ozza4oA8L?=
 =?us-ascii?Q?SumYKI2Ss8axztq4TSLOoocxtjGA+g1MH9z/TKchoKffRVasTXleE/qauLDg?=
 =?us-ascii?Q?ig4LDnVzrC1AjWBj8jwHn/smtEEEnmD5/vfG//Eg+bqtEF2ST/+wlGr8bpB6?=
 =?us-ascii?Q?83K5didW35m4fsPdxtHni+iak8ub0GbpfBzqc2+TqTda4/XijcfOHsBlZB4i?=
 =?us-ascii?Q?cZwqaCavOpUA4MpOe8kk0+0917kYKDVjTLSyroK0JJDCdnOcqkb0nLU/1vGe?=
 =?us-ascii?Q?CWSa07hPiK28Bg8EexWmcm8S7CEoLF16nL14egzLys+w23KH/OE18d17Y0GT?=
 =?us-ascii?Q?qi8wJ1kNSCrb6HF+vmFrpK4pyDcrGEhsCcPddgRoO7B0xmrQlHuU7KpfQY6v?=
 =?us-ascii?Q?cDSzbjjI/JDKxMRN/9u5OHHQJK06RoPRWkj7SGDKf+lSfbRaQza1GsGO+64G?=
 =?us-ascii?Q?sH5+ZzzhNU7H2X+TzgLeh1sJwYBHZPanOGHHoDBSkj+0JeyyKc701Jh/OoIz?=
 =?us-ascii?Q?gMnrK99PPP2wuX1kjF3K9gpfsUS8fH6+8+/fKrwG61ohAzAgAhUae1OaTHtM?=
 =?us-ascii?Q?HZK0/f80Eugi2NdkZaV3yFGuJKt8A+HE7sl9vccectNrb4YJljGRejyegjlN?=
 =?us-ascii?Q?sR101gxFIRrhrdYE5U6F9bFgiKS5JhyAPViW6jM+jYArptcrwp0tqMI5RFkY?=
 =?us-ascii?Q?HHroeMJu20vv3ylSjAuiXopm5amt4bSGmIHSc8/EvX9PEb2z3GEob2DhQ7gx?=
 =?us-ascii?Q?5mg1P6BKqf3ywMjEzb4BkJA6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c72243-fd66-4327-e2bd-08d8ed22b197
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:33.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/QV96p+95aqSoPcseUP2GNtfr5EoFav7Cxp0PJ+7ohts04M76T+tvInZzZKkUmOGyeKieWRDMYtf6hF/W4IOw==
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

From: Philip Yang <Philip.Yang@amd.com>

When application explicitly call unmap or unmap from mmput when
application exit, driver will receive MMU_NOTIFY_UNMAP event to remove
svm range from process svms object tree and list first, unmap from GPUs
(in the following patch).

Split the svm ranges to handle partial unmapping of svm ranges. To
avoid deadlocks, updating MMU notifiers, range lists and interval trees
is done in a deferred worker. New child ranges are attached to their
parent range's child_list until the worker can update the
svm_range_list. svm_range_set_attr flushes deferred work and takes the
mmap_write_lock to guarantee that it has an up-to-date svm_range_list.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c  | 285 +++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h  |  18 ++
 3 files changed, 305 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f547e1282d69..4101f5341ec9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -735,6 +735,9 @@ struct svm_range_list {
 	struct mutex			lock;
 	struct rb_root_cached		objects;
 	struct list_head		list;
+	struct work_struct		deferred_list_work;
+	struct list_head		deferred_range_list;
+	spinlock_t			deferred_list_lock;
 };
 
 /* Process data */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 6024caf7373f..e23171ac866a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -136,6 +136,8 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->deferred_list);
+	INIT_LIST_HEAD(&prange->child_list);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -512,6 +514,41 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
 	return r;
 }
 
+void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
+			 struct svm_range *pchild, enum svm_work_list_ops op)
+{
+	pr_debug("add child 0x%p [0x%lx 0x%lx] to prange 0x%p child list %d\n",
+		 pchild, pchild->start, pchild->last, prange, op);
+
+	pchild->work_item.mm = mm;
+	pchild->work_item.op = op;
+	list_add_tail(&pchild->child_list, &prange->child_list);
+}
+
+/**
+ * svm_range_list_lock_and_flush_work - flush pending deferred work
+ *
+ * @svms: the svm range list
+ * @mm: the mm structure
+ *
+ * Context: Returns with mmap write lock held, pending deferred work flushed
+ *
+ */
+static void
+svm_range_list_lock_and_flush_work(struct svm_range_list *svms,
+				   struct mm_struct *mm)
+{
+retry_flush_work:
+	flush_work(&svms->deferred_list_work);
+	mmap_write_lock(mm);
+
+	if (list_empty(&svms->deferred_range_list))
+		return;
+	mmap_write_unlock(mm);
+	pr_debug("retry flush\n");
+	goto retry_flush_work;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -664,21 +701,264 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 	return r;
 }
 
+static void
+svm_range_update_notifier_and_interval_tree(struct mm_struct *mm,
+					    struct svm_range *prange)
+{
+	unsigned long start;
+	unsigned long last;
+
+	start = prange->notifier.interval_tree.start >> PAGE_SHIFT;
+	last = prange->notifier.interval_tree.last >> PAGE_SHIFT;
+
+	if (prange->start == start && prange->last == last)
+		return;
+
+	pr_debug("up notifier 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n",
+		  prange->svms, prange, start, last, prange->start,
+		  prange->last);
+
+	if (start != 0 && last != 0) {
+		interval_tree_remove(&prange->it_node, &prange->svms->objects);
+		svm_range_remove_notifier(prange);
+	}
+	prange->it_node.start = prange->start;
+	prange->it_node.last = prange->last;
+
+	interval_tree_insert(&prange->it_node, &prange->svms->objects);
+	svm_range_add_notifier_locked(mm, prange);
+}
+
+static void
+svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
+{
+	struct mm_struct *mm = prange->work_item.mm;
+
+	switch (prange->work_item.op) {
+	case SVM_OP_NULL:
+		pr_debug("NULL OP 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		break;
+	case SVM_OP_UNMAP_RANGE:
+		pr_debug("remove 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
+		svm_range_free(prange);
+		break;
+	case SVM_OP_UPDATE_RANGE_NOTIFIER:
+		pr_debug("update notifier 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_update_notifier_and_interval_tree(mm, prange);
+		break;
+	case SVM_OP_ADD_RANGE:
+		pr_debug("add 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms, prange,
+			 prange->start, prange->last);
+		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
+		break;
+	default:
+		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
+			 prange->work_item.op);
+	}
+}
+
+static void svm_range_deferred_list_work(struct work_struct *work)
+{
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	struct mm_struct *mm;
+
+	svms = container_of(work, struct svm_range_list, deferred_list_work);
+	pr_debug("enter svms 0x%p\n", svms);
+
+	spin_lock(&svms->deferred_list_lock);
+	while (!list_empty(&svms->deferred_range_list)) {
+		prange = list_first_entry(&svms->deferred_range_list,
+					  struct svm_range, deferred_list);
+		spin_unlock(&svms->deferred_list_lock);
+		pr_debug("prange 0x%p [0x%lx 0x%lx] op %d\n", prange,
+			 prange->start, prange->last, prange->work_item.op);
+
+		mm = prange->work_item.mm;
+		mmap_write_lock(mm);
+		mutex_lock(&svms->lock);
+
+		/* Remove from deferred_list must be inside mmap write lock,
+		 * otherwise, svm_range_list_lock_and_flush_work may hold mmap
+		 * write lock, and continue because deferred_list is empty, then
+		 * deferred_list handle is blocked by mmap write lock.
+		 */
+		spin_lock(&svms->deferred_list_lock);
+		list_del_init(&prange->deferred_list);
+		spin_unlock(&svms->deferred_list_lock);
+
+		while (!list_empty(&prange->child_list)) {
+			struct svm_range *pchild;
+
+			pchild = list_first_entry(&prange->child_list,
+						struct svm_range, child_list);
+			pr_debug("child prange 0x%p op %d\n", pchild,
+				 pchild->work_item.op);
+			list_del_init(&pchild->child_list);
+			svm_range_handle_list_op(svms, pchild);
+		}
+
+		svm_range_handle_list_op(svms, prange);
+		mutex_unlock(&svms->lock);
+		mmap_write_unlock(mm);
+
+		spin_lock(&svms->deferred_list_lock);
+	}
+	spin_unlock(&svms->deferred_list_lock);
+
+	pr_debug("exit svms 0x%p\n", svms);
+}
+
+void
+svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
+			struct mm_struct *mm, enum svm_work_list_ops op)
+{
+	spin_lock(&svms->deferred_list_lock);
+	/* if prange is on the deferred list */
+	if (!list_empty(&prange->deferred_list)) {
+		pr_debug("update exist prange 0x%p work op %d\n", prange, op);
+		WARN_ONCE(prange->work_item.mm != mm, "unmatch mm\n");
+		if (op != SVM_OP_NULL &&
+		    prange->work_item.op != SVM_OP_UNMAP_RANGE)
+			prange->work_item.op = op;
+	} else {
+		prange->work_item.op = op;
+		prange->work_item.mm = mm;
+		list_add_tail(&prange->deferred_list,
+			      &prange->svms->deferred_range_list);
+		pr_debug("add prange 0x%p [0x%lx 0x%lx] to work list op %d\n",
+			 prange, prange->start, prange->last, op);
+	}
+	spin_unlock(&svms->deferred_list_lock);
+}
+
+void schedule_deferred_list_work(struct svm_range_list *svms)
+{
+	spin_lock(&svms->deferred_list_lock);
+	if (!list_empty(&svms->deferred_range_list))
+		schedule_work(&svms->deferred_list_work);
+	spin_unlock(&svms->deferred_list_lock);
+}
+
+static void
+svm_range_unmap_split(struct mm_struct *mm, struct svm_range *parent,
+		      struct svm_range *prange, unsigned long start,
+		      unsigned long last)
+{
+	struct svm_range *head;
+	struct svm_range *tail;
+
+	if (prange->work_item.op == SVM_OP_UNMAP_RANGE) {
+		pr_debug("prange 0x%p [0x%lx 0x%lx] is already freed\n", prange,
+			 prange->start, prange->last);
+		return;
+	}
+	if (start > prange->last || last < prange->start)
+		return;
+
+	head = tail = prange;
+	if (start > prange->start)
+		svm_range_split(prange, prange->start, start - 1, &tail);
+	if (last < tail->last)
+		svm_range_split(tail, last + 1, tail->last, &head);
+
+	if (head != prange && tail != prange) {
+		svm_range_add_child(parent, mm, head, SVM_OP_UNMAP_RANGE);
+		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
+	} else if (tail != prange) {
+		svm_range_add_child(parent, mm, tail, SVM_OP_UNMAP_RANGE);
+	} else if (head != prange) {
+		svm_range_add_child(parent, mm, head, SVM_OP_UNMAP_RANGE);
+	} else if (parent != prange) {
+		prange->work_item.op = SVM_OP_UNMAP_RANGE;
+	}
+}
+
+static void
+svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
+			 unsigned long start, unsigned long last)
+{
+	struct svm_range_list *svms;
+	struct svm_range *pchild;
+	struct kfd_process *p;
+	bool unmap_parent;
+
+	p = kfd_lookup_process_by_mm(mm);
+	if (!p)
+		return;
+	svms = &p->svms;
+
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n", svms,
+		 prange, prange->start, prange->last, start, last);
+
+	unmap_parent = start <= prange->start && last >= prange->last;
+
+	list_for_each_entry(pchild, &prange->child_list, child_list)
+		svm_range_unmap_split(mm, prange, pchild, start, last);
+	svm_range_unmap_split(mm, prange, prange, start, last);
+
+	if (unmap_parent)
+		svm_range_add_list_work(svms, prange, mm, SVM_OP_UNMAP_RANGE);
+	else
+		svm_range_add_list_work(svms, prange, mm,
+					SVM_OP_UPDATE_RANGE_NOTIFIER);
+	schedule_deferred_list_work(svms);
+
+	kfd_unref_process(p);
+}
+
 /**
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
+ * MMU range unmap notifier to remove svm ranges
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
 				    unsigned long cur_seq)
 {
+	struct svm_range *prange;
+	unsigned long start;
+	unsigned long last;
+
+	if (range->event == MMU_NOTIFY_RELEASE)
+		return true;
+
+	start = mni->interval_tree.start;
+	last = mni->interval_tree.last;
+	start = (start > range->start ? start : range->start) >> PAGE_SHIFT;
+	last = (last < (range->end - 1) ? last : range->end - 1) >> PAGE_SHIFT;
+	pr_debug("[0x%lx 0x%lx] range[0x%lx 0x%lx] notifier[0x%lx 0x%lx] %d\n",
+		 start, last, range->start >> PAGE_SHIFT,
+		 (range->end - 1) >> PAGE_SHIFT,
+		 mni->interval_tree.start >> PAGE_SHIFT,
+		 mni->interval_tree.last >> PAGE_SHIFT, range->event);
+
+	prange = container_of(mni, struct svm_range, notifier);
+
+	switch (range->event) {
+	case MMU_NOTIFY_UNMAP:
+		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
+		break;
+	default:
+		break;
+	}
+
 	return true;
 }
 
 void svm_range_list_fini(struct kfd_process *p)
 {
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+
+	/* Ensure list work is finished before process is destroyed */
+	flush_work(&p->svms.deferred_list_work);
 }
 
 int svm_range_list_init(struct kfd_process *p)
@@ -688,6 +968,9 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
+	INIT_LIST_HEAD(&svms->deferred_range_list);
+	spin_lock_init(&svms->deferred_list_lock);
 
 	return 0;
 }
@@ -805,7 +1088,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 
 	mutex_lock(&process_info->lock);
 
-	mmap_write_lock(mm);
+	svm_range_list_lock_and_flush_work(svms, mm);
 
 	if (!svm_range_is_valid(mm, start, size)) {
 		pr_debug("invalid range\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f35a178c607f..f9b81245b94a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -32,6 +32,18 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+enum svm_work_list_ops {
+	SVM_OP_NULL,
+	SVM_OP_UNMAP_RANGE,
+	SVM_OP_UPDATE_RANGE_NOTIFIER,
+	SVM_OP_ADD_RANGE
+};
+
+struct svm_work_list_item {
+	enum svm_work_list_ops op;
+	struct mm_struct *mm;
+};
+
 /**
  * struct svm_range - shared virtual memory range
  *
@@ -53,6 +65,9 @@
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @notifier:   register mmu interval notifier
+ * @work_item:  deferred work item information
+ * @deferred_list: list header used to add range to deferred list
+ * @child_list: list header for split ranges which are not added to svms yet
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -78,6 +93,9 @@ struct svm_range {
 	uint32_t			actual_loc;
 	uint8_t				granularity;
 	struct mmu_interval_notifier	notifier;
+	struct svm_work_list_item	work_item;
+	struct list_head		deferred_list;
+	struct list_head		child_list;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
