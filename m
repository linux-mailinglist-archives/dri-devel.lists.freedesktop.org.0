Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99F9161FB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72310E0BE;
	Tue, 25 Jun 2024 09:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="AtPCQyLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FA10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719306580; x=1750842580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AM6ZyQskoY2QqxOj4uW1JtEfQp/A0PBjAghkGXt3xJs=;
 b=AtPCQyLqHsyKxCnWTrF6hfjVjv4F1oLY2Pyy+lW/u/0y+ULa53Wi1Vd1
 2iF/QwX8aK83rY30c3gM0ahSqudtN1e1OzicHzB2QMxiW9vF2k4ZYlkFb
 0gqB3adBJk4x3u3QmrZWUxQX/MIwRSVrvJLwWpdkJ6beCePmL5WMw8QtB
 iBSv09yqcv2xqs1mEcLyphU0pkWiKio66TJUR+PnRR9Wu9VGy+ye+ZvuN
 BzP0vsT8QL1lOdu49yQSl6Y3MAjfcw6/07lUE/tfJ46QvC64rD9N3lfCd
 xppa/czpXxyEhEYBPSyVs64Z4z8Z/z6c8JVwzBgrgIciFqVRdI7WNUsbP A==;
X-CSE-ConnectionGUID: zjd0MkvxRYe9+LbhgcS+Jw==
X-CSE-MsgGUID: OTrNu+5USaKQwBn0eBlJ5w==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="28465910"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 02:09:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 02:09:17 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 02:09:11 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 2/4] drm/panel: himax-hx8394: switch to
 devm_gpiod_get_optional() for reset_gpio
Date: Tue, 25 Jun 2024 14:38:51 +0530
Message-ID: <20240625090853.343176-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625090853.343176-1-manikandan.m@microchip.com>
References: <20240625090853.343176-1-manikandan.m@microchip.com>
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

Switch the driver to use devm_gpiod_get_optional() on reset_gpio to avoid
driver probe issues when reset line is not specified.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index cb9f46e853de..3be461fc5615 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -486,7 +486,7 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset gpio\n");
-- 
2.25.1

