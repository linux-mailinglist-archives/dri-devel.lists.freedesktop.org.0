Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1B6F6AEC
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE2210E37E;
	Thu,  4 May 2023 12:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C9110E35B;
 Wed,  3 May 2023 23:15:15 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-52c6f8ba7e3so990132a12.3; 
 Wed, 03 May 2023 16:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683155715; x=1685747715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eff3ZaiYOUbIPy6KT7ZXvjLKnlTgyEyzsJx1SVSksmo=;
 b=URfNAUXQ+uGcPXlwmoz+lgu/mejGDqQdSmLr4vOGOd9MUFAFImQ1XdLRrvyfmXAwlY
 ezzKzwIbJIgowUJrGmxk8iB8BT2zPd3Aqg8lgfcXT/yhyeEV1Ld2rLl+AHfEfRA1V7X7
 QW+xlLNxZfFhBKTruqHuN9//t4lXsgoGfH74SuXApsZcHyBRnSgQ+spOYwhEoeVNhGcm
 empWPqhM5JgzxPwtKOF5EE/LWCC/zdaacn2pASlL0kVp/YipRIQaW2gQNcKDVbTNy9sV
 sOyvj4GQ2ymYPaCIk+nOPE1g/sks/TCxguQer1llfIsDoqPTeyssa26Y6iOGbvf6Ltz0
 ZKMQ==
X-Gm-Message-State: AC+VfDx+cM0lNnWpszOMO30NOV4Sn1W852PkvXJuuv7BHvRml10K4YeZ
 PklC987poa8Vi4POsZf2s+A=
X-Google-Smtp-Source: ACHHUZ58hTtUY+QQn8NPCJbbQAlRhY+rpBOQNZydZYWYHqcJ68pLXlzqj57cIjvp0rpz7qeKe2oKbQ==
X-Received: by 2002:a05:6a21:2d09:b0:cc:5f27:d003 with SMTP id
 tw9-20020a056a212d0900b000cc5f27d003mr149179pzb.56.1683155714954; 
 Wed, 03 May 2023 16:15:14 -0700 (PDT)
Received: from dev-linux.lan (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a62a215000000b0063f33e216dasm20555097pff.96.2023.05.03.16.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 16:15:14 -0700 (PDT)
From: Sukrut Bellary <sukrut.bellary@linux.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com
Subject: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in failure
 path
Date: Wed,  3 May 2023 16:15:07 -0700
Message-Id: <20230503231507.279172-1-sukrut.bellary@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:11:44 +0000
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
Cc: linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, Jiadong.Zhu@amd.com, sumit.semwal@linaro.org,
 Sukrut Bellary <sukrut.bellary@linux.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch warning -
1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 8bd07ff59671..66d5c5d68454 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v10_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index bce6919d666a..d5715d8a4128 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v9_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
-- 
2.34.1

