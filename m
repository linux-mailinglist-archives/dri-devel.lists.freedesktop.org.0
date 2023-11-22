Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883917F4611
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FB310E61B;
	Wed, 22 Nov 2023 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8710E021
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9FFF71FD61;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUsEA1V6P3yv/pqxSL7vhfmhGH1AKC3W9uRhXfallqc=;
 b=k0GM1LISc+eH+/CEtbqDPoH78eIgvKRQPaQErYUXMKHierWoCDEfu0kNl0mLfvbJX4v9aC
 k9FhcenD30z2QXJdZHzh4pPknqtUDAHsu4XRjLP00sxoGuGuHOLBCICmdNA5HwqdH0eRCX
 RdSrDCSTa+jNNND/z3TsYs4FWNmKbhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUsEA1V6P3yv/pqxSL7vhfmhGH1AKC3W9uRhXfallqc=;
 b=jyCSfPkCihsJRlWTmteg7iXY0UHeKkWeFbrxNNyLxsGmMEom9+4MiEdqH6/YxEpSBkyEO9
 GovS/t29Vh+mtBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80FB813467;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kISpHhfzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 11/14] drm: Remove locking for legacy ioctls and DRM_UNLOCKED
Date: Wed, 22 Nov 2023 13:09:40 +0100
Message-ID: <20231122122449.11588-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
References: <20231122122449.11588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
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

Modern DRM drivers acquire ioctl locks by themselves. Legacy ioctls
for user-space mode setting used to acquire drm_global_mutex. After
removing the ioctl entry points, also remove the locking code. The only
legacy ioctl without global locking was VBLANK_WAIT, which has been
removed as well. Hence remove the related DRM_UNLOCKED flag.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_ioc32.c |  2 +-
 drivers/gpu/drm/drm_ioctl.c | 23 +++++++----------------
 include/drm/drm_ioctl.h     | 11 -----------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 910cadf14756e..129e2b91dbfe7 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -273,7 +273,7 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.type = req32.request.type;
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
-	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
+	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, 0);
 
 	req32.reply.type = req.reply.type;
 	req32.reply.sequence = req.reply.sequence;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9c6326b908e74..1cf1de342d6aa 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -583,7 +583,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 
 	DRM_IOCTL_DEF(DRM_IOCTL_FINISH, drm_noop, DRM_AUTH),
 
-	DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, 0),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_UPDATE_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 
@@ -716,7 +716,7 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
-	int retcode;
+	int ret;
 
 	/* Update drm_file owner if fd was passed along. */
 	drm_file_update_pid(file_priv);
@@ -724,20 +724,11 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
-	retcode = drm_ioctl_permit(flags, file_priv);
-	if (unlikely(retcode))
-		return retcode;
-
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
-		mutex_unlock(&drm_global_mutex);
-	}
-	return retcode;
+	ret = drm_ioctl_permit(flags, file_priv);
+	if (unlikely(ret))
+		return ret;
+
+	return func(dev, kdata, file_priv);
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
 
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 6ed61c371f6ce..171760b6c4a14 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -109,17 +109,6 @@ enum drm_ioctl_flags {
 	 * This is equivalent to callers with the SYSADMIN capability.
 	 */
 	DRM_ROOT_ONLY		= BIT(2),
-	/**
-	 * @DRM_UNLOCKED:
-	 *
-	 * Whether &drm_ioctl_desc.func should be called with the DRM BKL held
-	 * or not. Enforced as the default for all modern drivers, hence there
-	 * should never be a need to set this flag.
-	 *
-	 * Do not use anywhere else than for the VBLANK_WAIT IOCTL, which is the
-	 * only legacy IOCTL which needs this.
-	 */
-	DRM_UNLOCKED		= BIT(4),
 	/**
 	 * @DRM_RENDER_ALLOW:
 	 *
-- 
2.42.1

