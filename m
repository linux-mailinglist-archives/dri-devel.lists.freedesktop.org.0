Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183A735C4A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6A310E22A;
	Mon, 19 Jun 2023 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87BB10E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:44:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f8792d2e86so139166e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687193066; x=1689785066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
 b=IZ95yaZCLywYLVLR/TLE12lPpUizicviR2/vp4221PjzLPEaNoGz/MhkOu28kaL4Gr
 mC91aGTs3x24gw/5ERaUD7LW5QMRo1fi9WYHK6kFfBHaVQ6i13J84xOF+3ZbvHX31nux
 2G5jxTdkeOMLGP8ztIqw6srQJ5G7cYNQYSOhHdVwbz6qRe3r7B+l4CRH7iazeRYabX4e
 wzrhIxpKtYsXIrjHhKxHSd8Pv4wsuPpnUp2AD6zLPyGelbJ6+2/LCo4RaFJ+Vzmle8zv
 987WIImYtuns40Hv5e/7cVx8iVs1Gi5WXUYK7yIZgFJ+ufN11VqALyrCHprHAVC+H9hl
 dpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193066; x=1689785066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
 b=bWF90YzhBRpYDJhoFGu90lnaCBjfxttsj0Dm14/MF1jI82cDg1rFDQkuPfTHA6Y193
 9gAV1Il02yv3Mw9/TvdEV3+RK30Pblfse3x/ng5Ql5WTyBJHL0kSzhpMk784UeTVKWhZ
 JSfinemFkfLJK9ita6SesT7X3Z32Up95ke7umY4+5rb+g94zSvkDrbelJzH4grAa0et2
 uEEVBM/Jmy22ZXtxDk21RgihoFNr96IsMtmZE01NjBELyC+62FLjx83vRIlt5+rrsT7f
 gYvEM/loaHHNMbmn86KK1i64J32zym0+mutxZ1ttPhUviJ0/+kclNxeGZN2NNkoufRqg
 NT7g==
X-Gm-Message-State: AC+VfDyc5ADEhVVQvdOWCE+vfqCTorLSvANZ/gxPK6EAcYCLLpxnkF1U
 MoxY4GfZVuyil/NsotpJi7NFUg==
X-Google-Smtp-Source: ACHHUZ6VBVIsEp99X3J5kbcY7YWOtxe2ikNj21kwhtR1+dfm8sR1zlcYHur4QOXDP0fF6/pt3PhbgA==
X-Received: by 2002:ac2:465b:0:b0:4f8:692c:74cd with SMTP id
 s27-20020ac2465b000000b004f8692c74cdmr2667856lfo.22.1687193066782; 
 Mon, 19 Jun 2023 09:44:26 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:44:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Jun 2023 18:44:23 +0200
Subject: [PATCH v3 3/6] drm/msm/a6xx: Skip empty protection ranges entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-3-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1073;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=p7u0J4uljF3tZrz5h1ZuKJqCS/MqBnjZGFZOc1JmV0E=;
 b=NQKGopdA8vA2ah+7eJ7S+RCXRZTEZj6j9vXtT+BhcHdPpfCuUpxjOrOOv+NEU8MSEZS12wiBv
 omlcv8IvEudBeJXSOa3mNC646auqe2up6nzof87KXGcAGLu/HnjG4bR
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some specific SKUs leave certain protection range registers empty.
Allow for that behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cd0c9bccdc19..488c69cf08d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -935,8 +935,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
-	for (i = 0; i < count - 1; i++)
-		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	for (i = 0; i < count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }

-- 
2.41.0

