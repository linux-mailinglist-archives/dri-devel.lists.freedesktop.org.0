Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1D86D836
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 01:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA0C10E749;
	Fri,  1 Mar 2024 00:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bELh1cTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AC10E73D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 00:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709251985;
 bh=plA+/Ds0xvFbb6U3u3M8ilxs/x7ZgpNx1PsraFtKLNM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bELh1cTnraZfxf8dHy6VCIwRcfxJwFIbKP+rfx9P36tSUl6jdNOa8bfxW+fFHoI4b
 AXNq+sfqg0CLcRG+1hGv5RyiLTZHEVHEazsZCCTKDuRpgY8mAKwnnFVaJzhdjEfQU7
 9PQx302JO3t6shSX/7rjg9Y0noLFaMcqw9rFHg+/EU52m22oKJ2viqQMMTt5NrxTIF
 7xForobxy/oTLhbLNT6/Aqb6wMU4kupeYJDyNl1sCc/BZqVv6uJVPV67C2fk+jsko0
 itosv+yHr3qgdhs2GtRG1BCw39+AU390RBMuRZLP7EM/+r4gIqsAWRhlq1PGovcjnJ
 VMl6h2DznZkUQ==
Received: from [192.168.1.205] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DEA4037820EE;
 Fri,  1 Mar 2024 00:13:00 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 29 Feb 2024 19:12:15 -0500
Subject: [PATCH v2 9/9] drm/panel: truly-nt35597: Don't log an error when
 DSI host can't be found
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-anx7625-defer-log-no-dsi-host-v2-9-00506941049a@collabora.com>
References: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
In-Reply-To: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, 
 Christopher Vollo <chris@renewoutreach.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
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

Given that failing to find a DSI host causes the driver to defer probe,
make use of dev_err_probe() to log the reason. This makes the defer
probe reason available and avoids alerting userspace about something
that is not necessarily an error.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/panel/panel-truly-nt35597.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index b73448cf349d..d447db912a61 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -550,10 +550,8 @@ static int truly_nt35597_probe(struct mipi_dsi_device *dsi)
 
 	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
 	of_node_put(dsi1);
-	if (!dsi1_host) {
-		dev_err(dev, "failed to find dsi host\n");
-		return -EPROBE_DEFER;
-	}
+	if (!dsi1_host)
+		return dev_err_probe(dev, -EPROBE_DEFER, "failed to find dsi host\n");
 
 	/* register the second DSI device */
 	dsi1_device = mipi_dsi_device_register_full(dsi1_host, &info);

-- 
2.44.0

