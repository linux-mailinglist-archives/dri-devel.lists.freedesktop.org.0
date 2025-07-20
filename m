Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED94B0B621
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6118D10E373;
	Sun, 20 Jul 2025 12:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l0BDoyKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC5610E373
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:30:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-456065d60a8so1603955e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753014615; x=1753619415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITov4qIdAvf8lWzJF6TY9XuWoo2+Tb/hkSGxqIkLH/M=;
 b=l0BDoyKANcFAgi3OsjM0yHHbADf2WI5Dbrjb5ADTVOvX1I1N8mQxArh8PCXmz4x0TV
 MD4vxHg1pqTMA8kS3ZLLZOYF/uFGKIL31uIjdiUBlUS+WNMxvQu2kPdR+b8VaHB1UTBm
 SBagH9QvFuvqW8BFITP4GDFnqes/5qEDaKms/h4y9qvT9umGOLpmBUUN4T7WziXWPYyF
 CqXRHqq+o5IrJjbD/6J3FvOTpEbQfCYydjMzFR5DUtwpOu2WAGiR0TKUdc50TxSzn/Kq
 KnmJCs7b6XnJsaBzbQsyQZ0VJuBHebfJ44IRJry7JnSuQPhfA+veWN4+CaDLN727g2A4
 iJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753014615; x=1753619415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITov4qIdAvf8lWzJF6TY9XuWoo2+Tb/hkSGxqIkLH/M=;
 b=vhs2CmW8re7QRPYbhtoufjGwjx7gNL+RvT52tNBannPAT3Efk0zmQRCL+gKCvm/tyR
 QLoAZ6kLbYp3oQu++PAh1X2lUNb1JyFb0XKL7zaJBLXo67BlzcgRjWkrjbA27N9VBdxN
 Lszc3E8Y17VzhDUXUDyZB3xt7A9gk6JHtSxqM/Hy6mQKMk6mizihX3nQ5YtVNRtzdyN7
 jkjeh6O5UNTVjxu0km0MTUgPDDcOURQXnY2UkSoLyFQVWCS/LxOlxVdx3oamRPak+InC
 GSmoat8yBhpgPYaFx33LYcwTP9tu0m3vioqoesPL0qOFOWQL8V/fBrXVM94kRzJGOmCg
 cO8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5/ec8UNaFZVQ+0wTdCBBr/2cUmBbGdVMEf4MOBosuAI52aRrvMdMFRWk1hivlxkMuUCMhmMrZano=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+we+XlL8xLcCmuaKsceDQrEcZBhNi55nC/xPjTi9W6FhuXYKp
 edXD6OEd0rMgkBSnswnU+zpCF5tau0RAKpB0fm5uX2XZ7NEgoI8SoD90E/L4UTQRQjM=
X-Gm-Gg: ASbGncunUmKdC3rsEHKQ7pFqYfmN04sbZrB2mNaEaCHYfJYxpCG9cC85jAt3/RJCLD9
 BG0lI09c6wKQvCoZXtVY4omw1bqoV1dxojoWVz06QWOBjquLFLtkgy7+UdhLYIMPRgzKxEOgQRx
 RYQBMhnrUgO/1EfmxhtExRmnLvlUvpiEs5kKysvZtCVCFtvpVF93dw9TAcLcjNtx55pjuDZcSGu
 zvFgiOYQejzeQtr6NjRF5WSjqI9iiIH2LwcTbfaASn1HIilH560hoMK9Gsp6b0/hxR9VJwHDMJy
 pXqhsC/BcIBE16/IvRDzXiI+U9KbHyzDCR0CU5xptnqAEHvYIvHHXPmWO0cI45sXIVclhJpspFP
 cFUAECn1pQWuWv1N9uMURCRE/X3rQYNt4oKwb12CzZts=
X-Google-Smtp-Source: AGHT+IHKkzedqggU7tdQbGO2iQYDtYMa+xUa0R1VwsfNMRAHllbqEZIvc4xTQ7uGNJ6WE6I0HZ9CVQ==
X-Received: by 2002:a05:6000:43c9:b0:3a4:dc42:a0c2 with SMTP id
 ffacd0b85a97d-3b60dd4da51mr3774512f8f.1.1753014614324; 
 Sun, 20 Jul 2025 05:30:14 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8ab7a1sm131396955e9.34.2025.07.20.05.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:30:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: sprd,
 sharkl3-dsi-host: Fix missing clocks constraints
Date: Sun, 20 Jul 2025 14:30:05 +0200
Message-ID: <20250720123003.37662-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
References: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=G1IxtxoyT5Pp2Nmr9QySSQastbYC6kRKqvAvFtsOPwA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBofOFOrp9KG+sYVMZTHEpNsEz6647Gqk1eQOCOY
 ru2NyZsdxCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHzhTgAKCRDBN2bmhouD
 1+oDD/9x6NcU/ygrIopuaBmA+VaBGDwbNiJBqAOLX5nXA1w0DpyJREWb1dGfeogt/ECQ69xfO4D
 CyUlefhjTxuwFMCTkd7VX7DhahEHDg8QjYTOShZIlkix8tR7J+lQi/HwFebJSePtQjvNwRrCpme
 xrHlAYxnCBeTra687UsdeqPH6yqu94nzGjZJW466ZJ+j8UhTjaCgbld0aNDiLAyj1pEA0UySh6h
 fahN4a3l3YIgYvmN3FoMLd+XfJisBRO99VINHGY7o2bGhZLTylkxrABmm73bbwdEAz6Sq9cWSs3
 cZcJwL479QRukFMGKtrUFhSeAfsH8iKjG7hHAeCEMdUoILwOX/dZXOJQWCVhS4rjVQxI66wRKiz
 MtvqFB+e7oa8GwdhUQ1DPSYs5LHcIQc3+YbOB4uMJouh36GVsPsynwBFXAFz/KFuWZKdbQKTFuk
 EXZLMDmta0nnVfXLOre/j9C9hzOFGHY/HR1nmClDBE179eAOYWoN828XaoIEpxyFKw5g1s0/tIc
 7mXfxN9sbc+EGKeOJt+sFhT8x+EPtweVLf5GNoxWRMUCJwzxEsfLaZOSrkg2WeiVV48MIgjbbQq
 m7tedzr8GMYBHcUeV1L0CZo3TeijVnXKs92wEz4kavhGQpl2wTHGutKF9s8/ljEeTPjiGdvNZOy
 rhY2fibHhIehjCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

'minItems' alone does not impose upper bound, unlike 'maxItems' which
implies lower bound.  Add missing clock constraint so the list will have
exact number of items (clocks).

Fixes: 2295bbd35edb ("dt-bindings: display: add Unisoc's mipi dsi controller bindings")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
index bc5594d18643..300bf2252c3e 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -20,7 +20,7 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 1
+    maxItems: 1
 
   clock-names:
     items:
-- 
2.48.1

