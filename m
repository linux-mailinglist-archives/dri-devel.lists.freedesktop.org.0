Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE736A06A5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40EC10E07D;
	Thu, 23 Feb 2023 10:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360C210E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f18so13283025lfa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=GGxvm6blqyc89yQk58xauwymRokHUWjtnfkAy0M5C/kAVwDVTzl5V5K3cPOqw/6Wz2
 I+SFohN/OEwGh2D1YA9QotnOOOtXEozSgwQ5LYVWUzsf1+Ad3VGPeDwANoTmFyPhHz+L
 h1EFNvVz2N4El2qWdqCvQZ4Nx1n+SU+VA5embliA1uijST9wNBP992di58UohE6MNHH2
 hUPJKKiB+MaldLPl1+y9bvMNtzP0SfmJIyrULtEccFk0uapq+TSBo9VtVbCE0hsLro9Z
 6TJ2P83GdNGwPWEEBFqffGr2lN1qOMiyW8o46ZsEr+MdVSbwgIWoMW+sQ4exqOCKF9k0
 WmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=jI7oxfUiNtr1MBm3npiicH2RNY/9lPX+kyd2V/BVjbpFNMJJkhb7Jmkn6KhxHmzumZ
 v1u89sLzpRueMlG2mIsnErA0I3/CGOjmHP0iGJdxpygZZFbYSDBDAGxCOkhSDsiHx/Kc
 +6IDo8/V2MTrNBxq5zXQ573r7KpnFKU123aU9TgS2j6d33vxGqtUDBZCgnAXyPc8GmO/
 yeSHdQY+sJG2SD5BLx6ZXnzl1oaFwdYxvWSkt6PwPwKViZ2KiuUyXnXD5PknmHfv6zCb
 5E0Y4bS06FErDFzsqCLFt32Ui/4xChV2ypaDmix7H/1874e85ToCY3m13EhQdLq+CJ/l
 wnSQ==
X-Gm-Message-State: AO0yUKVnC3ClCKwFWJ1GWjvT65wKR0zG6c9bxL57x2p5BWm2ZNPJp+xq
 U6FA8GAs+2KZy9I4Tm7pQRfsvQ==
X-Google-Smtp-Source: AK7set9jmvh+j4JyveYHT6/2X0EcNAwdK8aOAIJtzI8kddXy/qZK/hV40KXfjYqRZm5s7DJ2H2eGEA==
X-Received: by 2002:a05:6512:7b:b0:4dd:a053:3c0b with SMTP id
 i27-20020a056512007b00b004dda0533c0bmr992258lfo.42.1677149530231; 
 Thu, 23 Feb 2023 02:52:10 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:52:01 +0100
Subject: [PATCH v3 5/7] drm/msm/a3xx: Implement .gpu_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-5-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=1452;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sAA92dCqoQlGesDQKUB68UAlcg2YIqQbh8UmjiEN524=;
 b=2jM+T/p9ilIYyJLFdFVnqDFZlEMAxUjw5IY/bXTDdO3ddLKvpMDcoDN5is+J8/ZT0+M8fbi/up0Z
 PVqxIs+gC4KVk5kRrpXOogK84F17HfLU9lulIvcI7CWczCEmjCw6
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

Add support for gpu_busy on a3xx, which is required for devfreq
support.

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #ifc6410
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 948785ed07bb..c86b377f6f0d 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -477,6 +477,16 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static u64 a3xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A3XX_RBBM_PERFCTR_RBBM_1_LO);
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
2.39.2

