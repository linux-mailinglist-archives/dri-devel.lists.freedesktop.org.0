Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF2AB428A
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744C10E485;
	Mon, 12 May 2025 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UNqFqmvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA6810E482
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:24:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a1d8c09674so2440857f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074240; x=1747679040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sygs6rXinrn6JFsLIiWPRpbWxK0eAR/tbOy5QGMjFQ4=;
 b=UNqFqmvlloU2bpcPfJ1qST2NTmGkVYZRLQznrJVMsiU8klfaonATZUUmaEwJZO93k/
 9LwC0Zo9wBtUARJrpFmofBGZqRqLW+/T92qj8ZqicWNRp+mROVJGoyeWCxA6RpCMu7hv
 y8uBCbu3ycSpfufidWCl92ttEjPvKs1QdTHEl3UApFnEgFaVG3R7b4N5/QbEwLaB1aig
 FNWPn2DTyrnhOUxhtm6wy3uN/ESoR56kCc3LWdzQM81QUpCDyAqxAdbjYyx4FaP6nvMS
 4nBmTKxPyRg+HKUj+z51Q95oSi+t0Gk7qwrcXP+PCXo5me8kIISzLHou0dqwnB3DkVQx
 fa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074240; x=1747679040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sygs6rXinrn6JFsLIiWPRpbWxK0eAR/tbOy5QGMjFQ4=;
 b=GJciywOQxqbwm9MletjzznmI04URg2Fa0tWAtGIjKNMvta6g24fqzlIBMEa+qCoT1d
 Z6E1vnPmP2P6ZDwNO+uo2B4Thd9gnJCTHQqiAp18tisOcp/eXprR3pOMNdIiM/pPu2/Z
 rEvU3CJ3s7JW5XqydIweBP6SXC5x0pKQXi7CvNDzcSY+QLHMsaY3VWrtswCCRyRjS3BD
 dvISNJJ69A93u2bQMV2bOPAmifHw2cbjLgjiBf3GMUaG0dxY6TyfwztwEcfgNwBA1DbW
 e8iKzQmesozx+SI619bKfaek9jnK4fOV6xCQ2suU3oK6Sxbv11Om+UDYrlbcLdlaWbud
 ayfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToxirG8V4HbiJktomZZ1RppbPqq5+LG5tlk+0rMAgtS4d18DOl6Aqxe+oJkU8uAQLAVJclbBn7Gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwitQIPYm9gbGK3TXLA/zmzNfj9wTSuQSR7fxSecCWx6wxTaFJS
 7DtzaEshQloiRhcvdtH5/9HQ144DzHKm2x0NJleJIPldcoUqwyLd
X-Gm-Gg: ASbGncvRwxwHUw/Xa2hesfzDg6DUwYwibT5bIJ3HxHsbShYxmMfHt2qRfli12+rR4q6
 /phtDiFjFx7SQRWEX/Za/CenTnInl5GDwYVHsDIPTglZ73qsI5Asdo9k7pIg/wHPbd5jSV/Vttg
 grFSQpac1T827wEcsQcVORRX9i6Tsp0wdG5LtSaG/Uu/KRVg9EDgKawTdLYxb/DPmUOyr4/Mtmt
 cq4YQsYjyBAvp/BNU8477pNfDgz/beZeDLV7fNClG9MZciCwK87bEWHiw19INIPC7GdUjqoqrqn
 OlZcj5H+qHnN7B0rt9Ut6C/Fcd6RXoaVN8TCjuzF+4EPie3tJzlxvqKtrLPuiRArIC1H1Vi9ZKS
 N
X-Google-Smtp-Source: AGHT+IEKq2s1lTml5I+MWT4Yibe0cSTyEEgxKG/nTu6BI1H7TNQy4tXVB24MrorJFRRcajmsTbZWvA==
X-Received: by 2002:a5d:598e:0:b0:3a0:8033:1e3a with SMTP id
 ffacd0b85a97d-3a1f642763fmr12244022f8f.2.1747074239682; 
 Mon, 12 May 2025 11:23:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:58 -0700 (PDT)
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
Subject: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Mon, 12 May 2025 19:23:28 +0100
Message-ID: <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 55a1c1b043c8..e1ce21a9ddb3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0

