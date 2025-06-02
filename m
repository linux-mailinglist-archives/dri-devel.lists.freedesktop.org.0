Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF8ACB796
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD1510E2B4;
	Mon,  2 Jun 2025 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cpWqVpzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC210E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GLgbsNeRT7605aMbIn3VWfEs2Veo5DnvPF3v95Li0fE=; b=cpWqVpzWuiLRfvIi3XibqeakMR
 5tMN5Rj2rwETw3p5421w39H25GaEneilY47PSWkxvXt3aL4QHPumtTJ8PcHISjCw9bvRtmJW5qUGz
 0KDcFD+yR0O7vAcarsDvo4ytCEIsHTnyqlLCaMR70flnU0G71WsNisV00y2np+QETLvysYXhWlRPx
 70uW1damfZWbbfvrFNQsG1cCYIcJBiXzVDH6jOvdIN8bvGAdNyaBeMtlMDSIUgUJw5vLUo472ABF0
 OA/w6bqlz0CBgbdyFMNAtqQMrAPsL2Vsljx0nafwQmPXbk3Qv3glCsl4vDOf3LC8Ir/1LALQUkpGB
 79kuWiww==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM76V-00GKNm-Tx; Mon, 02 Jun 2025 17:29:36 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/ttm: Respect the shrinker core free target
Date: Mon,  2 Jun 2025 16:29:28 +0100
Message-ID: <20250602152929.18017-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250602152929.18017-1-tvrtko.ursulin@igalia.com>
References: <20250602152929.18017-1-tvrtko.ursulin@igalia.com>
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

Currently the TTM shrinker aborts shrinking as soon as it frees pages from
any of the page order pools and by doing so it can fail to respect the
freeing target which was configured by the shrinker core.

We use the wording "can fail" because the number of freed pages will
depend on the presence of pages in the pools and the order of the pools on
the LRU list. For example if there are no free pages in the high order
pools the shrinker core may require multiple passes over the TTM shrinker
before it will free the default target of 128 pages (assuming there are
free pages in the low order pools). This inefficiency can be compounded by
the pool LRU where multiple further calls into the TTM shrinker are
required to end up looking at the pool with pages.

Improve this by never freeing less than the shrinker core has requested.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c2ea865be657..a3247a82cadd 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1132,17 +1132,24 @@ void ttm_pool_fini(struct ttm_pool *pool)
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
-/* As long as pages are available make sure to release at least one */
 static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
 					    struct shrink_control *sc)
 {
-	unsigned long num_freed = 0;
+	unsigned long to_scan, freed = 0;
 
-	do
-		num_freed += ttm_pool_shrink();
-	while (!num_freed && atomic_long_read(&allocated_pages));
+	to_scan = min_t(unsigned long,
+			sc->nr_to_scan,
+			atomic_long_read(&allocated_pages));
+	while (freed < to_scan) {
+		freed += ttm_pool_shrink();
+		to_scan = min_t(unsigned long,
+				to_scan,
+				atomic_long_read(&allocated_pages));
+	}
 
-	return num_freed;
+	sc->nr_scanned = freed;
+
+	return freed ?: SHRINK_STOP;
 }
 
 /* Return the number of pages available or SHRINK_EMPTY if we have none */
@@ -1266,8 +1273,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
 /* Test the shrinker functions and dump the result */
 static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
-
+	struct shrink_control sc = {
+		.gfp_mask = GFP_NOFS,
+		.nr_to_scan = 1,
+	};
 	fs_reclaim_acquire(GFP_KERNEL);
 	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
 		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
-- 
2.48.0

