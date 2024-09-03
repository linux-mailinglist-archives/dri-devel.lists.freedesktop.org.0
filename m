Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959D96937D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702710E3D6;
	Tue,  3 Sep 2024 06:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="P9FVDqG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F310E3D6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 06:16:19 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-82a238e0a9cso181558439f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 23:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725344178; x=1725948978; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPpt6ERaV9w0t5on/zQBb5NLjkmrrGxBn+wH2mAAexM=;
 b=P9FVDqG+/6iXEU+wO9jOnVm5K3pFgIeSDG88z4vBrXBC1Sw41HWmXYfT/izdn+VU4T
 yaxMDCVgwkbbmWRMMS4g+80XWeOx7VuK6MNVMLLjA6Bg9YX+L72uYqiIGoCO/RxyJo7T
 zEHsNNrE44yacGq5Pac4rZQB2vRhkDQQMagOOX0AbP/HMUprxIpSsOnMya2kIgu87fbe
 /kaNeOiSsWxp6OEZeRjPpMX4TsOWl2e9OIeqaA4DPiOCQsK6E7AeeleN1ZxgEWjU66Ct
 l9ydLCq43dk4IyL+DpcfZGJ0X+rhrbf/7sXgi1Kzr2xP0al5Giu4H9aKTr12AHKI0og1
 q8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725344178; x=1725948978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPpt6ERaV9w0t5on/zQBb5NLjkmrrGxBn+wH2mAAexM=;
 b=BrLEx+2HtZZMecZeFWiuS6gU0NRqg+Cc+9M3Gb2n+64SmVkF04y8mBrsTmOfzTtZap
 QWZTuxeLCC7tnk2Ryh8bem5vqDnE3E9u6EKy4Yx4URKdGmBAMBTN4vPHWVBPAz8au66D
 oSjO0Zu6BV/oUB+wtDcTpy13bu9R57MMjER+IXtf18osUGAh3+uEGb4XYpyPBb0VuQq5
 XMw5i6V+HgmqT095Y3Taad9BCNv5n/z2lKjbxhSvwUegGQyomLOAmvjdATZmAatz5z/W
 WDGBpq56jRdvtpZorRxVGNAwKakOss9kKBEMBAz1adpHOr3nCnsxaGDwg6zUoYpNLaSS
 R1ag==
X-Gm-Message-State: AOJu0YwMqv8M7rMPyctNoMVcx6X9oeqxt+q2f2Wx0bItG8JDcS2MkitX
 MQrxqTAQ+RJSMhcq6nQZ/pjlQdLU5vORM/YKiAiOyodimZLv/I4yxPQ7/iLlZdo=
X-Google-Smtp-Source: AGHT+IGI5yQXvnwD4tRUXqvvTUqVeA16Ja0c9xrooX0aIQV2flSQ+7+bD4+wQcSDniI3F3maZasMOA==
X-Received: by 2002:a05:6e02:1fed:b0:39e:78d9:ebfc with SMTP id
 e9e14a558f8ab-39f6a9f5455mr24768165ab.17.1725344178513; 
 Mon, 02 Sep 2024 23:16:18 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9be1efsm7151415a12.62.2024.09.02.23.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 23:16:18 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Tue,  3 Sep 2024 14:16:02 +0800
Message-Id: <20240903061603.3007289-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
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

Add an entry for the MT8186 based Ponyta Chromebook (custom lable).

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..410145976272 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,17 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom lable)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta-sku2147483647
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom lable)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

