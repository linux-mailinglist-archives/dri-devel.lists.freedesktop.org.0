Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C862D5E6340
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511110EB08;
	Thu, 22 Sep 2022 13:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B1910EB07
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:09:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62F8421A47;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663852186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBjxeRVdlhHs6oWfcRTVBo5fo9DV7Dbdh5Z0Q1Uthe8=;
 b=b0f7OwKtn9lLj/1XTOIQ6X+tQniVxGmxe5YP2n7bAb+dmbMq29UvNnpGfe75Jfyt6yqKdv
 7CWDqBlV66paqsyzsTRD18NLs4tTuNihwtmdo86kT7BEFI6X4UAmlWdPI0QasJqDAJokeQ
 ZXy5eoYLZH3Xy/3vGuWspQ9M7P78Vp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663852186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBjxeRVdlhHs6oWfcRTVBo5fo9DV7Dbdh5Z0Q1Uthe8=;
 b=sXbZPtXUaulGH+0hhiu5L6A3UKoEnPLMGVXwbHDF+zV81BTk9u9UVHbN/yEgbpIfZqgJRw
 AtjzZHYzayLeTlDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42E491346B;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJiGD5peLGMSbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 13:09:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Date: Thu, 22 Sep 2022 15:09:41 +0200
Message-Id: <20220922130944.27138-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922130944.27138-1-tzimmermann@suse.de>
References: <20220922130944.27138-1-tzimmermann@suse.de>
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

Lookup the plane's state in atomic_update with the helper
drm_atomic_get_new_plane_state(). Also rename the helpers'
state arguments. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 51d01e34d5eb..14782a50f816 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -470,10 +470,10 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
 };
 
 static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
-							 struct drm_atomic_state *old_state)
+							 struct drm_atomic_state *state)
 {
-	struct drm_plane_state *plane_state = plane->state;
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
@@ -503,7 +503,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 }
 
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							  struct drm_atomic_state *old_state)
+							  struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-- 
2.37.3

