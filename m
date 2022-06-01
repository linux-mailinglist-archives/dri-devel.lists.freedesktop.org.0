Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4D53A3FC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F17310E737;
	Wed,  1 Jun 2022 11:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7477210E743
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1890A21B05;
 Wed,  1 Jun 2022 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7gsIOnoD9gSctiwa8txiIPK72FcDg+uDnquJIDArWI=;
 b=vfBQzPU27Zm+7nsl9rV2YUg/m1cv9uSGoVOtRL2XVG3Z+xEWj7h97WlquOgjL+qIINDVvH
 ak4rOx3OGVbNdJDNh1lV5Zf3kOYpktvVhNAYgmz/NeI96tKr91/Cg5WORmY+aqMt4KZYkk
 fLILL31cph28Wyzf8co5ZXH5cjXafSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7gsIOnoD9gSctiwa8txiIPK72FcDg+uDnquJIDArWI=;
 b=7M7igTb5IKyHLrs9uGDE/gjpPsfuFKivwEYhVmi4uufHoom5FGY1+7HVnvVUkWO3dOba9J
 6xvypJAqoWlXAvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAD9413B2D;
 Wed,  1 Jun 2022 11:25:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kPB4OKNMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 01/10] drm/mgag200: Remove special case for G200SE with <2 MiB
Date: Wed,  1 Jun 2022 13:25:13 +0200
Message-Id: <20220601112522.5774-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601112522.5774-1-tzimmermann@suse.de>
References: <20220601112522.5774-1-tzimmermann@suse.de>
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

Remove old test for 32-bit vs 16-bit colors. Prefer 24-bit color depth
on all devices. 32-bit color depth doesn't exist, it should have always
been 24-bit.

G200SE with less than 2 MiB of video memory have defaulted to 16-bit
color depth, as the original revision of the G200SE had only 1.75 MiB
of video memory. Using 16-bit colors enabled XGA resolution. But we
now already limit these devices to VGA resolutions as the memory-bandwith
test assumes 32-bit pixel size. So drop the special case from color-depth
selection.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 028c6ba7124c..8cb72e11a2ea 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1072,14 +1072,6 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
-{
-	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
-		return 16;
-	else
-		return 32;
-}
-
 int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
@@ -1100,11 +1092,8 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
 	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
-
-	dev->mode_config.preferred_depth = mgag200_preferred_depth(mdev);
-
+	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.fb_base = mdev->mc.vram_base;
-
 	dev->mode_config.funcs = &mgag200_mode_config_funcs;
 
 	ret = mgag200_i2c_init(mdev, i2c);
-- 
2.36.1

