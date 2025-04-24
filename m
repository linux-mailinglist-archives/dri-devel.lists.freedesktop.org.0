Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D150AA99DC2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 03:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F510E2F6;
	Thu, 24 Apr 2025 01:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="fepTkmn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE9F10E42C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:09:01 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-739525d4e12so365992b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745456941; x=1746061741; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
 b=fepTkmn2ABagqI0kbFmysuS4bB4q5IiZfySiEXkW9zqf4JRg1sX0SUqafhrHMdb8Wv
 tPAXsbzo8ytsug7gbeswzDRwKvvzsC4DSZw/l2OybSQgLNbpVoCsTck/hTe4DYqgI5yA
 e+czg0AZi/AI7Lx2VaH7PaEIv+sgkQ+YCq7ozqFFKYnpGySB0Qto8hkDyoZdEi7/3Uel
 opRyBf5rejdaortBBJKVzZnJdXmiY1abQXgrGGA8Vg56ayBGXjLAI8PVeZzn0WSepocb
 N/YkZISd6lqYXfmLxBJp/hnK6BlLKKjP1bPY9Dg4nJpbW7XFfo/CkpS2p3e3HwIvzJMI
 DZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745456941; x=1746061741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
 b=eKJbpBKg5oMq2wC7xFPR2C0/iX2RP5xqwMBgStXgoglaip2bpWH9UbRUe1b2pa2lph
 eLURUO4b8Qz7HVfom1CFI2jozNFXuAI3Uj99AcTE3sdoT26G1T3cjHAQnGspLlGpvJUR
 IpkeajaGrqpmMrCEmmIFlK3EbU16hXsQRzAWMa4eDXWY/if2nzQZdO0OpbRTOG9O7TnX
 yWQz5NoCRnFHll/0mBIKOVSo/qPDoj7Yu+UOqKe6kdcz7oeb1c6crGKSOjxNewSOia4g
 oov7D6J6i+nt22aXVUpMhLTIjOB4slHeYUCJYyFo1mhraWmGrPq27YXRMz2RIGOrfGTt
 q+Hg==
X-Gm-Message-State: AOJu0Yxts5pqvQWJQOPVe0dKmxrC5dh5NPnfoHlMbXIPcapFltamePxc
 lRY6zqrsjfzCnqQfAvBIb+qPZ9qPGhSRfGL7WWXRpSM9TgJbCzMKisk0UUJmNtQ=
X-Gm-Gg: ASbGncvLbnC9UaKrCsDsNDibvjU76+Guf9Yj1eUuLDl726bcqjkHc67F/xighutBYOT
 bEicqK73NWojpJ9MSIVtj6S1YOth+L6Tb8IhEv/nGjPbL95Y/tRht/V6yD7FJy3coWwl4LM6Tgl
 pCq+OelX8EmCKWgkf2excd78WEXYYuXULfukaYopn6+htSIRIXM7vAc4QOv9UhRILhWMkN1ZGcn
 1i1XF8RsF1HEGJakCBrRikuVMS+zDeQT6tfFvyOn+cUOXQYXqsYgMqYXfHZFACkO2NIymyGs6Rd
 yhBPSDMBN3LzsI/nArXrnReJe9IsNLFYE2In/+kUQ9Jx9lmg0+SrbMQpqAq3REH7ids58p6gNHw
 =
X-Google-Smtp-Source: AGHT+IEtg9+UM1qgOmmMcagcoC25vt6k7kN9IVgAb2Yi1Mg8BWfSCaJvnh25Radzm1TcN726SEaGnQ==
X-Received: by 2002:a05:6a00:1947:b0:736:3c6a:be02 with SMTP id
 d2e1a72fcca58-73e2462f2b1mr1025718b3a.11.1745456940726; 
 Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Thu, 24 Apr 2025 09:08:49 +0800
Message-Id: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
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
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Chage in V9:
- No change.

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
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..fa1646bc0bac 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,13 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - enum:
+              - google,ponyta-sku0
+              - google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

