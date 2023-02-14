Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C62696397
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 13:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852AE10E8C2;
	Tue, 14 Feb 2023 12:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C410E215
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bi36so23232843lfb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
 b=W+iHYcy4Kau9N/8oFf0OC/B05xBFj+/6mw6m7TeMCX96tPAlibotzVD0l4WvPYU49S
 fqf0J4giZ4dLuYcSwWsGsHN4b19iYKmKvjhclr/QTdEW8UM/t8SqZ4wUZZn//Bc+sy9c
 bDXSq2BJ7KUi5pljAOYb0a/Q55L+YhXg9k8VaNpomy8LHDe4SZlgJG1mU6AkT88bC1s+
 snfiDwmYE6KhFm50Sdtn1aE9GMtgKBipn1eNWoV/dQb3Mke1fnlK9zoyeq3nqtsURyBi
 ifDg/2InNco6iX43uhqpNGnInicMlYkpZRmaSRrbMo6XEOY/HP200v4C+v+rrF01hFWw
 fJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
 b=X4aH1f2jdDujEiDSRM0vNw64agZdsAfF3tWP9ayopNcB7vmi1ckB4mJcXzlbQb/GX1
 nBrEbllFrSYn3GjecHzOtI62ZfO2DgVaTJCQQPcBv6KRBnqaEt4POvUMR6ag2YPf/Pin
 0LXV8RZ7PX0fuoC3jySEJyLKydWRYIGI90cH5w4Cl/fMK1CLQvwOz+i5oIXYRSXahCcO
 fYAo4QjActwBpNlDDoaMzFKprSESkTiUAYCzyB7pSg7EpCgsqeWPhd2SzciBq6AtSbsT
 bnIVYyuACtJyJj72k122JQ5iXQye/clM+IYiRUspK6NRTCaIQhTT/JKIHFETnWoPnj3f
 zxJw==
X-Gm-Message-State: AO0yUKXFyE5v6C9WwxBELCEllkbgkO7+maJe7apMFccvoil7fibAk44l
 s9fvg0Mu/4Uu/FAzvbJE6DopIw==
X-Google-Smtp-Source: AK7set9Bquz0hgYxtaiG1c/s1FRRk3s8VS0wWQuvd5BrpQ5m9R1E/b4/FcDR3o2q7MpTGUiuP9qyAA==
X-Received: by 2002:a05:6512:48f:b0:4b5:b7c3:8053 with SMTP id
 v15-20020a056512048f00b004b5b7c38053mr466747lfq.42.1676378107761; 
 Tue, 14 Feb 2023 04:35:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:35:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm/a5xx: add devcoredump support to the fault handler
Date: Tue, 14 Feb 2023 15:35:04 +0300
Message-Id: <20230214123504.3729522-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
References: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use adreno_fault_handler() to implement a5xx_fault_handler(). This
enables devcoredump support on a5xx platforms, allowing one to capture
the crashed GPU state at the time of context fault.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b5270324f5f8..d38ebfb5965b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1099,16 +1099,19 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
-	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
-			iova, flags,
+	struct adreno_smmu_fault_info *info = data;
+	char block[12] = "unknown";
+	u32 scratch[] = {
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
+			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)),
+	};
 
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	if (info)
+		snprintf(block, sizeof(block), "%x", info->fsynr1);
 
-	return 0;
+	return adreno_fault_handler(gpu, iova, flags, info, block, scratch);
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
-- 
2.30.2

