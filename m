Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CC970BCC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 04:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9510E2A4;
	Mon,  9 Sep 2024 02:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="hxeT2MK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2981610E2A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 02:32:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2d8a7c50607so2513697a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725849126; x=1726453926; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ai6i40gtLi8KkfaAdRGfJKbTUS/9SVUXMlQmPGbzRSI=;
 b=hxeT2MK6HHH9LS/NVqvEAe1WQ+f7blVI16JnsENO03evGv9c15GyF/u9eYNGqHzjSl
 hjiph8zsfVPqkGhCEztsk+k+86w+GZO8JBiPPImRZZB9PKdZZJ8dJ2d4MbWjIFAViVQI
 JCqF//bnigKONeLJCgZoq7YdSLmvwd5w+3j8FA0PK18pLTfFcXvuYtpjTLemRYtvAUcd
 VSbTsOmtHTtfeSb7ORJScNHOJCIpg5ifaoihY+hSieNcbBn13SxnVC2+NomqZOgUZVZv
 yuMNq/IsIdkHn/Y5kCNYOzG/n2wysvaAeTQpVH6pFITTI1UiGxHfl+rCDsPi58el+e9B
 xjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725849126; x=1726453926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ai6i40gtLi8KkfaAdRGfJKbTUS/9SVUXMlQmPGbzRSI=;
 b=sTBvq5li13zkODyGbIdhQT55NyXJtZq8tg8G7fefofLnw6JXmrA9+LtSzgdhKK31H+
 6hFCkakoNVH+4XYRZFq951iEmzbxBJqBtMHtL1jJIycAzkhzPqLyBFhMjCCgMLO/QkpY
 Ehe8CRCtqMU6nOcLb3Iyc+x86rzoG82/mIhoS/FLAeEvIj4i52ilcv6VZpnItLPDwMw3
 X5/AfGkeTN1eATJyegHQmpjo2w71rIFlUdBy+payGSlIa+n7kIfdnfxiupaisT84dcJ5
 6ADCMUkUafnlqUksfmllBzE04p5kPAGVH7QcyFFwyukcBEVuxsbhFKcgKIa1P8GBsnxD
 itTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDH9oZP6KhFVwYGXaS2aciFmhmVoeAPtevIsZCFytYavaqpbIrcEYPCDI8kLsNseaNmB4C40anezk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyAvqxjXFi6XuAphvH1h+HrQwJUtImHog4ulLjK/Mgg1pFUVRZ
 kzq2Ghl8yZ9YU/qtiBuEwpseAFWaVBUOEZOVSUEETGdWgnIGrthm23TC7OQpe34=
X-Google-Smtp-Source: AGHT+IGgNx7WABZhDETOCChw3HAPeP3YssU06NrA2tHr9bsZ2XDn3kY71U0vqFahzzAqH5lBWek1ow==
X-Received: by 2002:a17:90b:196:b0:2d3:c664:e253 with SMTP id
 98e67ed59e1d1-2dad4ef6033mr13296275a91.10.1725849125363; 
 Sun, 08 Sep 2024 19:32:05 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db049873b0sm3323645a91.47.2024.09.08.19.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 19:32:05 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: hsinyi@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
 cengjianeng@huaqin.corp-partner.google.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, knoxchiou@google.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Mon,  9 Sep 2024 10:31:47 +0800
Message-Id: <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
 <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
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

