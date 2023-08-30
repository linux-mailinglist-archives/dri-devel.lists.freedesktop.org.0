Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C378D7C9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 19:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEDE10E566;
	Wed, 30 Aug 2023 17:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A739710E566
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:08:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,214,1688396400"; d="scan'208";a="174495934"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2023 02:08:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EF12C4000925;
 Thu, 31 Aug 2023 02:08:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 3/3] drm/bridge/analogix/anx78xx: Drop conditionals around
 of_node pointers
Date: Wed, 30 Aug 2023 18:08:19 +0100
Message-Id: <20230830170819.309269-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
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
Cc: Zhu Wang <wangzhu9@huawei.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having conditional around the of_node pointers turns out to make driver
code use ugly #ifdef and #if blocks. So drop the conditionals.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * Split from patch#2
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 6169db73d2fe..ad8241758896 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&anx78xx->lock);
 
-#if IS_ENABLED(CONFIG_OF)
 	anx78xx->bridge.of_node = client->dev.of_node;
-#endif
 
 	anx78xx->client = client;
 	i2c_set_clientdata(client, anx78xx);
-- 
2.25.1

