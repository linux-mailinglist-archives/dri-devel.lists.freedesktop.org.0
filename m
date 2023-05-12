Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A77002DE
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A35E10E653;
	Fri, 12 May 2023 08:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572A810E595;
 Fri, 12 May 2023 08:41:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 500FC2043B;
 Fri, 12 May 2023 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683880917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjuO+DxwR+YcO4n2FyX/dbJKiEf4TVp7gUioRCpA2lE=;
 b=IZRNxrtHGu0dxUAJX2sQPRM7gNsTKHYrEP0W/ERcJ8iwOu9CPS3eprCrJDEMM8c+IszlN1
 cbUD/jNny49BU5YH+7EFz2qYbx83thn9yzZvhid2bIpfSdQ7v+RnV5OLwqWX3LSJgEq5KW
 KhNfbgcoM5r7bS5Qx5lk9QV1+Sh5meE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683880917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjuO+DxwR+YcO4n2FyX/dbJKiEf4TVp7gUioRCpA2lE=;
 b=r7guFR5Xv9rWXRQaaSnjfpviJje2A+6SyiXKKbGF8Hlb7NhKr2o6aijVezJO/1Eh3Ogkxy
 jygU2c4iPNoI0ZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1022113A0A;
 Fri, 12 May 2023 08:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCQcA9X7XWQZKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 09/11] drm/fb-helper: Export helpers for marking damage areas
Date: Fri, 12 May 2023 10:41:50 +0200
Message-Id: <20230512084152.31233-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
References: <20230512084152.31233-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 19 +++++++++++++++++--
 include/drm/drm_fb_helper.h     |  4 ++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f0e9549b6bd7..8724e08c518b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -625,13 +625,15 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
-static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
-				 u32 width, u32 height)
+/* Don't use in new code. */
+void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
+			  u32 width, u32 height)
 {
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
 	schedule_work(&helper->damage_work);
 }
+EXPORT_SYMBOL(drm_fb_helper_damage);
 
 /*
  * Convert memory region into area of scanlines and pixels per
@@ -670,6 +672,19 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
 }
 
+/* Don't use in new code. */
+void drm_fb_helper_damage_range(struct drm_fb_helper *fb_helper, off_t off, size_t len)
+{
+	struct fb_info *info = fb_helper->info;
+	struct drm_rect damage_area;
+
+	drm_fb_helper_memory_range_to_clip(info, off, len, &damage_area);
+	drm_fb_helper_damage(fb_helper, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+}
+EXPORT_SYMBOL(drm_fb_helper_damage_range);
+
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 72032c354a30..80c402f4e379 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -253,6 +253,10 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
 			     struct drm_fb_helper_surface_size *sizes);
 
+void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
+			  u32 width, u32 height);
+void drm_fb_helper_damage_range(struct drm_fb_helper *helper, off_t off, size_t len);
+
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
-- 
2.40.1

