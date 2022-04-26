Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694F5103C4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115510E852;
	Tue, 26 Apr 2022 16:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472310E886
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9BqO4POWstSXykyf4gys0Z7Am3Pl+SO8bjE0/l1pYQ=;
 b=NXzZ61pFdLI5apK9a/rzj6qt8HtHAUSCPoA8tuw+M8zu2NIzYwW4ZibwOMxREVQ5cY2Ych
 63DPVeA8yezwcLXYyMET16QHTBVA01IerJUw5EqA+zj49VUYdG4oPMbtIRg2DqypyqQ8v0
 uHQA5bqaSPu+CYrttpnd5hw/MmDg6Rs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-15iwRL8WPFSQpEesmOw6wg-1; Tue, 26 Apr 2022 12:42:19 -0400
X-MC-Unique: 15iwRL8WPFSQpEesmOw6wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90901811E78;
 Tue, 26 Apr 2022 16:42:18 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FCB22024CB8;
 Tue, 26 Apr 2022 16:42:15 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] mgag200: Optimize damage clips
Date: Tue, 26 Apr 2022 18:41:06 +0200
Message-Id: <20220426164108.1051295-3-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-1-jfalempe@redhat.com>
References: <20220426164108.1051295-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when there are multiple damage clips, previous code merged them into one
big rectangle. As the Matrox memory is very slow, it's faster to copy each
damage clip.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index cff2e76f3fa0..2bc380a85996 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -855,10 +855,6 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 
 	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
 	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
-
-	/* Always scanout image at VRAM offset 0 */
-	mgag200_set_startadd(mdev, (u32)0);
-	mgag200_set_offset(mdev, fb);
 }
 
 static void
@@ -904,6 +900,9 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	mgag200_enable_display(mdev);
 
 	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
+	/* Always scanout image at VRAM offset 0 */
+	mgag200_set_startadd(mdev, (u32)0);
+	mgag200_set_offset(mdev, fb);
 }
 
 static void
@@ -959,12 +958,18 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect damage;
+	struct drm_atomic_helper_damage_iter iter;
 
 	if (!fb)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
+	}
+	/* Always scanout image at VRAM offset 0 */
+	mgag200_set_startadd(mdev, (u32)0);
+	mgag200_set_offset(mdev, fb);
 }
 
 static struct drm_crtc_state *
-- 
2.35.1

