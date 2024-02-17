Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3C858EF0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 12:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4C10E149;
	Sat, 17 Feb 2024 11:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="KicMKK97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0210E149
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 11:04:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H4iBau020163; Sat, 17 Feb 2024 12:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=selector1; bh=kOfK/+KBwx5Eo4
 ZYWVU+q5TKaI1lH9gZCVMjxi6bytY=; b=KicMKK97j6cSc0GiyZYmY61s9nM8Z3
 0iy2T8McRvSHJBUmPYWDIu7WX73JVKV7e+77k5xrzlEPH5+1r5kixEkIFIjWDDZL
 kvbAKZMUvqSKtW9XMGfcfaPlTD78eH2mphWcuJKnWEc779cP70+T7VDu3++w3owa
 iJALGGIEZIIHVwXVj4KrckK6zs5HJJIxmnt5Q+R0mhetGSKAJcCBJNw8Iw075tUn
 rH/DzGgyNraXVfz88KdgliMS5s5DyWbsrT4VXaQCkAIvfW5HBh02eKsQdPiXLrIP
 T61BG3aBllMEmbh8RAPy3m4DeOFU5cBv1gD0FpPfF+yHZ1SXCkLAzc/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wan11gt4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Feb 2024 12:04:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F91D40044;
 Sat, 17 Feb 2024 12:04:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CBC5253B41;
 Sat, 17 Feb 2024 12:03:11 +0100 (CET)
Received: from localhost (10.252.12.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Feb
 2024 12:03:10 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v2 0/4] Add display support for stm32mp135f-dk board
Date: Sat, 17 Feb 2024 12:02:54 +0100
Message-ID: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6S0GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDQyMT3ZySlOT43AJDY12jNAuzRHMLIxMjk2QloPqCotS0zAqwWdGxtbU
 AaflLPVsAAAA=
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.12.210]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_07,2024-02-16_01,2023-05-22_02
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This serie aims to enable display support for the stm32mp135f-dk board

Those are only patches of the device-tree since the driver support has
already been added [1].

It respectivelly:
	- adds support for the display controller on stm32mp135
	- adds pinctrl for the display controller
	- enables panel, backlight and display controller on
	  stm32mp135f-dk

Finally it fixes the flags on the panel default mode in the
'panel-simple' driver, allowing to override the default mode by one
described in the device tree, and push further the blanking limit on the
panel.

[1] commit 1726cee3d053 ("drm/stm: ltdc: support of new hardware version")

Changes in v2:
  - Removed already merged patches
https://lore.kernel.org/lkml/170729755552.1647630.4818786052103823648.b4-ty@linaro.org/
https://lore.kernel.org/lkml/170729755662.1647630.425379349649657352.b4-ty@linaro.org/
  - Fixed CHECK_DTBS warnings
  - Added missing properties in panel-simple.yaml

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (4):
      ARM: dts: stm32: add LTDC support for STM32MP13x SoC family
      ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC family
      ARM: dts: stm32: enable display support on stm32mp135f-dk board
      dt-bindings: display: simple: hardware can use several properties

 .../bindings/display/panel/panel-simple.yaml       |  3 ++
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi        | 57 ++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135.dtsi               | 11 +++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            | 53 ++++++++++++++++++++
 4 files changed, 124 insertions(+)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-ltdc_mp13-2f86a782424c

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

