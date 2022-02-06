Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72C4AB1AC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BAB10E25F;
	Sun,  6 Feb 2022 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0728410E25F
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:29:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DC4F210EE;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644175779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFX6T240pV3KsfANaKiUP0OHvbdBOnnoCHED1HBYmzk=;
 b=db/onfvFX5yJLVPv6JTMWxR2YagMx1zW0isHWgidzeMzO62vSHbDsrq8P6bnuzVHURCmQB
 v7sOmumQeSPMOPFX5C67371fUkpQmdffPu5KXPDeAaBlxJBmlbB27jcX2MFLF/1Z6g97Gl
 L6eN0ZEzCcZuJB47jjCYKlPioCrtkng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644175779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFX6T240pV3KsfANaKiUP0OHvbdBOnnoCHED1HBYmzk=;
 b=M5aIPc0gauV47fOXFm1CmvMz3ZfSh9XPd7xceoqhPyA7YhffHhjhID3VXzZHH7mi049Xk9
 22s9V1XHvGMOzbDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5779B139EF;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6DtPFKMhAGLlJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Feb 2022 19:29:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 2/5] drm/fb-helper: Fix vertical damage clipping
Date: Sun,  6 Feb 2022 20:29:32 +0100
Message-Id: <20220206192935.24645-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220206192935.24645-1-tzimmermann@suse.de>
References: <20220206192935.24645-1-tzimmermann@suse.de>
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

Don't clip the damage rectangle against the viewport. This only
works if the viewport is located at the beginning of the video
memory and the video memory doesn't extend the screen (i.e., if
there's no overallocation).

Fbdev emulation transfers data from write operations into a
possible shadow buffer, then into a GEM buffer object, and finally
via graphics driver onto the screen.

If callers write outside the currently visible area, clipping the
damage rectangle against the viewport will loose these updates in
the shadow buffer and the fbdev's buffer object will contain stale
data. Panning the viewport to the stale area of the buffer will
display obsolete data.

Instead, mark all written areas as damaged, so that the damage
handler updates the buffer object from the shadow buffer for all
such areas. The graphics driver's later has the option of clipping
the damaged area against the viewport when updating the screen
from the buffer object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a37fb4a980c8..87c47093c3a2 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -706,8 +706,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 
 	if (min < max) {
 		y1 = min / info->fix.line_length;
-		y2 = min_t(u32, DIV_ROUND_UP(max, info->fix.line_length),
-			   info->var.yres);
+		y2 = DIV_ROUND_UP(max, info->fix.line_length);
 		drm_fb_helper_damage(info, 0, y1, info->var.xres, y2 - y1);
 	}
 }
-- 
2.34.1

