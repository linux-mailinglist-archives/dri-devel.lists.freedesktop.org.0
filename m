Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E46BD503
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7123010ED64;
	Thu, 16 Mar 2023 16:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB9410ED56
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b10so2293347ljr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7TyjYiVd8H6cPP12mLuPhqB4XyP7gmrhAUkArPxJQU=;
 b=MtQZl+F35CAkxM+I5ybRwKwXdO3n6bB4W9sFDpW+BCdfVRgjldqqkoIMURzKfJZ+Mv
 0HUEnnCqMjIkVzJNnsdsURb8LPqvkvQaWjmqP5ZsA55HYznZ882JnkOtmta3lCcnSiyT
 ljFarXr781/M8RhOo2ZnC6ZVrJ/C+k7gQC8Nkh7xi1R6jk8Apf+hx1HrkRDgMZhR24hJ
 G2nZNbfoMdfITmrxOToNvWxRWTVX39I3NG84oWZVgc+9x9PM9amNWdRnu8Kf7uJoPz8n
 vGqZ6+dXbWRXE9LzrcE29Hb1GC1aelCq1+f835Yk9ngNrVLzDrlIzH4ANiSlqPrJW1Pe
 6UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7TyjYiVd8H6cPP12mLuPhqB4XyP7gmrhAUkArPxJQU=;
 b=gU/5Fj5HP5vknou6GrkphE8vTcBMzBGFWOPgKDoq9n5/UdDS6Uq2TWMIDYlhRhjNyf
 hnqzud48phzllEuUDzZipk43fnB6g8BmPm2liG+ulKf9Dtbi01FE5v877pk9YQ3v0DCG
 Y89OpZM3WlcThhvTab15jBkTe29Z8W/OPrdDmPQLaZoi5MRiTWqXdIAdn3CayRQPLUc/
 dc+IrbgrZ3pxUfpEzNCBkgVcTl1iCxI6zrkNhAH+7eF+Y2h0Or3102WTk8z4zyl3vtJP
 ow6iYrQ1QAbPBkUvCCob0oTyogkQnjkWA7oYCcv4YNsNfCz5XPJ6M9/XhDU2WrVuRYDf
 3aEg==
X-Gm-Message-State: AO0yUKX1Mi+yO5UeSMrUdab5MwAaCaBe0JaPWf4BQkVGWW7AMxRsa+PA
 dmuuUawFSaVnwcLtacBx1dIxwGqMkwqY0mYrpeQ=
X-Google-Smtp-Source: AK7set96GXTt8KQa6ogjGY6ZIbgkm1nSvlTZwWBwZGJ75oQmEWX6GQdjGmKttjQ+zXjBYAJ5rB0VkA==
X-Received: by 2002:a2e:80c2:0:b0:295:ba28:a42 with SMTP id
 r2-20020a2e80c2000000b00295ba280a42mr2126679ljg.20.1678983424494; 
 Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 10/32] drm/msm/dpu: clean up SRC addresses when setting up
 SSPP for solid fill
Date: Thu, 16 Mar 2023 19:16:31 +0300
Message-Id: <20230316161653.4106395-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.30.2

