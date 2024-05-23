Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2E8CD2A7
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6CA10E3C1;
	Thu, 23 May 2024 12:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kagV/cO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9C10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3504f34a086so5010516f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468578; x=1717073378;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+aQzYfx/ie0kc7+1Z32he9tzRpQ+MgXQM9NknN/D5iA=;
 b=kagV/cO2gXv49kZqb+lBWnHTHfxwlMqT4M8Ln65vWzR3EaVm2H9cKOjCeUxiNLZs6f
 WX3Z9NrAld4qfsq2UBSSTT3bu1OMndZ71jEeNGQEENp525xeMo90YhAZ7+0StjcBcP/S
 6vhbVRF2IYkSV9DF6S0eexX6rtctCM8mVH0dajGVwaa+UP5d8dQcLfhC2MxqPqUagEU3
 8I81Acd+0sM7M7j2BnJLy02r9fbrasCbjKx5kZyxkx0zPTXU/9qwTvxNnSe/R6wSup6x
 C24I928u7qykJSZtzgEh/vCn/yb+SOqIwnwPvseaJ8JV9vWHNLmyUQ3/9E7V0oTPMgc/
 Fjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468578; x=1717073378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aQzYfx/ie0kc7+1Z32he9tzRpQ+MgXQM9NknN/D5iA=;
 b=p6niMSD7VL+p/sq9S0yt/tv62HncC0gK2/RSJwzDHS0EGoKzuGJ0nAQiaqqH5ZdIzX
 i8zyj4DuUecUW9kV0Ev6IuOsMY6xPvQkXhy7t/8WzDRuarQCw7+th/dh9zhQ5d4Bcj+w
 HYI5BrpPs50Ei/LqkhaP3QYZp9p4YujdHgZ0ZBQjulVX0+JnyjJzoUt8V6clzwv6x5Kx
 R83Fp2UJizhLPF3z9yPMofv7ONNqPDq5FU1wcunBQsvd7ypOpIHAZFxEfIoq3sfue78B
 2UkU+LzVNILjEBv9yxM0tsQOs7J7n5HlKLRx7XLNgKoiyL0Et4Bl9LUQEvKXSHQRayCo
 Z4eA==
X-Gm-Message-State: AOJu0YxQ9P2joJjaFQxLuHEotd4ot2hLV+Dbmjnti3S+VND0iGaUhrn4
 uw/cFAddoiDAFeSTsEmzIWbWS6DFvWO8+jR0SalAaLCdQxOVnw0Ck8q9qzA/fn0=
X-Google-Smtp-Source: AGHT+IH4iGNET6SfDzE6zGc6HrJXgpoDsPJFOQ6KQfsfG3Wg0YhjoGdSQjdBLOB748+cCcpmxdRUOw==
X-Received: by 2002:adf:ed0a:0:b0:355:2e7:376f with SMTP id
 ffacd0b85a97d-35502e73990mr193601f8f.49.1716468578424; 
 Thu, 23 May 2024 05:49:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:22 +0200
Subject: [PATCH v4 09/15] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-9-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=UlNxnBvCjVx/6W65jQPfxXx1AFy8RRqkUMIMHAwcg2c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTvT9SVcXKFGF/GCpDExbo0SpPFXpWKioJegyL
 m8sMYAuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURTHMEA
 CCECqLgS+dIQk5Iq1e8TB/sKGUiM4+JLGu0ybDlieP1yzfLUZvaakMMuUvb0c2wHeT8euFl3vT+hUR
 /hhel+PfLj/+7c5BO6Jal85N8SlgjnErhq/bwMPRpGEjfqgoDbdizJC0o9nsmYMJPzHVeVXKsVnoNo
 TQFwbGwjWirTY5zIJGNIEItsF8THGHZEhW5AML0R1chmvnfGSiwBPXtCCSOJE1jVHKvwbFErSwbBRc
 TdikgvrqxVVVZPONucpi3aj9YdzMuefW2GyC4+lfYHUQj+xVFkThOalr8vDA3ul3wD1wkXNP2EdVYy
 3rJpcB+WNfKSsfGefWYEo060oeXA57sjJDwRJ+Iy1ImNa+RwvX0eEon8fdvuygMpGt0Z4M8pbGLn+/
 VveBekcnfmasbPIVFTjmBUAnYakjWnRkq97bJtVt3WKrgvAHsaZ0amrtvZKdMagOPse5GNqJAi945S
 XJPf6KuuKHjmk7IEDBzxpgrI6sR0qvtz92ckGoFGlwSxQFRl1Fdt1w8NUYTLEXqovUC2PXkAqB7Vai
 aITDWPs6S75IIWJxk9Dpd9u6xDSzoSjTCSw5rHHKbLSEXxBDzDHU/FYc54Rf0Wf9NddVmZL5Re2vFq
 fQ+13hrduYg4lKbs3wZbD++TiLXf2U5H+/QT6C97HjHvFoe2Qow1CrcSZcKA==
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

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index e93f0247bdcc..9ea796a033b2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1

