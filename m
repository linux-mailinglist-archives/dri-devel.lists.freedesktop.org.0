Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE6825A77
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E110E685;
	Fri,  5 Jan 2024 18:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A415D10E67E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480428;
 bh=tpJP8aUfkvakUPIRIDPJWRInC6tt5GQtcS8InGkdO1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HYfbKWsOORxwVSeGsBruwzoIrfH9HktyzFNW0jMXbWXqEQkTjCbpZsndScMrWW09M
 T7gQhPY8U51XeIxeWj+GRsVQSCh8ogIg4SQuEERDKXAOLNs78Yi1454KAIox07MShF
 rlk4BYMQ+lOapPf7Dvp9+56o8g6rLI63w9CFh/5MYVtXkGk/uvIKW9R7ErUKWzWer0
 4+GaUiAy34d4w5iPNh4HQX1u6JiWMFNgAP5y5ixbzfo1gaKdQNoxf3w8qCHPkWD+Q6
 u/bK8sl5peQRSfn1ZzL4Lr1OADocg2OFUcLkCZR9t1INpZ9aZoXbUhSCCiHiQt/hM8
 nyqubNWPN4X0A==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 37097378203D;
 Fri,  5 Jan 2024 18:47:07 +0000 (UTC)
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
Subject: [PATCH v19 15/30] drm/shmem-helper: Avoid lockdep warning when pages
 are released
Date: Fri,  5 Jan 2024 21:46:09 +0300
Message-ID: <20240105184624.508603-16-dmitry.osipenko@collabora.com>
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

All drivers will be moved to get/put pages explicitly and then the last
put_pages() will be invoked during gem_free() time by some drivers.
We can't touch reservation lock when GEM is freed because that will cause
a spurious warning from lockdep when shrinker support will be added.
Lockdep doesn't know that fs_reclaim isn't functioning for a freed object,
and thus, can't deadlock. Release pages directly without taking reservation
lock if GEM is freed and its refcount is zero.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f5ed64f78648..c7357110ca76 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -242,6 +242,22 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 	if (refcount_dec_not_one(&shmem->pages_use_count))
 		return;
 
+	/*
+	 * Destroying the object is a special case because acquiring
+	 * the obj lock can cause a locking order inversion between
+	 * reservation_ww_class_mutex and fs_reclaim.
+	 *
+	 * This deadlock is not actually possible, because no one should
+	 * be already holding the lock when GEM is released.  Unfortunately
+	 * lockdep is not aware of this detail.  So when the refcount drops
+	 * to zero, we pretend it is already locked.
+	 */
+	if (!kref_read(&shmem->base.refcount)) {
+		if (refcount_dec_and_test(&shmem->pages_use_count))
+			drm_gem_shmem_free_pages(shmem);
+		return;
+	}
+
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_put_pages_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
-- 
2.43.0

