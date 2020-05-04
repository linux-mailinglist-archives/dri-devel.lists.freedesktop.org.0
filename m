Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B71C3720
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 12:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476C6E366;
	Mon,  4 May 2020 10:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B766E366
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 10:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZS0G5NKl384103OcTWahOezVnO6zyPxr7P9VUKOoqdcDshd3M/HNtDS66+uw/8M05ZufekoSK/5nyocbeFWjSHWgjngqB47qVlBgH7lGSUgLAMVMDVwmwBbjIWPvL/OPg1q5QxqYsT4fEVY4Ay8Xcq7ZAq2mw+rGx65lPZv4ZAX9qAH9Erp5COFmxsAvFkJ8cvjdDzb1EPBGm8HqyjTSKkEbUhqqKsX5ry/BFgxHVGb2+RT/+cb+iJsETimJOs2tchj69f4kYrsSwDbdQEbYDSX4zXZsQfKYHU+JfGZV7qZbUddJW5o950J7t0B8aId2QFk48/9Zx4ST0afT5dWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5fdLriyYiSx1dz+qNs/lMMm/FI8u4AYK7g3js8UJX8=;
 b=lgX0XGS2JiiqTBRn9rHr75DjclYCDx619Ha3+0QPg2zdZOwIq/O77cEECkWx0dAfOdGyEE4JbFrYrSU1+nYIygES6rVNcTUVK5J3USavP+jxrhewCvhcIufm9VEsQghebyV22B61WS2Xkuk0oJcI5jNP1JeskCZl1T3xDcl/4ZJTHF9X4vvY6aJ6NBLXL3WhTDDpe+pwqPTvm88Fk4KdQjlj5J4okJYHx2C4PLyhNFtlQgB+lKCpOFnVlMjvpXpkrZBmBIQO0/HQH+UL3NK9lwZ9ho0CCKJxQIx6khkw7qTBfWlsIgXqOGT13l3h1Y6lyNPQWogawRK7oaIzRPp9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5fdLriyYiSx1dz+qNs/lMMm/FI8u4AYK7g3js8UJX8=;
 b=jlsTPeGUCgepHpzVmvZe9aiPAZwMm9JFaRBGYMkNpHirEZyk2VqPTTGP9RoZirTPFj3LGpK1dixf/+l3rVUhryPNCGYEX2cQb4tXJrfzwmd55VUKOwCmHRp4VVVKF/5hU8Eu6hi1ygDbdPzAnAJRIrDqOwiao2O/u7hQGFtRdvw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3535.namprd12.prod.outlook.com (2603:10b6:208:105::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Mon, 4 May
 2020 10:43:11 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c%7]) with mapi id 15.20.2958.029; Mon, 4 May 2020
 10:43:11 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/mm: optimize rb_hole_addr rbtree search
Date: Mon,  4 May 2020 12:42:48 +0200
Message-Id: <20200504104248.10304-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.1
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (2003:c5:8f23:4600:361c:5d25:fe6c:c56f) by
 FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Mon, 4 May 2020 10:43:09 +0000
