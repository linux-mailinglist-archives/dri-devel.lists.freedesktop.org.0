Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CF6BCB17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24410EA5D;
	Thu, 16 Mar 2023 09:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A143A10E09F;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 627F91FE02;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ma+ywCNORnflzBw1JR2RHLVfEjQNsKxzve8mO6Pp54=;
 b=VKEgvYqfmLWtxadxwH6dKOXdqE2eC8sb8TErwNtHLJGtb9iMfwb8Vhwmw5ch1V5KqRgU9t
 YHtT2Z3vCtVPQK91vYkveYlZr2mJatWDJUYDMyuNfK5qyLRyJADzQa1hcbA8nZgTj84B+f
 LlwWKrPgo5ZGMrz6lLOr2AFcgQ3HGS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ma+ywCNORnflzBw1JR2RHLVfEjQNsKxzve8mO6Pp54=;
 b=mkv9yz+7wV/4bPOAMpdvAeOnr5mdEcNjYmF9fJoeJHYAe6BpoQIH4mEjCIRLl9V8OYZgrH
 w/KX5SQvgmQEIqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33C7113A71;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNOyC2TjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 02/10] drm/radeon: Improve fbdev object-test helper
Date: Thu, 16 Mar 2023 10:37:30 +0100
Message-Id: <20230316093738.28866-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look up the framebuffer GEM object in fbdev object test with the
respective helper drm_gem_fb_get_obj(). The look-up helper warns if
no GEM object has been installed. Upcasting types prevents runtime
type checking, so avoid upcast to struct radeon_bo.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index bbb0de2196d3..b1700ce8166a 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -35,6 +35,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
@@ -366,10 +367,17 @@ void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
-	if (!rdev->mode_info.rfbdev)
+	struct drm_fb_helper *fb_helper = rdev->ddev->fb_helper;
+	struct drm_gem_object *gobj;
+
+	if (!fb_helper)
+		return false;
+
+	gobj = drm_gem_fb_get_obj(fb_helper->fb, 0);
+	if (!gobj)
+		return false;
+	if (gobj != &robj->tbo.base)
 		return false;
 
-	if (robj == gem_to_radeon_bo(rdev->mode_info.rfbdev->fb.obj[0]))
-		return true;
-	return false;
+	return true;
 }
-- 
2.39.2

