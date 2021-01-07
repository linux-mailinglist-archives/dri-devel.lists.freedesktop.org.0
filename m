Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8E2EC892
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B16E419;
	Thu,  7 Jan 2021 03:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13B6E418;
 Thu,  7 Jan 2021 03:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXjcZMF4loyNLU/mcj02F5iVWQlwrukSRqdab5IEuEtMSmRCqHGv1oMWQJOtqELji+E1OvYgg0saypLiSCtqfqHNSngdr+tRgN8WGRUwUBUDE1VOPziXhdocjClXLgzTW9M3wmnjimBFYkpmAfPtWiVRow/hO1RhgOjRZFAZG5gQqNztigy77lEutums9vKMrO/Nt10g3VI8jax4fp8zzaaU9S5ENnY8nRwaZKnQ7cwvG4Kw2/F3HPX/A73HfEFy75968YqsewZNdl9gbIxQbYMF6PlpOIF9qj0eXtxaLlWwqCPJ8nWTFKcOlIVrrRSJU/n//bGFdCkgspQZ1IfpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjJKrnVUl53FdI8as/Ausk9f2RKoJBlJhSFw3eHEJO4=;
 b=L/HK/OfjMpUd9hLwtW/xeyuBq9ZoJOGW32OIuaSU37c4rby+dK/UITkcZmhmkPf21cobXTaQIgJX55ImzEw8T6TmYwhNYR4/mV8620nqrvKyGZhcoG9LYk9Kn1sni74SK3LbdPWRRaYKuFbMoKVDpnxlgGXSpRHJ12lZ3SYFnv6zz2b8/UaxjLNvXOs26f18HUTOJnv+BzJMXO+ICkjKMTRwPe3ViOcJsa3Ki33Rp3t2uMTdKTbFLnx/8FGdO+uQydLzYBk6SagQx2DrANNSJTUs1w9WEJQOUNPl+RwYyHojrem43Wofs2XGH4ZOWWcl83EFAvaxkWV1v3cAPMsCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjJKrnVUl53FdI8as/Ausk9f2RKoJBlJhSFw3eHEJO4=;
 b=kmOAAGtG632d2kldhyGlrxXYKgNGd9YX0wYcUkKR0VhLa7XIwl0hF8Nlqq+2I7+qh9/GgTwt/L8P5HlSEfcP4e2iplYkfZoZ6kcXRWkVs75aKAib4Q2cE+gXzai4GidUMFd60EfbYFnkQxgTGLhujwZecU/DJb+tRjIhOyTxhPs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:53 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:53 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/35] drm/amdkfd: register overlap system memory range
