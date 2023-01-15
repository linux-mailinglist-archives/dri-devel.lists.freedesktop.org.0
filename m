Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD466B10F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 13:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D856A10E0DE;
	Sun, 15 Jan 2023 12:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD8510E0DE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 12:41:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so39260370lfv.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NNWyPfscA/NuHJHmZQjpSPIoHVjgZDvP+Ju7BCFKeR8=;
 b=qGqRA39zMsMKs+oKHldZM+tNFHve7z9THNoEMPfbVglKoJRGSmw2TACARP9WH+jyTw
 2FHh7foZg8ZW1tPcu22k3q7E32YdIvefChs7w15XrFewT6N7av+WOhrcLwHmjrDtwOgH
 94ZJkq1FT1y6wBhkonkRvh3m9h9mdmm51v70DcgjfyMhFqaTfnB45pxbeb8/QICk048d
 lPXAF+iw6AaPzZf2GjCo48kJ2JMfM5hUSguxYlE4W1dov5opc0F9n9h7PiYAE0M/WwmD
 JSQP7UXidwKNfFaEHRlqIJZbnirvo2/4JQeVSPcMtRdu6u1pmUiLSO//SwH187lW+FMU
 wyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NNWyPfscA/NuHJHmZQjpSPIoHVjgZDvP+Ju7BCFKeR8=;
 b=YpctLyHR9oZvn1aWbUDSzKgHWpGNXS/ww6FI5pyE4Am6p22Qph/jdQSTotUpIz5xYW
 9I/OimxCWWYyoe65+LyOHnQLPzgK19V647Ls6tsBSfNyFqzSY/QtMjaEG13NVwajJFZh
 p06JDguhWKpy1oT6VG0QqVEEsEOL4nFUCgjav5x/z1FaKu9oQHukKszgCv4T/NlG7R9u
 ebJt14Q3XTezOZFj0iouxqNvcLpcxc0BdNgmHlIzb7XwIPLZfGjErG2DDKKQvcjcwlw5
 tteShiQBog6aclPMgHnqTwPPnN2eiALNzjVoZlK7/gs4EEghEwRCf9yYi1VAmDMfmXWu
 tT8w==
X-Gm-Message-State: AFqh2kreNKfEJlAzQ0f1xK+KxIis4ZpuFtTwMZN0yyi+BNDCCmtlvPvw
 tChybgxB/B1bH1M1yjmRDNK4OQ==
X-Google-Smtp-Source: AMrXdXuEtzFGi7S9tuf/so/YhH2yU0wR4wrvqBijQ5q47uzb8qSH1+w0unQvNQD7JbJUofp40jVhsQ==
X-Received: by 2002:a05:6512:3769:b0:4a4:68b7:f86d with SMTP id
 z9-20020a056512376900b004a468b7f86dmr29814695lft.17.1673786515322; 
 Sun, 15 Jan 2023 04:41:55 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.85.102])
 by smtp.gmail.com with ESMTPSA id
 22-20020a2e1456000000b0028559373a31sm2688243lju.112.2023.01.15.04.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:41:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Date: Sun, 15 Jan 2023 14:41:42 +0200
Message-Id: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
planes). Correct corresponding SSPP declarations.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0f3da480b066..ad0c55464154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-- 
2.39.0

