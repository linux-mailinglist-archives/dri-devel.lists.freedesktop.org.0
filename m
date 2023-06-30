Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C574674438E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424010E4EC;
	Fri, 30 Jun 2023 20:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70710E186
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb9fd28025so3000333e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158525; x=1690750525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=kAoziV/5EUEZRZyBL62VYO/5KfJ+j5DttptKmboAgeWuVDZVQL33i5Qih7xRTXLOQc
 2f78Fv71mJx57vAK3YVQJkBB9BNsmMmldNRi2NWM6v0MQHic/lululGRa5HPc47UmGHw
 uZjz2rr8gQmg522lUOOCqXXlVwRhEM5V9r6KStLlXxH6iL7i4mcMqDEUiefTVaL0DVzb
 7VXV2xxfJOOLcun0xgSY+ZPXc5UdWZEUrVkJ/cIQStZF31uL1xjcPK4G91XSEhVEow58
 HLY6+h5PhVnI3+gt6e8ddJbc7MPHP5jdkF0kwMZ9dcffumTEQZ/b40sKkhno8TJ6UG8U
 QbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158525; x=1690750525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=a5BIfmx2u0eAN1FOsz62Bd43pTuHQ/NkxjyN+LvzXOtT2/3SSnD2FBdmaWr3603QI0
 ra094bMmMAeUXN0DjIOeS5l1GbGfU8yA/e5rQFVUn9Gtsps/5Srlr89Szn3LQTigKf4Y
 OZyNgqFVexeMtPZVMaVTXNi0R2MTsWzdHq4W53NIvQgjVkzv+9fAEjSqgV27+QJumow4
 Z1Ga0GvajZO9aqjvPD2kcpNZqJAlrmn3FtqWQWE/8aUowkTdxjADPodcMMJ+b7/BgDrp
 nDsCK5kAwvOW/MkcSHMR37meDkxAfga86X6JhylUzJ90N7kRo7ogO8C9rrCWKqILz/V0
 7tdA==
X-Gm-Message-State: ABy/qLa95pAfRt9nbyL6nIIu3/1iI9W5JLuRtxH4NP7xkx5Bu6Oj8msF
 3Sjy96M048ugbh8hK0NZbA0Vtw==
X-Google-Smtp-Source: APBJJlH7+/Tiivo+aQ56fmpNN08qXzXrcEz9E5HgbD5QQ59W1lPmLx0cun8MJdkbojYwtZJpLfG/wg==
X-Received: by 2002:a05:6512:3703:b0:4f8:68a3:38d5 with SMTP id
 z3-20020a056512370300b004f868a338d5mr2655594lfr.66.1688158525287; 
 Fri, 30 Jun 2023 13:55:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 01/15] drm/msm/hdmi: move the alt_iface clock to the hpd list
Date: Fri, 30 Jun 2023 23:55:09 +0300
Message-Id: <20230630205523.76823-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..0fc3df43aa70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-- 
2.39.2

