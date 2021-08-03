Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554753DEE97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F66E856;
	Tue,  3 Aug 2021 12:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BA66E84E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 12:59:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76B6E200CB;
 Tue,  3 Aug 2021 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627995573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QPs+cU2ZGWZbuOTh+h4AsI971+Z+102tN5zRb+VoGc=;
 b=vaEhDgsZN4ercqzarSKgkxlhKq84cFuK8QDW4MLVA3nxoocpHHUvKQPgye648IZADVsOag
 MVmheGMCqxndgHRaf2XDxUWqgsbl91W/rtOWW7qwcpEooitKjCwvPHZ3jSQptvY2V0Au/t
 ZrdtxE9z8nWomhA4/BaysCUcnaMoKfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627995573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QPs+cU2ZGWZbuOTh+h4AsI971+Z+102tN5zRb+VoGc=;
 b=F2wsvLOOLOs04M7+ojOYTgaMcmHjZ9bdvykBV8dqYNkgZj3hNKieU770K0+zqN2fyrWdSQ
 XH5TehGkmxC/fkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3BAA13CD6;
 Tue,  3 Aug 2021 12:59:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IL4yOrQ9CWExZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 12:59:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 drawat.floss@gmail.com, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] drm/mgag200: Use offset-adjusted shadow-plane mappings
Date: Tue,  3 Aug 2021 14:59:22 +0200
Message-Id: <20210803125928.27780-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803125928.27780-1-tzimmermann@suse.de>
References: <20210803125928.27780-1-tzimmermann@suse.de>
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

For framebuffers with non-zero offset fields, shadow-plane helpers
provide a pointer to the first byte of the contained data. Use it in
mgag200.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 3b3059f471c2..6e2db8cfe3b7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1601,7 +1601,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	mga_crtc_load_lut(crtc);
 	mgag200_enable_display(mdev);
 
-	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->map[0]);
+	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
 }
 
 static void
@@ -1650,7 +1650,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
-		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->map[0]);
+		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
 }
 
 static const struct drm_simple_display_pipe_funcs
-- 
2.32.0

