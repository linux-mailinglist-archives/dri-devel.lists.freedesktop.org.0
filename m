Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D82C83C6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026189D66;
	Mon, 30 Nov 2020 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324889D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A26BAE38;
 Mon, 30 Nov 2020 12:04:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Date: Mon, 30 Nov 2020 13:04:26 +0100
Message-Id: <20201130120433.7205-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mapping a GEM object's buffer into kernel address space prevents the
buffer from being evicted from VRAM, which in turn may result in
out-of-memory errors. It's therefore required to only vmap GEM BOs for
short periods of time; unless the GEM implementation provides additional
guarantees.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_prime.c |  6 ++++++
 include/drm/drm_gem.h       | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 7db55fce35d8..9c9ece9833e0 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
  * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
  * The kernel virtual address is returned in map.
  *
+ * To prevent the GEM object from being relocated, callers must hold the GEM
+ * object's reservation lock from when calling this function until releasing the
+ * mapping. Holding onto a mapping and the associated reservation lock for an
+ * unbound time may result in out-of-memory errors. Calls to drm_gem_dmabuf_vmap()
+ * should therefore be accompanied by a call to drm_gem_dmabuf_vunmap().
+ *
  * Returns 0 on success or a negative errno code otherwise.
  */
 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5e6daa1c982f..7c34cd5ec261 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
 	 * Returns a virtual address for the buffer. Used by the
 	 * drm_gem_dmabuf_vmap() helper.
 	 *
+	 * Notes to implementors:
+	 *
+	 * - Implementations must expect pairs of @vmap and @vunmap to be
+	 *   called frequently and should optimize for this case.
+	 *
+	 * - Implemenations may expect the caller to hold the GEM object's
+	 *   reservation lock to protect against concurrent calls and relocation
+	 *   of the GEM object.
+	 *
+	 * - Implementations may provide additional guarantees (e.g., working
+	 *   without holding the reservation lock).
+	 *
 	 * This callback is optional.
+	 *
+	 * See also drm_gem_dmabuf_vmap()
 	 */
 	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
@@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
 	 * drm_gem_dmabuf_vunmap() helper.
 	 *
 	 * This callback is optional.
+	 *
+	 * See also @vmap.
 	 */
 	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
