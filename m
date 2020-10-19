Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A88292FD0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAF56EA9F;
	Mon, 19 Oct 2020 20:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195596EAB0;
 Mon, 19 Oct 2020 20:45:57 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id o9so409496plx.10;
 Mon, 19 Oct 2020 13:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvZYFhP3VqPsfoYbfdMUsTMvP/ufY5s7G5S6HW9OQ+A=;
 b=gCoamua6+Y/FNX0HBUgPdlBCFfSl5fHsyZQW6PFZqdfRp4eixW5Dc52Gc4Ymp7vaUB
 xV0ShIROogslBIMuat2v0hbWitoh1v/jzylJaPDTq7DYHMJqDWysd1g8P57dT6hIeVgt
 zioo870zgFiryNm6ZeDk9F3XHcyO4Mt3g/+pdDMXzwLrFOoRZuLQhODf+8I3q7p8jDma
 YSZGezYABEssxfV1ose1kt0H10ZzmYzAkugtsw/8n9NWOJQqIJlMBJhvNy4yXoMcShrS
 /4YqN8LlSrV4+NsIS5fr7QgLF9D6xzM781HPdZdC/uc23pjOTSP6Il2PNAFagojGuFFi
 skLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvZYFhP3VqPsfoYbfdMUsTMvP/ufY5s7G5S6HW9OQ+A=;
 b=eRpSY3SrUa4ahSHPwRXZQIHjlSxRXVElrvXViTunsaGnsGmtVJx28hPvuLmWfHh413
 VAUherPxol556AJnk4kW7ERd4HtOYirQ5SRs7nk/NdeAHjZOGbJl9Uzu7CRZYyXMCnf7
 OCXOzE0L75ysxaeANA9wkb85ya0vXUtAnp6fZsqTgiKCleUEYf8gQ/FD5/Cl9poV1hEh
 y6r+b8cykwnuy043SVM4COyhlaJZB+mNMoLr30O3qsUbMx7wSqTYP8is/jdXRN4PpSrs
 CK8CUG85hN1c0u28cnQmZKkj3CixtESGOEFpJXPNdOBzM9Xeb1NcFyoFbs/XIKw2fXny
 UYiQ==
X-Gm-Message-State: AOAM530Rs49nEdlpD+UyrOGJrZzbL0uLvMk4owE3jNhWZL7glAB0vUkh
 cv4Oy8CneUDb/+1knRViC+1cTxtWuYg28Q==
X-Google-Smtp-Source: ABdhPJx4uP7FkLFS7jSBBS2QDkYGnePLAdS4husaJzLRznxFtjXZrwD3iT4uiSG03gb95j5KJcVuug==
X-Received: by 2002:a17:902:8d8a:b029:d5:ef48:90de with SMTP id
 v10-20020a1709028d8ab02900d5ef4890demr971523plo.12.1603140356077; 
 Mon, 19 Oct 2020 13:45:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r6sm661328pfg.85.2020.10.19.13.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/23] drm/msm: Move update_fences()
Date: Mon, 19 Oct 2020 13:46:13 -0700
Message-Id: <20201019204636.139997-13-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Small cleanup, update_fences() is used in the hangcheck path, but also
in the normal retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
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
