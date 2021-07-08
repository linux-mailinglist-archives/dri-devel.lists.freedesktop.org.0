Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F33C187A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17206E981;
	Thu,  8 Jul 2021 17:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E04A6E97C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so4545446wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=OXWAMqyAm3FBqCmhazvtViPAczIYbDg3o3MhmkkOYXWZo3KasFE7n0nAJn3tBoiheQ
 Uz11jDhuINyDdsI4jhUSXimf8CsgIs+yJX8P1fVDe1tZR1ck2fHGWEufuZbQ6Hyvcg3Y
 SBMM8LmNDEAE4LoiP5rbz1j7aL4QlTe7Ad8Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=ZjU+4K6UDav6aZG5Kr0MvLyQY1p8ZORVNDEXYbUM4sltT/1mDcjuOOtwziKYHZ4Xi3
 1Rk2SUrsDnm8q1VA1anUDEnaXrCxphsmZgF036HQqGpXQZ/9r6rymBAsg1Y+jj5X8No8
 ebo7zsb9twvZdjBVdoICwwC9JaT9VS+bAUklyWSTzVowj2RFtsFVbWibsCfd96IAeKnU
 9Pr7ey4yI9m71bzvJ8RTSBrSwkxcvP2z73BRKwo87uU4DEp58e2YTrTjGYXuo7zLWJsQ
 psbX8rC16e4mQNtoxhBSYz00Fw5GHjPZ3tn2Y5Gbm3HLG0yssRmM96el/2bxBG0L1x7A
 E1sQ==
X-Gm-Message-State: AOAM531SAiXEnNNmGqPE+y7cSj6mo/UF9VKRoZ3V9Dj7L/xKeQh8RtvE
 WBoegliiH4+seTtHUtDDegEG0HH3BNw0ug==
X-Google-Smtp-Source: ABdhPJw1jshJuGMwGuQ/le1CCh7zRdTpRm7R19534t5pFRk1PSYScUvtSH1ZQ65X5JqJpvpszXLP4A==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr6565057wma.37.1625765904147;
 Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 16/20] drm/msm: always wait for the exclusive fence
Date: Thu,  8 Jul 2021 19:37:50 +0200
Message-Id: <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
[danvet: Not that hard to compile-test on arm ...]
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 141178754231..d9c4f1deeafb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.32.0

