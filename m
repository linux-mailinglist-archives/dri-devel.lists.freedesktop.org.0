Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E837E7024
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1410E220;
	Thu,  9 Nov 2023 17:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC110E0E2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EBII1piFhjDdYePPF4sEFQnIWSSXfwKWEcUhw8jHaI=;
 b=boegv2tWzzU6lnWD9C2PAVJIgSLu7mfTT+zOZg+r09pvBHQQFDf6PLasU9Ra7YU997Z1/T
 y3orylevIpFzCwj0cHI3GquqftTCMgh/MxAgJLfQYZ54OGpUtvBS8FnxZjjt+C0TSyD5pp
 b/SV/ekIWoZTaTLZG4kKNnUyrNOsb+4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-lbH3gCnuPdC1K5ha5oKLbA-1; Thu, 09 Nov 2023 12:25:09 -0500
X-MC-Unique: lbH3gCnuPdC1K5ha5oKLbA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-507b9078aaaso1101001e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550708; x=1700155508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EBII1piFhjDdYePPF4sEFQnIWSSXfwKWEcUhw8jHaI=;
 b=AfzJvbF52zy3v4wIL4mHX4FUM5J178MpNBqLiJgURDsz9Kvsf8xCcI6f0cS8PoWJet
 eRu3xwz13LXWokJCe6rtY+/uaBpSDizI0EXnUu94F3N+N53XatoDGEL0mUrLTbjmTr6+
 9/+f9k7/gar5UyhHG61OUHisH06Ret9yQcQIm1mv0QyLfZuduTThqfdN8g8lEPb6tfQ/
 XLP3AGb2r1sQZGEJJQwd8pXneJleVwTBEekOgcnuoeUoB7Unjc5lwixwOX+gER8Kn+5U
 Ab+u4yJI5us06kPnoUj0NbieqaXDptXx6t5Yw7w1M816QcQyix9jkce6gUjwgLwG5haB
 ePGA==
X-Gm-Message-State: AOJu0Yw3rq41z4rRZQyxLpk8pT3UDBOY1qY710JuXRYgbD0LqdjGHh5K
 llWoRNLLFUy3DPQtSbxLjNBJFHNvDaGdWUKsNcHZyxBdCgNOuSr3oWrF5t2/0e/nVyO10BWJZtV
 z42VeZuvJ0k2v9QAHjIjcDFdPfRYH
X-Received: by 2002:a19:e00d:0:b0:503:32bb:d5ca with SMTP id
 x13-20020a19e00d000000b0050332bbd5camr1864082lfg.31.1699550708377; 
 Thu, 09 Nov 2023 09:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH47EfQ6rX+t1XL8dC+Is/tx0yp1WtqPF4aXtdXPWPqw3Pqau19ZWSC5+9vmC1RAuAaGC1wqw==
X-Received: by 2002:a19:e00d:0:b0:503:32bb:d5ca with SMTP id
 x13-20020a19e00d000000b0050332bbd5camr1864072lfg.31.1699550707984; 
 Thu, 09 Nov 2023 09:25:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600000ce00b003143c9beeaesm133795wrx.44.2023.11.09.09.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] drm: Move drm_atomic_helper_damage_{iter_init,
 merged}() to helpers
Date: Thu,  9 Nov 2023 18:24:35 +0100
Message-ID: <20231109172449.1599262-2-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need a similar drm_atomic_helper_buffer_damage_merged() helper function
that takes into account if a framebuffer attached to the plane has changed
since the last plane update (page-flip).

Since both damage helpers will share most of the current logic, move it to
an internal helper. The drm_atomic_helper_buffer_damage_merged() will have
to use a different drm_atomic_helper_buffer_damage_iter_init() function so
move that logic also to an internal helper.

Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
Cc: <stable@vger.kernel.org> # v6.4+
Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_damage_helper.c | 95 +++++++++++++++++------------
 1 file changed, 55 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d8b2955e88fd..aa2325567918 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -201,28 +201,10 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL(drm_atomic_helper_dirtyfb);
 
