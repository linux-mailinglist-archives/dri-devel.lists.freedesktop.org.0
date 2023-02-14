Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C977D696BA6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF7D10E94A;
	Tue, 14 Feb 2023 17:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1084D10E93F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fi26so18476139edb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VA7zP8WNqSIxNsvlcXasT+8KqRpaNDNAbEWnbXxBDw4=;
 b=evazl+A+N6Cdli7S0ZAn3imoQpi0G22lPXh1deX/l0fnPhnI4kncAdAGEl7jDKvl2r
 3YjSE+aRiIUFu/gGXPD/5/wAbpePk1+589S2KH3qqU83uKbS5gYOEYFTneBs9tis5l4U
 SoCWUk8dzbHnMvzkkicBlNxJrnU8YeaOnJBdNLxNIXZ0JTkWIMXjgb/TjoA5SX8LVMwY
 joZGOhMOXlw89WdbCSgugeh85j/F6HZQrg7oe23v5WcQQ5ZV8Kh5BJs4vaTmLbt9M7Kj
 OP9yWPmjzLjasLku+ZLbqIkV9YruaOnQlGw0LO0cKWVsavO4UVDQQFl/vfuPNw+ll6rH
 fgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VA7zP8WNqSIxNsvlcXasT+8KqRpaNDNAbEWnbXxBDw4=;
 b=ljqcjOX9pWp65qR6H1PQwJEZHmxQvkzEcaeQK3YH+GCSIbW81v1EspD4IKmsNeAtv9
 aLapp1+nn3yM4HQPg5nS0hebr0gYypfGYxAVCNVu/pD1z3TgjAT67gsiJLoq5k//uzHs
 zaVIjwDYEHabI2kuZQXNcC30SieQmjNujyQ+HX1INfiujkxTgwJiZxmThp+1tWUq6V4L
 dqDNjYEIzH1BRqHMW1tUdIsNEJsRExglDWXzr061B5OsxqAY4crjjfsMUEUMhdylRFQn
 BaXaG+ihZ+WUYt9x6jNR5iTtijtDjNO9Tw0BVeiSD3mhA7AI+Alqc+lwDWm0l1andv6t
 AXgA==
X-Gm-Message-State: AO0yUKWT3/aaGAVbHYftq/BEmAQYJHrmd5Lj4GB7XWigkpEU0won3Atb
 jSnVLHtoLnqWerktGC5vpWKY8A==
X-Google-Smtp-Source: AK7set+ctVCl1+WL01sBa8+tYLbtCUXlSqUfh34PPJGi3krIv2373I0oowT03Py5+hQ6lnZq5esA3Q==
X-Received: by 2002:a50:d0cd:0:b0:4ac:b600:180e with SMTP id
 g13-20020a50d0cd000000b004acb600180emr3271691edf.19.1676395941705; 
 Tue, 14 Feb 2023 09:32:21 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 09/14] drm/msm/a6xx: Fix some A619 tunables
Date: Tue, 14 Feb 2023 18:31:40 +0100
Message-Id: <20230214173145.2482651-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1e259e9901ca..503c750216e6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1174,6 +1174,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1191,7 +1193,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
-- 
2.39.1

