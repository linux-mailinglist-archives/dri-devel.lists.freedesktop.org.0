Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2D8671DB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CC510E6EC;
	Mon, 26 Feb 2024 10:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="obmUA0pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B510E6EC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:49:31 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QALGin020301; Mon, 26 Feb 2024 11:49:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=selector1; bh=KSlAKh5khHrm2l
 h9JDEYwfn6mQwNRMWXeZ4rXWYoMPM=; b=obmUA0pgK23lV+iGq6BnCH2IcutvDH
 pOBwx7Akg0ILyMRM1yYdHrvITrC9rJFjCspZ901h0kD9syoUxuV+mXlxOVQdl28G
 xsqfE99qn+2bv20dk12Wj9Nnx+/2n7XIvA4H9MsZuELZQ1Q87WC37Trd6+7IsT+5
 nH5jRX3Xhnga96kb6yZEF9eqOnqm2GimHuGeuyxkqMvdtSfYyZ0DPfWXS1ZebnI/
 jl7jdrOEWnc/udr5VCA484zKV3WF6RlsUMo2kgXv0XxCXCCTGyqGfY/Mfu4nWnQ9
 X4uaQO7eRHFFOmCZFdn2Ax5bML3DoelJ8zd1m/b39ad3EiaLIQKvW11w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wftw4mpfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 11:49:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F178540048;
 Mon, 26 Feb 2024 11:49:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8979266D0C;
 Mon, 26 Feb 2024 11:48:08 +0100 (CET)
Received: from localhost (10.252.9.163) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 11:48:08 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v6 0/3] Introduce STM32 LVDS driver
Date: Mon, 26 Feb 2024 11:48:04 +0100
Message-ID: <20240226-lvds-v6-0-15e3463fbe70@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRs3GUC/22MQQ6CMBBFr0JmbcmILbSuvIdxAXQqTZSaDmk0h
 LtbMC5MXL6f/94MTNETw7GYIVLy7MOYod4V0A/teCXhbWaosJJYoRK3ZFkQakm9QtKNhnx9RHL
 +uWXOl8yD5ynE11ZNcl2/gfoTSFKgMNoqZ1p3MMaeXGAueSr7cIc1kdQ/TWWts/u6MU2HDs2vt
 izLG10KIC3RAAAA
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Conor Dooley
 <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.9.163]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-26_01,2023-05-22_02
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

This serie introduces a new DRM bridge driver for STM32MP257 platforms
based on Arm Cortex-35. It also adds an instance in the device-tree and
handle the inclusion of the driver within the DRM framework. First patch
adds a new panel compatible in the panel-lvds driver, which is used by
default on the STM32MP257.

Changes in v6:
	- [1/3] Added Conor's Reviewed-by
	- [2/3] Fixed kernel test robot warnings
	- Rebased on latest drm-misc-next

Changes in v5:
	- Fixed path in MAINTAINERS
	- Fixed compatible in driver

Changes in v4:
	- Align dt-bindings filename and compatible
	- Remove redundant word in [1/6] subject
	- Fix example on typo
	- Some minor fixes on YAML syntax
	- Explicitly include linux/platform_device.h
	- Drop device-tree related patch after internal discussions
	- Rebase on latest drm-misc-next

Changes in v3:
	- Changed the compatible to show SoC specificity
	- Fixed includes in dt-binding example
	- Added "#clock-cells" description in dt-binding example
	- Some minor fixes on typo

Changes in v2:
	- Dropped [1/8] because already merged
	- Dropped [4/8] since not mandatory for this serie
	- [1/6]: Switch compatible and clock-cells related areas
	- [1/6]: Remove faulty #include in the example.
	- [1/6]: Add missing entry in MAINTAINERS
	- [2/6]: Removed CamelCase macros
	- [2/6]: Removed hard to read debug log
	- [3/6]: Fixed my address
	- [3/6]: Fixed smatch warning
	- [5/6]: Move changes to stm32mp255.dtsi

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (3):
      dt-bindings: display: add STM32 LVDS device
      drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
      drm/stm: ltdc: add lvds pixel clock

 .../bindings/display/st,stm32mp25-lvds.yaml        |  119 ++
 MAINTAINERS                                        |    1 +
 drivers/gpu/drm/stm/Kconfig                        |   11 +
 drivers/gpu/drm/stm/Makefile                       |    2 +
 drivers/gpu/drm/stm/ltdc.c                         |   19 +
 drivers/gpu/drm/stm/ltdc.h                         |    1 +
 drivers/gpu/drm/stm/lvds.c                         | 1226 ++++++++++++++++++++
 7 files changed, 1379 insertions(+)
---
base-commit: de8de2c8acb931ce6197a04376a7078ccf50e821
change-id: 20240205-lvds-e084ec50e878

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