X-Mailer: git-send-email 2.26.1
X-Originating-IP: [2003:c5:8f23:4600:361c:5d25:fe6c:c56f]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af193f1d-0a4c-40be-703e-08d7f017f075
X-MS-TrafficTypeDiagnostic: MN2PR12MB3535:|MN2PR12MB3535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB353575E087FF8521D66ADC5D8BA60@MN2PR12MB3535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ScJFua9iTH5+noJeVRQsTFX6QmtBCz99vKiAQp+mumnwDRVj7pKVVkSd0Vx9tgdRDkyHCVWNLbu/UPp8Ts1ru4vAl2FQ8SlOO/v5jh3OnD4/NBLGgyWRRImMF30QgaTNGjQ2fgcFeHOpi1FAEROkCMmtEYQbZgbDj1c+ObP9mvF0DEwkO7d3mpocUNNHAjpAIn+mDEzMgJvna/Te7tIIvXd3etSASYVjrmlviA3r7HZ3ffQLk4mcxIei+VdHM9H3gmwPXjo3vQmKy8+2Z4Ynd7G+rVa5yeXVU6Ex+km0fS5lQtZMBmtLd7TMIq7fLnxDFY93z9Uq6vADRjI5VnBDpDRHlD2oNdtP1s+Bc5EF0PcNlsXGrA9kqss5oY+r2AYRGF54tr1bptXZC28JL8edyVx9q3WuaE3+6IQSgwEAVWbbysIs9/dI6DaYrgpBHNgd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(6916009)(16526019)(6666004)(2616005)(44832011)(2906002)(36756003)(66476007)(4326008)(1076003)(478600001)(5660300002)(66556008)(66946007)(86362001)(52116002)(6512007)(6506007)(8676002)(54906003)(186003)(6486002)(8936002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6rYoVGd8kht/hGxD/4VE5kj+iJzb6sUhvDfinYMUwGXOw5IisFnvlUqk8TpoeEkAm+QsvK6oD3otvZL/PFluRZmn3R373JRHgQXJAfy//WKlzRm5/3cpwp63XS6EN/bcK29Maxz7n/bKgPxlLKoj2I/neyIvuR08+o5z25A6JZ9gU0PiSh7nk/ZUH5fdPtql0VQUN53o1g7G7Zo83z/h776C/Q4y9ppN7lUeYFfOY0EESSPUs1ImVeb6Yyc6KVt09tJ83CV3AsZloCG95HkPjq/HDQrCHs9Vti7HT1cco5Q4jm3j7KHX02BtIRuMrJiMynK1jqWoas0PwmLFtx3OENpZ0ZpTZxRK/5VCfERvFZ6jiF+rDUnEHfwAtI4ZejUwraOroSgxJmQl6MLf82/8Yu3lISuqLNi7S4RpcO9cVugLoSKD7sYQ2AbXfN5Lv8c1Dv08KtahLyxjiRD3waYfCa0lOvmWYF/ZgGjBIQxoptlygms0PGi4pojagg1BKc5XLKK1Ve080Oq+WkOT9w7JcNBMUUWZsJziTNE9/OhhgjGpo2s0CEC789w8P7cxV9vofcr3iXQBe2QzIFwnaKdadg53uk1xs3+M7/b30+OOnDaBqpkzKYh2zzQFUXBxOld53EZL1p4w4Z2ji6CObQAU5Anr0DwI/GA4qeEayvbh2dUceacD5+cAN857vgmddGCAlQxRHIdMlbqUFZauWF+H8W5SiOVut0i0qFk6c/fLp1WLAQBQIiw4QVa1EuvS4+VkznkbcKH6VHMnFtjUfKN2EKbO4uOktVaFdRcj2UGcGZzwb7NSVlGnBJdPz+9grjqW5YQtB67q0c8bWRfSwinaemmNxj3XQIDl2cftKT12dys=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af193f1d-0a4c-40be-703e-08d7f017f075
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 10:43:11.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGwx9rKs+901g3B8NhF8442g2NCR2uL/iwtacIBlg3cfnIhKJWjJG6a8VsJ6hxxkFeqav7/VcLs+WTWz6lHhKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3535
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
Cc: kbuild test robot <lkp@intel.com>, nirmoy.aiemd@gmail.com,
 Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com,
 chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can severely fragment rb_hole_addr rbtree by manipulating
alignment while allocating buffers. Fragmented rb_hole_addr rbtree
would result in large delays while allocating buffer object for a
userspace application. It takes long time to find suitable hole
because if we fail to find a suitable hole in the first attempt
then we look for neighbouring nodes using rb_prev()/rb_next().
Traversing rbtree using rb_prev()/rb_next() can take really long
time if the tree is fragmented.

This patch improves searches in fragmented rb_hole_addr rbtree by
modifying it to an augmented rbtree which will store an extra field
in drm_mm_node, subtree_max_hole. Each drm_mm_node now stores maximum
hole size for its subtree in drm_mm_node->subtree_max_hole. Using
drm_mm_node->subtree_max_hole, it is possible to eliminate complete subtree
if that subtree is unable to serve a request hence reducing number of
rb_prev()/rb_next() used.

With this patch applied, 1 million bo allocations on amdgpu took ~8 sec and
without the patch the test code took 28 sec for only 50k bo allocs.

partial test code:
int test_fragmentation(void)
{

	int i = 0;
        uint32_t  minor_version;
        uint32_t  major_version;

        struct amdgpu_bo_alloc_request request = {};
        amdgpu_bo_handle vram_handle[MAX_ALLOC] = {};
        amdgpu_device_handle device_handle;

        request.alloc_size = 4096;
        request.phys_alignment = 8192;
        request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;

        int fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
        amdgpu_device_initialize(fd, &major_version,  &minor_version,
				 &device_handle);

        for (i = 0; i < MAX_ALLOC; i++) {
                amdgpu_bo_alloc(device_handle, &request, &vram_handle[i]);
        }

        for (i = 0; i < MAX_ALLOC; i++)
                amdgpu_bo_free(vram_handle[i]);

        return 0;
}

v2:
Use RB_DECLARE_CALLBACKS_MAX to maintain subtree_max_hole
v3:
insert_hole_addr() should be static a function
fix return value of next_hole_high_addr()/next_hole_low_addr()
Reported-by: kbuild test robot <lkp@intel.com>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/drm_mm.c | 133 +++++++++++++++++++++++++++++++++------
 include/drm/drm_mm.h     |   1 +
 2 files changed, 115 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8981abe8b7c9..f4ca1ff80af9 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -212,20 +212,6 @@ static void drm_mm_interval_tree_add_node(struct drm_mm_node *hole_node,
 				   &drm_mm_interval_tree_augment);
 }
 
