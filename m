Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800E8AD15F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBA110F6D9;
	Mon, 22 Apr 2024 15:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xq463cGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953A10FA8A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713801503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aB/XmHoI8odWQ2eq7oYyGuDTuxgIQFLMrdmcUG/LDJY=;
 b=Xq463cGyRzrJo8MLI42wf8wcGDlekSd+o9IMN+Acizat9LOsZaFC9TQHed/ann84VBWeLW
 9ww8kjDJcak+Oq7utq7rZTwNLtE7hRh3AmBCfhrLWn4SIl/DQLB6Cv7j4Pevuf0b4T3+G9
 hd2tCmXxfnXz+P44Zcz1XUlxGO3iuEY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-9cnovqTmP16BgihRTKLeVw-1; Mon,
 22 Apr 2024 11:58:17 -0400
X-MC-Unique: 9cnovqTmP16BgihRTKLeVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD1D3C0ED43;
 Mon, 22 Apr 2024 15:58:16 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4432492BC6;
 Mon, 22 Apr 2024 15:58:15 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 1/2] drm/fb-helper: Add drm_fb_helper_emergency_disable
Date: Mon, 22 Apr 2024 17:57:32 +0200
Message-ID: <20240422155811.83648-2-jfalempe@redhat.com>
In-Reply-To: <20240422155811.83648-1-jfalempe@redhat.com>
References: <20240422155811.83648-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed for drm_panic, to disable fbcon output that will otherwise
mix with drm_panic output.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 17 +++++++++++++++++
 include/drm/drm_fb_helper.h     |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7e..e2e681e252e73 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -798,6 +798,23 @@ void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 }
 EXPORT_SYMBOL(drm_fb_helper_set_suspend_unlocked);
 
+/**
+ * drm_fb_helper_emergency_disable - disable fb output in panic situation
+ * @fb_helper: driver-allocated fbdev helper, can be NULL
+ *
+ * A wrapper around fb_set_suspend, to disable fb emulation when a panic occurs.
+ */
+void drm_fb_helper_emergency_disable(struct drm_fb_helper *fb_helper)
+{
+	if (fb_helper && fb_helper->info && fb_helper->info->state == FBINFO_STATE_RUNNING) {
+		if (console_trylock()) {
+			fb_set_suspend(fb_helper->info, FBINFO_STATE_SUSPENDED);
+			console_unlock();
+		}
+	}
+}
+EXPORT_SYMBOL(drm_fb_helper_emergency_disable);
+
 static int setcmap_pseudo_palette(struct fb_cmap *cmap, struct fb_info *info)
 {
 	u32 *palette = (u32 *)info->pseudo_palette;
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 375737fd6c36e..8c61c4fe93e3b 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -261,6 +261,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
 void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 					bool suspend);
+void drm_fb_helper_emergency_disable(struct drm_fb_helper *fb_helper);
 
 int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info);
 
@@ -378,6 +379,10 @@ drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, bool suspend
 {
 }
 
+static inline void drm_fb_helper_emergency_disable(struct drm_fb_helper *fb_helper)
+{
+}
+
 static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 {
 	return 0;
-- 
2.44.0

