Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC47F0586
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E898710E1C8;
	Sun, 19 Nov 2023 10:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59E710E1C2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wH8NdnscsW10bLIOLUB7ubQDTo0O64XVfw9Xt/3TIE=;
 b=BtuU92XhAS7fIWBqNzqlLjS16ICio85B94wt87qhlElJbA7EsLSFBqG5frQsRw67QqW7yj
 /RWPWXBQlZlFPCLYSRltoT0cdnOFTxHh9grT8ory2K1J8rLrAX55vqEtEqkuPvPe42LYqn
 Cb2ZQiGF4FZ0LRT8Hk5hxyQpuoaTMIU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-QdYfL20pObWE54hefdXrkQ-1; Sun, 19 Nov 2023 05:57:21 -0500
X-MC-Unique: QdYfL20pObWE54hefdXrkQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32f8371247fso1860570f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391440; x=1700996240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wH8NdnscsW10bLIOLUB7ubQDTo0O64XVfw9Xt/3TIE=;
 b=n/E1IimD8GpaZ6SyX6cW8uIl585DUt03SIj930MHSZsnr+rGzQyMrllel8DlKs4SIG
 xFY+zLRFQ81Nc7t7tyRfqBbHJouG+roV9tbbveTta+XyLrXYZ+Pr/+KVgzapJFpkUcVg
 hC8Gu+IjkCZKdZ096Nr3SJRlOWRGfxS2DrK8IF1LJLQH+W1T1JsbQNLr0rXsTmoaEr2B
 gS3edBawk5XAU80G/XMNJQ0dQlJW8fgeveoXWkenvs4dd9nCAXIBA8kjoQFMN3vjwZi3
 z0bLtJLPfzHXiLy0C0ir6wHeZIB+sh4Vi6Q3RNtssuGiHtIiLidp/FkStrE8KCKE7euf
 MR6g==
X-Gm-Message-State: AOJu0Yw3vyJdK06wXYA9JbruQfDixQPdHG/wprthnRQBjGbq/ktoJb0S
 4S9y/CrSyTYd1RPwH4F1q3fH/FmEivjfb8qqABpvDSDmrCO5cpOLtoefMCCSzfsrYRFchCMiWkI
 ysfZOAPx7fJkVzF90GoLPy96v/quO
X-Received: by 2002:adf:f78e:0:b0:32d:a430:beb with SMTP id
 q14-20020adff78e000000b0032da4300bebmr2829968wrp.39.1700391440201; 
 Sun, 19 Nov 2023 02:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESPRpTD7i8bW20zZ0kQ4KfQTQl0DUNLoPKZy8ul6xpiKdduzWRa53ZcDf8J/6wMLLH73rZlQ==
X-Received: by 2002:adf:f78e:0:b0:32d:a430:beb with SMTP id
 q14-20020adff78e000000b0032da4300bebmr2829957wrp.39.1700391440007; 
 Sun, 19 Nov 2023 02:57:20 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5583000000b0031f82743e25sm7726978wrv.67.2023.11.19.02.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] drm/vmwgfx: Disable damage clipping if FB changed
 since last page-flip
Date: Sun, 19 Nov 2023 11:56:59 +0100
Message-ID: <20231119105709.3143489-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231119105709.3143489-1-javierm@redhat.com>
References: <20231119105709.3143489-1-javierm@redhat.com>
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
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does per-buffer uploads and needs to force a full plane update
if the plane's attached framebuffer has change since the last page-flip.

Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v2)

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

