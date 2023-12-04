Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BC803431
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FF910E1C5;
	Mon,  4 Dec 2023 13:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6C110E1C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:14:59 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-50be3611794so2622644e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695698; x=1702300498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlFVUNY6tW/87kD0ZRvwKU4P7/Sbw3efuhtuCHaoXGw=;
 b=jjNEd2gU+/96ykjEwWqOQ5kAuOgUsdlulAlYqs8smbx+ejMEq4MqxYnpODrjNbNgA8
 PGC8rwJfztsRON1o5rzH3t9acI71uek1ENmZMg3OLzGbeDBkffXlm65e1SKT1lVCsj6B
 cHm53N6vHxkC9P3Lw0BmSjSgCgN2lD0/6xLSwDOhgEcLfWBfMl9vyvtcw6mBkAFJmA3j
 pPQ8a8BoVw7hS6WNyLXFp8y5AI5uheE1zCe8GKnO2Yp2Lw+jNDA+Xb6RpJXdImaNBqkb
 /13UyIQRd6MR9sF5iSPu3aKEND55MWe/pCPqLmYYbCvyQTFMSmEyopWp0NXJ6gpZJh8Q
 l4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695698; x=1702300498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlFVUNY6tW/87kD0ZRvwKU4P7/Sbw3efuhtuCHaoXGw=;
 b=geCwUGN50Xhswho8U65xooSQ+1opJ3c7sdyM/E0VjhEK9q4EuAy0QC9m5fHgOnFa9P
 IbVGe8vB5MweDl1eNhcS2S8k3VWbsTuKH66pTK4vqf44qXLkEEzsTMZWZVGHkqxJpFs3
 53vRUiMe+FNYn3oa3OGQySUyHqVvbRrFl9bX8x+SEEWgfdVeAjyozKLZUfYczhYPC2YQ
 T1FACgTFCD27/RDcLhAPwOsL+Yk9JJEHbm3QzuDqusWj+c6Tw2l9ujsEJK+zJkYYt3TD
 vCuVwd+QR/s+PnH5LxJ8HOW9cjY82BawqJ8llIOT2rAMdD9C+ptuLbQyeF76KrkHppEE
 gUqA==
X-Gm-Message-State: AOJu0YxqrSrB0esngWFlSjJlss8VM7tzHRKUzGFhFi7/UYUI/poDllIp
 AugaEcUvYHYwO22Ga5zsKPCMCw==
X-Google-Smtp-Source: AGHT+IEgZeVEj6wNutUxqv9hCljBjhDxuKI8mprREK+99n098AI2zpr7KSSKygJ58uNQmVmdrQbD5A==
X-Received: by 2002:a05:6512:ac3:b0:50b:e229:23b0 with SMTP id
 n3-20020a0565120ac300b0050be22923b0mr2318513lfu.94.1701695697747; 
 Mon, 04 Dec 2023 05:14:57 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/7] Revert "drm/atomic: Move framebuffer checks to helper"
Date: Mon,  4 Dec 2023 15:13:49 +0200
Message-ID: <20231204131455.19023-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 4ba6b7a646321e740c7f2d80c90505019c4e8fce.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 130 +++++++++++++++--------------------
 1 file changed, 57 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c6f2b86c48ae..1339785fbe80 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -589,76 +589,6 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 	return true;
 }
 
