Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7F9B148E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 06:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879610E3F9;
	Sat, 26 Oct 2024 04:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="yoVQr0iC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2BB10E3F2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 04:10:46 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5033088E74;
 Sat, 26 Oct 2024 06:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729915839;
 bh=Na8oIFfCL6gul2DcZNFEBZb5t2FmQ8us2mIPuFgDxCw=;
 h=From:To:Cc:Subject:Date:From;
 b=yoVQr0iCNRt0GiXnmENWv79rJDN1RrMewNXnT5tGhM6Fw/eUh3dvlJ6M3N1r9b2+k
 pbf89gby5VqOFwuRjMNbtHriuyJFXYi0A91qaPX1/kH4lIZDS8y8WmLM8U7frwMuX0
 qg5t7vHj/MPcVippY9KMdjhtZ7couj9wkD3G00KlVJclWEoCDtbMcsLgyMqTp587Qw
 d5MAaC7zaLJS7GZNi88tLIv7UaXfqV5OfsLHItmlwfgBEnFlG+2KqVqhEpwUu/7pie
 a4eN8/UoKFmyEpTgjufTJXJbuiI86yuR33KE3EswkNkyKH/ox80tSAQYcF2vHRpBx4
 yj7BloZhXS8+w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
Date: Sat, 26 Oct 2024 06:10:01 +0200
Message-ID: <20241026041019.247606-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
bitfields description state "These bits must be multiple of even
pixel". It is not possible to simply align every bitfield to the
nearest even pixel, because that would unalign the line width and
cause visible distortion. Instead, attempt to re-align the timings
such that the hardware requirement is fulfilled without changing
the line width if at all possible.

Warn the user in case a panel with odd active pixel width or full
line width is used, this is not possible to support with this one
bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358767.c | 63 +++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 0a6894498267e..7968183510e63 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 	int vsync_len = mode->vsync_end - mode->vsync_start;
 	int ret;
 
+	/*
+	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
+	 * bitfields description state "These bits must be multiple of even
+	 * pixel". It is not possible to simply align every bitfield to the
+	 * nearest even pixel, because that would unalign the line width.
+	 * Instead, attempt to re-align the timings.
+	 */
+
+	/* Panels with odd active pixel count are not supported by the bridge */
+	if (mode->hdisplay & 1)
+		dev_warn(tc->dev, "Panels with odd pixel count per active line are not supported.\n");
+
+	/* HPW is odd */
+	if (hsync_len & 1) {
+		/* Make sure there is some margin left */
+		if (left_margin >= 2) {
+			/* Align HPW up */
+			hsync_len++;
+			left_margin--;
+		} else if (right_margin >= 2) {
+			/* Align HPW up */
+			hsync_len++;
+			right_margin--;
+		} else if (hsync_len > 2) {
+			/* Align HPW down as last-resort option */
+			hsync_len--;
+			left_margin++;
+		} else {
+			dev_warn(tc->dev, "HPW is odd, not enough margins to compensate.\n");
+		}
+	}
+
+	/* HBP is odd (HPW is surely even now) */
+	if (left_margin & 1) {
+		/* Make sure there is some margin left */
+		if (right_margin >= 2) {
+			/* Align HBP up */
+			left_margin++;
+			right_margin--;
+		} else if (hsync_len > 2) {
+			/* HPW is surely even and > 2, which means at least 4 */
+			hsync_len -= 2;
+			/*
+			 * Subtract 2 from sync pulse and distribute it between
+			 * margins. This aligns HBP and keeps HPW aligned.
+			 */
+			left_margin++;
+			right_margin++;
+		} else {
+			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensate.\n");
+		}
+	}
+
+	/* HFP is odd (HBP and HPW is surely even now) */
+	if (right_margin & 1)
+		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per full line are not supported.\n");
+
 	dev_dbg(tc->dev, "set mode %dx%d\n",
 		mode->hdisplay, mode->vdisplay);
 	dev_dbg(tc->dev, "H margin %d,%d sync %d\n",
@@ -922,14 +979,14 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 		return ret;
 
 	ret = regmap_write(tc->regmap, HTIM01,
-			   FIELD_PREP(HBPR, ALIGN(left_margin, 2)) |
-			   FIELD_PREP(HPW, ALIGN(hsync_len, 2)));
+			   FIELD_PREP(HBPR, left_margin) |
+			   FIELD_PREP(HPW, hsync_len));
 	if (ret)
 		return ret;
 
 	ret = regmap_write(tc->regmap, HTIM02,
 			   FIELD_PREP(HDISPR, ALIGN(mode->hdisplay, 2)) |
-			   FIELD_PREP(HFPR, ALIGN(right_margin, 2)));
+			   FIELD_PREP(HFPR, right_margin));
 	if (ret)
 		return ret;
 
-- 
2.45.2

