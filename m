Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691947F68E6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECDC10E360;
	Thu, 23 Nov 2023 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E2210E35C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNr7AyogBLBECN5NVEc3sDwHAg2qPYRl5gFzwIza95Q=;
 b=YAmVHbKorI9mDRXIrlWix/pE1Gc9WU6tWOs/BQBowJnSXKbKova/dZPl6ujhlSoFk7WaLn
 k3F9Mfm0gbjDqTiYwP2ALLpiO9iZiYv5+/dVHOWsxqMA6Tg33Lkn9jO8hcrgaml8WeEXEC
 57iIweGByHodOF5eM2oc5LCMxtXQiKA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-BUl78-uyPNKTHQzcNKXN8w-1; Thu, 23 Nov 2023 17:13:20 -0500
X-MC-Unique: BUl78-uyPNKTHQzcNKXN8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b349b990fso6275945e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777600; x=1701382400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNr7AyogBLBECN5NVEc3sDwHAg2qPYRl5gFzwIza95Q=;
 b=a0ogFUfuxVZtHzcGDpSXs3P/sLLrIgY79DpjZDc83GwWlX7aIF/Y+3+TcDnqJkEGr1
 AU67ADzQL/BP52cmqqys0GO4ntU4e10K3PFf0gR8a8Beww/RIi34GlGYaSyfjywghdZw
 e+P0SbwI1UxRW+SRglQ7hyjrndvQLnKJxrUb63JdW0/jq5BoYmsge+8Pv8bA7NueFtlZ
 rp4TYvrS74DcLqG8EpXc5oQHcIE6XYIEdv9Mu6YZo8OLZ78rJHXDJmsLmT7ixyJGUHo6
 m+RSBdPd4Hw/y7+hMgyIMb6Z6vvy37GGw0flKrtCO9pKIoVz1wSo0N5+Bg3G3AoTBr5K
 lr8Q==
X-Gm-Message-State: AOJu0Yx/nMrluLalzL2/VUrWylCZT1CJX3aa3P05K5HeUUqM6XKcVxir
 IN0oI3Knorea8NfSruXcPG0u8AdsL+12tN6WZycrfeYteXyfnk4XQjsmOQCQtt0plY0qpMiJ5hm
 qxwOeX5R495K+MiPG6Jc6t76Pgj2X
X-Received: by 2002:a05:600c:1c9d:b0:408:434c:dae7 with SMTP id
 k29-20020a05600c1c9d00b00408434cdae7mr695842wms.2.1700777599762; 
 Thu, 23 Nov 2023 14:13:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsLgt3C+76rwt6+lTv0sowa6U49h5FFZqfpVdWRCJlUnBufhPrTXVPA1hV/im8nsFEBKfIcQ==
X-Received: by 2002:a05:600c:1c9d:b0:408:434c:dae7 with SMTP id
 k29-20020a05600c1c9d00b00408434cdae7mr695832wms.2.1700777599346; 
 Thu, 23 Nov 2023 14:13:19 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0040b30be6244sm3233457wmq.24.2023.11.23.14.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm: Allow drivers to indicate the damage helpers to
 ignore damage clips
Date: Thu, 23 Nov 2023 23:13:00 +0100
Message-ID: <20231123221315.3579454-2-javierm@redhat.com>
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
 Jonathan Corbet <corbet@lwn.net>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It allows drivers to set a struct drm_plane_state .ignore_damage_clips in
their plane's .atomic_check callback, as an indication to damage helpers
such as drm_atomic_helper_damage_iter_init() that the damage clips should
be ignored.

To be used by drivers that do per-buffer (e.g: virtio-gpu) uploads (rather
than per-plane uploads), since these type of drivers need to handle buffer
damages instead of frame damages.

That way, these drivers could force a full plane update if the framebuffer
attached to a plane's state has changed since the last update (page-flip).

Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
Cc: <stable@vger.kernel.org> # v6.4+
Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

Changes in v4:
- Refer in ignore_damage_clips kernel-doc to "Damage Tracking Properties"
  KMS documentation section (Sima Vetter).

Changes in v2:
- Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
  .atomic_check, instead of having different helpers (Thomas Zimmermann).

 Documentation/gpu/drm-kms.rst       |  2 ++
 drivers/gpu/drm/drm_damage_helper.c |  3 ++-
 include/drm/drm_plane.h             | 10 ++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 270d320407c7..a98a7e04e86f 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -548,6 +548,8 @@ Plane Composition Properties
 .. kernel-doc:: drivers/gpu/drm/drm_blend.c
    :doc: overview
 
+.. _damage_tracking_properties:
+
 Damage Tracking Properties
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d8b2955e88fd..afb02aae707b 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -241,7 +241,8 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
 	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
 
-	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
+	if (!iter->clips || state->ignore_damage_clips ||
+	    !drm_rect_equals(&state->src, &old_state->src)) {
 		iter->clips = NULL;
 		iter->num_clips = 0;
 		iter->full_update = true;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 79d62856defb..fef775200a81 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -190,6 +190,16 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *fb_damage_clips;
 
+	/**
+	 * @ignore_damage_clips:
+	 *
+	 * Set by drivers to indicate the drm_atomic_helper_damage_iter_init()
+	 * helper that the @fb_damage_clips blob property should be ignored.
+	 *
+	 * See :ref:`damage_tracking_properties` for more information.
+	 */
+	bool ignore_damage_clips;
+
 	/**
 	 * @src:
 	 *
-- 
2.41.0

