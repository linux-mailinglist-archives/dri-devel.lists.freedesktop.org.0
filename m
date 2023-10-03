Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAD7B6326
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 10:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FE910E261;
	Tue,  3 Oct 2023 08:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36910E259
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696320326; x=1727856326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ocd1PVVgB8FbEUS5R3uP96wQnUqQO7DOI3QH4iInWew=;
 b=E9m1fBFGLIabmOYNwmthKB/6sq46SB6w4RBmooqfZVDAs67OrmbSImKS
 KZ8wy/9ez9Cd1K+QPAdElQQj1xVL/XfxFr2FHqU8hBKRorNmKjU8XS9CB
 LJHnjF9BdxxWbJc2G5WcNgF55IrVIGuxBy7mHhWbb75cFRnwQkAd6y/9h
 Um1Ss/7PKIUqheZI7LLP2X0111P258ZP4Z7nnMNXxNjF/vo2uRqqhvE3S
 +UYxrZl/HuGnbzZMJo+D2YXCfe/u+8Pbq/T7ki2M7n6vDAX7z1ok3/YG4
 /0fPS8R1OFPb+bRIe4870gaoocba6z43z46b39tnjVVvxbmn9lrGbukip A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449306985"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="449306985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700615287"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="700615287"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:05:25 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Date: Tue,  3 Oct 2023 00:44:45 -0700
Message-Id: <20231003074447.3245729-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For drivers that would like to longterm-pin the pages associated
with a file, the pin_user_pages_fd() API provides an option to
not only FOLL_PIN the pages but also to check and migrate them
if they reside in movable zone or CMA block. For now, this API
can only work with files belonging to shmem or hugetlbfs given
that the udmabuf driver is the only user.

It must be noted that the pages associated with hugetlbfs files
are expected to be found in the page cache. An error is returned
if they are not found. However, shmem pages can be swapped in or
allocated if they are not present in the page cache.

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 87 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf5d0b1b16f4..af2121fb8101 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2457,6 +2457,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
+		       unsigned int gup_flags, struct page **pages);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 2f8a2d89fde1..e34b77a15fa8 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3400,3 +3400,90 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 				     &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
+
+/**
+ * pin_user_pages_fd() - pin user pages associated with a file
+ * @fd:         the fd whose pages are to be pinned
+ * @start:      starting file offset
+ * @nr_pages:   number of pages from start to pin
+ * @gup_flags:  flags modifying pin behaviour
+ * @pages:      array that receives pointers to the pages pinned.
+ *              Should be at least nr_pages long.
+ *
+ * Attempt to pin (and migrate) pages associated with a file belonging to
+ * either shmem or hugetlbfs. An error is returned if pages associated with
+ * hugetlbfs files are not present in the page cache. However, shmem pages
+ * are swapped in or allocated if they are not present in the page cache.
+ *
+ * Returns number of pages pinned. This would be equal to the number of
+ * pages requested.
+ * If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns
+ * -errno.
+ */
+long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
+		       unsigned int gup_flags, struct page **pages)
+{
+	struct page *page;
+	struct file *filep;
+	unsigned int flags, i;
+	long ret;
+
+	if (nr_pages <= 0)
+		return 0;
+	if (!is_valid_gup_args(pages, NULL, &gup_flags, FOLL_PIN))
+		return 0;
+
+	if (start < 0)
+		return -EINVAL;
+
+	filep = fget(fd);
+	if (!filep)
+	    return -EINVAL;
+
+	if (!shmem_file(filep) && !is_file_hugepages(filep))
+	    return -EINVAL;
+
+	flags = memalloc_pin_save();
+	do {
+		for (i = 0; i < nr_pages; i++) {
+			if (shmem_mapping(filep->f_mapping)) {
+				page = shmem_read_mapping_page(filep->f_mapping,
+							       start + i);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
+			} else {
+				page = find_get_page_flags(filep->f_mapping,
+							   start + i,
+							   FGP_ACCESSED);
+				if (!page) {
+					ret = -EINVAL;
+					goto err;
+				}
+			}
+			ret = try_grab_page(page, FOLL_PIN);
+			if (unlikely(ret))
+				goto err;
+
+			pages[i] = page;
+			put_page(pages[i]);
+		}
+
+		ret = check_and_migrate_movable_pages(nr_pages, pages);
+	} while (ret == -EAGAIN);
+
+err:
+	memalloc_pin_restore(flags);
+	fput(filep);
+	if (!ret)
+		return nr_pages;
+
+	while (i > 0 && pages[--i]) {
+		unpin_user_page(pages[i]);
+		pages[i] = NULL;
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pin_user_pages_fd);
+
-- 
2.39.2

