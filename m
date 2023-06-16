Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3D732CF9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4BD10E5DA;
	Fri, 16 Jun 2023 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D710E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:03:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f766777605so624520e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686909806; x=1689501806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8c2ugs0+tTSeY05tRDRkOekeDAonDnp1hdoOBvofP0=;
 b=dXUH5WYGyHgQvSJthS3lIoOu4zQ1J7M689xrtOij2DWQ23sWDKbHO/HNN5bAjiI1fQ
 EPtIMRHQ0yWzOhF5M7DyFd0jSyoSkhevMQ5eS3eKrrW84m3shy0J0ARkd4ug2ubw3rUO
 vDsbeKVwflxCbq0pvKJvblpgIws+rTrW1OGO7f/kf5SI900yd5z4clQmyFe/UVw13OFp
 p74LLvcaKzJdHdat9tx73WXvtp2YNcayZVZa+567G5ZGYCn4Tc/XyTAh10/o+kgySxd1
 Qtxu8iwimWZUI4ivkPoWZCDNea/7Iy7ojEsbXVkLHzdTWNYXUg2Z8SoRQmi8sS/dbvRp
 oGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909806; x=1689501806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8c2ugs0+tTSeY05tRDRkOekeDAonDnp1hdoOBvofP0=;
 b=d2xgePDMFV1jkUmU2v3fvDpKmAoY5E8AA21VWLROKTAgtYf9GeO1fxF57U6Kc8xbQS
 As1UP/tFxcQgQffrhs7N6e1XugjihmselXuq7DvMlQ1j8I+MdvgKxQhy38RRUGaaC3zb
 vcfa2O9BTlL+W1I76PMQ49/LIlTiswAJ1Npyu3FnVvFIOrQfRkjziIrwevoFfbpd5mS+
 UaLEUaZyEE2tO4GBTk64Lx30aut+ymgw4u1kWxT4SayOoP4t6Gi6uofN6v++gCH/L9Np
 GY46+Ne1DQtFfeCSq/09YAPL8dsnpITQOOon9JIvYVxlHA1n1v0TCS6b8ryVJnk4jd+U
 W3zQ==
X-Gm-Message-State: AC+VfDwDiKD4QwJNxcd+uND4ZDdkphmLWmRkLzKD+/NYBFmnr+4G1yPN
 PJtLIxQg5qzg9bmB5B2BvDXdYA==
X-Google-Smtp-Source: ACHHUZ5xs/nHOjM1XITaKKC2kNxYFOArMgsrOqgjo+NAU3+EjA8UxqP5lWiQE5oS93Nxpvmiac5K4Q==
X-Received: by 2002:a19:ca01:0:b0:4f8:56cd:da8c with SMTP id
 a1-20020a19ca01000000b004f856cdda8cmr678386lfg.34.1686909805777; 
 Fri, 16 Jun 2023 03:03:25 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:03:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 01/19] drm/msm: enumerate DSI interfaces
Date: Fri, 16 Jun 2023 13:02:59 +0300
Message-Id: <20230616100317.500687-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

