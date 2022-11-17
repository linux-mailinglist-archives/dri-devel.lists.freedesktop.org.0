Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582862D417
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD53B10E557;
	Thu, 17 Nov 2022 07:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD2810E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:11:52 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NCWLb29t0z5BNS0;
 Thu, 17 Nov 2022 15:11:51 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2AH7BV7m075328;
 Thu, 17 Nov 2022 15:11:31 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Nov 2022 15:11:33 +0800 (CST)
Date: Thu, 17 Nov 2022 15:11:33 +0800 (CST)
X-Zmail-TransId: 2af96375dea56961b9ff
X-Mailer: Zmail v1.0
Message-ID: <202211171511333735699@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <p.zabel@pengutronix.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9pbXg6IFVzZSBkZXZpY2VfbWF0Y2hfb2Zfbm9kZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AH7BV7m075328
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 6375DEB7.000 by FangMail milter!
X-FangMail-Envelope: 1668669111/4NCWLb29t0z5BNS0/6375DEB7.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6375DEB7.000/4NCWLb29t0z5BNS0
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
Cc: s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index e060fa6cbcb9..2e4f5af894b0 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -182,7 +182,7 @@ static int compare_of(struct device *dev, void *data)
 	if (strcmp(dev->driver->name, "imx-ipuv3-crtc") == 0) {
 		struct ipu_client_platformdata *pdata = dev->platform_data;

-		return pdata->of_node == np;
+		return device_match_of_node(pdata, np);
 	}

 	/* Special case for LDB, one device for two channels */
@@ -191,7 +191,7 @@ static int compare_of(struct device *dev, void *data)
 		of_node_put(np);
 	}

-	return dev->of_node == np;
+	return device_match_of_node(dev, np);
 }

 static int imx_drm_bind(struct device *dev)
-- 
2.25.1
