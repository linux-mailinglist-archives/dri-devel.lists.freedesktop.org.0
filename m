Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4503916500
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 12:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497E810E40C;
	Tue, 25 Jun 2024 10:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tR/oyxsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086D10E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719310253; x=1750846253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MSWdBc8PKBdJ0A0i1o2EiwRYZcdlsnekjW41CeUrTk4=;
 b=tR/oyxsLMOvBo7rhHhErsyQxG4LxRGncqOMqVoFKJP3yrFN4kHFbd2UO
 HqaQmsLwrEFrdQb1A4BLQvjhprkrwI3T0OYbOiy7Wi6g+bVCyTqkGUNx5
 wMo5DX7YUAhE/xitVlDLqaLd/oZBgBdoafEyeOzCJ4HpWBSTa+GB3cnjY
 B7Xx+slrevfHSWvjYLO/SEbB5j7+ojKvMI2+qw0iQIcAO4xReMmVW+Jnu
 sOKNIHpJAx5u6gQmBF5823KB/SDue7dYhvDqY5SRe1cKLg0X9XNWntckP
 Qv5nAif83lqkktI5Q19G+ry1yApgx0YuPpLvbuQup+iAaBpmKL8LrSPc6 w==;
X-CSE-ConnectionGUID: iHJbrbJ5Qxy40j7Wq5Z2LA==
X-CSE-MsgGUID: 6D9jdcc8SOWoH738OpHbtQ==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="31005830"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 03:10:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 03:10:30 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 03:10:25 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH] drm: atmel-hlcdc: fix static checker warning by initializing
 the local variable
Date: Tue, 25 Jun 2024 15:40:30 +0530
Message-ID: <20240625101030.373965-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Initialize the local variable used to store the status of LCDC Channel
status register of each layer to fix the static checker warning
reported by smatch

Fixes: aa71584b323a ("drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca..4150c4d0b4f2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -559,7 +559,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
 	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 	struct drm_framebuffer *fb = state->base.fb;
-	u32 sr;
+	u32 sr = 0;
 	int i;
 
 	if (!dc->desc->is_xlcdc)
-- 
2.25.1

