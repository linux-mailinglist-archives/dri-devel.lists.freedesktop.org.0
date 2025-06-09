Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB4AD2A04
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DAA10E23B;
	Mon,  9 Jun 2025 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WlFRzXR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6010E078
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2524099f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509807; x=1750114607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVMaFqwVaRe3BMRqoXxDwP87qg6xzDVFlY1zLEQXXs4=;
 b=WlFRzXR6rhdS4T5nEPLEKCF1Nvbi1Ikj/xEeCyxlUa+JVbdvigQW9DGZhSLyq6SYNs
 AkMwVxw6eUWFiEJRWbMESG5zqtmyFtsmzilMIZp9opXgdCbwGjbrHqg2dNNJ+8EJEPTv
 F0SwNFFoNEhA2btCr4iEj9F998ROCdWlAXR+4WRWJpZRscnMWyQRX4rLqIShsUoWsHK7
 rFX9dLWhdFNvoZQW0krSI39lE5bVDhiSzVvAe6FhjISfBgFUm9BiOARxYlFvwhL94Y/M
 Zyj1mNFfsTcE+2WdctzP6vP/2RkJCcRsAtFzRPZccaPYkuc/DI5rVVPX4kBxHL0M+YZm
 qHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509807; x=1750114607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVMaFqwVaRe3BMRqoXxDwP87qg6xzDVFlY1zLEQXXs4=;
 b=ay3/XC8unRqfLjvoVTC97SPnkY/LGca0S0WsPWWs0+UlG/YTUKRz0haebWJJFHYpbS
 om0iN7wc45Jw2/ZVV8E5LlHqHaRulO4f1KSrLQP0yuNd7GZRwciHlIFK+x6MQzSj0clD
 ZOGATJ4AAmxVV9OGgPs3JfIZx0NVQJEBvNUvYvO43WZMXzqRGVvXVM/QoqEsxtgvzApM
 XHSNYazVfc15hGPTxoPUfnjRqiCAv+efpBPrJGJI9GuHA9ai3Zk7rJnYEFGtOdaeuxAC
 hmkI31FzSFuNx3qs2JlJcKquVLDgOu60K9bdSaThlSzSGVP6hpz3q4WO1sZh3eibVZla
 iRBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZysKvir2sUAWprmEFg6Qy1lKk4wT2ZZRiCD7HNpAbmBKJNsfPp1BaZYBMBT1tm7JfCqPDGaFp0So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXNitwVVJ9Y/sK0JEhgiqbF1Pz8z/GBGbxy35N0b5e8pArhmob
 HP0Pe/eMOaHLRDlufaKzvp15czRHPQadR6N01qgqiSfEjpqN4a8eUHsw
X-Gm-Gg: ASbGncsgFUEZEV1wX6rF+ZyrS8tD15mTpLpvJcu5tvlKXj4gd9Lvp5Yu7VyQfqu+RDn
 KEFy4HR1NEdJ59W72BP6If389VVbvBrB2DNFaFk7Kj0DyoYPYS9u4t2sjZvno2BCIxlP3fTHuwB
 aisKwpe1JwyA8gNqGFXYniRX+Z7JF7Ritj1ShBqi9Jjju5ReMebgupm6gWjetPKfhvWo/vn1ExF
 1wHqt7qD4RDGymNxQWZGduwSoOja+bQID/tVWZ5p6ngNsWVdi/PyTC3OGgx70LpfiuWgFKbdJ4D
 01bZbvNqwAQRh79aKArg3ZAKf5v/zu9LG/jWakmcbmp4LrcvtewKzHSiQ7WTqW0Zp5mngnHu3dA
 tfASHMrgsUCU8q7w3v3A=
X-Google-Smtp-Source: AGHT+IHxxNlgUy3KDa90RrzDaQQzT1GEnR6VT89mwWmkm6FsyMGOhxxM4/dRAw+O+U6Dfouuc1yhxQ==
X-Received: by 2002:a5d:64e9:0:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3a531784911mr11147277f8f.12.1749509806938; 
 Mon, 09 Jun 2025 15:56:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 1/9] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK
 range
Date: Mon,  9 Jun 2025 23:56:22 +0100
Message-ID: <20250609225630.502888-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 5.803 MHz to 148.5 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Updated commit message
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added reviewed tag from Biju 
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 50ec109aa6ed..70f36258db63 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -612,6 +612,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0

