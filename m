Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04624719C2F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB48310E02B;
	Thu,  1 Jun 2023 12:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329C10E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C31C86606EC6;
 Thu,  1 Jun 2023 13:32:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685622721;
 bh=eGDnjCl002qB0yEphZ0pB1Io6Pe2uX31ugggEZ1Xn4I=;
 h=From:To:Cc:Subject:Date:From;
 b=nI8a6u/X/qqXFwW9jxgSoUYNRhpGRlL5JmChFsI039W15gW94sdLTNk8n13TTSV1H
 ROs0AqQzCGztbVY8KGtlPrWHdjaNsTHqS4JqZb57KAdLICk5EKxBBrgXIX4iDTp65g
 ZGMAT2dr/1t+gOpu2nIXb+S6UuVUW1waSIfuB3ngGJ9i4EdTPgI+CIiNgQgWeGbaEE
 ul2sSXSyEmsdA2fhln4RRL52PinoqDs/XYPKfLtHtnmevHCOtu9P7DBHYZjOhI1y56
 O3bMMOlmzmB7bj8igk3sipeS0c5aZFpeLnJPIT3lVeLYwziMkAD46zgcc1+5Mt9ZGI
 6MBi4vDbHqVIQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: ville.syrjala@linux.intel.com, narmstrong@baylibre.com,
 andrzej.hajda@intel.com, rfoss@kernel.org
Subject: [PATCH] drm: bridge: dw_hdmi: fix connector access for scdc
Date: Thu,  1 Jun 2023 13:31:53 +0100
Message-Id: <20230601123153.196867-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5d844091f237 ("drm/scdc-helper: Pimp SCDC debugs") changed the scdc
interface to pick up an i2c adapter from a connector instead. However, in
the case of dw-hdmi, the wrong connector was being used to pass i2c adapter
information, since dw-hdmi's embedded connector structure is only populated
when the bridge attachment callback explicitly asks for it.

drm-meson is handling connector creation, so this won't happen, leading to
a NULL pointer dereference.

Fix it by having scdc functions access dw-hdmi's current connector pointer
instead, which is assigned during the bridge enablement stage.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 5d844091f237 ("drm/scdc-helper: Pimp SCDC debugs")
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0accfb51509c..69c0e80b8525 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1412,9 +1412,9 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
 	if (dw_hdmi_support_scdc(hdmi, display)) {
 		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
-			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 1);
+			drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, 1);
 		else
-			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 0);
+			drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, 0);
 	}
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_high_tmds_clock_ratio);
@@ -2102,7 +2102,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 				min_t(u8, bytes, SCDC_MIN_SOURCE_VERSION));
 
 			/* Enabled Scrambling in the Sink */
-			drm_scdc_set_scrambling(&hdmi->connector, 1);
+			drm_scdc_set_scrambling(hdmi->curr_conn, 1);
 
 			/*
 			 * To activate the scrambler feature, you must ensure
@@ -2118,7 +2118,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
 			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
 				    HDMI_MC_SWRSTZ);
-			drm_scdc_set_scrambling(&hdmi->connector, 0);
+			drm_scdc_set_scrambling(hdmi->curr_conn, 0);
 		}
 	}
 
@@ -3546,6 +3546,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.interlace_allowed = true;
+	hdmi->bridge.ddc = hdmi->ddc;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.40.0

