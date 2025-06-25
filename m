Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76AAE763E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 06:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F30F10E65D;
	Wed, 25 Jun 2025 04:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Bn5NWJB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28EF10E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 04:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750827406; x=1782363406;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=6dOUqUTuyRASvj5897YXpzkg1jCDbmOY7e9W81q6TbE=;
 b=Bn5NWJB20yC7C4T1qDPn19+upwHgh5b4nAwBjFu2K9fwRyvQpAz9CtRN
 uEoNswFhpzew4sHA1zvbfP0QOm37MOYZjjC69jEfAHKO3goN+Oa2EQESO
 MPXxZcHCKghNR+7IMzjaegtyELroAGNhzwNFBXZQ04sh5WSy9On+LqjOi
 lK+4+ZX4QRTvn2qQBO3by1qB/Nj0dh0w7jRlXduG3lJyUIQqce1yLmTq1
 DV2S6A/AeK/BGRdOWBjZC3nVXvWrJZCe0wvUqLbljnIW+Oy5QapJDTZ0Z
 HNk+QyQRrriKmAH9d5k+zOBeGVSa90qoYnOiZDLKBJdneSPCKpHwdjcxi w==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: lAnqXKGeTei1fnuPZQu9VQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="42713908"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 21:56:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:19 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:12 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v5 0/4] drm/bridge: microchip-lvds: clean up and fix bus
 formats
Date: Wed, 25 Jun 2025 10:26:08 +0530
Message-ID: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGiBW2gC/33MTQrCMBAF4KtI1kby39aV9xAX6WS0AbUlkaCU3
 t20Cym2yjCL95j5ehIxeIxkv+lJwOSjb+856O2GQGPvF6Te5UwEE5oZXtKbh9BC4zt6TS7SuuC
 au8qwSlmSn7qAZ/+cwOMp58bHRxtek5/42P6kEqd50KK24ApbisPnYAftjYxcEjNCyAUhMlEi1
 LYGk1etEXJOqAUhMwESzJmjYpqbNUL9JxRltJKFU8IqwbD6JoZheAPIjMhHeQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1805;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=6dOUqUTuyRASvj5897YXpzkg1jCDbmOY7e9W81q6TbE=;
 b=7bp9Zi1Ph4kmuHQpGXeTjdQq3BfJpu9j5tMLH1lOxG9wyJak0uz/bU+AgJ3/C27fyaUjin0F5
 929vib88ERmCXDpgPoPcxf1rab6z+yh5unw6r44qphSdxhEiLOitxaK
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
Changes in v5:
- Drop the redundant port node lookup.
- Split the commits adding atomic bridge ops into 2.
- Update commit messages accordingly.
- Link to v4: https://lore.kernel.org/r/20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com

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
Dharma Balasubiramani (4):
      drm/bridge: microchip-lvds: Remove unused drm_panel and redundant port node lookup
      drm/bridge: microchip-lvds: migrate to atomic bridge ops
      drm/bridge: microchip-lvds: add atomic pre_enable() and post_disable()
      drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

 drivers/gpu/drm/bridge/microchip-lvds.c | 80 ++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 26 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

