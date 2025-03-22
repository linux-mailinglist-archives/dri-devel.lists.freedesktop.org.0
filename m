Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09855A6CCB3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421010E22E;
	Sat, 22 Mar 2025 21:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cKpXo8eB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360FA10E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678986; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WaJyEL9xZeU5zR4pgHILJlFQFZmUTtzc4hg6lx/PXbWT4I9jrv7pM40vpdVr+pZgLAeUb/nB62lQLYFm06BYCzmulIxWoEsITQ9BXeRLHrmjN62d9KhroTI6K5WGtANV8rjdxJLd3gSyarEUprS8jJvzOIXmIRtGjoT+sEyC0pU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678986;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jI2A6McB5nUab55GDN4/MJXKSOUMSiNkiu8ByBqPMPM=; 
 b=eGtiThTAXaS4Rt47A4xIkV/+OVQYNyNC1cPlUQXjV5rsweVi4unRJrNTs4M6jHhTVawtNVJZyxHAVudC4kFFs4ENk29Imx6SqzfeY8byrhCY2yG1X34Y40jLqVl3C1w+tnMV1HvdUc+7oz1EWKC/ufjvo+iEm2IQeAWFhJVYMW8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678986; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jI2A6McB5nUab55GDN4/MJXKSOUMSiNkiu8ByBqPMPM=;
 b=cKpXo8eBxoYzi7gEo4QhSot4SporbIAkd8H4e2AB5UtPtPnHLRFt11XciaDf12DI
 qdT0AZl9NSF1oM+KQutMmO/4V/DptjOAsYd9Nbk8r6SpucaDhT41BO7ylAIVRm8K7Li
 I7181BxmAsVXSBo/4VeWRjFbKunvKd2E/7znELSU=
Received: by mx.zohomail.com with SMTPS id 1742678984353357.2761177607125;
 Sat, 22 Mar 2025 14:29:44 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 10/10] drm/shmem-helper: Use refcount_t for vmap_use_count
Date: Sun, 23 Mar 2025 00:26:08 +0300
Message-ID: <20250322212608.40511-11-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Use refcount_t helper for vmap_use_count to make refcounting consistent
with pages_use_count and pages_pin_count that use refcount_t. This also
makes vmapping to benefit from the refcount_t's overflow checks.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 28 ++++++++++------------
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  6 ++---
 include/drm/drm_gem_shmem_helper.h         |  2 +-
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 84a196bbe44f..2d924d547a51 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -165,7 +165,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	} else {
 		dma_resv_lock(shmem->base.resv, NULL);
 
-		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
+		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
 		if (shmem->sgt) {
 			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
@@ -355,23 +355,25 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 
 		dma_resv_assert_held(shmem->base.resv);
 
-		if (shmem->vmap_use_count++ > 0) {
+		if (refcount_inc_not_zero(&shmem->vmap_use_count)) {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			return 0;
 		}
 
 		ret = drm_gem_shmem_pin_locked(shmem);
 		if (ret)
-			goto err_zero_use;
+			return ret;
 
 		if (shmem->map_wc)
 			prot = pgprot_writecombine(prot);
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, prot);
-		if (!shmem->vaddr)
+		if (!shmem->vaddr) {
 			ret = -ENOMEM;
-		else
+		} else {
 			iosys_map_set_vaddr(map, shmem->vaddr);
+			refcount_set(&shmem->vmap_use_count, 1);
+		}
 	}
 
 	if (ret) {
@@ -384,8 +386,6 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 err_put_pages:
 	if (!drm_gem_is_imported(obj))
 		drm_gem_shmem_unpin_locked(shmem);
-err_zero_use:
-	shmem->vmap_use_count = 0;
 
 	return ret;
 }
@@ -413,14 +413,10 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 	} else {
 		dma_resv_assert_held(shmem->base.resv);
 
-		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
-			return;
-
-		if (--shmem->vmap_use_count > 0)
-			return;
-
-		vunmap(shmem->vaddr);
-		drm_gem_shmem_unpin_locked(shmem);
+		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
+			vunmap(shmem->vaddr);
+			drm_gem_shmem_unpin_locked(shmem);
+		}
 	}
 
 	shmem->vaddr = NULL;
@@ -672,7 +668,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 
 	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
-	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
+	drm_printf_indent(p, indent, "vmap_use_count=%u\n", refcount_read(&shmem->vmap_use_count));
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 1459cdb0c413..81cadaecdd4f 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -168,7 +168,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
 	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
 	KUNIT_EXPECT_NULL(test, shmem->vaddr);
-	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->vmap_use_count), 0);
 
 	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -177,7 +177,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, ret, 0);
 	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
 	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
-	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 1);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->vmap_use_count), 1);
 
 	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
 	for (i = 0; i < TEST_SIZE; i++)
@@ -185,7 +185,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
 
 	drm_gem_shmem_vunmap_locked(shmem, &map);
 	KUNIT_EXPECT_NULL(test, shmem->vaddr);
-	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->vmap_use_count), 0);
 }
 
 /*
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 8b9bba87ae63..b4f993da3cae 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -82,7 +82,7 @@ struct drm_gem_shmem_object {
 	 * Reference count on the virtual address.
 	 * The address are un-mapped when the count reaches zero.
 	 */
-	unsigned int vmap_use_count;
+	refcount_t vmap_use_count;
 
 	/**
 	 * @pages_mark_dirty_on_put:
-- 
2.49.0

