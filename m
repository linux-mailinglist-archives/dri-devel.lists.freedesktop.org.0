Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CFAA81650
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5853210E738;
	Tue,  8 Apr 2025 20:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h1e2mbcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47B10E738
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so36099625e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142972; x=1744747772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWFQzkzE/YLxJ8JinxrcdW0q0mCjqRMbDDGU3Rpy/Kk=;
 b=h1e2mbcUvqd1ZJc3QYOft8EHrhQXXeGu+t8V8rQP4/god0qAI70bqWWSZpkrdJUqjo
 2b11dzDbBWylX78nzkJYlR21P5JVXlBOwW9nQe1ph6808+SIinLZoSbe+r2PODCUhdU+
 K21ABrBASdNRUDSmZ4UbRSZGWd801fu3ubnM1+Uj8gzA2SSq/yYhRDvJBZfjoQPX6Tnx
 CeM/FBxuqeouWK6SHRjpxLMdYix7z0Pg/DIMZwp0CzFJMBVDIj2GrcRb3NG7uGA5yO+I
 HNGiK6vxnEtpSZAC304eIukFB4rR/xYZVOVrIoFvw4MHxTAxj6JooO42JoBHEu5TjWWL
 RQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142972; x=1744747772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWFQzkzE/YLxJ8JinxrcdW0q0mCjqRMbDDGU3Rpy/Kk=;
 b=oEagt25ZZYhfwAB/wvtm2u0y6XL2I8REm6a2227lYR5+1fGTBACO85AF45LfIMq9FG
 IJ7L32zXXU/0zDOP8pCrDEDXrK/OPna6b0fWsTpOgGqbQqV7XuYgKuwLoT4i5trguQl7
 QTPrHBX+FVx/Z09NObS9e/OWjTaffY19C1HjFRhlnBT2N9dyAS689rp5DAyXdO13118q
 MrdFCYmmY5YBjGhq9bDHHfcs918uaX3frRKjPTIFZBrz0Ap/fRFaeThdXG7uBIJmPh4U
 VoJNl2Lu65zt2sk75qdc5uJ5G97son3JBLwOBPNEBNITxIBQbSQc/cmm17lf6Nkppc1j
 FmZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtlmB7SB8U6l9k/VZ3xXCQXINjo9552PBKqiw73GB4V8NmrWBsisHy1jm4R/fVEa91ruSJe0sV40I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZnlm2UQLXorwcGydnF/DP/bhpvwcVoKImvYoY0wt81xG9BtKl
 nnRTzB/m0jSMP9z10l/1lg3Ral3Oi7P2dZTpMxjbcqLR5tliCCJh
X-Gm-Gg: ASbGncvKE2ZckP9jpCjIH8ZWZkcFEd1lHV/OTd74A6yTzwmjRbvbgkbeu78h23ZBEPD
 2pLrMuJe1zEnbB2WGkj24v7Yzy7CMvrKnSmd58HeEd4e8mTCOSforIFixIZ1vny/5nU5nASxDR/
 pDSV7/K/Lkx+/sv+H0fksTuWMDZcNdthydCioYAJGtWsEWr4KGZmBLzfShtMbRRmAr5trayKH9M
 IEFV0YbrACQZI6+hB1F0yTQqymADrc/TRb8MWoVWaQUOhe0VzQCaEQB+tbjUYVnutzeUTEe7+ji
 oXun9xweO8sW5Qk3YT/j83bKOgyXLXEYlq4XRjgjOfXz8XLDuuN+eL9VeUNzuuP2sOuCI5eV9zS
 dLv0=
X-Google-Smtp-Source: AGHT+IG9TaUmj9LnDdn/kP3lb9vJmEm5lLawrZAi/Uwl+lufn6YZoKeuxbDaqMkZAeTWvzLU1xiGWA==
X-Received: by 2002:a05:600c:1e1e:b0:43d:49eb:963f with SMTP id
 5b1f17b1804b1-43f1ed4b5ebmr4037635e9.24.1744142971565; 
 Tue, 08 Apr 2025 13:09:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:31 -0700 (PDT)
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
Subject: [PATCH v2 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:02 +0100
Message-ID: <20250408200916.93793-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0

