Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7B698063
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F97910E580;
	Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586910E580
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEB7533952;
 Wed, 15 Feb 2023 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSMneo9dvapNXvsnrbRj1e1wJ2uDQrr5Md1KtmfNpbQ=;
 b=c3kWr7M+i88nsv6/Vqe4mwLJmQOEcz8y4qAa9BCY2bHJ0UcyydVCeWi8RSstVyLNZPIRne
 7l3jzNVmXB2hgWzcFdDwYHaINgqGHT0A/cZ46LtVcjp5I2Tqy6OG4K31jLfoFfx7WqDeFR
 XL4N83v+WSe/G537e4Bnw4VG2gsO9vE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSMneo9dvapNXvsnrbRj1e1wJ2uDQrr5Md1KtmfNpbQ=;
 b=0YazJZxvxEEEAggFswQ0zv7ixX6PAPROEYVa8T0aPrrMSFGXeaTP92woMnSv2o7iSxyh69
 9XL28dGPYo+swUAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6FDF134BA;
 Wed, 15 Feb 2023 16:15:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YKWJNBgF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 01/17] drm/cirrus: Compute blit destination offset in single
 location
Date: Wed, 15 Feb 2023 17:15:01 +0100
Message-Id: <20230215161517.5113-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The calculation for the scanout-buffer blit offset is independent
from the color format. In the one case where the current code uses
fb->pitches[0] instead of cirrus->pitch, their values are identical.
Hence merge all into a single line.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index cf35b6090503..7fb21db8416d 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -327,17 +327,15 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 		return -ENODEV;
 
 	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
+	iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 
 	if (cirrus->cpp == fb->format->cpp[0]) {
-		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
 		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
-		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
-		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 		drm_fb_xrgb8888_to_rgb888(&dst, &cirrus->pitch, vmap, fb, rect);
 
 	} else {
-- 
2.39.1

