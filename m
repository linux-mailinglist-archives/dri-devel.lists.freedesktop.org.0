Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E578BE1A6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8AA112E4F;
	Tue,  7 May 2024 12:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="R1PD3RhQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="crwdu0bx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R1PD3RhQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="crwdu0bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C26112D24;
 Tue,  7 May 2024 12:04:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CE8533E47;
 Tue,  7 May 2024 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DYmKKA9e8IjlpGoEu220a16xe1serag1Pq1sZdh8TE=;
 b=R1PD3RhQPi47n3gzA1F8p49wCxHGFbF3LqXcPl0/QsxA+kiFh0X6bCnUA6vj2R0nQ0GQ6D
 Ni6A+NLzbr1izy9REnLVjuZVhn7yVgZtjytKa054fs0btxTvtQLg7BnXc+6CGbut4EJoe2
 8TVhjWVpJ+OVy8GVpUrypRwB4JBsb5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DYmKKA9e8IjlpGoEu220a16xe1serag1Pq1sZdh8TE=;
 b=crwdu0bx3MSgr1KLrSVdU2wuYudVldoKiFzncUtc/hOQBqGkhEfS4N+7xP9gHr8Cuk5EQz
 udQ8PXm1YUje5RCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R1PD3RhQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=crwdu0bx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715083473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DYmKKA9e8IjlpGoEu220a16xe1serag1Pq1sZdh8TE=;
 b=R1PD3RhQPi47n3gzA1F8p49wCxHGFbF3LqXcPl0/QsxA+kiFh0X6bCnUA6vj2R0nQ0GQ6D
 Ni6A+NLzbr1izy9REnLVjuZVhn7yVgZtjytKa054fs0btxTvtQLg7BnXc+6CGbut4EJoe2
 8TVhjWVpJ+OVy8GVpUrypRwB4JBsb5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715083473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DYmKKA9e8IjlpGoEu220a16xe1serag1Pq1sZdh8TE=;
 b=crwdu0bx3MSgr1KLrSVdU2wuYudVldoKiFzncUtc/hOQBqGkhEfS4N+7xP9gHr8Cuk5EQz
 udQ8PXm1YUje5RCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7242413A2D;
 Tue,  7 May 2024 12:04:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WMO/GtAYOmZDCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 May 2024 12:04:32 +0000
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
Subject: [PATCH 09/11] drm/msm: Use fbdev client helpers
Date: Tue,  7 May 2024 13:58:30 +0200
Message-ID: <20240507120422.25492-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240507120422.25492-1-tzimmermann@suse.de>
References: <20240507120422.25492-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2CE8533E47
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[31];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,samsung.com,armlinux.org.uk,gmail.com,intel.com,ursulin.net,quicinc.com,linaro.org,poorly.run,somainline.org,ideasonboard.com,amd.com,nvidia.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RL346nweebskz488kew7dz74ge)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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
 drivers/gpu/drm/msm/msm_fbdev.c | 58 ++-------------------------------
 1 file changed, 3 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 030bedac632d0..86f87f55513d1 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -7,7 +7,6 @@
 #include <linux/fb.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -164,63 +163,12 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 };
 
 /*
- * struct drm_client
+ * struct drm_client_funcs
  */
 
-static void msm_fbdev_client_unregister(struct drm_client_dev *client)
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
-static int msm_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
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
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
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
 static const struct drm_client_funcs msm_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= msm_fbdev_client_unregister,
-	.restore	= msm_fbdev_client_restore,
-	.hotplug	= msm_fbdev_client_hotplug,
+	.owner = THIS_MODULE,
+	DRM_FBDEV_HELPER_CLIENT_FUNCS,
 };
 
 /* initialize fbdev helper */
-- 
2.44.0

