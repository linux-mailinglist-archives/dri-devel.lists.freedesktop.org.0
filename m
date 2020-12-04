Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A942CF245
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 17:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D6A6E1B1;
	Fri,  4 Dec 2020 16:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7596F6E1B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 16:52:03 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Madhav Chauhan <madhav.chauhan@amd.com>
Subject: [PATCH] drm/ttm: fix unused function warning
Date: Fri,  4 Dec 2020 17:51:52 +0100
Message-Id: <20201204165158.3748141-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

ttm_pool_type_count() is not used when debugfs is disabled:

drivers/gpu/drm/ttm/ttm_pool.c:243:21: error: unused function 'ttm_pool_type_count' [-Werror,-Wunused-function]
static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)

Move the definition into the #ifdef block.

Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 5455b2044759..7b2f60616750 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -239,21 +239,6 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
 	return p;
 }
 
-/* Count the number of pages available in a pool_type */
-static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
-{
-	unsigned int count = 0;
-	struct page *p;
-
-	spin_lock(&pt->lock);
-	/* Only used for debugfs, the overhead doesn't matter */
-	list_for_each_entry(p, &pt->pages, lru)
-		++count;
-	spin_unlock(&pt->lock);
-
-	return count;
-}
-
 /* Initialize and add a pool type to the global shrinker list */
 static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 			       enum ttm_caching caching, unsigned int order)
@@ -543,6 +528,20 @@ void ttm_pool_fini(struct ttm_pool *pool)
 EXPORT_SYMBOL(ttm_pool_fini);
 
 #ifdef CONFIG_DEBUG_FS
+/* Count the number of pages available in a pool_type */
+static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
+{
+	unsigned int count = 0;
+	struct page *p;
+
+	spin_lock(&pt->lock);
+	/* Only used for debugfs, the overhead doesn't matter */
+	list_for_each_entry(p, &pt->pages, lru)
+		++count;
+	spin_unlock(&pt->lock);
+
+	return count;
+}
 
 /* Dump information about the different pool types */
 static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