-#define RB_INSERT(root, member, expr) do { \
-	struct rb_node **link = &root.rb_node, *rb = NULL; \
-	u64 x = expr(node); \
-	while (*link) { \
-		rb = *link; \
-		if (x < expr(rb_entry(rb, struct drm_mm_node, member))) \
-			link = &rb->rb_left; \
-		else \
-			link = &rb->rb_right; \
-	} \
-	rb_link_node(&node->member, rb, link); \
-	rb_insert_color(&node->member, &root); \
-} while (0)
-
 #define HOLE_SIZE(NODE) ((NODE)->hole_size)
 #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
 
@@ -255,16 +241,42 @@ static void insert_hole_size(struct rb_root_cached *root,
 	rb_insert_color_cached(&node->rb_hole_size, root, first);
 }
 
+RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
+			 struct drm_mm_node, rb_hole_addr,
+			 u64, subtree_max_hole, HOLE_SIZE)
+
+static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
+{
+	struct rb_node **link = &root->rb_node, *rb_parent = NULL;
+	u64 start = HOLE_ADDR(node), subtree_max_hole = node->subtree_max_hole;
+	struct drm_mm_node *parent;
+
+	while (*link) {
+		rb_parent = *link;
+		parent = rb_entry(rb_parent, struct drm_mm_node, rb_hole_addr);
+		if (parent->subtree_max_hole < subtree_max_hole)
+			parent->subtree_max_hole = subtree_max_hole;
+		if (start < HOLE_ADDR(parent))
+			link = &parent->rb_hole_addr.rb_left;
+		else
+			link = &parent->rb_hole_addr.rb_right;
+	}
+
+	rb_link_node(&node->rb_hole_addr, rb_parent, link);
+	rb_insert_augmented(&node->rb_hole_addr, root, &augment_callbacks);
+}
+
 static void add_hole(struct drm_mm_node *node)
 {
 	struct drm_mm *mm = node->mm;
 
 	node->hole_size =
 		__drm_mm_hole_node_end(node) - __drm_mm_hole_node_start(node);
+	node->subtree_max_hole = node->hole_size;
 	DRM_MM_BUG_ON(!drm_mm_hole_follows(node));
 
 	insert_hole_size(&mm->holes_size, node);
-	RB_INSERT(mm->holes_addr, rb_hole_addr, HOLE_ADDR);
+	insert_hole_addr(&mm->holes_addr, node);
 
 	list_add(&node->hole_stack, &mm->hole_stack);
 }
@@ -275,8 +287,10 @@ static void rm_hole(struct drm_mm_node *node)
 
 	list_del(&node->hole_stack);
 	rb_erase_cached(&node->rb_hole_size, &node->mm->holes_size);
-	rb_erase(&node->rb_hole_addr, &node->mm->holes_addr);
+	rb_erase_augmented(&node->rb_hole_addr, &node->mm->holes_addr,
+			   &augment_callbacks);
 	node->hole_size = 0;
+	node->subtree_max_hole = 0;
 
 	DRM_MM_BUG_ON(drm_mm_hole_follows(node));
 }
@@ -361,9 +375,90 @@ first_hole(struct drm_mm *mm,
 	}
 }
 
