Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C3CB5CFB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70E10E7FA;
	Thu, 11 Dec 2025 12:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d4OCJY3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AEA10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so103395e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455866; x=1766060666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EuAg/9QTvoHOUeEar95nqMyKM7mcolsdA7zaojYL4I=;
 b=d4OCJY3Tpe4FicgY2D1mQzZz8pGC+mC9KB6CbiSZ7MetgIAUQjjHOhV/xE1RjPwvSz
 Wd3qsXCTHaaGWeGN6w5uQ4YX5RkVQoYUexmbmXC6NwdpqfMDP5MyfVKfB78R+aXYl2hx
 +VRHQ37on4vqjD5gSQHEEd3pC1ReZf7KqdKOvccCA1xpOdIbTOV85IMn/9hxxc8iXcMx
 D++5usYj63+W33LtjlY4ynATFciCA/FXJwZcoI96HkaulAbtqiVXMq9vuvbpFRylOj8W
 e++lZ9mdr5F7DAS5bF1LX6yOTbfSE77JKIPtFLukurP5QrCDh0BNIpv3ZuQcOM5zEg5R
 6W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455866; x=1766060666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8EuAg/9QTvoHOUeEar95nqMyKM7mcolsdA7zaojYL4I=;
 b=KCi1zlM4HLeqdtLePZIO5PUuP8k3vO+HPgQDP0erpDYrlylJAOUpQQxKuUDKC0Wbt8
 nwTtXCA8YcVXOw2rNMeAWf14EfQVR1GNCY5yD14o0M6m2xhf7fwo8Xa5u0HSyCPsFRB1
 59fWp4yzppGjBaRutrk3oDRkF2rhucwQ9Om0XGJ/j6Gz5W5Yldqz4MJJomhRgCAGlE84
 gOB7aBJnslG2Rl+tqRrK4iRN8qa8tA6Ly9CuXVx6/TX/JprfGoCkx2TrSRa3DxG3bwbO
 Z7sjVqKS6QUXgSKMqESD9RRCxSMgslIJMBWuEEODqEGF0mXa3v3mcv/BgZRsbP+wwDa4
 qw4g==
X-Gm-Message-State: AOJu0YysdD3R50Tj9MDN3KTRM1Fsa4R+1C+ygTvg1nJggCBQHFmtQMPH
 bVJDdApdo9n+bywX7xv0+XQXLtGpD4mK/4LTp/rVhJlbgxdUeYtEGJd7
X-Gm-Gg: AY/fxX7HRo2ibPolf00debJhc4MDTgZ6Ud2xjDFaHS1wOyic+qa6hEmnPLv5TnTJhU5
 VOax3iFADQoJb4IA4R5GrPj9tg0IMfw0wcviBn4A1qVK5xa2PjQixCxSY1pHiRWWB/GwZxEmhas
 p4vlzRkr3vannYM5g4vs0+7CBuX+0n6Ab91Ileqb4LcfcPH4bQgNzqQl2382scXurJHf/aFchiq
 rVL8ZAF6aPRsWzbDrfE3q75UrepKmSktZZNDTvFhyXlzkI+4DcT15Sv4jBEcG0275C9/RlkRqJ7
 /yIoHG42xzrtxQBMbtLACwNGtxwCAG/FGRbeXQhLcSsR3hH2Jma3BkRYuGruUW3abIuc0EPAiSJ
 Chh/QK7KfDAWrumu0MWtRD5YyhCgglJjz+50YQj9vH0ubjbe6YwXUY+TcOeOA67ZIXn2K+vhj4b
 EHCtDd0kTnHtZBL/qEYAC8sSkI
X-Google-Smtp-Source: AGHT+IFVaKTlm6xg3Jw/ZlZAoCPwWKIJ0C6rGXg02SL6rCNSKEFY1d4MYoxRqE0I/5CkMfvv/lIlqg==
X-Received: by 2002:a05:600c:c3c1:20b0:477:75b4:d2d1 with SMTP id
 5b1f17b1804b1-47a89ed5c41mr15862835e9.15.1765455866064; 
 Thu, 11 Dec 2025 04:24:26 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/19] drm/xe: Finish disconnect HW fences from module
Date: Thu, 11 Dec 2025 13:16:50 +0100
Message-ID: <20251211122407.1709-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Be safe when dereferencing fence->xe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index d0508b855410..1bf4d234a315 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -157,9 +157,7 @@ static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
 {
-	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-
-	return dev_name(fence->xe->drm.dev);
+	return "xe";
 }
 
 static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
@@ -173,10 +171,13 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_device *xe = fence->xe;
-	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	u32 seqno;
+
+	if (dma_fence->error)
+		return true;
 
-	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
+	seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	return !__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
-- 
2.43.0

