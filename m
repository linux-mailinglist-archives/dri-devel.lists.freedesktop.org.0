Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE4AA4C42
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F358F10E7C8;
	Wed, 30 Apr 2025 13:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hjrzv1cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776410E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so260080f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018085; x=1746622885; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G56fwlkHV3KB/OxnW7J+564mnIXMTid8vWYCOTPTaNw=;
 b=hjrzv1cfxAksPo394MKLn/x94M8U5EMyH7cC++cHz8v3Pzv0FQgedmIqNCU2Kin75n
 s2VY0fb7YCXYERHluPp2UGndybyMI2e/1WDJ+rd3dGaa9ZNNxPatwXXdYcr6Rzs5wF+T
 L58VLarShkiO+X4rH7GYTDHfwk0Uj3678DDTtfKK2156B9Tk24n7Bd2GOy7W9uj1uQVX
 ZJUjgo4yvzQd4o+5jgwNbFkRGfYtKTB4keBdLYduJTMQN2BlmNhS1nNVLPJZU6Xu26lk
 2QMetASi8AxX3Iswa6pIGsUiwKApxRWLwpnaBMAmr/MXDh8r+8QuplZZXFKMlvzRlQMk
 3XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018085; x=1746622885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G56fwlkHV3KB/OxnW7J+564mnIXMTid8vWYCOTPTaNw=;
 b=B74EhnITb/z/BxFeK/dNrK2y5c+ZalFseqyymPbSDzBtcdXn0xmYxlpYrIKQ7kMmv5
 O9zZdtcnu2YRR5myeMujD/4kCMiyfdKXvGrCmY7W+gwG+odhxQuACw9Ae2pbUIe4c8/a
 NdqFkNq3okrziPZJkpZKTI4ywIszNMq5msW1Oizon/27lLpYwODTnS9pFsk7LQIMGUYw
 GaxbxwDQci5+hcRnYvxx62TcEZxuU5Jzu6isDA/KVURzx/YB7/vAE8E/p1hCNZxPhYDU
 m0TLMEQfSiCRhILOZCl5SwPn5acP8ABhtR9wmaPGpTBKdBgDT1bU/g/O/uuY3xamz3ae
 7+9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtBPzEHt/CRH63ohC4mzmCpF+oNbRq+8rAZms2XK1HuYnsauS+18NHIaP0Hdq1WI4gyECw9mBdpmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN5UpiVn59F/qp3xDRXBTZIrRjoLR9+4FGFmAIIj+Ph0Tv9zc3
 E46l87WG3i9+TT1Ixe0Q5DmBiyQwwMz3uPwhAPnEewI9enUsa7cQ1WIcWhYxSHw=
X-Gm-Gg: ASbGncubXvZaEThDALABLVtqiJhNFDw/aGdskA7/CmGENIWK7Ayh3w9w1etvNQl5PcY
 ts0/Xz5hnIEPL/MYl/sMljJYAVXPf5oaML1YBPbDHZVaYUjOWkjpbNHZeNofl3COxnzC57HGjeF
 qxHUzrwG/RzoPDdSwmZW75ASfra3XZMSmB1529xoI0Hh4RSGL3aBjShYRnQ/yqtwOtc5xVs0U+0
 jWnqjPpEbUVpRWOnvmTf55pbK9kF1iQtrQu8k8BaMLrn57MyAikAobXW2hUu0Q6KVrOQF9kLdBz
 HPzgLr/s4wxngxcg0bld/ioQC2wzHsdqgxM1uVe1GnWyNPAuOcSEpDhk5sY=
X-Google-Smtp-Source: AGHT+IEoUWvGWdL9QLslZg4nZPiix459pQUseyRqOjqhSJlygn4i1XIERDQ0eUIfPQB7sDh5Lq2NvA==
X-Received: by 2002:a5d:64ee:0:b0:39f:6ca:9250 with SMTP id
 ffacd0b85a97d-3a09007e507mr674654f8f.12.1746018084811; 
 Wed, 30 Apr 2025 06:01:24 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:38 +0200
Subject: [PATCH v5 08/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-8-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YdAJ+TcRpnByJCx5xiQcsqNp2ElrCHTYvszAfZ5/598=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh77fqKbDLgkpf1pdvLC6OrR5UmskUxgpr1w6
 ExjZa7J1ZyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+wAKCRDBN2bmhouD
 11bZEACazt698BtzY7JCNzUsIlW64/Sx7aQfTkM3ztdREfsCw4cVo24ndllWjXlrx1Ih5q22LI2
 470OmDJTJxPIClvhUKyi6s8NaN+8m07nbsw2DydjvyhT7NFVPacTANyn26TFJhIjyesjGmBzPk7
 hgDeLKcN+y3V/6girVQptB3xkDjhtHnIHvpyjsOk4EHMgHzp/pGrll+5Pwqk7geXlhCm+NFI76+
 KmEhoQxgfu1sO8WWnQ4RidUAMiuLQmDohPCJ2G6qmFLKS0UXld3RNaJ+ScawoUrrabOslBklLHL
 U+TXi0SqB3LE0sWFcmVyYZkNE0GP1x7SvXV7eFUyoNsX05equ3bbOYaQTT/DSZon5JnNbeT+qjW
 TPwf9AJDZUwzL38DZpmV4GZS0mwVz0nalTFxZ1c/bY+LlNvUFTa5esST25GBMVLE1KjTH/uxvjc
 zD8N3ZwtimgoC+zKIamSZzvzQ3d15FT77R7+wjIFAUAh4ZpYShJdmiPq1/gfTKZtd9qvqmnQ/F7
 CuJeAn0OorANzAeCgxFgoyDO9oGMD2vLcXAtaQqHMn3gYAkqfz0nyNrHrbaha9Bninc2LAT8TAR
 FAoVfDiOscP6sAAGYWEH1Qbz0gykWGGZpN1KQIJVjBh33kq0wa2KQKm3tv4hFBwQzhUi+vLaf8H
 pRjnfn5TctiTeiw==
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

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 862e9e6bf0a5522d3877cbb4b9dfa385d6ab64e5..3d4000611656f2d3173aac27891a51402f68ddf3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2190,6 +2190,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.45.2