Date: Wed,  6 Jan 2021 22:01:02 -0500
Message-Id: <20210107030127.20393-11-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08c14dd0-a36d-41c2-fe32-08d8b2b8b9d8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39994C9DDFA60B56D310F91392AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyagLq5aXMVtUOzwJEID0QrPp4duH1/ebTFtdXn/VceVvxGfnAhmawuGUUo3p10DUeDHPAdXFUYJ3n77B0pwUhvB9ZGHTZU2fHxRTyGE2EeHQ9T1zdsl1/FVMnRH1erL6d0nHOJjkogCz0YwFkr8rojUIhPFCHCm0snIcK9MPCm4s+ceBrMYAtVT2B8DO61+VB8lZrkW2Uz9gd9AsF852lC+r7wUtQZ1NUAEcAIDISqfkCU7l+DjXC27TuLdzHe4H6nBWUHmJ2yAmSQfzaAkr5RVIRNLgZ9HMGXafPMkuDka9j9HlfuWvh1blSxorZh/BNjWK+JO8kel/iNNEAo4lM3Fa6+42b+0X+BSWNeVhMlgSsIGYOvP4vkqv+Iw8ZVORi5YLlqgev8tBE0eeSny+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XLbbB4PhGCfxocyYqiq6kvafqyJgmA0GyIArfyv9DgJxJESDtNrx6zcgEJcP?=
 =?us-ascii?Q?xuFqUSW99rrTZMA0K6yUPYPnG3Sbv3JZGI/1YHsMa/s2cps81Ik4pIBSiBF2?=
 =?us-ascii?Q?auKb+EKjfqvXgdyRgTtOjL5V1rydm+GyI4AwEU1jsx6flUB0zn3JTYGvd9RR?=
 =?us-ascii?Q?dFl/NkRJe3Uwjanw9B3+qWcY3MCZryIXdjmvRYCQZxfhtVKZ9x9l9jA9j+0M?=
 =?us-ascii?Q?LvGS6lMozwJGK8A1qwthvrogjfwe1C0TPHdLcFPTbsGGYTqBnkQRYiiFJkvT?=
 =?us-ascii?Q?E25eQhrqiRsW/l9hm3A5KMLgPTqNCjx2HGD7PEvc7hsUDPfkNoArJfb2xmsy?=
 =?us-ascii?Q?lN4iG4DIiPYV5cAJeiZy+gu5EuZO6oPQN43+cjfRZ/4G3Ss/nz9AmBL2KNbf?=
 =?us-ascii?Q?Dre1FQDUUVHeBhiHZKDS4OpQAYUr8XF6R7QExoPN9N9ZpI2Gj2PwxY//FBK9?=
 =?us-ascii?Q?DCJl2Xp/C4BVk7IuLwZKfMatITj7ZEsROIXZTmEUqZTQYMjmUO4vKUWrn42V?=
 =?us-ascii?Q?7G2UaNe3DYNYQCf80BieJj5Z1FK3ak7OeB6o/+cy5XdVzQrSyJOWTaArvczA?=
 =?us-ascii?Q?3eYw4eQdPU+hUDRjTgJSyICMb1rlRFy3rrwljddSFiIsyuafqTDuG2w3ZB7M?=
 =?us-ascii?Q?+WUUnjTooNLsM7f+WUpaNL89AM6DK4/nGA0LCEf/ygn+WC89fm34On4fQYUI?=
 =?us-ascii?Q?Tjxxl1IKflb6/ml/FE9rw2SzoRLLeeCjoXmxcEBNcEmidTzyf8d9gKuZ3965?=
 =?us-ascii?Q?Wmwuvd5BW1JnUhZ8DzyBf8wg3zYqHCn8f+UWLEVyIUhTwBAfLOaRyBk94Cr1?=
 =?us-ascii?Q?SaaZRIL9N3rxj9bVi/4dhYGYOuq0xd3n57tfet7i1CCH9QdwmrVt81cUr9Fz?=
 =?us-ascii?Q?LfWKtCFSt2UFrlIJBoXXJh9VDCcSzv+ac1ba3OKCLgAabu2yxFjqsLd1NdDj?=
 =?us-ascii?Q?l7iSaqe0RbQIV6jaKmb0116GGv+dXuOpi3SXEQgkyD6GZFjZEKxJFNU65U0a?=
 =?us-ascii?Q?fAFh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:53.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c14dd0-a36d-41c2-fe32-08d8b2b8b9d8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jClUwX2Z6HvSAkQZR4L0hyuSEs7h0qCb7aflWr723UJWiaGZQolaZotA61ZzKWVlBi1nlPIyo4blPboUOTTlWQ==
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

No overlap range interval [start, last] exist in svms object interval
tree. If process registers new range which has overlap with old range,
the old range split into 2 ranges depending on the overlap happens at
head or tail part of old range.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 297 ++++++++++++++++++++++++++-
 1 file changed, 294 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 02918faa70d5..ad007261f54c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -293,6 +293,278 @@ static void svm_range_debug_dump(struct svm_range_list *svms)
 	}
 }
 
