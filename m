Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08537EC36D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A419B10E551;
	Wed, 15 Nov 2023 13:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC310E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4aNlMTSkF6Z7WtRPqPRRN4O3d3mqRlG6UdzSZTHX4Q=;
 b=BbtUD7Y/cwQRSczCj7nuFnXT0svHi0mxijt4AUpV0DiFRtxTelOIXCRJjsUb0dv3tZQdFZ
 tHDlLH+UJUbGAJY91G0upzlyOI1408Jj4VXjIFS5Q+HcD+dsG1qSmjToh8fm66a+tm0j6N
 sOxXb5h44imJX+wTyEsf2vEMj5YTxIg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-U7v8kAiMOH2vkiiGORmtiw-1; Wed, 15 Nov 2023 08:16:00 -0500
X-MC-Unique: U7v8kAiMOH2vkiiGORmtiw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-408f9cee5e8so43275585e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054159; x=1700658959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4aNlMTSkF6Z7WtRPqPRRN4O3d3mqRlG6UdzSZTHX4Q=;
 b=ig+S+gMfJG0Y+Idujf77x5Ezr+rjabJ1wt8qF9Kptk0RryIIiqkaCEYrb7FnX1uK+7
 KBMmjhO9yEkQ7j9dy5jYoE8dFReMGkvy3VUnMsBs+YIgHfplLUEzY57f3hnMd6TE+BVe
 b4FxpsledYiqLub1nF4CyvnztoQ6dFb8qmGlxc7n21bOa7osMALYmntGy50WbXIi5it5
 EJsw5YgGZeLY1qkOYLNxMS8sqIdAKyBu21jxHxjEtNYOITCnXpvMHZCVPC97kfkDy5I7
 Zm3yZLkhCZD6jx+VqW25VfqJdpfS6Byne2K0XZL74pGqAMiyvQwcTOgR2CzWizDoaG0A
 I7dw==
X-Gm-Message-State: AOJu0YxPWCDfeCEek1vUW1bEO7LJmt0bXAOhv6Z+9Z5ya6Ny1h18BUzH
 IhH3nSsmEvVqAkXtm1pguu3cDVJjb+gaff0a+D3oVfULKkJty49gn3mPBeLF6c42nJo0vWu8Fa5
 13AcokOH5WiMPfKON9KcHxPxGZmdJ
X-Received: by 2002:a5d:49c4:0:b0:32d:bc6e:7f0d with SMTP id
 t4-20020a5d49c4000000b0032dbc6e7f0dmr8014885wrs.18.1700054159238; 
 Wed, 15 Nov 2023 05:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqQImNi2W5AgGnJqpoMjjFu3Gcn9f11D4+yPZSZnB8N53BgtMbv3StA4wZdzqIdJ6tBIc4eg==
X-Received: by 2002:a5d:49c4:0:b0:32d:bc6e:7f0d with SMTP id
 t4-20020a5d49c4000000b0032dbc6e7f0dmr8014875wrs.18.1700054159031; 
 Wed, 15 Nov 2023 05:15:59 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4202000000b0032d886039easm10435546wrq.14.2023.11.15.05.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:15:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/vmwgfx: Disable damage clipping if FB changed
 since last page-flip
Date: Wed, 15 Nov 2023 14:15:42 +0100
Message-ID: <20231115131549.2191589-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does per-buffer uploads and needs to force a full plane update
if the plane's attached framebuffer has change since the last page-flip.

Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 818b7f109f53..f9364bf222e3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -837,10 +837,21 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 	struct drm_framebuffer *new_fb = new_state->fb;
+	struct drm_framebuffer *old_fb = old_state->fb;
 	int ret;
 
+	/*
+	 * Ignore damage clips if the framebuffer attached to the plane's state
+	 * has changed since the last plane update (page-flip). In this case, a
+	 * full plane update should happen because uploads are done per-buffer.
+	 */
+	if (old_fb != new_fb)
+		new_state->ignore_damage_clips = true;
+
 	if (new_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_state->crtc);
-- 
2.41.0

