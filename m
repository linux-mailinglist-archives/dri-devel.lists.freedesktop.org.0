Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3063773E5
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 21:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2016E075;
	Sat,  8 May 2021 19:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EF56E075
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 19:53:00 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s22so10277953pgk.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 12:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBsK6dWp5skNfFIzG+9Owffi0WswqdNNRuWbcPljwx4=;
 b=ZJ9IHRTafnvjESVpofVZbajXd0g/0aiRJOCf0yg83Nd7stLc8cvrc1xywNOPZAyPIq
 oU4x5sET3dK0qUNJNxQ4Q/6TaLD04bdtrekXTFVwVJfDK2PLLCFVh9R9mBuKX/KBhRhC
 DJ6XFqvgZYcNh6QamqJttii1hodqp9cOR3fZFz7QdsuFHhbpJscNv+xOnPXA9472d9wm
 KoDQmGARa5YkBuaP16+grXzuNQ6Xi3lDo6Ma8hFLLgHPvFCqp+UrZyoYOW3RIJP1e9S+
 zZC6IhZK/B2Stk4woMbjILKijrJEeLmm6NE6VcvzwKTi99YopSWYDg3lzNkWGYnorJFG
 7dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBsK6dWp5skNfFIzG+9Owffi0WswqdNNRuWbcPljwx4=;
 b=GJPp43KlaEEBe1peiXSfL81Qz1pKDeprUn2j+dO0OQcMUtgjToczueca02zyCdbMx6
 uS7elvzQo9VRjsNuiuVQEcfoZOgD1srS/3nervsqWXa0yD2fsa0yVw/feke9y8d1G/ob
 rpv7HiprwHnIE3yw7WsnUoT5YEupw147Jnfvr0F4FCDe6oKyEqWIWNX+4LCZSEyj6WS2
 7BgnMZb86NbVrWG/ZOlvt7DZkb81sOYbZwEzub+jv9+WEpqJ82zz/5PlyK2bWPbX6LHs
 o/dfV43afzNbt86qipy7pMZDCDs/5YkVW0/jHsIeKXarjNJOJfXdm0ogrOsya2rod30n
 hLhw==
X-Gm-Message-State: AOAM53027mwOZU4Z3fXAnDcQG1oOH6xF0Bw1qBtnWfnwxjcYQ7WtUiOU
 ddbSUZRmABWstyLWoPyCcoh/0E53QSeOtw==
X-Google-Smtp-Source: ABdhPJxLZGpE+T5z69LFABcJUtb/z3YZRyWlRRfvZxgGDGJ5WhVgR3JBhTe/zsTCMHQnxQTIgldqcA==
X-Received: by 2002:a05:6a00:ccd:b029:28e:d682:cc66 with SMTP id
 b13-20020a056a000ccdb029028ed682cc66mr16730988pfv.53.1620503579375; 
 Sat, 08 May 2021 12:52:59 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j7sm7087347pfc.164.2021.05.08.12.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 12:52:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Fix dirtyfb stalls
Date: Sat,  8 May 2021 12:56:38 -0700
Message-Id: <20210508195641.397198-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-1-robdclark@gmail.com>
References: <20210508195641.397198-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
mode" type displays, which is pointless and unnecessary.  Add an
optional helper vfunc to determine if a plane is attached to a CRTC
that actually needs dirtyfb, and skip over them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
 include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 3a4126dc2520..a0bed1a2c2dc 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 retry:
 	drm_for_each_plane(plane, fb->dev) {
 		struct drm_plane_state *plane_state;
+		struct drm_crtc *crtc;
 
 		ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
 		if (ret)
@@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 			continue;
 		}
 
+		crtc = plane->state->crtc;
+		if (crtc->helper_private->needs_dirtyfb &&
+				!crtc->helper_private->needs_dirtyfb(crtc)) {
+			drm_modeset_unlock(&plane->mutex);
+			continue;
+		}
+
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
 			ret = PTR_ERR(plane_state);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index eb706342861d..afa8ec5754e7 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
 				     bool in_vblank_irq, int *vpos, int *hpos,
 				     ktime_t *stime, ktime_t *etime,
 				     const struct drm_display_mode *mode);
+
+	/**
+	 * @needs_dirtyfb
+	 *
+	 * Optional callback used by damage helpers to determine if fb_damage_clips
+	 * update is needed.
+	 *
+	 * Returns:
+	 *
+	 * True if fb_damage_clips update is needed to handle DIRTYFB, False
+	 * otherwise.  If this callback is not implemented, then True is
+	 * assumed.
+	 */
+	bool (*needs_dirtyfb)(struct drm_crtc *crtc);
 };
 
 /**
-- 
2.30.2

