Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2B774C20
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3881710E3F0;
	Tue,  8 Aug 2023 21:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E51D10E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso95722591fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528576; x=1692133376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lqz7w9DN46LollZ8B8cwAps5w+FdCgj3qIXMhHKzaOA=;
 b=w7TM1+29aq7mu8DdyFgFg7q+tgvrgq72wC0QJ1yMpAwOb7RgSgZuGmuKEmbwBXvDzu
 ZORquxMncRCJAal/oUKm5zZRUGD1FqYFfzQ+4NTN6QCZ0Y3Asgd/KkBWNo83AxuryI1P
 NQSnjjqfQXWMDTi2eZdHcQY761nqfLPi6OY8rh5nBD0ll44gRz/jzi769Z7XLoYuTpij
 KBrP87k27wq+4TguJ2Yp7Y0Ckz+HjaXAf6AAVgEo+iBKZv6sNjDiHAUjGYfSq7mNB6mg
 YAx08WwEv6X0ml8XbTkRlerFClWzFHI+E+h8nagjK0xKUFXVCFyQcD/ze9bF7Sw1u+0z
 wzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528576; x=1692133376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqz7w9DN46LollZ8B8cwAps5w+FdCgj3qIXMhHKzaOA=;
 b=N+RC+usmar6bTU7pZvcq3qmJAAUHSSXdAuZqR4vNuY9riGg1BqaWTozLWEEc3hqPuh
 gP+K5VUV0gNOEWuDTblHVnW23NTCe36QuR0igIZRhwxSwCjUb4d8/O/priC8PGGwiLLB
 zzjA8WjHHsHUzaSGin05TmBPvjuY6y0wSmYlNKTveqkw4k56qwmGZN7rJxsMiAy1uv9y
 y3Ya7aVdYlcFQOKssXf0JSMO+cOv7tjy3O2xhCqmgPlk9D6QyRp/M4mt5RWY6jzVj4bQ
 zNuHV61cVMqui98vyOb+4+tkzOTo+syg3DPK+ZNkqC8WJ3VtcPtNwKD7felFo7w0+hiS
 aCww==
X-Gm-Message-State: AOJu0YzFqDrshWKIydtnijHZ/1KjNilUZRYKcw/wAEYcLsBmikbQSpky
 iNekx2SpZ4g+392AKPNFJbPUyQ==
X-Google-Smtp-Source: AGHT+IE0PLzf8rTXtsLHDVnz0HqqaD6Vde/Y6FvOMzx+RT7sb+AooJgdWRW4uKO3Beejot6Pj8JL3g==
X-Received: by 2002:a2e:a307:0:b0:2b6:c886:681 with SMTP id
 l7-20020a2ea307000000b002b6c8860681mr492063lje.6.1691528576656; 
 Tue, 08 Aug 2023 14:02:56 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:56 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:43 +0200
Subject: [PATCH v2 05/14] drm/msm/a6xx: Introduce a6xx_llc_read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-5-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1048;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TnlFTvDdHhoi4rVAYZ2tyAwm56dDVRIuWBaJyWSlozw=;
 b=a/SUmHuwx6GbHQKZ+zB6XePPj9sI9E9dNkhNkm4geJQBC/XMyObKFtFrnDWlvJ+i/rulMyMRt
 UaeyhJm1kS7BUbCC3ZrXmWHAvbWEMsshMCIBeYdQFx+cLTGdOsb1k+7
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper that does exactly what it says on the can, it'll be
required for A7xx.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1ed202c4e497..0fef92f71c4e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1740,6 +1740,11 @@ static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
 	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
 }
 
+static u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+{
+	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
+}
+
 static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
 {
 	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));

-- 
2.41.0

