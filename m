Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9351F674
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1E10E243;
	Mon,  9 May 2022 08:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1BA10E243
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:16:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 791F51FA08;
 Mon,  9 May 2022 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652084165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoOgVrBzt1hakWhahKL2VgwPBFrPcy9Z3uH/Kl6NqQ4=;
 b=OqcgUvhPJy1r+UvLxKJbRQPjxwl6pIoY4nwmq4y8q3YBAPfDZdeaH0I91sOfqGbUAnEvIV
 MZoALLTcHfAJszLeRAvlSm2RXS8ZB4fhZhPolq6US9h4cLQpU9dt7/XBh0yw9s2ICQo2Gk
 CsxO1SuyEW78dUzyVPICAovedZUXPV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652084165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoOgVrBzt1hakWhahKL2VgwPBFrPcy9Z3uH/Kl6NqQ4=;
 b=+Kmk7ROzA6wwiUNc+GcFRmgPHQQNnOwaCS7O7yOOlJj1skQuu5Xc/c4uo1ocOnR5zImQD8
 NmimY6tEZBUo/CAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5076D132C0;
 Mon,  9 May 2022 08:16:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wOLgEsXNeGL5OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 08:16:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH 4/4] drm/gem: Warn on trying to use a non-existing framebuffer
 plane
Date: Mon,  9 May 2022 10:16:02 +0200
Message-Id: <20220509081602.474-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
References: <20220509081602.474-1-tzimmermann@suse.de>
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

Warn if callers of drm_gem_fb_get_obj() try to use a GEM buffer for
a non-existing or unset plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 09e90e19cd93..291f9ae4359d 100644
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
2.36.0

