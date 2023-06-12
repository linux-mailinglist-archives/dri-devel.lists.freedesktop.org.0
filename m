Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742972CDF3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED0E10E2B8;
	Mon, 12 Jun 2023 18:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9CB10E2BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:25:32 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b1a6a8e851so57240371fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686594328; x=1689186328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SRzyUIsK6pGxw41itI7qcW9AyOhEGSR+zGX4cSAWEUE=;
 b=P1ebaDZ0Utu/VtBVcEq4AwPmyzWiTMqd/oI2be4YyyHZ+2AA9cNaINLxwe2+97Htt+
 xwbWwOWRiPrvLZ3J0zhyYNMXvVMiJdF+v6WtdcyXdRnXPGZ98GqAcLcqcpJmO41OxqEo
 dhv7VhApeUAQVi4RVR5VzVfXBTFvRLmzR9rbhmcdxfAlOUgUTRO8ohqcDMYhjKx7+SlI
 oGZgAdf3P+/okYUfe8IojoWAn6dfH3NcaV4QTuXapFfv1r5yHkcbKZHS87vgqhJHTC6x
 amw2aUFCqyLEkwCc+30g0PJwqrMG6AKtOvRJufBdV7qqJn3n4/PVAl4RHh0GK7RbgN4H
 ifIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594328; x=1689186328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRzyUIsK6pGxw41itI7qcW9AyOhEGSR+zGX4cSAWEUE=;
 b=VOx/yg4FnwUihndZHPF5evPk9X/YhBhyZw4mClOSuoNUBxmUbXxsnWIQA/SdAnWJsI
 4tuR/1FLzm/O/sE83p3wMwj3raIQSkQX1ONLt2SVTXGJ61BSfxY+KxAVdHS2WXSES5pB
 zlhwiPmXv6sB0PUcHugXaLLmwUl5RzZY5i8cHD7cn7mzL4Jap64W15KCy+Deyhi/cA+I
 gFyIZOyiidFAUKwJlCQizBJXIn5QpvXM6IHIGl6MQ3L13PWtRKACUkdm4f0Q3nFlJJLf
 AvM5N+Bs3A5uefPvw5z3GyyKWnM+qGCyubuQKn/Q7at7XS5LzzEG1e1pRkNXZrTKndw/
 a/CQ==
X-Gm-Message-State: AC+VfDwf5x+1asKjFmRIYf2ddPG3yxIuSSpvOMTTujZDSHecxX0s5tOc
 WzbuG51IxYih87H60pglFGu3AQ==
X-Google-Smtp-Source: ACHHUZ7vMn7X3kb0tD+cRSlLHmzDPF8v+1lJz7x03jVDXdtf6kEG5bHgrV44bNAQA2AjJIr5UIvYSQ==
X-Received: by 2002:a2e:95d5:0:b0:2b1:bf5d:4115 with SMTP id
 y21-20020a2e95d5000000b002b1bf5d4115mr3201417ljh.13.1686594328479; 
 Mon, 12 Jun 2023 11:25:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v10-20020a2e960a000000b002adbe01cd69sm1875106ljh.9.2023.06.12.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:25:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
Date: Mon, 12 Jun 2023 21:25:27 +0300
Message-Id: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change adreno_is_a690() prototype to accept the const struct adreno_gpu
pointer instead of a non-const one. This fixes the following warning:

In file included from drivers/gpu/drm/msm/msm_drv.c:33:
drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function ‘adreno_is_a660_family’:
drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1 of ‘adreno_is_a690’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);

Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to accept const argument")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1283e5fe22d2..9a7626c7ac4d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -284,7 +284,7 @@ static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 660);
 }
 
-static inline int adreno_is_a690(struct adreno_gpu *gpu)
+static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
 	return gpu->revn == 690;
 };
-- 
2.39.2

