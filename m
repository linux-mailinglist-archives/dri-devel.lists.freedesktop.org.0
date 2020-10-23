Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882ED2974E6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8D6F8E3;
	Fri, 23 Oct 2020 16:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53B96F8E3;
 Fri, 23 Oct 2020 16:50:09 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g12so892905pgm.8;
 Fri, 23 Oct 2020 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1uXztMV6CzErC+X0CDm8LCTZKP5rxlBSqn7eAJozNsI=;
 b=f0Nn5WiLyLBtBxH07Z9KBRTJuSLzWCs+jTGy/kU049U9jAp1fbqipW8NChPvmCBk5N
 lWnSy3bfxYTWE3jsWTRMmCoQ8/U5cTpVg2GCPNjrk25U2NI6dYzLpFx/lOJjBrxKHali
 f++Qdrl157RCb1AdmylhtXZBcvDOR2Xh2W5DR7iWMlQ6GJJMLl2+NJnFLxKTrQjvd0Y1
 schytKj7YWHlSE+cufg0h632swvX1BkmTsJ9RFNoplDrCnN0SUCT9qEeu5yFrlehHshh
 Cws4ljZt39NK7mYHS0sZ8Q0Ct4kmBFJguGCNSvnqcaf0uuDyc0cq+MJQAIYUhzt8u6bZ
 8S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1uXztMV6CzErC+X0CDm8LCTZKP5rxlBSqn7eAJozNsI=;
 b=qE96UknnARoVvuGmrHKNXFTxBx+91TDkAaMGv7ZQRUSBxKDXiVlhFeHz3OFIum3hW9
 1SYUKYQdGJpGPZcwJCMQ8kiOwnq/fIqp47LQXY8iNJVyQWrUVW533mWnmoteAiZW4PJv
 nXlkNmHApiChjUJqDegFdNQFhAI5/QaDQyc9n2h8SpLXWnqEEI7H/gdzpK94OQx04UfC
 l6FvQPUyPvSaZQjEcRpD7o6VIh8NNJhsL5LzJfKfH04cPVmDqCtbs4hNqQ9Pm2D+aD/E
 FZlYw0BRG/ZvdfswHYjteKvA4hqrf9SglSglLSHZGmDMepXuqdhDrp/vKlUnH3ga5UAG
 qyzQ==
X-Gm-Message-State: AOAM532mF5r+WeWSlvTucBAsu52GwJrUhF95xy2t8zslPJ0+CsEdLEcK
 d6FBsdO7aCDthh1V7cJMFq+cxcGGOetxgA==
X-Google-Smtp-Source: ABdhPJyfs5XJq4nPYCeSegrbmFk0k/QvCb6Z1uDuv3fx+Xwxb1dtd3NqyOCeA+6v6xG1aXlkHid0XQ==
X-Received: by 2002:a63:2547:: with SMTP id l68mr2716807pgl.241.1603471808809; 
 Fri, 23 Oct 2020 09:50:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c187sm2922270pfc.153.2020.10.23.09.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/23] drm/msm: Fix a couple incorrect usages of
 get_vaddr_active()
Date: Fri, 23 Oct 2020 09:51:02 -0700
Message-Id: <20201023165136.561680-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 freedreno@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The microcode bo's should never be madvise(WONTNEED), so these should
not be using msm_gem_get_vaddr_active().

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c941c8138f25..2180650a03bc 100644
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
index 8915882e4444..16eaaf0804ca 100644
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
