Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IaSJuoro2kr+AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:54:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A55C1C532D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359B010E2DB;
	Sat, 28 Feb 2026 17:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g2u/c/jB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6985310E2DD
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5114B43BE3;
 Sat, 28 Feb 2026 17:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ECCC2BC87;
 Sat, 28 Feb 2026 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772301285;
 bh=siYrnM3Al6jSSGZPMOtjMJrJ9yZs6gJ0moXEkMFAHTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2u/c/jBPIWYeQCW0kIRgeataSNnND4PqtQYm1bMqXrQVB6thH2WTVT8s0l7tqVIW
 BERKuSzcE2vXY9QU2W5lyc5/kcFDfh9zOE3dqx3wvVKnf27jqoDBxbA4typ3OFfdSY
 PBwMyNv+nDw8cxab0+0StSyanbD17kfe+wj49wb7cPbshXrfVUyV6U9i4H35N52udd
 47jId0haEYFGYICJ0e0RKBz1Tp+Ga3ANZgq48vHMXSXSolPmeOsYcIf2KPbJvk3NAV
 urdjZj8P6cz0mkizfkFnAYAK4hRe9KbDF6TXEIzXL5atc0+OIQHZYxaaZ4BTS81+Xl
 TbIFYsNUOBm4g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.18 469/752] drm/tests: shmem: Hold reservation lock around
 madvise
Date: Sat, 28 Feb 2026 12:43:00 -0500
Message-ID: <20260228174750.1542406-469-sashal@kernel.org>
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
X-Rspamd-Queue-Id: 2A55C1C532D
X-Rspamd-Action: no action

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 607d07d8cc0b835a8701259f08a03dc149b79b4f ]

Acquire and release the GEM object's reservation lock around calls
to the object's madvide operation. The tests use
drm_gem_shmem_madvise_locked(), which led to errors such as show below.

[   58.339389] WARNING: CPU: 1 PID: 1352 at drivers/gpu/drm/drm_gem_shmem_helper.c:499 drm_gem_shmem_madvise_locked+0xde/0x140

Only export the new helper drm_gem_shmem_madvise() for Kunit tests.
This is not an interface for regular drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.16+
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://patch.msgid.link/20251212160317.287409-5-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  8 ++++----
 include/drm/drm_gem_shmem_helper.h         |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d9c26d15ef6b9..57df74c3a627b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -892,6 +892,21 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *
 	dma_resv_unlock(obj->resv);
 }
 EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_vunmap);
+
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret;
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_madvise_locked(shmem, madv);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_madvise);
 #endif
 
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 3e7c6f20fbcca..d639848e3c8ea 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -292,17 +292,17 @@ static void drm_gem_shmem_test_madvise(struct kunit *test)
 	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ret = drm_gem_shmem_madvise_locked(shmem, 1);
+	ret = drm_gem_shmem_madvise(shmem, 1);
 	KUNIT_EXPECT_TRUE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
 
 	/* Set madv to a negative value */
-	ret = drm_gem_shmem_madvise_locked(shmem, -1);
+	ret = drm_gem_shmem_madvise(shmem, -1);
 	KUNIT_EXPECT_FALSE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
 
 	/* Check that madv cannot be set back to a positive value */
-	ret = drm_gem_shmem_madvise_locked(shmem, 0);
+	ret = drm_gem_shmem_madvise(shmem, 0);
 	KUNIT_EXPECT_FALSE(test, ret);
 	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
 }
@@ -330,7 +330,7 @@ static void drm_gem_shmem_test_purge(struct kunit *test)
 	ret = drm_gem_shmem_is_purgeable(shmem);
 	KUNIT_EXPECT_FALSE(test, ret);
 
-	ret = drm_gem_shmem_madvise_locked(shmem, 1);
+	ret = drm_gem_shmem_madvise(shmem, 1);
 	KUNIT_EXPECT_TRUE(test, ret);
 
 	/* The scatter/gather table will be freed by drm_gem_shmem_free */
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 8a23fe96120e7..1b937166457fb 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -308,6 +308,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 #if IS_ENABLED(CONFIG_KUNIT)
 int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
 void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 #endif
 
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
-- 
2.51.0

