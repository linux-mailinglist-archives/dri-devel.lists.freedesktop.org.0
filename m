Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185336DB7D7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 02:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026510EEA5;
	Sat,  8 Apr 2023 00:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4BB10E0A6
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z26so15737lfj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
 b=Sud1ba3V80zlMu15MHeHOKh+IoaK4BTQoaVu0tJmIvHs/v4vfeZ/ZiUAGnTizVOaKi
 9PmZ/Zz5Wvn2H5B3ndPeh7yErarwikM1hcuA1xgJ/MgDd8lzQfU9en/k9Vi0hBtEkX8J
 XJvvdSScgpEWHdCp53B4D2uDxeOeEA9LG3xGOAmv5oy1yTZ+OddY3CqHvyHoh5JrkAhz
 1x8xvsc84P0HvXOULo1ckIPdllyHe50x2iH5Zn2CcpsqmkgoEG7g1fwH3HRhKn3+XyND
 r3BzC2GIA1LDRjJTO3iUTpLIGHUl212Qxe4X9GxFFY0OnklODn6BoYeq5y5katg0cK6E
 hUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
 b=GeCq7sMcrxmwb4C9t834Gg35qpPPz0GLkxUTpm6Ly9VJsRF7MfbR8CSV6qze03pkaB
 4+r/pnAt4y7uSPQQLGdBPSB3ccSAUJnJlXEeestJ2R+w2yF6bNvAZoeD3dpKR6UqyHP9
 pyPE//t/Oo85EsSy369FHj1K2JfDYUAU0C5yPE8tq8NSzDAqVdkBOHTUjySyA+BlfkoB
 kcLFmh4mc+OABfzWKTDep3ERSyQgV8x6fpexVVc8fevID29KL8iIOxExypqwj1PI0lIC
 ALUdWwGOSO5SwlWM7g3t/tkaM77K0DiFYEmK4qcDS3mjyAluYrWlgZ+H1JBiuB21cpSf
 Pplw==
X-Gm-Message-State: AAQBX9dto7T57QQ4zb1B6yS9cCf8ocpI6Q523YIGFkINPHxbunWvasgi
 8Ab239ogz8vZLlmZE6MUu2TaRA==
X-Google-Smtp-Source: AKy350bSxb9AOIbCsP14Uq4g851N70Ma4fNxTBfkT83qLqUK5dF263XCV2Dyv3fOfpiZXi+t3qFIxA==
X-Received: by 2002:ac2:550e:0:b0:4ec:61b8:9480 with SMTP id
 j14-20020ac2550e000000b004ec61b89480mr94440lfk.33.1680913672461; 
 Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 2/4] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date: Sat,  8 Apr 2023 03:27:48 +0300
Message-Id: <20230408002750.2722304-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b426..e111ca1f4bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.2

