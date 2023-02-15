Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232769807C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9310EB14;
	Wed, 15 Feb 2023 16:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F110EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 499AE3399F;
 Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+B95xkA2xVnz+6CgGcPRUJusPpgeES0t/M9GUw7O8E=;
 b=1iYrfqgJ7Z7NRGGVeABzZhSlfRmdh6pmB+hI03BM+O1lSmkB4JIAE6YGZFtCLKOHUxz2IG
 kvlm+oQoCO+aQSVdss03Mk2r4Js6PnCOhQ99cmctwRtpgedTP9jcxXJZ0ygoHS3R99uRN7
 cN7ehd8rwQjEUSPX55A6ZhYmxCrw2gc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+B95xkA2xVnz+6CgGcPRUJusPpgeES0t/M9GUw7O8E=;
 b=VBx5lfZINJ+wA5TaTlv992QsnPpY9mfb3L69iSUa+pS9ni5lw6MsW8mJlvY9sX4I34/5vL
 ZLK5bb6xbYTSEqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA82D134BA;
 Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKeeIx4F7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 09/17] drm/cirrus: Enable damage clipping on primary plane
Date: Wed, 15 Feb 2023 17:15:09 +0100
Message-Id: <20230215161517.5113-10-tzimmermann@suse.de>
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

Enable damage clipping on the primary plane and iterate over small
areas of reported framebuffer damage. Avoid the overhead of permanent
full-screen updates that cirrus currently implements.

This problem is indicated by the warning

  drm_plane_enable_fb_damage_clips() not called

in the kernel's log. Without damage clipping, drivers do full updates
of the screen area. This is costly as many screen updates, such as
cursor movement or command-line input, only change a small portion
of the output. Damage clipping allows renderers to inform drivers about
the changed areas.

With the damage information known, cirrus now iterates over a list of
change areas and only flushes those to the hardware's scanout buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index af26de9ef329..46c6aa34ba79 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -393,7 +393,8 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_rect rect;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
 	int idx;
 
 	if (!fb)
@@ -407,8 +408,10 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (cirrus->pitch != cirrus_pitch(fb))
 		cirrus_pitch_set(cirrus, fb);
 
-	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
-		cirrus_fb_blit_rect(fb, &shadow_plane_state->data[0], &rect);
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		cirrus_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
+	}
 
 	drm_dev_exit(idx);
 }
@@ -529,6 +532,7 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
 	if (ret)
 		return ret;
 	drm_plane_helper_add(primary_plane, &cirrus_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
 
 	crtc = &cirrus->crtc;
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
-- 
2.39.1

