Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72531AD2A09
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8510E441;
	Mon,  9 Jun 2025 22:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BgSGxwgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD310E442
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3741067f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509813; x=1750114613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9sNPDbvHJtRK/qnSfFYq3EhOhxCEQnSTNwZ9t7XS7g=;
 b=BgSGxwgvL4nqpn4caDNVsU84mjSNBkPVis3jqh673w0PurQbTKH3yz12AV5nzEcckM
 p/0RTGcefnsV7hf6JmmFjOSjgznk4iFStlb133FOjuG08TUgcQrIjbRXn3pc3SN/Tr9F
 aXfT7691jeyhaT9ERWLW1iuISuu8Dv756HbEFJT+5YbIssxwAzBbWJI9I+RykaciIOjn
 rU/Y7KR0iBtngUPivnDT1Uc93qgHn+5iLq6bIN8YC8+HRftQXHHsdI9Pl7tb2kEJuWK6
 +nsTGsvJds8UXQhC7JxFcab+NmaPXoug+XM2O7g6FNfyq+lOF5EnRm3XTGzhefWli3Ro
 FQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509813; x=1750114613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9sNPDbvHJtRK/qnSfFYq3EhOhxCEQnSTNwZ9t7XS7g=;
 b=uw89cdGcjzJRuY0lfAfhU89SSGHX/gk614J60rX9Q1lj/z6UjE7v68F/jBkjT9MuUG
 KtB+Q1aCgD08avJ3FM//D2z1dZ2w6heBNLgEx/Y3cwpjxE+usUYKd72URaUrQhMteQr7
 b3rKxEhyGeduheClMrBMqKExzt022gh68cPHFHcrEDcdkLVH9vgw1TfdaiyXQhRmUC0B
 yKS99icAXIpfTQ0+dARvPkoUj+jV5WRGIXszzbqrI0V0oui5RFicNNZoGuzL2FyaYU16
 ZPjvGZUmcjZvRplCABjCAFJTDMpVLuJzLcT5E1U7tP29O7OyH/4sLzsjPRq1rHzdQcUL
 Q3kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcaoWXaBF8eGeH73xUBPEyfd11SfAP1HcIYdj4DMmIFbIfhw3rN6Ons9lPReCjJa4IKQ9P3uuB0rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyYOJfFPDVupSUI5k6mpfFl37KGkNu0Mmb9pZiMACPJlZiOf41
 /SSPsh+nt2ppefVw+SlggmyDdG9AS2Ft6gAg3fHqQdMFWDRBfdULPy2b
X-Gm-Gg: ASbGncsvyw8MCbnnhUTiUEPhNmK9qWiZknsvexMiqnLKpXimBAVoTquz6yF9ehIXHjk
 yB8so5HP6A9c/Ivag6DuhVc6oBh/HtrY97yS4+h4lOTlG/S/d2a4/ivQRSxeOG6bAmdWVsUgn3+
 28jMlzuB/biuW1/1Z+G8ne916m98iS0exBIpFolx643DCEr51mC9qneNg+qlmFEM1tXfBbqahu9
 ge87Dl+UB4E72Gk29xfvNqgml5VHzvcVhtwfWK7ztux3onYwx0nqzZwm5v6wgTntW+Gc7rL6ON3
 7dxzxG3sHsfImBRLBpluKAx0S8Z1cwSNKxTufWWqQaoTPLM6qSRzudr5G/HZsrUTFRDAwzLuAun
 PrrEAxigNH2FLxCEu93w=
X-Google-Smtp-Source: AGHT+IEizz7C/hBJTgzy36g5sjG+Z7oBuPSSAy3tfoHcrQ0Z3A14k8MfwRyhBwae678JZOqvfLUNxQ==
X-Received: by 2002:a05:6000:2503:b0:3a4:ec23:dba5 with SMTP id
 ffacd0b85a97d-3a5319b17c0mr12730358f8f.5.1749509813415; 
 Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:52 -0700 (PDT)
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
Subject: [PATCH v7 7/9] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Mon,  9 Jun 2025 23:56:28 +0100
Message-ID: <20250609225630.502888-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Added Reviewed-by tag from Laurent

v4->v5:
- Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 004911240cef..afb427e678bd 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,8 @@
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -43,6 +45,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -672,8 +675,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
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

