Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7582BA755
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BFF6E8A3;
	Fri, 20 Nov 2020 10:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5386E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21D88AF06;
 Fri, 20 Nov 2020 10:25:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 10/10] drm/fb-helper: Acquire modeset lock around
 shadow-buffer flushing
Date: Fri, 20 Nov 2020 11:25:45 +0100
Message-Id: <20201120102545.4047-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120102545.4047-1-tzimmermann@suse.de>
References: <20201120102545.4047-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flushing the fbdev's shadow buffer requires vmap'ing the BO memory, which
in turn requires pinning the BO. While being pinned, the BO cannot be moved
into VRAM for scanout. Consequently, a concurrent modeset operation that
involves the fbdev framebuffer would likely fail.

Resolve this problem be acquiring the modeset lock of the planes that use
the fbdev framebuffer. On non-atomic drivers, also acquire the mode-config
lock. This serializes the flushing of the framebuffer with concurrent
modeset operations.

v2:
	* only acquire struct drm_fb_helper.lock in damage blitter (Daniel,
	  Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d972ce75d180..6f2763467e99 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -398,16 +398,32 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 	struct dma_buf_map map, dst;
 	int ret;
 
+	/*
+	 * We have to pin the client buffer to its current location while
+	 * flushing the shadow buffer. In the general case, concurrent
+	 * modesetting operations could try to move the buffer and would
+	 * fail. The modeset has to be serialized by acquiring the reservation
+	 * object of the underlying BO here.
+	 *
+	 * For fbdev emulation, we only have to protect against fbdev modeset
+	 * operations. Nothing else will involve the client buffer's BO. So it
+	 * is sufficient to acquire struct drm_fb_helper.lock here.
+	 */
+	mutex_lock(&fb_helper->lock);
+
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret)
-		return ret;
+		goto out;
 
 	dst = map;
 	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap(buffer);
 
-	return 0;
+out:
+	mutex_unlock(&fb_helper->lock);
+
+	return ret;
 }
 
 static void drm_fb_helper_damage_work(struct work_struct *work)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
