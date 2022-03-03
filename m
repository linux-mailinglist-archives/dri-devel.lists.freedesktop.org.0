Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081594CC682
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621610EC47;
	Thu,  3 Mar 2022 19:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71A10EC47;
 Thu,  3 Mar 2022 19:49:30 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id z16so5658304pfh.3;
 Thu, 03 Mar 2022 11:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmkJTY4UoVeWJUK/ZSD0iRFmOgOS8XNBDluJphWOGhI=;
 b=Va808++pxqpNi95Q7zLOC4N2eUYH6cpb2Mk/xWme4nq2VFd0yfNgou7qpo9HGAIh1j
 40lemyZ7v0VsivcdJQ6t1fZQ4t8ohTjwPYAcdzb3KK0cI8q9muDVK1lqV7GJPqypi5A6
 QfuwluGKFpllbebaPvxtX3Xb8jmO0apK5I5SKYgQL4WjGCO7rCxqbYOn6peUcVrqqbgr
 ADXw842UdMhGqvFaj1y2LA38RmiN+e0vHt5DSUcnbIa/6FVJyNfJ0V6vF85OgicVqZLp
 beYKE7I2F9DT1+X2eZ5vRr9wyoIETXvAZKM98K0vr+Yz5X0goqvpJOBCppfn5+Jb1mxI
 TaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmkJTY4UoVeWJUK/ZSD0iRFmOgOS8XNBDluJphWOGhI=;
 b=1KruesNS5co4Xi26imwKFGvft5m+nA70LcMuOjGrmCJkM5SDDBEL87BQfxUXo60rrg
 w9JnMcDcxhUJg4jQ6FhNNKSUaIHXSUA+wOHxduNtG8abntW3jA87rI/kAaGP0blX2tc1
 1PtWFoNqm8CO5St19mJ2KnIaAmx2nnrg5tbcRgN3Vlr6Zv+No/bgXcngLtnSaeGOTWf2
 K1H5jl4F0EnrZ8utwCALZ7NS6NcFCa96W3uxqWalvyzIYybRCXY1u4GRIIWX4/BLmxl+
 qEmUmvKX2DVTKPrubdWs15+sIAmsIPQxINQ8fpOZ1RoflMJIpFEyvw5SQ9XdtU8b2yDS
 gdJw==
X-Gm-Message-State: AOAM532ffiwIYY3X2uk67jrGJLalkatlJ4S/WD9loN/VUl5xzEfJt6Ti
 +oONp0Ubtc51lcaKu5rxO34kixT1nF4=
X-Google-Smtp-Source: ABdhPJzzhu782jKEl9lNoZKQq0BWCXwyE1OsMvvHOFPI8fezzk2jK0tRGvsvCFtEMQq0CZ3xPMNfwg==
X-Received: by 2002:a05:6a00:23c6:b0:4cf:1e1e:ff4f with SMTP id
 g6-20020a056a0023c600b004cf1e1eff4fmr39340020pfc.80.1646336969077; 
 Thu, 03 Mar 2022 11:49:29 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 y74-20020a62644d000000b004f129e94f40sm3295024pfb.131.2022.03.03.11.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:49:28 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/a6xx: Zap counters across context switch
Date: Thu,  3 Mar 2022 11:46:48 -0800
Message-Id: <20220303194758.710358-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303194758.710358-1-robdclark@gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com>
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
index 237c2e7a7baa..98b3282a117b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -101,6 +101,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
 {
+	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 0;
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

