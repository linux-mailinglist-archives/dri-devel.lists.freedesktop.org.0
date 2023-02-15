Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25C69806F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF4A10EB10;
	Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F26810E580;
 Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477726; x=1708013726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xm8ETaxZeJqXVpmDZaBdgzwHZhDfpl++98/mmYFZhMY=;
 b=MdTDt4G+Cts9G6KE9KowH6y9E/0q8fH4Xnow0VqszvAWal9rZKgHOzNo
 XTpi8rCOHvEziQAswHTXjAMcA7NJJtKWsiUV2Trn2xzl8JKmpVLSt0sBM
 q9jjDrja+z46SFncSAXzYNA/CultyxRseIVy1Wa2+r3XI+FQuTLJAjchX
 RxguWk/4q2qatmrcNT+w777bNmfDB/rjgeunGEwrqoPAiqvzsH0fhQ+oX
 3L4ydiPBnAzFNfFMCrWnOi8aYDFNe9+aDfrQnzXLolz+Y+JBoFV0EutFw
 E34gkBZAMUcmAlNRYeXiwtzyWCmVro1XFqxfwiJDWcCjlerHEXVjKJTlp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871053"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472576"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472576"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 11/16] drm/ttm: Add a simple api to set / clear purgeable
 ttm_tt content
Date: Wed, 15 Feb 2023 17:14:00 +0100
Message-Id: <20230215161405.187368-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the absence of free swap space, a shrinker could still efficiently
free memory the content of which is no longer needed, and graphics
drivers typically has an interface to mark buffer object content as
no longer needed.

Add a possibility to propagate this to TTM, so that the shrinker
accounting and shrinker actions can be updated accordingly.

Moving forward, we will probably want this interface on the bo level and
have bo move support for it, but for now we strictly only need it for
the shrinker. Another option would be to have the drivers do the
purgeable vs shrinkable accounting.

This still leaves the responsibility to the driver to assign proper
LRU priority to purgeable buffer object so that the shrinker finds those
objects early during LRU traversal.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 59 ++++++++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_tt.h     |  3 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index a39c617c7a8e..c63be8f5ed2a 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -105,6 +105,65 @@ void ttm_tt_set_unpinned(const struct ttm_device *bdev, const struct ttm_tt *tt)
 		ttm_tt_mod_shrinkable_pages(tt->num_pages, 0);
 }
 
+/**
+ * ttm_tt_set_dontneed() - Mark ttm_tt content as not needed.
+ * @bdev: The ttm device.
+ * @tt: The struct ttm_tt.
+ *
+ * Mark the ttm_tt content as not needed for the shrinker accounting.
+ * This also means that the content will not be backed up on shrinking,
+ * but rather freed immediately.
+ *
+ * Return: 0 if successful, -EALREADY if content was never present or
+ * already backed up and was purged by this call.
+ */
+int ttm_tt_set_dontneed(const struct ttm_device *bdev, struct ttm_tt *tt)
+{
+	if (ttm_tt_is_populated(tt)) {
+		if (!ttm_tt_purgeable(tt)) {
+			tt->page_flags |= TTM_TT_FLAG_DONTNEED;
+			if (ttm_tt_shrinkable(bdev, tt))
+				ttm_tt_mod_shrinkable_pages(-(long)tt->num_pages,
+							    tt->num_pages);
+		}
+		return 0;
+	}
+
+	if (tt->swap_storage)
+		fput(tt->swap_storage);
+	tt->swap_storage = NULL;
+
+	return -EALREADY;
+}
+EXPORT_SYMBOL(ttm_tt_set_dontneed);
+
+/**
+ * ttm_tt_set_willneed() - Mark tt_tt content as needed.
+ * @bdev: The ttm device.
+ * @tt: The struct ttm_tt.
+ *
+ * Mark the ttm_tt content as needed and update the shrinker accounting
+ * accordingly.
+ *
+ * Return: 0 if successful, -EALREADY if content was never present or
+ * was already purged.
+ */
+int ttm_tt_set_willneed(const struct ttm_device *bdev, struct ttm_tt *tt)
+{
+	if (ttm_tt_is_populated(tt)) {
+		if (ttm_tt_purgeable(tt)) {
+			tt->page_flags &= ~TTM_TT_FLAG_DONTNEED;
+			if (ttm_tt_shrinkable(bdev, tt))
+				ttm_tt_mod_shrinkable_pages(tt->num_pages,
+							    -(long)tt->num_pages);
+		}
+		return 0;
+	}
+
+	return -EALREADY;
+}
+EXPORT_SYMBOL(ttm_tt_set_willneed);
+
 /*
  * Allocates a ttm structure for the given BO.
  */
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 69467671c2dd..abb17527f76c 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -241,6 +241,9 @@ static inline bool ttm_tt_purgeable(struct ttm_tt *tt)
 void ttm_tt_set_pinned(const struct ttm_device *bdev, const struct ttm_tt *tt);
 
 void ttm_tt_set_unpinned(const struct ttm_device *bdev, const struct ttm_tt *tt);
+int ttm_tt_set_dontneed(const struct ttm_device *bdev, struct ttm_tt *tt);
+
+int ttm_tt_set_willneed(const struct ttm_device *bdev, struct ttm_tt *tt);
 
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
-- 
2.34.1

