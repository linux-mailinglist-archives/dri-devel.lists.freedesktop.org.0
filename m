Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E1213809
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 11:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1E6E21A;
	Fri,  3 Jul 2020 09:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCA776E21A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 09:51:25 +0000 (UTC)
X-UUID: 3f2ac1dc8754475295786640908615f3-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jsMFJtcW/JnItlp79G6hD6yY/tk89ErR3jd+rCAsl/A=; 
 b=qS4t1aGREGKIYkBDX7FYsJa5N5tHKwJP1kvJjAZGhbGePXUKI/gMI4WBWsPjzyVlpAJmS8Mcf/fSh2Q70PQ9JnqgBXRty4TaPUbwPCO+2tUPyrj+SBsl7LE5CNt0Vh/cSjugXdpw2/3T2VRiSvKsubTdWGfYfBD0CntbCEKTJcc=;
X-UUID: 3f2ac1dc8754475295786640908615f3-20200703
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1627870794; Fri, 03 Jul 2020 17:51:18 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Jul 2020 17:51:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Jul 2020 17:51:14 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: auo,b116xw03: fix flash backlight when power on
Date: Fri, 3 Jul 2020 17:51:13 +0800
Message-ID: <20200703095113.55712-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5574DF20B4595058467B711402DB5E47F26C70718F5EC942B9184F35BC2AFF532000:8
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
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..18f34f286d3d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -734,6 +734,9 @@ static const struct panel_desc auo_b116xw03 = {
 		.width = 256,
 		.height = 144,
 	},
+	.delay = {
+		.enable = 400,
+	},
 };
 
 static const struct drm_display_mode auo_b133xtn01_mode = {
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