+/**
+ * next_hole_high_addr - returns next hole for a DRM_MM_INSERT_HIGH mode request
+ * @entry: previously selected drm_mm_node
+ * @size: size of the a hole needed for the request
+ *
+ * This function will verify whether left subtree of @entry has hole big enough
+ * to fit the requtested size. If so, it will return previous node of @entry or
+ * else it will return parent node of @entry
+ *
+ * It will also skip the complete left subtree if subtree_max_hole of that
+ * subtree is same as the subtree_max_hole of the @entry.
+ *
+ * Returns:
+ * previous node of @entry if left subtree of @entry can serve the request or
+ * else return parent of @entry
+ */
+static struct drm_mm_node *
+next_hole_high_addr(struct drm_mm_node *entry, u64 size)
+{
+	struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
+	struct drm_mm_node *left_node;
+
+	if (!entry)
+		return NULL;
+
+	rb_node = &entry->rb_hole_addr;
+	if (rb_node->rb_left) {
+		left_rb_node = rb_node->rb_left;
+		parent_rb_node = rb_parent(rb_node);
+		left_node = rb_entry(left_rb_node,
+				     struct drm_mm_node, rb_hole_addr);
+		if ((left_node->subtree_max_hole < size ||
+		     entry->size == entry->subtree_max_hole) &&
+		    parent_rb_node && parent_rb_node->rb_left != rb_node)
+			return rb_hole_addr_to_node(parent_rb_node);
+	}
+
+	return rb_hole_addr_to_node(rb_prev(rb_node));
+}
+
+/**
+ * next_hole_low_addr - returns next hole for a DRM_MM_INSERT_LOW mode request
+ * @entry: previously selected drm_mm_node
+ * @size: size of the a hole needed for the request
+ *
+ * This function will verify whether right subtree of @entry has hole big enough
+ * to fit the requtested size. If so, it will return next node of @entry or
+ * else it will return parent node of @entry
+ *
+ * It will also skip the complete right subtree if subtree_max_hole of that
+ * subtree is same as the subtree_max_hole of the @entry.
+ *
+ * Returns:
+ * next node of @entry if right subtree of @entry can serve the request or
+ * else return parent of @entry
+ */
+static struct drm_mm_node *
+next_hole_low_addr(struct drm_mm_node *entry, u64 size)
+{
+	struct rb_node *rb_node, *right_rb_node, *parent_rb_node;
+	struct drm_mm_node *right_node;
+
+	if (!entry)
+		return NULL;
+
+	rb_node = &entry->rb_hole_addr;
+	if (rb_node->rb_right) {
+		right_rb_node = rb_node->rb_right;
+		parent_rb_node = rb_parent(rb_node);
+		right_node = rb_entry(right_rb_node,
+				      struct drm_mm_node, rb_hole_addr);
+		if ((right_node->subtree_max_hole < size ||
+		     entry->size == entry->subtree_max_hole) &&
+		    parent_rb_node && parent_rb_node->rb_right != rb_node)
+			return rb_hole_addr_to_node(parent_rb_node);
+	}
+
+	return rb_hole_addr_to_node(rb_next(rb_node));
+}
+
 static struct drm_mm_node *
 next_hole(struct drm_mm *mm,
 	  struct drm_mm_node *node,
+	  u64 size,
 	  enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
@@ -372,10 +467,10 @@ next_hole(struct drm_mm *mm,
 		return rb_hole_size_to_node(rb_prev(&node->rb_hole_size));
 
 	case DRM_MM_INSERT_LOW:
-		return rb_hole_addr_to_node(rb_next(&node->rb_hole_addr));
+		return next_hole_low_addr(node, size);
 
 	case DRM_MM_INSERT_HIGH:
-		return rb_hole_addr_to_node(rb_prev(&node->rb_hole_addr));
+		return next_hole_high_addr(node, size);
 
 	case DRM_MM_INSERT_EVICT:
 		node = list_next_entry(node, hole_stack);
@@ -489,7 +584,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
 	for (hole = first_hole(mm, range_start, range_end, size, mode);
 	     hole;
-	     hole = once ? NULL : next_hole(mm, hole, mode)) {
+	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
 		u64 hole_start = __drm_mm_hole_node_start(hole);
 		u64 hole_end = hole_start + hole->hole_size;
 		u64 adj_start, adj_end;
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ee8b0e80ca90..a01bc6fac83c 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -168,6 +168,7 @@ struct drm_mm_node {
 	struct rb_node rb_hole_addr;
 	u64 __subtree_last;
 	u64 hole_size;
+	u64 subtree_max_hole;
 	unsigned long flags;
 #define DRM_MM_NODE_ALLOCATED_BIT	0
 #define DRM_MM_NODE_SCANNED_BIT		1
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
