Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E93859057
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7302610E57D;
	Sat, 17 Feb 2024 15:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YYCrcRG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE21D10E35E;
 Sat, 17 Feb 2024 15:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3B865CE09F0;
 Sat, 17 Feb 2024 15:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7A2C43394;
 Sat, 17 Feb 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708182183;
 bh=gXXEjah83df2mjIZE6PBMMf9QLss5RTOxJWznY2GGWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YYCrcRG2Bd4HtdSjVhBFoyvNHGakjwLypXKacKIBHXJrLfhpQut/AO/LcBQ3Y0KjF
 sPdXqHSXykK74eTVnJeNok7niPfXO0Czt/1YPR768rWKLabFR6u9U6X5zIoNHXtfCO
 USZHcA9Rm8QSNKTbGnvdNY/kIjWyg4w+1ZXDETyizCJSpTAN1qQacxjTa7UDJF9A2O
 msphIG/8uQP28WXSj7qoecFU1NmlhQEAP7CJjIeye7CoVAI4y/049aiTpZjWH59Xcd
 XI5S8l0Qbk9Ya0xxP0z0xuzlJ6QUvVP0P3e4nAwJAmqIZ/HBGy+WfJdIV0A5NlROZa
 yxMde5QWQVT1A==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rbMDW-000000001Vw-3n8S;
 Sat, 17 Feb 2024 16:03:02 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH 5/6] phy: qcom-qmp-combo: fix drm bridge registration
Date: Sat, 17 Feb 2024 16:02:27 +0100
Message-ID: <20240217150228.5788-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a long-standing issue in driver core, drivers may not probe defer
after having registered child devices to avoid triggering a probe
deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
-EPROBE_DEFER")).

This could potentially also trigger a bug in the DRM bridge
implementation which does not expect bridges to go away even if device
links may avoid triggering this (when enabled).

Move registration of the DRM aux bridge to after looking up clocks and
other resources.

Note that PHY creation can in theory also trigger a probe deferral when
a 'phy' supply is used. This does not seem to affect the QMP PHY driver
but the PHY subsystem should be reworked to address this (i.e. by
separating initialisation and registration of the PHY).

Fixes: 35921910bbd0 ("phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE")
Fixes: 1904c3f578dc ("phy: qcom-qmp-combo: Introduce drm_bridge")
Cc: stable@vger.kernel.org      # 6.5
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1ad10110dd25..e19d6a084f10 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3566,10 +3566,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = drm_aux_bridge_register(dev);
-	if (ret)
-		return ret;
-
 	/* Check for legacy binding with child nodes. */
 	usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
 	if (usb_np) {
@@ -3589,6 +3585,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	ret = drm_aux_bridge_register(dev);
+	if (ret)
+		goto err_node_put;
+
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-- 
2.43.0

