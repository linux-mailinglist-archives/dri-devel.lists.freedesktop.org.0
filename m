Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C04B30EA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8BC10EBB9;
	Fri, 11 Feb 2022 22:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94EA10EBA9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:09 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id c10so1695445ljr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
 b=DHUDXkodYg67FoSIT/jyDwu8mai51ctlRRP+iWjmYaBMn7H74cJ0iXyxOMtA9CdYf2
 Dvo+Ly8DjcW/FBEf1N9HChiPIEVIoKSslEznKV/Mk1Fg8PkonubmzrZzhCc9I79/bpgl
 Thahc/0zhXOY9qlHD1SSp9lQOtG5HjWGL/7dqnlFjqL1/YsiHUYByNo+6mgNLkxV3p6U
 RfL6A2HepzBInkrjkCUSYRUE1Jv0UM72YLFjGpaj3xDKQEhwOvHam0Au3aOZ3vc1bkOv
 XHog+VMigQ4eCHAfiGf5YGfgTGPQEquGI3Kk+8/TwT0RVr7WfiAoF9+B88gM5J3hcV4L
 estg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
 b=CRc465NlGM7gHufFXrromHbTcLSBxlD5WLfh4AyhWAYsTFu647MXyaszFOcjn/lxAy
 IhLFZrXFsZqtlWFcNVJcyEoIIHt0KKT0Y1ZPrqU/ww5z0EoOz/g3T/tAi47NUGGfkjoz
 kb8JOnw5BTmCRlVH1NB6PNePAkZZcS4Eq+WRR40FC+67Ylc956b/htJnq4JrJMm29g93
 njLsa9YukvtBcuQiyuYEN6O4BqLzPgSYMnP+GwQv6Y1pgFbc4RNmQFUiSKaoK9EWdKzI
 rrq78rS7OrvRp3rvItYRDUC3O7SdqL2hW51QBGIcndB98HSfxrRquaM6ZG38Wp+XIl7L
 r+KQ==
X-Gm-Message-State: AOAM532hzGZtYKY5q/uSfNHI0MjfgIbj7e2WQwYXpEp4D6dbqeX9koNp
 fSLKv4PiSYcUg0ImFYRbEZpg2w==
X-Google-Smtp-Source: ABdhPJyGY6YZViUMDnHZZ7OR3CbJA9wYqdkelPBYfJ3WWwaqTKia3n3PZZK3fvt6ud9y9cz/ZvidYA==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr2204599ljb.261.1644619208126; 
 Fri, 11 Feb 2022 14:40:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
Date: Sat, 12 Feb 2022 01:40:02 +0300
Message-Id: <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") the DP driver received a drm_bridge instance, which
is always attached to the encoder as a root bridge. However it conflicts
with the panel_bridge support for eDP panels. The panel bridge attaches
to the encoder before the "dp" bridge has a chace to do so. Change
panel_bridge attachment to come after dp_bridge attachment.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..26ef41a4c1b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
-	if (dp_display->panel_bridge) {
-		ret = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, NULL,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret < 0) {
-			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
-			return ERR_PTR(ret);
-		}
-	}
-
 	return connector;
 }
 
@@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
+	if (dp_display->panel_bridge) {
+		rc = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (rc < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_remove(bridge);
+			return ERR_PTR(rc);
+		}
+	}
+
 	return bridge;
 }
-- 
2.34.1

