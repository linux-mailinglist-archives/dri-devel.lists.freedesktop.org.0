Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0169807A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDCE10EB15;
	Wed, 15 Feb 2023 16:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D6A10EB0C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41B4820006;
 Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKBUeeLGRV/z5JnU13TfYaXKEjcSQ2+e3Bt4pf9LZgo=;
 b=u40MxqIJe4yWEB+NVgtSrNclvgpHpfFGTNtNc37aA2/e+yF7heP3dkyeqto9gF2XeppcrV
 BL2k5NqGwGqR81R2reXEdIfEPXNFzOlMpRndGwi/yTQYNzk5eS3mysKXbfmVTTJ+LsQoHS
 Wxo+6BzBI1LkhE4gi4AImmpGC6Ug/TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKBUeeLGRV/z5JnU13TfYaXKEjcSQ2+e3Bt4pf9LZgo=;
 b=5gitGnbus4ykEgZscVighG4zmPf3CVE/FFZL6pCzLWDiKYO6OkyJoUCiX8zPAkm9ZeDl8k
 SjQoarWb9w3oUDDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E005F13928;
 Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gE7dNR8F7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 11/17] drm/cirrus: Remove format test from cirrus_fb_create()
Date: Wed, 15 Feb 2023 17:15:11 +0100
Message-Id: <20230215161517.5113-12-tzimmermann@suse.de>
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

The DRM core implements a format check when setting a framebuffer
for a plane. [1] Remove the unnecessary test from cirrus_fb_create().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.1/source/drivers/gpu/drm/drm_atomic.c#L629 # [1]
---
 drivers/gpu/drm/tiny/cirrus.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index a483abc2e6ba..c1ffbbe1d545 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -559,10 +559,6 @@ static struct drm_framebuffer*
 cirrus_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	if (mode_cmd->pixel_format != DRM_FORMAT_RGB565 &&
-	    mode_cmd->pixel_format != DRM_FORMAT_RGB888 &&
-	    mode_cmd->pixel_format != DRM_FORMAT_XRGB8888)
-		return ERR_PTR(-EINVAL);
 	if (cirrus_check_size(mode_cmd->width, mode_cmd->height, NULL) < 0)
 		return ERR_PTR(-EINVAL);
 	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
-- 
2.39.1

