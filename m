Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF797682A2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 00:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9310E22B;
	Sat, 29 Jul 2023 22:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ADF10E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 22:50:49 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RD08m5dNWzDqQ7;
 Sat, 29 Jul 2023 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690671048; bh=PZqcYMB1EHIp7Ev9LKbwtj+J80057+5ZYRdpRbAltMA=;
 h=From:To:Cc:Subject:Date:From;
 b=EOuOWYR9+ZeMX5A5QmwZ+5P+NhpwdDdzzfl3i1pXtSUExb5+lFfg8lKPzahXGwK+e
 ljRrJroANhw7HNjjSg2rPS8RErjMuheAVkkVdW2prOPNUig6sBt26DjZO+GhVvuHVM
 K6i+yJsGbz7gQOX1am9/kTWgjBUyAjVnLYEosYkw=
X-Riseup-User-ID: F5656F9598173DB1C92BD3AF4DF4345C3B45B3277EEB3917911022A4407EA565
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RD08j4VXZzJp25;
 Sat, 29 Jul 2023 22:50:45 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/vkms: avoid race-condition between flushing and destroying
Date: Sat, 29 Jul 2023 19:49:10 -0300
Message-ID: <20230729225008.30455-1-mairacanal@riseup.net>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After we flush the workqueue at the commit tale, we need to make sure
that no work is queued until we destroy the state. Currently, new work
can be queued in the workqueue, even after the commit tale, as the
vblank thread is still running.

Therefore, to avoid a race-condition that will lead to the trigger of a
WARN_ON() at the function vkms_atomic_crtc_destroy_state(), add a mutex
to protect the sections where the queue is manipulated.

This way we can make sure that no work will be added to the workqueue
between flushing the queue (at the commit tail) and destroying the
state.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 10 +++++++++-
 drivers/gpu/drm/vkms/vkms_drv.c  |  1 +
 drivers/gpu/drm/vkms/vkms_drv.h  |  8 ++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 3c5ebf106b66..e5ec21a0da05 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -49,7 +49,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 		state->crc_pending = true;
 		spin_unlock(&output->composer_lock);

+		mutex_lock(&state->queue_lock);
 		ret = queue_work(output->composer_workq, &state->composer_work);
+		mutex_unlock(&state->queue_lock);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
@@ -129,6 +131,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)

 	__drm_atomic_helper_crtc_duplicate_state(crtc, &vkms_state->base);

+	mutex_init(&vkms_state->queue_lock);
 	INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);

 	return &vkms_state->base;
@@ -142,6 +145,9 @@ static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
 	__drm_atomic_helper_crtc_destroy_state(state);

 	WARN_ON(work_pending(&vkms_state->composer_work));
+	mutex_unlock(&vkms_state->queue_lock);
+
+	mutex_destroy(&vkms_state->queue_lock);
 	kfree(vkms_state->active_planes);
 	kfree(vkms_state);
 }
@@ -155,8 +161,10 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
 		vkms_atomic_crtc_destroy_state(crtc, crtc->state);

 	__drm_atomic_helper_crtc_reset(crtc, &vkms_state->base);
-	if (vkms_state)
+	if (vkms_state) {
+		mutex_init(&vkms_state->queue_lock);
 		INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
+	}
 }

 static const struct drm_crtc_funcs vkms_crtc_funcs = {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..9212686ca88a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -84,6 +84,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 		struct vkms_crtc_state *vkms_state =
 			to_vkms_crtc_state(old_crtc_state);

+		mutex_lock(&vkms_state->queue_lock);
 		flush_work(&vkms_state->composer_work);
 	}

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index c7ae6c2ba1df..83767692469a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -89,6 +89,14 @@ struct vkms_crtc_state {
 	struct vkms_writeback_job *active_writeback;
 	struct vkms_color_lut gamma_lut;

+	/* protects the access to the workqueue
+	 *
+	 * we need to hold this lock between flushing the workqueue and
+	 * destroying the state to avoid work to be queued by the worker
+	 * thread
+	 */
+	struct mutex queue_lock;
+
 	/* below four are protected by vkms_output.composer_lock */
 	bool crc_pending;
 	bool wb_pending;
--
2.41.0

