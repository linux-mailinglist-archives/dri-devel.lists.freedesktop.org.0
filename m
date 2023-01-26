Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AA67CFE4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0010E14B;
	Thu, 26 Jan 2023 15:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546F410E934
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:18:06 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id fi26so2144300edb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOXpo53+tk8MxMiyhFPMYbZRMhCDM1W9O7T9XaDKXE4=;
 b=sSfHyvUWR/wNGn0jDIL/ZvXJP4ucmis+dzeLTZZbj7iiGZuZ79AjayhkYXXfv9GQZ+
 EDCEaH/kMKgipyTy/CGQVglQxe1+eHwREx21ze+aftNP5Mvs7lgH1nOZZTq/1WMHqEQU
 zDEwA/3Gzl/NzWPE1Cx3jHoiM7N0uDw5VL0l/WXCKUu/T1mhFoD4ds8qh3N9NfEkJ8nu
 l8SS+NKJaKRW9Svv2hCASZuwGYwgPNITNG0C8D54c4+N13TENfKITy3YMG2FyGoNF4P8
 rOY0BbM4tvg+nrommvm+LSOe9sSwT8FHDkhzWXUAVfUSI73WGSW98Lp1tthojvy/g+Ax
 waaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOXpo53+tk8MxMiyhFPMYbZRMhCDM1W9O7T9XaDKXE4=;
 b=55KJaC8eclsneYXvdZBR1PvF3aYX6Yw7ucZ7ikPt1o0pNWTqW/7iH/DpTIyk42UYj2
 E7jerhGW/R9BQPFsZkvhq4bG5x26qxs0mR68dLEdbi67+tlaVEz7a2xjIyNGnTSvjnmq
 g6B/11qXItz4in9NzXsXuj3gPuxTdVMBjc0lTOrX8cp706W74KDysQ8VaDcsCvcKY5HQ
 JaEpHPlWUkrKR7r0sNr6GlYR6opgdOwlj4BFbyRyZOSeGTckyJNKOsWEGi5ZfmxFoDrd
 TT+RMjvgghJY5pRvT1Qo8yfvQhMI+QXm5QNcfGw1F0oFt9Ij2eXM5jm5y9zRifDtgfwS
 PbJA==
X-Gm-Message-State: AFqh2koKsC/UmFEonJantUQEGdTSerbpGOaTcKJsEw52yB/Y5JM1zVq7
 jQ3yrii4GTE81XNO6boFNAyLNg==
X-Google-Smtp-Source: AMrXdXuMClMZi/t4VamP19GxKKUegQ+GpSDaywWACqZ+NfsLxUGI8QqRN6TuOzsGAhvHXCNwgQcadg==
X-Received: by 2002:a05:6402:4ce:b0:47f:bc9b:46ec with SMTP id
 n14-20020a05640204ce00b0047fbc9b46ecmr36583328edw.7.1674746284921; 
 Thu, 26 Jan 2023 07:18:04 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:18:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 14/14] drm/msm/a6xx: Add A610 speedbin support
Date: Thu, 26 Jan 2023 16:16:18 +0100
Message-Id: <20230126151618.225127-15-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 89990bec897f..214d81537431 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2079,6 +2079,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2175,6 +2199,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), rev))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-- 
2.39.1

