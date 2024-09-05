Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDCE96CD33
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5742D10E656;
	Thu,  5 Sep 2024 03:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EuBD5oH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481C210E627
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:26:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5334c018913so176801e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725506776; x=1726111576; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7Kwe86N9nHvE2bdTSgvVMB4M3NfN+siKz0Ithbz+ZI=;
 b=EuBD5oH4gRH5nwHU6jAJc7WFPyfWnjGY/lvKn+FZp89jVBpxdBQvaMPuTHLB5ihs5C
 vC7bMHGBnFe0jQDK9g2qzcLzduH/xRb1UzgETo4JDWVLYs1EMUvE9BXBGs4NrQHPbq9r
 OImlsNJA/wdYP10/9cpuqO4K9/FDfjyBjFchwbMtiy7yogJXR4/wVva26phRLRF5IX8x
 I5pkI7q2wAtO0QkopAxgTUTmunkvVpchJWkhAVP7E5q1Asm2EDdALZgE9+oyd8k/7u3L
 pw5QsrVGD15vy7Fs2UluDm/IkHDlEANqHwMBsqb/+P+8ciTdIM178mmpvhBeHk3pbbrz
 HHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725506776; x=1726111576;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7Kwe86N9nHvE2bdTSgvVMB4M3NfN+siKz0Ithbz+ZI=;
 b=E8HCmE4nKneRI9G5puNQ0T4nB4rFGcYDNaWKEvJ9sq5vDRvrp37Sqv/DR4WtdGs9Vm
 MQ7dxY6Oper9qkevT+hfPyUnRyTEYAUS1ih50F2JxUD1xDIFbr3HGdnUCOsOXMYHDrxw
 BAHUs2lWjD4tlQ3VFisJ6fPk9oQvYwrn1tAZVNFGmWaBK/A8/G1vTOux3xf/bGV/iG1a
 f0BPPnMV0Z/jhC7x9WzDTas+mSwyHn4oz3rpCJygnN5so80MMliFE19f5gyvbdsB6Rp5
 HXfjPAFlj9iMqD0q54y63tvZcolPYn2+aVAFdxtD2ODSQAb1NR9Xbd8bOf7ADehPWbxZ
 s1Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT8iGCtDb/uVIAwgZKeqbYsulcgqVPZA3VHnZHznChiu5L/Sl+vSo3AYK3PQ2k0grbTMsWYckzU2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH7u0KvCbONyGozEXxdd7aLRnBvSw/LYwKKqFV6PPtxkQOjAGw
 cC/gnWt5bZJXJB8D7inspa14L7/FeUKr25FZJlWEvtBBMIlGem4tMicUgXHzK3Q=
X-Google-Smtp-Source: AGHT+IEd71q7rgbecU7t0vjYUoea6y0Uwtg+9mihNSR1M1wolmrI75YQVKcYPsBu1XiNVXMZS24V6g==
X-Received: by 2002:a05:6512:2814:b0:530:dab8:7dde with SMTP id
 2adb3069b0e04-53546b451b4mr11950730e87.34.1725506775783; 
 Wed, 04 Sep 2024 20:26:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:26:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dpu: catalog fixes for SDM845 / MSM8998
Date: Thu, 05 Sep 2024 06:26:12 +0300
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQk2WYC/x2MSQqAMAwAvyI5G6glYvUr4qG2UQNutCqC+HeLx
 4GZeSByEI7QZA8EviTKtiYo8gzcZNeRUXxi0EqTqhWh308c5MboF0MlOnvYeRtRm8pZ6iutyEC
 K98DJ+sdt974fNtpQVGgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BZ5PHJUN7Hor8+JpllFkfczVxdddQUUnZGIyXKGk8aU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STW/EY3pdZ+8DlzkFSokoN8pS7Iot0QDch+I
 uXW05aaj22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1WjFB/0eAJYyhERs0dG0kbpoFycXpnsaxRH5nzOGVfuBGt9fw4/AwImtD+fmGsFvVh3XH/rr3bR
 iE1DNaeyCRiOUuIrgaPMXljb7w46g8wwa+a+Ulgixfjs2yUxnLT2YTxDtGJk5RCLu8nGWgfnFBe
 QIwF+Wn9q0hk/M3ko8qgSEeh8qG1cMcLvkToTrO7h0SzQfTAJb1dbcD0e/KPeSyo8NP9QxaKmBN
 bte/3bMbM04EUUsIlz5JXu2Sx7N9Y2706GO2mInj0vgZ0cBlGSnTeExO92nCV+P8EifpbVd0XS2
 lDl5adPlggkzgWQX4ZybCYQgfDD0r2SNY/vIpxD1AiiNJGLA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop two extra blocks that sneaked into SDM845 and MSM8998 catalog
declarations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      drm/msm/dpu: drop LM_3 / LM_4 on MSM8998

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 14 +-------------
 2 files changed, 1 insertion(+), 25 deletions(-)
---
base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
change-id: 20240904-dpu-fix-sdm845-catalog-287ca4b72048

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

