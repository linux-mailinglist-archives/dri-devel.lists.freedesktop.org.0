Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C85600D86
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7652710ED42;
	Mon, 17 Oct 2022 11:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAED10ED3A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:15:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 469082049D;
 Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666005313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5hczHI5AVvv+yNB31MfJqMEzqMw2r2346vJDYwbn8o=;
 b=cZepE0BDwMHlMLTeswpsdNvXuST0i8MXm077zm+MTocTOuWFh3AoBNTQTFfhZAvHU6z/87
 tPBmAuiO+l6p6z4Nb6It4lY9G42LK2K9TgUrtA46xUB/xphOp4/4Klh+YinTBY1yXyUhpY
 BP9GvfPM6InDQOLD+3AO278sjTBz92A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666005313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5hczHI5AVvv+yNB31MfJqMEzqMw2r2346vJDYwbn8o=;
 b=3bUzyHOnek6Rk+PTyQZO8KEPnSadbHiayGsIeHS2+3Z/7G7YvKnpwlVAZIz7SbZyMA1drY
 Ota0Qd8HrC0ZFhBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07F9113ABE;
 Mon, 17 Oct 2022 11:15:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0MUEAUE5TWOgBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Oct 2022 11:15:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, hdegoede@redhat.com,
 noralf@tronnes.org, david@lechnology.com, airlied@redhat.com,
 sean@poorly.run
Subject: [PATCH 4/5] drm/repaper: Implement {begin,end}_fb_access helpers
Date: Mon, 17 Oct 2022 13:15:09 +0200
Message-Id: <20221017111510.20818-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017111510.20818-1-tzimmermann@suse.de>
References: <20221017111510.20818-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call drm_gem_fb_begin_cpu_access() and drm_gem_fb_end_cpu_access() in
the simple pipe's {begin,end}_fb_access helpers. This allows to abort
commits correctly after observing an error.

Remove the corresponding CPU-access calls from the driver's damage
handler. It runs during the atomic-apply phase when it's already too
late to handle errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/repaper.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index e62f4d16b2c6b..e0f1ac8ab2186 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -539,10 +539,6 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 		goto out_exit;
 	}
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		goto out_free;
-
 	iosys_map_set_vaddr(&dst, buf);
 	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);
@@ -596,8 +592,6 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 			}
 	}
 
-out_free:
-	kfree(buf);
 out_exit:
 	drm_dev_exit(idx);
 
@@ -839,11 +833,35 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 		repaper_fb_dirty(state->fb);
 }
 
+static int repaper_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
+					struct drm_plane_state *plane_state)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+
+	if (!fb)
+		return 0;
+
+	return drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
+static void repaper_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
+				       struct drm_plane_state *plane_state)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+
+	if (!fb)
+		return;
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
 static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 	.mode_valid = repaper_pipe_mode_valid,
 	.enable = repaper_pipe_enable,
 	.disable = repaper_pipe_disable,
 	.update = repaper_pipe_update,
+	.begin_fb_access = repaper_pipe_begin_fb_access,
+	.end_fb_access = repaper_pipe_end_fb_access,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
-- 
2.38.0

