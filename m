Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A2A44151
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5310E6A1;
	Tue, 25 Feb 2025 13:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Py8KP8U/";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WJCuAfYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0010E6A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1740491488; x=1772027488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dYiX75xSJOJS1ua83r/Eunzv7hMG47qKMH5+L5RwUPs=;
 b=Py8KP8U/iMw02YgM8RKYPXbxXcnCYvjfIFYkv1wkTD5ujsjbIFXcCS4Q
 U+cEe1/WqUoXxLo0wb0GrBIFKL7YmO5mmj6WJoKzDZnPpEEFP4ITwpQ6m
 6w1WkDICEsRFrmUarvGDs3vP6f2mGECnbc/OR4qv7AmE2bn83FdJiAFnV
 qsAXW16D7X+LLg3ZC9y1h3gFS8i8wO9/L98Bir81SA5p/EdYCwueiy7Ab
 +BYxON67hSAjRv/t2SZKjHgoeeGts7WUyolLld98aCbp3WB3DuQYU9OFH
 C8CrXf1PcLySVS4h7h+Ge2TYmvyoOkrsEiEmrFF+bnwfmQU3+GpGdmrHd A==;
X-CSE-ConnectionGUID: +6NoEAKjQ7u22+UvhNDcCA==
X-CSE-MsgGUID: Y+HKcAbzTaCdTyxBF5x+Zw==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; d="scan'208";a="42073734"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Feb 2025 14:51:23 +0100
X-CheckPoint: {67BDCADB-5-F75C4246-F0BD6D90}
X-MAIL-CPID: 2E5FFFBDA898A28E5261FB1E4C0C4DEB_3
X-Control-Analysis: str=0001.0A00211D.67BDCADA.007D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26BB0160F35; Tue, 25 Feb 2025 14:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1740491478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dYiX75xSJOJS1ua83r/Eunzv7hMG47qKMH5+L5RwUPs=;
 b=WJCuAfYcPLdL14NIyuCFon/qmh/JkNCa+pAJM7DiRtmaO+2VICIajOFUBSQLxYroxa0bHv
 gu+jU+VTG1Thc2cbxsy0TDgw7UnOPp56xH+UZWhaKMx1DbMv2kW0O2yDxJr++5Trg/1oHJ
 QMxa9DLiqAP1l9cJSx5lZ5y3S4ZfB959wjO0lkGyvLzMLDgaE3lfsS0yWQyaks+1zpA4/2
 CLcXioMh5fsk1V04+2NeHDKpiiWVALA1CC//MAjCwBHd68C7Io1ph3pUhrkcL7yUKfR2sC
 +9r6xpyLW5P38BmYjReVaSpDDBovCSZK42lRvWH3ryKmuYMtHETljSOtlRkXpQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Support negative DE polarity
Date: Tue, 25 Feb 2025 14:51:13 +0100
Message-ID: <20250225135114.801884-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Polarity for DE is stored in bridge state. Use this flag for setting
the DE polarity in the bridge.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 54ad462d17ef7..95563aa1b450d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -561,6 +561,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	       REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
 	      (mode->flags & DRM_MODE_FLAG_NVSYNC ?
 	       REG_LVDS_FMT_VS_NEG_POLARITY : 0);
+	val |= bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW ?
+	       REG_LVDS_FMT_DE_NEG_POLARITY : 0;
 
 	/* Set up bits-per-pixel, 18bpp or 24bpp. */
 	if (lvds_format_24bpp) {
-- 
2.43.0

