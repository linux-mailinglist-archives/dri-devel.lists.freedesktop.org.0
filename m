Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B76934EC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0B310E3D9;
	Sat, 11 Feb 2023 23:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A01910E3D4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id c26so19166589ejz.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkPOvEBdps48elEm4czvtOw08/xuzKzqH5bG2RoTpgc=;
 b=ECzdNEwPC5OFHCYzYtx4Om3PRM6E6MJo76QJ050QDTc8dL+ppY6kPpeI9Qy1a1sstv
 9UfbZlXSDbEv3VTAv46k7K+ouu8Ud4d9TStNs7z/7b0SLJSwtlxPV4rRIwpHcZuEcog8
 +1lYBIsoOHn4nHQgsOScC+CvomvcvfmhOFhUk9w80dE4vLgKSxT6YDL2JW8lwJDSyD1F
 gePZWfhwvbqcmIieOzGTeR6ygk0vmZM+yRgIdmUJfTCPJ3hYg2auuiAlAtI1Ui9usIML
 yCHp/7XEJ8fga6VYmCN0YyjGKM/R12uUJZu3ULF0cftIu3E0z97M+p/fqQKh+bZItLsP
 kkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkPOvEBdps48elEm4czvtOw08/xuzKzqH5bG2RoTpgc=;
 b=XrgBQhHbLDqZ8hrc0teelYnmCAyBsAOyYRsoX7avj6rnVKNuocWjAnEA2Frl5MJqWD
 kPslrWyA2ZcnE/yN9eUPP+fB2WV9M5uXfNuWerkDVZ4dMpHpvUiXSQhR99DxuyY9Ez5W
 V4s/dHROePJU7+Wnld1EZtWYKQtMQYdDFuloPZAxcbcXJTo669U/p94WurQ3rncCX36J
 FKpg0dSgxLz9MYui0l68Rv5MbH28NCesOFHs95kymnA2Rctd2CGPm6sOMJNRpwaTT0SF
 msAI9dvGXfmiaiyI9KOIcisbLcRdjEWiz7PdKurLHFnYaDOIiG5H3/1tayq/GzxBXcKu
 CULg==
X-Gm-Message-State: AO0yUKUezqUeXLHSsET7xZA1lp31Pc3mxe/lOV23h0HSQ5+nWOlC8/zR
 sHcfmOENNfp/SDyqriDfOAvcXQ==
X-Google-Smtp-Source: AK7set+x7VaFAxXCd0E4aDdaZ4Q/I4Ieu4JZ/h77alrN8e30JUDu3Z7+3pbzlchttXNlvwOAZ6A3Vg==
X-Received: by 2002:a17:906:80cd:b0:8aa:a445:8215 with SMTP id
 a13-20020a17090680cd00b008aaa4458215mr18337069ejx.70.1676157200864; 
 Sat, 11 Feb 2023 15:13:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 16/50] drm/msm/dpu: mark remaining pp data as const
Date: Sun, 12 Feb 2023 01:12:25 +0200
Message-Id: <20230211231259.1308718-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 54d706dfdbec..c983413cc3c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1652,12 +1652,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1721,7 +1721,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.1

