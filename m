Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2DFAE60CE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C7E10E55F;
	Tue, 24 Jun 2025 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="pnvv6K7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D9310E560
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750757095; x=1782293095;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=OA1BhEclyD3cxhcgakDc2CPEw7A1ytSUj3LETMJQ82E=;
 b=pnvv6K7BzOKsnfTrEuYvR4y9shmQ90PRFldbMh2jkZv1x5G9LqSTBXzq
 9/2X91r7ujsCm5sYxvpi8UBHqOrRYBlL9VSzKGXSqaiIpO2C/CGwjIf/g
 fdJZVZcX6Sv/WorJ/ptU0kHQ/2eyurQcfZNoHSn96pHqQZDi/0HxeWZq+
 1uUTFgWrxnDHfg8lzJ0/MatvfpwIJx41xxWMhpzmjG7xyPE3YKVREBWu2
 TkGDyLjmv/KUetsocsaLdFGFx7w7CGMcceKFX3UFrlhzNfQZjyFh9s+L7
 Qd0k77RXyzqsVjytnv9qKSdQdjOgQKeKhl1mKO8N991LCgj9IYE4aqnnE A==;
X-CSE-ConnectionGUID: kAMBk0q5SXCuhoUD0ewa8g==
X-CSE-MsgGUID: YHIEH+SeTDOHPwIIrtz4fA==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="42674594"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 02:24:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:22 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:16 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v4 0/3] drm/bridge: microchip-lvds: clean up and fix bus
 formats
Date: Tue, 24 Jun 2025 14:54:13 +0530
Message-ID: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1uWmgC/3XMQQ6CMBAF0KuQrq1pS1vAlfcwLsowSBOhpDWNh
 nB3CwtDRDOZxf+ZeRMJ6C0Gcsom4jHaYN2QgjxkBDoz3JDaJmUimFBM85L2FryDzo70HptA64I
 r3lSaVdKQ9DR6bO1zBS/XlDsbHs6/Vj/ypf1LRU7ToEFloClMKc6fgyO4nixcFBtC5DtCJKJEq
 E0NOq38ReRbQu6IPBGQg245Sqa4/ibmeX4DPeDrfDYBAAA=
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Sandeep Sheriker M
 <sandeep.sheriker@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=1447;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=OA1BhEclyD3cxhcgakDc2CPEw7A1ytSUj3LETMJQ82E=;
 b=ln2ThX2OMPa4FXL63lhDtkNyMUggWXK1b9l3Kd2BCDlIEol/WdAh5rjbyU1caYHsaSAiLnPw5
 KjQ49VUKpWfAMKl5TIAbnj6rr+33i7+4fPCihAZKmj+ffMHVDrOrLpK
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
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

This patch series drops the unsed panel field, switches to atomic variants
and adds support to select between the two supported formats (JEIDA and
VESA) by the LVDSC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v4:
- Split the commits into 3.
- Drop <drm/drm_panel.h>
- Link to v3: https://lore.kernel.org/r/20250624-microchip-lvds-v3-1-c3c6f1e40516@microchip.com

Changes in v3:
- Use BIT(0) instead of 1.
- Drop the panel field of the mchp_lvds structure.
- Drop the inner parentheses in write in serialiser_on().
- Link to v2: https://lore.kernel.org/r/20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com

Changes in v2:
- Switch to atomic bridge functions
- Drop custom connector creation
- Use drm_atomic_get_new_connector_for_encoder()
- Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com

---
Dharma Balasubiramani (3):
      drm/bridge: microchip-lvds: drop unused drm_panel
      drm/bridge: microchip-lvds: switch to use atomic variants
      drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

 drivers/gpu/drm/bridge/microchip-lvds.c | 71 +++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 17 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

