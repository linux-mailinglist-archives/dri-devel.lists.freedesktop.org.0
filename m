Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1758272F8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 16:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB0410E26D;
	Mon,  8 Jan 2024 15:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8610E26D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1704727518; x=1736263518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0KR5cazzsarOLl+O2L+dyANDw1lb4pOMzqzXAj6FHZQ=;
 b=dJUX5RupHOSqoBjaLx0bykkLG8q+0eq2jea3Kodl1A3Mnpv2snwWdFfE
 NW7r9674hru5cWIG5TbO862hJ/79jAZY5DLGhXRFgCHNuHaseXp7V4Jxn
 0nKGn733tsPEoBQKkUL5SMH6zY6Qf0ZnN4VUG66O0aA7Gk7x8cnoDyOTR
 vQilu66HD9wEfyoxRsc0CCnDtr6e+6ppcn7LYzMsMQ1LCM2r9TgdR1Dqv
 r9MV0kxbgXIgRKqP5pw77gyVYq8P6380oSMj4/YZLyZ75h3KoHfl8Z0I6
 wu1yW/HwDN7m2dqKhkknmTO9f2rR4Prd1fjftIdKNFPniP4CGjmeILVFJ Q==;
X-IronPort-AV: E=Sophos;i="6.04,180,1695679200"; d="scan'208";a="34790091"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Jan 2024 16:25:16 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F1841280075;
 Mon,  8 Jan 2024 16:25:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: bridge: dw_hdmi: Set DRM bridge type
Date: Mon,  8 Jan 2024 16:25:14 +0100
Message-Id: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge type was set to default (Unknown). Set proper bridge type.
With this fixed, debugfs output imx8mp looks proper.
$ cat /sys/kernel/debug/dri/1/encoder-0/bridges
bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
        type: [0] Unknown
        OF: /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
        ops: [0x0]
bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
        type: [11] HDMI-A
        OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
        ops: [0x7] detect edid hpd

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
For the record, the output before is:
$ cat /sys/kernel/debug/dri/1/encoder-0/bridges 
bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
        type: [0] Unknown
        OF: /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
        ops: [0x0]
bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
        type: [0] Unknown
        OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
        ops: [0x7] detect edid hpd

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aca5bb0866f88..455bc15d90cc1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3541,6 +3541,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.interlace_allowed = true;
 	hdmi->bridge.ddc = hdmi->ddc;
 	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
-- 
2.34.1

