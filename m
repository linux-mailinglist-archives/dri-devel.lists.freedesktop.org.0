Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E57F68E4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D6810E35C;
	Thu, 23 Nov 2023 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD27E10E35C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dih2whL2MPf6NwDlCWNCaNjlgkoV00h0l9L+4gltDhE=;
 b=AdN0YetQMTz+ExCc7A1jfCK5xCJJRa7qT64BmzB0+O3Gj1tnZQ2hpBeCiN2/iuCTwxSIgF
 be9sYRzYnu1sEiB34xLOUh9rXU6N82460SSKkbqiS+Nk8e1pReNdk90a/Z10fxhfJCLl3V
 dkhDUiOMGSsnOLh4QP4TnC2aHlqFdt4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-HW8gSO4pOf6x7oSr6vScnA-1; Thu, 23 Nov 2023 17:13:27 -0500
X-MC-Unique: HW8gSO4pOf6x7oSr6vScnA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40b297925ccso6883235e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777606; x=1701382406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dih2whL2MPf6NwDlCWNCaNjlgkoV00h0l9L+4gltDhE=;
 b=sxBXaU0t5MbfE1lSX9fEp2whyUYTbSAb3fuiMo0wBn+RbapnG/Vfb6ASUtY8bAcJNt
 wvklYu34+mu8KxEbBT0N1pHCxSiErCSqUfdI9Eh15bgK5cTGYzJ5WCPctqF1PJu+9nG3
 P3g7D8wm8Eh5jVX4DDL21x32tF7f7/Zf/nH37+AKYUJzOe/VWtn8Wl/ttmJBxvCLnU1m
 NO8CGxPzt42ReJv5XWHr7MKGNO556OPHXp8zD5ica1oB3xYgEO0D1kbTIQHWyQyz7bUT
 k23vclOODY1lh/9c09UozU/QT8Iu+dmGgFo1aCjwSDtlZuUzcU/kHY7Vc9h54/gQufQq
 FLIQ==
X-Gm-Message-State: AOJu0YwRjMxkHndHtDsPhDcH/sBzeUO8kA+NldHqxo26PQ9yyhx2wuRM
 n13CskUzWRSNNYUTSzjvKEe1xL9DmNhsDFntkrHDHpMNav3G377NOzCvfNtD04hn30bfVkeILZI
 WH2XYJFVJQzuRryBlPPYLDImHZWSJ
X-Received: by 2002:a7b:cc8f:0:b0:40a:6235:e832 with SMTP id
 p15-20020a7bcc8f000000b0040a6235e832mr646337wma.19.1700777606326; 
 Thu, 23 Nov 2023 14:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUS52KyNbklxpPEj23AckZsdZntJX98+LIJ9h/c+7dPvbvw5i7N6FBV/jDsPgq5cqyhTFDUQ==
X-Received: by 2002:a7b:cc8f:0:b0:40a:6235:e832 with SMTP id
 p15-20020a7bcc8f000000b0040a6235e832mr646322wma.19.1700777606063; 
 Thu, 23 Nov 2023 14:13:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b00332e6a0e9f4sm1363883wro.75.2023.11.23.14.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:24 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] drm/plane: Extend damage tracking kernel-doc
Date: Thu, 23 Nov 2023 23:13:03 +0100
Message-ID: <20231123221315.3579454-5-javierm@redhat.com>
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
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "Damage Tracking Properties" section in the documentation doesn't have
info about the two type of damage handling: frame damage vs buffer damage.

Add it to the section and mention that helpers only support frame damage,
and how drivers handling buffer damage can indicate that the damage clips
should be ignored.

Also add references to further documentation about the two damage types.

Suggested-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

Changes in v4:
- Add another paragraph to "Damage Tracking Properties" section to mention
  the fields that drivers with per-buffer upload target should check to set
  drm_plane_state.ignore_damage_clips (Sima Vetter).

Changes in v3:
- Fix typo in the kernel-doc (Simon Ser).
- Add a paragraph explaining what the problem in the kernel is and
  make it clear that the refeference documents are related to how
  user-space handles this case (Thomas Zimmermann).

 drivers/gpu/drm/drm_plane.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..662e0ba2707a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1442,6 +1442,36 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
  * Drivers implementing damage can use drm_atomic_helper_damage_iter_init() and
  * drm_atomic_helper_damage_iter_next() helper iterator function to get damage
  * rectangles clipped to &drm_plane_state.src.
+ *
+ * Note that there are two types of damage handling: frame damage and buffer
+ * damage, the type of damage handling implemented depends on a driver's upload
+ * target. Drivers implementing a per-plane or per-CRTC upload target need to
+ * handle frame damage, while drivers implementing a per-buffer upload target
+ * need to handle buffer damage.
+ *
+ * The existing damage helpers only support the frame damage type, there is no
+ * buffer age support or similar damage accumulation algorithm implemented yet.
+ *
+ * Only drivers handling frame damage can use the mentioned damage helpers to
+ * iterate over the damaged regions. Drivers that handle buffer damage, must set
+ * &drm_plane_state.ignore_damage_clips for drm_atomic_helper_damage_iter_init()
+ * to know that damage clips should be ignored and return &drm_plane_state.src
+ * as the damage rectangle, to force a full plane update.
+ *
+ * Drivers with a per-buffer upload target could compare the &drm_plane_state.fb
+ * of the old and new plane states to determine if the framebuffer attached to a
+ * plane has changed or not since the last plane update. If &drm_plane_state.fb
+ * has changed, then &drm_plane_state.ignore_damage_clips must be set to true.
+ *
+ * That is because drivers with a per-plane upload target, expect the backing
+ * storage buffer to not change for a given plane. If the upload buffer changes
+ * between page flips, the new upload buffer has to be updated as a whole. This
+ * can be improved in the future if support for frame damage is added to the DRM
+ * damage helpers, similarly to how user-space already handle this case as it is
+ * explained in the following documents:
+ *
+ *     https://registry.khronos.org/EGL/extensions/KHR/EGL_KHR_swap_buffers_with_damage.txt
+ *     https://emersion.fr/blog/2019/intro-to-damage-tracking/
  */
 
 /**
-- 
2.41.0

