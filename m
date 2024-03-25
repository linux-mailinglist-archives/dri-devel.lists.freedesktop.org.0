Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC903889AD2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646610E73F;
	Mon, 25 Mar 2024 10:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iBzNi2Ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D210E73A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:36:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a466a1f9ea0so250805666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711362976; x=1711967776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W09M8JIJtZCbNBhGe/AHRCcrRIGkrBwh+HJVwKRzmpo=;
 b=iBzNi2Yedwx7wqldKjBI254kHDJXxJk4lw3tkahNTgjHkzH0KSlHKi479zirURV4g3
 w7kofDOkMdnWzS2+98Lhz6UTgxLvgf385lR0qgXhKpBsGGm/3tPDK5kOI3oq4eMcnmKM
 fujCLN8KGf064EHOwyffFkJ5p2594dyFxQdB0zR4N6lzpEzm0nMgxuIIwtK8KZYWXjxJ
 wO008ftrZZco24WEfQId7au5pd1793UebrosbH7+B1h/ZubUOQ8b8SWOw6T2TCOpYxZ+
 W6EUL4qcBVLllJJ4Gcbllf3tB9MlgB6BX6tg963Hp1ZnXWl0FFgkwf8kGY+f2Ocm/8eS
 eR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711362976; x=1711967776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W09M8JIJtZCbNBhGe/AHRCcrRIGkrBwh+HJVwKRzmpo=;
 b=RP6AtoXs8WhtfUmtIPNwofhO/HAPAvRF8ir8+wURgjoMfcGP4r7MYVoQTIosP1JZmt
 OTEOeAuLzlJNAeKgtJBhtwUf3gznlzrwL+2f4aBMeqP/OV9ciWl74zdE+U1VOsns7H8G
 GBE3wDcAwMiibQXkG4ly2zhRuji9tp3xDAAL13yiayvDyaokfTsZgTRhOW7SKONCXu3y
 6en1WqpL0Oe7uPl6/gpuHGPkAe88WYmby70sfYxhC8LhLgOJkmakJZGYBmjal8IZ/M6D
 J1DW+HIaL9G5vF4fRD+UqX7tdoMnq5rZCGz90RcDO+UOMgc0M4Qri06dtiULEJ4mOW9G
 zGjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyKW2OA2oXiL8s2JpvU4Rfg2oppoNjKb+sZkhqkPq48PAh6YH/fv14slkCW8gMIUzJuFyZ8yPenn3rlta5unisP1Wi/QlWPKuomKPYjsFE
X-Gm-Message-State: AOJu0YzoTJ4PlJejKdXOluqOPZVtfHeGmS7r8lxfJAeSfCdRkNI7NO/e
 wcKBYgnwZA/6Fc1V50eaVvxg0YrTTctJ7NBnqJEzKpi01nZtGnr7Cj9yZMqc31g=
X-Google-Smtp-Source: AGHT+IHmQpcP4djMqJlgyZNdnJK2o64l+ykSs8j6DoMBtPxwMAnnBzvrwX1Qg9HlK4MmGrHDb/DTZQ==
X-Received: by 2002:a50:8717:0:b0:568:abe3:52b2 with SMTP id
 i23-20020a508717000000b00568abe352b2mr6048218edb.23.1711362975826; 
 Mon, 25 Mar 2024 03:36:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 dm28-20020a05640222dc00b0056b7ed75a46sm2827319edb.27.2024.03.25.03.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:36:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v4 2/3] dt-bindings: display: novatek,
 nt35950: define ports
Date: Mon, 25 Mar 2024 11:36:10 +0100
Message-Id: <20240325103611.28240-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
References: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
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

The panel-common schema does not define what "ports" property is, so
bring the definition by referencing the panel-common-dual.yaml. Panels
can be single- or dual-link, thus require only one port@0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Rb tag

Changes since v2:
1. Use panel-common-dual

Changes since v1:
1. Rework to add ports to device schema, not to panel-common.
---
 .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
index 377a05d48a02..7cac93b20944 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
@@ -19,7 +19,7 @@ description: |
   either bilinear interpolation or pixel duplication.
 
 allOf:
-  - $ref: panel-common.yaml#
+  - $ref: panel-common-dual.yaml#
 
 properties:
   compatible:
@@ -59,6 +59,7 @@ required:
   - avee-supply
   - dvdd-supply
   - vddio-supply
+  - ports
 
 additionalProperties: false
 
-- 
2.34.1

