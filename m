Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B60514AEC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 15:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAE310E887;
	Fri, 29 Apr 2022 13:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302D10E7C5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:42:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t6so10868906wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
 b=N4XnacrlIJOl6lbyMFacQ/g97VTDThQBnICB4g/Fmk/a+pS7Hmsk5RtzyOVO2kwReF
 Xckyvar8y4RjkB/KelgpQWHjALa/9a3dAZJ6u66ll3udfdqlzfj9D9tOer18XZZiWGlL
 XKCk9Xh7as7dsLBT4tEXefknzo8GHlPOeHvpPE5AXqsHZOpEdvEQw2JF3RyacmitZ/x1
 nbdPzKfu8pfwew9P871Qzxm0r2an5/gF+jOqqqKSSvbxMcOLzr7RWamSj9xJTP+q4LGG
 IQYEYYpxZgBOrKldP+21gi9i2x9dOFqwKwR0woYp7ZLQVzve1NpCD7lNBq8fN40xtTIA
 E4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
 b=pCbHFPInQHZaxXk2ucAld8arx8oNhFycr9tw7RNDxibihPiw9QFnJiHyt/y7CUNCID
 /vomrQ746oZKEhYQX6+5yll5kgv3duDJIHCPk0iW2bxbCCkQoFVnTaWvCW1BNCu+vmOR
 yPpmAThIkjnHQgs0ufLMKsajW36eaa/G7hvEs0frPXN56enSroKMBE7zGLgHXGaH+7aG
 G2rFclHsm1WS4QaX1qtaYQiq38t+IlaiCilTh73gD3cEVHZVUTIpSHolxSOxsteMQpXu
 VEKgysTLsf1kDW8Kp+hxpjVuxZlXQVu2y78z1rbot6t55lyc6CeTuTDHNjxL3Wr8MvLf
 6h+A==
X-Gm-Message-State: AOAM531WmAppYw2oNsz61Cy+G1XgARpKrdj310CaixRJ2dlPLQVBtTQX
 vL7X1ZOoCb+Cv8nxLEDXC2U=
X-Google-Smtp-Source: ABdhPJyHI041pR2Dq3wOBlJ9sXcyhHQY2T4xGD0ZA9ykU0mBZ/t1N0FApdXaJUACIB4uzTN5SoQb4w==
X-Received: by 2002:a5d:678b:0:b0:20a:db0b:7395 with SMTP id
 v11-20020a5d678b000000b0020adb0b7395mr21449321wru.668.1651239754784; 
 Fri, 29 Apr 2022 06:42:34 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c19d300b00393f081d49fsm7301227wmq.2.2022.04.29.06.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 06:42:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: switch DM to atomic fence helpers
Date: Fri, 29 Apr 2022 15:42:28 +0200
Message-Id: <20220429134230.24334-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429134230.24334-1-christian.koenig@amd.com>
References: <20220429134230.24334-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jude Shih <shenshih@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This gives us the standard atomic implicit and explicit fencing rules.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Cc: Jude Shih <shenshih@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ade82cfb1ac..c5b2417adcc6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -83,6 +83,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -7627,6 +7628,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		goto error_unpin;
 	}
 
+	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (unlikely(r != 0))
+		goto error_unpin;
+
 	amdgpu_bo_unreserve(rbo);
 
 	afb->address = amdgpu_bo_gpu_offset(rbo);
@@ -9160,7 +9165,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	struct dm_crtc_state *dm_old_crtc_state =
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
-	long r;
 	unsigned long flags;
 	struct amdgpu_bo *abo;
 	uint32_t target_vblank, last_flip_vblank;
@@ -9173,6 +9177,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
 		struct dc_stream_update stream_update;
 	} *bundle;
+	int r;
 
 	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
 
@@ -9181,6 +9186,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		goto cleanup;
 	}
 
+	r = drm_atomic_helper_wait_for_fences(dev, state, false);
+	if (unlikely(r))
+		DRM_ERROR("Waiting for fences timed out!");
+
 	/*
 	 * Disable the cursor first if we're disabling all the planes.
 	 * It'll remain on the screen after the planes are re-enabled
@@ -9235,18 +9244,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		}
 
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
-
-		/*
-		 * Wait for all fences on this FB. Do limited wait to avoid
-		 * deadlock during GPU reset when this fence will not signal
-		 * but we hold reservation lock for the BO.
-		 */
-		r = dma_resv_wait_timeout(abo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
-					  msecs_to_jiffies(5000));
-		if (unlikely(r <= 0))
-			DRM_ERROR("Waiting for fences timed out!");
-
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
 			afb->tiling_flags,
-- 
2.25.1

