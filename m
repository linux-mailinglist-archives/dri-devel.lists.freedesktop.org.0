Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDEC273C34
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DE789F27;
	Tue, 22 Sep 2020 07:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D4589A60
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:43:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08M7bgtp028642; Tue, 22 Sep 2020 09:43:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xSlMzHlQugpdZFck23OK9HNUyveeCKKUCM08ZtAZ/yg=;
 b=ZKTgEE0cjt+sSG02tfaGuf9/2nnnnTMLamcxEQoElPfT7ZN+JlJppCupStPwYax3sU5i
 OAYA4Xe44rnhc7GI9dXiy6HwGSV715g6Xy71PawIFTN19NOudI/yCQ6ff3pOUdwxEyI+
 yCEbHdCo0+TaCWkcutdL9RZzrRh62OEi1FxClv8CPtsC7VIuVRs/8lgZP+Lg2u+y/NYv
 74KhzmhI/h13fbbHmcfCuKgImzxlUbzsCwfLg9DuFpcDnm1LN/NJGhLmLOoqEYE+O4ji
 x7wVU0U7yftTQEOmvX8lUC9LhgwoZw0jBjNN1M6CMfJVbOOkXsycox//PeRCaLQ/WlV+ vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n8vepctk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 09:43:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6F85100039;
 Tue, 22 Sep 2020 09:43:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AC7E212FAA;
 Tue, 22 Sep 2020 09:43:05 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 22 Sep 2020 09:42:59 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>, "Vincent
 Abriou" <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/panel: otm8009a: allow using non-continuous dsi clock
Date: Tue, 22 Sep 2020 09:42:53 +0200
Message-ID: <20200922074253.28810-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_06:2020-09-21,
 2020-09-22 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Antonio Borneo <antonio.borneo@st.com>

The panel is able to work when dsi clock is non-continuous, thus
the system power consumption can be reduced using such feature.

Add MIPI_DSI_CLOCK_NON_CONTINUOUS to panel's mode_flags.

Changes in v2:
  - Added my signed-off

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index b6e377aa1131..6ac1accade80 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -452,7 +452,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 2;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	drm_panel_init(&ctx->panel, dev, &otm8009a_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
