Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF87EC367
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F34D10E0C2;
	Wed, 15 Nov 2023 13:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5082710E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8baLtlzsuyZcOKODOHaJ6HAGilgrqHGy9qmPbinQNI=;
 b=e+AJkbLQ3quwUJLXKEOnNMNhj3JvkQeZBVkV2RPTv5H7BVRGXibrO9369CGMGq5p8QqjCz
 i54XTawzEtbRPbe5rnrUedgQnSA3xwHK62JPoMQb0atFFWBM4etaKiIuPCT/AKJYoaTiRA
 Y0LoRS8wO+EvwA7BmbSXxsqgsggmurA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-w6VQ6QnqOG2Tc9RfAjXEDA-1; Wed, 15 Nov 2023 08:15:58 -0500
X-MC-Unique: w6VQ6QnqOG2Tc9RfAjXEDA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32fa25668acso3165361f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054157; x=1700658957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8baLtlzsuyZcOKODOHaJ6HAGilgrqHGy9qmPbinQNI=;
 b=f2pucbRdZxnzaDMJa7VNAizYJrGfSVtRSwzSqSDxDXaTICQv9uAvMawR9o3fxbugI7
 wbNd6leSZ7DN24mXx/561zaQEcs9mYHaZHdR/0Bd8ZAqfXu2NL4X4Sx/MY7SblYlxCvI
 AP8Olvh2/Ek6jNiFlFfsF2TDPpyN8MhUtaoxqzbM7ZGOJPF12yxlUmEER9fRIfoe8PE1
 vg5yT4WkQSgiXOI5E/dtovq/HJhW/mmz0cHf/EyAAjlaSXTjPOl/D1sCdEEVW01hM2C+
 npdMvv4YSTUZz0sxyOWIwdyyhc2ThotwTTucgHnNJG22slTDI6SGUOooDNIQJENh2wLG
 qayg==
X-Gm-Message-State: AOJu0Yx0FXYx3U86nP5pRHN9KKiKVOlpZSpQLtlqavPvb2mhYDZk1Zmb
 J+mAj/bmvjb/QFcSU68d31niegSD3G27SpRiEWA5z5R76D22KmY+1HxCugN+mp5O3mrQNYKfPrs
 DiIkFLp2zq0CY7oCSPGC7kxOw58i6
X-Received: by 2002:a5d:6d89:0:b0:32f:7b14:89d9 with SMTP id
 l9-20020a5d6d89000000b0032f7b1489d9mr10958284wrs.9.1700054157041; 
 Wed, 15 Nov 2023 05:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDaKwJNBk2fEmPyHouSjZgkvyhlK79vrfYZN/upvL8mRJpAtkAcw0QUDFTOK7GVHFogRFeXg==
X-Received: by 2002:a5d:6d89:0:b0:32f:7b14:89d9 with SMTP id
 l9-20020a5d6d89000000b0032f7b1489d9mr10958258wrs.9.1700054156678; 
 Wed, 15 Nov 2023 05:15:56 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h15-20020a5d548f000000b0032fbe5b1e45sm10507123wrv.61.2023.11.15.05.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:15:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] drm/virtio: Disable damage clipping if FB changed
 since last page-flip
Date: Wed, 15 Nov 2023 14:15:41 +0100
Message-ID: <20231115131549.2191589-3-javierm@redhat.com>
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
---

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

