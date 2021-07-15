Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4D43CA4EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03C76E891;
	Thu, 15 Jul 2021 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6176E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:01:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91C4A22AE5;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626372096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=putbYCrhPT4H3f3Z33ufYj/zoJFAPkDUSZrutA4r9xk=;
 b=jPcVTHSv6bG1F8RTQR1Tr3BjDnY0UgT+zCmKEzYowiBPQKQGtAM+zz8BnsidOFVD7Z+5ZQ
 +ElNYwifz8f3BXDDUvg5pz3Uc6Xm22+vEENxMHIZgGrwGqQFlljfLL3S9UR5g0IUhGeoQl
 1nLa48ZxYS/wyfFfUrlsgoFRNKuk0VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626372096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=putbYCrhPT4H3f3Z33ufYj/zoJFAPkDUSZrutA4r9xk=;
 b=kolWniZexNkLu1bcuP6f+8ruiZ4ePS4odoumx0JR5nCi63jkxfy8Uy954FlbVNykH8Jawi
 LmHdg6HD9MZiWwCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A8E213C45;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AMgxFQB48GBoIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 18:01:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH 3/5] drm/gem: Clear mapping addresses for unused framebuffer
 planes
Date: Thu, 15 Jul 2021 20:01:31 +0200
Message-Id: <20210715180133.3675-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715180133.3675-1-tzimmermann@suse.de>
References: <20210715180133.3675-1-tzimmermann@suse.de>
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

Set the returned mapping address to NULL if a framebuffer plane does
not have a BO associated with it. Likewise, ignore mappings of NULL
during framebuffer unmap operations. Allows users of the functions to
perform unmap operations of certain BOs by themselfes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index cc4465100cc2..15b0fe3ee7b6 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -333,8 +333,10 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FORMA
 
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
@@ -373,6 +375,8 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FO
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

