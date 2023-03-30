Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ECC6D12E2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4502810F084;
	Thu, 30 Mar 2023 23:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F6B10F09A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:15:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x17so26656027lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gKYBmK1IVa52dJ8Yd581Rv9QR37AAvuQ9cm7SbojhKg=;
 b=gYLVf8N1n65KjQ18ewInau6qSRnWQtAGfYEsyBEMZHwlZqL7OzVU4lR6alx2YWyOkm
 1vXDdWn1ZF65Vap+R7nQF3cWDGRHC/OynalikGuRncZftTBOQaTLW2B8p1vDv7/5abd8
 f2mpuvfvPZbZqyKZ8CBfp9qQwa3GVxla4yOzG9jj0j4+by7KzJ2xTAat0Wmi/BwJXJat
 ANM0MuSwGKyHd6VBQyPwbVFXvc+WgPSlEqy/04bOVgpABpd7EGwN18y8WPHl1VO6KSCA
 9V4bKs4JKP5uiudSog/2XOLt7GJXZQgFRzzYTJ51wSyGRO8cWESXH5oefnQp9cAxHEXX
 T+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gKYBmK1IVa52dJ8Yd581Rv9QR37AAvuQ9cm7SbojhKg=;
 b=c8HPukazTGlolwVxEa61OpGixy+wJiVMJQ2IRAyp3E16HyzG8n/BRp+RJoKNRVGL7e
 ePL8dmMcc8jAIkt7MQUat97ZR18fJNwEJOGiSYWBOcU6LjwCJPearK0JI7IQMo90lXvc
 Ikhd3Tuod7VPR7kyQnVLcByWy9LEyKso16N769HG+fu/0BcIRkbj9u4PsCYnYm/6hKhu
 yvbEQJptFv4Mtm8Nh7Te7mPQOE7B67RweFGX7QC8c7BIkHd4wKg3Re245l72oAcMpPsZ
 D3k39djQ4RH/TWz8yrWBITb7+kUgg2apxab0+FO5UMF7r/YroG/kTl9lz4qt9mS+wdcV
 mUXw==
X-Gm-Message-State: AAQBX9fX3uRV/fjX8Hz0BzuO7xeTxJxnQp7GZgrRPF4XA0jvbixlPcRE
 SrJKn1hlUTeXsE01DaZojbEPvg==
X-Google-Smtp-Source: AKy350ZkSoTtv36RT8IMcVEcnIufQ5seRglWcEDl6o88SB8mFQgltcw5w6ByxFf9OwNvXOSEDn4udA==
X-Received: by 2002:a05:6512:11c3:b0:4d8:6f37:2611 with SMTP id
 h3-20020a05651211c300b004d86f372611mr6779352lfr.20.1680218129285; 
 Thu, 30 Mar 2023 16:15:29 -0700 (PDT)
Received: from localhost.localdomain (abxj225.neoplus.adsl.tpnet.pl.
 [83.9.3.225]) by smtp.gmail.com with ESMTPSA id
 g8-20020a19ac08000000b004dc4bb914c7sm123387lfc.201.2023.03.30.16.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:15:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Date: Fri, 31 Mar 2023 01:15:16 +0200
Message-Id: <20230330231517.2747024-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The adreno_load_gpu() path is guarded by an error check on
adreno_load_fw(). This function is responsible for loading
Qualcomm-only-signed binaries (e.g. SQE and GMU FW for A6XX), but it
does not take the vendor-signed ZAP blob into account.

By embedding the SQE (and GMU, if necessary) firmware into the
initrd/kernel, we can trigger and unfortunate path that would not bail
out early and proceed with gpu->hw_init(). That will fail, as the ZAP
loader path will not find the firmware and return back to
adreno_load_gpu().

This error path involves pm_runtime_put_sync() which then calls idle()
instead of suspend(). This is suboptimal, as it means that we're not
going through the clean shutdown sequence. With at least A619_holi, this
makes the GPU not wake up until it goes through at least one more
start-fail-stop cycle. The pm_runtime_put_sync that appears in the error
path actually does not guarantee that because of the earlier enabling of
runtime autosuspend.

Fix that by using pm_runtime_put_sync_suspend to force a clean shutdown.

Test cases:
1. All firmware baked into kernel
2. error loading ZAP fw in initrd -> load from rootfs at DE start

Both succeed on A619_holi (SM6375) and A630 (SDM845).

Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Improve the commit message and the reasoning within

 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f61896629be6..59f3302e8167 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return gpu;
 
 err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
 err_disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.40.0

