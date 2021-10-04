Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85D420725
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D526E951;
	Mon,  4 Oct 2021 08:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5F56E951
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 08:15:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4566221A9;
 Mon,  4 Oct 2021 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633335308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rojQL7e1ouztSEaV9Q71gz9uvf7Uo74SKxG0DhRXkM0=;
 b=CzAku2nthDUdaS/9yUhQgxkqtnaDDR+femEnJMKZGuZgtwkQcklp2vdfWPw4tz///AM5WC
 tYsjbRu5a7+hOB0nwDcFTgpAn1+K9aqizw4vO8PCaSWnExPDU3GjshVgCbNJSkzYDZxRWZ
 loIBqW+zXub7WGixZKU2ptzfRHtihQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633335308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rojQL7e1ouztSEaV9Q71gz9uvf7Uo74SKxG0DhRXkM0=;
 b=Ml2vISKyGTP8+CACrvzbJVsMx5jF0rzH+wW0OO6AO/oNp6ZmEfAqTjh019LbGKnHSZ7mkH
 tyWypQIs+AUoEgDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7412D139C1;
 Mon,  4 Oct 2021 08:15:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K+BWGwy4WmGkFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Oct 2021 08:15:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 stable@vger.kernel.org
Subject: [PATCH] drm/fbdev: Clamp fbdev surface size if too large
Date: Mon,  4 Oct 2021 10:15:06 +0200
Message-Id: <20211004081506.6791-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clamp the fbdev surface size of the available maximum height to avoid
failing to init console emulation. An example error is shown below.

  bad framebuffer height 2304, should be >= 768 && <= 768
  [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
  simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-22)

This is especially a problem with drivers that have very small screen
sizes and cannot over-allocate at all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Reported-by: Amanoel Dawod <kernel@amanoeldawod.com>
Reported-by: Zoltán Kővágó <dirty.ice.hu@gmail.com>
Reported-by: Michael Stapelberg <michael+lkml@stapelberg.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 6860223f0068..364f11900b37 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1508,6 +1508,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 	int ret = 0;
 	int crtc_count = 0;
 	struct drm_connector_list_iter conn_iter;
@@ -1665,6 +1666,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 	/* Handle our overallocation */
 	sizes.surface_height *= drm_fbdev_overalloc;
 	sizes.surface_height /= 100;
+	if (sizes.surface_height > config->max_height) {
+		drm_warn(dev, "Fbdev over-allocation too large; clamping height to %d\n",
+			 config->max_height);
+		sizes.surface_height = config->max_height;
+	}

 	/* push down into drivers */
 	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
--
2.33.0

