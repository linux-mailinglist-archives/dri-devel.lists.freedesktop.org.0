Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F32A74674
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3010E9B3;
	Fri, 28 Mar 2025 09:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="FI8znxur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD3810E9B6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:40:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-226185948ffso40899865ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1743154853; x=1743759653; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
 b=FI8znxurYnM9sH3xxV6+7mhDVp2Z4R6LlT4bojKWjSyu61w00a5keAaFMEwInQlrTn
 V5HFWLslRz9OfGRB1PHXRYeQ3mkUa+wKxDYqGmxFaY5JQhwRxO1a2XT+66NIBy40c3jQ
 91P4pg+eJbFVh3kXNfegHAURVK8VIKkxpa/wr4JiIrvwlRa5EhJhfFN3agrHzWXniXlQ
 C4ZW4r4w1j1S6ibpkTT3vxW+jmX37lCNkYkN18iPWokplS+CnYf5KwMvfP4de35Hsc26
 xKBtGWye4IFmf7ZOCXoQMXCcJwJcA3ceiyNi/AeAGH3UGhfG2RfZe/ddfxnA6Qach9jm
 QITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743154853; x=1743759653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
 b=bvCkcqQTw+TDe+d0v1tw+ZkKjz5TBBTzILU4Lae/yf/6obJOvVWQ+WANwm0W6xGaFU
 tqNNO64wZevTlgytqfB8nJA1re1GXkxtrvyjWGA+5NZDRxlzDMsGLiHVLYf95hEJEbD+
 4wr8gfoVcmXmx4LTbcGnn1nU0l2zNPiSgbrXQLGJVHg3pyVKampFh/GIQnXzshFqmxMp
 c801rw5GZP5utwxoiHbtn/F/73RJDtMYFVWYlXM9GGpUq3PLH6+yLjVgLma7QgZJqaV7
 WaedI+oZHgbvsevVB9RMdMZWSPmU+Z5F+0uFtQMw1/uoSZ3J87uoutbaNTBfPEosxTxX
 ux7w==
X-Gm-Message-State: AOJu0YxlMsYwOcba6prFzrE+JHwOQx3RoM3NGmP1tLWmZj9q0wKUC22S
 lKRlhwGlRapEcUyrj4F9O/v502R5nOmESFlFKtOIMzQgeL1gKr+6SyY3W2YoR/w=
X-Gm-Gg: ASbGncsRZSes8Mlv8GdshjBKhnB5jQ2sRB+TPRpjt98ruzuP92VGUq/XOa9mEH2ouNK
 +kiKfP4piaBnZfvHRfX/XR3i4So4xApEq7JnKGj7sbp4OosHRv90c+953BJ67nVRdGAkv1I3KAv
 Z2j67VqaEwxG86wTgzGE4uz5fgfmYY8DyYhYp+bSRacCtqO8UNvO+MfTwnVdfHOLRH9uyTnu8fX
 lktZ4YEqKAFdsVQSlzG7CPTjjkebUPjCwOvspgBIjCRSzqnMvhYNHCqDMvOpS47SyBbsBzmm2/F
 PkpHZuKW/uAvJye/VjzUYAqinGxjkoD2mOCFElCDeD5O/MuHZ2dvORqKZ0acqFgMWygsrSS606d
 MB6sKgVh5czST9A==
X-Google-Smtp-Source: AGHT+IGp2o3LkuIAgi71QZgUHz6T+RQ1Ol3kgJLLZiH+h6Iuyl7UW85ocR8eAQzVe59u+58NXlwvcQ==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id
 d9443c01a7336-22804968a3cmr108743245ad.48.1743154853027; 
 Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 02:40:52 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Fri, 28 Mar 2025 17:40:33 +0800
Message-Id: <20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
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
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..fdc57c140af7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,16 @@ properties:
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

