Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096547A01FB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 12:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D71310E262;
	Thu, 14 Sep 2023 10:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1744 seconds by postgrey-1.36 at gabe;
 Thu, 14 Sep 2023 10:49:47 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807B310E262
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7xrk9agHZXIsMQu7lfcBnZM62uO342/LylrKQ86z6zY=; b=dWX7CIQU61Bjsx9xqg0M0AQZrb
 pX1efUVK0R2wNMSWguDKpjek5EjJ980rzUNT8OSzKQVqMJfIiTAgeUnPXfIbBQF4XFABdvRVG4dls
 bnH35IQD94+l4KTNoESg9sOZhxKcduqxEWjTV0nvSeT6qaYOls4wdTzdVlUVs7iYDqc/GCMTi9nYV
 qz+LXaNtv5PRN9O6shguYmi255eh4qcorUChK8p4d81dBepTEwdVvZOKVJWmnpydVesMcWXitVc0P
 PeFdr+Hao7cZQC3+eBvJPQP67uBwpnJpfXBsjTGvKBMKnBWy5oZt/qtNu+PjWxNLgQvR/DexSbEWS
 jkBHTp5A==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qgjSe-003qXh-PR; Thu, 14 Sep 2023 12:20:37 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] Revert "drm/vkms: Fix race-condition between the hrtimer and
 the atomic commit"
Date: Thu, 14 Sep 2023 07:19:02 -0300
Message-ID: <20230914102024.1789154-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit a0e6a017ab56936c0405fe914a793b241ed25ee0.

Unlocking a mutex in the context of a hrtimer callback is violating mutex
locking rules, as mutex_unlock() from interrupt context is not permitted.

Links: https://lore.kernel.org/dri-devel/ZQLAc%2FFwkv%2FGiVoK@phenom.ffwll.local/T/#t
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 9 ++-------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 9 ++++-----
 drivers/gpu/drm/vkms/vkms_drv.h      | 4 +---
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index d5d4f642d367..3c99fb8b54e2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -408,15 +408,10 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
 	if (enabled)
 		drm_crtc_vblank_get(&out->crtc);

-	mutex_lock(&out->enabled_lock);
+	spin_lock_irq(&out->lock);
 	old_enabled = out->composer_enabled;
 	out->composer_enabled = enabled;
-
-	/* the composition wasn't enabled, so unlock the lock to make sure the lock
-	 * will be balanced even if we have a failed commit
-	 */
-	if (!out->composer_enabled)
-		mutex_unlock(&out->enabled_lock);
+	spin_unlock_irq(&out->lock);

 	if (old_enabled)
 		drm_crtc_vblank_put(&out->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 3c5ebf106b66..61e500b8c9da 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret, fence_cookie, composer_enabled;
+	bool ret, fence_cookie;

 	fence_cookie = dma_fence_begin_signalling();

@@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);

+	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");

 	state = output->composer_state;
-	composer_enabled = output->composer_enabled;
-	mutex_unlock(&output->enabled_lock);
+	spin_unlock(&output->lock);

-	if (state && composer_enabled) {
+	if (state && output->composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);

 		/* update frame_start only if a queued vkms_composer_worker()
@@ -295,7 +295,6 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,

 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
-	mutex_init(&vkms_out->enabled_lock);

 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_out->composer_workq)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index c7ae6c2ba1df..8f5710debb1e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -108,10 +108,8 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	/* protects concurrent access to composer */
 	spinlock_t lock;
-	/* guarantees that if the composer is enabled, a job will be queued */
-	struct mutex enabled_lock;

-	/* protected by @enabled_lock */
+	/* protected by @lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;

--
2.41.0

