Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3A645C93
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686910E3BE;
	Wed,  7 Dec 2022 14:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30F10E3BE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 1so15339425lfz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
 b=sXvtNEG0QvjAEGWec51FWMzEbiRXBOZg6CIdMOUyy4HlNfdmrbew2erT9yzEn0JYfN
 nbMQLrCIHht12nA3k2enrA1O4X/mOg6xh1MYvirfcUuoX+SucCm9Hv2V6/dzhXRduXkA
 NgWY9l9UzFxP/vqU39+8oIwXSDIT5Phya7qYDZJZ6fXHJywPw5+o5M0/7EmJO+UDpOIr
 WGzDRusisLPpJOi4AIGphoQqETgtSCdzeAS76nll5+P1rxFBvqAPeh6PPfFgPlJb95z1
 6E/UyNdbMA5Lfah5pAxWT4tBQPnfX2uiMza7PnLKMn1nbqVzrXmSJvx0R3z0y/ZbGIaX
 1y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mfAGwvefS+g/9R3S0STarHhm4RzC0mvAwecKR+y5y0=;
 b=sG82EuV97CmelbPNQ+DiRwRv308fkqHFKe3VTJjzCq5iYrnarE410FnJj86IvAxDOn
 GzkGSXbD2cvylfu2eLZCpLN1bwCOueGcbeWEo528/U35qIyCM5V9nFfRU9JhfIkOQMB7
 niWGThhlBS45CsMkNBd+uvxObycafletHAVelGo/Ib5skHZSZthEBrWGxZfIZ2jG1M2d
 reDFIegXpOYzHMSDw76FaTcMNcX92GzJUaTNlWw4F+bLO3gU7mBq99E5otGCbYKL+IIy
 ZATefwhfxOB3vJ2Cb7O+Own2Q6gW84UMZy1fEAr3tuPL5tZStZ/BKtGVtIvkkLgXZAOe
 hgEQ==
X-Gm-Message-State: ANoB5pkkcm8zAjx94nlmtsvKC0o6RYfDqjpmNf8CalihDTexiL28fhBB
 DdgJbnAE4Vc6/Zf7ZXyuraGYyA==
X-Google-Smtp-Source: AA0mqf5maAfH+bw6f92BY7BtyIgmYJn3CtQGZlwA+JBxaNZ1iDwwhukTfbxfsy0Yk9HLyHTqnflYdQ==
X-Received: by 2002:a19:7107:0:b0:4a8:e955:77e7 with SMTP id
 m7-20020a197107000000b004a8e95577e7mr23518267lfc.573.1670423317240; 
 Wed, 07 Dec 2022 06:28:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dpu: correct the UBWC version on sm6115
Date: Wed,  7 Dec 2022 16:28:32 +0200
Message-Id: <20221207142833.204193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to downstream (bengal-sde.dtsi), the sm6115 uses UBWC 1.0.
Change the catalog entry accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b4ca123d8e69..a1b52b9b16f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -335,7 +335,7 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
-- 
2.35.1

