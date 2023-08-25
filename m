Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AD7886B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77C10E664;
	Fri, 25 Aug 2023 12:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A050610E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:11:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a4737a08fso1197564a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692965514; x=1693570314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W09M8JIJtZCbNBhGe/AHRCcrRIGkrBwh+HJVwKRzmpo=;
 b=qy/k8F4E2HnvzsVd4KmFJ9w+Is3DiCU8cReyo3hylHEak4SVWOjMPSvhS4/qaaCgvA
 gy6RFInVgy/huM+JuWnN+G2wXg7OC7gFuYVwGr7WH//qN5CgjPciVrBKR6q7Tju6Gx7t
 7nBqvHwBincOZ3iQXO8cWUDH+fMLTGv49kSthzS0o/vsrTWMYKP4p/VMFxqe4Xre01+w
 Vsx+JAOobalOWf4KG7OwC0jqltoRkxFpPV9wtKcos2Bpcm3J68urwbix3l5LFKaXZmM5
 xwl3TTxDMLEcJrmF0JAHKjV0tP7kWfLK23KvpMX/v5o3CAKQK7bznbZhI4KMuEixrXB6
 gquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692965514; x=1693570314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W09M8JIJtZCbNBhGe/AHRCcrRIGkrBwh+HJVwKRzmpo=;
 b=ADos7gZsCA8VDpo2gNwOg+LXlVMCW5pksQZLfZTnaL2hQxteVOyId49gL5slCwrumO
 nODcetPCh8JilMZHtzjexmd4AB/TzuqegUP+BnloOmkDRjAwGey32uwcwdpV5fQorx+M
 GUIh8SGd8UqXTLie6909jjH0jZRyoHFiqdL944IMCpzyTO6HkwaQfBTconfT3tUzVDBL
 3HBsma9PqUdVs97Uv0zBjd+r7r8n8o0HeRd3hRkTPxdlIFEh2QTBOgyUTPOanle/Q7/S
 4u83XVo8+5+6T6uyDffPglAaKRjzisbXN8QslzyFWrm/psbZ1pXUpLF6CQmUtEwPvQu7
 RpVQ==
X-Gm-Message-State: AOJu0YzoY0xTZvgfvsAo1OLOy8N1RCH2MkALNGIIifZ0c04yWKMILSoz
 zHToExV0uEi+KCyIQm6CfD89kQ==
X-Google-Smtp-Source: AGHT+IGeaaxzgQU3D9ocJw3HPTByA322ZOhgy6e3l3Q+GdmYumf8G9Xf+6/gcGtQ7Yrnsa53Y5ZIkg==
X-Received: by 2002:a50:ef08:0:b0:523:3e77:7eb5 with SMTP id
 m8-20020a50ef08000000b005233e777eb5mr14091316eds.2.1692965514049; 
 Fri, 25 Aug 2023 05:11:54 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056402124500b005222c6fb512sm952311edw.1.2023.08.25.05.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:11:53 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: display: novatek,nt35950: define ports
Date: Fri, 25 Aug 2023 14:11:41 +0200
Message-Id: <20230825121142.101759-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
References: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

