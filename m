Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7324FE9E6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEBC10E7E8;
	Tue, 12 Apr 2022 21:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5E510E7E7;
 Tue, 12 Apr 2022 21:26:16 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso2628115pjj.1; 
 Tue, 12 Apr 2022 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqPjwNSGzY9+HzHZDgw3eVUdEY3fO13OJf0xVug0ueo=;
 b=Rx8iu67QAQwZex6fWL1sgh8cglXQ0Z3CWcYve31a4UC5d8j2CV7Vw2Ehyn7Jl5D/dy
 KRLOS9ND5rXOD6H9AKNJP8qIbbx4HicQAJh2mV4/MW/DUyyYnZ0IRnaYZjsE4+n01Dtx
 7TvlEsBNYYjr9c2l6zl2ZhXQ+hoWGpWsz1HvM/Ie71Fzu7AvydchWb1482ARULazfIDD
 83mA7Z4abQjO0XQukQQFXvbIJ/WAX4QMxJtTPwRMqpMfxZzD+VvidqqBTw5krHUpsJHc
 jSQ24icK4yMtWbRzlJDnw0ZBKh0TFJMWjtm5yl8UuBCC80ftU/EbNnxI8V9wS0HQYeK/
 5vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqPjwNSGzY9+HzHZDgw3eVUdEY3fO13OJf0xVug0ueo=;
 b=414MSVhylpgJrQxqlZQZQ6Yqxbi4UN6g83+oJXmJHSUdBgaOFHZd6Ae15pi8ZHsGUd
 cZZu7ksuttFeEpjklUgKwaB/ck16lHLF8FuV/DavX42BtPRzVc4QrcC8KQhh1TbCpUo4
 eLxlYBotXiLwBQ5tIootY6bAc8Vrc/KwMjpBuAykBbD2MUAsf6K9L15EF0s/QwzoGzDa
 YwzOIHYf9NNao1fauGlbLPujYsPPczey1MqZYJfkfdNLPWyZwhjLZ5PbwDCgIT8Q2u0y
 /hjFktjWY4d1tqvpyQHtBeS9ufBn/asJF3p97badd1SpS2/i3lR96wAnUkqW3WlIGbx/
 pwxA==
X-Gm-Message-State: AOAM533NqUJ2ObBbVj2yhfXnSvf45CujNqeR4ku9yUN+pukU3fStyT1W
 nrH60c6B843INh3JfVZhjh7Lor5X5NI=
X-Google-Smtp-Source: ABdhPJxUi7dNDCCedyqkYea6nCWY5Rkxx0r9qRfxILcmYFc0nHZ83e8fDCSJYzQ0dALjg8dz9y2zAQ==
X-Received: by 2002:a17:902:7fc5:b0:158:1de9:4646 with SMTP id
 t5-20020a1709027fc500b001581de94646mr23027600plb.91.1649798775636; 
 Tue, 12 Apr 2022 14:26:15 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:1661:f107:58eb:51b7])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6300cd000000b0039940fd184dsm3784363pga.9.2022.04.12.14.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 14:26:15 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Date: Tue, 12 Apr 2022 14:25:58 -0700
Message-Id: <20220412212558.827289-1-olvaffe@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In practice, trace_dma_fence_init called from dma_fence_init is good
enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
and virtio both have cases where trace_dma_fence_init and
trace_dma_fence_emit can be apart.  It is easier for visualization tools
to always use the more correct trace_dma_fence_emit when visualizing
fence timelines.

v2: improve commit message (Dmitry)

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

