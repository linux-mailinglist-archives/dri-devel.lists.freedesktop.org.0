Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221294F9EFB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 23:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DB110E8B7;
	Fri,  8 Apr 2022 21:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A02010E8B7;
 Fri,  8 Apr 2022 21:12:40 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 32so6672304pgl.4;
 Fri, 08 Apr 2022 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nk1qUFXg3SiseuNYjEIl+VPm4EeXFht7d29XrU4KaA4=;
 b=hHTYVCbzDxg/E6f2Y5m+SrW5q0WvHz2DjhOqkt9ageKVHSkzhR36bFmCGsjUHf6l46
 g8lbXxqsW6ogDLPjvXs161Wnur99anKCZOV1yg7BjtKY2pHGJmAFmkqlWrmEehmNOf2U
 1GgiQCxoOJRaOLN/FYVn9voavYu9gGLQehaSe0lg4eINObxUDrkjRN809DqSqJ0nEqPm
 m6fVJvimqwyI7aafsQeLPxLUjmY7gTpQZXsNkynW1z1enXVR/h4clXHFNFegenDJasV6
 DNSMQ7Sw84CLuUxbYRwTcWB6mYCTELyC6JVhbsRRb4I7g/wsr5q+a9BmKzco85tUIg+M
 vK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nk1qUFXg3SiseuNYjEIl+VPm4EeXFht7d29XrU4KaA4=;
 b=mAwgvghlUXb2x3nGG+4z5Bn2z2tWZFjkzszTcNxQM02n2SnRdx6t7NARfARqdDzCL/
 fVQRTtbpQQb1QyaTGmacCNZcPjTIwB2yEWumjvCV3MYRK3aU2T43F3vS9iOQtxX6Uaxc
 xLkX+oJP9jk/BOBrsy6N3gGIWAQ4TQ+9QUlG6FgRGOB3SuOXb7UeCADEjV1sXNbH5D+D
 kEhU5NGe0+XPDbQXRzy8QqbE/VCz9MdITOcpYkpKu8gufCrQdfj9uAvJYF+a8ebYV6f3
 u8Mj0Bap+hM89tia1PBJCKZworpWavvw80UPccQfRqFhz8zG3hUrcYKmD7sSVNlquT26
 j93Q==
X-Gm-Message-State: AOAM533Hk8+dL6MF3l5Y8AZeDrbSUDb1vBLZlIE3TOtIS+rMpK2U3ii2
 7kzPldE7lKg0TZDORu0uZ9N+wTdtO+4=
X-Google-Smtp-Source: ABdhPJwttnVHc5lT1HgmINnh+1IbLwkQVQL2uri4evMfw1Up+524IZGFS0MQjKMwPf5h0DYx5sW0hQ==
X-Received: by 2002:a63:e24b:0:b0:399:1d7e:1503 with SMTP id
 y11-20020a63e24b000000b003991d7e1503mr16974463pgj.335.1649452359613; 
 Fri, 08 Apr 2022 14:12:39 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:c6d0:c747:3e11:b8e3])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a17090ae38700b001ca8947e73csm12277207pjz.0.2022.04.08.14.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:12:38 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Date: Fri,  8 Apr 2022 14:12:30 -0700
Message-Id: <20220408211230.601475-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In practice, trace_dma_fence_init is good enough and almost no driver
calls trace_dma_fence_emit.  But this is still more correct in theory.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index faf0c242874e..a82193f41ea2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -15,6 +15,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <trace/events/dma_fence.h>
 
 /*
  * Power Management:
@@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	gpu->active_submits++;
 	mutex_unlock(&gpu->active_lock);
 
+	trace_dma_fence_emit(submit->hw_fence);
 	gpu->funcs->submit(gpu, submit);
 	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
-- 
2.35.1.1178.g4f1659d476-goog

