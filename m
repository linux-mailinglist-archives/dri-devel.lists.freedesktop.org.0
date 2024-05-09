Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95588C0BA2
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7910E212;
	Thu,  9 May 2024 06:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vg7xp+yM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363710E212
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:43:46 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f447260f9dso519748b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715237026; x=1715841826; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZP8vuwqcYibUQ8arS+ZFPZGUpG90sM0PAkwSsCd8m8=;
 b=vg7xp+yMljmw0OAy/xvsk9VOrwLyo/TyJ5Nf1jmMVvAP5QBwb5CeAelzvJt/Wgjwdd
 qc1y70+IQFJa/kWDsE8uOra4M0yjWLKjazGIPqI8z32AndYYjSLvPfaEHJ/dlWXv03lu
 wP2Wuad8fVDb81ooASWs58KABp8BvtOJdBdzZDZHSEIUjszInxfU5lFAPmKOFUfuF/uG
 sCrli2SXKup7uM76PqI5pdTgwEq5Ok3RYHpR4y0LvdGaAP+O1jlDMyRLGqg7+Pdc61HP
 D5F03ff+LuqtZa/aOkmIjE6gxCc1Ak0b1vcX2jwrV25kZn3wcSDwBhg1wSRVlru59bWi
 tZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715237026; x=1715841826;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZP8vuwqcYibUQ8arS+ZFPZGUpG90sM0PAkwSsCd8m8=;
 b=WyKJwnj7Wor/JYNIK4TfGjMkxYT8Rv/ELWrXvsG987V8P8ZDxrO109dV1ot+ngQnRm
 369BG5hyaH9v5cCacg+Ivb91w8+ayLOm3BBZtkt2SKD03092Oh0FtyYOy4XjM1lM/9oj
 hujFy6hX9qvpK/WN9Dwas5vsMv3sl4Z49DeIiRP0Pe4ChyyCCL9fg/vJRC2I6lcCaXnb
 vjUR2ZTc/McZFgwSHk6I/HAOeHCr+FSx0URklcvCqdF2gBgWozsgVlzl5AKFo1T/2qjd
 VW5QqFWePjtfIjhVYJQQFCdSJkR/FNQ9txDnI5YjgSZtTtckR05gTqcK8RC1CkOCIDBo
 BhNg==
X-Gm-Message-State: AOJu0Yygn9VLx7jlJ/orMbExtBtH2uiXwZP8TWlfeLQM07kP4H+PaUmB
 7UbVjKEOf5Pp42i7nt9tm724OOyC3ctfR5hS962GtL9IGqahdh0eGI/1+xZUIiI=
X-Google-Smtp-Source: AGHT+IH2e92mWa+Ee26OZVg7GLAYUFnsK02ab7TTviHRZ+fbVid3mBljDBESNTHh0xXoRwh9tqj7Cw==
X-Received: by 2002:a05:6a00:9295:b0:6ec:fe38:d94 with SMTP id
 d2e1a72fcca58-6f49c2a6840mr6617887b3a.33.1715237026094; 
 Wed, 08 May 2024 23:43:46 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-634103f7237sm597394a12.71.2024.05.08.23.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 23:43:45 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek ili2900
Date: Thu,  9 May 2024 14:43:35 +0800
Message-Id: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>

The ili2900 touch screen chip same as ilitek ili9882t controller
has a reset gpio.

Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
index c5d9e0e919f9..5063ea2c8375 100644
--- a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
+++ b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     const: ilitek,ili9882t
+    const: ilitek,ili2900
 
   reg:
     const: 0x41
-- 
2.17.1

