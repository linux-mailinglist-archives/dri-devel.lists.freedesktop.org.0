Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB39BB478D
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 18:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2C210E80B;
	Thu,  2 Oct 2025 16:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mkD8yW7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679110E806
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 16:17:42 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso15210715e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421861; x=1760026661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDy+bcBz5SReUL1/hrWcatTUHafCDQsXpig3EVAl2cQ=;
 b=mkD8yW7AsHg0lWUzNq2FhN9+hyn5Znt5jbkLK/rFTwC7i0zNHDzEkpZB1zjYe9pEWl
 VBxZ3qaFCyEB/R7eaSLiNAkK3NhYVwRhg0H5fjm5v3hBgEj/MY1kDmSTD1cbdrV0u0qh
 rox8kHfGHhr+gE8GBeDckj0W8jAgCraLKzIA69wyCg3kVCHHqLD+AsHqx9XVDtJKkddJ
 eQzUIRB9B0jTmkWnHuYf1AnH8hFNugdQ1V3FECQN3MyTrJ1mJDYlI9q1Qaao0uUzYET9
 Lq5Y31maDXbGvLeXVLCBs3IA0+qAlxKo/3zWVWxIEHId8HN8iQpqqcsEHjNtOMUVw4lL
 B29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421861; x=1760026661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDy+bcBz5SReUL1/hrWcatTUHafCDQsXpig3EVAl2cQ=;
 b=vE7ShfdsjC2WuQUQB4k85vvnHRvtWefaDckDhkYYhvNah/d/pUL0jW6LOQnFm3ihcp
 A5XJRG70zfrx+xPwzJFnKhlozBeZP21KVHUShFJEXTDPM1mdqjhrC5c9hsgybIcwbe+6
 XbKIGj9NQUPHuZZanY3dmOG+xjCecWZesiP8quGiWWO/YpvFFYXhW4SAPkGJMfwOu6L2
 56/R2ekACfp1TpPPWSaHfGVQjlwttvCuHyBkKFSickJgM7JIVRyksFcLyydZWVXfCcZY
 MFoWeM1oKfGzyTIeXkr4NayibmsrckpxU1lRk4b9xKhly0WXsofKTzgSmHQlVdPGi2dt
 bY5g==
X-Gm-Message-State: AOJu0Yyn/IrJByTriSlFG9WznU4WvbKeqJgL0gtqQv2mTWw1Jw9ybU6C
 ueytbpemVsZdy7uNd2hkbaBv4erJXCldbUqcgHk7n8BG9v0936vFaUZl
X-Gm-Gg: ASbGnct3O9SEAivgbuBwBY0T4QW2seiUvcqsluYnHeWXQYYKRZ1Sdi+vXbRw2OoNkkC
 JFRq9lmxdN4FYUpEKquKkKwZWOy6dokiISg3DTwZeS5BakYBrrC4M3DwVBEE6Bb+cjHdtKTNlhN
 MKP/6BOxnMMUjnCOA3Uktp9OwBsL83LqMsrvxePKPsuEYO7Ks0M8LdpXZ+kursDU9JV/XDLquVE
 g0tB6/r9EyLfoak8cqOl3U7ltg+BpKW31ZExRi/GNOyNvok6oxs95VGKC9KUoHyIU+M9/6X242Y
 jNQOHQQkWtcLMO3j63wG0nToiKodAaiBAycI2W76vY+Vn86CCDOPYcXzRRSFCFapPTi16cC96n8
 7ZbSQA5vCEPxLYcYTqQq535SFAzM3SZ8+01VT9eI013NZsw1/edMDjqnIAsS2RrQpE1gAXMDY6o
 vLu6KV
X-Google-Smtp-Source: AGHT+IHrq2Ok4208eIeZKRmn8dvl8f5AQ6yStLCnXfA+SOQTweqJ+ph9ADJMK5C1VCoebsbnYj9+Yw==
X-Received: by 2002:a05:600c:3149:b0:46e:3b81:c3f9 with SMTP id
 5b1f17b1804b1-46e61269212mr68911085e9.17.1759421860723; 
 Thu, 02 Oct 2025 09:17:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 09:17:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct
 pll
Date: Thu,  2 Oct 2025 17:17:23 +0100
Message-ID: <20251002161728.186024-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9:
- No changes.

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.51.0

