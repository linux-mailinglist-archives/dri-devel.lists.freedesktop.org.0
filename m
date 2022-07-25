Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EA580BDC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1210F338;
	Tue, 26 Jul 2022 06:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1142 seconds by postgrey-1.36 at gabe;
 Mon, 25 Jul 2022 16:28:12 UTC
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D4DC0DDC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:28:12 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PBvCPm014322;
 Mon, 25 Jul 2022 11:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=z4lRKHV6yDE+tFoR/h+h4SKnvWEw0GC31z3Cz0MPoDM=;
 b=VC44h+gb1ZSHjyFxR4xJ4cZ/gvGFJh0VoDnnieADvMom6W35qkmlXP32PWTmJxYHt3Eh
 uAxq3KYN/GtL5ibj5oXyQkFxlytvPxQrj/lkj1V2hBBnJhxkxdC/3dQe14/x/Wk4TYIC
 G3Pp0kk7+jP6J6zx/o1JRqAbSzZB4njC/tpzp9Q4FtsN/sdP92PBe/SfCYNEEAkVyjNB
 2yR0imlNipEV0uRk0RMY9Cc2pdJJI6+LdTJIg7LYz8UmobSa3rO7/sn2SWRmzi+XkpsG
 hiValjAt2J4qqH+tD/4CHOWeq+V7Xaj7rJTlqL+OM6WsQbRAl5wpLLHcJROHj7d5HD1p /Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1tcct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 11:09:01 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Mon, 25 Jul
 2022 11:08:59 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Mon, 25 Jul 2022 11:08:59 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C83A22C5;
 Mon, 25 Jul 2022 16:08:59 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>
Subject: [PATCH] component: try_module_get() to prevent unloading while in use
Date: Mon, 25 Jul 2022 17:08:59 +0100
Message-ID: <20220725160859.1274472-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fMbTqrtUWhXtJO7PBzxVL_GLiF6YMRuc
X-Proofpoint-ORIG-GUID: fMbTqrtUWhXtJO7PBzxVL_GLiF6YMRuc
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Tue, 26 Jul 2022 06:47:09 +0000
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
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call try_module_get() on a component before attempting to call its
bind() function, to ensure that a loadable module cannot be
unloaded while we are executing its bind().

If the bind is successful the module_put() is called only after it
has been unbound. This ensures that the module cannot be unloaded
while it is in use as an aggregate device.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/base/component.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5eadeac6c532..01dbef4a6187 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -580,6 +580,8 @@ static void component_unbind(struct component *component,
 
 	/* Release all resources claimed in the binding of this component */
 	devres_release_group(component->dev, component);
+
+	module_put(component->dev->driver->owner);
 }
 
 /**
@@ -617,13 +619,18 @@ static int component_bind(struct component *component, struct aggregate_device *
 {
 	int ret;
 
+	if (!try_module_get(component->dev->driver->owner))
+		return -ENODEV;
+
 	/*
 	 * Each component initialises inside its own devres group.
 	 * This allows us to roll-back a failed component without
 	 * affecting anything else.
 	 */
-	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL)) {
+		module_put(component->dev->driver->owner);
 		return -ENOMEM;
+	}
 
 	/*
 	 * Also open a group for the device itself: this allows us
@@ -632,6 +639,7 @@ static int component_bind(struct component *component, struct aggregate_device *
 	 */
 	if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
 		devres_release_group(adev->parent, NULL);
+		module_put(component->dev->driver->owner);
 		return -ENOMEM;
 	}
 
-- 
2.30.2

