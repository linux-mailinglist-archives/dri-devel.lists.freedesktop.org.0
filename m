Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFBEACC566
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356E10E5D8;
	Tue,  3 Jun 2025 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z9cvDeMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AA110E5FC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g9u8MuOctdMhat2e1mBoERVIAZ2a3umZ2In0HCNuT4A=; b=Z9cvDeMGnHCeIlaisVfAGAMIqM
 M1CXmGpiCp9rf8+d0bzm/1HxfZ9Wqmyv3It+NWroBpmnvNE6OCogZWnqWvVyBI6QObt7c5WsuaPU9
 hM/VDVnUKHufB7sJO5pmv9mM0ETDwImHf4lPnWfn0e2kNlHhUpTpBbu1mNO+66SC3TB594dpSEvwR
 5DCGRKnq+mDY9seCRXvlxq3aGc9BLygoSEFWJL2jfzusYQM2l8pUNjFX1yYZABVspANos6Df+3XWd
 8nrLiB5BOlssvIr/zg1N7++g6rAvGvgoWlwzqzmbmdbHlBYyMcSpJ77gJoFO4l/Wh54ZWUXTvndmK
 7PQLgDwA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uMPo9-00GeEe-SL; Tue, 03 Jun 2025 13:27:53 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/2] drm/ttm: Respect the shrinker core free target
Date: Tue,  3 Jun 2025 12:27:49 +0100
Message-ID: <20250603112750.34997-2-tvrtko.ursulin@igalia.com>
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

At the same time we start reporting the number of scanned pages (freed in
this case), which prevents the core shrinker from giving up on the TTM
shrinker too soon and moving on.

v2:
 * Simplify loop logic. (Christian)
 * Improve commit message.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c2ea865be657..c060c90b89c0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1132,7 +1132,6 @@ void ttm_pool_fini(struct ttm_pool *pool)
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
-/* As long as pages are available make sure to release at least one */
 static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
 					    struct shrink_control *sc)
 {
@@ -1140,9 +1139,12 @@ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
 
 	do
 		num_freed += ttm_pool_shrink();
-	while (!num_freed && atomic_long_read(&allocated_pages));
+	while (num_freed < sc->nr_to_scan &&
+	       atomic_long_read(&allocated_pages));
 
-	return num_freed;
+	sc->nr_scanned = num_freed;
+
+	return num_freed ?: SHRINK_STOP;
 }
 
 /* Return the number of pages available or SHRINK_EMPTY if we have none */
-- 
2.48.0

