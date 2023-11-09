Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5377E7032
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3D10E8ED;
	Thu,  9 Nov 2023 17:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3D310E8EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7tI1v3g4YDcTR34UtN17p6cKRPxCtoGaa2HZ2e5M58=;
 b=K6yNWICu+VYxlr9m34aYFnIVbiFnfIqKj8Yj2E9RJQfdZkdygJOfqW046JiNGjjvj9U+yv
 LH2+ZFLlzdGCj7s+Hao+Jhx4wtBIzrNhCD4ch/4Vm6hEUH7bUu8L9mwS7WiLwsbSTqNfyC
 a/7Lg0KhyrAgJ5JQdRKfV+qrXR0oczQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-BTSWnejWPTmOOpuZc2w2Yw-1; Thu, 09 Nov 2023 12:25:18 -0500
X-MC-Unique: BTSWnejWPTmOOpuZc2w2Yw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c53ea92642so10912641fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550716; x=1700155516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7tI1v3g4YDcTR34UtN17p6cKRPxCtoGaa2HZ2e5M58=;
 b=PhSRVdVtzGrE6jRnzyXVDX2FPI7HHwKmsR6jzMm7F0619mtGVF8oWJGuPTNihcyFmV
 eVorhfJAJTEYwXjkmfwAhv0pRH4NWzU24mKirgScSZlSEjy6G1sa3b/jGVYfWPkoye9p
 JFXVzV3Q1X74ED6VQETGihyX0Vs5IJFvNFR+MJVj7x7n+b5NjGIgDd6agSi9f8QQicQv
 uocnQZFQRfpwlhclqQDkgUMPS0rgzul0jRzVUOgGPuBbBpMXYiXac+X04sduvmxYvf3v
 mNObMtZ5BiGJK7RHn4/iGEG4YLKx3PaY6njda0lxKeBXm+RYnlvD3dREz/iKUL3lkUZQ
 4FSQ==
X-Gm-Message-State: AOJu0YwADDycM81lLTW/c6qL7w01GpuhJAYKHOVLVEpu7M3YB8RCoJX1
 L0PsvtBYcWAf6lE3rqwlbXFCCgBHqaQXqDOF4Tr+OOPBIeZHAhrQ6L7CaKJXItJ1UKzmeCMzpxA
 aJcQwRkag0f5sbzAVP6cJ5lT34tls
X-Received: by 2002:ac2:549c:0:b0:500:b2f6:592 with SMTP id
 t28-20020ac2549c000000b00500b2f60592mr1983261lfk.50.1699550716517; 
 Thu, 09 Nov 2023 09:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGse4RCF/67oKfST0CFHyjm+cpu2Cvl4v5lpvsxPTmc5ZS8cA1s3XNc9fBMoe6L+fz5hMsbpg==
X-Received: by 2002:ac2:549c:0:b0:500:b2f6:592 with SMTP id
 t28-20020ac2549c000000b00500b2f60592mr1983244lfk.50.1699550716301; 
 Thu, 09 Nov 2023 09:25:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d6608000000b0032da75af3easm119414wru.80.2023.11.09.09.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/plane: Extend damage tracking kernel-doc
Date: Thu,  9 Nov 2023 18:24:39 +0100
Message-ID: <20231109172449.1599262-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109172449.1599262-1-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "Damage Tracking Properties" section in the documentation doesn't have
info about the two type of damage handling: frame damage vs buffer damage.

Add that to the section, mention the different helpers that should be used
by drivers depending on the damage handling type used and refer to sites
that have more content about damage types and damage tracking in general.

Suggested-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_damage_helper.c | 10 ++++++----
 drivers/gpu/drm/drm_plane.c         | 22 +++++++++++++++++++---
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index b72062c9d31c..ac9986da7d7c 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -367,8 +367,9 @@ static bool __drm_atomic_helper_damage_merged(const struct drm_plane_state *old_
  * This function merges any valid plane damage clips into one rectangle and
  * returns it in @rect.
  *
- * For details see: drm_atomic_helper_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next().
+ * For details see: drm_atomic_helper_damage_iter_init(),
+ * drm_atomic_helper_damage_iter_next() and
+ * `Damage Tracking Properties`_.
  *
  * Note that this helper is for drivers that do per-plane uploads and expect
  * to handle frame damages. Drivers that do per-buffer uploads instead should
@@ -400,8 +401,9 @@ EXPORT_SYMBOL(drm_atomic_helper_damage_merged);
  * full plane update should happen. It also ensure helper iterator will return
  * &drm_plane_state.src as damage.
  *
- * For details see: drm_atomic_helper_buffer_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next().
+ * For details see: drm_atomic_helper_buffer_damage_iter_init(),
+ * drm_atomic_helper_damage_iter_next() and
+ * `Damage Tracking Properties`_.
  *
  * Returns:
  * True if there is valid buffer damage otherwise false.
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..f137a99b3435 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1439,9 +1439,25 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
  *
  * Drivers that are interested in damage interface for plane should enable
  * FB_DAMAGE_CLIPS property by calling drm_plane_enable_fb_damage_clips().
- * Drivers implementing damage can use drm_atomic_helper_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next() helper iterator function to get damage
- * rectangles clipped to &drm_plane_state.src.
+ *
+ * Note that there are two types of damage handling: frame damage and buffer
+ * damage. The drivers implementing a per-plane or per-CRTC upload target and
+ * need to handle frame damage can use drm_atomic_helper_damage_iter_init(),
+ * but drivers implementing a per-buffer upload target and need to handle buffer
+ * damage should use drm_atomic_helper_buffer_damage_iter_init() helper instead.
+ *
+ * Once the iterator has been initialized by the damage helpers mentioned above,
+ * the drm_atomic_helper_damage_iter_next() helper iterator function can be used
+ * to get damage rectangles clipped to &drm_plane_state.src.
+ *
+ * The type of damage handling implemented depends on the driver's upload target
+ * but notice that when using swap buffers, the returned damage rectangle is the
+ * &drm_plane_state.src, since a full plane update should happen. There is no
+ * buffer age support or similar damage accumulation algorithm implemented yet.
+ *
+ * For more information about the two type of damage, see:
+ *     https://registry.khronos.org/EGL/extensions/KHR/EGL_KHR_swap_buffers_with_damage.txt
+ *     https://emersion.fr/blog/2019/intro-to-damage-tracking/
  */
 
 /**
-- 
2.41.0

