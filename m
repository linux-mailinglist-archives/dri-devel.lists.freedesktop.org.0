Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF7588470
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25BB987B2;
	Tue,  2 Aug 2022 22:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47697FD3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:52 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id ha11so15137939pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RdEXt6lST7n+LoKcJt89muoRfgacXACJbMNMi2diRZw=;
 b=meEnV6SKRxCATViJTGiI8yRisfitA/Ifcie2bONs0hT2imac/Ft1IIspNYJbX9Mesy
 AnXseRu1Y2GlCbGVQG+OMnMhtPuxW/Hi9yVjBpMAsTPuykC0AcVBPE4NtgnN0tIoHnUE
 9nDDRaQpVrMjnff9i0Puon7FVq++R7V4cSP/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RdEXt6lST7n+LoKcJt89muoRfgacXACJbMNMi2diRZw=;
 b=lI+UrkYrdF+WN/pqVEnH+l5dSZrjrNx1LgtwGadKA1ffMNoJx4hjhtEKU4BaKHzaG1
 plGkPna8WmCJ/Ev03lvsBwrb3+eYyodw1X6N7gMGj/ybaNaeYIgIMrs8ky9i8CcYfYiA
 y29q7ZgAIVQ45F5wqM3yCBK/xVWOuRvEOM0LxmtJXDmkgqzvNSJ9G3N9GtntGl1F8mJo
 bI5yZVeyzN0yr5E0MZTWC/Y5M66EmFXfKfYzg8/MDL1bLgaLk3Wba7rRjMFNTtCe33cI
 vHJVBhoJwZojXu+5GHcgM3Ez9ki05U65Q5KCdumNBAI+GWDiUuC7a+7N422ww+Lo8cUp
 bZPg==
X-Gm-Message-State: ACgBeo2nmP3sFAiOAhg6zSWEPCZXFk2FOKvCi+YkFOL3VTdfQSxaQwk2
 g5Wzg4DpRE6nw71Y+ARS82pm+w==
X-Google-Smtp-Source: AA6agR6kwuvP8bBPDHcReSHv/U+3Fz0f7n7zbRA+IblQ1fr4TmASpT5VeILMORInZ9BsNAd5WoxSOQ==
X-Received: by 2002:a17:90b:1e08:b0:1f5:1f0d:3736 with SMTP id
 pg8-20020a17090b1e0800b001f51f0d3736mr1776097pjb.58.1659479871969; 
 Tue, 02 Aug 2022 15:37:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 2/6] drm/msm/dsi: Fix number of regulators for SDM660
Date: Tue,  2 Aug 2022 15:37:34 -0700
Message-Id: <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1 regulators is specified listed but the number 2 is specified. This
presumably means we try to get a regulator with no name. Fix it.

Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.455.g008518b4e5-goog

