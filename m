Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B321F17A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 14:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96A389CD8;
	Tue, 14 Jul 2020 12:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7689CD8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 12:38:32 +0000 (UTC)
X-UUID: d6ef85c347bc43babe4ced86f8cba352-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Wb9Fg/DmCPoZvHFLV++Y4wJJ7QCWM6MgqBt23e2lcAY=; 
 b=GH0UPLX76G/0Qc+7HBFMgCT3BZIQUy8i7zZcEUvsfs6aZy6ZJxp0G4lM7FNSnFZbvqdjr0y7C9uzFVQsdjjEAKGQ0hBxOYI7G1vWzh4duqFriFyAI5maLNI8EO2kriFHgimDVtNtQqzU5ihHtvJ88OO1/xzeuEKpNH4YyVslRHg=;
X-UUID: d6ef85c347bc43babe4ced86f8cba352-20200714
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 745820965; Tue, 14 Jul 2020 20:33:25 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Jul 2020 20:33:22 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 14 Jul 2020 20:33:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: Fix auo,
 kd101n80-45na horizontal noise on edges of panel
Date: Tue, 14 Jul 2020 20:33:32 +0800
Message-ID: <20200714123332.37609-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18BDFD4BAA21069D5BD3D14833E558734FF6512BDBB22C05656E7C8D6A48DBC92000:8
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

Fine tune the HBP and HFP to avoid the dot noise on the left and right edges.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 48a164257d18..3edb33e61908 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -615,9 +615,9 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
 static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
 	.clock = 157000,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 80,
-	.hsync_end = 1200 + 80 + 24,
-	.htotal = 1200 + 80 + 24 + 36,
+	.hsync_start = 1200 + 60,
+	.hsync_end = 1200 + 60 + 24,
+	.htotal = 1200 + 60 + 24 + 56,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 16,
 	.vsync_end = 1920 + 16 + 4,
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
