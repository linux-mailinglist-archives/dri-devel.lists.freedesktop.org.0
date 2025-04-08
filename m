Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F53A8165C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64E910E736;
	Tue,  8 Apr 2025 20:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m9qH1CcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F50D10E741
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so316845e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142980; x=1744747780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGZ50Xr51SGn6u7jCMMxqvFxPeQ3g15zcJ94HJ4rlGg=;
 b=m9qH1CcRKDmJN6CuV2HKzxyDgNeiz9WfElH0HEQfH2IC0P4FVCrxp9NHZlCyeaIA+z
 BXGBmvR9++6ppTrhgcywvS6xrR9hL0FuHTvBzrn1W8rZb6B0SVohJLUeMBKEJE+Ndyy5
 K6+UbbfGFnObWA4J9r0bsMSIfC59Jkz/xjqi01RGO5BBptC++SrFjWuen+qfvgbTAh8Q
 YM7JExM6Ju2rZmm7s405U+0vJ8se64kkc5Qdg0lmznpplMvYW7ZJ94SIjvkPGPJKhZsR
 ug8jvJwYLkXd1Eu3IWtLoFqeEREvMAIu+yMd/kZtGUdbUTbkDrL7saWjTrGKbTRXmJKC
 pWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142980; x=1744747780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGZ50Xr51SGn6u7jCMMxqvFxPeQ3g15zcJ94HJ4rlGg=;
 b=nYhBajN6KUMDMzwmQEBntEuYpD9znTIw8WLCwHbr4UPy5a66UwXYcf7DQI2axes+0W
 bqGxBEzRauHm70ayVVWb2v8FmK3072jJIcZEX8PBCXIBmJJYL7x8zTRf4OLTCO/A1nqi
 T5c65k7MbsptfVY+PYQ6nvHASc4LVykrdFeSNnAiDKrtoKY2fIpRkP3cpMXX3QDeiCuo
 Mzs1uiMyifUL6KXjjFMkphMgHalz6Si8jYe4K9mhJmWNqPfNF14EjumuAI6sitWrjMXx
 VfLg6yhoXGw+5xK+kcOYv8YUbpzbxnC1JM0C3w589h99gBxffgTpQbooF1PWawIKFxvE
 qjxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcG/1XMWRa2IabWEsqt/9nxlrc+uLgrA46uFP+pf3AxGXqGig0F7Dc3sltjkBhnTpPCaKTQCWmw2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNe2i6I6oXC6e3tTZOzXm9KRj0UZtnH2xvNXwZ0NaUYYj7HTkj
 MJiTSV++TmAVIcmwIu11pYPXhoiPcn29Vnr8ZGmpC5xOTdgnZNDY
X-Gm-Gg: ASbGncsNKv8PiuY1wvxC5EVBbTV56mesoThtINmqxwyhXBn2bRIuRR2qE4uTD8Ltn32
 4fFOBqE/TABt4ykI7k6idnC5kcfM2HqIXe6a/w6B8TcKG69nNOdxlSu5oZx/Tup8YUHmp3A0CC3
 9o8ZeQvC847lNCEYMgoX4khSYSVcDTYWuw5iKZNF3nmMikBetzFyrk+KyR4yLarVQCeMscmdEMR
 F3POHZp/sJgzpOSyyBGG1PqAokLTEc3iV27CaxPiLdEDrBdsH/jcExBihgm/bnNGZo8N94yWFy6
 QqYtmfdvD4ArdcDxN0ZKz8J6SGm28AV9HTB5FHv4n84vsxVtwHq1BHVthHgtvK8SlaBF
X-Google-Smtp-Source: AGHT+IGki6NA2FUQBimcJPXZNnQt7DmTRS9ENOQFLkz0yxolmxFVHpYm2Ybbty8ovxNJyneAyxIrBw==
X-Received: by 2002:a05:600c:5102:b0:439:8e95:796a with SMTP id
 5b1f17b1804b1-43f1f02822amr2405575e9.13.1744142980292; 
 Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Tue,  8 Apr 2025 21:09:08 +0100
Message-ID: <20250408200916.93793-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4a8fe52e9752..c8be7428c4d7 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -29,6 +29,7 @@
 #include "rzg2l_mipi_dsi_regs.h"
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -643,8 +644,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0

