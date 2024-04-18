Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056A8A9C7A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4528E10E994;
	Thu, 18 Apr 2024 14:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Is+tGBYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA32113CCF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-418effbc70cso3843365e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449839; x=1714054639;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0DG0b/DfAuQ0lpoAh7wbcZZOZxcaD5fpXedR92n3Ro8=;
 b=Is+tGBYsmCrg1wUYMnaIlm+4RJrYCyiJegBXjb5mRskXjnrPNGZ2ntxxhVd+TG4WuI
 jKoKLyojT8IC5Htih1odUnD8UUUKeZ9QRpuQ5To6UkJ59RASCiJVEX2ihGQEjW1K8/3s
 NhBNDCJ3RiAptQ61l1427Z1YhipXf4kCS8ffn9KJedjI0yoFmxmNTho+uWAUbo+L2NZ1
 8KDS2GlyvgHWYAKVVOTrf8ZCo16vvGBMFAkoNG4jihsZLSjbQXZhOkb2mrddNCe5Lsw+
 ajEfqSj0OvxTyeVCiSwskIcHTy0/QMMY0zGR1zG/QAsj4aJevLM5+vpMSin05BVFA20R
 fhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449839; x=1714054639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DG0b/DfAuQ0lpoAh7wbcZZOZxcaD5fpXedR92n3Ro8=;
 b=FZLNMisewkLGdnPr2a7Bz/X0jcX0ODSE4/HmEy7sbT7M7gJo3WjfDesAyOjykUv3x6
 0AO3c0BvH6GfK+ldcLu7WagKgPJK0hZcbYrVlTlbcBxCBYWcd0r3RK0aFPxvQHUF4zLe
 bTCEcQTFFLOPcBqYgZouUU+jLPW5bUY9xvF96fLMWOX5hf+BbMZrvgjFa5cYHbF/Gzrt
 8y1kkHT4Skog0FqWjpSiLIATRomxkHY1rXDzttuIEofFpGM2ijhZmHkotwpSi1DHGWQX
 qbDHJ02Mx+wi0ZLB3P84D+FNziTGxYZ25hdDkpGh10jYH9HmTm1x/ijSlB3mxVJ4LOIE
 CHPw==
X-Gm-Message-State: AOJu0YxMRkkkA2U5ctxsUBhr7S5wi2yzQUv4hnr1OKWWMRp/nbvnopfn
 ILx1rwCnkB4B+9diI3SVYSmmb+TCAvtlH7m7yB1F7t88kWV/8RtWh3Me1qryZs8=
X-Google-Smtp-Source: AGHT+IGc8UkY5hUU0SOlQ+WIGwXJnRwFCQFFnKe6zffCNG3YDmpTofKmmzPBVeBk6KtCqcf7OWNn7Q==
X-Received: by 2002:a05:600c:3ac9:b0:418:d3b3:3188 with SMTP id
 d9-20020a05600c3ac900b00418d3b33188mr2065709wms.27.1713449839274; 
 Thu, 18 Apr 2024 07:17:19 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:18 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 18 Apr 2024 16:16:54 +0200
Subject: [PATCH v3 06/17] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-6-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=l0R/nimPplfZesZQ5psmzigcqOrK2Svu7sgk1YEc9To=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStidrUSXn2C+2OPoqTCEjrSs1uAvZ65nuZ80U5B
 +oCvAVKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURXPdD/
 9udyeGAimjp0d/Gvu/tp2AHHzp9p4lotNsBdYQo+coQVnqgTR+wMNASNy7Pxt7p9VYRl+Yk8W/H8cl
 NulRyeef2F1tZPU6nE3gazrF3fGfYmQSe67RTNOp+2mPp7ajGRXJ3MDqabyRxd/qIK/+1W1IsFIYk1
 lQuwS4SYghHk4zjZbnVCchG41jsC+O1QzZubAQBmK5HhYWlC/taQ4kWm9oOS/BxDNeuR2yy+jWG7fV
 gw80gssGmUjFytjwnUERWo9oOnHcAVkCUGxy1uXeyAZ+URnebbF0kz6as9XU0jIBrVnTIP7fRv5byf
 yWsTpdf9AzdPBQRTXIxIpbWatMvwpPqx2PFWrYmCrRDQc3UY9jA1xDiI6sG1Q5KZ1x4ioqobcPCesy
 LGzYk59OaS8jSz2CV3saEWvQY8fBrmXhVDUmIL0FkHjSiJzRGOyTU5UaZ/jHVp9tGjWIXu+GxDwb+T
 RsDgKIzWTpT7Zo/TG0zX1Nbz2CClnooX7PGI5+Vm2CpzQ3ZDPhE/JDdsbnitH/1CLTM3BVKXHJnpWQ
 iQzNRo2m/H6vOSjrtYOcTXhQWUkDX/l8mTEOlyxfNH+DOyBiMf0w2CrXWp8Q6l07whJnb11QdvciWm
 pxZCrSkDVuLRY1uvTSbKhR43wBa9+fVtMKoPU9V3C3DhvaC+AcICx3aEC6bA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
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
2.25.1

