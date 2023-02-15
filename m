Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B702A698085
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688310EB29;
	Wed, 15 Feb 2023 16:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B6910EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96FF7200FE;
 Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BM2d13cHOWxOOXcWmdpVLKai8Z6PGV5O4/2zcDhOGk=;
 b=sN4/0aSEwS/qhPT0XQRO3odk13GIGxwhepeCr/s8kwHZ8lxq/XBZx58AwM8xB8aGdDYRZc
 F3NqQwIG5IaHtOURd8P9mADAx4fthxxUdWEOiaiY0krBnVmIF39DYydHZey1FamTMgfktT
 D6nxf30y58ap5uFu/h6J957Qnt6hmwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BM2d13cHOWxOOXcWmdpVLKai8Z6PGV5O4/2zcDhOGk=;
 b=DjGOf9Pty95t41DwdfeMd+A3QKvty9D5mpM2uYxceSnK8SnehJx1UYD9Rc7t/S8krduvqZ
 LcFFP1ECy4PdZ/Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47AD2134BA;
 Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJCLECAF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 12/17] drm/cirrus: Remove size test from cirrus_fb_create()
Date: Wed, 15 Feb 2023 17:15:12 +0100
Message-Id: <20230215161517.5113-13-tzimmermann@suse.de>
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

The DRM core implements a size check against the mode config's
limits when creating a framebuffer. [1] Remove the unnecessary
test from cirrus_fb_create() and remove the now-empty function.
Create framebuffers with drm_gem_fb_create_with_dirty().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.1/source/drivers/gpu/drm/drm_framebuffer.c#L287 # [1]
---
 drivers/gpu/drm/tiny/cirrus.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c1ffbbe1d545..c2d7bb775629 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -555,17 +555,8 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
 /* ------------------------------------------------------------------ */
 /* cirrus framebuffers & mode config				      */
 
-static struct drm_framebuffer*
-cirrus_fb_create(struct drm_device *dev, struct drm_file *file_priv,
-		 const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	if (cirrus_check_size(mode_cmd->width, mode_cmd->height, NULL) < 0)
-		return ERR_PTR(-EINVAL);
-	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
-}
-
 static const struct drm_mode_config_funcs cirrus_mode_config_funcs = {
-	.fb_create = cirrus_fb_create,
+	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.1

