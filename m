Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D49776A1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 03:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABE510EC90;
	Fri, 13 Sep 2024 01:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="frR72WQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA310EC90
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:55:20 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2068bee21d8so18192755ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 18:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726192519; x=1726797319; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
 b=frR72WQKEBoA5IBOvbidfdeMObrVVyA8Dk05FmMFlYOIjtnQfNZK0FMhFQNstp/inm
 p7bqfGyKAYxrYQS8Lg3Ldg1RcfcoGi9uyZJ4ZF+TWtmqMOR+dCyFW3n98iTt3+Y5xaIa
 QfWJeQi6DMECN4LA606uEnXbIVkkuSYe4HBG2NEY+6gDiu7VeD6xb6yHSFNbCZLoDowU
 i0wJggE6X1Y2nL1Va3WETvjPqbY/F6HHqKQOxFJMVlQi9VJJ2oU++FN3cCsJ6r9Xcurw
 x4so2OBvtDFf6zgFxaed2HvzXnXKviP3vec48wgEZh85Tck74tY9owjIl+oTr2g+RkDI
 Huew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726192519; x=1726797319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
 b=rV0V+sZLlragZXrDyTjTf5ero+7VlXLhcbbV+EKVacYsWiRNLF8psBJST5rdQJazyw
 HYbHfxD2/TwlwTq+sJu2/qdGh8Tpb8eh1QbGutm1N5WlrXcQOgDTD7vbO57m2LgriKYs
 wDdqDWFby3zvFm9BefnvlZuXv7U0/hAGnJMMnlOJ3FNPCheKnUh18czs/ZBCHIOa3ZNj
 YP6uF7A4D8BVvS1cq0piNFTwUBdJ40TU+m/sBy3XyS6W5Da1D4hNObX+fmjQxqh/kpNq
 VHwRtsIY8fVVPVWg9v5m736ksKBz+5+NAr2PBZFGozXUMTosMsEU3tOWRuhcIfG9nnqK
 VGiw==
X-Gm-Message-State: AOJu0YwOGv90RJ+sfhUaI2rhx4p6M+cjwOS4p/J0WGxuhPZrUkkxfZKB
 NlBgwVjqSnkUsSl6ogZBeYRr3fI2P43+w0+WB8Kxnx34dAINiVwuo/K9SV4NGa0=
X-Google-Smtp-Source: AGHT+IFSSYOJX031nMRvpIoTRVNj8X237R7lNtTDrvk+f/3CXcwctvLBX6in5w2tExnnjfh7zFzcOQ==
X-Received: by 2002:a17:902:cf41:b0:200:abb6:4daf with SMTP id
 d9443c01a7336-2076e41299bmr62421005ad.39.1726192519391; 
 Thu, 12 Sep 2024 18:55:19 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af49210sm19896605ad.99.2024.09.12.18.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 18:55:19 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Fri, 13 Sep 2024 09:55:02 +0800
Message-Id: <20240913015503.4192806-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
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

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..43a824bee1b6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

