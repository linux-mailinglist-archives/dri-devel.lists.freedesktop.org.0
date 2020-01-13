Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E4713926C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 14:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3BB89D1D;
	Mon, 13 Jan 2020 13:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229589D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 13:45:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DDjYd3127528;
 Mon, 13 Jan 2020 07:45:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578923134;
 bh=pHFAWEOo3CfAWKNbGyBw+Wd3hOOCch/IB2uJyZBXaE0=;
 h=From:To:CC:Subject:Date;
 b=RdvZb5LVQssd3pPB5iiA2hDD5MqxeQfYy2K4q9I3cd7uVscexiSKhxTnYXgVj5Jni
 Pm3Di4EPmwONaXq+i/ICtGNyplHYMVmxFDnfbtaf/KcDqe2iKPzuQHxYN6hCuc3N3/
 baZYmg1Yh400wao8nGQ9cAGil44HFYbyFUQ0rpWw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DDjYhI124993
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jan 2020 07:45:34 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 07:45:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 07:45:33 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DDjVfI023691;
 Mon, 13 Jan 2020 07:45:32 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] drm/bridge: tfp410: add pclk limits
Date: Mon, 13 Jan 2020 15:45:28 +0200
Message-ID: <20200113134528.9851-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add pixel clock limits to the driver as per TFP410 datasheet: min 25MHz,
max 165MHz.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 6f6d6d1e60ae..f378a8f79bcb 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -167,10 +167,20 @@ static void tfp410_disable(struct drm_bridge *bridge)
 	gpiod_set_value_cansleep(dvi->powerdown, 1);
 }
 
+static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
+					      const struct drm_display_mode *mode)
+{
+	if (mode->clock < 25000 || mode->clock > 165000)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.attach		= tfp410_attach,
 	.enable		= tfp410_enable,
 	.disable	= tfp410_disable,
+	.mode_valid	= tfp410_mode_valid,
 };
 
 static void tfp410_hpd_work_func(struct work_struct *work)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
