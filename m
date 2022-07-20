Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4757B2FE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6010F080;
	Wed, 20 Jul 2022 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2E710F4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6000A204D9;
 Wed, 20 Jul 2022 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8ew2/CfAgnUH2qY2ah5Yl83bWyen5c/cQ428bXv5xY=;
 b=nzQbI4kjlv/n2xSJmtToGqI7T4Wbe7JqkORhlboFMVJgUhD/XWB7u7HzUrZi7AcI7gqPD3
 SW2IHd27ikc0sH4mRzpZ/8eo6Tr2yN8G3bm20ecHnWW+S34kUL8YXjjHZnRnoKQtOLmKOM
 I3BY+nz+YgWDuVgelNmM0CiiJkzXI4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8ew2/CfAgnUH2qY2ah5Yl83bWyen5c/cQ428bXv5xY=;
 b=Q+WukBMyQEnmrmmgtQTE2pkUOKc0BkQbX/Cy3Zqtl2+u+Hxt39yfps14HhcNyI/lFbG0DY
 8wMwJsnyz/mom8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D26B13ABB;
 Wed, 20 Jul 2022 08:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wC40Ckm912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 6/7] drm/armada: Use drm_plane_helper_destroy()
Date: Wed, 20 Jul 2022 10:30:57 +0200
Message-Id: <20220720083058.15371-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720083058.15371-1-tzimmermann@suse.de>
References: <20220720083058.15371-1-tzimmermann@suse.de>
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
Cc: linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the driver's own function with drm_plane_helper_destroy(). No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_overlay.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 1db77549189e..f21eb8fb76d8 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_plane_helper.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
@@ -297,12 +298,6 @@ armada_overlay_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 	return ret;
 }
 
-static void armada_ovl_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-	kfree(plane);
-}
-
 static void armada_overlay_reset(struct drm_plane *plane)
 {
 	struct armada_overlay_state *state;
@@ -467,7 +462,7 @@ static int armada_overlay_get_property(struct drm_plane *plane,
 static const struct drm_plane_funcs armada_ovl_plane_funcs = {
 	.update_plane	= armada_overlay_plane_update,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy	= armada_ovl_plane_destroy,
+	.destroy	= drm_plane_helper_destroy,
 	.reset		= armada_overlay_reset,
 	.atomic_duplicate_state = armada_overlay_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
-- 
2.36.1

