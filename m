Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BF3212FA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 10:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5E6E92B;
	Mon, 22 Feb 2021 09:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3596E92B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 09:23:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11M9KlGt016260; Mon, 22 Feb 2021 10:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=CEx+dJ33M2OiDJi9X3qiBhe30dtWSWB5g83Cp50fZwo=;
 b=SPezn6Ht4XYEb6ypx4NcpjfSKDUoxH9t7hs3mdMsQ7MmKdt4RSveqAbhYkBBCyoOHRbY
 vfrMA0SbCiZTs+WUJhv3vmXA4RzvXAMYSGrNDXYwXpRxutrPXka73iN8Ebg/9Jo5CiRJ
 8tE5oHCUh3TBGjldR8e0zMkJXCbZO4Tc14l5xL6F46/ezS2bydlp4/8SOSnSGx7/oZD9
 PKt15Ns7tEg5lhEvcIoHt1uuKujNlWsp/f1PDbRFwUciVEXCXlXFZzhrc2BoDiD/erEL
 ZjOxXQO5X7jdc8L1lY4Df0hTF0yPb2KhWjivfinODJo7zEMH8Y63rFErZoxOCs+9D+Ac wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ttn6tneb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 10:22:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32CE010002A;
 Mon, 22 Feb 2021 10:22:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2342B21F0A7;
 Mon, 22 Feb 2021 10:22:58 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Feb
 2021 10:22:57 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 22 Feb 2021 10:22:57 +0100
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Sam Ravnborg <sam@ravnborg.org>, "Joe Perches" <joe@perches.com>
Subject: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Thread-Topic: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Thread-Index: AQHXCPxOHztlhOrGKUWaJgLQSaRSdw==
Date: Mon, 22 Feb 2021 09:22:57 +0000
Message-ID: <20210222092205.32086-2-raphael.gallais-pou@foss.st.com>
References: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_02:2021-02-18,
 2021-02-22 signatures=0
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
Cc: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@st.com>

Don't print error when probe deferred error is returned.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2e1f2664495d..8399d337589d 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -363,8 +363,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->vdd_supply = devm_regulator_get(dev, "phy-dsi");
 	if (IS_ERR(dsi->vdd_supply)) {
 		ret = PTR_ERR(dsi->vdd_supply);
-		if (ret != -EPROBE_DEFER)
-			DRM_ERROR("Failed to request regulator: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to request regulator\n");
 		return ret;
 	}
 
@@ -377,9 +376,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
 		ret = PTR_ERR(dsi->pllref_clk);
-		if (ret != -EPROBE_DEFER)
-			DRM_ERROR("Unable to get pll reference clock: %d\n",
-				  ret);
+		dev_err_probe(dev, ret, "Unable to get pll reference clock\n");
 		goto err_clk_get;
 	}
 
@@ -419,7 +416,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
 	if (IS_ERR(dsi->dsi)) {
 		ret = PTR_ERR(dsi->dsi);
-		DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
 		goto err_dsi_probe;
 	}
 
-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
