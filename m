Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC9702E91
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EAD10E1D4;
	Mon, 15 May 2023 13:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429910E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kaQS3MvAO8Onztb0hBGDwJBRWvPAQlh+5ulUONmzNsw=; b=s202GYQzcA5A+nVmpwQOLkU5Yb
 orOyO6/iK64RuoGd9l0TIfeoA/CPwwHxRjvS5MOjxM7aoVmr7IeK3pl6BzyNiAlmwPn1c1S1shXgn
 h751DgiZcUz+TEjxyKTbHJLcTYb0Tcu70wmI0pgi/khbt8gj9cf4K6xMI9pGcU59MRcRMzoLFabjR
 +ea4XP1H9tt4IGtIn7Wn94ZH47enoM9sMwcHNHTesrJTaEnGpQPAVOcGI6rxGiiFjOTg0r7w3VrPa
 btWmY1mrKLRD9TX+bFn33DMZYAV6EPLUYGH3jTKsgcMPLCDlTepPVVCYh66miE3NZwfgiuTA32BdQ
 QSDJazdA==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=bowie.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pyYST-009tR6-UY; Mon, 15 May 2023 15:41:50 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
Date: Mon, 15 May 2023 10:41:33 -0300
Message-Id: <20230515134133.108780-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, it is possible for the composer to be set as enabled and then
as disabled without a proper call for the vkms_vblank_simulate(). This
is problematic, because the driver would skip one CRC output, causing CRC
tests to fail. Therefore, we need to make sure that, for each time the
composer is set as enabled, a composer job is added to the queue.

In order to provide this guarantee, add a mutex that will lock before
the composer is set as enabled and will unlock only after the composer
job is added to the queue. This way, we can have a guarantee that the
driver won't skip a CRC entry.

This race-condition is affecting the IGT test "writeback-check-output",
making the test fail and also, leaking writeback framebuffers, as the
writeback job is queued, but it is not signaled. This patch avoids both
problems.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  9 +++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     | 14 +++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..e65104a2203d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -320,10 +320,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
 	if (enabled)
 		drm_crtc_vblank_get(&out->crtc);
 
-	spin_lock_irq(&out->lock);
+	mutex_lock(&out->lock);
 	old_enabled = out->composer_enabled;
 	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+
+	/* the composition wasn't enabled, so unlock the lock to make sure the lock
+	 * will be balanced even if we have a failed commit
+	 */
+	if (!out->composer_enabled)
+		mutex_unlock(&out->lock);
 
 	if (old_enabled)
 		drm_crtc_vblank_put(&out->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 515f6772b866..5a0ee9530748 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret, fence_cookie;
+	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
@@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
+	composer_enabled = output->composer_enabled;
+	mutex_unlock(&output->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -241,7 +241,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	spin_lock_irq(&vkms_output->lock);
+	mutex_lock(&vkms_output->lock);
 }
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -264,7 +264,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	mutex_unlock(&vkms_output->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -290,7 +290,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
-	spin_lock_init(&vkms_out->lock);
+	mutex_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
 
 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5f1a0a44a78c..883266bb0d4a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -99,7 +99,7 @@ struct vkms_output {
 	/* ordered wq for composer_work */
 	struct workqueue_struct *composer_workq;
 	/* protects concurrent access to composer */
-	spinlock_t lock;
+	struct mutex lock;
 
 	/* protected by @lock */
 	bool composer_enabled;
-- 
2.40.1

