Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8F210AB6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09356E89F;
	Wed,  1 Jul 2020 12:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69326E89F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:04:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061BsUri021383; Wed, 1 Jul 2020 14:04:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Ljx3jsZZFIQ7xSm8ZJvSzuKpK0meAfEeFxtF2zZEFYc=;
 b=fb7cuRhLxGzcX8nKWbKjpT7OfnBxp+qNk7oCqA/ls3qEgUKwWWFqJvftpNRJNQ36k9dm
 76X4hOkHhyMKsvcaTfXqwcYlRxmjwqpXv2+9hcVrVNrcMw4plpoIthjokrHSozxqDNtB
 qKEVWde2MeJjGX4Vx9lVGmmJYXHxfaDtZlb7Ihss/6Qg5G8hA769U3rjli3oKjwfUiaZ
 2oR9PaLMR0+MDrPZbFIkuE9NPNoHF8ovdXf98HeX2tclZ2Ppo0Q4SF80YrSYJkSrAhuE
 9O2CK8Wqcpj/dGlbWYApLDibhJtQofNa3eSB/N12B+i5U1YXGy0+jLXhhf+YLzEKrvtC WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0g9sx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 14:04:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 605A810002A;
 Wed,  1 Jul 2020 14:04:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43F922B2CE5;
 Wed,  1 Jul 2020 14:04:06 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 1 Jul 2020 14:04:05 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: remove call of pm-runtime functions
Date: Wed, 1 Jul 2020 14:04:02 +0200
Message-ID: <20200701120402.6444-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_07:2020-07-01,
 2020-07-01 signatures=0
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

It is not necessary to suspend or stop the ltdc clocks
to modify the pixel clock.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 3f590d916e91..6e28f707092f 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -506,15 +506,7 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
 				 struct drm_display_mode *adjusted_mode)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
 	int rate = mode->clock * 1000;
-	bool runtime_active;
-	int ret;
-
-	runtime_active = pm_runtime_active(ddev->dev);
-
-	if (runtime_active)
-		pm_runtime_put_sync(ddev->dev);
 
 	if (clk_set_rate(ldev->pixel_clk, rate) < 0) {
 		DRM_ERROR("Cannot set rate (%dHz) for pixel clk\n", rate);
@@ -523,14 +515,6 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
 
 	adjusted_mode->clock = clk_get_rate(ldev->pixel_clk) / 1000;
 
-	if (runtime_active) {
-		ret = pm_runtime_get_sync(ddev->dev);
-		if (ret) {
-			DRM_ERROR("Failed to fixup mode, cannot get sync\n");
-			return false;
-		}
-	}
-
 	DRM_DEBUG_DRIVER("requested clock %dkHz, adjusted clock %dkHz\n",
 			 mode->clock, adjusted_mode->clock);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
