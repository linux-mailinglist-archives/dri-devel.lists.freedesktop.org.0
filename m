Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB05D5B35E1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919C110EC86;
	Fri,  9 Sep 2022 11:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329810EC6D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 10:59:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17E6F1F8F3;
 Fri,  9 Sep 2022 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662721191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4E7jhF5xSc6XXe66dNxisjRLgc34Azg3d4bOfAR+x3I=;
 b=I+PevDWV5D5NuBACbJhWej+H62oB3ekc3+8tvdH3g+bKAO6yyO5OeN0SxgOb7ZmJTnN1Mj
 +8zLVIyxfDO9tqEtNMv05Dtkv4qT5xhTfhM3XNVpf1Q4jijOn0HiiDcpDXQmd47XnVZMnE
 zQ+kke/JavM6VoKCzjpUu1eZ+qEDVyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662721191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4E7jhF5xSc6XXe66dNxisjRLgc34Azg3d4bOfAR+x3I=;
 b=acWpnypH7zu/ItN3peevksAqdA75VkTgo1q86hG1TgyDPo0uhFZIqQuYB3s0RB9LtJjiBg
 Api0CVPN/SbGMmDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4F0013AE9;
 Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QLtDL6YcG2M0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Sep 2022 10:59:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Subject: [PATCH 3/4] drm/plane-helper: Warn if atomic drivers call non-atomic
 helpers
Date: Fri,  9 Sep 2022 12:59:46 +0200
Message-Id: <20220909105947.6487-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane update and disable helpers are only useful for non-atomic
drivers. Print a warning if an atomic driver calls them.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_plane_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index c7785967f5bf..1c904fc26a58 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -30,8 +30,10 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 #define SUBPIXEL_MASK 0xffff
@@ -195,10 +197,14 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 		.x2 = crtc_x + crtc_w,
 		.y2 = crtc_y + crtc_h,
 	};
+	struct drm_device *dev = plane->dev;
 	struct drm_connector **connector_list;
 	int num_connectors, ret;
 	bool visible;
 
+	if (drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev)))
+		return -EINVAL;
+
 	ret = drm_plane_helper_check_update(plane, crtc, fb,
 					    &src, &dest,
 					    DRM_MODE_ROTATE_0,
@@ -260,6 +266,10 @@ EXPORT_SYMBOL(drm_plane_helper_update_primary);
 int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
+	struct drm_device *dev = plane->dev;
+
+	drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
+
 	return -EINVAL;
 }
 EXPORT_SYMBOL(drm_plane_helper_disable_primary);
-- 
2.37.2

