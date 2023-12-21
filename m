Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37D81B634
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47D610E6AE;
	Thu, 21 Dec 2023 12:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9110E6AE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 12:45:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BL8YJLO028799; Thu, 21 Dec 2023 13:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=B5wcMGFh4CoqzFZs1z1bofbkFA+Gq4yfIFxfUXbmg0w=; b=qQ
 xjOrsuXkb4jpD3YwNDUc0eafrC0lk30/ar8BGOgkLwTFrJoHCvwfsR5/gzwKeQL9
 ViP+uGdEX0d5iVKxaa8Cnp2KsPac4/SQsQmICJwfKnIzgibKQIaEwVEsBZl87mFF
 ZQp5378V5QZgr1Pn7bxc8b1QTYN4a+7rmHLED8H+hFOLIyNzK9BvNDUbu66QHAtx
 6ucfjWLvCJ0JqL3B+314P9RohJ00SeLE7RePT3oANaXC4POsRR3FH/lC/1k8+g1U
 01XTleGRcJGId1KEfUxCZuK1B0mYOMlZMxVw0IrYgkPKr7BcZ6oBLpYFwbMW/nLi
 lffGRXbCC4kbSO5vbWtA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v4hyh9bca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Dec 2023 13:45:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D76F100053;
 Thu, 21 Dec 2023 13:45:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82856212FA4;
 Thu, 21 Dec 2023 13:45:11 +0100 (CET)
Received: from localhost (10.252.25.159) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Dec
 2023 13:45:11 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: [PATCH RESEND v1 4/8] drm/stm: ltdc: implement bus clock
Date: Thu, 21 Dec 2023 13:43:35 +0100
Message-ID: <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.25.159]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_06,2023-12-20_01,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

The latest hardware version of the LTDC presents the addition of a bus
clock, which contains the global configuration registers and the interrupt
register.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 8 ++++++++
 drivers/gpu/drm/stm/ltdc.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5576fdae4962..67064f47a4cb 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1896,6 +1896,8 @@ void ltdc_suspend(struct drm_device *ddev)
 
 	DRM_DEBUG_DRIVER("\n");
 	clk_disable_unprepare(ldev->pixel_clk);
+	if (ldev->bus_clk)
+		clk_disable_unprepare(ldev->bus_clk);
 }
 
 int ltdc_resume(struct drm_device *ddev)
@@ -1910,6 +1912,12 @@ int ltdc_resume(struct drm_device *ddev)
 		DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
 		return ret;
 	}
+	if (ldev->bus_clk) {
+		if (clk_prepare_enable(ldev->bus_clk)) {
+			DRM_ERROR("Unable to prepare bus clock\n");
+			return -ENODEV;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 9d488043ffdb..155d8e4a7c6b 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -44,6 +44,7 @@ struct ltdc_device {
 	void __iomem *regs;
 	struct regmap *regmap;
 	struct clk *pixel_clk;	/* lcd pixel clock */
+	struct clk *bus_clk;	/* bus clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;
 	u32 irq_status;
-- 
2.25.1

