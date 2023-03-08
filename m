Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E86B106E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F010E6D1;
	Wed,  8 Mar 2023 17:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 917 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 17:50:52 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6E6510E058
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=eRJDP
 6Vc/O5/BFT6QkUGAFvagsrz1RUcQ8m4GSGcwQk=; b=P5+8O4pcjaMSwWpLWwf5s
 XIdfhUahbwYqB9yeVw1rQo82QfZS1BFndK4SzOZYbmrKGLF8ZxwtELHqnK27lXBL
 jONOpczcOW5YU4K1BAwIQVxXKf2lyKQ+l4Crhrl5eAzUxfzg0QIg/UIEcbdY392x
 D+ZEgMrIAKmaF9pau0sqp0=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3SnQqxwhkOjFfCg--.59019S2;
 Thu, 09 Mar 2023 01:34:35 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: adv7511: fix race condition bug in adv7511_remove
 due to unfinished work
Date: Thu,  9 Mar 2023 01:34:33 +0800
Message-Id: <20230308173433.2788833-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3SnQqxwhkOjFfCg--.59019S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr18Xr4rGw4ktrW3Ww1UGFg_yoWDZFbEkF
 y3Z34xWr15A3Wv9w17AFW2vry2k3WUCrZI93WfKa9xJr13Zr1rW347ZrWDXF18uF4YyFyD
 JrnrZw4rJa42yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKPfHUUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiGg0sU1aEEgVt2wAAsb
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
If we call adv7511_remove with a unfinished work. There may be a 
race condition where bridge->hpd_mutex was destroyed by 
drm_bridge_remove and used in adv7511_hpd_work in drm_bridge_hpd_notify.

Fix it by canceling the work before cleanup in adv7511_remove.

Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..9bf72dd6c1d3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1349,6 +1349,7 @@ static void adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
+	cancel_work_sync(&adv7511->hpd_work);
 	adv7511_uninit_regulators(adv7511);
 
 	drm_bridge_remove(&adv7511->bridge);
-- 
2.25.1

