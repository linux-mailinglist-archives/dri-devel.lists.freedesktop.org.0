Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FA40497E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBFA6E4F3;
	Thu,  9 Sep 2021 11:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2A46E4F1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:41:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 721D0611C0;
 Thu,  9 Sep 2021 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187679;
 bh=Ruc48eyXaD3uQ5drzDTKk8RQ+LthBucD3UIoQgJsNFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuPUVz+QMmzExsXBjGCxWBEKFNNXpgnrWRcPLHn9XlA8sUafS/noBmzcMg8XacV7V
 p1CMRIENTor53LPrQ+ukQAxc9vw8WXRpoiUFyOUJacr/g8bT/dBPvZILLWTVo9KxyU
 PZVEoFylIQd072Y/qFLzSnmyQZKHA2su8BqBLJdEEFbjFLP9VTRbevyRtM5jl8+tnN
 cy894o8N1k3t7kIO3vRJKrZr4Hu3V0aEgvl2y+oYADdDzRzgpTX2VpctmN/86GQZrY
 Re3WYj02flreq4aV2+lqRbtRmvphh2SgfT/J/4EYMOckryl0jx+OFJNJC7Pj8xYxK2
 T8a6EjflK/2xw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Gover <tim.gover@raspberrypi.com>, Maxime Ripard <maxime@cerno.tech>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 009/252] drm: vc4: Fix pixel-wrap issue with DVP
 teardown
Date: Thu,  9 Sep 2021 07:37:03 -0400
Message-Id: <20210909114106.141462-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Tim Gover <tim.gover@raspberrypi.com>

[ Upstream commit 0b066a6809d0f8fd9868e383add36aa5a2fa409d ]

Adjust the DVP enable/disable sequence to avoid a pixel getting stuck
in an internal, non resettable FIFO within PixelValve when changing
HDMI resolution.

The blank pixels features of the DVP can prevent signals back to
pixelvalve causing it to not clear the FIFO. Adjust the ordering
and timing of operations to ensure the clear signal makes it through to
pixelvalve.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20210628130533.144617-1-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ad92dbb128b3..f91d37beb113 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -613,12 +613,12 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
-	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) |
-		   VC4_HD_VID_CTL_CLRRGB | VC4_HD_VID_CTL_CLRSYNC);
+	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_CLRRGB);
 
-	HDMI_WRITE(HDMI_VID_CTL,
-		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+	mdelay(1);
 
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 	vc4_hdmi_disable_scrambling(encoder);
 }
 
@@ -628,12 +628,12 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	int ret;
 
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
-	HDMI_WRITE(HDMI_VID_CTL,
-		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
-
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -1015,6 +1015,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   VC4_HD_VID_CTL_ENABLE |
+		   VC4_HD_VID_CTL_CLRRGB |
 		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
 		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-- 
2.30.2

