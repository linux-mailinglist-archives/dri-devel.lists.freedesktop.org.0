Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FA92BBBB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311D10E55D;
	Tue,  9 Jul 2024 13:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WKyxT1WX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73810E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52e99060b41so5554599e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532909; x=1721137709; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IVsuhaP11rLzifuOYfoCT/JsmgFit3NDN+KhNk6m6Fg=;
 b=WKyxT1WX5qBwpSKrNTCZ3KJK27dqHRB8wEtCrs4m8VISWI+gJ6Bm9h0oJv8zzo1SAd
 EPGo15AcF33qgj89cAHUHcHiBH8MB5GNcSYBRO4cIHmHBGCthV1bxeq4LoXjp2sRBCF3
 3PMUx+uYOSEThy3/sh4mlOnZafLS2NtXEQ5kJZZpA9xwC7ysD9l/o7q35nqOjlRQCues
 r0uX3BFTZvxDqEqQwCLIAYjH0iQILwJY/y0RNp9Qct3Fmx9GYwwl4Y9mIWABms3EaUXd
 nb92XXfglsIgQJsNTmh/VO5t7YLqcfM0+KjIfwcwfR09lzabnbKx8A258/V1/nxh/FXV
 Vofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532909; x=1721137709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVsuhaP11rLzifuOYfoCT/JsmgFit3NDN+KhNk6m6Fg=;
 b=ap81yInBpxzN2yKWjxxKsBHP8O0OlYApej1Kj/mwqSjt2kxzwIxnWkhQsRNa5qR/Ep
 cSLraen4nOopl9uHVXQRtnC7KPK9FISUQfNLU9dikCoaVfmoSjWDwGrXTGVFVQPnlnrq
 GS/P0uITskYc5sFr9YWUWvuIIH6ffiY9PLyK9eQkgXcicDvQhwagSUuItujltVqb5vSc
 eAapcVefIBagFTFodlXQizNsnneNFgPJqrAGXkZ7Uo8/YjFiPVZhIjjYaH80UIGD3+P3
 OOzk19GYT+FumW2suSurni4Rn+VEEdUIKpjYeD1g3OLLnz9a1p2YjjdN9zqIiYnp3Xbq
 frMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVq0ynPbcShEdBy+qX6q5iSmfjJiaPqrzKyeqc10vO8Pys+XCLux2JuEujWPyhgKjXlNdr+ACxduawNNcr08O2rnPj0QmRJUQl5ka2fUMF
X-Gm-Message-State: AOJu0YzyObuqEuPq0zFraMpQU6TGMKmt6j3JjyGTvcNNjH1lcA5JBlmG
 dfPjCO0uC2YCPGCw0gIZFQZvl7b/oZvWW9BNKjlRkcfJTcFK28oMGivzK1Otuws=
X-Google-Smtp-Source: AGHT+IEaDUQIyebHpQsxc8nw3fDHAFZgaEz1nXPH9SPNxdY+OR16Je0rKup8mDiVn9/F2IwT3VnrBg==
X-Received: by 2002:a05:6512:752:b0:52e:95dd:a8ed with SMTP id
 2adb3069b0e04-52eb99a199fmr1263558e87.35.1720532909315; 
 Tue, 09 Jul 2024 06:48:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb8e4959csm250297e87.82.2024.07.09.06.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jul 2024 16:48:23 +0300
Subject: [PATCH 2/2] drm/msm/dpu: don't play tricks with debug macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
In-Reply-To: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5MmuIH9/ptcSX8goq+NiIFoXU3SW2qDd+IHPfO869oE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qv/Qof//Jj7Pw+y0yYutVkmev9z8YY/z7xmP0Fk3LWV
 ffpgZ6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI+V3s/wzDDrWdCnywurzf
 +9I25rTUQxqHj591S21Ikv/lmOR4tLmB85VMXOFJHeea6mWCTKmbunc7rTqW6HTPcNcfqefx/1w
 sPsV0ZNm/ce7XP3MriNPsowT7rrr49z6Mkzp4Xmu84t04572XTU7tgdb3rxY2Hltx+66hzoxLzS
 1PJpcci9xg0b7YN6MoZveaKX4eR3d+ddk8e7vG5ucL590X3HFkfXShVu5RSQ8P4SzzAJbg7T3sA
 ho8zOv5XpY9qwtaOddC8yBXaCh/Cscp3shKzbLAxc4zw+Rc1wgnca3mT2iIT1pdL6ni7nO7Zcv3
 F+qfI5lus5j7xG5a8PuYtMEZ7rO207veRnHd+Pth3SdNAA==
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

DPU debugging macros need to be converted to a proper drm_debug_*
macros, however this is a going an intrusive patch, not suitable for a
fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
to make sure that DPU debugging messages always end up in the drm debug
messages and are controlled via the usual drm.debug mask.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e2adc937ea63..935ff6fd172c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,24 +31,14 @@
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
 #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)

-- 
2.39.2

