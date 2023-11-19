Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169C7F0582
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C4E10E1C2;
	Sun, 19 Nov 2023 10:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD1110E1C2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwKTxIgr09omGUBF1m9vDxqCyG9hQEMime1yIZzuygQ=;
 b=THsNqgPy9xry+OvLdK6mqD7TFKZtbc/4nfKgD+hQKnuI+GxbZu2o9iAN38TEeIsg/MlJCs
 7lBT8Eww3RjP05rkyd4WyBG3KL/GVrgc1ERPIllSY9XbcONaHK3ZWhb+CnET9TzeUSCf8A
 fHXp3YgdRCVM2B3UVRSbN5m0iUE+Ys4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-pTgiEiNHMFSv0qJKsqGf8Q-1; Sun, 19 Nov 2023 05:57:17 -0500
X-MC-Unique: pTgiEiNHMFSv0qJKsqGf8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40855a91314so5200195e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391436; x=1700996236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwKTxIgr09omGUBF1m9vDxqCyG9hQEMime1yIZzuygQ=;
 b=RYj/PKJsK1jqBaD4vxcWUNWiocfTeNj4zoU7cwqXLx/uFAuDirq4vqTgT+Us+G4J4S
 lPJKaiWa3qDAwbz+2ZOzqH2akzwsWWiMWM7Y0FBMoO6SKTf6DqR9zfiDvTUlhW9/ca4I
 SMOM6senFhTjcbvNTZ4X80IfqMbxwFmiaKyRb/ymN1/vp5BnGsv8oHCwHHlzTtLvbX2R
 zReoSj/i0c01+9u0xS4fejU28ep+g9qcX/o4fxSInHQgihepT8O7Ben7j69djGdxEYAj
 ivyzJAXOZrWbfsdGKNuJosUpYsj/e3k0DoG9L/1j+oqdUf72u+Tx7jxGbUrPWi4rQByb
 6XUQ==
X-Gm-Message-State: AOJu0YzmHRKlVth6/7jKMP3TzsZNxJlAahxWyYCFvgbFrhrEXiXqzt5t
 X2Q5GfJWCLXDBI+s9Hs5gXb94oYGyQ8Ki3Ak7C3NdHW36xVZdg3Y4RskbcaBCghAk8sLvhMRAhi
 zNRQxvX/lPHvr5YseAoLBqdtKzV3W
X-Received: by 2002:a05:600c:a48:b0:401:b425:2414 with SMTP id
 c8-20020a05600c0a4800b00401b4252414mr8849686wmq.18.1700391436491; 
 Sun, 19 Nov 2023 02:57:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTr3xemuWiX3MZFy4qGqbNac/hdlijHFi83h7o6vBK3ccLPETc7+WJcogKeoinWFEMLApjFA==
X-Received: by 2002:a05:600c:a48:b0:401:b425:2414 with SMTP id
 c8-20020a05600c0a4800b00401b4252414mr8849674wmq.18.1700391436164; 
 Sun, 19 Nov 2023 02:57:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b0040a4835d2b2sm14233407wms.37.2023.11.19.02.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] drm: Allow drivers to indicate the damage helpers to
 ignore damage clips
Date: Sun, 19 Nov 2023 11:56:57 +0100
Message-ID: <20231119105709.3143489-2-javierm@redhat.com>
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
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
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
---

(no changes since v2)

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

