Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DF57B2FD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983310E068;
	Wed, 20 Jul 2022 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C1710E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 945772059E;
 Wed, 20 Jul 2022 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Bjyr1eIuLFRysukI7PgIb60RbvG2YLV0bJtXF/cFOQ=;
 b=2NB2uByXMnRQpHX9Fru/nPbjzBpFRG6TsCYHvVHLOwwJHunrsTO2VG+6WNbByytHXDJbnn
 bXaWGGsuCrrSJtEYN4hhrrH7vcG2NxPYjTSlV051fT7zChwKCAtBPpM/GmmHwRdsr/oBco
 238c3ly3hRsX+8oxw6awzWPsZTdO6jM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Bjyr1eIuLFRysukI7PgIb60RbvG2YLV0bJtXF/cFOQ=;
 b=h0LrinXCh+nwUBF14o4X840z026+OYE5cgkjSjtnALVEOERWztXpBYykG4mXSFy+d72OBZ
 reBDxjGgtJIc4wBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63DEF13AC3;
 Wed, 20 Jul 2022 08:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2IJ+F0m912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 7/7] drm/fsl-dcu: Use drm_plane_helper_destroy()
Date: Wed, 20 Jul 2022 10:30:58 +0200
Message-Id: <20220720083058.15371-8-tzimmermann@suse.de>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index e4f518e44945..3b20e79158c8 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
@@ -170,16 +171,10 @@ static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
 	.atomic_update = fsl_dcu_drm_plane_atomic_update,
 };
 
-static void fsl_dcu_drm_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-	kfree(plane);
-}
-
 static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
-	.destroy = fsl_dcu_drm_plane_destroy,
+	.destroy = drm_plane_helper_destroy,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = drm_atomic_helper_plane_reset,
 	.update_plane = drm_atomic_helper_update_plane,
-- 
2.36.1

