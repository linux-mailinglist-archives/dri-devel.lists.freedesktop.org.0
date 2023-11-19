Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7167F058D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F8A10E1C5;
	Sun, 19 Nov 2023 10:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA910E1C5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=272K2eB9MyeGkXnHsQZRLNPPDUgj78GVefhevePLWuQ=;
 b=iERufLQQ8tSyrFpjvJtZu8Oqe7/snmQM3MC84kJXC+36wo8Bp4fo8a0Tf1WaqblVG1l9mi
 HthLKosicOAQkt7L8jZ7x4brI0lxM7UM2HHjyQE8NydFaGqnKnDK6pnmJ5Cnh6zkcDXI/T
 lIN4TWeM3vc2NwHVZb+ps9zFHXFQUG0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-A2sUUkJKPyOnY-mUqb-KKQ-1; Sun, 19 Nov 2023 05:57:23 -0500
X-MC-Unique: A2sUUkJKPyOnY-mUqb-KKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-408f9e9e9b0so7877665e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391442; x=1700996242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=272K2eB9MyeGkXnHsQZRLNPPDUgj78GVefhevePLWuQ=;
 b=dzgQ3ra0Eg5ndPyhTif6FFTsOQACRpOZNp4Y9UjDbLcEjN1KUXY4c+xDVqFlF5excW
 CrAt4KhgslDbZS3XZ1Vjqq2LyXt8qWwzd/mPQG8crYk8XVKJSRSaQWxDcuFq3Rbq1RvR
 ibyFnadOQnGopYpyfiZpfW4PBG+WFo1d6/8CnP1O+HfKq5KsmTM9um0ew1sqlg9YTKNv
 BU0zc+6nz1UQxfcJOr22bfEhcaUfbxlTVsop8QqanwuJiREmnGFt4mmhDetxDJ6w9WF5
 AIb5WkTzQtoCi1m2E0bnpmE0idee9rvdRvniV8Dx37/6/5KVTOvyk8iZZlx8IeEHt0mF
 qZGA==
X-Gm-Message-State: AOJu0YzLahUli0atFHYmtFSx5i76OklKAKObTrRfZixuQ87XsocY10Kf
 mt8DbC/FJ+ZHwvka7iCS0ShdF33UooiHec8hw3kf/roA2MeoMN5a4EM0ZfiPdae3f4ZUVnWbYQX
 YWlUOUf3379iDMs/FTnIaGbUetA4b
X-Received: by 2002:a05:600c:3c8f:b0:40a:3e13:22aa with SMTP id
 bg15-20020a05600c3c8f00b0040a3e1322aamr3943997wmb.7.1700391442424; 
 Sun, 19 Nov 2023 02:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYUt/8Jcf7ERcy5KXqfH+OtRpcgE15vf7fYhtZFTeCEEm0OJBSqdb3sD/eG2BQK1nsRynYmQ==
X-Received: by 2002:a05:600c:3c8f:b0:40a:3e13:22aa with SMTP id
 bg15-20020a05600c3c8f00b0040a3e1322aamr3943987wmb.7.1700391442133; 
 Sun, 19 Nov 2023 02:57:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0040a45fffd27sm14009431wmq.10.2023.11.19.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] drm/plane: Extend damage tracking kernel-doc
Date: Sun, 19 Nov 2023 11:57:00 +0100
Message-ID: <20231119105709.3143489-5-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
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
---

Changes in v3:
- Fix typo in the kernel-doc (Simon Ser).
- Add a paragraph explaining what the problem in the kernel is and
  make it clear that the refeference documents are related to how
  user-space handles this case (Thomas Zimmermann).

 drivers/gpu/drm/drm_plane.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..87edd6c3c5a4 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1442,6 +1442,32 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
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
+ * iterate over the damaged regions. Drivers that handle buffer damage, need to
+ * set &struct drm_plane_state.ignore_damage_clips as an indication to
+ * drm_atomic_helper_damage_iter_init() that the damage clips should be ignored.
+ * In that case, the returned damage rectangle is the &drm_plane_state.src since
+ * a full plane update should happen.
+ *
+ * That is because drivers with a per-plane upload target, expect the backing
+ * storage buffer to not change for a given plane. If the upload buffer changes
+ * between page flips, the new  upload buffer has to be updated as a whole. This
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

