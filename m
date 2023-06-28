Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F474199E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE8C10E3A3;
	Wed, 28 Jun 2023 20:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6B10E3A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:48 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so95287e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984547; x=1690576547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w4FrtTzzHgJt6VgBD5Al19EdXlLxrqJDKTmf8RSr2nw=;
 b=BayOPWTj/YnDNGngG10tqbk/lga6jA6qkD1rt8kJU0L5moKrqx3DYkXvuIFmQ28aVu
 I5oei8+BP4P4hOr3ATnzH+nUHxm0ESM5xE0401AJTPv5WKZNgyNgiBGBSwUw7fC/3Vnf
 yOndcOvJ5q6+vLLA/KW9o4NeMDFiNGyU/6ZY1BUDPdd2SVK8KJz2ww91FLQQ6sSIwIZ4
 Ba2aBJGAU0xPfD7HVbAwQ5XbIobd01rKXoBu1+WTYN33EoWofY1ymB7cjSfSA8DMB5oT
 cjtbvjaOTJbj4y6XYEwEjknU1+sUWByuChuO+dkIaMBQFMokKX6NaLSAtP7YeBM7fH4u
 uNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984547; x=1690576547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4FrtTzzHgJt6VgBD5Al19EdXlLxrqJDKTmf8RSr2nw=;
 b=hTyjqiHgZkmPu+sxU9us/aT8hkAOYlCalM0GNwrQKN2EsNCo8I8o3TerOVZfRmHNTa
 lPfDrhYAEo6IYkrqG6UU6Z11sDGJu4Z+8k17meFpw+rL+s7YEDztzdtjq0ySBspSCCeX
 X4eTb1i8G4+AnZj8qJDicTZoJgociIdIOe44zHjqQp1vhaiueVv8fyDa0KjJO8AQMdzd
 Gibvvt1YQ2yPMnVVwJZMTCnGuwhKco6X+phPu3O9hNSkNWYA3UmxgkCQ2CumIEfahlJb
 PDhJ9roH+6NBo1jl2MLLBzXI+ANhHlrwXXJrDNS00NusPVofSnaef5qYUYqpOmYHSw4b
 iERQ==
X-Gm-Message-State: AC+VfDxEC1gqDven5mxNHnoRka4TkMwfVOy+k6hIpzw1783OKN03cHwe
 8VjOrx3FOdvQH5gxEh0PlBdTQQ==
X-Google-Smtp-Source: ACHHUZ7IRPMwemXJGk4bUgZ8NEjR9/5Bz4Lvpzn8XaqFqMIHZc9eoQ9qMsT19SSmiByMSzSsrdUDAw==
X-Received: by 2002:a19:6755:0:b0:4f8:58f4:b96e with SMTP id
 e21-20020a196755000000b004f858f4b96emr21900556lfj.37.1687984547234; 
 Wed, 28 Jun 2023 13:35:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:14 +0200
Subject: [PATCH RFC 14/14] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-14-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=1255;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5Q1kvDGqQf+MZGSOe2N8n59sdYSKweQE1iz0+XOB04c=;
 b=eXvXP/e+RhlAwoWIAvEi5snC/1AjilAjPzcIT9/z050IFx7BiJqsJPVjijWMHbh0Eosacg1Mh
 yHlbBK/Mq2rB0sbPFYndGRfJjM8/YkKiNuzpi1B5hPjhfx845Uzw/Wt
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fac325217a7e..b0fa764ba299 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.41.0

