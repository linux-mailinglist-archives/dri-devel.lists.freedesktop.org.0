Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C2589DC4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF54995AC;
	Thu,  4 Aug 2022 14:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC72A98BB7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:39:22 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso5503225pjr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Cts/PKgx88Htz5bwHRREhUPAzr6ZTtS1ainGsKG4uVA=;
 b=hAXIUG9WD7W5iqALC0lOOLepHnmZpvWo3twoaRhj0Q+jIBtz3GteKACI83VxprMOq7
 5+yZVTPCiF7ItmAV+FqIyoujVNjHhUeKaWpUCOEUAqZHla7BQ4fMmseRO0eZfb9dmIlI
 BqEHH1TQRXCbUGU5NPvt/w5EqnhxXjYDAo3gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Cts/PKgx88Htz5bwHRREhUPAzr6ZTtS1ainGsKG4uVA=;
 b=tJBoEaXeIcFC8LU7/Hd2qqcYVlJfZ4PuZrbVaZ2yyBcHJBmYIRXXuEoZ/Ok8pxt+2s
 D+uoKhJZywvUdj7pw0CsbvLWFVnw6FBAsVpV7mVbyajGVbOYMiMXcXyj/Lq/oFTofrcB
 xzLLbPPU4WZMRbLX+CfBgzGgdE1Qqb3yybchIG6ntrJL3oi4ExXwgg/Tyy1nRJ/rOgVH
 agDygREOdcaeRSDPRpZsDyKo6V4mJexVRrL3iQyhxqwVHMpVx2AIh6SzXTJ2Rp5II6nm
 5Gz9qlWAdPs/2gLCqrgWk2r0FhlyvMgweWhIRCjjFzfxQRFZalNGWVvCgce87sdLCVWA
 YJzg==
X-Gm-Message-State: ACgBeo3Xj4jUZO7imDxSTyDw8/Rp4doLHJuDoRuvIwcTcMtJQ2m3D50o
 cuzCGGM+1aVkzE71MCSyvlzzpw==
X-Google-Smtp-Source: AA6agR5sBXQVAnukxwGcxzgyspaEhrHBLZPvphz69CDD+sPPqhMWa49dsLI6faFdZtJged8TcAb53A==
X-Received: by 2002:a17:90a:5289:b0:1f5:39a8:ac3b with SMTP id
 w9-20020a17090a528900b001f539a8ac3bmr2452198pjh.115.1659623962160; 
 Thu, 04 Aug 2022 07:39:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aa71:2553:6f54:5cb1])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 07:39:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 2/6] drm/msm/dsi: Fix number of regulators for SDM660
Date: Thu,  4 Aug 2022 07:38:49 -0700
Message-Id: <20220804073608.v4.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220804143854.1544395-1-dianders@chromium.org>
References: <20220804143854.1544395-1-dianders@chromium.org>
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
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1 regulator is listed but the number 2 is specified. This presumably
means we try to get a regulator with no name. Fix it.

Fixes: 462f7017a691 ("drm/msm/dsi: Fix DSI and DSI PHY regulator config from SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Correct the commit that this Fixes.
- Use more gooder English in the commit description.

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

