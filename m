Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2697BE778
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A64410E28C;
	Mon,  9 Oct 2023 17:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2710E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50325ce89e9so6108867e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871500; x=1697476300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
 b=V3J/7bJdLO/tCT40he7J3HjsB0JYmdJXjNABBa29ZZEGQX0+2LG3LjUjynwKM8ZA5W
 KPxQrolUz3moBCJGbRVVDzqXVij2MBfXr6rwfzOA/kgVbmqODQWvg7/IQlthKisytDx8
 eQGAUj6npEWNNxhnY4HqOzkMCHsao4Xm/+Gq1/U56BRfw949me2uwDwMpxOJ8YqMiQpp
 5lXzQ2TkRJ+mgRa//THNUehip9HArcud/nTBdHFBgT4UIkKL0Fl3EUf0nHDiOE6os/aE
 aPcsQiXDVqw2+t5EPqelNVVd/T1ffLs+dPSVQA5eld2VMrLRmzUqB/OpmgoPfsDlUuBp
 4mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871500; x=1697476300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
 b=v63DkP+3+eqM4MU3pWLaWTnPfNv+KSOf0x/hLvKmBYlmWbb2m1EQPaahCS1Jh7ZQVh
 ZTJymLAEbuES/Gyz8IHtqXODXQD+SJwQl+hZsAkb9aEe81fQ0dTWPvvGx0VWz2uZeb7r
 d6tZGTtHFqQDbOkzRSpkSwQgmpjT2htDhjRBUeQ6IPM+3z/2rXrvAdtEBck8auGBpm9T
 oT8UmdVbtJeUZn2mmq/qrQqzEBFQh1IwSDZt232pkfIHPhh3IbaWGdKjGrbzeEixeUO4
 sNGbre3iFftqBoL4gJuXwXzq36FvV2bXnXXYmzCY24Zz0x/gXbvTdrPOtIDS2v03kzZ6
 55VQ==
X-Gm-Message-State: AOJu0YzvfFQr1wW+6/SftKqLV1lR6S4nvLQZEAGUz0YKK8A+/F+gqOFx
 d7O7QvtAioTTdXZehy801aHI3EZGgwOQ0LAJmBgM8g==
X-Google-Smtp-Source: AGHT+IEf//wBEmW4CzrPJydxJldnlCzJv8ir8rAarHGZky2u3mCkBKCaeshO1HnrkGHVAEXnN+ATjg==
X-Received: by 2002:a19:ee17:0:b0:503:2891:444d with SMTP id
 g23-20020a19ee17000000b005032891444dmr11904188lfb.64.1696871500325; 
 Mon, 09 Oct 2023 10:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac24c81000000b005007e7211f7sm1517748lfl.21.2023.10.09.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
Date: Mon,  9 Oct 2023 20:11:39 +0300
Message-Id: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
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

On sc7280 there are two clk bits for WB2: control and status. While
programming the VBIF params of WB, the driver should be toggling the
former bit, while the sc7280_mdp struct lists the latter one.

Correct that to ensure proper programming sequence for WB2 on sc7280.

Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..9195cb996f44 100644
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

