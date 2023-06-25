Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEE73D0A1
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4251610E1C4;
	Sun, 25 Jun 2023 11:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28610E17C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:35 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so3028852e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=nE9hwWDfWngVy/rJ1ATloHL2acbnwoqhkXi38nYNFRf1kqZvB71Smf9bY+b/qkrxRP
 MXwB9J5C9ItoBwkkMGNCcn4lpjlZqKXZYOy7ojITBqpz+YA0ayUBiGBnq9HlMmAGb12O
 6u3q0MrT4vlbNvIjFcH+4UMvFq3OVM9Dvw3BRFepnAVB9fEDbqIAit6SifKg1vx1xKzW
 P63sX/0OItKDxNlXzDmh7X/E/fLaWYYPXDddddvAK4XUNeaXVOLEYi+MNbGoqxV7RVQS
 zw6oboCfNTyAoJeHJ9c6K/PvkFU0vbURW6HoODLyIT5IOHXAxdyu2IgUUWmSYxKc133c
 /Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=G6bsqZmHYEaZd6v4VgHo2Ecy4nszmLtdvcSO+FUht95A6C7JbDxuXByZfj+MFn4L2i
 kxjE6SMMp/DanIBZWZrA28Bgtjdh1LMzDICibjgrTOJ3FQUBGIlxy5hRmLjhwFDW3sk7
 c549MbYWi87Myda6JEy5fexLxWBD3WpcFjkXDTRmfptERzl3F70ygKyf/5b8n/Tu0ybc
 ihPbBcpzIok2esKEpuL2U/mHcmwbW1I+bi3dcoUrlBq5yUnUp48a7ZaDetAudnJyFY+D
 Vt6shD+xquxwTf+XlRT758N1fhl/Gl3ikK0/R01bGBpRcQZjnsXkYyJx1QSqqsog+jLl
 PzGg==
X-Gm-Message-State: AC+VfDxps56f00qx42CfZIfx/sSBD6r8wrjTLjfaUBfscStD53es+KNG
 LP6E4WpIbeD1UE2KHGd0NoazpxdIkceTTcRtoIY=
X-Google-Smtp-Source: ACHHUZ42a3rY1LXrItHqP+/HoHNQ4DRPF+yUblDDgmlM5wyJNaabrKnL1yHAUQYVToD3/xWvmBDNxQ==
X-Received: by 2002:a19:5018:0:b0:4f8:75b0:2297 with SMTP id
 e24-20020a195018000000b004f875b02297mr11187764lfb.43.1687693353834; 
 Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date: Sun, 25 Jun 2023 14:42:19 +0300
Message-Id: <20230625114222.96689-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

