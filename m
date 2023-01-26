Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600F67CFD0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947510E2A4;
	Thu, 26 Jan 2023 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132410E935
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x10so2131903edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J6qSh0efJGQC1MdRpa8Z3puyGuNa/niO8IpMDoxAfU=;
 b=pgynMWONfLhM61AbGHvi2BqAJ5J1Xt0lJIRNd/X3V5KTx68IDG7Ky0q4fF0pnxAirZ
 ZTn+DfEhyoj5Nv7pPRd/QmSIXXVWI3tBLs5M4n3pvP2noMVNbxKRcSKtSx/htcVx57Ad
 6KX+ZcodRD05XU+bzH12czdbGOINh3lSYD5jhNLIodffWAwKURvSHuyDc8NFcIDa7Fi1
 vz0mskAVszXseJHgNPHTN8bGBobsQKl2i++0IFFaEjTrsjsr9To2Ikc264uNXbECE7o4
 JNATj6hWF0r+x2S86y+2rADvINXibz9y+84Wz3yZ8yuoqJkL5M3w/LjyRK+q5FfDSONf
 M4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6J6qSh0efJGQC1MdRpa8Z3puyGuNa/niO8IpMDoxAfU=;
 b=K4lg2eW8wnwvPn9CRl+0jAf1FTbtsmv3CQgwyOcCuzf8SGEmYcUkKf/trgB+HwyIC6
 mjgmstr4nsDmJpUmFQ/8LU1LR6DiTmrioRBlb/l05nJqrnhxML+o2LQ5pDK2nZNHHcuC
 DtNGAUnB5aMUvtqblsr8YUybCfFgzh5EA0dZNRUDhZit4uTsKDVZdQXJ6tVGZZcusfQN
 Xt12NhuCLXeCdfXg5wihpXCKkTzSBakoEyEj7TqAgOT2BBekDCc7+NC0Pb3q6q2s8QgI
 bQRu6KWXjge+bNM0qgGLMKQKHMhidFEpHpDqtLVj2YmzdOC8LPo9LItCH07LCmu4RDJr
 6FrA==
X-Gm-Message-State: AFqh2kq7U05VpBJGfg/pRgeWfPj6kEcHFR15xRqR+cC0KJjIZRqlEbCv
 H6Mgdp8wI9FqVOj+w8YkWubYMQ==
X-Google-Smtp-Source: AMrXdXtDsZVGSrVLYoAVLMYnDBYZRSw+ViON3LaOdYRhs80oYnWCOTOQHlrNOkOo7kP/6sPNcnM/Ew==
X-Received: by 2002:a05:6402:27cf:b0:488:e7ae:5cc4 with SMTP id
 c15-20020a05640227cf00b00488e7ae5cc4mr45916885ede.41.1674746271060; 
 Thu, 26 Jan 2023 07:17:51 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 10/14] drm/msm/a6xx: Fix up A6XX protected registers
Date: Thu, 26 Jan 2023 16:16:14 +0100
Message-Id: <20230126151618.225127-11-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the protected ranges was too small (compared to the data we
have downstream). Fix it.

Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f34ab3f39f09..62f504ed7ef5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
 	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
 	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
 	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
 	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
 	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
 	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-- 
2.39.1

