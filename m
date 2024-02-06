Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA96984B3D5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E710112ADA;
	Tue,  6 Feb 2024 11:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="6tTCLbnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D63112ADA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 11:46:04 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4168nXgM018518; Tue, 6 Feb 2024 12:45:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=selector1; bh=KFKGglTUpjYqNq
 WORHTS/MU/U9RXok/ogiI6BUa3hCc=; b=6tTCLbnb0Pka6raI1BUyCTVkaVLDLz
 uAfcOm67cV9GCTJJigLlJW1s48OcjzhaQIGTTKO0I5jRg6VEDRtRfx7WCFeBfyvh
 EY9HagpzoBWXWD0m2+BO6DneEMNEIlfJR1NxqUgfXBHiN3jMMEfWBHcT5bDPUUx5
 XPHR/fy6XawpkrW3S+qlWNypTI4YP2m4B7xkEpefFfvQSKbk/cf4gqU44Vdfh3VP
 Xe9OLxyHWIfxt/0/3nntz2cJV03nm1M9ZdX4hKOCjIR3iHrh+lnmOQZcuwavWc9Y
 NkMWn1RGLwpBGQz/jj+TamnmKV8xnCRIQZ+sGKOuRTaWMuGR0pt6benA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1yx4110d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 12:45:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64A93100056;
 Tue,  6 Feb 2024 12:45:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B91B23D408;
 Tue,  6 Feb 2024 12:45:54 +0100 (CET)
Received: from localhost (10.129.178.155) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 6 Feb
 2024 12:45:54 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v5 0/3] Introduce STM32 LVDS driver
Date: Tue, 6 Feb 2024 12:45:33 +0100
Message-ID: <20240206-lvds-v5-0-bd16797b0f09@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0bwmUC/zXMQQ7CIBCF4as0s5aGICi46j1MFw0MdhIthmmIp
 uHuYo3L/+Xl24AxEzJcug0yFmJKSwtz6MDP03JDQaE1KKm0VNKIewksUFqN3ki0Zwvt+swY6bU
 z17H1TLym/N7Vor/rHzj9gKKFFM4GE90Uj86FISbmntfepweMtdYPeN2XW5oAAAA=
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
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.129.178.155]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02
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
base-commit: bb3bc3eac316b7c388733e625cc2343131b69dee
change-id: 20240205-lvds-e084ec50e878

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

