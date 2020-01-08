Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D0134459
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 14:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604D66E2EC;
	Wed,  8 Jan 2020 13:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2020 13:56:48 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6B16E2EC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 13:56:48 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M1HmG-1irvZ64Bre-002q6O; Wed, 08 Jan 2020 14:51:19 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] [v2] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
Date: Wed,  8 Jan 2020 14:51:05 +0100
Message-Id: <20200108135116.3687988-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:tKeoXcUsVKacqijm/XBhh86H/1egpokkSRB3oJsHcu9HgP2Y928
 1GSfviPvOtLi8YZQaeX23+XqClPiJrywRCkJJRGjf8vAfQfiopAva7YFo0tnacKJDhyia6v
 nYYGyu/22VW3xwc/I5Kcaf1stwZOTbn9Uk/fdCdpa1CSzmYXbgEVMI+3dfKJEF4pjqd14+w
 b59uP2AOjmLkOyP7/qYkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rP9NgrqvnYc=:2+J0J2APKPEoDIVOqsFq5g
 4lsM4D/YW2vmYAHacrCc9Y2cPHGVbkhgf5IsF0oxrmmIfb89ObfFjXcP8lHGfhzA7/vFV7ubB
 DakuJyoOpBnJ+MBG6Qg3w8Q9js5yndpBbB+PqaxBjd35XPkWy19HKlhAqknpOQoozQTUIUNMs
 OEDOaUm7d9JxlhFu2PxAO0po/07MrOa9z8OOghLGjrEMBN45T+ZhUEMz9E69xihELY/l2EWxI
 lw7AoFO3u3QltJQpWSSf2ldaF0uHr613npVqNPoyoU8POhEElyRizgEK1U0T2J6IKtR+IOdUc
 yiL76TD4AS081iWXgLx9BroZG+tXXLJFTmprDky6JYoiy+1Rk9W5bkYVNAmRl1IDofZwCor3j
 JbschIZsd+C7/j9hGHRJl2WVIZ9Z+4S2o91VGbsDZzABKMNhU0TTe5Bh09bFULQq7khP8Ww04
 hcBLQ6213mBQ78qP+H2ZKIwkc4FU1crv/DTPAJs9PIG83cM75YAtnP89uW4GaoqenagzTUTsm
 DGvxFmbdmP3mXe8NXhjUTaz0MSknRdpg0kfsK50qfHWY3toJ6hCmErA4vBcNhS1EKUDa71JSt
 Ln7+RW8+8r0ZWIK22NIbs9E1WE20w4mTjjsXlEdQ7JzNj5Wl2Lrbe2ZTb83jOzVTNa7kfmLSZ
 iaJPKgA9wE6hSWViNl/+FaJqESfT/zrFxvdx+wDp4nlkM3bLfEncsEcu/1YKvhxkqQz6zYV9k
 ZWtiWvAM7W3TJPQUv1NnvxeLnO5goXCIs6xoH76JT9wnaulohMoOkvP/wbfL2v8AQu40HjZ9h
 eexqRbdH4Ajr41EcqukK35QQBtgnW7AUAFjXJRnzDOen5a7DT9yvrJs+ly6uE1NsbCknaRVM2
 hBQlmsp/7PQwUu2WqEdw==
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With gcc -O3 in combination with the structleak plug, the compiler can
inline very aggressively, leading to rather large stack usage:

drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 }

Marking jbt_reg_write_*() as noinline avoids the case where
multiple instances of this function get inlined into the same
stack frame and each one adds a copy of 'tx_buf'.

The compiler is clearly making some bad decisions here, but I
did not open a new bug report as this only happens in combination
with the structleak plugin.

Link: https://lore.kernel.org/lkml/CAK8P3a3jAnFZA3GFRtdYdg1-i-oih3pOQzkkrK-X3BGsFrMiZQ@mail.gmail.com/
Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
- mark all three functions as noinlien
- add code comment
- add link to more detailed analysis
---
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index cf29405a2dbe..5034db8b55de 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -86,7 +86,12 @@ struct td028ttec1_panel {
 
 #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
 
-static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
+/*
+ * noinline_for_stack so we don't get multiple copies of tx_buf
+ * on the stack in case of gcc-plugin-structleak
+ */
+static int noinline_for_stack
+jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
 {
 	struct spi_device *spi = lcd->spi;
 	u16 tx_buf = JBT_COMMAND | reg;
@@ -105,7 +110,8 @@ static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
 	return ret;
 }
 
-static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
+static int noinline_for_stack
+jbt_reg_write_1(struct td028ttec1_panel *lcd,
 			   u8 reg, u8 data, int *err)
 {
 	struct spi_device *spi = lcd->spi;
@@ -128,7 +134,8 @@ static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
 	return ret;
 }
 
-static int jbt_reg_write_2(struct td028ttec1_panel *lcd,
+static int noinline_for_stack
+jbt_reg_write_2(struct td028ttec1_panel *lcd,
 			   u8 reg, u16 data, int *err)
 {
 	struct spi_device *spi = lcd->spi;
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
