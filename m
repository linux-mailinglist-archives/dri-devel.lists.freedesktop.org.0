Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAF56FC73
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BA92B565;
	Mon, 11 Jul 2022 09:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE314A2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:43:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o7so7747107lfq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3w/z7/yo1sMupnazTL2mg22uvPZzsFuBbBmtMlymg9c=;
 b=Ng2f/hBKqNH4SZPKxtojLEnsrfKMfYZ2xQ3NAq2xCE5RUmz4fN6WOWrSfP3hu19RpA
 DmoEZN5+wQYgixvMub4pFkdDUEATuX4HXC6zondZxvvwu+YWNjTNI0BvMcoMCKfhnaHG
 u6UnQGlY3RG3lRfUWkKU+CZnznZ2BnaMFrDbvj4Buet9AOWyCSOu6ccbmMcMUHkqhvkA
 h4BAlz5lBogL71ZSfk/56DsDs6fg1J6+1J/tNdew4YMBnCzdFqjAZijH54bJH8S6YOSm
 jhv/KJ+XuQK0aJPeFz17XJs+NaZR8NnebH9wMn5iWPdQMCoJGLVZksOSi9F1yrDKsCgS
 0WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3w/z7/yo1sMupnazTL2mg22uvPZzsFuBbBmtMlymg9c=;
 b=3GCehLfjdBRDMEgIsiU7rJcxTJpwxXoyBBa5jViMpoNLvR5IeZ/SfmofJlaLdKVLVV
 jEsaN6MB5QU+bfMvA9CC58og5n4p7qwq3tnNGVtZ/GiKsCelaowSRwK4QxktyjDrC3JU
 bvHYDFZcAmzQb+zooItTL4gsv2ATwK2WzDX5igVWyWYRNC+EzD+39kX3zp7Tfu4GzB89
 JUiCENoF7icS1HQNipn6LwCWWWpRhJPw5mQOgjoXHes7KTGoAzaSg8ozYJWSeaPjzDjP
 Myi2BUF9PAZSASD4Y7GhHQbW3qMlfWh4b6/SyANGxD6f00wVXZ5dUoMYUBn63dVXQt4t
 tnAg==
X-Gm-Message-State: AJIora+xJlMuLM4lKObdsEJqp6L263NP5YX41Ld82LE9BUPU2AxsAjQf
 1NZ3pE1pPBBjwzaBsrEviEq5UQ==
X-Google-Smtp-Source: AGRyM1sPuurhLUwDbttEQfO8DD9DFTxC3crqNs+DZCIhaj9yoTBBJU59LHNoY1B+aj22dg50mS6fzA==
X-Received: by 2002:a19:500c:0:b0:489:e7fc:cdfc with SMTP id
 e12-20020a19500c000000b00489e7fccdfcmr147455lfb.455.1657532602428; 
 Mon, 11 Jul 2022 02:43:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:43:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/4] drm/mipi-dsi: pass DSC data through the struct
 mipi_dsi_device
Date: Mon, 11 Jul 2022 12:43:17 +0300
Message-Id: <20220711094320.368062-2-dmitry.baryshkov@linaro.org>
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

The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
added a pointer to the DSC data to the struct drm_panel. However DSC
support is not limited to the DSI panels. MIPI DSI bridges can also
consume DSC command streams. Thus add struct drm_dsc_config pointer to
the struct mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 91a164bdd8f3..bb20bc27ce87 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -179,6 +179,7 @@ struct mipi_dsi_device_info {
  * @lp_rate: maximum lane frequency for low power mode in hertz, this should
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
+ * @dsc: panel/bridge DSC pps payload to be sent
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -191,6 +192,7 @@ struct mipi_dsi_device {
 	unsigned long mode_flags;
 	unsigned long hs_rate;
 	unsigned long lp_rate;
+	struct drm_dsc_config *dsc;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.35.1

