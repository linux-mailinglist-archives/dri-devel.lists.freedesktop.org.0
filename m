Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66962D41B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0872C10E559;
	Thu, 17 Nov 2022 07:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1718 seconds by postgrey-1.36 at gabe;
 Thu, 17 Nov 2022 07:00:48 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280A410E54A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:00:47 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NCW5p2x9Zz8R040;
 Thu, 17 Nov 2022 15:00:46 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2AH70cgR059705;
 Thu, 17 Nov 2022 15:00:38 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Nov 2022 15:00:40 +0800 (CST)
Date: Thu, 17 Nov 2022 15:00:40 +0800 (CST)
X-Zmail-TransId: 2af96375dc18ffffffffb19f3ea9
X-Mailer: Zmail v1.0
Message-ID: <202211171500403515273@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <maarten.lankhorst@linux.intel.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9wYW5lbDogVXNlIGRldmljZV9tYXRjaF9vZl9ub2RlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AH70cgR059705
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 6375DC1E.000 by FangMail milter!
X-FangMail-Envelope: 1668668446/4NCW5p2x9Zz8R040/6375DC1E.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6375DC1E.000/4NCW5p2x9Zz8R040
X-Mailman-Approved-At: Thu, 17 Nov 2022 07:29:39 +0000
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
Cc: tzimmermann@suse.de, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/drm_panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..ba66ac1ad88a 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -250,7 +250,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 	mutex_lock(&panel_lock);

 	list_for_each_entry(panel, &panel_list, list) {
-		if (panel->dev->of_node == np) {
+		if (device_match_of_node(panel->dev, np)) {
 			mutex_unlock(&panel_lock);
 			return panel;
 		}
-- 
2.25.1
