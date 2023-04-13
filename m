Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C56E074A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B133B10EA36;
	Thu, 13 Apr 2023 07:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A33E10EA35
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aYYjM
 s6sgb58wXmA0ce7H6o1vGXUMJqQKzsl1vTbGpk=; b=jcmkrjdXcvS6G5KG6yHL2
 KzWzP5OrsZiIFA3Mnmx8hhl1uLs5IVd/89uSq83Fc7yIgn6RrR+gVlXjc1IwRofs
 /uji6+DgA9dsQ3MvfYervGA6Pg+JnvCyxI5d/+zK2wwYdg1o2yxrUxmEXVYOTJ53
 t5Lokij8JQJ3szKBc42I74=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wC3x79gqDdkks5dBQ--.23663S2;
 Thu, 13 Apr 2023 14:59:44 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: adv7511: fix use after free bug in
 adv7511_remove due to race condition
Date: Thu, 13 Apr 2023 14:59:43 +0800
Message-Id: <20230413065943.198088-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3x79gqDdkks5dBQ--.23663S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary7JrW3XFWDtrW7Cry8Zrb_yoW8Ar4fp3
 y3uF90krWUXFnrKa9rJF45Aa4rCw4Dtr1S9FZruwnIvrn8ZF18JrZ0yF15try7XrWkXa12
 qr4UAFykWFn8AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziI38rUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiGg1QU1aEE4gpSgACs8
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, alex000young@gmail.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In adv7511_probe, adv7511->hpd_work is bound with adv7511_hpd_work.
adv7511_irq_process might be called to start the work.

If we call adv7511_remove with an unfinished work. There may be a
race condition. Here is the possible sequence:

CPU0                  CPU1

                     |adv7511_hpd_work
adv7511_remove       |
cec_devnode_release  |
cec_unregister_adapter|
cec_devnode_unregister|
put_device(&devnode->dev);|
cec_devnode_release	|
cec_delete_adapter  |
kfree(adap);		|
                     |cec_phys_addr_invalidate
                     |//use adap

Fix it by canceling the work before cleanup in adv7511_remove.

This is the patch with new title in order to clarify the bug. Old patch
is here. The root cause is the same as old one.

https://lore.kernel.org/all/20230316160548.1566989-1-zyytlz.wz@163.com/

Fixes: 518cb7057a59 ("drm/bridge: adv7511: Use work_struct to defer hotplug handing to out of irq context")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
v2:
- Fix space error from checkpacth script
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..e702a993fe6f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1349,6 +1349,10 @@ static void adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
+	if (i2c->irq)
+		devm_free_irq(&i2c->dev, i2c->irq, adv7511);
+	cancel_work_sync(&adv7511->hpd_work);
+
 	adv7511_uninit_regulators(adv7511);
 
 	drm_bridge_remove(&adv7511->bridge);
-- 
2.25.1

