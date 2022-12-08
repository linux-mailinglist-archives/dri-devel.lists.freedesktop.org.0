Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A30646979
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 07:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DFC10E461;
	Thu,  8 Dec 2022 06:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63E10E461
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670482552; x=1702018552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SfXtN/Q+Q7dO1FR5y9sK3ea51QJfXwAwvGv6JxjuoD4=;
 b=p+YvOSza2yMuDM9mzv1bWMmztVE/OBJlPcXdPl+glh5c4PdLgsw+Fcxh
 PU6H5l9wigd300v265T8iHfJr+dhLiVu6IE+y5Fx+f+3idBvd/6foJ7cP
 SZxlzCFjznhX4kkNlhma0+HJ/ObPwPtNmnLUdzV+h/KMTTj3LAS4uNcVm
 5byTCAYYzX2FpwvNAAj37kqDM+b8CS9gnli/PXIHSLLhRWcdCKFvpZ1f8
 Tjkv509X3caoUnZLelizqUS4V8LzCIGilDYc/mp2e0zLEqwTA4Jk1NrM7
 NhxLIY5airNJRxos7WXhTjPBFme3Z/+890d30EqxgdVrevYhaX5b5yinB Q==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27825610"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 07:55:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 07:55:46 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 07:55:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670482546; x=1702018546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SfXtN/Q+Q7dO1FR5y9sK3ea51QJfXwAwvGv6JxjuoD4=;
 b=fyeqcf18lMyGPB9meMDUCqMdmzmurCg9KmdxDsJ3rKZd/VVcbxcluwtH
 OkaSBPJvlRT+QOi6CfZjTYp6XfLl/xkB2shj+1LrFhh/692f1sD5a+oYY
 5OQ/HEBHDFBAp5Xlcvp6O3dS3HdmmT1u8t4k5e75Qy3z8MYX8y6+0asD8
 X0c8pjzPwwBX+Mrl7egSAn/iKeLezOP9u3XCWhVdTiv5pBGWv7ui0ode7
 AFF4thOHXG7J6EHLi5CI7L8iUxHZ6kZFrTGlqL1fYnTbF/a+BNY4JRHSr
 lce90UmlcpQA1jTU+4GKBRx7D5GVWIZrh3gyn0cds2ZjsCPX3TaGFeWzY Q==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27825609"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 07:55:45 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 77762280071;
 Thu,  8 Dec 2022 07:55:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: bridge: ldb: Warn if LDB clock does not match
 requested link frequency
Date: Thu,  8 Dec 2022 07:55:38 +0100
Message-Id: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
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

The LDB clock needs to be exactly 7-times the pixel clock used by the
display.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
i.MX8MP has a dedicated LDB clock which defines the actual LVDS link frequency.
This has to be (exactly) the 7-time of the pixel clock.
Although the clock min/max range is available, panel-simple does not (yet) use
the range to find a (perfect) frequency which can be used down the chain, which
is also in range.
Depending on the pixel clock the exact multiple might not be configured.
Raise a warning if there is a mismatch, which might cause an invalid display
image.

 drivers/gpu/drm/bridge/fsl-ldb.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index f9e0f8d992680..9bcba8fc57e74 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -66,6 +66,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
 	return container_of(bridge, struct fsl_ldb, bridge);
 }
 
+static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
+{
+	if (fsl_ldb->lvds_dual_link)
+		return clock * 3500;
+	else
+		return clock * 7000;
+}
+
 static int fsl_ldb_attach(struct drm_bridge *bridge,
 			  enum drm_bridge_attach_flags flags)
 {
@@ -85,6 +93,8 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	unsigned long configured_link_freq;
+	unsigned long requested_link_freq;
 	bool lvds_format_24bpp;
 	bool lvds_format_jeida;
 	u32 reg;
@@ -128,10 +138,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	mode = &crtc_state->adjusted_mode;
 
-	if (fsl_ldb->lvds_dual_link)
-		clk_set_rate(fsl_ldb->clk, mode->clock * 3500);
-	else
-		clk_set_rate(fsl_ldb->clk, mode->clock * 7000);
+	requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	clk_set_rate(fsl_ldb->clk, requested_link_freq);
+
+	configured_link_freq = clk_get_rate(fsl_ldb->clk);
+	if (configured_link_freq != requested_link_freq)
+		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz",
+			 configured_link_freq,
+			 requested_link_freq);
+
 	clk_prepare_enable(fsl_ldb->clk);
 
 	/* Program LDB_CTRL */
-- 
2.34.1

