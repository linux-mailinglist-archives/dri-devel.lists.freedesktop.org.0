Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581587ECF3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCBB10ED83;
	Mon, 18 Mar 2024 16:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qJNjHZve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4323710F05F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:06:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBDDEB1;
 Mon, 18 Mar 2024 17:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710777938;
 bh=78rgzwYqOe3WyOt3q/ZJlVnklBmhkiiUO0KtDQn1iFU=;
 h=From:To:Cc:Subject:Date:From;
 b=qJNjHZveciZSpHFADt8HAt2HZSnUWYBpaeQf4H9hBV97MdCfnxoc9gZ1c2jiiYiTz
 J4GQg6fc4Qlw1F86mQZEjHcUmUjSD7GcQo+DUPq2XP7h6uYFgW5p1yw4wmMBkK2Cw0
 0oCcfjiWSQU8APF69ZpfHuw9Y/4oIJ7MLxjmBLxA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Date: Mon, 18 Mar 2024 18:06:01 +0200
Message-ID: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
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

Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
replacing hand-rolled code with a helper function. While doing so, it
created an error code path at probe time without any error message,
potentially causing probe issues that get annoying to debug. Fix it by
adding an error message.

Fixes: 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 5f99f9724081..674efc489e3a 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 
 	remote = of_graph_get_remote_node(thc63->dev->of_node,
 					  THC63_RGB_OUT0, -1);
-	if (!remote)
+	if (!remote) {
+		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
+			THC63_RGB_OUT0);
 		return -ENODEV;
+	}
 
 	thc63->next = of_drm_find_bridge(remote);
 	of_node_put(remote);

base-commit: 00084f0c01bf3a2591d007010b196e048281c455
-- 
Regards,

Laurent Pinchart

