Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07F2974FF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718D6F8F9;
	Fri, 23 Oct 2020 16:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496DF6F8F9;
 Fri, 23 Oct 2020 16:50:39 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f38so1702166pgm.2;
 Fri, 23 Oct 2020 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26I0GFWyZ7wPcxO9wRYJvvFDOJC5QoDxFvw7rsNkagw=;
 b=bAvYCHQLAXBH4Li2fjviZnFfuyh5QV7rOWjlt+FKOk182BLH0t59Zr2k+Tg1oxuGI3
 nPdPUyo3a/KquQZMNgQIAXNqoQfkObx9Po1EG7mJmmcQnUpW8pb2P1Gzg9HeLCxAaTQI
 SlMDG33ybbg7PXlFOGEy8uagRfvLI0G6hOEnlhfTmxm19QCeoX7fpNFcZxYL7BPCnzxN
 HTH7sSP1RjJt1TLUzyJJW/ELFdjmebIachviQcOQMhkF8SfSLT/pFlpU0YlmLRfyb4Yc
 ovyJK8CMvV3qAvKdpAWXr3p8oy/bV/1mwE/IFZEuWu3JkzFI2rJyle9ijYLre8OqPNoP
 1dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=26I0GFWyZ7wPcxO9wRYJvvFDOJC5QoDxFvw7rsNkagw=;
 b=FXXVKw58SGh5H9IhwxKDmL9CP93hsWJ2u1dolwl4u85qWByD0/oLOE5dZz9HtSFgiS
 25VN/ez/9K3aggifJmFDjBVAi+K5F3WJTOvyqj/kJM1XwpFiH9AAV8nLKxxzrXnCq4X9
 +RNLroLusUwO+0tOjrfHHe9NxzKf4N4B2oxZWIOo7yOGhykYtoLtGHtkZ3Tp+GjUhXLm
 OC09wsWLK7l2aR5Aq1W7JomIKGw1wfkkS2Hy5rUcP0TnfqDmL02rxHsgJ2VcwJ/b/FCX
 u/jlvnrOIIEN60NbFRHsoJnqF1m/wZiYda1zEV2K5c/tfuxqumDbj2gw/BfbbjbwRsmz
 5b9w==
X-Gm-Message-State: AOAM533xkgvB5CmOcjycFe1oSmHfUeAfkzmbQSJhxf+4+AgVRLC4AUra
 /TrGlnVw/caOSrCigiBhGU9HSD8oL4vOFA==
X-Google-Smtp-Source: ABdhPJyUsaNtPjHATTB+2ZOVY+Nao/Y0EnlKYPkwKZu8lpK+OLGXDTE4cf1Q60otcuaivQXBSoyZ0g==
X-Received: by 2002:a63:4765:: with SMTP id w37mr2721657pgk.332.1603471838125; 
 Fri, 23 Oct 2020 09:50:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 v199sm2671446pfc.149.2020.10.23.09.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/23] drm/msm: Move update_fences()
Date: Fri, 23 Oct 2020 09:51:13 -0700
Message-Id: <20201023165136.561680-13-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Small cleanup, update_fences() is used in the hangcheck path, but also
in the normal retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ed6645aa0ae5..1667d8066897 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -265,6 +265,20 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		uint32_t fence)
+{
+	struct msm_gem_submit *submit;
+
+	list_for_each_entry(submit, &ring->submits, node) {
+		if (submit->seqno > fence)
+			break;
+
+		msm_update_fence(submit->ring->fctx,
+			submit->fence->seqno);
+	}
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -413,20 +427,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
  * Hangcheck detection for locked gpu:
  */
 
-static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
-		uint32_t fence)
-{
-	struct msm_gem_submit *submit;
-
-	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
-			break;
-
-		msm_update_fence(submit->ring->fctx,
-			submit->fence->seqno);
-	}
-}
-
 static struct msm_gem_submit *
 find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
