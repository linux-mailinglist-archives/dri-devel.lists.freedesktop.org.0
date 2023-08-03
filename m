Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B376F427
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9C110E21C;
	Thu,  3 Aug 2023 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9E10E218
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:45:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5221bd8f62eso411593a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691095525; x=1691700325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gwq7e2BGej0SZexbE3Z4ILHnIul8QCUxW07mh0nlF7c=;
 b=eahdQWYLm4aBp348PvPDhiBvfvHh+cEjA3PsdWPPYccX1zF+H5xeO5+DrX4+0lznRb
 AOTHItySH2aXJjF4DMFV4h8WY48Dt6CCAdVnBPlcG8L6zAf3VB+iD1KSAgUzAF65LDnp
 kDQFF4Ob0CqcyRNDKDOZdU/r+AcC1cDX5TSqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691095525; x=1691700325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwq7e2BGej0SZexbE3Z4ILHnIul8QCUxW07mh0nlF7c=;
 b=eXSJ7BBcS5c147yiP8TFtSSuvBnK+uhSXNwRU1XggfdU8htz48dr51x1Bf/aqkhMLc
 mtBEiJ37xk7KqdzyonhuoEFoJ8VOi/rX8/SOkrF5PnrB+LlidtrBUqxUwEokBPDkTCei
 DVrxTr3T4eY+faJYEVHYWcKKj6iaoVJ6qNF00g8L/jfPdPXwHypSZMdiLQBUcQI/1Fel
 kk1bKGrB6exgXgJUm2VBTiD4WYB1Qh9QJWTgjSYjjPdjlkKmdy6ISqVibz9Zxp9JbkXh
 oKv/McAw0z8UUz4pbVmGuS5sdf7lOdxkUZl0frekTKxR1Ieb4FHpIWN7gALBdpS74y1u
 dnjw==
X-Gm-Message-State: ABy/qLaK9aNF7TIQRuDTripUR4PevXHc+AceHui9KPWEUUAHh7Y2O65r
 D5QBxLP+jztPuzOB3GV2IwWkHb6Y1sY+fwX0B/o=
X-Google-Smtp-Source: APBJJlGuOXp4NnZ5oEOgxM5tRZf66bsssj1/M2U1Kl1rjRYL01gqSm34lliDKYtsCMB+1N7/knSg+w==
X-Received: by 2002:a05:6402:430b:b0:521:66b4:13b4 with SMTP id
 m11-20020a056402430b00b0052166b413b4mr16395930edc.0.1691095524840; 
 Thu, 03 Aug 2023 13:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7c2cd000000b0051df54c6a27sm262950edp.56.2023.08.03.13.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 13:45:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm/mdp5: Don't leak some plane state
Date: Thu,  3 Aug 2023 22:45:21 +0200
Message-Id: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apparently no one noticed that mdp5 plane states leak like a sieve
ever since we introduced plane_state->commit refcount a few years ago
in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
early by tracking commits, v3.")

Fix it by using the right helpers.

Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reported-and-tested-by: dorum@noisolation.com
Cc: dorum@noisolation.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..0d5ff03cb091 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -130,8 +130,7 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 {
 	struct mdp5_plane_state *pstate = to_mdp5_plane_state(state);
 
-	if (state->fb)
-		drm_framebuffer_put(state->fb);
+	__drm_atomic_helper_plane_destroy_state(state);
 
 	kfree(pstate);
 }
-- 
2.40.1

