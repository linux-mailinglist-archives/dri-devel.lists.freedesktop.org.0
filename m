Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF67EC37E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B8710E553;
	Wed, 15 Nov 2023 13:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8F810E553
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdkCfOkpqSODFD3esOEEEI4uePJ2ewc8SQpEyHY/6Ls=;
 b=D25EPnv3b1m4XevYBBdCnUQG8rhkLCyWYrW0kfrzlwY0W57ZXhhU4X0VBTWvYwNq7teqns
 1J9Sd5By+FHY//51lT5e0tHIlDQGGc+2woBDmqjhCQTPZgLM+TpH2QWQ1CeT25ZcqEpixh
 8iGnKfyShOnTIQpT11cosBgRjANBxXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-TPCH7OKtPxqAo7gVQu2r7w-1; Wed, 15 Nov 2023 08:21:01 -0500
X-MC-Unique: TPCH7OKtPxqAo7gVQu2r7w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4083a670d25so43526425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054155; x=1700658955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdkCfOkpqSODFD3esOEEEI4uePJ2ewc8SQpEyHY/6Ls=;
 b=GI85sIfH3mkbVKsBW3eUdAxYMHTKxga3S8HBT06Tsl+wWqYmUOx/EiyawiDu4tBsg0
 zlxJqIB1vdoN283iTBN17ylDN7PX907Xc2m6/uFsV+FbAPg0N0w6UQdeCHDHrTV46j7A
 CZGvenSEZWYjYS+F+yH2/F8FZSo4yBWxkSUV031Sr+EC766SQZKJg6mGfF2p8DbS114t
 7hbGUtN77i8hf4h7b48YHG5B7u9srH69b2zULAp2QHjHkUb91oBMuEec6FiL5o0TUbXo
 r7AMkgrUMTvzqCxJNxOzB2gInivADnMlfIxMjXJPAgnO05hakrEXh9/+WyPmqw9okedB
 xcFw==
X-Gm-Message-State: AOJu0YzrDDYqTT1/yQ2fOtdwVUulT8yTvQHlm1CT1HBMKnt0OFRRMzBU
 jM3p8WPs1HJIA1CtH8SFEY3qpV3MxmvctszZ2peE3zmrohAfRhlBD8X+/Zdemnye9hrhBUYdly3
 lldz+fIxekFIh0FLQ6teuXAbjCTKB
X-Received: by 2002:a05:600c:1d12:b0:40a:4429:a994 with SMTP id
 l18-20020a05600c1d1200b0040a4429a994mr9334052wms.28.1700054155057; 
 Wed, 15 Nov 2023 05:15:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoWZxbtxmm92MRQ4/GXfrWok30Xz8lAdSnCK8MW1HWy9dYer1O9tD6vbzy8D8AMhy89TPi+g==
X-Received: by 2002:a05:600c:1d12:b0:40a:4429:a994 with SMTP id
 l18-20020a05600c1d1200b0040a4429a994mr9334033wms.28.1700054154854; 
 Wed, 15 Nov 2023 05:15:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b0040841e79715sm14706785wml.27.2023.11.15.05.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:15:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm: Allow drivers to indicate the damage helpers to
 ignore damage clips
Date: Wed, 15 Nov 2023 14:15:40 +0100
Message-ID: <20231115131549.2191589-2-javierm@redhat.com>
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
---

Changes in v2:
- Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
  .atomic_check, instead of having different helpers (Thomas Zimmermann).

 drivers/gpu/drm/drm_damage_helper.c | 3 ++-
 include/drm/drm_plane.h             | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

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
index 79d62856defb..cc2e8fc35fd2 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -190,6 +190,14 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *fb_damage_clips;
 
+	/**
+	 * @ignore_damage_clips:
+	 *
+	 * Set by drivers to indicate the drm_atomic_helper_damage_iter_init()
+	 * helper that the @fb_damage_clips blob property should be ignored.
+	 */
+	bool ignore_damage_clips;
+
 	/**
 	 * @src:
 	 *
-- 
2.41.0

