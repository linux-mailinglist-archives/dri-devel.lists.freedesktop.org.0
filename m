Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D27B1A60
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3D010E61A;
	Thu, 28 Sep 2023 11:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF8010E612
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-504809e4494so4785450e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899801; x=1696504601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=ZRqIMmSu3ZTT1T0i5E/aMzp0vpYgtdRW2qVGICLVd0VH3RfPgrVf8ZQA8wAk2TAnBI
 0Pb5I40hLzxItspyd818c10mr7X/9b2Wdhb6mW6pCjX5XsQEw33pg0tYMGUg3366XcTk
 AmlVu6ni/5Pa8NZhzMy2tLLbD4J10gW12pAApoebrk6m4vg6AIziGbev88+cCpsdTFYd
 /fIqWCfShDckUiL98aADr5f3esS/OkqaMUFhADBHUcBRR6zv8EHveafu6GiM8xHTyZE+
 GT8l+SDT7VHcK62N/WAFUR3waKM0hkhJbedztGRIp3OMwg93ASzpahaQIZb4a+s6Qafd
 HJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899801; x=1696504601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=gk+v9G5D1AvWzCUsGBwFr5bMKEkXCvkR0sHUV2WH1A4tGOKyGk35vWbdAjBA8nHM+D
 Xqb4BFQAb/922hZyiUtlenXumJn1+U0shNN5rdpmx5H42eSn40KL/4N1xifIm1mC/SOk
 AKavH5WcTZV4BxcOXTjZ+W77wrNSD8hhAb05D3RyDLMBy83Emsexuy36aGbDFheACeD8
 tUw/0QVJ92odyjDN2fhnjZxjK0Nz7vNKVrVTu2TdMxPbyZX99LeviCLjxRe9S8ORkTVU
 ORtvIfJPZcO41PRrp2ICmO7pWlNvfBUfLktPQ8799HsMf1jr10fK+1cZXoocLLbGF8s/
 R97Q==
X-Gm-Message-State: AOJu0Yx35Rft5XE9jNIUXw1Lk2OjMQppliFOvR1px18NzMXDF5A5D9ux
 pWUilxCP3EW+rqPcSZRzE1cOHw==
X-Google-Smtp-Source: AGHT+IGJuLOW0z+nyXsjDWy/AhORRPbvfkWB2Dltrt556qDZ0CEwO2DNjEzeGytc0iYjtCSew21T2A==
X-Received: by 2002:a19:4304:0:b0:4ff:7046:984a with SMTP id
 q4-20020a194304000000b004ff7046984amr733375lfa.7.1695899801373; 
 Thu, 28 Sep 2023 04:16:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v3 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date: Thu, 28 Sep 2023 14:16:26 +0300
Message-Id: <20230928111630.1217419-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f9293f7d8f34..bb10b35194ff 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -141,10 +141,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
-- 
2.39.2

