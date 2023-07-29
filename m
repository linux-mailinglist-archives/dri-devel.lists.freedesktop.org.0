Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DA767A1C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6999B10E7C3;
	Sat, 29 Jul 2023 00:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A297610E7B8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 00:49:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fbaef9871cso4690844e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690591758; x=1691196558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4eWv/RBKDrUWJz/NgxgnDtpmPraqNg6YmnPUdo6m2g=;
 b=N3mjaft3MQV1yRXyfPi2iqaPLWvhVHh4gqB42zE/W1dUgVEnfElR9yNSOnZbcLoE7Z
 3Wqv8SHYL5qqtavRCDfrJLP12G4A++nHyh2t4tidt4i/Cub5ra/SxzItim7vO+fipwL9
 VAqHEdlWQGd/rrzEj3jmyQNMJ/1UCGP+pja+sYoWicwVjaiOG9KXv1lWan8R6To0qbad
 ylVg1UlCZzLSYYzYMHYkiiGi90iOqcLgzpI2MXJmbbJUBWSp+DHxx2P/67aoVYo72dos
 wR70cBJD7SQVY6+6IHRVLM5PvYfemKGNxQjCXRqerEowaQGBpT0KLOCfMD97UwkOF4/R
 93mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690591758; x=1691196558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4eWv/RBKDrUWJz/NgxgnDtpmPraqNg6YmnPUdo6m2g=;
 b=ZX2p26AppuLgBZwuLt1BiUVpgOwZvwSY2jBbLpJPxPsJ6SDj5gAQAiB5F7G71nO3f+
 EVdedSKVsD8/LMdYN8SAvhk2/89YphCXfeUWZ7QFu40ce6a8zPAhITHlc+z6hkjDp00q
 2HMyfh0AEu877yt4DsHaeOqtFk8iwIgvBGmpYlc4z2Z+Xs4jXJbFy7fDu/Gq3hiOBhcJ
 qDtuSdNPFlyoPwbYI/0DKd6MbwxGXb5iDpFbkk+fcberDmgGqZ+pXgCrZHuo6OC0PkTo
 A89lfGDCu+/Xw0BvtUH87JhC0q1B4X1juC7WvEHefYtjUKou1+TQ5DeCrWKR0MAmEnxW
 95WQ==
X-Gm-Message-State: ABy/qLYqiVcUzzGLzquPtgnQmIs1konMK2eHV0BuZjHGTl034VAPDrzj
 VuYLFQtSAO5vdo8gvGD4aM1szg==
X-Google-Smtp-Source: APBJJlH3hanHEvBgr++jOJubmsB65dIQxl3i8dLk9WO0Yl8D2xONZbjmFiJz42HIJIcei2b4Pyrowg==
X-Received: by 2002:a19:ca15:0:b0:4fe:ee7:a32a with SMTP id
 a21-20020a19ca15000000b004fe0ee7a32amr2516420lfg.16.1690591757890; 
 Fri, 28 Jul 2023 17:49:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a19f818000000b004fe20d1b288sm500702lff.159.2023.07.28.17.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 17:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Simon Ser <contact@emersion.fr>,
 Janne Grunau <j@jannau.net>
Subject: [PATCH 4/4] soc: qcom: pmic_glink: properly describe the DP connector
Date: Sat, 29 Jul 2023 03:49:13 +0300
Message-Id: <20230729004913.215872-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the discussion of the DP connectors, it was suggested that USB-C
DisplayPort connectors should have DRM_MODE_CONNECTOR_DisplayPort
connector type. This follows the example provided by other drivers
(AMDGPU, Intel). To distinguish them from native DP ports, they should
have the freshly defined USB as a subconnector type.

Suggested-by: Simon Ser <contact@emersion.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 1dedacc52aea..9094944c6cc0 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -417,7 +417,8 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+		alt_port->bridge.subtype = DRM_MODE_SUBCONNECTOR_USB;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret)
-- 
2.39.2

