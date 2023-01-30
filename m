Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC66809B3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 10:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C910E0AC;
	Mon, 30 Jan 2023 09:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7F910E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 09:38:15 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mc11so7448505ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 01:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzQMMKcx09uqvwkgBAEJEp/XB8h4L/XPIaqj+sdWOGo=;
 b=aFnPqKDiZvokU1Ld9YVGuCQmLju46h8Ps4IdtGRs35c417o8G3yZFWbdUuURbsUUV6
 LPBbq1Zxb4S0wZJSHzgwzOtBcymhxWyplCdw+SFy5H087tb++iLOl7ekhob+0ljxV8My
 HDroHVCds5UyDOdGNNdpiQwFjkIPzQoBGbFdJgsCk1UlZIueccMNs94n19FwJsMY1MbS
 q/EtADGLM/NqgBOvx7qZThR6/g16OZJDzakdg50b9VNHm/ursOvTgY98Sblg2ipKtfJg
 p1GFcQOu71B7AnN9uSTt6pMyY1wjkCkFwoVE5TL9fR2/s3typ5Re1t8jqTGywYGlgY6a
 Rpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzQMMKcx09uqvwkgBAEJEp/XB8h4L/XPIaqj+sdWOGo=;
 b=N0CFlz9OJyd6e/uegGHR5sYy6nXW+yihwwP6aJx/SEDOyyOeutBg+3TUox6+RS4MYP
 jMPO0SlRbimha1f1bZibGwD4ofeslN3AvS4+9K+loO8A69loKCIrGzE9Wcpr8ypVHCCg
 ntedAHyFVbKaWOC09+jLhKARub2mVH+fPWjOpQu8oN8k98W0yBet4aOnYlDUZOPh+7je
 d7aVGLZtfUTUGNdj49LJeKozZiv/NluTiTarQb2sSjAknz/fHQMjBYEYj5aRKmphdXvl
 uagzVDPrBYRuafZ2QZr9V/0cy0sJ/o6FVRIhE0gW8n5p5dqWryU3eygi8bnS1OU98+CH
 syLw==
X-Gm-Message-State: AO0yUKWEeccfBN26R0BFf1RAEEv0sO10SZ4mN8l+laiTSDPNdfwZF6gF
 bni1xrLGUQyVy5Mk5Ocyy2/yDg==
X-Google-Smtp-Source: AK7set/Q8cFkx1KpIuuzDQfTJlgcFrvMRn26TPdEPM4KQ4E1HvWKmTFvnJdOiF00VXMaNhm6FU3idw==
X-Received: by 2002:a17:907:3ea1:b0:87b:1be:a8bf with SMTP id
 hs33-20020a1709073ea100b0087b01bea8bfmr15030746ejc.30.1675071493555; 
 Mon, 30 Jan 2023 01:38:13 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl.
 [83.9.31.20]) by smtp.gmail.com with ESMTPSA id
 a26-20020a170906685a00b008878909859bsm1951398ejs.152.2023.01.30.01.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 01:38:13 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH] drm/msm/a3xx: Implement .gpu_busy
Date: Mon, 30 Jan 2023 10:38:09 +0100
Message-Id: <20230130093809.2079314-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for gpu_busy on a3xx, which is required for devfreq
support.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 948785ed07bb..1923388eacd8 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -477,6 +477,16 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static u64 a3xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A3XX_RBBM_PERFCTR_RBBM_0_LO);
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
@@ -498,6 +508,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a3xx_gpu_busy,
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_create_address_space,
-- 
2.39.1

