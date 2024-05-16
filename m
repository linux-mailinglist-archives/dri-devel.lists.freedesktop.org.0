Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6958C7199
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ACF10E111;
	Thu, 16 May 2024 06:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Kaa23Bqa";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PnOMc5wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03FE10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1715840706; x=1747376706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eXSRJ9ePSQv2BRVPVAwRZ5tukZAjyNQB7JMiQsOB8x8=;
 b=Kaa23BqalytAo7u9QfVW+BF+BjkRYmbHQl+Fi2doPJqoXFAs4lUBxyyV
 cNOFb6QZFdkBYEh44Ti69t7CM3+fdvCPOPoKeNJdnHL4GfD8DqWMxWcOr
 PpF/oKwTMXnIUMoVFz8GnQT5L6/HcDVgoFDtJqLJZwN16uZqXy1Ol+N2v
 7q/LXpfR/Lp4IhPpsulK+Aoj4rbKxNfjoEAoquATsnrctNIpJZiPAWC70
 B771RcrTf102v/wynR3/ryjXknxlwJk7uR+0Q6JxJywcTq40OVfIGDyBM
 FIbYe8PhUhQtTAGCu3bHJvvU6ox8MG1ALpSse8MBhiB56iiOfFCb9cvpV A==;
X-CSE-ConnectionGUID: VszA4rqNR/qsNv/XzKy4KA==
X-CSE-MsgGUID: Fq9c5anXSamT1K8pUT7tlw==
X-IronPort-AV: E=Sophos;i="6.08,163,1712613600"; d="scan'208";a="36926960"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 16 May 2024 08:25:06 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87495172EAE; Thu, 16 May 2024 08:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1715840701; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eXSRJ9ePSQv2BRVPVAwRZ5tukZAjyNQB7JMiQsOB8x8=;
 b=PnOMc5wkNdlyJ2j1ykBMFHHOVXO2rQs18mSmwhOwegV8w1boATeh1sgPe3E29mVKe1beUy
 gCkBer+x6OdCoR3iNvAhBfw3QmRZkcRwXZgcaaGgUNxHdYp3C5xAxQ5D0SYPvzrLmlOBs/
 5jqRtAp7hynm121UkmOPyf/IvXMcJ5WV938b7TJpMhTa4VSjBxfTvfx5zROnUeHjjWRAM4
 p8abwya3jMT7r0IYEh46/l4xHvwfD/5qsutqErr6GWE4b0oNA5yi3AVfK5/iKRy/zVqmGt
 YCTlvv1WnaDYASdil+CZtjduP39wQ7RmFn0M6WWkJjnyXsAhexBzKH3/CUktCQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/bridge: tc358767: Use dev_err_probe
Date: Thu, 16 May 2024 08:24:53 +0200
Message-Id: <20240516062455.106266-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The function calls preceding these returns can return -EPROBE_DEFER. So
use dev_err_probe to add some information to
/sys/kernel/debug/devices_deferred

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 99e8a8cf29f5b..de62a7e2eafec 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2215,7 +2215,8 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 	/* port@1 is the DPI input/output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DPI panel or bridge\n");
 
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add(dev, panel);
@@ -2243,7 +2244,8 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 	/* port@2 is the output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DSI panel or bridge\n");
 
 	if (panel) {
 		struct drm_bridge *panel_bridge;
@@ -2455,7 +2457,7 @@ static int tc_probe(struct i2c_client *client)
 		ret = tc_mipi_dsi_host_attach(tc);
 		if (ret) {
 			drm_bridge_remove(&tc->bridge);
-			return ret;
+			return dev_err_probe(dev, ret, "Failed to attach DSI host\n");
 		}
 	}
 
-- 
2.34.1

