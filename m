Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776B7F0585
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9194F10E1C4;
	Sun, 19 Nov 2023 10:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5964F10E1C8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wduLhA1JfH2JIibNOg1UP/hJXljazR5AfhyG/qLMjyE=;
 b=hvmVN1OHls9SEnZel4MbaZYpaZvNid0kWl3Z3MXLW61Y7136947HsOBMpVyuZ9yzGZvfqZ
 9nGsy9ZLPdnYfltqaCy/5PUUX1HnfkLAkuGWLwa24/Z8SxcgoIqfe3ztSGZHP5eLp1tmuU
 0GRVrHcxIFHR7jq1FwhwO89eVFgPgmY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-L5WEznYrPl2n2snDFnWwyw-1; Sun, 19 Nov 2023 05:57:19 -0500
X-MC-Unique: L5WEznYrPl2n2snDFnWwyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40839252e81so6402745e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391438; x=1700996238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wduLhA1JfH2JIibNOg1UP/hJXljazR5AfhyG/qLMjyE=;
 b=BKG2m7dSKAMiUxFW8IwL+Nn0Fh9LGGfw8eT8R/lscN9EXXurWzDM3N4wlUfJ4unxlQ
 jEQZV5wqYEoJBtBnqhgjAVjouRolBc48iaatyQmPZxA4Jvd7VO9njxKNJ8E5eGLrlYg1
 vpEx+TC+mj8e3dkdKfS6pe5wtMJ/BQWBt2y0sSwLJVLFrZu2KI3umc+C/lufGnfIZWvP
 UWCbdglDmbzV9oyJ+kycek+M/u6FONv52OSkOVbzIh7Dm2snnhS6h66yaMq9Glwuycay
 FvHOVUFNewkYjWv8Uvx7HCESx3RvWwgFq0orVhDYelS0HjhA9SfJbjK+lqb7HpY6s65h
 N6EA==
X-Gm-Message-State: AOJu0YxmgLoB5A8SqqEK1iXMpNz6Ofu72YovRxlV9eZevdO7oqk8/2qD
 5wZh1F1tY9lOCPKJOLKlkSvz0qg25o4BJUNMsx+qIYCSJ2Ock5dTPCobd0ZPH6XGGkC1a4Krl8Z
 Iw73jUqRNWOeKMERqByVDW/uhkCxM
X-Received: by 2002:a05:600c:5254:b0:408:40e2:773b with SMTP id
 fc20-20020a05600c525400b0040840e2773bmr3874940wmb.34.1700391438610; 
 Sun, 19 Nov 2023 02:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlYVHBUM49anhifPkjs7hxrNsnEGArla3y2Mra38iXhi+oYySY1k50/IKpNWu+heDGdF252Q==
X-Received: by 2002:a05:600c:5254:b0:408:40e2:773b with SMTP id
 fc20-20020a05600c525400b0040840e2773bmr3874914wmb.34.1700391438309; 
 Sun, 19 Nov 2023 02:57:18 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b004094e565e71sm9510932wmo.23.2023.11.19.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] drm/virtio: Disable damage clipping if FB changed
 since last page-flip
Date: Sun, 19 Nov 2023 11:56:58 +0100
Message-ID: <20231119105709.3143489-3-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, Erico Nunes <nunes.erico@gmail.com>
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

