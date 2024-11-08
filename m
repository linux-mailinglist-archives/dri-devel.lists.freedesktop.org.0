Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4349C1313
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 01:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CC710E911;
	Fri,  8 Nov 2024 00:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iY5y1pug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154710E911
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 00:22:14 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb58980711so15349641fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 16:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731025333; x=1731630133; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H3tHYib9bOsjsCSxYQbmNPxmjHFq56TfU4OCDc5PW2A=;
 b=iY5y1pugPcMHUi3j2p89i5DpYdFBfNvJsNODzf+/R9J49QVwtYAaAdxjtV+7LktIrj
 OoCJbzJ5kbIXZMFtjJ4nW1Poo0BYWd46WElS0vw461K9n0tY2ORSoIW3csvPnRPLI++b
 SE4bO+wC+BbwiNTg6RA3OMVvKgGTW8vhQkPOGrRPYf97WkLcnXFGaIGQlvfwQDm2FsEA
 +Rb9Uqlnss4BSRX5AZFgZJH0CKauaUFVIaZOV1VVa1nOrrBhna0sebhv6roIPzWInYZ4
 bQ1cZxIAddi73KTPqrSnwCug/ct6lWyyA7855B2KaIwT0dGy4zknS7S24aRxue6e9a0l
 EFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731025333; x=1731630133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H3tHYib9bOsjsCSxYQbmNPxmjHFq56TfU4OCDc5PW2A=;
 b=W8FsfSrjxthI9xQYYnzjvl/fcSb0VFM1n35EftFi0BgFeTph9rZVo1UHSUblQOJkBQ
 jHkVF3dmXpLK6oaHx/vCxxwq7ZUOPwcivcnqKVIepqyA2glBbi6/oV+UYbEkvO+lUtd3
 SFI5Zpc0kZ58IHywHZ4U/v1oNr670WcomrIcB4lB4IAhYusMjm6X6RN4BkWh7WVV/8eG
 aVKlsryiHaiCFLV9oR7Cm8wxgwYB5KaMj3BYWibl9ZN6kSiFaMBZeyTBng8c7E2ie8/q
 f6OZlGIxJcy5ytwKXMyui8UbGGJvgKXYt79gnQDcTo0FBIdahRzMqnjNrYNDlMsRn4zN
 KfDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdGT8m3jjjd45T8EUVWljlwHznyUeRl2tIEx5dSwj8G0iB1TmGLET8d1U+297wgn9zhliir+EzoWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTQh8BBNLXiZ//8PXEOBjYIbJdObjaWhlAqiRZUAmyW5BvUB7O
 rqvur/CSOcky0moBjFf/wbb4jGsonVG38TEHuiiUy09oWHZXOob+8aTkT0OJ51I=
X-Google-Smtp-Source: AGHT+IH7NpwR+EtpupNJY1T4XFQnZfGFyrAFdQKX3vDkAZgHm3HUYKz++E/GmQxGdczzNngFriYsnQ==
X-Received: by 2002:a05:651c:1589:b0:2fb:5bb8:7c24 with SMTP id
 38308e7fff4ca-2ff20152825mr3776181fa.8.1731025332771; 
 Thu, 07 Nov 2024 16:22:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 16:22:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:44 +0200
Subject: [PATCH 13/14] drm/msm/dp: drop struct msm_dp_panel_in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-13-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+MBwJhJ+kWsOd4zG8stBduLkJa3ofaC7qfvHFVuut/U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmQ9emA0NkGmbuBJO5bIw1pGCdfRbWpJGcGv
 U6PeakRvW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZkAAKCRCLPIo+Aiko
 1YmnB/49tkHi3iF28qy6bExEcNimP6jsHsacWo0NUj1XuyiFiP3oYDLQGvFLZu6s2PVL23RU5JE
 9JsdhEpt5pG7SZ6KjqSq7PmnFiVVxp36o1q3JISx2UBwZrYrASwGaxkOp0Hq/neGeAulv0kxuVw
 zAgk0d2PPqsxnPfELVHoUGbjIzYapnTA9JdRxtTAziRCJax6tem27cmRrL6X719xDSc+Lzx3R/1
 ixy49WLJ5DcCfUvEyfIvFeiyUnY5j7JugfHm/R4mHFOsRn3Pb277Ew+mUhvl7XEOxZa5WcsA+un
 4ltybwYS/VxOvjhtMxdGtM4/9ClixltO+HR2cIos04m2fnnk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 72a46e9e319486bc4ec1f5c842d733bd55ce0a67..8f8fa0cb8af67383ecfce026ee8840f70b82e6da 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->msm_dp_display.pdev->dev;
-	struct msm_dp_panel_in panel_in = {
-		.dev = dev,
-	};
 	struct phy *phy;
 
 	phy = devm_phy_get(dev, "dp");
@@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	panel_in.aux = dp->aux;
-	panel_in.catalog = dp->catalog;
-	panel_in.link = dp->link;
-
-	dp->panel = msm_dp_panel_get(&panel_in);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 58045d9a52e9a4d39362c3de623fa34acd5784ec..6e6dc3169e9c2f84273e599100602583550f521c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -549,25 +549,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!in->dev || !in->catalog || !in->aux || !in->link) {
+	if (!dev || !catalog || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
 		return ERR_PTR(-ENOMEM);
 
-	panel->dev = in->dev;
-	panel->aux = in->aux;
-	panel->catalog = in->catalog;
-	panel->link = in->link;
+	panel->dev = dev;
+	panel->aux = aux;
+	panel->catalog = catalog;
+	panel->link = link;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 332ac79594e71157e2b087dc5268c50a87993d83..482ead77e7c01e6d611dbdce37f82a8dfbc4e3e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -21,13 +21,6 @@ struct msm_dp_display_mode {
 	bool out_fmt_is_yuv_420;
 };
 
-struct msm_dp_panel_in {
-	struct device *dev;
-	struct drm_dp_aux *aux;
-	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
-};
-
 struct msm_dp_panel_psr {
 	u8 version;
 	u8 capabilities;
@@ -93,6 +86,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5

