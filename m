Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774EAC1F617
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16A910E958;
	Thu, 30 Oct 2025 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="eL6K6M0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C5510E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1761817703; x=1793353703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KP73zFD6pa/mluZfc859H7jK4Ws+qxK7Dj/8pvou9gw=;
 b=eL6K6M0eq1gse1ojlZwBZ+UZUwyRFAweQSW5l+pgesF3CLp3qrxG6NhP
 Pok/SwRobpfdogJYMOq7fSPHCnEyYYTsTMvjuP51NYx4MVIvyq5wfWhyP
 0pAP/a6T1P/GmGtIzIuq3ofj9AzsmSwO8iq1eiFRW0g8vaStAGZHBWUyc
 gyyyhtR/MUPI/GJvuR+UF5dkj0zB1W8WVmObvTdYKTcU1dkbIjrfHi4Xe
 Y32+/rCTqGCQ986EWBB4QEXB/t049GDYu8dAyc6mUhwviyoD3myI1E65Z
 Y00hTbv6t4vrtd0tMolJvah2EJd1NarxLRHq92ERcbq+G3TU8YNZvXe6o A==;
X-CSE-ConnectionGUID: +oGn3tQCSDqOtrmjZQp9tw==
X-CSE-MsgGUID: NGkMgGyoT6eTZCJEzPprTg==
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="279833920"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Oct 2025 02:48:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 30 Oct 2025 02:47:52 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 30 Oct 2025 02:47:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <jesszhan0024@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH] drm/panel: himax-hx8394: Populate connector bus formats
Date: Thu, 30 Oct 2025 15:17:42 +0530
Message-ID: <20251030094742.1081960-1-manikandan.m@microchip.com>
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

Add a call to drm_display_info_set_bus_formats() in hx8394_get_modes()
to populate the connector's bus_formats field with the panel's bus
format.This ensures display bus format information is available to other
components that may need it later such as to identify and match the input
bus format correctly based on the panel description.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..cdd72235fde6 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -725,6 +725,8 @@ static int hx8394_get_modes(struct drm_panel *panel,
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &ctx->desc->format, 1);
 	drm_mode_probed_add(connector, mode);
 
 	return 1;

base-commit: bdaf9fa04946b9d1086d69b7269c113ace8e9f76
-- 
2.25.1

