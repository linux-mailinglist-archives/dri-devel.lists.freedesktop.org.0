Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17F52A07C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0710E3E6;
	Tue, 17 May 2022 11:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9A110E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CD8B21D45;
 Tue, 17 May 2022 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652787209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXlgwe7cmjfTte6W33PUXFnJ2Octqg9tYF7S67c92gY=;
 b=NHUK5QGmQO20+ayOyaaYq5O/lAm2IUGZ8h5V2wWd0FhKprM8nkTZpIoeFacLwq6584SYem
 RJqwJ8hZs6xZZKTV8pSYC90S5c2uXYtfdHX9U9NPvy9gNVR3WOo0mEClEzStZx1g1a0+Hb
 FolrJGBujWN4VqY2tZseWuJPAKVGTH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652787209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXlgwe7cmjfTte6W33PUXFnJ2Octqg9tYF7S67c92gY=;
 b=+bRpxNtx0tpuPKow5N5iN5uGdKG0pPQtN49f+pDhNqfrIskdKdn5Y/8quHupnmTFG6kRba
 NQEV5PymA/5U3JBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 504A613B12;
 Tue, 17 May 2022 11:33:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCy+EgmIg2KqdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 11:33:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH v2 5/5] drm/gem: Warn on trying to use a non-existing
 framebuffer plane
Date: Tue, 17 May 2022 13:33:27 +0200
Message-Id: <20220517113327.26919-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517113327.26919-1-tzimmermann@suse.de>
References: <20220517113327.26919-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Warn if callers of drm_gem_fb_get_obj() try to use a GEM buffer for
a non-existing or unset plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 6d3c26efdeeb..61339a9cd010 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -53,7 +53,11 @@ MODULE_IMPORT_NS(DMA_BUF);
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane)
 {
-	if (plane >= ARRAY_SIZE(fb->obj))
+	struct drm_device *dev = fb->dev;
+
+	if (drm_WARN_ON_ONCE(dev, plane >= ARRAY_SIZE(fb->obj)))
+		return NULL;
+	else if (drm_WARN_ON_ONCE(dev, !fb->obj[plane]))
 		return NULL;
 
 	return fb->obj[plane];
-- 
2.36.1