-/**
- * drm_atomic_helper_damage_iter_init - Initialize the damage iterator.
- * @iter: The iterator to initialize.
- * @old_state: Old plane state for validation.
- * @state: Plane state from which to iterate the damage clips.
- *
- * Initialize an iterator, which clips plane damage
- * &drm_plane_state.fb_damage_clips to plane &drm_plane_state.src. This iterator
- * returns full plane src in case damage is not present because either
- * user-space didn't sent or driver discarded it (it want to do full plane
- * update). Currently this iterator returns full plane src in case plane src
- * changed but that can be changed in future to return damage.
- *
- * For the case when plane is not visible or plane update should not happen the
- * first call to iter_next will return false. Note that this helper use clipped
- * &drm_plane_state.src, so driver calling this helper should have called
- * drm_atomic_helper_check_plane_state() earlier.
- */
-void
-drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
-				   const struct drm_plane_state *old_state,
-				   const struct drm_plane_state *state)
+static void
+__drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
+				     const struct drm_plane_state *old_state,
+				     const struct drm_plane_state *state)
 {
 	struct drm_rect src;
 	memset(iter, 0, sizeof(*iter));
@@ -247,6 +229,32 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 		iter->full_update = true;
 	}
 }
+
+/**
+ * drm_atomic_helper_damage_iter_init - Initialize the damage iterator.
+ * @iter: The iterator to initialize.
+ * @old_state: Old plane state for validation.
+ * @state: Plane state from which to iterate the damage clips.
+ *
+ * Initialize an iterator, which clips plane damage
+ * &drm_plane_state.fb_damage_clips to plane &drm_plane_state.src. This iterator
+ * returns full plane src in case damage is not present because either
+ * user-space didn't sent or driver discarded it (it want to do full plane
+ * update). Currently this iterator returns full plane src in case plane src
+ * changed but that can be changed in future to return damage.
+ *
+ * For the case when plane is not visible or plane update should not happen the
+ * first call to iter_next will return false. Note that this helper use clipped
+ * &drm_plane_state.src, so driver calling this helper should have called
+ * drm_atomic_helper_check_plane_state() earlier.
+ */
+void
+drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
+				   const struct drm_plane_state *old_state,
+				   const struct drm_plane_state *state)
+{
+	__drm_atomic_helper_damage_iter_init(iter, old_state, state);
+}
 EXPORT_SYMBOL(drm_atomic_helper_damage_iter_init);
 
 /**
@@ -291,24 +299,9 @@ drm_atomic_helper_damage_iter_next(struct drm_atomic_helper_damage_iter *iter,
 }
 EXPORT_SYMBOL(drm_atomic_helper_damage_iter_next);
 
-/**
- * drm_atomic_helper_damage_merged - Merged plane damage
- * @old_state: Old plane state for validation.
- * @state: Plane state from which to iterate the damage clips.
- * @rect: Returns the merged damage rectangle
- *
- * This function merges any valid plane damage clips into one rectangle and
- * returns it in @rect.
- *
- * For details see: drm_atomic_helper_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next().
- *
- * Returns:
- * True if there is valid plane damage otherwise false.
- */
-bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
-				     struct drm_plane_state *state,
-				     struct drm_rect *rect)
+static bool __drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
+					      struct drm_plane_state *state,
+					      struct drm_rect *rect)
 {
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect clip;
@@ -330,4 +323,26 @@ bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
 
 	return valid;
 }
+
+/**
+ * drm_atomic_helper_damage_merged - Merged plane damage
+ * @old_state: Old plane state for validation.
+ * @state: Plane state from which to iterate the damage clips.
+ * @rect: Returns the merged damage rectangle
+ *
+ * This function merges any valid plane damage clips into one rectangle and
+ * returns it in @rect.
+ *
+ * For details see: drm_atomic_helper_damage_iter_init() and
+ * drm_atomic_helper_damage_iter_next().
+ *
+ * Returns:
+ * True if there is valid plane damage otherwise false.
+ */
+bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
+				     struct drm_plane_state *state,
+				     struct drm_rect *rect)
+{
+	return __drm_atomic_helper_damage_merged(old_state, state, rect);
+}
 EXPORT_SYMBOL(drm_atomic_helper_damage_merged);
-- 
2.41.0

