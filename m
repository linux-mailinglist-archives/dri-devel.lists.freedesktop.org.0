Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4E8D10BF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F2710E878;
	Tue, 28 May 2024 00:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.b="sFx3rhDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750D610E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 16:04:19 +0000 (UTC)
Received: from [192.168.108.81] (unknown [213.36.7.13])
 (Authenticated sender: marc.w.gonzalez@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D4E8A20039C;
 Mon, 27 May 2024 18:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1716825856;
 bh=rUEdGPdyXj5bA+ZaxgMI0r7HlEXBf1K3ZZoWPeKgMj8=;
 h=Date:From:Subject:To:Cc:From;
 b=sFx3rhDV3YFS8CB7d0xZsSCEJfAaDPzNLN23XhVrMJ8BN7Us3bVKtu/kohh45X9hZ
 0BjkaAx72tQD84Z1IsnkJ/6O4U+wTk2Mkq3Ra565Q7PavEC3W03QbxBR9F+LnfeiRV
 65UYHjZQZ3aR1pt0p/qNPsTSCC/J9QFMhS6kAPXGOHmsRgGABGA9TPq6HMBUq62vaU
 DNx/WonAn3leacwJ1OlOYh2nHRmibL5g3L77uu0slE+cKYeYUSaImu0r/bZ75gOdAZ
 55KP0/8WV2VxlViBqVP7BCjRbg+mOJjFPYgmnal4QJN9vG3U82JGCpAsvo0HTolMtX
 1HF7l+396pp5w==
Message-ID: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
Date: Mon, 27 May 2024 18:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 May 2024 00:08:26 +0000
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

From: Arnaud Vrac <avrac@freebox.fr>

The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
DVI 1.0 and HDMI 1.4b and 2.0b output signals.

Since it's an I2C-programmable bridge, it could have a proper driver,
but the default settings work fine, thus simple bridge is sufficient.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 5813a2c4fc5ee..b138279864750 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -292,6 +292,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "ti,tdp158",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	},
 	{},
 };
-- 
2.34.1
