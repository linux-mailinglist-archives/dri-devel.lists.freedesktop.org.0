Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6C292FA9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60C6EA85;
	Mon, 19 Oct 2020 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C606EA7D;
 Mon, 19 Oct 2020 20:45:28 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w21so674054pfc.7;
 Mon, 19 Oct 2020 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=epLimpxjmfg48A6fvNBDGIJDBN6SDQ0BNDdD7VaQX6I=;
 b=SEExezQXrfvDTHgWSccdcp/gvDOfomSvUx/EhmMYXS0IDlZooJhzWpqEis4XXOLtbI
 9z7PBHzJI2tIapiVEJh0y75p5MD/7qVLgz/3evgEF9BzYaZznACfuijXTZ9amq3yqp4d
 UXi6O7HupM3BSyoH42XKCyvoPZUpWHuyis51qegcOwIjvWXRYJ8MfK8oeDNQSa9clwHC
 LXwq+PqiniCiFGFpkOis2gHCJBDxt/goRNqpPWlFkPoRVpvS2iRnp6P+x07W13ghgJpI
 dI7Y5OBExERVce0bWgQYQyKCxNk1CbH9IpmNhtwZsYnbjT6OnwuvBo/sfJ2mOJq6pOq0
 XNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epLimpxjmfg48A6fvNBDGIJDBN6SDQ0BNDdD7VaQX6I=;
 b=E0mxlI0JiN3zuSOGCfW8y+5udyJzKMUERcVkvhpvPdcmj9trBUB6vFtu24nUD6PFeg
 AEWOFYE6cY8SnsDrdKvVUP+aziWMUrNUtvLHdZX3NpsviZHYdv9zB/+PMx59cLCZ+GNS
 kwRhY4Ip6oWmX9WB6PvUvnbqgQI6dQmQlH+Eb8LRFqB7Zh9o26wVlmLJL4MGfP4jBJSx
 Y2t6nbwj0SnfjCU1XCsODWfndmEE5TuUp3/5LEZsa1upipI7aF5ZrjCeZvz5UFko76Bi
 rQqSD3mr+v4Ehn7V62GGf+UQi8OvJeDDxRBkJElxZBTAERooN4wEXoc2jSRnelV7qyu6
 zyhQ==
X-Gm-Message-State: AOAM530MUCbkV950Jli6RLlIglEyA1R5mZtRHhFryusxGNKutC9RiVl/
 dLSdUXEzYXKwFKqUh2cRJba7FLAmgKD5zw==
X-Google-Smtp-Source: ABdhPJzysRtYdn1XV3CyDHBkM3cPbjAkrpWwlxIPIFOXO8xM5YwGuzDxw5OO3Dxg//q+GIixmaFcOw==
X-Received: by 2002:a63:7009:: with SMTP id l9mr1231146pgc.199.1603140327785; 
 Mon, 19 Oct 2020 13:45:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 mn11sm327738pjb.19.2020.10.19.13.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/23] drm/msm: Fix a couple incorrect usages of
 get_vaddr_active()
Date: Mon, 19 Oct 2020 13:46:02 -0700
Message-Id: <20201019204636.139997-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The microcode bo's should never be madvise(WONTNEED), so these should
not be using msm_gem_get_vaddr_active().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d6804a802355..b2593c6bd2ac 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -426,7 +426,7 @@ static int a5xx_preempt_start(struct msm_gpu *gpu)
 static void a5xx_ucode_check_version(struct a5xx_gpu *a5xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 948f3656c20c..0894703a742e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -522,7 +522,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
