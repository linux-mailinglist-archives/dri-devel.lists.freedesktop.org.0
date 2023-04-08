Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F34F6DB7D5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 02:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B0C10EEA4;
	Sat,  8 Apr 2023 00:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD1410E0A6
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r27so173836lfe.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
 b=IzrnaasFKXy0N3jlJFdW8Z5eDspSyDGhW/GDGKvqO+BuMzlL7dLghr5KKDV69Y4AGM
 uKlH3/gsn9YMNj/KsReVKH83vrxHqCVbwcS82WxSERQM/36thUeANcKw1jm7Y9CgizNR
 qhkARizC4sEIA1xG6sUwCoOZh2pVKC283CDCLhu/ZxrfwB/lb5yBirZQm1R4J8pvYzad
 l89hiNAUZ4z36wXT6298HZ8s5PZ2KRZVD3AsToOCpirQyveNl2eJDLjOW2mgwqu6L/w9
 WCl/pCg499g0OHZWklMXevavt14ypdYp7aYSBDV5P2JDR4qhRbQ8KwMWlse2gCKFSs9O
 XwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
 b=SafdsJm+Qwnzpp5EdodQ1Keorb71JTGMV7JA9ZJrsb4Ar8fbEJ/vvNjWnfSAlcP9eG
 dhEGvgarxEk9n3nOcIFH2cdR1w1bQfwiXvr3x51wXMCYzLEQLt6s8CUKw7ZMhsvJ0QTt
 HWzrroaEECEUIYjcRQweC19lUC6V2Jx8omwnZM2gOXOg1x4JgL+sDXg/1mRYMI9iFxC+
 QECrznR25Ck6v5128gNffoa9c7s5YHi2o3lGagd2iCZSJyuMXw2Ltx/RUTGAW1MHcxJR
 Izgx5Dj3D97b3mV9JT4WdBva5U10P0lptw5ugfSJZCYa6OjuER9GV/Jk74hd6sGv513u
 WB3w==
X-Gm-Message-State: AAQBX9dVUxd5l/GzFrOzMq6Ng37kBODyhaVxl9vw4r2xlLBSP5k+rHmR
 zKq57k7zzTiVRGgPVwdYfKVEwg==
X-Google-Smtp-Source: AKy350b2wbXFMZJQfSlITNPYmwClKMG1rCnTeltJYoSbVsAPPdHkBGanUTqCiBOKl1fohmdDlgZRgA==
X-Received: by 2002:ac2:44c8:0:b0:4ea:c730:aabe with SMTP id
 d8-20020ac244c8000000b004eac730aabemr1157484lfm.20.1680913673898; 
 Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 4/4] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
Date: Sat,  8 Apr 2023 03:27:50 +0300
Message-Id: <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
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

On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
so switch it to CTL_SC7280_MASK too.

Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
for SM8450") had all (relevant at that time) bit spelled individually.
Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
despite being a mismerge, correctly changed all other CTL entries to use
CTL_SC7280_MASK, except CTL_0.

While the current BLOCK_SOC_MASK style is not ideal (and while we are
working on a better scheme), let's follow its usage as a least minimal
surprise. For example, sc8280xp, a close associate of sm8450, also uses
CTL_SC7280_MASK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index e111ca1f4bf5..221358b9892e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -47,7 +47,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-- 
2.39.2

