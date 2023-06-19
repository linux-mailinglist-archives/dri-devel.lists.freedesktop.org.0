Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2D736408
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1E910E270;
	Tue, 20 Jun 2023 07:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 515 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jun 2023 16:12:05 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9852710E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:12:05 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id 0ECA415360;
 Mon, 19 Jun 2023 17:03:28 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 005FE21A4DD; Mon, 19 Jun 2023 17:03:27 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: led_bl: take led_access lock when required
Date: Mon, 19 Jun 2023 17:02:49 +0100
Message-ID: <20230619160249.10414-1-mans@mansr.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Jun 2023 07:08:55 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The led_access lock must be held when calling led_sysfs_enable() and
led_sysfs_disable().  This fixes warnings such as this:

[    2.432495] ------------[ cut here ]------------
[    2.437316] WARNING: CPU: 0 PID: 22 at drivers/leds/led-core.c:349 led_sysfs_disable+0x54/0x58
[    2.446105] Modules linked in:
[    2.449218] CPU: 0 PID: 22 Comm: kworker/u2:1 Not tainted 6.3.8+ #1
[    2.456268] Hardware name: Generic AM3517 (Flattened Device Tree)
[    2.462402] Workqueue: events_unbound deferred_probe_work_func
[    2.468353]  unwind_backtrace from show_stack+0x10/0x14
[    2.473632]  show_stack from dump_stack_lvl+0x24/0x2c
[    2.478759]  dump_stack_lvl from __warn+0x9c/0xc4
[    2.483551]  __warn from warn_slowpath_fmt+0x64/0xc0
[    2.488586]  warn_slowpath_fmt from led_sysfs_disable+0x54/0x58
[    2.494567]  led_sysfs_disable from led_bl_probe+0x20c/0x3b0
[    2.500305]  led_bl_probe from platform_probe+0x5c/0xb8
[    2.505615]  platform_probe from really_probe+0xc8/0x2a0
[    2.510986]  really_probe from __driver_probe_device+0x88/0x19c
[    2.516967]  __driver_probe_device from driver_probe_device+0x30/0xcc
[    2.523498]  driver_probe_device from __device_attach_driver+0x94/0xc4
[    2.530090]  __device_attach_driver from bus_for_each_drv+0x80/0xcc
[    2.536437]  bus_for_each_drv from __device_attach+0xf8/0x19c
[    2.542236]  __device_attach from bus_probe_device+0x8c/0x90
[    2.547973]  bus_probe_device from deferred_probe_work_func+0x80/0xb0
[    2.554504]  deferred_probe_work_func from process_one_work+0x228/0x4c0
[    2.561187]  process_one_work from worker_thread+0x1fc/0x4d0
[    2.566925]  worker_thread from kthread+0xb4/0xd0
[    2.571685]  kthread from ret_from_fork+0x14/0x2c
[    2.576446] Exception stack(0xd0079fb0 to 0xd0079ff8)
[    2.581573] 9fa0:                                     00000000 00000000 00000000 00000000
[    2.589813] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.598052] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.604888] ---[ end trace 0000000000000000 ]---


Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/video/backlight/led_bl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index f54d256e2d54..7d02deb3444a 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -209,8 +209,11 @@ static int led_bl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->bl_dev);
 	}
 
-	for (i = 0; i < priv->nb_leds; i++)
+	for (i = 0; i < priv->nb_leds; i++) {
+		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_disable(priv->leds[i]);
+		mutex_unlock(&priv->leds[i]->led_access);
+	}
 
 	backlight_update_status(priv->bl_dev);
 
-- 
2.41.0

