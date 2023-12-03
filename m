Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82B801FFE
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49D710E031;
	Sun,  3 Dec 2023 00:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ED310E0BF
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:24:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50abb83866bso4687560e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563078; x=1702167878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rf74TgVE6c89NJ1rulWkzk64cOHHD6BUQbdqtDGbung=;
 b=KSqDybh+oXShKPm8oK4+11ikmjcxmtjdyPDGbBTBYj5uKy4nauHonBJJ+FC503RL7e
 tc4uA71lRBgtsPbbcK9rGG7cHhYwD/Fr+tNlodWBAK0jMfI7oacbVXR84zrwR2Isnzg1
 iVIfudorva2OsLOY9oizArFccoZqboUyEk6jWUhvlyjpYn+8gn+iLWVM0K97uYhgqBb5
 nsGnWdd7ctg8FTkuVGju7Ii1QiTfy1gRQAXoUflsBsJyr+n2PYzGob/Xn0sj3v1F3sxY
 /gl7l3OeP8Sm1OsI8ZCc7HFiOgjAojd6QikXDnnr6sXBAuIpDy/pLsh8ewl3EQ2mkmR8
 9TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563078; x=1702167878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rf74TgVE6c89NJ1rulWkzk64cOHHD6BUQbdqtDGbung=;
 b=Uk9erZNYsv394r1heeCem8GebIhi0xSlnJPwfRgng/gPi73eBGmILMy5WNReG8vOwZ
 rcwb2Vm4+VqcLfMoLW/yI+aXGD7aY48oZY5XjNaGbONwyFwLtbFBdJ8uYBlMueBt/bhd
 doMS2RXdeoOMYiXdIgj/1iRJUIuHDC584pI/ebQROTETsCDrfgJzm8CWtohTyF3FG4Do
 q8JMWXXwKJq34bHhhDeTZUO6I1O6yx6zSEFID6UfYuIv7309E5p7kBoDalIDW6OaVzeU
 umO00UgJP1jdGZWqwteP+WUt+12egdjLGt1xhKFi2HftthuoTh9WSSM4I+1uvQWWqaHX
 xvoQ==
X-Gm-Message-State: AOJu0YxpcfuWH2zqcuJ+nC6xHCHlYVMkzlxWaojmmT/WawZFfOblViXA
 zr5hrwFGhNza9I/Rid5V0e6AxQ==
X-Google-Smtp-Source: AGHT+IFI4QSUqjokUeyuXqYAWJTZ39ivWH0zvZ6uP5+mw0UBfmb0EYoIPs/r3tGyF/WQjGpLfrFb8A==
X-Received: by 2002:ac2:4249:0:b0:50b:d74e:d487 with SMTP id
 m9-20020ac24249000000b0050bd74ed487mr1337931lfl.78.1701563078340; 
 Sat, 02 Dec 2023 16:24:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q25-20020ac246f9000000b0050bbc100b90sm837615lfo.146.2023.12.02.16.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:24:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2] drm/msm/dpu: correct clk bit for WB2 block
Date: Sun,  3 Dec 2023 03:24:37 +0300
Message-Id: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
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

On sc7280 there are two clk bits for WB2: vbif_cli and clk_ctrl. While
programming the VBIF params of WB, the driver should be toggling the
former bit, while the sc7180_mdp, sc7280_mdp and sm8250_mdp structs
list the latter one.

Correct that to ensure proper programming sequence for WB2 on these
platforms.

Fixes: 255f056181ac ("drm/msm/dpu: sc7180: add missing WB2 clock control")
Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fixed the bits for all three platforms supporting WB (Abhinav)

---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 94278a3e3483..9f8068fa0175 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -32,7 +32,7 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c0d88ddccb28..9bfa15e4e645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7180_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 15942fa5a8e0..b9c296e51e36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
-- 
2.39.2

