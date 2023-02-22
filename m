Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1B69FDEF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 22:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47F910E403;
	Wed, 22 Feb 2023 21:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6B610E1ED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s22so11784585lfi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBObAXrrIUPtcxXkSYb1/MPep4XlGTpRKBjzQvdnZZw=;
 b=DYSfqZcq1BWpH+P2IBd79HjNKdKOG3b8AjS3DIzytdnEhbqpWN/TgFGuXhJ9HI12Q3
 gSc2dvaycy+N3a8rxLUr/kQpz58VcT8cFeD/FRCfbo0gsX7gLrs/YBKoX8xQoP7Mlz4u
 37JNW1PJvoQ3RHem/XqNNt/Aty2SzoY5HsD9GY3oIXWgGIiJd6n+dRV+AmxOVsCWe7OX
 pwJAmELMnjZLaSsdC4s8lT98kyXkPA5J8S0erUdGXVJXyLVO25+VIaCEOOqg8cD5XuV0
 1In1RxBkjZi1Fx5cIh1DqgkQ4E0WF6yPIcFufuu3YgMeoAfB5j8nywnzViKwwkXISnlv
 BeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBObAXrrIUPtcxXkSYb1/MPep4XlGTpRKBjzQvdnZZw=;
 b=cuftYp/3d1IDQY87+a0ghA1uzXk0P8thM6aRJyFkVsrmn6n6v9rXr6FtS47L/XT02c
 r4kQ1gxDYVB8XfKzOT0WNMK3Vw+WLcbFPe2rU5+Avcz0dNKW6w1UKy4nZbs3OIPgokbc
 y4ZOVZNA/si2mNhpLueASkW+6zFBAEX4FoHsirCbkC/CCkE0jcQ+pZToG++338xsxeMN
 qG8R2B7t0p+S0ogVgT5FJKXuhHhAA87p9mcVUE5w8JBVPX2CDUxGD004ahbxOkGxzPs8
 rf1KX1eOj9XGIbWVrpNmnsJRMq6SngAOJSilrOQTIvmBaiIHUc/5Ovjhsm6FkuBKYFMK
 2Z9A==
X-Gm-Message-State: AO0yUKV2B23WWSvVsN3uymr90GK/15yUWrdi0Zz/NPCbWIa3p6Zpu9sA
 J2jBmQ+b4jG0IBR8DjqxmVzW+Q==
X-Google-Smtp-Source: AK7set8TVuK6O3j1A8cKQm/rm5TJ/U1qSbdnto6SXbID7beCkWyu0PMvaFkdf8HTx2O7tdm/3pc17A==
X-Received: by 2002:ac2:568d:0:b0:4db:1b30:e634 with SMTP id
 13-20020ac2568d000000b004db1b30e634mr2851991lfr.65.1677102437491; 
 Wed, 22 Feb 2023 13:47:17 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:17 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 Feb 2023 22:47:13 +0100
Subject: [PATCH 4/5] drm/msm/a4xx: Implement .gpu_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=1318;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MauCU/9YqXIm/dt7dtytFcQBPIj8IAOvGMxFT4S8Dyc=;
 b=QP/b0QG4Xziuy8NNeXVPRPJH7YGpUoSLjur6u0R/Y4RiCLZ1iUjbF/PJzlgL6+eqAwD9/vnnCxZG
 rE5QRKXECnql9QRhMyM73Qpy3yERT9D7erzVd9cu5uOP/HjMtgUw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for gpu_busy on a4xx, which is required for devfreq
support.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 3e09d3a7a0ac..715436cb3996 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -611,6 +611,16 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static u64 a4xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_RBBM_1_LO);
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_A4XX_CP_RB_RPTR);
@@ -632,6 +642,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a4xx_gpu_busy,
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_create_address_space,

-- 
2.39.2

