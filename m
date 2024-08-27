Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECDC96068F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9844110E222;
	Tue, 27 Aug 2024 10:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p1nJVXQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A80510E222
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:01:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CE231C000C;
 Tue, 27 Aug 2024 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7I4yjRM+EAGk8OmRLAB0yWxupKT0rtc7RgTC0k07aOc=;
 b=p1nJVXQ0ZHRoDKZt427xeQRxPBojvSF+oz4++jfpIazlyRI9cU7Dmg6/ms6VX8JOnzcIM+
 rcHUp6qmDu3UVPkRpu1nAzEhieGoevJALIeAFzLXg2GGF2akQ1xRILapKp8tZ/xWjco8F9
 HU3bEDJJXf6EMhbgA83/MIo1xdY6TljCuBxJJvQYa3om3+u/mSKYLIOjVzrcPSjsxmo9UR
 BiDQ3kiepDywO361YtrYdmc08vfR3ibSq2n4rW2KnuaUOHbNSrzO4ah3YDVS6zRhnemJto
 qN5/2mnfv7SMDQ+rlhV/iTcn9GuVfHKAQp7fd83bvBVK3P3r/P+LL58kbeaiWw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:39 +0200
Subject: [PATCH v2 4/6] drm/vkms: rename to_vkms_crtc_state to
 drm_crtc_state_to_vkms_crtc_state to avoid confusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-4-f41104553aeb@bootlin.com>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
In-Reply-To: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2791;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+9EVfrWGXweMRhdpWJLhgyFdBP6idc+nFpzOoZsSppQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQPuNM20rjRpZD7nSUpPweO7ZcP+gjwczjjc
 3gojL+9YGaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDwAKCRAgrS7GWxAs
 4qKID/9nz7XMygblI4ARivSoC0zr8EI1wnWrgFrT/tdSCA8CSeQCU5IF4gubapo16WY/hYgIq6e
 aQWsp0zCN/uM6uA6WwKIQ9LW3aBmC3cBDIQ7tR4hUO0qxovxiHsbpLYbnVF5J1dqx7N1tgOfqEU
 Fzvsm2DUmWCCain8nxX6c+Tg+XWA6iJQr+Qq7KoTX8kvoCT/6KWOH05FUZ3YKfbEqKOVpP+0aT7
 Zcn4OhyQ0meYoILFPIPviYTVcGJtLmbwpLzmP895OcrohHZYKuCQMP36/bDC9VZax49TVYc9hps
 V81E7s+aW/GVdZn6PhPFDNqKV2sTzHdILFD5MFKXuNd8v1ZXiq5ppe8eo95vm6+84I+dsEBnbpS
 GnxPh6jSnHYDk59cKDKlWerdgDzNaiipAhMgA8Y/QkP5gdkm9Cv+KoGhtHj7gSsM8rwi58f1Dbk
 cl40RVFpg74Wnv9V6krqLNSl57a2IdrxgTpSjNRzG77YndkloXIubWcdMa1qsZLnoSqG7EbuKdP
 hnwdn5LjQwHCMcxWN5zJhnoYHDGMSEfw5zB2iVsVRs6nnNo/5WZtAkdRGalBgg1N+NLq4qTrWA5
 O4ZDTFjXeILYM6Z8fpHsdgzbEDpTBU1BvMzcXuQx5iZk349+hUqhKoQaQv8OqDeqIyZDPkj5fPn
 l0Vn0Kz0ROmVv/Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

To avoid confusion in macro, rename to_vkms_crtc_state to a more explicit
name drm_crtc_state_to_vkms_crtc_state

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 6 +++---
 drivers/gpu/drm/vkms/vkms_drv.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.h  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 013bf8336b54..2bf733a1b9f0 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -132,7 +132,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)
 static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
 					   struct drm_crtc_state *state)
 {
-	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(state);
+	struct vkms_crtc_state *vkms_state = drm_crtc_state_to_vkms_crtc_state(state);
 
 	__drm_atomic_helper_crtc_destroy_state(state);
 
@@ -173,7 +173,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc_state);
+	struct vkms_crtc_state *vkms_state = drm_crtc_state_to_vkms_crtc_state(crtc_state);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	int i = 0, ret;
@@ -257,7 +257,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = drm_crtc_state_to_vkms_crtc_state(crtc->state);
 
 	spin_unlock_irq(&vkms_crtc->lock);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index d1ed6bbe9559..f2818374f5c9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -82,7 +82,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
 		struct vkms_crtc_state *vkms_state =
-			to_vkms_crtc_state(old_crtc_state);
+					       drm_crtc_state_to_vkms_crtc_state(old_crtc_state);
 
 		flush_work(&vkms_state->composer_work);
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index c55ab45ccb20..3501cd9401d5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -136,7 +136,7 @@ struct vkms_device {
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
-#define to_vkms_crtc_state(target)\
+#define drm_crtc_state_to_vkms_crtc_state(target)\
 	container_of(target, struct vkms_crtc_state, base)
 
 #define to_vkms_plane_state(target)\

-- 
2.44.2

