Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A196EEA3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457F710E9CC;
	Fri,  6 Sep 2024 08:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="NbO+9I1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B532110E9CC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:57:55 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-717914d6c95so1067619b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725613075; x=1726217875; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfPCPDyI1RrKAFi5i8oSogBSmIZBHNxCV6AppJiq/Hs=;
 b=NbO+9I1Fxrq0pmOsSDEBTt7AOy3eLu2t48kWV9+RqqefIoRJGgY+lt/LJZAiRYv0Si
 z3D5LVHttEDv3jmlmtAAfngyTVKNcPZrPadETcL4H0k+GygN0vgjLDnwM+yg5+5xJJZ/
 PiSjq2E9fbSqrq0sYFZg09f/QIz8YtffQ4LePZc+MDyoVjw/cHDGEDHO3zMqnJvty/IW
 dhzVgU+cyAAOwXyC3AQIo5wK0s+RfU/YHnKo7OrS44GZ3wbFkONoyzrCc4q5Sr+XFf4i
 3aBa6h1Dtn4p2qrCVymzd2evG8FSmSQr+g11SGSltktqQQbXbltZeuk6Md4GrpHpW9yQ
 3x1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725613075; x=1726217875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfPCPDyI1RrKAFi5i8oSogBSmIZBHNxCV6AppJiq/Hs=;
 b=JKWZDuq6Lfv8lYBk1u+qKeGonZQvG9QcegOda7q+LdeIPzPwHkGPkzOQai9v/wmPj6
 SaUcuqOACUgLOjziMoH7i8D3XILERI4CeEhOHiVErKnIAcHCgAH/gYVfp9/GDaWzztXZ
 9oeqiUwJkHT9lZmn7+4B7UYcuduAJBvJSf/msA8DiTBdb86forXWPNEJbMc+Nf1iq91X
 /ETHn1XPuN6EBKvNjHGicncbw7cDHN/poFEu3Uqzt7d3fDyjTK+KeXulVT5yUXk8UEYi
 3w0jOISQSFyWouC65nkg8pAikZDC4oIRElVe+6d6DOcz5jvDhuzVVpcW+Uc61XeImDKI
 OWxQ==
X-Gm-Message-State: AOJu0YxsIqGlplafUgDPZAiGIRozG8KEQpTJeK/KGn4dQc2jVqN7FDfo
 HptNeDDN/gyAnkNo5P1FvK907iEa3MUnbmYqO3WVYeBZJwmOLH10UEq5orZejDk=
X-Google-Smtp-Source: AGHT+IEQknbzHq8Vt5pY2Z0mPW8VsXzjXllMF+wnb/G0zbnfo/dO7wl0slgZX4oz+k9PIl8B5XeZGg==
X-Received: by 2002:a05:6a00:ac6:b0:717:9462:8bda with SMTP id
 d2e1a72fcca58-718d5e16866mr2039277b3a.12.1725613075015; 
 Fri, 06 Sep 2024 01:57:55 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71798286219sm1439166b3a.57.2024.09.06.01.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 01:57:54 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Fri,  6 Sep 2024 16:57:38 +0800
Message-Id: <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
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

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4bc1777b9ea6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,17 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta-sku2147483647
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

