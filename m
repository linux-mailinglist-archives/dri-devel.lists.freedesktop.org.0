Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK2pLvAro2mF+AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:54:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241E1C5343
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542EF10E2DC;
	Sat, 28 Feb 2026 17:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UNUVSo36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4C10E2DB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9116960134;
 Sat, 28 Feb 2026 17:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C283C116D0;
 Sat, 28 Feb 2026 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772301284;
 bh=1mSZrzdXvWMtWFt9bMt3Uhpln1QjAS1Hey4QS/enUxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UNUVSo36behckYsz2AimeDfXKuaJbw5Jbimia0EVtV0suQNYqmNuBDTqIRHq/JEHU
 YEVUbXhRorkY5PxQGbpIG9Z0za7bg/bnBivszeWtOyG9N+HEnbbHi02gGnbJYZxJYJ
 R9Vvt3HcdBS5V/DVTSmeMgEuMIhc73+SkyCNnkiGC+o3sv8Gfg5LfVscGDTBiS/gSh
 WPKmRFQCYIG4xMfRpCAWfRd4tObAboSvx9Ursov8ts3kxBpe0CD5cZAotldiNDxu+p
 XMUdRAkbwCWuOVbm1G6YRhtN96deqhnB6XaNzkuuH9u3CNjj2KK2a7+IHYZT6S0Jv/
 VpqW/D1I/d8Eg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.18 468/752] drm/tests: shmem: Hold reservation lock around
 vmap/vunmap
Date: Sat, 28 Feb 2026 12:42:59 -0500
Message-ID: <20260228174750.1542406-468-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260228174750.1542406-1-sashal@kernel.org>
References: <20260228174750.1542406-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:tzimmermann@suse.de,m:stable@vger.kernel.org,m:boris.brezillon@collabora.com,m:sashal@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,collabora.com:email,msgid.link:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 5241E1C5343
X-Rspamd-Action: no action

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit cda83b099f117f2a28a77bf467af934cb39e49cf ]

Acquire and release the GEM object's reservation lock around vmap and
vunmap operations. The tests use vmap_locked, which led to errors such
as show below.

[  122.292030] WARNING: CPU: 3 PID: 1413 at drivers/gpu/drm/drm_gem_shmem_helper.c:390 drm_gem_shmem_vmap_locked+0x3a3/0x6f0

[  122.468066] WARNING: CPU: 3 PID: 1413 at drivers/gpu/drm/drm_gem_shmem_helper.c:293 drm_gem_shmem_pin_locked+0x1fe/0x350

[  122.563504] WARNING: CPU: 3 PID: 1413 at drivers/gpu/drm/drm_gem_shmem_helper.c:234 drm_gem_shmem_get_pages_locked+0x23c/0x370

[  122.662248] WARNING: CPU: 2 PID: 1413 at drivers/gpu/drm/drm_gem_shmem_helper.c:452 drm_gem_shmem_vunmap_locked+0x101/0x330

Only export the new vmap/vunmap helpers for Kunit tests. These are
not interfaces for regular drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://patch.msgid.link/20251212160317.287409-4-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 33 ++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  6 ++--
 include/drm/drm_gem_shmem_helper.h         |  9 ++++++
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 365b5737ca2c6..d9c26d15ef6b9 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -15,6 +15,8 @@
 #include <asm/set_memory.h>
 #endif
 
+#include <kunit/visibility.h>
+
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -861,6 +863,37 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
 
+/*
+ * Kunit helpers
+ */
+
+#if IS_ENABLED(CONFIG_KUNIT)
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret;
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_vmap_locked(shmem, map);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_vmap);
+
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	dma_resv_lock_interruptible(obj->resv, NULL);
+	drm_gem_shmem_vunmap_locked(shmem, map);
+	dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_vunmap);
+#endif
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 1d50bab51ef3f..3e7c6f20fbcca 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -19,6 +19,8 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_kunit_helpers.h>
 
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
 #define TEST_SIZE		SZ_1M
 #define TEST_BYTE		0xae
 
@@ -176,7 +178,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
 	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ret = drm_gem_shmem_vmap_locked(shmem, &map);
+	ret = drm_gem_shmem_vmap(shmem, &map);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
 	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
@@ -186,7 +188,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
 	for (i = 0; i < TEST_SIZE; i++)
 		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
 
-	drm_gem_shmem_vunmap_locked(shmem, &map);
+	drm_gem_shmem_vunmap(shmem, &map);
 	KUNIT_EXPECT_NULL(test, shmem->vaddr);
 	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->vmap_use_count), 0);
 }
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 92f5db84b9c22..8a23fe96120e7 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -301,4 +301,13 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 	.gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
 	.dumb_create            = drm_gem_shmem_dumb_create
 
+/*
+ * Kunit helpers
+ */
+
+#if IS_ENABLED(CONFIG_KUNIT)
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
+#endif
+
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
-- 
2.51.0

