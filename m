Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726556FC79
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFD8BFFD;
	Mon, 11 Jul 2022 09:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82118A583
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:43:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu42so7821928lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+bbIScSwkF39w8SjB66Rxemw/+fmYIPubKn0cG6DqE=;
 b=JP2CQ4kiLEjfYNLDnxzWUxSOAuwxzy77NI3Y+HKD43X5nExwOM8zydY3s4RzJoNIq7
 UhLpz9Mh6+ugTzYfH8iY537k6CgYfUT1XTDETin1ZPrAZJkBUiWP/Wz3CJebi8viwvD+
 LjPiXNEorR0jmGriscdyorfw+us1PDrOJJDNx1wMr6XQfC3UV2dk3YbZ0IgCxSY7BYl1
 xZvH/Cjem21N/xI/WFQo1pEpJUlbPOFOabaqlhs4tJSofdeUpQUHCPeL6jNFJmQka0AN
 Af3aRQpib+AGRDOUckimOc40yJTR7ImELEYSeNvCAOWR2UOk7VzZ6pC4SSGDhO3+P68Y
 IFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+bbIScSwkF39w8SjB66Rxemw/+fmYIPubKn0cG6DqE=;
 b=6RIpyyCumRf/O8SQyy9GidyDzOfmqDApbgUjUFipscy/zvVIaLhsQKkZSvurPdzjY4
 WkJt6ROJikdceUdVLUetIKRD+Mvape/0QW+h2U8rUZwzrf3zcZHy2VDoCCoyMfiXj+US
 VOknnjD7Qq2myDOCfK9J5sn9dsT4GLLw9glkmH68o6D32SBa48SQCRR81UA5t2aSWBcz
 ByCQibHvkoWXtWVe5ocWjSvFKomq+32iP+7st6sCM/TzezFNrCBaXQPxIHWkSkOxN9Le
 Ng7OVs93kwGjXF+/hN0998OVRmBLrc+f/BqPr9VoM6ZSZ6wGRclkC+wqTWHBL/oad62h
 +rSA==
X-Gm-Message-State: AJIora8U/k3mYx2I2RNwwBVSwvQtl7+MIDT5f7A9uYWb9GOAEoffi28E
 vN7+RYhxZrVpBfURjHZW9pMoYA==
X-Google-Smtp-Source: AGRyM1vXAJvUBpeIJcEyKqCyrmrSYJmCKbDvTwh4T6xxymuMObae44zRqBKfocePy2IzUO32kt0m9g==
X-Received: by 2002:a05:6512:b8e:b0:489:dbf4:e6f5 with SMTP id
 b14-20020a0565120b8e00b00489dbf4e6f5mr3688613lfv.612.1657532604217; 
 Mon, 11 Jul 2022 02:43:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:43:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/4] drm/panel: drop DSC pps pointer
Date: Mon, 11 Jul 2022 12:43:19 +0300
Message-Id: <20220711094320.368062-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Complete the move of DSC data pointer from struct drm_panel to struct
mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_panel.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 3a271128c078..994bfcdd84c5 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -188,13 +188,6 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
-
-	/**
-	 * @dsc:
-	 *
-	 * Panel DSC pps payload to be sent
-	 */
-	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.35.1

