Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAF4FC72D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AAF10E357;
	Mon, 11 Apr 2022 22:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116010E357
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id DB2AE1F43C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649714431;
 bh=rykbT46970dnwG8XD3/7UFJ4mDKmg/KtVkYLQH0qBew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ynz54hlDD9OMiT6vTyY2rs246aLEQ6s85f9REUWTafcGadzyFiOoKAPgh1085Vxde
 xh48RRmftrJRm0bxOHSpO6oCIdshqXcROjyBO2HKNoEpcOgzdciVW2py4O3fwqHIvT
 kPuOqFKs3jLEgbnreRC5er2ffUz4zz/a5Ugw9UkEZL2UAfdjA5fQLzcAPSWDHidFz5
 Ykx25wi36RZWuR9zGT174kJDEaUEHJhvHeuVI/sciCZkVdW+EjVaTw5ZBh3rBYmZdE
 pmSEvKwUF0cdmn5eJPq/0PWsY+rEqG5KqIrwwUcZkYmXtjIBUM3qnBUwV+I6FKKII5
 9k9a50GhP6obA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 09/15] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Date: Tue, 12 Apr 2022 00:59:31 +0300
Message-Id: <20220411215937.281655-10-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
References: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
Correct the doc comment which says that it returns NULL on error.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..30ee46348a99 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -662,7 +662,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
  * drm_gem_shmem_get_pages_sgt() instead.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ * A pointer to the scatter/gather table of pinned pages or errno on failure.
  */
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
@@ -688,7 +688,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
  * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or errno on failure.
+ * A pointer to the scatter/gather table of pinned pages ERR_PTR()-encoded
+ * error code on failure.
  */
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 {
-- 
2.35.1

