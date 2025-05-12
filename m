Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061FAB4282
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE41610E47E;
	Mon, 12 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i0T7kxBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33F10E47D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a0ebf39427so3842073f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074230; x=1747679030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qc/zHSGJE4dxm+T84W7te8HR6LYi6zQ10iTIeKBgme4=;
 b=i0T7kxBkMlzScBNF9bVnRUF62v4wDdo6BOIkG1zpni9HuEM0vv1O2MYDK3KWICcafE
 k4Uzx9LHqcgBPR4aVqPJRolnFeL5RTZnEK7cQy/I4eeQBooVXXDGmwMQx6BJQr9Ts4Ge
 DZ/cVsXtiqjhgdtIvrUGjA059A8FZsr6X1bGI+DPQbcQLnIyuUeQL5ZI8BRA0lKAYBai
 qQTKVNepeuuWtxiV2TS4+cVW+2ykg1jEBrEDGMMolIueZzke953LCC6UHBjVLT362nH8
 hOXNo01L8YjNDDsIqveLMVsl1Gh1dPmVVodcZV7TpovLgn9qZWVj3B+U4nx2QhXmDXI5
 i5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074230; x=1747679030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qc/zHSGJE4dxm+T84W7te8HR6LYi6zQ10iTIeKBgme4=;
 b=TM3yHGmtDFdsgdP9sfhYciW38bY6CWzkV85SaKZB7+VhIbYqYAPhabSPndVqv5fWQR
 B8A/iRhWbtjchR942OFX1IwlkrQUMavD9sMfZQB1bf8XM8XFz72uLNguFDNZ3UUBWzLX
 fNiyoqT27WY2xoct2ZPDzIh6NPzjtkfDYwBl9BElpFI6P8M0z4h7/p3WUAt9jnP6IUQb
 rdZFtKGuYSb5DpgJPY510xNTINEZTgbAmWVQllBBwhF09pwRoGMtnVmWhQkVTeIW5AN/
 wrCJI2SglL+GaXBZaQbK6dQPjAAWLvduR221YSbf3LYVB1KM0P0xF0/aeLClfM89wK9y
 weKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrUD28lfFYoB7SxyNCejCwW8CFf3fmjM+uYGujmHVamQYwLyWZIzzsunrA75WsOGVps/xi7nQDpKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM0/WMBQ6Nbpn9rZAOFgTitWV1RgBFqwOD+qiYiv/h0y8Jhvd9
 pCtbB3bTUYrulMOJaX91FeG9RCkZ5JjiPgmvZBSagZIpRReEf32O
X-Gm-Gg: ASbGncu7dXXd8hKRgtLDptwe91FD8tgh+cbdfh+Z020e/pOEB91QY1NtMJxAIyLHfJF
 nBuUXWSxqGsjiQ21c/iRb9/8KfZ/53AN76Ho7DszFOCrcFMRX/4PPK+l7TIYZd2lr5Lncs7kTqc
 BVs/ppwA1epK1TbatI9UunGS2rJRfYkCCE0Wwkf3bmvqnRhiQSYHFOKUUVqTZX4BioX/4L+5nDC
 J+yK1IZywHIC4BiOUFtRA9syDOrSXItF0+UXYFK+ybFgDoAobm5qJAYl4cXScHJzj+JUQeP/Vnb
 2jD5ChtSO8dW/ojb+ik54xRkIsRT7V6ghHluBHSlmNfVgSJXvZeJrurCowOj6amPuENbx+Oy5ov
 V
X-Google-Smtp-Source: AGHT+IG0wNhaFScOnTE2O7DJ1UMVp22WCeqi+y/RfOJwQDZA04x0nhBhTL9fNbvwQnjPFKdjl+AWAg==
X-Received: by 2002:a05:6000:420f:b0:39e:e438:8e4b with SMTP id
 ffacd0b85a97d-3a1f64ae792mr11060763f8f.50.1747074230172; 
 Mon, 12 May 2025 11:23:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Date: Mon, 12 May 2025 19:23:21 +0100
Message-ID: <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0

