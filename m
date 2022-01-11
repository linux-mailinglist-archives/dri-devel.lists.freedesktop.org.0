Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7448AE66
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB977112675;
	Tue, 11 Jan 2022 13:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CDD112675
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:26:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CA0F1F37D;
 Tue, 11 Jan 2022 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641907598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fuN1zSvbLQO34LFdSqcLLNXfAeKz76ixJcqK3zRZ0gM=;
 b=HK+9z9QgBS9sNaJHt6CXrACw9BPtg1uwenEobH8WahC+npSpKYSN6i7kgcBm5JdQ1t9+Zb
 FKH476ZzLHi/BKdQQzKDbliZJ2RbZBDUPkPgrHuUFBMmx+6sg6iE8s+Oi1LVI6HYnYVpHF
 LlnsYfF3Di9i4EW0WDtdGUlpjGuD9hQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641907598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fuN1zSvbLQO34LFdSqcLLNXfAeKz76ixJcqK3zRZ0gM=;
 b=s2+mrP4ZXclyCY2JbzJ9ulH/pxKy2/ZjzzRKDGbFTVtNUh6ID+KY8IEE/9Acfanh+3BioD
 NR3fd9Mi7Zs9QaBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6029E13AB2;
 Tue, 11 Jan 2022 13:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cLuYFo6F3WGJRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 13:26:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy
Date: Tue, 11 Jan 2022 14:26:34 +0100
Message-Id: <20220111132634.18302-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the source-buffer address after mapping the buffer into the
kernel's address space. Makes MIPI DBI helpers work again.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: c47160d8edcd ("drm/mipi-dbi: Remove dependency on GEM CMA helper library")
Reported-by: Noralf Trønnes <noralf@tronnes.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index ded8968b3e8a..0327d595e028 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -209,11 +209,11 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
-	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 
 	ret = drm_gem_fb_vmap(fb, map, data);
 	if (ret)
 		goto out_drm_gem_fb_end_cpu_access;
+	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
-- 
2.34.1

