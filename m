Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22FA579390
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 08:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8610E1AA;
	Tue, 19 Jul 2022 06:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6191B10E246
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 06:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5DaOm
 de4N3ejBv+8dR4AXHyMMEfC0atPFYgb9TxzQoE=; b=KdP25PZyYrEA2M8JlkIzk
 vauw8MDfQTM8P81GsHiC+b0f5ogI+k3pLlKu4znmUPOLVWnhn7pHfMrzuGCn70Lh
 zfafnshyc9vQX9zM+LVssLZLhuEWENXC7zYiPHMCIdluReckS9HSwqWdyym5EKhH
 dO8P39+SDesol6BabdPVb0=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp7 (Coremail) with SMTP id DsmowABnEvw4VdZib+YbFQ--.30596S2;
 Tue, 19 Jul 2022 14:54:49 +0800 (CST)
From: Liang He <windhl@126.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 windhl@126.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/bridge: anx7625: Fix refcount bug in
 anx7625_parse_dt()
Date: Tue, 19 Jul 2022 14:54:46 +0800
Message-Id: <20220719065447.1080817-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABnEvw4VdZib+YbFQ--.30596S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1fuFy8CFWUGr4kGr4kWFg_yoW8GrW8pF
 47KFW5Zrn7Ga1xK397ZayrCryqvaykWFWrCrWUA3ZxZwn7AF17ArZF9FyfXas8GFW8JFyr
 G3WUtF90vFyjqr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zirWrtUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgFDF1-HZhn5ngAAsP
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

In anx7625_parse_dt(), 'pdata->mipi_host_node' will be assigned a
new reference with of_graph_get_remote_node() which will increase
the refcount of the object, correspondingly, we should call
of_node_put() for the old reference stored in the 'pdata->mipi_host_node'.

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: (1) rebase with drm-misc-next advised by Robert Foss
     (2) use proper title
     (3) remove the v1's second bug ('ep0'), fixed recently
 v1: https://lore.kernel.org/all/20220707012330.305646-1-windhl@126.com/ 

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index d1f1d525aeb6..79fc7a50b497 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1642,6 +1642,7 @@ static int anx7625_parse_dt(struct device *dev,
 	anx7625_get_swing_setting(dev, pdata);
 
 	pdata->is_dpi = 0; /* default dsi mode */
+	of_node_put(pdata->mipi_host_node);
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
-- 
2.25.1

