Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD16BD4A9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC0410E2DA;
	Thu, 16 Mar 2023 16:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAEA210ED0C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kRZV+
 8Q/emx5bHidIKO6PtLhBxtpwJPSftAEhgOkuYk=; b=NVzX9q+f0YmZlVAGydm1J
 zBGA5qBvFyOomt8UAtUkhW2xqZ9+uc6Ir5bvl4z5Ie3VqKRS26ZhN+76A5lTSm9G
 d+kjo3iuPwcZXvyk7eXYuAMbVaWYBOcWbqrO42hZyhN9rdkOh1IgtD+uo6TbsSCF
 4oxpMU6C4hFDu/qWOvDsc0=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wDHi0FdPhNkuGIYAQ--.38781S2;
 Fri, 17 Mar 2023 00:05:49 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/bridge: adv7511: fix race condition bug in
 adv7511_remove due to unfinished work
Date: Fri, 17 Mar 2023 00:05:48 +0800
Message-Id: <20230316160548.1566989-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHi0FdPhNkuGIYAQ--.38781S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr18Xr4rGw4ktrW3Ww1UGFg_yoW8Jr4Upa
 13uF98CrWUXFnrKayDAF1fta4rAwsrJF1F9a9ruwnavr1UXFyUArZ0yFyYyry7WFWxX3W3
 tr1UtFykWrnxAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zicyCZUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBzgM0U2I0XqqgGAAAsw
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
Fixes: 518cb7057a59 ("drm/bridge: adv7511: Use work_struct to defer hotplug handing to out of irq context")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
v3:
- add patch modification information
v2:
- add Fix label
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

