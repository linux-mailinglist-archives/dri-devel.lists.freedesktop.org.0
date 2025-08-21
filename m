Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C6B2F7D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A65B10E964;
	Thu, 21 Aug 2025 12:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MfbDKG4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB43210E964
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34F4D42B86;
 Thu, 21 Aug 2025 12:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B8CC4CEEB;
 Thu, 21 Aug 2025 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755779031;
 bh=fu4IgbUI1aWnDqu2U8QHmg6JXGWx/FGi7D/ezNpYCbE=;
 h=From:To:Cc:Subject:Date:From;
 b=MfbDKG4F0pApMw5RvgN6EpZ2msOsGTlMN5BOb8A3xLi4TWpBJbBI09IlK2y/2wCqJ
 +XkDgXz3rDwoNmWDTrJCmbpKU9SFvyc/LqtZKn8xQ+MPq+yJqTdHLiPZR4wcVtcm4M
 s59kszYyOHy7fEgKIX5ysTx2JEjM8wnMtzvkyhD5cXBqu9dEhRFM1iHynUe24wfUw1
 mNB+zI7b/kTRzqvWoM2h1hIdDkhU2kIrqgL0t/jq1E5EDmUMbeoBQehxaacktpT++h
 Y+Tl1FznVaxYOUjlPLgJXmgBgRlfm0RszIP8ZHJTkAzGf0mOCwcOeWMQe7s9tgbqgZ
 CEuUnoZnGZSWg==
From: Michael Walle <mwalle@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jayesh Choudhary <j-choudhary@ti.com>, Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: fix REFCLK setting
Date: Thu, 21 Aug 2025 14:23:41 +0200
Message-Id: <20250821122341.1257286-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge has three bootstrap pins which are sampled to determine the
frequency of the external reference clock. The driver will also
(over)write that setting. But it seems this is racy after the bridge is
enabled. It was observed that although the driver write the correct
value (by sniffing on the I2C bus), the register has the wrong value.
The datasheet states that the GPIO lines have to be stable for at least
5us after asserting the EN signal. Thus, there seems to be some logic
which samples the GPIO lines and this logic appears to overwrite the
register value which was set by the driver. Waiting 20us after
asserting the EN line resolves this issue.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 464390372b34..ae0d08e5e960 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -392,6 +392,17 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 
 	gpiod_set_value_cansleep(pdata->enable_gpio, 1);
 
+	/*
+	 * After EN is deasserted and an external clock is detected, the bridge
+	 * will sample GPIO3:1 to determine its frequency. The driver will
+	 * overwrite this setting in ti_sn_bridge_set_refclk_freq(). But this is
+	 * racy. Thus we have to wait a couple of us. According to the datasheet
+	 * the GPIO lines has to be stable at least 5 us (td5) but it seems that
+	 * is not enough and the refclk frequency value is still lost or
+	 * overwritten by the bridge itself. Waiting for 20us seems to work.
+	 */
+	usleep_range(20, 30);
+
 	/*
 	 * If we have a reference clock we can enable communication w/ the
 	 * panel (including the aux channel) w/out any need for an input clock
-- 
2.39.5

