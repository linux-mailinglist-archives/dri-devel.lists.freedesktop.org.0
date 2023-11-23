Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B27F68E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDB410E35F;
	Thu, 23 Nov 2023 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19E10E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eevPmuhRFAgVhLHOGTOOcRfbcoEzUftUVXb0Oh9ok7w=;
 b=AU64hUrGJHn7S1hu81s6rYo0Gd/4NW3tTnfVo/lPoyC1kuZSHewT/TLo49YPYfVrkhSPkB
 y2ZW0ZTh+Fspvz52hCE/Z6gx0R09wb1awZX3IpyJW0r4ysH7osmPAkUjuJV4WndWkqjuDn
 xWrb2ju8by5+VEmfM4poNpiVRauwrnQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-hSb5VUsyMpeZ2vhHyDRsvA-1; Thu, 23 Nov 2023 17:13:25 -0500
X-MC-Unique: hSb5VUsyMpeZ2vhHyDRsvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40b349b990fso6276125e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777604; x=1701382404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eevPmuhRFAgVhLHOGTOOcRfbcoEzUftUVXb0Oh9ok7w=;
 b=kRZ3X99DoaKpaTaDNbv9Lh9J6BAc8BsmSaaW8+jDgJQku2M9KP47RWT0K/+b0reQ8L
 Y3XIFAxjMtkFul5TBKyz52rnlxz5EgnI3E5LFbCgnbqr1zF0elL/OuJgDYLj7WmAr3s8
 08Aa2TYK52i64nqBd2d+uos5JPZ16JajEdVSIcxi36avTLtQrg5Bn/7eSbAbgmIx7LZF
 7uHGxXkOl2uLgXROiv7JhlD318Blx9p7iT4utjcUAb4Q/Ns+7R3zO2RjMoBcRaT8pApc
 YSiZdyyOtRU5XX3huC7Uq7Dg/4Rq1fVP9J2X/TXK5dKhRN+Cgs85Z+zcoYVGycCBQtWg
 /fPg==
X-Gm-Message-State: AOJu0YxrzZ8Es8gAgXYkfzQ4wGxn0UXU9fU0MBqi5CciinlyS2NzBkJU
 lyuLs+ZnZFcueFEIoeG+RNQ+UT4ic9nSRRFuP71yXmBkaEk+CVeRBt8B8Cw8Z0bM3Xu6yFUPPwp
 8uwFHvHtx9JUG0u2caBN9EmAmLIFV
X-Received: by 2002:a05:600c:138e:b0:40b:3605:acda with SMTP id
 u14-20020a05600c138e00b0040b3605acdamr646906wmf.25.1700777604067; 
 Thu, 23 Nov 2023 14:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6aWgfy8x/Q5jWLkQk58MrIjsjFwETk6FGO3Io9BSfMMwRCBkkQZXEsO4x5dsaE1onwWQGvg==
X-Received: by 2002:a05:600c:138e:b0:40b:3605:acda with SMTP id
 u14-20020a05600c138e00b0040b3605acdamr646901wmf.25.1700777603855; 
 Thu, 23 Nov 2023 14:13:23 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b00405c7591b09sm3180629wmp.35.2023.11.23.14.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/vmwgfx: Disable damage clipping if FB changed
 since last page-flip
Date: Thu, 23 Nov 2023 23:13:02 +0100
Message-ID: <20231123221315.3579454-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123221315.3579454-1-javierm@redhat.com>
References: <20231123221315.3579454-1-javierm@redhat.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
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

