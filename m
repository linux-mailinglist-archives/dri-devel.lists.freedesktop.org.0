Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36374282CFC
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558D689EB8;
	Sun,  4 Oct 2020 19:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B00389EB8;
 Sun,  4 Oct 2020 19:21:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id g29so4350797pgl.2;
 Sun, 04 Oct 2020 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9ulxuqWUZZz8R2MHYok6DyKN2+X334CNFkrGm6LYVI=;
 b=uLU9fyPvbRl9/8aUxLuqomkqwnTttBQwRSHrQq9XasnJuEs10Huja4LSZtcH1yMb/G
 4SCBsMXPAeSog/DP02UyVz1f2JEeFa+bzRZujV7Gw+aYbYjwLYCbHmJeVsi9BJQ4hc1j
 +UC/PFgLdbUtzQGlW/r3AeVEUhWEBoJQRvYg3MvLJMvk8tmFtE+ZQf/iE6iK66NKrgdP
 D7Nw33DTgyIqHMbDT2eMlkevMgmP576tUBhGwsxnIvnVPR+URrTS2kgU7wCuyUHkXVG1
 UJdRCT/Oty72nEXs+Yd4OkHezq6YCObROTJemsINUra8qVVf8m3YHgoHQrZMkuN8+OyT
 Z3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9ulxuqWUZZz8R2MHYok6DyKN2+X334CNFkrGm6LYVI=;
 b=ThiQJw08zt6ew+n5Zc/Qm0uoZUqTVcHFos0i0Pvwn+8fRd+bQULDwJ2azEF2HWMrgt
 dyg28YEAXxcYE+29CFwsH84s1ZNNgUBeqOj7mmMkfC4jfjwez3Elj//Yzrn+uc0W7X/8
 puH0VyuNVM6+iyI9IsZbW43V1oOZB2gQbx/nrMAXmKG86MBbmO2XUUDqw5w/1vsFQdnl
 Tyj5qOSlEhPqavu5PhbeIDM2/ihB3ozZJyU8qKyzd1/RShzBKx2E/4wc8QspxVAysUzH
 oMY0NR+j4jF1u7FDpM7fIKP4GzKbgx6hf9kGAUOxJbdtx5Kw5fvv5RS0XUxIgRgfApVf
 kiJA==
X-Gm-Message-State: AOAM531xfe+bMVsFoxEWssBa6OfnEapmOfP7iAL2Em6EnqZbrNg/xF6L
 gDep+TYzOEPiqyhMBAfzq98jDRHIXAQ7bZTz
X-Google-Smtp-Source: ABdhPJzq16bA7i9inS3FVtzQZxgFb9yXiw3Uah4xYQ4dyDsIVKTAdVJywzFmSahO8lI4RuBXRCZMaA==
X-Received: by 2002:a63:4416:: with SMTP id r22mr11414886pga.248.1601839272238; 
 Sun, 04 Oct 2020 12:21:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q66sm5106105pfc.109.2020.10.04.12.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/14] drm/msm: Move update_fences()
Date: Sun,  4 Oct 2020 12:21:35 -0700
Message-Id: <20201004192152.3298573-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
---
 drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 31fce3ac0cdc..ca8c95b32c8b 100644
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
@@ -411,20 +425,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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
