Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985466BD4A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CE510ED36;
	Thu, 16 Mar 2023 16:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8E7910E242
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BpTc3
 Eb2o/NHHOlitSSzCEg5Jn4GYMsWpzIaxLSPuA8=; b=WNSp/H78L+tWzguIm83oX
 mBX4Bxg10MzcV/0giyIZdPlwvlVRNYPG8Fm7vfAEdE3T/9vGAzRLjdB/QCZgf/OV
 9ESXfJOvA/OTTl0e8QJE9JaHjHYNiKy74MX4wlkdvD6sWjFNB2nFSRT902t4DVCg
 pIaD1jYHI0/IHcWxSHxvlk=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g3-3 (Coremail) with SMTP id _____wBnKqD0PRNkKSvSAA--.48535S2;
 Fri, 17 Mar 2023 00:04:04 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: adv7511: fix race condition bug in
 adv7511_remove due to unfinished work
Date: Fri, 17 Mar 2023 00:04:02 +0800
Message-Id: <20230316160402.1566483-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnKqD0PRNkKSvSAA--.48535S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr18Xr4rGw4ktrW3Ww1UGFg_yoWkCFXEkF
 yfZ34xWr15A3Wv9w17AFZFvrW7K3WUCrZa93WfKa9xJr43Zr1xW347XryDXF1ruF4YyFyD
 JrnrZw4rAa42kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKYFCUUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXRo0U1WBo8MtCQAAsw
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

