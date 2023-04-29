Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834D6F2274
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 04:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B510E10C;
	Sat, 29 Apr 2023 02:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0810E1AE
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 02:42:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so3446565e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682736163; x=1685328163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
 b=rNNhV/bQkbMsukKkYsJX1r5ywXKd+uJCgUnnhPitTcYUBiXG9DwUaO8gW+VzgOBRtO
 rfro0ivS50rB1x6/4rIVC01AyuR1HHPusnZhKsVEnzRmsli+1ARdXGTBZ9vk+QGPE4LJ
 xHMR+LxL4/9UH/6Ag/mJCAujoGrWXnfNJfLZ9Q0YivLb97xeIHvdYTfcTVnWbjSvsprW
 bDi08XqzX2ZT5MeKWOzaF+kmLFOjPC+dBuceLUpcRiggZlZnTwNQ4sWiFU2mVtKGGfzP
 FzmjYktixZEWvD9Ur9zX/j1oDHk17BfvI8EJR5jRw0J6YjCEIFAZQUgP+6WQfge0dI33
 2aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682736163; x=1685328163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
 b=aT6r0+yPyHJFCfXbvU6tj293vRhgJgMdu+SAwmOddxZcInKIRX1uT/sT5v81vG9nMM
 br4gNpKnvB5OHPoJcLViX/vgUUPTe9nwoSbYb4TivTyTkszTSfSdu1YPEgVo6XCcop9Z
 3cE/bLsQR+2TrlzErQyiZ1GhqwpOz8dSOWd3zdR8bAC1XZADgTAV0bjmtPvvB0YCPazt
 VQ2iMi3H7crOnx8t/j1aajBcdSLRaLEijFftkFxUs3YRfh2tYbN99nT3YEql1PwnXTRk
 YsH7uMh5wWDAD1h0Vty2GNypqvR2cjnzyk59kMGWApyf6awJqFF/ifs5tjrMdHtmcCDO
 N5iA==
X-Gm-Message-State: AC+VfDyyn9p1WbMkXXlTTbOaZNS8i8L3a+A6GWMTOA7VI543VKmYEJjV
 0NiM9sH/Wq85TerxKp69ovH5hyS3M+k6JM/K31ftIg==
X-Google-Smtp-Source: ACHHUZ7mXx8ocQsamoMmD+wEHGo+Nr/9Lx40yplpDfClfBEbl9Lpw7Ug3RYLL8b5JfvqAMunOGv/+g==
X-Received: by 2002:a05:600c:281:b0:3f0:9fef:1028 with SMTP id
 1-20020a05600c028100b003f09fef1028mr5017684wmk.17.1682736163649; 
 Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([81.145.206.52])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003f17eded97bsm29827071wms.19.2023.04.28.19.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
Date: Sat, 29 Apr 2023 05:42:42 +0300
Message-Id: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3e92c2c66716..db6488a6929d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -384,10 +384,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
- * @igc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
-	struct dpu_pp_blk igc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