-static int drm_atomic_plane_check_fb(const struct drm_plane_state *state)
-{
-	struct drm_plane *plane = state->plane;
-	const struct drm_framebuffer *fb = state->fb;
-	struct drm_mode_rect *clips;
-
-	uint32_t num_clips;
-	unsigned int fb_width, fb_height;
-	int ret;
-
-	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-
-	if (ret) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
-			       plane->base.id, plane->name,
-			       &fb->format->format, fb->modifier);
-		return ret;
-	}
-
-	fb_width = fb->width << 16;
-	fb_height = fb->height << 16;
-
-	/* Make sure source coordinates are inside the fb. */
-	if (state->src_w > fb_width ||
-	    state->src_x > fb_width - state->src_w ||
-	    state->src_h > fb_height ||
-	    state->src_y > fb_height - state->src_h) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid source coordinates "
-			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-			       plane->base.id, plane->name,
-			       state->src_w >> 16,
-			       ((state->src_w & 0xffff) * 15625) >> 10,
-			       state->src_h >> 16,
-			       ((state->src_h & 0xffff) * 15625) >> 10,
-			       state->src_x >> 16,
-			       ((state->src_x & 0xffff) * 15625) >> 10,
-			       state->src_y >> 16,
-			       ((state->src_y & 0xffff) * 15625) >> 10,
-			       fb->width, fb->height);
-		return -ENOSPC;
-	}
-
-	clips = __drm_plane_get_damage_clips(state);
-	num_clips = drm_plane_get_damage_clips_count(state);
-
-	/* Make sure damage clips are valid and inside the fb. */
-	while (num_clips > 0) {
-		if (clips->x1 >= clips->x2 ||
-		    clips->y1 >= clips->y2 ||
-		    clips->x1 < 0 ||
-		    clips->y1 < 0 ||
-		    clips->x2 > fb_width ||
-		    clips->y2 > fb_height) {
-			drm_dbg_atomic(plane->dev,
-				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
-				       plane->base.id, plane->name, clips->x1,
-				       clips->y1, clips->x2, clips->y2);
-			return -EINVAL;
-		}
-		clips++;
-		num_clips--;
-	}
-
-	return 0;
-}
-
 /**
  * drm_atomic_plane_check - check plane state
  * @old_plane_state: old plane state to check
@@ -675,6 +605,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	const struct drm_framebuffer *fb = new_plane_state->fb;
+	unsigned int fb_width, fb_height;
+	struct drm_mode_rect *clips;
+	uint32_t num_clips;
 	int ret;
 
 	/* either *both* CRTC and FB must be set, or neither */
@@ -701,6 +634,17 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -EINVAL;
 	}
 
+	/* Check whether this plane supports the fb pixel format. */
+	ret = drm_plane_check_pixel_format(plane, fb->format->format,
+					   fb->modifier);
+	if (ret) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
+			       plane->base.id, plane->name,
+			       &fb->format->format, fb->modifier);
+		return ret;
+	}
+
 	/* Give drivers some help against integer overflows */
 	if (new_plane_state->crtc_w > INT_MAX ||
 	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
@@ -714,10 +658,50 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -ERANGE;
 	}
 
+	fb_width = fb->width << 16;
+	fb_height = fb->height << 16;
 
-	ret = drm_atomic_plane_check_fb(new_plane_state);
-	if (ret)
-		return ret;
+	/* Make sure source coordinates are inside the fb. */
+	if (new_plane_state->src_w > fb_width ||
+	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
+	    new_plane_state->src_h > fb_height ||
+	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid source coordinates "
+			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+			       plane->base.id, plane->name,
+			       new_plane_state->src_w >> 16,
+			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_h >> 16,
+			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_x >> 16,
+			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_y >> 16,
+			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
+			       fb->width, fb->height);
+		return -ENOSPC;
+	}
+
+	clips = __drm_plane_get_damage_clips(new_plane_state);
+	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
+
+	/* Make sure damage clips are valid and inside the fb. */
+	while (num_clips > 0) {
+		if (clips->x1 >= clips->x2 ||
+		    clips->y1 >= clips->y2 ||
+		    clips->x1 < 0 ||
+		    clips->y1 < 0 ||
+		    clips->x2 > fb_width ||
+		    clips->y2 > fb_height) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
+				       plane->base.id, plane->name, clips->x1,
+				       clips->y1, clips->x2, clips->y2);
+			return -EINVAL;
+		}
+		clips++;
+		num_clips--;
+	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
 		drm_dbg_atomic(plane->dev,
-- 
2.42.0

