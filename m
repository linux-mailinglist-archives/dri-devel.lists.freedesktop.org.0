Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCD4CCB0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492D510E20B;
	Fri,  4 Mar 2022 00:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658F710E417;
 Fri,  4 Mar 2022 00:58:54 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id n15so6349431plf.4;
 Thu, 03 Mar 2022 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4j6M/QS1mgW5MTxzHwE3g8Q8Q6w+oMyq63tCyKGxiU=;
 b=DWC4DkI9wrUscASe9OTO/VybE2truTUQRwJVLU7Dr7Lk3zIGDp1ucqsHmEnuMtKhWG
 k9jIOF+x7ZeehiBWYJe+et8X/l9bv2+vk/rYAw2YokDjRLUbPm9wTMwEYhz1glnVwL8u
 eHLe41yXVJK6osaYY8sWxlvRDG+h6boLQwa0wIqmAS7sbiY4qR6XNEreJHO+FzbExMXm
 ym9UIYoS8Hj6SIy3RrXBTxF0Lpd/Oqcs2wZy5ytdjzGwrojFuSgClxMsQieXTc+hnDO6
 eHF4vUrqnwRZs8rDqTPUzE4+j9/6pf6jn6ahS5i8U78hccAvU6OnUOB+VGVQIUhG72DM
 l8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4j6M/QS1mgW5MTxzHwE3g8Q8Q6w+oMyq63tCyKGxiU=;
 b=RtynoJRMjZA2UajqegX5KGa9cYd8qHNhKElJL3cd0QYM3PmYgkYHITrRGLusIKmap0
 gDjMaHINuC5NPGC/YDkl46JL0J5QuayjzpnIJmPb2CjvcdcJpdAn0gcCveDwPzxb/QsE
 zafu7tnyzpZfrf6b2SGaPUY+LH37Ai7ji0mZ3wz4JqHoG+Popag8GjvBCyXNBspOwYeH
 GjmUhDdHJVx5i5c2AMtoe/EYWBw1y2CFDtdxT/GxcTCh2DvgcEzYEAiA7FRY9CSFCX8h
 OietOYtLEIrVGt8G5rS9E3uVg6ii90bO7XnJOLT5diWRQ9aoMje1H1v2hu5EbjOB7jy1
 7xpw==
X-Gm-Message-State: AOAM532Xj2sFJsb2CL9jkdD64xecbtE7USVE/OJQC9eYmcAKRF2rONaQ
 ZvDmAyLv15jeuoQv487oA+JXPDE+Ckc=
X-Google-Smtp-Source: ABdhPJzA5bZTW91ErXFqEOX9J0gm0y6jMQksaO9v3kaCeVmebqi6yV6gwM7M+14FmNYid9bPqdN7eQ==
X-Received: by 2002:a17:902:cec2:b0:151:b337:a699 with SMTP id
 d2-20020a170902cec200b00151b337a699mr3710872plg.59.1646355533288; 
 Thu, 03 Mar 2022 16:58:53 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm3246386pjb.27.2022.03.03.16.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:58:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/a6xx: Zap counters across context switch
Date: Thu,  3 Mar 2022 16:52:17 -0800
Message-Id: <20220304005317.776110-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304005317.776110-1-robdclark@gmail.com>
References: <20220304005317.776110-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Any app controlled perfcntr collection (GL_AMD_performance_monitor, etc)
does not require counters to maintain state across context switches.  So
clear them if systemwide profiling is not active.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 237c2e7a7baa..02b47977b5c3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -101,6 +101,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
 {
+	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
 	phys_addr_t ttbr;
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
@@ -111,6 +112,15 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
 		return;
 
+	if (!sysprof) {
+		/* Turn off protected mode to write to special registers */
+		OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+		OUT_RING(ring, 0);
+
+		OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
+		OUT_RING(ring, 1);
+	}
+
 	/* Execute the table update */
 	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_0_TTBR0_LO(lower_32_bits(ttbr)));
@@ -137,6 +147,25 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
 	OUT_RING(ring, 0x31);
+
+	if (!sysprof) {
+		/*
+		 * Wait for SRAM clear after the pgtable update, so the
+		 * two can happen in parallel:
+		 */
+		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
+		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
+		OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
+				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
+		OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
+		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
+		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
+		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
+
+		/* Re-enable protected mode: */
+		OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+		OUT_RING(ring, 1);
+	}
 }
 
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
-- 
2.35.1

