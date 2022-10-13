Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85865FD868
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7C10E881;
	Thu, 13 Oct 2022 11:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73B10E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B1AA1F74D;
 Thu, 13 Oct 2022 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTu4K+jpaZjY9enrxae3dcUnYeYZ1kEw/mhk1j1zLmY=;
 b=ObVeGC+bOQM/XWxNNPuQrbfpYfEmsfPvQeK+LqTgM9A4wtQGveYEpFbP1k/gDCNu99nYub
 ttg3shfEyNEiZHl3rbHXOAIohmQEzJSYj1/lLLxQwodTsiTGMeucYebAD6kt6pz72ufot7
 JB33DXSu6J930HVANR/iNVIWGuNUbRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTu4K+jpaZjY9enrxae3dcUnYeYZ1kEw/mhk1j1zLmY=;
 b=fYE+tuIUKwN9VRy+0hA35SODWspbP9hyt0oLJygmxelGjXmFLNAOqAIogQLpwBWlerHwcv
 ZJI2U872D+HWDvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E00E913AFF;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EP6tNJb2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 3/8] drm/ast: Do not call drm_atomic_add_affected_planes()
Date: Thu, 13 Oct 2022 13:29:18 +0200
Message-Id: <20221013112923.769-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013112923.769-1-tzimmermann@suse.de>
References: <20221013112923.769-1-tzimmermann@suse.de>
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

There's no need to add planes to the atomic state. Remove the call
to drm_atomic_add_affected_planes() from ast.

On full modesets, the DRM helpers already add a CRTC's planes to the
atomic state; see drm_atomic_helper_check_modeset(). There's no reason
to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
atomic_check() in ast. It's also too late, as the atomic_check() of
the added planes will not be called before the commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e26471ecffb1..059e4906507d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1157,7 +1157,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	int ret;
 
 	if (!crtc_state->enable)
-		goto out;
+		return 0;
 
 	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 	if (ret)
@@ -1191,8 +1191,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	if (!succ)
 		return -EINVAL;
 
-out:
-	return drm_atomic_add_affected_planes(state, crtc);
+	return 0;
 }
 
 static void
-- 
2.37.3

