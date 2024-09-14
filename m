Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27492978E6C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 08:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172810E1C1;
	Sat, 14 Sep 2024 06:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="k45myYcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA510E1C1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 06:31:38 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7cf5e179b68so2357731a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726295498; x=1726900298; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMbpfoBsozAlPEt45oixhx4qB7QHE0ziqmDEI/ywgss=;
 b=k45myYcRFa69EGlcw1o2tr1B9I6Vwj2YhJXWJwpH8TFkF1yTjOuo/6JvfyqbToYVmv
 OwzxQG1mCROMgkADItdCcDgL3X39Z5BPxnQFck35zV5h1Z3EQ/qznItUTvtHdRvt0JEe
 8bA7WsQNl7NLt4s2Qp0Km6BNbuTbZGrtA+LtckBO/vo72Rr9mlSHJi2lXcEJI3nKelBo
 iPIem3ss7eW5xTc94RdoFpfb9k5j1yiJx2xrRia9XDYA8DdpH1HenBaabAvfFQRkImXz
 uPsoBQPSlohvgjTReWeZzBRY27GPA8CEx5riMg2fRiroTt8wlPSNAsAzARY51LE6Qw29
 cTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726295498; x=1726900298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMbpfoBsozAlPEt45oixhx4qB7QHE0ziqmDEI/ywgss=;
 b=kyWEcni1eePXj59ZAOqBzyaESjOkRbFXWQxCMjdtF7LlXCJ0tfBVchwaIDU1069LkN
 2v1SSSgEzSp+cR0gHnWDbWEZRSmffM54x4uF362Rz02jqLwBvnSCbM6aWexnzAz1q8hX
 W4xn2hx3lfliHQCC3xGtYTnKzH3OMrQ0Og7kHOXq/Jo98Yse2qaWQJ61XbbfM59uvRHE
 A4jVXXVOWczkBentq75NG9k0CKMOIPdrQfa8Vz6tUCIUFn1FI0BoRCJVoHOuwH5dDnrQ
 A2Nsx27hwEMQft2OVfUFuqFZcquz6Q8TcdsDpeRm2So4yP/lJIylBIGM32qjB+csql9v
 MoGQ==
X-Gm-Message-State: AOJu0Yyb45VETPkb0XD6uxSjrzRu6H9xFJt8T1NEkAQbGVP7mgGGdDOt
 0mKrNfcGVLY2Z8zprmZ1XaXTtBFanVZz9CJKFh0BI9KWcuCPK9hhuwm/45vqoBhd1bzwf4jcv6u
 w
X-Google-Smtp-Source: AGHT+IGycpetak1pWQ8TZomDKaTDzd4/oHu4i8ppeV0iKcr0nagXoU73WEZHK3VSlahquUT08PKg5w==
X-Received: by 2002:a05:6a21:328e:b0:1c6:9a3b:ba44 with SMTP id
 adf61e73a8af0-1cf5e21aeddmr18019343637.25.1726295497922; 
 Fri, 13 Sep 2024 23:31:37 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db4990cebbsm599216a12.37.2024.09.13.23.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 23:31:37 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Sat, 14 Sep 2024 14:31:21 +0800
Message-Id: <20240914063122.1622196-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

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
index 1d4bb50fcd8d..88f50989ba3f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

