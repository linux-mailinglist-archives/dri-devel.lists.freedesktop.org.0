Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9927F68D9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793B110E35E;
	Thu, 23 Nov 2023 22:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247C10E35C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3hQPeRRqjnZSS8OWuMWpjh1Oj2NJuDlBMcX3dbEThk=;
 b=IWrwZAQ3HVB2RnXsLIKnAaoMz1YFK0ckhtsEGGRZYfQRr1gWc58B9g9SIfO/QqfxbN4G6z
 a9x+5wCCYQd01nvIj9R2QkKxL1ahWyR5N1sS4MThrRRiBo50jxdWMywsLTZF1ru+YWmQTT
 zrz9yOQNFxVEtC42nLvpIsfk9LKPRLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-T399NcBnPCOf-nlayQBdjA-1; Thu, 23 Nov 2023 17:13:22 -0500
X-MC-Unique: T399NcBnPCOf-nlayQBdjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b3519a03aso7573515e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777601; x=1701382401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3hQPeRRqjnZSS8OWuMWpjh1Oj2NJuDlBMcX3dbEThk=;
 b=mbMebvGwmrsezdPj+hccfFa+C2bYFouVnQ1flI5XCTqJtdRDnoMyk+uM6CO6C7URK6
 gq/4YIhjSJkOy0PFdEwGrmzckIPDRIc8UgQ2jCy6LmvSd17lbM4Ep5fd6S4g2uX+amW4
 oC0vnYjiC6M69/2cbeK/+dpfvWgHdJknK6slZ54e+Lc1aatCmvQjmnYErlp9tzNtFUCG
 Zm3GXpCENNy8KEqSywIUqhxxyvh5CqCjylQkymahK39XeKftCAhsE9ksTyPqMGHclEdJ
 lx4yW1Jo7J/3xctkN+K5kDmDihfiDWC6KHOOGBn2zF2n1Qwrm9PzIQPJM268VM48mN8s
 v/pQ==
X-Gm-Message-State: AOJu0YxY8zZjABFjxST5gKllPBB7Gsr3KPg5vIkcBlSv7slsT/Ge2lJQ
 OBeUFvpbbfDK4/+ieY3hMV5Bo8SLihb599Lwx9Yl1fJZ9c8TAe9OG+S6Xje1hgtvXQ0HemuXa1H
 5KM+ldwtFyQZleHpxS1KT/b9ZtZtl
X-Received: by 2002:a05:600c:3507:b0:406:44e6:c00d with SMTP id
 h7-20020a05600c350700b0040644e6c00dmr662873wmq.2.1700777601608; 
 Thu, 23 Nov 2023 14:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt+DfJY/Kdak/dZD3b9Ayp5iu9B3rETe6oqsTju4XsMZUCKTzrR+3d7cg40KCVTwvZqoHReg==
X-Received: by 2002:a05:600c:3507:b0:406:44e6:c00d with SMTP id
 h7-20020a05600c350700b0040644e6c00dmr662869wmq.2.1700777601339; 
 Thu, 23 Nov 2023 14:13:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 je19-20020a05600c1f9300b004083729fc14sm3839537wmb.20.2023.11.23.14.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] drm/virtio: Disable damage clipping if FB changed
 since last page-flip
Date: Thu, 23 Nov 2023 23:13:01 +0100
Message-ID: <20231123221315.3579454-3-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does per-buffer uploads and needs to force a full plane update
if the plane's attached framebuffer has change since the last page-flip.

Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
Cc: <stable@vger.kernel.org> # v6.4+
Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v2)

Changes in v2:
- Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).

 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a000..a1ef657eba07 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -79,6 +79,8 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
 	struct drm_crtc_state *crtc_state;
 	int ret;
@@ -86,6 +88,14 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
 
+	/*
+	 * Ignore damage clips if the framebuffer attached to the plane's state
+	 * has changed since the last plane update (page-flip). In this case, a
+	 * full plane update should happen because uploads are done per-buffer.
+	 */
+	if (old_plane_state->fb != new_plane_state->fb)
+		new_plane_state->ignore_damage_clips = true;
+
 	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
-- 
2.41.0

