Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7988BE1A9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5B6112D9D;
	Tue,  7 May 2024 12:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oEdtaoc9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="omra+ddz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iiYQ9Rhs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6vRvC90y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754A5112DD8;
 Tue,  7 May 2024 12:04:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3AA433E42;
 Tue,  7 May 2024 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEnLBh1h25LDcbiMMul4lJuGQWW2btEtznlLpdd5WTs=;
 b=oEdtaoc9CiJd5R9Sd/7uO7fICsQCxn6qIvuPdHDpzh9NCHI58Hy+XGezeI+ounDTHiE5eM
 T7ZNF9xBgl4bwGUNtpx9MRgdkp3ohf1t1HE43hF5WycFnXxoPFhHW0VKnZz1iTwnfQXghM
 B8Vgp4THgrPEf/eFZrI/j1bSznGptXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEnLBh1h25LDcbiMMul4lJuGQWW2btEtznlLpdd5WTs=;
 b=omra+ddzTdfCKMqiTyUi8PkQlZvln5dZG36XRNUmTHalzz4KXlZelUS2LiuJSJbTWRvEfC
 I0lXVFbUDfLJK8Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEnLBh1h25LDcbiMMul4lJuGQWW2btEtznlLpdd5WTs=;
 b=iiYQ9RhsA74u5f8A0QmW3k3eU0JkK3nMgd9lbW7GM3vNV7OhXN66BumQ2R2b68bLcp92Nr
 zm0LoLnpq4OjFjJwvz1uVL9iAwEIcAl4PK0tZTfrdv1ohX4PKQ4uuyoYoz+q5fRSdacJs5
 qdQB2fkjU+/Y6Xxa6V6VWRxkkzpIKEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEnLBh1h25LDcbiMMul4lJuGQWW2btEtznlLpdd5WTs=;
 b=6vRvC90y9JdTs6M4kw1nYdWb0i8rNY1ckacAZGwJk3VNj5Sj9yWTzEBD3ReEvG/xbfEU4S
 vmoZlrd+TPQm/yAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32C5B13A3A;
 Tue,  7 May 2024 12:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CMQoC9EYOmZDCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 May 2024 12:04:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, linux@armlinux.org.uk, krzk@kernel.org,
 alim.akhtar@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/11] drm/omapdrm: Use fbdev client helpers
Date: Tue,  7 May 2024 13:58:31 +0200
Message-ID: <20240507120422.25492-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240507120422.25492-1-tzimmermann@suse.de>
References: <20240507120422.25492-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
 RCPT_COUNT_TWELVE(0.00)[31]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,samsung.com,armlinux.org.uk,gmail.com,intel.com,ursulin.net,quicinc.com,linaro.org,poorly.run,somainline.org,ideasonboard.com,amd.com,nvidia.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLsz1b6kfjnxepzm54dz9rbnku)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Implement struct drm_client_funcs with the respective helpers and
remove the custom code from the emulation. The generic helpers are
equivalent in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 55 ++--------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 523be34682caf..f6c131932a756 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -7,7 +7,6 @@
 #include <linux/fb.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
@@ -280,60 +279,12 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi)
 }
 
 /*
- * struct drm_client
+ * struct drm_client_funcs
  */
 
-static void omap_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int omap_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
 static const struct drm_client_funcs omap_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= omap_fbdev_client_unregister,
-	.restore	= omap_fbdev_client_restore,
-	.hotplug	= omap_fbdev_client_hotplug,
+	.owner = THIS_MODULE,
+	DRM_FBDEV_HELPER_CLIENT_FUNCS,
 };
 
 void omap_fbdev_setup(struct drm_device *dev)
-- 
2.44.0

