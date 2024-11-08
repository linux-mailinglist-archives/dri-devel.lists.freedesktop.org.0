Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EB9C309C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8639310E3C2;
	Sun, 10 Nov 2024 02:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nPJpQ3ZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CA310EA2E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:06:05 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-720c2db824eso2772628b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096365; x=1731701165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MixVMk/wslAw1xsTOkN6wfczgHqltXmLX+pKvnNl3Lg=;
 b=nPJpQ3ZN63WU5oNwOnDARexgfMRNQFrwfZcocFA9su2gZDlprGhYxFPBteQwv3pFyV
 gzPvx8zh9TNoARpeOW0Z2GKRWV2wLmOU936OZH0hQCCIrG3BNzSwKz2PXx6gd0+SGE53
 NaNumIuYXqQ/A0IzhfV2YpdPDFLrUIVuCaIzuop5XNgNiFC739TCO63xnLVl+/Y3TxOf
 uDRPqFeTFzf8STYryaExSrNMNJwlonxMbfodeA1n/MkYsYdUc8BUJg3h4uQazDuokJST
 7VT91YMRy8UfSTmSfW6tu3gXkCY5C3405qy/w1xNVf2LIB3AtZJG1HFDC8avPcqj1p5U
 yIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096365; x=1731701165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MixVMk/wslAw1xsTOkN6wfczgHqltXmLX+pKvnNl3Lg=;
 b=dWNRoHUM8shcr5aob91P0356aCa8K9mnPd025QTpl40PXzYoYW9hCXHLjJUUfN1Mnx
 2ivZJ6Dac5s6fvSOb+dIO6sN/GzMDTtJj9Nrnq+dH0ZNH9wW0xQJ7mYihfBaznBsRNHf
 SkXELLVlNqH5lyprhr+FP8WVY+vKCt6Bb4M5TKUuj7ijDq7VOaTPUKJTbZGK9HUtsvQr
 odauQihSUbaaS+UD1T2axKeSk3s8KX+hCavuthIk9makY5ebAYhrRD28PbKgZB/3eySI
 +ZciZPYIiD0PsflYXLwGopqBovaRkZf2be7Icz6pF9BPLcE1irK5dnbIOY29Nt1u6yaR
 nV1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpf2RBEskdUUE4uog/cQX6BkA21JCDm36unm+86Rp61GLS4x4fPl05hAalZAlzdvl52+Ryw2teU1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMvxRXBNENy0P339uV0jOq3i/WwdJUCRS3JeRDnmsfcjaL7FP9
 HJvvTAWgzWPrZd2km8ZcBE6DdVbYBbfDKr5TY1zS2OgufVrK/IP0
X-Google-Smtp-Source: AGHT+IH7o11M93UClWtTtaFbiAidNYRC+oB2PSMV8zE6Xekyw2VNGFNt3IpJUTSxb/NoeMwagI8ZrA==
X-Received: by 2002:a05:6a00:a95:b0:71e:b4ee:960d with SMTP id
 d2e1a72fcca58-72413290c8dmr6281896b3a.10.1731096365103; 
 Fri, 08 Nov 2024 12:06:05 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:06:04 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 09/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
Date: Fri,  8 Nov 2024 20:04:38 +0000
Message-ID: <20241108200440.7562-10-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 32978dd9e..4ddea1a20 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -139,6 +139,7 @@ properties:
               - ti,omap4-panda
               - ti,omap4-sdp
               - samsung,espresso7
+              - samsung,espresso10
           - const: ti,omap4430
           - const: ti,omap4
 
-- 
2.43.0

