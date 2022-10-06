Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC235F63E1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3389010E279;
	Thu,  6 Oct 2022 09:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F89A10E207
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCDD61F923;
 Thu,  6 Oct 2022 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lrVg7hS9zfDAAP0B/qw69ck3nWuFcVxJEZITxc1j4g=;
 b=WlyOQgnOWRf/8g8Gk6Jh7PX9H2jFBMCrTr3jGZ3tJkkxKGIclJ4/ag18XyFXUliHKlcKtA
 cpPirBzd6Zms8tVGvFC+anPZsWw/yXWk2phbJ7qKdwSzY5R60nvYXo2lb6qwTWSFYLtdMp
 FTVA06y47Y4rCZG5K7dLooPHV8TUANw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lrVg7hS9zfDAAP0B/qw69ck3nWuFcVxJEZITxc1j4g=;
 b=IZzP55UnD2VGojsCFVkQsr/MqwML+pUwkMHvh35RHlaMr4AvkXrTfdAWNZy9BU51fkpYhv
 DEfQwy5VGkQ2wGBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B09D413AC8;
 Thu,  6 Oct 2022 09:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6P9RKrWlPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 06/16] drm/udl: Remove udl_simple_display_pipe_mode_valid()
Date: Thu,  6 Oct 2022 11:53:45 +0200
Message-Id: <20221006095355.23579-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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

Remove the empty function udl_simple_display_pipe_mode_valid() and
let simple-KMS helpers accept the modes. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 93e7554e83fa..7f8bde89396d 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -310,13 +310,6 @@ static const uint32_t udl_simple_display_pipe_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-static enum drm_mode_status
-udl_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-				   const struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
 static void
 udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
@@ -398,7 +391,6 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
-	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
 	.update = udl_simple_display_pipe_update,
-- 
2.37.3

