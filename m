Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998407F460C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179110E61A;
	Wed, 22 Nov 2023 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1E10E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50E2F2197D;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HChQuP8TIlVwofRi2Q7IymIxCVTVbsjpZB9wgw9N/XY=;
 b=m81lnGF6i26dveMQZcu1iqXzlPFh9UyCuuts1ZTa+dIInu+Nuyxvt31LsNT8OkWmX9hO8m
 muipnwxJfeiMhI5LY7nCd1qmMmtHhQd2r/cwnM3tmY3rfTAQed7Dtk90SHz0HrMR0J8kEq
 0sVT1uRARXCcpliNXrrSYKNlrfc43/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HChQuP8TIlVwofRi2Q7IymIxCVTVbsjpZB9wgw9N/XY=;
 b=85iTHOfSXJ5p2HEj+T0lq4WF+nuR0d8ZY/xWxmA3yM7xd7GmfBQoGHYplBHn6mGSMPwpZ9
 NS9gNDaqQ10zWVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F43013A6E;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MMnIBhfzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 09/14] drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
Date: Wed, 22 Nov 2023 13:09:38 +0100
Message-ID: <20231122122449.11588-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
References: <20231122122449.11588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM drivers with user-space mode setting have been removed in Linux
v6.3. [1] Now remove the ioctl entry points for these drivers. Invoking
any of the ioctl ops will unconditionally return -EINVAL to user space.

Invoking DRM_IOCTL_MODESET_CTL is different from the other legacy
ioctl ops as it returns 0 even without CONFIG_DRM_LEGACY set. From the
original commit 29935554b384 ("drm: Disallow DRM_IOCTL_MODESET_CTL for
KMS drivers") it is not apparent how or why the operation differs from
the others. It is likely just an oversight in commit 61ae227032e7
("drm: allow removal of legacy codepaths (v4.1)"), which allowed
disabling leagacy ioctls in the first place. Still keep this removal
separate from the other ioctls to allow an easy revert, if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/111602/ # [1]
---
 drivers/gpu/drm/drm_internal.h |  2 -
 drivers/gpu/drm/drm_ioctl.c    |  2 -
 drivers/gpu/drm/drm_vblank.c   | 82 ----------------------------------
 3 files changed, 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b12c463bc4605..a538a48c7d952 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -117,8 +117,6 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank);
 /* IOCTLS */
 int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *filp);
-int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file_priv);
 
 /* drm_irq.c */
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e6c32f76c7452..9c6326b908e74 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -585,8 +585,6 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 
 	DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_UNLOCKED),
 
-	DRM_IOCTL_DEF(DRM_IOCTL_MODESET_CTL, drm_legacy_modeset_ctl_ioctl, 0),
-
 	DRM_IOCTL_DEF(DRM_IOCTL_UPDATE_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 877e2067534fa..a11f164b2384f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1574,88 +1574,6 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
-static void drm_legacy_vblank_pre_modeset(struct drm_device *dev,
-					  unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!drm_dev_has_vblank(dev))
-		return;
-
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
-	/*
-	 * To avoid all the problems that might happen if interrupts
-	 * were enabled/disabled around or between these calls, we just
-	 * have the kernel take a reference on the CRTC (just once though
-	 * to avoid corrupting the count if multiple, mismatch calls occur),
-	 * so that interrupts remain enabled in the interim.
-	 */
-	if (!vblank->inmodeset) {
-		vblank->inmodeset = 0x1;
-		if (drm_vblank_get(dev, pipe) == 0)
-			vblank->inmodeset |= 0x2;
-	}
-}
-
-static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
-					   unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!drm_dev_has_vblank(dev))
-		return;
-
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
-	if (vblank->inmodeset) {
-		spin_lock_irq(&dev->vbl_lock);
-		drm_reset_vblank_timestamp(dev, pipe);
-		spin_unlock_irq(&dev->vbl_lock);
-
-		if (vblank->inmodeset & 0x2)
-			drm_vblank_put(dev, pipe);
-
-		vblank->inmodeset = 0;
-	}
-}
-
-int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file_priv)
-{
-	struct drm_modeset_ctl *modeset = data;
-	unsigned int pipe;
-
-	/* If drm_vblank_init() hasn't been called yet, just no-op */
-	if (!drm_dev_has_vblank(dev))
-		return 0;
-
-	/* KMS drivers handle this internally */
-	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
-		return 0;
-
-	pipe = modeset->crtc;
-	if (pipe >= dev->num_crtcs)
-		return -EINVAL;
-
-	switch (modeset->cmd) {
-	case _DRM_PRE_MODESET:
-		drm_legacy_vblank_pre_modeset(dev, pipe);
-		break;
-	case _DRM_POST_MODESET:
-		drm_legacy_vblank_post_modeset(dev, pipe);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 				  u64 req_seq,
 				  union drm_wait_vblank *vblwait,
-- 
2.42.1

