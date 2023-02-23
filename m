Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0D6A06B7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893D110E054;
	Thu, 23 Feb 2023 10:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655BE10E4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:13 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f18so13283073lfa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GGhJ8k8BvYcG4UvdUcw3fi971zbE82bjXqWQD3F+nXY=;
 b=nwnpdMI6fiACcnT6sDMZQnAaSHlzmaHJezhHhQQ2bSHQ4B4nl5tbH6A2q3diS3eX/m
 oG1jc6/dNoQHwRXZw0DrEoB0m4SAFkNi7i8gxOoyMKFs48ccXDkGqWjMY2xGxB8ifX5t
 B6iYN9uQKAzTk9XnEhjkO+lNnCUN93bTZChJ8C7iRl/LQ4O8cLRdYVZf1EK4bNBsG0r/
 uR1TapxsbvlbBPaZD3CFeZWeIOJS6UqAH8A46G8oR/07ZrKAX3fxJRuj36RH3IG1kAme
 FyV3JUTbVVAhBECLWUIt5xKVpMSSY9EV57xo0g19GpFRJi6QGZ7VUbONhKiI9+stFIct
 Zy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGhJ8k8BvYcG4UvdUcw3fi971zbE82bjXqWQD3F+nXY=;
 b=L0/mH/lIcqqxi5JavG8mBU3ryT/oJbbNm5X2iGyw/47I/UoDolGc24waTqF4D7z6qP
 AkOnKthquAIbKFSNkc7utiHocmhV/7RDXLoOPmSmM0bJNnF1KdaW5jorXzvnelkzwdnN
 Qgd9DQiuYe+vKbqPmfke5j7zphTSrsGOy0W/VAbnIOOv3xK1xB+4Yzlnn/DnfxRRTJFx
 0uHcL8eQH6XXRjuCzDBO/wWBqeuk/R+fg/HIM8+Y35JLrv5YbNIYUpa57S20mTYdZh/E
 VOhUq2OogexMN3IxQf3gnc7ctzE7fraFJoGWe4KBxFPdXSs19lpWXLF29f48xH7c9EPB
 zXYQ==
X-Gm-Message-State: AO0yUKVgkNmWfXjr9kTeKlslE8FvdlhKW0vFBreuHszzMWc7e0wNa89v
 ERSGq7ho40NmdKMcnyyB+bGEBw==
X-Google-Smtp-Source: AK7set/elyparV9oVKEeDJbSsKTik5j9hneZPxyOqkZSoXL1ZHolnyYLAlfuh92Bkn/hZ2QMW/HkaQ==
X-Received: by 2002:ac2:5ddc:0:b0:4b5:b7c3:8053 with SMTP id
 x28-20020ac25ddc000000b004b5b7c38053mr3513220lfq.42.1677149531482; 
 Thu, 23 Feb 2023 02:52:11 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:11 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:52:02 +0100
Subject: [PATCH v3 6/7] drm/msm/a4xx: Implement .gpu_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-6-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=1379;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mfqjq6oPzn0mWycAv8UA9lcR+KDEDYvYmMvB7YZF6m4=;
 b=v+TXzHtZ4KeibeJvtAtSVkVKGunOe6Iu1g5H+gnK2w1JBEKFvxZTmXGxVramXBPr/Tj8NsK8Bi9k
 LEPBJc3jCmmBpymLrHmo0iWWUGGZz0RaGGJMjVYruwZq+Rrbi8gn
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

