Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40C801B4E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 09:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88110E197;
	Sat,  2 Dec 2023 08:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9E810E18C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 08:02:43 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id A1C5860406;
 Sat,  2 Dec 2023 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701504163;
 bh=XX98Cqt5NzbeNpKXwhQvSO72W3DmrA1+cXFaVWu20AI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S2iY1w9hQzsJd6tsprr6wAbF7NSTBwi9g4G5xWnC5Nht4jWdrjnuDmjFAkg8y3GbT
 omPnGkj0dZlvuTjaI+HaCbIFiP+PkEZoO8QTgRmsFMJOxj2uSDiAZzBAOZuW5W2LV3
 FqPUafnNfYPiSgMlBXyse73WO91TF2XBgyBhd13bvfO9TljQoln+xNlbXMrnklOnSZ
 GLWyHnHxZGLS/zfbFP1LsS8kgo17btlbH7hDZs8SN9N3Ez3FwhPvIkrmF2jPHYJudz
 5GdbCRYPxvNFYYEkmcAgPDdm2nEhkDDZFgLwwwIY+BtOGkJ1o/54+76WY/vz2B/A/x
 P8fnjymCeFKkQ==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 07/10] drm/bridge: tc358775: Add burst and low-power modes
Date: Sat,  2 Dec 2023 09:54:46 +0200
Message-ID: <20231202075514.44474-8-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202075514.44474-1-tony@atomide.com>
References: <20231202075514.44474-1-tony@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Burst and low-power modes are supported both for tc358765 and tc358775.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -619,7 +619,8 @@ static int tc_attach_host(struct tc_data *tc)
 
 	dsi->lanes = tc->num_dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		MIPI_DSI_MODE_LPM;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.43.0
