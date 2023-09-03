Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D663C790EE5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B9710E246;
	Sun,  3 Sep 2023 22:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9936610E245
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:24:35 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-500cfb168c6so1480037e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693779874; x=1694384674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XEhViKgKa5eb93Mv2StmnO1+XOdK/MONhfma/MWqrho=;
 b=wHEY7sW1OMl7geBgSbrOJbzuYBiH4MTVjq+cNrGqMaPQqfhzJrKWK3npyJIIjEV6yz
 4qwDBFi58iEwmTCg4kE2ZDvZ3bx0TWYdyxt0RgYQh8aDlkAMU6xDzyzm3BVCptd1GsCl
 wj7SXpEbhBEQEZkYTCL+dM+OgFNLYMKGkyjttlCOmui1SiCdn12fDOyRzWOP40sRSToY
 auzLGf2cIs4Z/ZC9afPHY0NwOq2xoeAwP9Kaz6XKaBNWznAdVSz2TjsX37FlrMmNnTGc
 UF+XGRTUu8wV/wHrcKxZv0BOmtSy7kb4vvXYWZ0eoV/2O3eOCqtojwqHC4D3IgI6tgh5
 1bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693779874; x=1694384674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XEhViKgKa5eb93Mv2StmnO1+XOdK/MONhfma/MWqrho=;
 b=M3hqOWSfli/UAt5ZEoonr+1gReLLR5OTbf7m0T8IKCDGY3dPSoDryT/U3YwuV0SGiS
 heYMTv6scFY68T+A5pKzHl2YatRENzXXz+leTnEQey3YbMrr6L+9Gju0AV1fOtyOdSkR
 ZYEGdhNabjCzez6kocUTYnYq3UWrhNSBYFVHsZlyoG4OXIM+v73bMgQ8ArtzYO0wOZi2
 6FWgxxxRzgPllQhVrLN2qSBudWH9KXPr9Hv/UucEgyS2f6oIPfuONB4gN4sG20TdawtT
 CQEybyRYoNvKOE/2k9PmhRAI2jOeSPouQOlYhwew0hR3hrCL3aMAVpOrmesd257Gj7ho
 ZIEA==
X-Gm-Message-State: AOJu0YyIZ5IlOotFU1tlFtpIMiqpc0FZQBFkyA/n3wwAIN4pHhIfUL7D
 CCHb6qafsSl9R3mqjyYozXbyeKB8GJY9ToS10qM=
X-Google-Smtp-Source: AGHT+IGkVndOJyfxDqGt5dFZj8GwhNu8Z4fdUL8ZicnKvKTPy2GOhiAjh3VrKANhrIbX6uo1IKua+A==
X-Received: by 2002:ac2:5383:0:b0:500:ac3:dd77 with SMTP id
 g3-20020ac25383000000b005000ac3dd77mr4974529lfh.10.1693779873773; 
 Sun, 03 Sep 2023 15:24:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020ac259cb000000b004fe9d0a417dsm1421016lfn.185.2023.09.03.15.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 15:24:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dp: support setting the DP subconnector type
Date: Mon,  4 Sep 2023 01:24:32 +0300
Message-Id: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
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

Read the downstream port info and set the subconnector type accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Dependencies: https://patchwork.freedesktop.org/series/123221/

---

 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 5 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 96bbf6fec2f1..8abeae658200 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -372,8 +372,12 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	}
 
 	/* reset video pattern flag on disconnect */
-	if (!hpd)
+	if (!hpd) {
 		dp->panel->video_test = false;
+		drm_dp_set_subconnector_property(dp->dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd, dp->panel->downstream_ports);
+	}
 
 	dp->dp_display.is_connected = hpd;
 
@@ -401,6 +405,9 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp_link_process_request(dp->link);
 
+	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
+					 dp->panel->dpcd, dp->panel->downstream_ports);
+
 	edid = dp->panel->edid;
 
 	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97ba41593820..1cb54f26f5aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		}
 	}
 
+	rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
+					 dp_panel->downstream_ports);
+	if (rc)
+		return rc;
+
 	kfree(dp_panel->edid);
 	dp_panel->edid = NULL;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 3cb1f8dcfd3b..a0dfc579c5f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -36,6 +36,7 @@ struct dp_panel_psr {
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct dp_link_info link_info;
 	struct drm_dp_desc desc;
-- 
2.39.2

