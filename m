Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89596D1335
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1674910F0B4;
	Thu, 30 Mar 2023 23:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79FA10F0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y20so26699563lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tBl7yKVCwhjc6yO5z/z3JPkwp8Wjhy3CVWsctbwDdiM=;
 b=J7ShoQYmlST31y9vYBnakfBjPumtRbVT2+SIx+XvGQGWIxuk7JkKCbQA7Xk5dA7I7L
 yZ7Re0fmWUaIlXxfUVhl61dmv4UTqVVwn0/71RSOC8CCQlcZIbtTiBESgNAnO/Puz2sn
 dt99mGqLsUiJ5OzFZ710eUgzsIVVs5WCwE8SA3uhPrfeqrHqJqq0xEXKqiG+coxQ1HXV
 jfYiChhzN3ApQ6Cb5Rpo99/IX34BPRwfuFJkXGHr8oG7RnlsFsj1eneyi6vhRqUerjDY
 gYuCVVRPlj97Y7Y0qgme6ECacS78PL8jQuPZJZ5mozwctG7FeA1QuVUwfFV7LGJpffaP
 0Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBl7yKVCwhjc6yO5z/z3JPkwp8Wjhy3CVWsctbwDdiM=;
 b=vH8BCfWpQueimmKSvFmQkcCW6QikovCUM+zSLpS8OdXybQ7Ngi9SGIENYsyUWgP1Pa
 sAqh1xhGLp6Oa33JNkNH+4JUpfa4rnj7IUDUWcqDyHLI1/ib8RQgXVBK8qDdWIUgSQNs
 Bkx46ehjQgilZl3JdU5rGmP1WGtCkFcqpJjbnIcXwtdtT3e5ONwqbwh3ltxq/QqEikFY
 0a9peKISCWs/9pbUvC0R0JUKZ5b2cMJm3luLCxftuFYfSotXGTxt5pZNM1+HuGqGDy7N
 BU8nQ/shHQHS/k4mxgWCx1ZvtNbeFNzylTdWUdNsGayTiKF9QcAIN/U+aj8eI7vVYXCK
 4HAQ==
X-Gm-Message-State: AAQBX9d6AURYfxcU1z1K6LsZjY0piOEPZnE6FIvt37J4iiMRljJuwplR
 BaV9CjQEjF4Q2sM2BOrk1eZ1NA==
X-Google-Smtp-Source: AKy350YBpdsthEGRJfnncDpyCejjJFqgpBgwEfkchfFs55N+b/DdksqIwRWVvJPLXY6DeK1x4ozP7w==
X-Received: by 2002:a05:6512:503:b0:4dc:823c:8127 with SMTP id
 o3-20020a056512050300b004dc823c8127mr7083593lfb.57.1680218732024; 
 Thu, 30 Mar 2023 16:25:32 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:31 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:21 +0200
Subject: [PATCH v5 07/15] drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt
 on hw init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-7-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hzdufW67WGWbz2ZzqJov4K9OFxkr5eIp/rEY9Lr23FQ=;
 b=jUpAGWsk1sjcau7+3KKia8exWl7xlfLIwI0u4knrO022fI0vktcWsJ0R7MQyEWT0sZmd1gp+64Ru
 JkqYnxAhC9bGuEEKKOY17qjaRgmcj95XUwAmqk/IC5lmDqAdZZnn
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a7ecb0a87e98..30dae3ddc1c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1015,8 +1015,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 

-- 
2.40.0

