Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11A214B98
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 11:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED756EBFF;
	Sun,  5 Jul 2020 09:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A8756EBFF
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 09:45:19 +0000 (UTC)
X-UUID: 01c2d30a1a264464bfaf3bdfa81b5c77-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QLXFgb8ipruaYvgJKRS7Q6ukuCrrcRqCGEhV6ucS7zw=; 
 b=HiAajLMNjaXMw8PKwsFvnhhjmiD1xG5++uTtU9Pm9P8JCDt6qBaeKgX8nMOkz3qCL0fb31ecLkXr82FJ2dY03Gpd+TYrzb7DjEiJqttSnkJEyUt0BUR95EZVwtHxCv3oaiqlNLmenXL04UsOMWKaaXFdVy0qSsYdLetDocRHtN4=;
X-UUID: 01c2d30a1a264464bfaf3bdfa81b5c77-20200705
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 739802030; Sun, 05 Jul 2020 17:45:10 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 5 Jul 2020 17:45:08 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 5 Jul 2020 17:45:08 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v2 PATCH] drm/panel: auo, b116xw03: fix flash backlight when power on
Date: Sun, 5 Jul 2020 17:45:14 +0800
Message-ID: <20200705094514.34526-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 17185F853249A3A30FADDE7A20621E16B03AD050448041C032CAE16CCD00B50E2000:8
X-MTK: N
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
Cc: huijuan.xie@mediatek.com, stonea168@163.com,
 linux-mediatek@lists.infradead.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delay the backlight on to make sure the video stable.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..61781ffa7840 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -724,6 +724,7 @@ static const struct drm_display_mode auo_b116xw03_mode = {
 	.vsync_end = 768 + 10 + 12,
 	.vtotal = 768 + 10 + 12 + 6,
 	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
 static const struct panel_desc auo_b116xw03 = {
@@ -734,6 +735,12 @@ static const struct panel_desc auo_b116xw03 = {
 		.width = 256,
 		.height = 144,
 	},
+	.delay = {
+		.enable = 400,
+	},
+	.bus_flags = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
 static const struct drm_display_mode auo_b133xtn01_mode = {
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
