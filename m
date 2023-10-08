Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B653D7BD0F0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 00:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585110E07A;
	Sun,  8 Oct 2023 22:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE8110E07A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 22:33:32 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3EDD7863CF;
 Mon,  9 Oct 2023 00:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696804408;
 bh=n9XmF5Si4vJSskVeJOhg/Ma4E2jIuRX+O41PjK2Fg+8=;
 h=From:To:Cc:Subject:Date:From;
 b=VOf7qbOUOMObB473yFxgEhIKYK77WtXWnuNlHo0qvBRdxwWVKUd2MCrQHhRZv2Gec
 ocEJZ/fdUUvuhiAs/QW+ZEYEfTIL/4mLw9iiaDvZCXCmBOS5wOhubCSO7MrMYwBxTk
 Mcv4uzhBViBCbol9CNsUDiTK/JxUdftaKHs6bAn1um42ry+BsFJgz3t1Zdsj+4HRsK
 o/fNr1Gi+adndzafvwYrrN1sLsgUzlfaQI9XH86YsuAfIa/2Iz4281jmxCMesGbajP
 NkvyQL9yUKD9MWKyvwYYKu/uQ5SxyCwuABnV9Pbol1soxPZDjNwT0Uei8bdIxN8FSH
 GDyXqdPKAvGrg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Date: Mon,  9 Oct 2023 00:33:15 +0200
Message-Id: <20231008223315.279215-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing .bus_flags = DRM_BUS_FLAG_DE_HIGH to this panel description,
ones which match both the datasheet and the panel display_timing flags .

Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 44c11c418cd56..8e4ea15f0e1e5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2318,6 +2318,7 @@ static const struct panel_desc innolux_g101ice_l01 = {
 		.disable = 200,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.40.1

