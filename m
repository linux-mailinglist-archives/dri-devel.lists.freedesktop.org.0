Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A971E3F99
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 13:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FA06E2DE;
	Wed, 27 May 2020 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8976E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 11:11:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so831709wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7Cx89zD5mRPpGV0aex2UawQK9YUSD/PmBjIwQKsunU=;
 b=FF4Jb+lj+o+oeJ3CA43/k4b4yRYDZgxtRW+N0SEd6sWKe+KF6NTpNHgq47jQObD5O9
 owaksMu2R9oCzXFz2QpynM96Y8TCQZUb8p/2Ame8osBILljCD0jdbl5LfzzxyR3KNWvS
 SBDdBHvEOQfeYS6iDTjK9bB+wAf2scr5rvCuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7Cx89zD5mRPpGV0aex2UawQK9YUSD/PmBjIwQKsunU=;
 b=PdEkxVciz6q5q4E2wt+qA5XpixYEGT1dszy8pXGiOFRc7AXl6+uQmVZKiF2KfkOeG6
 Hyi5Ny40DwPeyJ/KyKIaLKn88wSt1G8pzJXFe/0OY6erTIN3+iuz2T+DwwYX0oPm3FNm
 mPaNrAjCbgk3VlDH+m6S6EziavtlT9LFiLGTo0Eyt1o4oUs911qqfJT+HwkGuad4pTR2
 bdAAnTptFGO7G2Wr4GdF30DxiBwXSVVBlfKVETNHbd+Je24ZploWdWZCrcKnCJYAMgcc
 tSN/SEwmOUVwUg55sYA7FK+LN7R44Wttl3QYfXlv+cLuqXIuUfq1VJsg3G84Vi8Lupy3
 4e1g==
X-Gm-Message-State: AOAM530QcvSBpT0tejdfs+O6BuPYEreVA8nwYviVEbexGqodsVNd2J7H
 wcL9ePZkD6jM21Zd7PvNwFQYWTMykd0=
X-Google-Smtp-Source: ABdhPJxG6WYgR1xfbdjdPk2jmnFPrWRTdMJdVLaNS6FpxHv4XsESGiIFEV+DWHz+assVZnd6EN3M5Q==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr7210520wrs.172.1590577900178; 
 Wed, 27 May 2020 04:11:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 190sm2686274wmb.23.2020.05.27.04.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 04:11:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: use drm_dev_has_vblank more
Date: Wed, 27 May 2020 13:11:34 +0200
Message-Id: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For historical reasons it's called dev->num_crtcs, which is rather
confusing ever since kms was added. But now we have a nice helper, so
let's use it for better readability!

Only code change is in atomic helpers: vblank support means that
dev->irq_enabled must be set too. Another one of these quirky things
... But since it's implied we can simplify that check.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic_helper.c |  2 +-
 drivers/gpu/drm/drm_irq.c           |  2 +-
 drivers/gpu/drm/drm_vblank.c        | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0a541368246e..bfcc7857a9a1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1097,7 +1097,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		else if (funcs->dpms)
 			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
 
-		if (!(dev->irq_enabled && dev->num_crtcs))
+		if (!drm_dev_has_vblank(dev))
 			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 588be45abd7a..09d6e9e2e075 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -181,7 +181,7 @@ int drm_irq_uninstall(struct drm_device *dev)
 	 * vblank/irq handling. KMS drivers must ensure that vblanks are all
 	 * disabled when uninstalling the irq handler.
 	 */
-	if (dev->num_crtcs) {
+	if (drm_dev_has_vblank(dev)) {
 		spin_lock_irqsave(&dev->vbl_lock, irqflags);
 		for (i = 0; i < dev->num_crtcs; i++) {
 			struct drm_vblank_crtc *vblank = &dev->vblank[i];
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index e278d6407f8e..162d9f7e692a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -605,7 +605,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 	int linedur_ns = 0, framedur_ns = 0;
 	int dotclock = mode->crtc_clock;
 
-	if (!dev->num_crtcs)
+	if (!drm_dev_has_vblank(dev))
 		return;
 
 	if (WARN_ON(pipe >= dev->num_crtcs))
@@ -1065,7 +1065,7 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 	unsigned int pipe = drm_crtc_index(crtc);
 	ktime_t now;
 
-	if (dev->num_crtcs > 0) {
+	if (drm_dev_has_vblank(dev)) {
 		seq = drm_vblank_count_and_time(dev, pipe, &now);
 	} else {
 		seq = 0;
@@ -1137,7 +1137,7 @@ static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 	unsigned long irqflags;
 	int ret = 0;
 
-	if (!dev->num_crtcs)
+	if (!drm_dev_has_vblank(dev))
 		return -EINVAL;
 
 	if (WARN_ON(pipe >= dev->num_crtcs))
@@ -1506,7 +1506,7 @@ static void drm_legacy_vblank_pre_modeset(struct drm_device *dev,
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
 	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!dev->num_crtcs)
+	if (!drm_dev_has_vblank(dev))
 		return;
 
 	if (WARN_ON(pipe >= dev->num_crtcs))
@@ -1533,7 +1533,7 @@ static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
 	unsigned long irqflags;
 
 	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!dev->num_crtcs)
+	if (!drm_dev_has_vblank(dev))
 		return;
 
 	if (WARN_ON(pipe >= dev->num_crtcs))
@@ -1558,7 +1558,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
 	unsigned int pipe;
 
 	/* If drm_vblank_init() hasn't been called yet, just no-op */
-	if (!dev->num_crtcs)
+	if (!drm_dev_has_vblank(dev))
 		return 0;
 
 	/* KMS drivers handle this internally */
@@ -1896,7 +1896,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	unsigned long irqflags;
 	bool disable_irq, fence_cookie;
 
-	if (WARN_ON_ONCE(!dev->num_crtcs))
+	if (WARN_ON_ONCE(!drm_dev_has_vblank(dev)))
 		return false;
 
 	if (WARN_ON(pipe >= dev->num_crtcs))
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
