Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01223C7A64A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9988710E8A7;
	Fri, 21 Nov 2025 15:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="MdFyKSdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F0010E8AA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737585; x=1795273585;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=//80TLvazu3o6H3NRSjGjho+1pdoyVKmxiXPeB2mjFI=;
 b=MdFyKSdpvNJm82G9IQ4PVAsmQVW9jNmg4u5W7F5Une4qYqTmA/cBd32x
 f8+lmFX/Y5+OIyoKJB+dBz9kG5ExqZ247oMMveysG45DJE6tB/NCB5tJM
 wGt6l8lb4zPLUC0Z7h/t6pyl59HDnm4dOXoH+OEWgn9rTlyNdIkAiB6wM
 Wj42o29hYSP/hDtw4GryuMys6slj+AcOZ2PNhXC6CUrZl87qMZHC7yFLv
 UsSuNEdfkMi+Cp/v2aoxB9X+hOAJAA3F3kJKwdniMZwBEoX+otrG/sL4C
 PfnRpxoAZie+IAyC/kBFZGGPOnL1T0s7L3cpSFsiBk0+cthz5E/V/DnKm Q==;
X-CSE-ConnectionGUID: Ubo8wtofT1S9f5fCNZ+Rrw==
X-CSE-MsgGUID: gZ3q7jPvQZ2UJm2tgreohw==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="56053149"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2025 08:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:15 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:10 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:34 +0100
Subject: [PATCH 2/8] drm/atmel-hlcdc: add support for the nomodeset kernel
 parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-2-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=//80TLvazu3o6H3NRSjGjho+1pdoyVKmxiXPeB2mjFI=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/Wx435lU4YdoP1U1wLYVVkjIgThXEiZrDNh
 hJx10HGQMqJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LVmZD/9xc9Spy6hS+6PVIpR2aBWpK1pbeCzt7GdY7RPvUtQJ50ErAwpoAk6gw9QfYTfdr7I7RhP
 Horf8ZT+0UvYNnN/lsZkLzNfCunuHzqgCxuYddEO3L9d1kTetlwruZbu2x3Wgw438cAu2GlIO/s
 FsrDGyWo274YN6t6N2smyNmeBS/XqzuAGtRx0wrVLnqL6bshf2LqTsgw5TqKmQivoj6H6aSHMQS
 ypTwk6aRN4iCjXLikwHkyj3yH4qgrFlvlp00fPRvtt/sxVLV4imFOIHLPcVL8LIQ1NG5YjAyx8L
 3d33IPZUak1i5NQn+mFOS9Swwt4oEtubB1tYgaVZX+UPSCjbHcnd8fkaCMKVfoB0CdgLV3oxgcX
 V9j5Z2QdxCFRqESCWpA708gs+PV3VjFYsLGI8vR/+8qotLvm0BWh/0CUChflGi5An0l5GtlSEwd
 N0ApHTQejTfp9c/KpoINc/r4rIGqcUMC+ItGZB9I0YgL5ngPqWary4avm63cJ/WdS249i83y60c
 H0zvKpFsfdTJ9ULifiqevM3O2owjGZM4JXywM+oE0VxCHBsVVLR+CX/ueF7cg2edvNOWH0rQZ4Y
 u/qxasf2VWZJM1vUI/UHUbKNjc92RDd4LL8actkbkY5Avx0OQzMC79o5XiOyjCqgKXWjczi+AWh
 kERr9QPgdxRkgAA==
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

According to Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 8ed029381c555db10d596efc8d52753c47767633..8ff582a394794aacf84f9e23fd59f123445926a3 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -858,6 +858,9 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	struct drm_device *ddev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dc = devm_drm_dev_alloc(&pdev->dev, &atmel_hlcdc_dc_driver, struct atmel_hlcdc_dc, dev);
 	if (IS_ERR(dc))
 		return PTR_ERR(dc);

-- 
2.51.0

