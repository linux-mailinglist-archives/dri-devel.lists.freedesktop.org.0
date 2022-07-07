Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF81569857
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 04:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C106110FE3D;
	Thu,  7 Jul 2022 02:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6766810FE2F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 02:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pQFwM
 YFUl7cjvOhd2VnhckYcsIi1VZESnr0u/bkXhIo=; b=IMrLZLT8hgkgCMRu14rGG
 VgilOxit0MoG1E5ttQZ5s7xi+0MEP/j7gdtwgiDRuFJAdqX+J90SgSuTMQqMrmhn
 yv2WcEeZA/WExfXz7woFWQVGP4LfJIX64H2TGS5/VJq5aGoi7VJ+vwmrjc+SWEGb
 /HJVPPPIuU2GT8lSp9xuaQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp2 (Coremail) with SMTP id DMmowACXwQTgQMZiYa3bEQ--.53758S2;
 Thu, 07 Jul 2022 10:11:45 +0800 (CST)
From: Liang He <windhl@126.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, windhl@126.com
Subject: [PATCH] drm/bridge:tc358767: Add of_node_put() when breaking out of
 loop
Date: Thu,  7 Jul 2022 10:11:43 +0800
Message-Id: <20220707021143.306926-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACXwQTgQMZiYa3bEQ--.53758S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW5tr45XF1DJry7GrWrGrg_yoWDGFb_ua
 4DZrZrur43ZF92kr42yw4aq34qyw15uFW7C3W8ta9Ika1UAry7Jw17XFWqqryxuFyUtryD
 Kw1DAFZ0yr1fAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjIPfJUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgc3F18RPcm42wABsx
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

In tc_probe_bridge_endpoint(), we should call of_node_put() when
breaking out of the for_each_endpoint_of_node() which will automatically
increase and decrease the refcount.

Fixes: 71f7d9c03118 ("drm/bridge: tc358767: Detect bridge mode from connected endpoints in DT")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 485717c8f0b4..7362a1a7a7df 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1986,8 +1986,10 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 
 	for_each_endpoint_of_node(dev->of_node, node) {
 		of_graph_parse_endpoint(node, &endpoint);
-		if (endpoint.port > 2)
+		if (endpoint.port > 2) {
+			of_node_put(node);
 			return -EINVAL;
+		}
 
 		mode |= BIT(endpoint.port);
 	}
-- 
2.25.1

