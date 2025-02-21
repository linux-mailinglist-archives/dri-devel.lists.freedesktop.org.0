Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4273A3F875
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAD110EAA8;
	Fri, 21 Feb 2025 15:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nxYYJxlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531C10EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb9e81c408so38730466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151515; x=1740756315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=weMt86XyDp4W/QQGY55D9HolbDoqGFQ02eGoOnDXEFI=;
 b=nxYYJxlksphbXw7hG82WQt6/dezayKYFHrpuIxYpNV4qjkMvx8OhTxYL6T/mhcniwg
 Bjlv0dpeeqK6Z/ZrrkRCTnrv3Ile5jbH0ybDarfBcmVzBIrghN2c7suZNY9F7KYJ1kiw
 eRr/tXTNhlXZe5siVKyVLM7QtFzahzv9zKFse0BemfHMlAFruPy+qRWawLw52BmK4glb
 qYH2Tmz2fe60n/uepfEl5jSSyL6cjE9lCZQry59gPOp0zC/dwGrDlDtM1p0DOK4k8pxR
 VffaVKl4/KFHg3BiipmFgV3zedJO7uJc92fy8wyEXf3TsWHsIww+JrYV+vaEj0dxjZBM
 MMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151515; x=1740756315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weMt86XyDp4W/QQGY55D9HolbDoqGFQ02eGoOnDXEFI=;
 b=ilxWqi4yum11zTDdOHHZETaSzs2m0SPp9R9lZpwicpq82lw4vOrQKpd1nm0c/SAf0d
 u5lMVq212sPjLTkvA1qQppFVk3XC3iWrMWeZSMzteEwDaexgI6x9rkMixJeGqZ1Q7qCa
 YPHPK349zZjaR6dtEKr7D0dCiKrHRaE4Y4uwyWIsQMDmUELI3Gx5w2khI0YOmAr3BDGn
 dLXhNJuFgVWNqJqHjfqceLcq4F99RKADTHAlXREGCAL7OgJMgfJM90BkgDU6gbOLAvfK
 oDmR09Zi5XW6c+Vu6hw5vqP+C5O/jB0EC0iOwWF/e3dZaGdqbiDAOfcoGKog6+PIEErG
 l20g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwg0wQDrUiFF4eibeVmzTtauo9AYDjvq0ULfkLPTKLYuiFFdG2ozRiQOXAu6LWp0+iJl9eTWrgyC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEY+GhuEF8EaaKi3yP5mLX9X1CrZLMnYDCiutDEKEh134WdmdF
 E0HE37twDef6kYxrXdl7248ULbWY+m00D2Wx12hsiKMoVYMR46rRsHPo9qxy56Q=
X-Gm-Gg: ASbGncshdxkEzwLHLJiDQG2/TQnWdQEdcU2G9yFvXbN8MY2PUpKDwhZab1YKbaPpZm0
 divREG2xT/l0pSeARXLbaqoDMgutRXdb3tNe1hpNpJZBUlpiAu2pWanWKEu8jZJ+72ljRIcpLXN
 3mYRSrWX6FVSVzJ04e2uhOhgzykb+f5Ea69BrmCkTxgG2VROe0yi1gg7AMNZQnBPaM3Yp1p3cAy
 8MEVeMzLicjQus7/7koC03pWjabDSp7BG9VoB5QRxntMgZHlBpFyYG+yOvprwAb9hULOHS4V9ZQ
 tbRxQP5Yr6GuFGt8QWKd0axLk1tqLQo0qU8D1zrrcRutT04QC9jgKX2iGi42XH9xC5M/0QFO6mo
 F
X-Google-Smtp-Source: AGHT+IFDyjSHRea4rX/7Aeq6JLyEZ6cRyPnq/BCnoQABDafqn4KFEHkg2SYMLI4eyTXsMPzgd2+BrQ==
X-Received: by 2002:a17:906:6a11:b0:ab6:6176:9dff with SMTP id
 a640c23a62f3a-abc096d0bf8mr152564766b.0.1740151515441; 
 Fri, 21 Feb 2025 07:25:15 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:23 +0100
Subject: [PATCH v3 13/21] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-13-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bzuzeNkiJscH5kTRUkk1PKDv/alOIE9Ky2ZYSPCt8E4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq3m3ZkqVOTreV+MsrI2OTc2gJvjgKQJixbL
 bD4+889hfuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatwAKCRDBN2bmhouD
 1+KCD/9AEgC8Y2kI3mCVg4krUXQriXGKDj7FbnnOR/Xj00wZDIzf/C1ZtiWso+kSH4H9LFr31O/
 B1drd70pD/tY20Xpm+FbvMkCPhAMw+VMdfrV+krHDDn4WM47qRj8UOUGtqXnddoDAu0lHkLjXFa
 91cxumGK7PYPXF0oli8gCk6tlWJ8/6FNisXwhUq1DBg1hQNd3g+I9uW6FvXq5MBqHoFjd0+OAHc
 Pwj7rFkqziPkcaekbgvhFwevCMcbiM7TQtUDmNmuIllJRyV7q6Wudn+rfvxfJZj7USQ2Sy7WGi5
 SKBMIFcWFy91XAw/OiDRkEF6X71SRHtyW2V70BC1kPeYDLp+laaD99M3eq0+VpI94WkKirRUBL9
 /mjCE60r6pUBRgF6lgdELJKTLFm631x0nSQdyzGMzTvuRc3ErfjntAZeNDKl4XpDxAn0pc2CsLu
 QBQMBJO/sqjXU71ZwpPK/iKmYtP/HZkkB8zta/9C4t5kjRAZYTovVqqQY7VXZjan9gs0OoTwL5/
 FnthwgNN7iyJvOEqf4/vK48ZblofSIR0Akb09ySjV/uGV6tC5sOat5jqas5lvFYZibSzO8X7cdU
 hg1gQOj4Ywhjy4IAM2BeWyg8M6nkdWemkq/cbbjcLEUbtYSjceQpgXWw/9lgiC+j0VipAcmcgj0
 x52+WOStLyzQ9Sw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -123,6 +123,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -167,6 +168,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -183,6 +186,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -197,6 +202,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.43.0

