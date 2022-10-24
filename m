Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98EC60ADD1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6033410E7D8;
	Mon, 24 Oct 2022 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95B10E7CF;
 Mon, 24 Oct 2022 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666622123; x=1698158123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WbPfsf0yN6FHY+EJdO9EiJg7ZFOJvup5BrmXHqJSxzU=;
 b=Eu44V1vBD16QNQ/zVh7zGlROY6BetAB2Jxh13bu5BhvVxvsif9nfnOkC
 rFDrSHeISTRIPZwERA1MIs4ZupEZm1EIoBkufKg+yYdi1YFKHfFORteHK
 F3kj7/rJigKfDk8OYf8nKyKgImIIdDSwlY+iBDttv2BILJOcpK0ZBR4u7
 DpurnbtYqbO+6aTe6y+XwhYVVOhLtqtPyKd8VjN0mntb1kKwN9a33FnWY
 d6MnvHSLhkM6TlSk2E0J6akn1z/uLDzdcpJryFkZ1LdZZY9w0rmopGP5d
 DT0Ca1J9L4geh76jcjrlNr7N30WJSAoCASER7svkBAwpM04m0Yr9e7owi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287830251"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287830251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:34:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="960450498"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="960450498"
Received: from amaceyx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.236.254])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:34:39 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI] mm/huge_memory: do not clobber swp_entry_t during THP split
Date: Mon, 24 Oct 2022 15:34:33 +0100
Message-Id: <20221024143433.4149839-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mel Gorman <mgorman@techsingularity.net>

On Mon, Oct 24, 2022 at 02:04:50PM +0100, Tvrtko Ursulin wrote:
>
> Hi Mel, mm experts,
>
> With 6.1-rc2 we started hitting the WARN_ON added in 71e2d666ef85 ("mm/huge_memory: do not clobber swp_entry_t during THP split") in i915 automated CI:
>

Thanks for the report. As shmem pages pages are allocated via vma_alloc_folio
and are compound pages, can you try the following patch please?  If it
still triggers, please post the new oops as it'll include the tail page
information.

--8<--
From: Hugh Dickins <hughd@google.com>
Subject: [PATCH] mm: prep_compound_tail() clear page->private

Although page allocation always clears page->private in the first page
or head page of an allocation, it has never made a point of clearing
page->private in the tails (though 0 is often what is already there).

But now commit 71e2d666ef85 ("mm/huge_memory: do not clobber swp_entry_t
during THP split") issues a warning when page_tail->private is found to
be non-0 (unless it's swapcache).

Change that warning to dump page_tail (which also dumps head), instead
of just the head: so far we have seen dead000000000122, dead000000000003,
dead000000000001 or 0000000000000002 in the raw output for tail private.

We could just delete the warning, but today's consensus appears to want
page->private to be 0, unless there's a good reason for it to be set:
so now clear it in prep_compound_tail() (more general than just for THP;
but not for high order allocation, which makes no pass down the tails).

Fixes: 71e2d666ef85 ("mm/huge_memory: do not clobber swp_entry_t during THP split")
Signed-off-by: Hugh Dickins <hughd@google.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: <stable@vger.kernel.org>
---
 mm/huge_memory.c | 2 +-
 mm/page_alloc.c  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 03fc7e5edf07..561a42567477 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2462,7 +2462,7 @@ static void __split_huge_page_tail(struct page *head, int tail,
 	 * Fix up and warn once if private is unexpectedly set.
 	 */
 	if (!folio_test_swapcache(page_folio(head))) {
-		VM_WARN_ON_ONCE_PAGE(page_tail->private != 0, head);
+		VM_WARN_ON_ONCE_PAGE(page_tail->private != 0, page_tail);
 		page_tail->private = 0;
 	}
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b5a6c815ae28..218b28ee49ed 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -807,6 +807,7 @@ static void prep_compound_tail(struct page *head, int tail_idx)
 
 	p->mapping = TAIL_MAPPING;
 	set_compound_head(p, head);
+	set_page_private(p, 0);
 }
 
 void prep_compound_page(struct page *page, unsigned int order)
-- 
2.34.1

