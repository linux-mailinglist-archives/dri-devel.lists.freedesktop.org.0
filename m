Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5FBE05F0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B5810E8C8;
	Wed, 15 Oct 2025 19:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ae9qltsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1DC10E8C8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:26:46 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso16246025ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760556405; x=1761161205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVdIIHRjhsjhdHyUNhjH9+nTwNCLTUx5F36M27h4XtI=;
 b=Ae9qltsSnDoFkNEuEDxCjoNZPLSW6ZtceBbr/NhsLryChKUg4jjOidXaLigO1PjP5i
 lDwpcldn/At7/VXm0Y3y6JMVadpMOhXxP4r2uBBCYsxFb23TfSwOJyNXL3oCNildlC7A
 fYa6w0AfAUyR/LFFVDf1jhLw46cBAVYNEj2tGkx1Wu7CKzMeq5IsvBkvYZ6hfIWNFnra
 p1NLhrzr7FJT6QQrEomKNvWK1n+T9zuyd7LFdwYAXnW8ex8xfw3z7/UI8bOqSswFYwiF
 5Y6fodp4nDoj4rzzZDfgyT3xygYaYIg5uHjl7jfoGZBmtWDFqVZD5mflHg1xeIcvU04g
 Ii9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760556405; x=1761161205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVdIIHRjhsjhdHyUNhjH9+nTwNCLTUx5F36M27h4XtI=;
 b=Q0zbOss619gNRCSuDJBFYh+AP9cw2HUcjhvARO1eiGwkrpXNTD07ERFmFBYnq7n7l/
 It2Hx007hnDQiDuvSQACNQVHTMSqpY5dqeJ1vC3knF4Cj/2Hzaq2WoWCPzbK+1IlCFLm
 4U+eiv8odszimGdnvDJGUsIWKBSXdYVK8qk4sfB0RV/S9ZdPyZ9tMOWuUesoc796NEf8
 Ys0sihBus086ARP9Rm5NV1iko5+lCVok7erdhyxv/pJ+wxpCHlFFLT3fR3ca64k7+jQS
 O3ThJgVGd7k8ENWugCxMnaKtZMuAZ7cWuedEf2wpKZSvxDIcsl0+jmmGA6ssK3ARwUu1
 fggg==
X-Gm-Message-State: AOJu0Yz6D6awwVS6vpIOZLILtmh9cXrtj/5Tcf9HItME0TrhBHc3TlWe
 ZczQTEnIYYepviSDUBAmuDlu2SQuQ6HshTqdsJhHN9tPQZnefZ0d6LB1
X-Gm-Gg: ASbGncsynxfVhljh8gd1wh3KY8QOMJoaM7KnEx9rwtyII/OcLiZGpD8QsJPTxM6stOW
 dP4/B+stZGdZSfWMH8zvMSZPOk5W6qD5Bv1oLvMYLty4G42+i9R8Nr+GxNgfN+vPEwUX8cSHzIY
 lRpgGE9r5p4lM96ZZ/tz51DeyuPw1McRB/WU7Y4SR6CNgCL2xWEy01s/V+zNcAhUYCNt3PYvVWG
 mbGQaH8AZdZOM92DTV8sqiumcmtj8nWMNqtT0vbpkJCUJWfYaKiF+BRAFZUUFbFSJJxJW7EI8UN
 Zw/y1QAMvpa+ul/O0Z+w37KUK6a+1kKzpvEhTFgtHOVwjP0yQveTukxN1ct8YzcxwBGd8fevdnG
 3NS15Qq+VFpUrTAkyxf8GXcwZYttL+hLQkfuNDPxtgHMKf6q8OQQUwgb75zXL9n9yXqjZ2KBCmc
 hbMHITJxbMQCF9PgnqxIzVQA==
X-Google-Smtp-Source: AGHT+IF8rWJttxUtF2GuEZ7phZVM28kjaWV2XPPnFipU1q3jMXIrc6ZJZA0GsIhMSL21BS4p4TDQyg==
X-Received: by 2002:a17:903:350c:b0:26a:6d5a:944e with SMTP id
 d9443c01a7336-29091b4a521mr10160085ad.24.1760556405421; 
 Wed, 15 Oct 2025 12:26:45 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:26:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v11 2/7] clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
Date: Wed, 15 Oct 2025 20:26:06 +0100
Message-ID: <20251015192611.241920-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace the older FIELD_GET-wrapping helper macros with plain GENMASK
definitions for the PLL CLK1/CLK2 field masks (CPG_PLL_CLK1_KDIV,
CPG_PLL_CLK1_MDIV, CPG_PLL_CLK1_PDIV and CPG_PLL_CLK2_SDIV). Update
rzv2h_cpg_pll_clk_recalc_rate() to explicitly extract those fields with
FIELD_GET and cast the KDIV extraction to s16 to ensure proper sign
extension when computing the PLL output rate.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- New patch, split up from patch 3/7
- Added Acked-by tag from Tomi
- Added Reviewed-by tag from Geert
---
 drivers/clk/renesas/rzv2h-cpg.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index ff688dc88ba3..9c4c5dfd5593 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -49,11 +49,11 @@
 #define CPG_PLL_STBY_RESETB	BIT(0)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
-#define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
-#define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
-#define CPG_PLL_CLK1_PDIV(x)	FIELD_GET(GENMASK(5, 0), (x))
+#define CPG_PLL_CLK1_KDIV	GENMASK(31, 16)
+#define CPG_PLL_CLK1_MDIV	GENMASK(15, 6)
+#define CPG_PLL_CLK1_PDIV	GENMASK(5, 0)
 #define CPG_PLL_CLK2(x)		((x) + 0x008)
-#define CPG_PLL_CLK2_SDIV(x)	FIELD_GET(GENMASK(2, 0), (x))
+#define CPG_PLL_CLK2_SDIV	GENMASK(2, 0)
 #define CPG_PLL_MON(x)		((x) + 0x010)
 #define CPG_PLL_MON_RESETB	BIT(0)
 #define CPG_PLL_MON_LOCK	BIT(4)
@@ -231,10 +231,11 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	clk1 = readl(priv->base + CPG_PLL_CLK1(pll.offset));
 	clk2 = readl(priv->base + CPG_PLL_CLK2(pll.offset));
 
-	rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(clk1) << 16) +
-			       CPG_PLL_CLK1_KDIV(clk1), 16 + CPG_PLL_CLK2_SDIV(clk2));
+	rate = mul_u64_u32_shr(parent_rate, (FIELD_GET(CPG_PLL_CLK1_MDIV, clk1) << 16) +
+			       (s16)FIELD_GET(CPG_PLL_CLK1_KDIV, clk1),
+			       16 + FIELD_GET(CPG_PLL_CLK2_SDIV, clk2));
 
-	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
+	return DIV_ROUND_CLOSEST_ULL(rate, FIELD_GET(CPG_PLL_CLK1_PDIV, clk1));
 }
 
 static const struct clk_ops rzv2h_cpg_pll_ops = {
-- 
2.43.0

