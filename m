Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C54910370
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C699010E954;
	Thu, 20 Jun 2024 11:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZiuzNq1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1610E207
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:53:02 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2c7b14bb4a5so614727a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718884382; x=1719489182; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TZOfcyLKgj+yv+ED942rapRmAvPkDAxODQtfckKPepA=;
 b=ZiuzNq1GdjmS74eVAUZ30u/RvcxOCuzzNtFxq7epP5tbFh/6GRxFBuwthZQ02BjwwB
 8tRpfYhY4fxJaJ7fSKW1tH9yfG2f7iAfTd6OUlbkf8GXN4OuLVQwA6LXkeRC0ZPiiTuk
 7+AG3UYWW9+veUZ/nLn2rR3LASIdP3If9ROmSOEkljsWuKaJuHtYiW0gr++fdAUMCgna
 sG6+we90liN6qHDrfpnqVN1GT7T3RLowZFv1qLucc/9IUu9z1iBR1LCfzdLiQcwSAO7C
 f8VHWKrsHG4A77143ddSNz/WkBReIRdHwkliSBqOsqoltxcCUwiwBnIHVGkEHo7BETxk
 5jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718884382; x=1719489182;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZOfcyLKgj+yv+ED942rapRmAvPkDAxODQtfckKPepA=;
 b=ePVebZYjzc9dLkh2qbytPhv+9lWvMi6id27ARgxFuqoBmI/29Sk13jFUIHR4KYNK0S
 aB6Lsb9bAKehbVV3YEwRRHmR5fM4/XfLw+TOzp1FD/28si12HoCrqYOSTcEYNMvn5Ueq
 oUguEiQHzFrqAu11wNqqRcXzGud0/mg22z1WAzsysXbHCXMwZVx3l7yvNJgillLZSA8a
 40Z3SO3QJrtPUtWZ5CWHGzFe8gaaYgrJxx4e8Eh3cJsxN/TDlrTyCieO7KjLxcjNSKXp
 o8wjO7r4VWiMQbxtnBVGT7O1fEFBg/KIITj1s1t9dDKZIgXCqhkdTO66wMBMluBs31Jw
 09mA==
X-Gm-Message-State: AOJu0Yx0ffpPjuTBAGnW329jPl1U9VwmfVCy2n8VqSY3KTwA5t1KEwmc
 1kTO/sW0OehHGg1ewK2WBPN/QSikOLrmyt4DYuOdvtHZW/0/Uag5raZt8h7jt94=
X-Google-Smtp-Source: AGHT+IGMNnTgKPsfl8aIi5r8uzi6bXKkR5QprrMn7nZuUrBC67TYRolWeSqdoOUgVCP9/FJ/JCF9Jg==
X-Received: by 2002:a17:90a:69a4:b0:2c7:45a:d237 with SMTP id
 98e67ed59e1d1-2c7b3b0eab9mr7321636a91.12.1718884382279; 
 Thu, 20 Jun 2024 04:53:02 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c7e64a1da9sm1486316a91.53.2024.06.20.04.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:53:01 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel-simple-dsi: add
 Starry-er88577 DSI panel bindings
Date: Thu, 20 Jun 2024 19:52:44 +0800
Message-Id: <20240620115245.31540-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This add the bindings for the 1280x800 TFT LCD Starry-er88577 DSI panel
to panel-simple-dsi.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V4 and V3:
-  1. Move positions to keep the list sorted.

v3: https://lore.kernel.org/all/20240614145609.25432-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. Separate the Starry bindings from kingdisplay, and add it to panel-simple-dsi.yaml

v2: https://lore.kernel.org/all/20240601084528.22502-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindings.

---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index db5acd2807ed..f67059d44bde 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -58,6 +58,8 @@ properties:
       - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
       - samsung,sofef00
+        # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
+      - starry,er88577
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
 
-- 
2.17.1

