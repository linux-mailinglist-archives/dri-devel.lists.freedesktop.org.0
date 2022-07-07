Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B0569761
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 03:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94810E438;
	Thu,  7 Jul 2022 01:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5611B10E54A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PhPEx
 eCgtjS3iGVOTFFbiXgYRcQXO0tvsXX1Brey5ws=; b=hknSEzQ2K4D8LcsZ6TPTW
 Q1IH5TJzMrMeOkQ/kWD0+xWkaEjWzuHuX8E2ZKZCDjPbs9RARR4WzQfyKgj5sJyL
 3v0aj2+TfkORSfocH5CJrJVPfUu1c2bedA12bWu/ERXArfjTncxvF6sj7oHArSFd
 Uky0AlJpkF+RgZM05vZRhc=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp1 (Coremail) with SMTP id C8mowAD3_yeSNcZiNRaPGA--.54898S2;
 Thu, 07 Jul 2022 09:23:32 +0800 (CST)
From: Liang He <windhl@126.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, windhl@126.com
Subject: [PATCH] drm:bridge:analogix: Fix refcount bugs in anx7625_parse_dt()
Date: Thu,  7 Jul 2022 09:23:30 +0800
Message-Id: <20220707012330.305646-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAD3_yeSNcZiNRaPGA--.54898S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1fuFy8CFWUGr4kGr4kWFg_yoW8Ar4kpF
 W3Kay5Xrn7JF4xKr4xZa1DurWqv3ykWFWrC3yjyasa9wn5Ja43ArWjgFyfJ3s8CFWxJryr
 X3WUtF9IvFyq9r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zirMa5UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBU3F2JVkPxrtAAAsJ
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

There are two refcount bugs in this funcion:

BUG-1: 'pdata->mipi_host_node' will be assigned a new reference with
of_graph_get_remote_node() which will increase the refcount of the
object, correspondingly, we should call of_node_put() for the old
reference stored in the 'pdata->mipi_host_node'.

BUG-2: of_graph_get_endpoint_by_regs() will also increase the refcount
of the object and its new reference will be assigned to local 'ep0', so
there should be a of_node_put() when 'ep0' is not used anymore.

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 53a5da6c49dd..f39b9be19eaf 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1624,6 +1624,7 @@ static int anx7625_parse_dt(struct device *dev,
 	anx7625_get_swing_setting(dev, pdata);
 
 	pdata->is_dpi = 1; /* default dpi mode */
+	of_node_put(pdata->mipi_host_node);
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
@@ -1638,6 +1639,7 @@ static int anx7625_parse_dt(struct device *dev,
 			bus_type = 0;
 
 		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+		of_node_put(ep0);
 	}
 
 	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
-- 
2.25.1