+static bool
+svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
+{
+	return (old->prefetch_loc == new->prefetch_loc &&
+		old->flags == new->flags &&
+		old->granularity == new->granularity);
+}
+
+static int
+svm_range_split_pages(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	unsigned long old_start;
+	dma_addr_t *pages_addr;
+	uint64_t d;
+
+	old_start = old->it_node.start;
+	new->pages_addr = kvmalloc_array(new->npages,
+					 sizeof(*new->pages_addr),
+					 GFP_KERNEL | __GFP_ZERO);
+	if (!new->pages_addr)
+		return -ENOMEM;
+
+	d = new->it_node.start - old_start;
+	memcpy(new->pages_addr, old->pages_addr + d,
+	       new->npages * sizeof(*new->pages_addr));
+
+	old->npages = last - start + 1;
+	old->it_node.start = start;
+	old->it_node.last = last;
+
+	pages_addr = kvmalloc_array(old->npages, sizeof(*pages_addr),
+				    GFP_KERNEL);
+	if (!pages_addr) {
+		kvfree(new->pages_addr);
+		return -ENOMEM;
+	}
+
+	d = start - old_start;
+	memcpy(pages_addr, old->pages_addr + d,
+	       old->npages * sizeof(*pages_addr));
+
+	kvfree(old->pages_addr);
+	old->pages_addr = pages_addr;
+
+	return 0;
+}
+
+/**
+ * svm_range_split_adjust - split range and adjust
+ *
+ * @new: new range
+ * @old: the old range
+ * @start: the old range adjust to start address in pages
+ * @last: the old range adjust to last address in pages
+ *
+ * Copy system memory pages, pages_addr or vram mm_nodes in old range to new
+ * range from new_start up to size new->npages, the remaining old range is from
+ * start to last
+ *
+ * Return:
+ * 0 - OK, -ENOMEM - out of memory
+ */
+static int
+svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	int r = -EINVAL;
+
+	pr_debug("svms 0x%p new 0x%lx old [0x%lx 0x%lx] => [0x%llx 0x%llx]\n",
+		 new->svms, new->it_node.start, old->it_node.start,
+		 old->it_node.last, start, last);
+
+	if (new->it_node.start < old->it_node.start ||
+	    new->it_node.last > old->it_node.last) {
+		WARN_ONCE(1, "invalid new range start or last\n");
+		return -EINVAL;
+	}
+
+	if (old->pages_addr)
+		r = svm_range_split_pages(new, old, start, last);
+	else
+		WARN_ONCE(1, "split adjust invalid pages_addr and nodes\n");
+	if (r)
+		return r;
+
+	new->flags = old->flags;
+	new->preferred_loc = old->preferred_loc;
+	new->prefetch_loc = old->prefetch_loc;
+	new->actual_loc = old->actual_loc;
+	new->granularity = old->granularity;
+	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
+	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
+
+	return 0;
+}
+
+/**
+ * svm_range_split - split a range in 2 ranges
+ *
+ * @prange: the svm range to split
+ * @start: the remaining range start address in pages
+ * @last: the remaining range last address in pages
+ * @new: the result new range generated
+ *
+ * Two cases only:
+ * case 1: if start == prange->it_node.start
+ *         prange ==> prange[start, last]
+ *         new range [last + 1, prange->it_node.last]
+ *
+ * case 2: if last == prange->it_node.last
+ *         prange ==> prange[start, last]
+ *         new range [prange->it_node.start, start - 1]
+ *
+ * Context: Caller hold svms->rw_sem as write mode
+ *
+ * Return:
+ * 0 - OK, -ENOMEM - out of memory, -EINVAL - invalid start, last
+ */
+static int
+svm_range_split(struct svm_range *prange, uint64_t start, uint64_t last,
+		struct svm_range **new)
+{
+	uint64_t old_start = prange->it_node.start;
+	uint64_t old_last = prange->it_node.last;
+	struct svm_range_list *svms;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx] to [0x%llx 0x%llx]\n", prange->svms,
+		 old_start, old_last, start, last);
+
+	if (old_start != start && old_last != last)
+		return -EINVAL;
+	if (start < old_start || last > old_last)
+		return -EINVAL;
+
+	svms = prange->svms;
+	if (old_start == start) {
+		*new = svm_range_new(svms, last + 1, old_last);
+		if (!*new)
+			return -ENOMEM;
+		r = svm_range_split_adjust(*new, prange, start, last);
+	} else {
+		*new = svm_range_new(svms, old_start, start - 1);
+		if (!*new)
+			return -ENOMEM;
+		r = svm_range_split_adjust(*new, prange, start, last);
+	}
+
+	return r;
+}
+
+static int
+svm_range_split_two(struct svm_range *prange, struct svm_range *new,
+		    uint64_t start, uint64_t last,
+		    struct list_head *insert_list,
+		    struct list_head *update_list)
+{
+	struct svm_range *tail, *tail2;
+	int r;
+
+	r = svm_range_split(prange, prange->it_node.start, start - 1, &tail);
+	if (r)
+		return r;
+	r = svm_range_split(tail, start, last, &tail2);
+	if (r)
+		return r;
+	list_add(&tail2->list, insert_list);
+	list_add(&tail->list, insert_list);
+
+	if (!svm_range_is_same_attrs(prange, new))
+		list_add(&tail->update_list, update_list);
+
+	return 0;
+}
+
+static int
+svm_range_split_tail(struct svm_range *prange, struct svm_range *new,
+		     uint64_t start, struct list_head *insert_list,
+		     struct list_head *update_list)
+{
+	struct svm_range *tail;
+	int r;
+
+	r = svm_range_split(prange, prange->it_node.start, start - 1, &tail);
+	if (r)
+		return r;
+	list_add(&tail->list, insert_list);
+	if (!svm_range_is_same_attrs(prange, new))
+		list_add(&tail->update_list, update_list);
+
+	return 0;
+}
+
+static int
+svm_range_split_head(struct svm_range *prange, struct svm_range *new,
+		     uint64_t last, struct list_head *insert_list,
+		     struct list_head *update_list)
+{
+	struct svm_range *head;
+	int r;
+
+	r = svm_range_split(prange, last + 1, prange->it_node.last, &head);
+	if (r)
+		return r;
+	list_add(&head->list, insert_list);
+	if (!svm_range_is_same_attrs(prange, new))
+		list_add(&head->update_list, update_list);
+
+	return 0;
+}
+
+static int
+svm_range_split_add_front(struct svm_range *prange, struct svm_range *new,
+			  uint64_t start, uint64_t last,
+			  struct list_head *insert_list,
+			  struct list_head *update_list)
+{
+	struct svm_range *front, *tail;
+	int r = 0;
+
+	front = svm_range_new(prange->svms, start, prange->it_node.start - 1);
+	if (!front)
+		return -ENOMEM;
+
+	list_add(&front->list, insert_list);
+	list_add(&front->update_list, update_list);
+
+	if (prange->it_node.last > last) {
+		pr_debug("split old in 2\n");
+		r = svm_range_split(prange, prange->it_node.start, last, &tail);
+		if (r)
+			return r;
+		list_add(&tail->list, insert_list);
+	}
+	if (!svm_range_is_same_attrs(prange, new))
+		list_add(&prange->update_list, update_list);
+
+	return 0;
+}
+
+struct svm_range *svm_range_clone(struct svm_range *old)
+{
+	struct svm_range *new;
+
+	new = svm_range_new(old->svms, old->it_node.start, old->it_node.last);
+	if (!new)
+		return NULL;
+
+	if (old->pages_addr) {
+		new->pages_addr = kvmalloc_array(new->npages,
+						 sizeof(*new->pages_addr),
+						 GFP_KERNEL);
+		if (!new->pages_addr) {
+			kfree(new);
+			return NULL;
+		}
+		memcpy(new->pages_addr, old->pages_addr,
+		       old->npages * sizeof(*old->pages_addr));
+	}
+
+	new->flags = old->flags;
+	new->preferred_loc = old->preferred_loc;
+	new->prefetch_loc = old->prefetch_loc;
+	new->actual_loc = old->actual_loc;
+	new->granularity = old->granularity;
+	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
+	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
+
+	return new;
+}
+
 /**
  * svm_range_handle_overlap - split overlap ranges
  * @svms: svm range list header
@@ -334,15 +606,27 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 	node = interval_tree_iter_first(&svms->objects, start, last);
 	while (node) {
 		struct interval_tree_node *next;
+		struct svm_range *old;
 
 		pr_debug("found overlap node [0x%lx 0x%lx]\n", node->start,
 			 node->last);
 
-		prange = container_of(node, struct svm_range, it_node);
+		old = container_of(node, struct svm_range, it_node);
 		next = interval_tree_iter_next(node, start, last);
 
+		prange = svm_range_clone(old);
+		if (!prange) {
+			r = -ENOMEM;
+			goto out;
+		}
+
+		list_add(&old->remove_list, remove_list);
+		list_add(&prange->list, insert_list);
+
 		if (node->start < start && node->last > last) {
 			pr_debug("split in 2 ranges\n");
+			r = svm_range_split_two(prange, new, start, last,
+						insert_list, update_list);
 			start = last + 1;
 
 		} else if (node->start < start) {
@@ -352,11 +636,15 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 			 */
 			uint64_t old_last = node->last;
 
+			pr_debug("change old range last\n");
+			r = svm_range_split_tail(prange, new, start,
+						 insert_list, update_list);
 			start = old_last + 1;
 
 		} else if (node->start == start && node->last > last) {
 			pr_debug("change old range start\n");
-
+			r = svm_range_split_head(prange, new, last,
+						 insert_list, update_list);
 			start = last + 1;
 
 		} else if (node->start == start) {
@@ -364,12 +652,15 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 				pr_debug("found exactly same range\n");
 			else
 				pr_debug("next loop to add remaining range\n");
+			if (!svm_range_is_same_attrs(prange, new))
+				list_add(&prange->update_list, update_list);
 
 			start = node->last + 1;
 
 		} else { /* node->start > start */
 			pr_debug("add new range at front\n");
-
+			r = svm_range_split_add_front(prange, new, start, last,
+						      insert_list, update_list);
 			start = node->last + 1;
 		}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
