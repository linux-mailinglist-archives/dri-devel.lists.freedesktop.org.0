Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F366A9ABA10
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 01:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5C210E704;
	Tue, 22 Oct 2024 23:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="miiCJCUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365E710E703
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=7tqnPkF2BTUcYbffZanA7zfXObwjUDobXcZGkQ4od/8=; b=miiCJCUhKGG/Ek0G
 WjNqQ78qCseA8+bWR4xRZsPFkTkPLUTitts/v6Sw+BaGwkIzk6anjII5irleL9WmskoNOS9U+p+u5
 jhQ22tVqbiizvsMvFByh6ulMj/COw9BgpAtsdbvlF4FcajK4Jpl0SnxPvqR+QigUT9VANiKwY0ywC
 bJOqnxSU9yHk05TTEjqTfsZeQg+Djnuz6NgVz5i1kFQnqNnypbx//hWvUTWgIkRnUUVtKe5aAjRTl
 IbvL62sPERJHyZm3w3Fimlvc8wsGcKKS3vevJlvt4marKPeTxi2/VIOQdx9rT/mf6cd4REiXpnH9e
 RQdnRtMZCS32+VU5IQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t3OJn-00CtGr-1c;
 Tue, 22 Oct 2024 23:29:39 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/5] drm/vblank: Remove unused drm_crtc_vblank_count_and_time
Date: Wed, 23 Oct 2024 00:29:32 +0100
Message-ID: <20241022232934.238124-4-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022232934.238124-1-linux@treblig.org>
References: <20241022232934.238124-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

drm_crtc_vblank_count_and_time() was explicitly added by
commit cf6483050e9b ("drm/irq: Add drm_crtc_vblank_count_and_time()")
in 2015, but never used.

Remove it, and rework comments that reference it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_vblank.c | 44 +++++++-----------------------------
 include/drm/drm_vblank.h     | 10 ++++----
 2 files changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d..67d6367e9f4b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -908,10 +908,10 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
  * drm_crtc_accurate_vblank_count() for such use-cases.
  *
  * Note that for a given vblank counter value drm_crtc_handle_vblank()
- * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
- * provide a barrier: Any writes done before calling
- * drm_crtc_handle_vblank() will be visible to callers of the later
- * functions, if the vblank count is the same or a later one.
+ * and drm_crtc_vblank_count() provide a barrier:
+ * Any writes done before calling drm_crtc_handle_vblank() will be
+ * visible to callers of the later functions, if the vblank count is
+ * the same or a later one.
  *
  * See also &drm_vblank_crtc.count.
  *
@@ -936,7 +936,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
  * modesetting activity. Returns corresponding system timestamp of the time
  * of the vblank interval that corresponds to the current vblank counter value.
  *
- * This is the legacy version of drm_crtc_vblank_count_and_time().
  */
 static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 				     ktime_t *vblanktime)
@@ -959,33 +958,6 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 	return vblank_count;
 }
 
-/**
- * drm_crtc_vblank_count_and_time - retrieve "cooked" vblank counter value
- *     and the system timestamp corresponding to that vblank counter value
- * @crtc: which counter to retrieve
- * @vblanktime: Pointer to time to receive the vblank timestamp.
- *
- * Fetches the "cooked" vblank count value that represents the number of
- * vblank events since the system was booted, including lost events due to
- * modesetting activity. Returns corresponding system timestamp of the time
- * of the vblank interval that corresponds to the current vblank counter value.
- *
- * Note that for a given vblank counter value drm_crtc_handle_vblank()
- * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
- * provide a barrier: Any writes done before calling
- * drm_crtc_handle_vblank() will be visible to callers of the later
- * functions, if the vblank count is the same or a later one.
- *
- * See also &drm_vblank_crtc.count.
- */
-u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
-				   ktime_t *vblanktime)
-{
-	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
-					 vblanktime);
-}
-EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
-
 /**
  * drm_crtc_next_vblank_start - calculate the time of the next vblank
  * @crtc: the crtc for which to calculate next vblank time
@@ -1978,10 +1950,10 @@ EXPORT_SYMBOL(drm_handle_vblank);
  * This is the native KMS version of drm_handle_vblank().
  *
  * Note that for a given vblank counter value drm_crtc_handle_vblank()
- * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
- * provide a barrier: Any writes done before calling
- * drm_crtc_handle_vblank() will be visible to callers of the later
- * functions, if the vblank count is the same or a later one.
+ * and drm_crtc_vblank_count() * provide a barrier:
+ * Any writes done before calling * drm_crtc_handle_vblank() will be
+ * visible to callers of the later functions, if the vblank count is
+ * the same or a later one.
  *
  * See also &drm_vblank_crtc.count.
  *
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 151ab1e85b1b..572e54425970 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -141,10 +141,10 @@ struct drm_vblank_crtc {
 	 * Current software vblank counter.
 	 *
 	 * Note that for a given vblank counter value drm_crtc_handle_vblank()
-	 * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
-	 * provide a barrier: Any writes done before calling
-	 * drm_crtc_handle_vblank() will be visible to callers of the later
-	 * functions, iff the vblank count is the same or a later one.
+	 * and drm_crtc_vblank_count() provide a barrier:
+	 * Any writes done before calling drm_crtc_handle_vblank() will be
+	 * visible to callers of the later functions, iff the vblank count is
+	 * the same or a later one.
 	 *
 	 * IMPORTANT: This guarantee requires barriers, therefor never access
 	 * this field directly. Use drm_crtc_vblank_count() instead.
@@ -260,8 +260,6 @@ struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
 bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
-u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
-				   ktime_t *vblanktime);
 int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
-- 
2.47.0

