Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C119D976C65
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A06C10EBB1;
	Thu, 12 Sep 2024 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ckyzPn7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0F10EBB1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:44:41 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-278279a3a39so511250fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726152281; x=1726757081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBobOyxG7h8nS1KWtk3g4MWOyKZOXk2z2jSGYhG4DTs=;
 b=ckyzPn7BHwdH2AxJzxPr+D2EEpH3m2P5SrPudqCsWzB4am+wpbnBn+qxmRjhLKGlUb
 pg/aRi7ekLWGIB9qrCJmOat6Rdrq5HfFRkx3dlz+nCi3nhtoenTU2bCzm/DO+uJwrzi9
 Yqhe+0aEGxU8TNhoN56k7F2cTeGdovHTF0Amk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726152281; x=1726757081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBobOyxG7h8nS1KWtk3g4MWOyKZOXk2z2jSGYhG4DTs=;
 b=wq1Wj14msC5QJuTHArjRpJfD3s0bHvqWAoOi6L0aG+K7hOmFMlvDJOfvYSz5geLypo
 ydAf1fJRjz8GQ+/YeX2vl88+04n/CxeNRwrnjrljJKMlIqpCcqw8CF2Hky7/NIYxWM6I
 zOtaQoZe1tot/0gPQUFKoDlc4/XWIWqYABGlaX4SUKCpOWFM1VUHD+MF6aYBFJNf7IUg
 Jo+J8ye7EIz3uBrLzNJlVHoRUEqowrs6NJZuuXMkuG1ayFbsWyswMmbxbMX8E+tk9Ho/
 ll7+O2/vQyb2ddkU4SLI7tAfPeL/V9keDlv6RSBbCYJEct70FYOWAZ/FsCkWE0t5JQ/o
 /fqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEcedpkgJlPXNrIbyPusqrmWmtvtt/Z8WuWlagNmhLhvdWwE7/1M4GQMpeWpOIjcpqfLgBlzQRKXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOJfuJZoq20PW9FiLsLFT8R5SI8oHl4diNrK6iGt+5zbZ2AVws
 /m5TbtflfSlDtwkaCIi0mTJ5rSOkuWazSoEXQbCIrgeCiY02aqcss/xxrCaT7A==
X-Google-Smtp-Source: AGHT+IHO/WoJUXlOGm3jql0fNBGLuC2NTWOQUgJ/i3VELhySJR9ptX7aA3pjDFcXYgWO/HiMD6f3fw==
X-Received: by 2002:a05:6871:2b27:b0:277:c21c:8619 with SMTP id
 586e51a60fabf-27c3f0e0e6fmr1795567fac.8.1726152280812; 
 Thu, 12 Sep 2024 07:44:40 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:8638:897f:b6cd:8c44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 07:44:40 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>,
 Fabien Parent <fparent@baylibre.com>, Jitao shi <jitao.shi@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: display: mediatek: dpi: Add power-domains to
 the bindings
Date: Thu, 12 Sep 2024 22:43:58 +0800
Message-ID: <20240912144430.3161717-2-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
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

The power-domains property is used by most DT nodes using mediatek,dpi
bindings. Add this to the bindings to fix the schema check error.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..7e0bb88f5856 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -42,6 +42,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   clocks:
     items:
       - description: Pixel Clock
@@ -82,11 +88,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;
-- 
2.46.0.662.g92d0881bb0-goog

