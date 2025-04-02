Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E201EA78FDA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E44610E7D3;
	Wed,  2 Apr 2025 13:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KReOvD8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4C10E7CB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:31:35 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F422698;
 Wed,  2 Apr 2025 15:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743600581;
 bh=+KTrHkkHrlimkcuE/FGh2M7ak/aUnyOtjsNsvIRCm1s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KReOvD8UBUeNb4TVNPZi3w7epXAWXa8CQ6tymla2A8scpJyDrNnhKWSkCkZC+NvIg
 r6Hcz7EBf+kDdtzGoJCob+ix9NOGyywADfVduYXShIZZOkNatRGwquGna/HdFrXIE8
 3MjrU5A4+TqyyhjAJHMKI31TW7S3Jt9pbyVnLpf8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:58 +0300
Subject: [PATCH v2 16/18] drm/bridge: cdns-dsi: Update htotal in
 cdns_dsi_mode2cfg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-16-4a093eaa5e27@ideasonboard.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+KTrHkkHrlimkcuE/FGh2M7ak/aUnyOtjsNsvIRCm1s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7TwhN5j4jZl/ZKghFpGwQA9aKuBkv7UUMeIZg
 //p2OMD6FCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08IQAKCRD6PaqMvJYe
 9RYvD/46o6fQlsJtr+9aj4Q6Ts7/IJrOxvcT6mMmD6lUQVvXa7Ynf2b/o4JNz6tQjI+gEbzKHCI
 cx9UNePzH0FvE7KWgSJM5BwQXpfGGWLCZ4DNA1D4iAXqT5waV4h4GdUy8W/a4QiSfTbNUb9TiVH
 29MklhHz5J4Ym137sEWvNJThBN7apXJ2BkclO1pRJn1ifoqpFOlFgFUblcVMUDTa+vsq41chC+/
 FwMlJQ76WeOo4Q0tnwKngb/OR4cQXLq87PcV1rvUZrGaZgY2a2kMRD2j3Zmx+ZCZDphtzKwzASq
 zn24x7kaACDShjTLWBrLggZ2ZfcbnvgetyjNv2GhbCnDsQljZQ9Qax2rjKLsFLHO9zWN8Qlbdji
 EEWcbH7/VjnriplhR53pqQryqF+IkRPEvEskekIrHwsPIdUCLrZeMrVASyfzpuUm8Km0NgJhDTc
 kioMznHDpPj+BXsjObYAhQI8MUlLGCTmWfiavevta36k8rVAyhf6UcpvgZH+OwAkIxYZ1QyS8H5
 qfxBDSRut3xctntzs9y90FB37SJBx31Y8vP97MO1lW8IehMZG+JizYNosZ5qPKFv1vgMRfKgt+9
 RikYljNybLo6UTOzxCGFVN3UOL+7qFBHhHM9IS83VDl8Kyr9mHs4bZ4KBAtc23vFlCn8b+Q2uQN
 Tiy/aDfaxJVFWzg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

cdns_dsi_mode2cfg() calculates the dsi timings, but for some reason
doesn't set the htotal based on those timings. It is set only later, in
cdns_dsi_adjust_phy_config().

As cdns_dsi_mode2cfg() is the logical place to calculate it, let's move
it there. Especially as the following patch will remove
cdns_dsi_adjust_phy_config().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 9f4f7b6c8330..2a272fd8ea3e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -505,6 +505,15 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	dsi_cfg->hfp = dpi_to_dsi_timing(dpi_hfp, bpp, DSI_HFP_FRAME_OVERHEAD);
 
+	dsi_cfg->htotal = dsi_cfg->hact + dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+
+	if (sync_pulse) {
+		dsi_cfg->htotal += dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
+		dsi_cfg->htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_cfg->htotal += dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
+
 	return 0;
 }
 
@@ -522,15 +531,7 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
-		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
-		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-	} else {
-		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
-	}
-
-	dsi_htotal += dsi_cfg->hact;
-	dsi_htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+	dsi_htotal = dsi_cfg->htotal;
 
 	/*
 	 * Make sure DSI htotal is aligned on a lane boundary when calculating

-- 
2.43.0

