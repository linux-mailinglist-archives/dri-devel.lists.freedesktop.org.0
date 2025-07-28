Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC170B13B19
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FE410E500;
	Mon, 28 Jul 2025 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aNWD51NL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB7610E501
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so3578403b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708490; x=1754313290; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=aNWD51NLvoEM+QALqupC6QHdawHBSZY5iLu3uwCayx5mYkYWAQedFIzjksGXXl8n1G
 d4+eMOAep5qUgnvDqDnpkF+Gzxjl2Mc8rDXuF+dg2kpE65zSJjoD0qysAaULyxWhGxKA
 noL5M+SXRfXwLlPajQRf7VUdJ8MNf/xcbjV4OBcgbMiCZM8qQj+xwzOXLN4mM3mpEVZz
 /Nqbduiq9fy44kHr96urrI5CYqj0GD2ucQrWc3PUn9qDZVRRdQi4cU5pATY1lDH4J3GV
 59jIIM0HUdNlWLcRNIyA/FfVG4vLYO/7KijGtpDA0u2QmPOU8OjdFS+S+xVFfcpLInFR
 E5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708490; x=1754313290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=W4HMUjc8RWiGAMCrst84I4lRVFE+YCe83LNa+aEt18VRVbHT8d7fzBbk5JG17u/FQO
 hPwqbDT1iPgXGHeSuYByjeSE3hy82uzJXixvHTyS98pIUVfYSNALF8Z9VH++ZHqltAPC
 54RnTuscwlJQ+nNN98AepTbMRDrk6DaU7yM+qP65CcKuM6HpJJnn+NmubTZDSii5Q97w
 1ZiTMVDhyJseJW5yd/yfKZ5XkjQHTNzfenHVLU2r3hB4HrCh+uU6vVXxpHt9gAACmgSJ
 Qy1CWeMiqARZi/t7SQNLrP0JPyNzPwLUw+9tiS2CC36ymj+XwXIiN7yZaIdPdpiCHk9H
 tsng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPF47xr3w+1uiqeCfvn2zEv2XrWwmXnK7JJsz2aG3r4eyVGussxND+ZbbQXSkCl+Wm7FOQ4QVTpsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMgNDcZYdaKOEfBhMkDcqgVsK2HJuTQtp7ajB9WuN/WNgBn+0r
 QMQM88CCVgIZYk5bVmVF1kp9EwmluJe6WQASgKQ9KFRuqkO20xzfeYG4/zgLLJlSSoY=
X-Gm-Gg: ASbGnctnJxoSUsmw2LYliicTQhEYXXQh8EXoqZ2vksvabIu4NAxakUdrbo1mA5kRskN
 k71QdchTnbww4MzhH0O9VXTAarwapfl36JZo7X8Xmy/nnPLpjd+sdDJtEURUfy5hmXZhdoXyNWn
 OKEH+1jqETlQeRmgiNEWsCtnrOdyu+WaCIdqU/NvJRf6YmeCoZ+aSc0sjbbDh6FztK6RqZpaDd8
 6/ty9cR/hc9Sl6U3ox3LMyQpjQN0tgL9alsHyjuQdlU4algT3EhFXYf0w2VsSaag04WA/3JcqRJ
 AAgRVMf5iDvovBlifbhdpKh99lVRx8yZ9lbC5a8B8tlEpgyqGAETxAStt/4SIlaGd9UA/6jqU+G
 j5iIbg4NbWrT/tti5fg==
X-Google-Smtp-Source: AGHT+IFSZyRWdtW0mh6zqkbyC8Q1oMZ3riVwbiurnyWotEvGGTjq3eqwN6p3TvfIRE7inyVAAPak4A==
X-Received: by 2002:a05:6a00:14c9:b0:748:f3b0:4db6 with SMTP id
 d2e1a72fcca58-763340dc684mr16181244b3a.11.1753708489719; 
 Mon, 28 Jul 2025 06:14:49 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:14:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:25 +0800
Subject: [PATCH v13 01/12] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-1-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=lVpvqNqN4710MACSOo02aP3ML9e8AZPuQuFTAF4tkcRI2wnxVjA2Op28INXYKbd1ld2C2MPfo
 1L+fKhd1vOoAIWq0tgV0XQ4bXeeC+WHqW9SSUxJkIYV5ZBFFCECC8LH
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

