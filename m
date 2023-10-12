Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35187C623E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33210E3CB;
	Thu, 12 Oct 2023 01:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876910E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:29:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso663548e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 18:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697074151; x=1697678951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
 b=gLIRdw5L33GI+HY1qiZAb95u37MNHWZpH2nYkXXgLnmzVid2rtQAR/qriqrNKIBdTA
 rYKLr9YgXFZoqMlaqfKqWRWuP80wSdu7Oc/EZLIrJjmThSe3MB3gPQAOGUHj2ZCJklCz
 NF8Vi5JRCD85U14EP7bxqGdIcXcpwfqiwqEwuDJxgV5HwMmOGXxM8UxVnk/RIOwywHSj
 /Xc0kzAlOB+/pTcqwBUfBbKRKRX2NHauQb347RTh5YfNW7QDNi4/idNGVEZjfsIew4cN
 mjku3wA57CybD/yXNBBtGcvlwBmm9PALPRf5nAcS9ooNtsxD+wb7Yg+c4Kh6J/DRMGdW
 l1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697074151; x=1697678951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
 b=sEfF16OFimwSit//9/X71vZoVxB1eBGbZzzrU9uGr5NLKCRwcu6HbrjIKpafaXOHoZ
 K4fgUXd7JuZEjCdStiL7l3c81q9+5Yz62yi7WVu4ZdQba8i4OuD62qSwUXzmMpPzLEhB
 1t940QL+yOTkD3cwz9KQueLIMjCz796yBLDLPYossW49tvxGYmnAkMF3sP9LcIlcleHe
 mj6WfJiHwoyn+nDHZOB0njvNllXCeP39IG/oNIAhYB3yeSrENEmuFhkVPCUP037h/NCL
 xGb/2qJ8cVaSgskBBGP/mnRDgdoChmQeYCBbqboJf+6cCZzpuNxktrtVZerIP46PDWMm
 tkIg==
X-Gm-Message-State: AOJu0YyY/0v6UTkSF72y/s7EEnjRKet6fuoytNySR8+Ein5/vUi5Daio
 e8UGo9V3UoVikPaw5z8Qx1DvSQ==
X-Google-Smtp-Source: AGHT+IFfXujRcXoYf0z1/G8UCFMg36O3UhSXJk5XZ1oIR0k0a3yVyGALDMVB9CWeygngjBxRM6+/Xg==
X-Received: by 2002:a05:6512:4015:b0:503:9eb:d277 with SMTP id
 br21-20020a056512401500b0050309ebd277mr23298737lfb.49.1697074151565; 
 Wed, 11 Oct 2023 18:29:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 18:29:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/2] drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
Date: Thu, 12 Oct 2023 04:29:08 +0300
Message-Id: <20231012012909.450501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
References: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
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

Use exiting function to free the allocated GEM object instead of
open-coding it. This has a bonus of internally calling
msm_gem_put_vaddr() to compensate for msm_gem_get_vaddr() in
msm_get_kernel_new().

Fixes: 1e29dff00400 ("drm/msm: Add a common function to free kernel buffer objects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fd2201cb62db..19019c764f11 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1180,8 +1180,7 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_unpin_iova(msm_host->tx_gem_obj, priv->kms->aspace);
-		drm_gem_object_put(msm_host->tx_gem_obj);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
 		msm_host->tx_gem_obj = NULL;
 	}
 
-- 
2.39.2

