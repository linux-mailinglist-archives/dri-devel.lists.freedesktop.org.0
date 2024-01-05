Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09B825A76
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6910E681;
	Fri,  5 Jan 2024 18:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209AF10E686
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480427;
 bh=MjcmD6gU68LDlFoDzu5LGGvN6a0gG7s2tx477nPNH80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kg85oLbd4ffNzHiDa0cajzNYVvBhIZ8MqdJWOoByqrMIpeMq3B2j4jZ3r/uKszve9
 ssD3lwpTpX0nS/g2JlPEmcTwT+innDur/vJRigpwF4LjWDmLQNgBO/pvHu3/UtX2J4
 wWKmpfOaeog7a1pvI46vrbN3yAuUbP9cUV0LhHD3OPXyyJbhcnZPRgoniUqL/UW55q
 c7tApQ2ohn1MamZElQjeFpbqd6E4+S1xolcBOmXu1F6RhPpfb2fj+ISblkkhap7o8G
 or8+FNrLoahMA5Lk+ycWfagGRHd7SgTy+VDDCBMWB+NV+SDHKz5TUt6DaPByeN/O0e
 vXu8MqNZvoDqw==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9FD0F378205C;
 Fri,  5 Jan 2024 18:47:05 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 14/30] drm/shmem-helper: Add drm_gem_shmem_put_pages()
Date: Fri,  5 Jan 2024 21:46:08 +0300
Message-ID: <20240105184624.508603-15-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to move away from having implicit get_pages() done by
get_pages_sgt() to ease simplify refcnt handling. Drivers will manage
get/put_pages() by themselves. Add drm_gem_shmem_put_pages().

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 20 ++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index dc416a4bce1b..f5ed64f78648 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -218,6 +218,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  * @shmem: shmem GEM object
  *
  * This function decreases the use count and puts the backing pages when use drops to zero.
+ * Caller must hold GEM's reservation lock.
  */
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -228,6 +229,25 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
+/*
+ * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
+ * @shmem: shmem GEM object
+ *
+ * This function decreases the use count and puts the backing pages when use drops to zero.
+ * It's unlocked version of drm_gem_shmem_put_pages_locked(), caller must not hold
+ * GEM's reservation lock.
+ */
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+{
+	if (refcount_dec_not_one(&shmem->pages_use_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
+
 /*
  * drm_gem_shmem_get_pages - Increase use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6dedc0739fbc..525480488451 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -111,6 +111,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-- 
2.43.0

