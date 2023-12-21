Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEC81B5D5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDA710E34B;
	Thu, 21 Dec 2023 12:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1628810E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 12:30:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BL8jmp8012041; Thu, 21 Dec 2023 13:29:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=uRYfWrQ
 hXzw+M+0seKB6CQA/JwDHEIQuybIPuZL1Ego=; b=IxtmiNBZvyI+0vjIfaXpEWv
 NiKFuUNm8Sy2Pd/YUC+2QD0olf6MyA1SFF49i183CFOoIA086srUC/4WxS60GZGR
 Hoc1/WaX8elLo/h9sMTFmEjetk3dbihIfFlizI6vbGvhGxWfdcR1jlPqYf6qLZKb
 htqeCzDzs/AFr+2D/VZsW/d+c0tI9njDFTl7NLAiVWElYy4MB7zIjzT16gfR32xF
 BeFWG/G9NRZB/LGBeTjvb5crhWO9+nRyBKvotKOSmydevygTQwpF7sQN8J//VRNB
 vTPmnVGoLeIqAnhGG6loks11ovaoaTynKBmLuT5c3bzrf5LB9EOzqNfziofONPg=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v13nhq559-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Dec 2023 13:29:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88FBA100053;
 Thu, 21 Dec 2023 13:29:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36BBB2747B8;
 Thu, 21 Dec 2023 13:29:38 +0100 (CET)
Received: from localhost (10.252.25.159) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Dec
 2023 13:29:37 +0100
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
Subject: [PATCH v1 0/8] Introduce STM32 LVDS driver
Date: Thu, 21 Dec 2023 13:28:35 +0100
Message-ID: <20231221122843.418650-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.25.159]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_05,2023-12-20_01,2023-05-22_02
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

This serie introduces a new DRM bridge driver for STM32MP257 platforms
based on Arm Cortex-35. It also adds an instance in the device-tree and
handle the inclusion of the driver within the DRM framework. First patch
adds a new panel compatible in the panel-lvds driver, which is used by
default on the STM32MP257.

Raphael Gallais-Pou (7):
  dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
  dt-bindings: display: add dt-bindings for STM32 LVDS device
  drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
  drm/stm: ltdc: add lvds pixel clock
  arm64: dts: st: add ltdc support on stm32mp251
  arm64: dts: st: add lvds support on stm32mp253
  arm64: dts: st: add display support on stm32mp257f-ev

Yannick Fertre (1):
  drm/stm: ltdc: implement bus clock

 .../bindings/display/panel/panel-lvds.yaml    |    2 +
 .../bindings/display/st,stm32-lvds.yaml       |  114 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   12 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |   17 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   79 ++
 drivers/gpu/drm/stm/Kconfig                   |   11 +
 drivers/gpu/drm/stm/Makefile                  |    2 +
 drivers/gpu/drm/stm/ltdc.c                    |   26 +
 drivers/gpu/drm/stm/ltdc.h                    |    2 +
 drivers/gpu/drm/stm/lvds.c                    | 1226 +++++++++++++++++
 10 files changed, 1491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
 create mode 100644 drivers/gpu/drm/stm/lvds.c

-- 
2.25.1

