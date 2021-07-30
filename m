Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516193DBE6B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 20:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881986E438;
	Fri, 30 Jul 2021 18:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1916E223
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 18:35:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 185AE22361;
 Fri, 30 Jul 2021 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627670115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ko4ttiW57CgjLX1lIMTy9O3JrCsFKLr1AjEyHc8nDyM=;
 b=AiBD9J9abXteD0oV90VdoQOjKjyXkhbd2bqm5wDfbDIpb8H4dor28a39NE2bZMXUnPDqTG
 tSmYYdPvs4z+tMxJSd6QU5e9cxUd5xrngi/fXr7EkCZwys98Y6W3CuAtp/wfZ4mnTyS6Mh
 rx5j8d8qnGQzQtotagQ+XHPgaDO4PAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627670115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ko4ttiW57CgjLX1lIMTy9O3JrCsFKLr1AjEyHc8nDyM=;
 b=Amf+433jNgO+rItItsUlvgx5RVKoiovJAuv5C6HhxTWcQqI59UGslVA1fgdNE9VywBelPb
 rAbL+OgpMBiM22AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B182013C3D;
 Fri, 30 Jul 2021 18:35:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aKEDKmJGBGGUVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Jul 2021 18:35:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/5] drm/gem: Clear mapping addresses for unused
 framebuffer planes
Date: Fri, 30 Jul 2021 20:35:09 +0200
Message-Id: <20210730183511.20080-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730183511.20080-1-tzimmermann@suse.de>
References: <20210730183511.20080-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the returned mapping address to NULL if a framebuffer plane does
not have a BO associated with it. Likewise, ignore mappings of NULL
during framebuffer unmap operations. Allows users of the functions to
perform unmap operations of certain BOs by themselfes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 243affbad437..02928607a716 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -336,8 +336,10 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
 
 	for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
 		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
+		if (!obj) {
+			dma_buf_map_clear(&map[i]);
 			continue;
+		}
 		ret = drm_gem_vmap(obj, &map[i]);
 		if (ret)
 			goto err_drm_gem_vunmap;
@@ -377,6 +379,8 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj)
 			continue;
+		if (dma_buf_map_is_null(&map[i]))
+			continue;
 		drm_gem_vunmap(obj, &map[i]);
 	}
 }
-- 
2.32.0

