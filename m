Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FE44B267
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1D89C19;
	Tue,  9 Nov 2021 18:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4BD89C13;
 Tue,  9 Nov 2021 18:06:36 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u17so22352337plg.9;
 Tue, 09 Nov 2021 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2vAlt5rN35ztfy1GKsWbKvq1o/mJup/GEQEbn+KSs8=;
 b=Z7NiriiJtxL6OAOcHWMzYlsg6ccjM9isdi1B0lqCNONiLRX/a681HbSouit/gx/tm0
 04DMPdKumaY1s9l5otGEPnzR0v81tbLcD4bOPelipTmOC4mje4gz32HDVgygupp7NIvO
 Qj7GEoL4wLxB5hOuKzUmLBLSMxPq5LE0HfCJjKbxpxaogGl5Q4M4G1GPDAR5xqs+Troe
 mdAMM8PLXJ5ZiMBIuU/vMnx/s279FKkvQwTgd9Yo2KpOOsBT369k9L+6LL9iSrnJi9dH
 HNk8/RLzdVHgoLFM2zPtNHYBsO4qnQfJzC2LRvh5/35YbvyaTQsokelNxIkOxDiNSukl
 XN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2vAlt5rN35ztfy1GKsWbKvq1o/mJup/GEQEbn+KSs8=;
 b=KDDJkeVvcEiTj8Zl9NtkdxRlX7s7wy5tmFsHjRZOacpOZJ3jbxG1UTeuoVI5UKIl49
 fwGDbE2X9YbC7AMiKsWQUVRff0UvAlGQieVh/ikaB3+89wE3Z5HbSBV5d2BqaP5960xJ
 bkYSLTlBFK6GaWI9j5+pptz8USlK6CbRtbmpRvsawlodlsLNBr0y+jE2vZsQjtKjXPME
 7b0g8AusruoFn53TPuKn612YO333M53HXOWE+Yh6uCQ04r59rpUo01/VlleGAoUAS2rL
 GmEUIedfQi7t8WnWCcsCIZNtD8O3DjGsFZfvbTm5sEKV253PmpoooXNggQ/Sa/mmYAFH
 qWNw==
X-Gm-Message-State: AOAM533D35RNrN4I7/ABFFjVu6ERRVWzYBVuGPlWGJL6oBEes/U07Xly
 nqjinc8hK6gae3F3YF69IjdukYRqR5k=
X-Google-Smtp-Source: ABdhPJyBJVmTbwKQWggklUt7KzsNFsAE+MWAMDzF6FHyn565YU+tZ8/YJRNq6KVWCyqY3zNPvH8HOQ==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr9523417pjb.237.1636481194352; 
 Tue, 09 Nov 2021 10:06:34 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t16sm3248991pja.10.2021.11.09.10.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm: Handle fence rollover
Date: Tue,  9 Nov 2021 10:11:04 -0800
Message-Id: <20211109181117.591148-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add some helpers for fence comparision, which handle rollover properly,
and stop open coding fence seqno comparisions.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.h | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.c   |  6 +++---
 drivers/gpu/drm/msm/msm_gpu.h   |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 4783db528bcc..17ee3822b423 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -60,4 +60,16 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
 
+static inline bool
+fence_before(uint32_t a, uint32_t b)
+{
+   return (int32_t)(a - b) < 0;
+}
+
+static inline bool
+fence_after(uint32_t a, uint32_t b)
+{
+   return (int32_t)(a - b) > 0;
+}
+
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 13de1241d595..0f78c2615272 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -172,7 +172,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
+		if (fence_after(submit->seqno, fence))
 			break;
 
 		msm_update_fence(submit->ring->fctx,
@@ -509,7 +509,7 @@ static void hangcheck_handler(struct timer_list *t)
 	if (fence != ring->hangcheck_fence) {
 		/* some progress has been made.. ya! */
 		ring->hangcheck_fence = fence;
-	} else if (fence < ring->seqno) {
+	} else if (fence_before(fence, ring->seqno)) {
 		/* no progress and not done.. hung! */
 		ring->hangcheck_fence = fence;
 		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
@@ -523,7 +523,7 @@ static void hangcheck_handler(struct timer_list *t)
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
-	if (ring->seqno > ring->hangcheck_fence)
+	if (fence_after(ring->seqno, ring->hangcheck_fence))
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0dcc31c27ac3..bd4e0024033e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -258,7 +258,7 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		if (ring->seqno > ring->memptrs->fence)
+		if (fence_after(ring->seqno, ring->memptrs->fence))
 			return true;
 	}
 
-- 
2.31.1

