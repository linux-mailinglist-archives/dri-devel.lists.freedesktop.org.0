Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B5217981
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FAB6E519;
	Tue,  7 Jul 2020 20:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779136E50B;
 Tue,  7 Jul 2020 20:36:52 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so177526pjb.2;
 Tue, 07 Jul 2020 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hZeUOpJQcEzlGIlg9oeO7yAlZJGbtEx7VcHRTHdaPHU=;
 b=gWh2/ziM4dgkXVl4R62ETmGK47WH9z9pI1OxYS/fPuNTPSw729Q8CqUHHwRh2Q1Jc7
 kAKXrPrjsrtGGQveWol+5BdvwVMO/08Ryzh1jzWuVpE8XuvkmbHblPXJkYRowrUSr4Nr
 T5q6y8KbmCQXldRgh9W5k4FwxiRQZvimCzAUIRDKdfkJF8ihgrci9e/gThaxPdS+gd1S
 P7ANwWYgsBOpZ7yCeJrEPV5j54iw15NEe5AA+t6H98xXV6fuH7kpHUiVRbXkZSvZVVwH
 qsOfNzq9q9pIsuwz96/Y6BZuk/yVoEa2jxjzcpMwd8hf+Fx5a7mF2/Cum24To9d5I6Ve
 q5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZeUOpJQcEzlGIlg9oeO7yAlZJGbtEx7VcHRTHdaPHU=;
 b=MyXPg55x3d7l+eevDxloGko/uJ6ldOQShuzV8jcR6FHOAdWHjebNgFsbGX5UW4V5v2
 QVjw+FNnFAkciCMuTF6SOp8Cw8RXSD+Gc30GB184CRlFSr35JEHQ19ecrSahp1XN3+Hp
 g4xvfkzTZ2/VLN6ibEgkyjXxjVmtUX5QjWneBxPNVczkAgP4ZJEa7HQhiYo95wMRjegC
 kCLtsHhqEN2gbVRdPGgnwq9+avTXOG6H1pgQ7DWXybvNyFSfgfAHKKEzLQug4iJxyqGa
 v91TmIWQMj7bHkkvhoSlDLb8tujjX9ekYYx9BTrQHRcxMBgLg3knmGKDsnBspSuBJoA/
 qHxQ==
X-Gm-Message-State: AOAM532xdxhbC/712mbeKutpXO7Vb+zmIYe8aiyBNGUybwTQ4Jh00ljf
 11n5A8fVfSwwNk1On6q7AeVsd43fsEE=
X-Google-Smtp-Source: ABdhPJzLLECROxtVUUBHzDccmAZZ9FM/J/JHF97igPeg9tNrbfzr45IRJdns8aTkdIz+FrDboJGQ+w==
X-Received: by 2002:a17:90a:148:: with SMTP id
 z8mr6497903pje.197.1594154211785; 
 Tue, 07 Jul 2020 13:36:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u13sm3069925pjy.40.2020.07.07.13.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:36:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/adreno: un-open-code some packets
Date: Tue,  7 Jul 2020 13:35:00 -0700
Message-Id: <20200707203529.2098979-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707203529.2098979-1-robdclark@gmail.com>
References: <20200707203529.2098979-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d95970a73fb4..7f4526b3283d 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -186,7 +186,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	 * timestamp is written to the memory and then triggers the interrupt
 	 */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
-	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
+		CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
@@ -730,7 +731,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 */
 	if (adreno_is_a530(adreno_gpu)) {
 		OUT_PKT7(gpu->rb[0], CP_EVENT_WRITE, 1);
-		OUT_RING(gpu->rb[0], 0x0F);
+		OUT_RING(gpu->rb[0], CP_EVENT_WRITE_0_EVENT(STAT_EVENT));
 
 		gpu->funcs->flush(gpu, gpu->rb[0]);
 		if (!a5xx_idle(gpu, gpu->rb[0]))
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7768557cdfb2..1ed325bea430 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -74,7 +74,9 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 		u64 iova)
 {
 	OUT_PKT7(ring, CP_REG_TO_MEM, 3);
-	OUT_RING(ring, counter | (1 << 30) | (2 << 18));
+	OUT_RING(ring, CP_REG_TO_MEM_0_REG(counter) |
+		CP_REG_TO_MEM_0_CNT(2) |
+		CP_REG_TO_MEM_0_64B);
 	OUT_RING(ring, lower_32_bits(iova));
 	OUT_RING(ring, upper_32_bits(iova));
 }
@@ -102,10 +104,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 
 	/* Invalidate CCU depth and color */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, PC_CCU_INVALIDATE_DEPTH);
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_DEPTH));
 
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, PC_CCU_INVALIDATE_COLOR);
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_COLOR));
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -139,7 +141,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	 * timestamp is written to the memory and then triggers the interrupt
 	 */
 	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
-	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
+	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
+		CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
