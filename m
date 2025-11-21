Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326FC7A647
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A15110E8A5;
	Fri, 21 Nov 2025 15:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="AqHKfvzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDA910E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737585; x=1795273585;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=5OKOBmxX26Rgs0xbx9ZdRJ+HfMTLClzJoEFjvcG4AcE=;
 b=AqHKfvzuQUayHzT9nbfoOwlD0wrElLE3cIJ0HGAvK6wwcKK5U2d07YIH
 jT66lzS4MzMbTJjJV8dKt+FUV/Kn4z2B9UZogQQDMpFkXfjQrbie/qu87
 M7aTAr48qgWHH4B54zSv2jPt3kcYxtiso+wtHOaxMUjIhve6a2YTCB72T
 WzIky56bkv/Xf0mqOYr6k4gpE0DsNEnFmna/bsKvjKegkiBRaHXjv0+bS
 7LbBST5hmaC56mnthUtYNomP0kCwDcA93zz9q7Jyf8kdvvXxBeJZCEsgA
 Zu7ugaW9H7cFe2UmJwgOm9OYsgIoPnvumR4kTO0LF3U9HIwW7jCJniQyw g==;
X-CSE-ConnectionGUID: aKGyDUYeT0auUjyru6LUFw==
X-CSE-MsgGUID: 0QpqpqUxSZeAdq+oerucoQ==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="49513427"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:05 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:05:59 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 0/8] drm/atmel-hlcdc: make more use of helpers
Date: Fri, 21 Nov 2025 16:04:32 +0100
Message-ID: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIB/IGkC/y3M0QqDMAyF4VeRXK9gC1W2VxlDYoxboMu0XYcgv
 rtFd/kdOP8KiaNwglu1QuSfJPlogb1UQC/UJxsZisHVzlvrrAk0dBQYNU/dG0WDKJu+QaLW9x7
 rK5TrFHmU5cjeH6cjz7nUv/9x23Zy78/iewAAAA==
X-Change-ID: 20251121-lcd_cleanup_mainline-b6acc75b5a09
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=5OKOBmxX26Rgs0xbx9ZdRJ+HfMTLClzJoEFjvcG4AcE=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/V/jo0GHq7RSD6t65Y7Wb7x4XUYdRHQcceV
 JdZU01U1c6JAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1QAKCRA+OeYT93tk
 La3pD/957QSxYkmoTRU9HxiWluWn7V5pUbnW/fArwLbQyTTsA9MWgo4dM2oBAnkeamIl7efuRdM
 0q8V4yjPqLgZAce9cwRRrR++Hie2kCOlJY5yLfIP3o609gD5BIgThIrX0MWHOYuWOTskaNxUdJh
 edklWkSKXGKnvT95FndeE+5yAPQjPuUpMKq811W+BoAUwRP+hGjzwIVsQr1ZwM4hKUl0KAw+Q3G
 vevbFWmsbKaIVEJZ41W63qmdigjrmp6Hc4y288HInAjel2SwgQvxQoHUdIUBmM0TWfyhskFTCFo
 RFCc626Wiv0DPIRpwCQEC96O7O+rHrg+v9l/R0tqiMZZ9a7nDyZRwPZbJxiiVwGTvUpMSi+DEVW
 g0nQPmF6f2YTZ5wsjBO18d8vdV0aqt3f6vJdBe4E0jB6egb7ecL/VAO76go/WGgIMXpdiqA2+tB
 UAg4YOyaHm8Kp2fQXngJbDLHrzCYOF7UI87wTqYtBlnR/9dgxm0oncStF11PE7ByBXB6ebW1Bf7
 mdwz7ovHvGfpYMM01wdq+z8FCS9sBFDIM5eDwQWL2sVUhtvYorRhCyoVVAkp+UtnCHKpxaoZXGP
 caMYBjakS9xe6n4OycaCIsYn5nmpaSx2dqqrBdtl3/5XZXYCIckT2Sfl78xZQvhkY7CkwnwntUP
 Na0k/1sbfXWP3Xg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

Hi,

This set of patches is mostly about using available helpers when
possible to simplify the code and ease the maintenance.

There is a dependency on "drm/panel: simple: restore connector_type
fallback" that I just submitted, otherwise the atmel-hlcdc driver may
fail during the probe.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Ludovic Desroches (8):
      drm/atmel-hlcdc: use managed device resources for the display controller
      drm/atmel-hlcdc: add support for the nomodeset kernel parameter
      drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
      drm/atmel-hlcdc: use drm_crtc_mask()
      drm/atmel-hlcdc: use devm_drm_of_get_bridge()
      drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
      drm/atmel-hlcdc: use drmm_universal_plane_alloc()
      drm/atmel-hlcdc: destroy properly the plane state in the reset callback

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 32 ++---------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 40 +++++++------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h     |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 43 ++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c  | 73 +++++++++++-------------
 5 files changed, 73 insertions(+), 116 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-lcd_cleanup_mainline-b6acc75b5a09

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

