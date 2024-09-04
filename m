Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118B96B408
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DFA10E6B5;
	Wed,  4 Sep 2024 08:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wYqWo+JJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA3010E6C0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:15:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2055a3f80a4so23798725ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725437717; x=1726042517; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRdc5AMdvByd9qcj2i6Loyq3HdJpcgiM3X+j1Pvdni0=;
 b=wYqWo+JJYnZCOJD0/Y7zDpbgeNb5MZ2VEHEt+7NRfRvIqMP5E/WW0XXQmAUQA+w+4w
 Qfkf3HqPUu5eaKw3RExrSR2PRV90V3gatwIvLWFc+Ngzu6z39n2eGX3tAHs9f3B279zi
 g99m6lFWrzA56DYsu3eIWtr44jbVZtmEebEMSRGczu+O5mxxnvWNotRgmYkigF//37It
 /YFzc028wW+NTToAA9Q1SRO0HsjwVcYxzYKeh4pPEtskLUf8fheOUTa+G54LCyAgG/NK
 n8UiN7qSY3aspU7ffCXtQEQospiZHBuoIn1j7cY/8m4MfB9t/1ryBl+Lksiwfx2vLpa7
 o5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725437717; x=1726042517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRdc5AMdvByd9qcj2i6Loyq3HdJpcgiM3X+j1Pvdni0=;
 b=W9qZ+tX2gX3HMrpqZHHXf6Zqdg8MLZFiAhRJ62QVe1ba3aHCx8HOOHsNPgzV3HC5FB
 4qnXSxc6xcIZj9ZiIs+UASX0ZlqbBiy2tEoeFQqzvmTq/FFzGumgwKFjMeELNcf501sg
 kOrJXdIqPyOLoMKfeuaoUCDVCHXNr+MpjFWCDF1nj00lqCRqmRSIeWXt//HeWPrCgR6f
 laeXqB7Ov8685yxylNCYBvkwNMInFKPdUGVjFMfqDrsC6N0asahUEkLDCMsn4lYOgmXI
 oDcht/WrS7JT37+circtb9E7VoziUdzRXaBDkDNKkRierEDr5E7UWGaD8GKtCqfD+9SL
 4YyQ==
X-Gm-Message-State: AOJu0YzWIGXz8Q3LadfisMLazwgPJLZpaGr6M49jUB0ew0MqVCIAC8y9
 BlGZsOfFdCV6XWXJEvGp7S4+5XFC8p+4tr9rO7RHwS5B2Lk73mGtXHnXBsKBGeI=
X-Google-Smtp-Source: AGHT+IGK31//3XeAKFe13krwGEqRfNEJwm77L/z7hDQXuWi5CgOKPXqq/SoD9LyOe4vl6AmOSRsoGQ==
X-Received: by 2002:a17:902:db08:b0:205:8b9e:964b with SMTP id
 d9443c01a7336-2058b9e9afamr104785765ad.39.1725437717314; 
 Wed, 04 Sep 2024 01:15:17 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae94980esm9024145ad.84.2024.09.04.01.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 01:15:17 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Wed,  4 Sep 2024 16:15:00 +0800
Message-Id: <20240904081501.2060933-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
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
Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

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

