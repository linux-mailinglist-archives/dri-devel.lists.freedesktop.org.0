Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3806C206E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1748610E2E7;
	Mon, 20 Mar 2023 18:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A1A10E2E3;
 Mon, 20 Mar 2023 18:54:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id x15so2853356pjk.2;
 Mon, 20 Mar 2023 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679338461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e7SOUWq19KHl9pAXwlvUo3lhcDDEgQm+oF8TmF0uNlg=;
 b=MVK8SzRElpv99qoW4uCh2e3Anb9Up80En9f7QGrYRLGbvgHkg9thBuZMqpVtudo3qz
 O9h1KEt7r/xEg6KbpRIuh3kewbAIIyjrUA+9gIC7vBjxtLwYwvz7SCHO6KKF5Ki9kAHB
 J+Hk0IXaekXqn24wqDiSOjWZqjdl66EW6V+u6RbYSMhLNP2b56aGVWRbs3PmOR0DwbaH
 /cNcFVGH7EhKza5pAL77lnFwY8EkhlrcnCOzSO96/zaJs0ky7HUIWXkgow/nisSLLN5A
 3gO0gJ8dNaYULNvPwMFCT2X9i1LrbD4lAQML7SmHAVvNOIpFNOIu6I0F6b6WpacWZBfu
 6USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679338461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e7SOUWq19KHl9pAXwlvUo3lhcDDEgQm+oF8TmF0uNlg=;
 b=zbYaE0jmB8oX6RGIWlFtWNaaKFvTaybx0U+tr0XKcnM/kuNjcSSGwGB3KReq880ZR+
 EwEyw7efXSuiPzCNoO7spPsMzWo7kw9YVEbFMYZtZ6xUciEL5Zkcwz0W5pfJsl1aSBA3
 A2yLQ4IRyqCc3BpWx5o1t0zaD9L0h0SowlmNNFV/outYFmShzKwW1ox91gIMHTu7FVTQ
 +s3ClQUJZO66rghTUJ11LXKAjPkvxKNg3pB5saQ2MHcbZJkK55My+e8yGuOyArL8TZBQ
 A97ZghOGB2zRLVkyDNi6eN14KuplGb1d6hpJbTw6VYhLNgmfx9H4p5yC/Tnje07Mnd45
 9GTQ==
X-Gm-Message-State: AO0yUKVu3XoVtKUhDL/LShfPIwsurwxH0iWphCGWP8QKGQyLVpCBjGpQ
 9M6cZogiPyXXT5AQMQZcf1n/LPDH5SQ=
X-Google-Smtp-Source: AK7set+KXQUBNJrPFz4KWD3QvDFqwgQqpFC8XJrTFnBiXGyx9ShsF5weoD9AtU/uJIMDG4F/+bOndw==
X-Received: by 2002:a17:902:e807:b0:19f:2e2b:3577 with SMTP id
 u7-20020a170902e80700b0019f2e2b3577mr22175098plg.41.1679338461283; 
 Mon, 20 Mar 2023 11:54:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a170902849800b0019f27fd7cecsm7051443plo.197.2023.03.20.11.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 11:54:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/a6xx: Some reg64 conversion
Date: Mon, 20 Mar 2023 11:54:13 -0700
Message-Id: <20230320185416.938842-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The next generated header update will drop the _LO/_HI suffix, now that
the userspace tooling properly understands 64b vs 32b regs (and the _LO/
_HI workarounds are getting cleaned up).  So convert to using the 64b
reg helpers in prep.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 89049094a242..f26e258c6021 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1053,12 +1053,9 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
 
 	/* Disable L2 bypass in the UCHE */
-	gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0xffffffc0);
-	gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_HI, 0x0001ffff);
-	gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0xfffff000);
-	gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_HI, 0x0001ffff);
-	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
-	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
+	gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0x0001ffffffffffc0llu);
+	gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0x0001fffffffff000llu);
+	gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0x1fffffffff000llu);
 
 	if (!adreno_is_a650_family(adreno_gpu)) {
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
-- 
2.39.2

