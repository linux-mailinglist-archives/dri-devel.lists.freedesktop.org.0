Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD896ACC567
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CD010E5DD;
	Tue,  3 Jun 2025 11:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QdMnI1Mj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B4410E5FF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKCZGnZcaA+F9UvBvLlnfCTHe4541aq7WYgejYeMjCI=; b=QdMnI1Mjdj/RQjQgkcyg8FdQ1u
 uu6aEJ72TmOYxzsiz3ZX9uDdfKoglb5NSeLGtjAQpGMEUdvmylxQHGyxPSwMDDVgoe1mSt6uA8mhh
 4YbtT0a/aLi6UKqQ8nfkVLTMIWAomdr4DNMLqQ9kJCC/5aQrILunbrCELPYmy3AB0QSAx0NMZjRxq
 k9aX1ZFF7OHIpxCSMDmkFGQWNF7QqZSAgLDHXg/pWtsud6V0qRwKUrFJ1uiPT2su1FPzQlQ0gGS/9
 HFpwOkR7XSA8kytUAOIhMV5NIWjiDfPxy9FC2DGmVSOnVLJTQnJehYB5li7UhgnD7UTZ5W1CAtCsf
 c5lS+3kw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uMPoA-00GeEp-Ky; Tue, 03 Jun 2025 13:27:54 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/2] drm/ttm: Increase pool shrinker batch target
Date: Tue,  3 Jun 2025 12:27:50 +0100
Message-ID: <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
References: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The default core shrink target of 128 pages (SHRINK_BATCH) is quite low
relative to how cheap TTM pool shrinking is, and how the free pages are
distributed in page order pools.

We can make the target a bit more aggressive by making it roughly the
average number of pages across all pools, freeing more of the cached
pages every time shrinker core invokes our callback.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c060c90b89c0..e671812789ea 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1265,10 +1265,16 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 }
 EXPORT_SYMBOL(ttm_pool_debugfs);
 
+/* Free average pool number of pages.  */
+#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
+
 /* Test the shrinker functions and dump the result */
 static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
+	struct shrink_control sc = {
+		.gfp_mask = GFP_NOFS,
+		.nr_to_scan = TTM_SHRINKER_BATCH,
+	};
 
 	fs_reclaim_acquire(GFP_KERNEL);
 	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
@@ -1326,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 
 	mm_shrinker->count_objects = ttm_pool_shrinker_count;
 	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->batch = TTM_SHRINKER_BATCH;
 	mm_shrinker->seeks = 1;
 
 	shrinker_register(mm_shrinker);
-- 
2.48.0

