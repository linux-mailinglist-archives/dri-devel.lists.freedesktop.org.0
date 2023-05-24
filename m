Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B270F260
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D43E10E5EA;
	Wed, 24 May 2023 09:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C17610E5C4;
 Wed, 24 May 2023 09:21:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E5C21FE24;
 Wed, 24 May 2023 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684920117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJ2zRdSISjXxkznRIjUJwZryXZxJdxu9+Ef1+QciFH0=;
 b=1lupMwtHLWZkoMESvrn/VtY9tZ0bgUtAuZDJcIPDWWN1poYoPux2I3mBvVtFqpezfM30MV
 djI835QccjYWA6Mwl+NPNnZ1JHyn5OcZTyIeQK+6+A90O9Pvw4eFe7RybIj/z6eBFQ0q7f
 QDpBDl/j0uxWMLHIuugy2CrH+3BgjE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684920117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJ2zRdSISjXxkznRIjUJwZryXZxJdxu9+Ef1+QciFH0=;
 b=SxBSaTFPRqIhmGEm2vUzXW8SCainn9rhwv3dGXZpN9Mf446w+IULZ2QFGfbX7Srto6sUwb
 nmI3YZUJvDdcIuDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED8E613A10;
 Wed, 24 May 2023 09:21:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qKgqOTTXbWTHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 09:21:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Subject: [PATCH v4 11/13] drm/fb-helper: Export helpers for marking damage
 areas
Date: Wed, 24 May 2023 11:21:48 +0200
Message-Id: <20230524092150.11776-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524092150.11776-1-tzimmermann@suse.de>
References: <20230524092150.11776-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export drm_fb_helper_damage() and drm_fb_helper_damage_range(), which
handle damage areas for fbdev emulation. This is a temporary export
that allows to move the DRM I/O helpers for fbdev into drivers. Only
fbdev-generic and i915 need them. Both will be updated to implement
damage handling by themselves and the exported functions will be removed.

v4:
	* update interfaces

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 22 ++++++++++++++++++++++
 include/drm/drm_fb_helper.h     |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f0e9549b6bd7..cb03099fd2e3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -670,6 +670,28 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
 }
 
+/* Don't use in new code. */
+void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_rect damage_area;
+
+	drm_fb_helper_memory_range_to_clip(info, off, len, &damage_area);
+	drm_fb_helper_damage(fb_helper, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+}
+EXPORT_SYMBOL(drm_fb_helper_damage_range);
+
+/* Don't use in new code. */
+void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	drm_fb_helper_damage(fb_helper, x, y, width, height);
+}
+EXPORT_SYMBOL(drm_fb_helper_damage_area);
+
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 72032c354a30..7d5804882be7 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -253,6 +253,9 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
 			     struct drm_fb_helper_surface_size *sizes);
 
+void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len);
+void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height);
+
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
-- 
2.40.1

