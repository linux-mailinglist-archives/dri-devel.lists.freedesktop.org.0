Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009F494BE4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0810E6D2;
	Thu, 20 Jan 2022 10:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B9410E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:40:49 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FA6240045
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642675248;
 bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=s/PgGjK3ol/A4IBD9t5Dv0pB+HSw3CAR/H5kjtPrcevp5+/84Zu1eZG531OT84Ncs
 89azC5R9A39QB+z0XITFAmdSxhvovWL5SMDO9xC+qavidlF6nGUI26JJAoj8EjHVsC
 CUNpa3XPk/y+JOazNbTDufFtvGBxjVMsFKTml/P7J9Gg24zDun7HXESKocRx61xl+u
 qUzgwr60i8IUQMkhvrtrlRXdHPj0TZIYst5S3hkjwQZxm+EBPb6FstEClJZA5y3Ax5
 gmoNbMdam2f1GYr7xdDgu0akn8MPDW4lVKDxPNu1ip2b6n26ux4jp7qJWDHa8keOAq
 UiisvsGoj4tzA==
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so5531271edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 02:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
 b=Qum2LU2A2ZbZfQjChf3/1fvaVJ0QtFY++78RJhxQ7+bwsri14bDIznMqi0iU23hcOb
 pCCYsZvPGSKX8pkUSThoVlFcJ8NFmf/ic8LKSP0pZA6WSqRWABvq2lBejvHfVScb7J1X
 DrqJ25beL/L1rXoo2L/SugE7D+f8p5M6Y4dXkHX+BRy/x5eHn88eeoOBFo1RB/BB2tGi
 OvPXW6W0YUacwW11isKmcXnHniOlHDmnuFQ4AnhGOOmAFupejpU/N5tqONGMvHwwf+/C
 Pn9uaum4re7MvL/9zfOfRZNKfV+bL9z+8khiiTGBq4BGArFTnVKBzGa787lEIwoBG3Y0
 45PA==
X-Gm-Message-State: AOAM531OHanaIYPjehGW2OPEx2YkOEzXv/Lax/RwDtz4RiJ0zv9fieOs
 P2YJ850m3sslIF9/2TPUgz/hiQP/exAAxN86ISwdz1480/AmChDSsTPujllgv0u4jN/c0eL+FP9
 /hXbVPmxn2WK9MpxHXJgwAPzvnbgwuylMDx5xqu1s7olb/Q==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr19187830edc.344.1642675247483; 
 Thu, 20 Jan 2022 02:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyPXalZaMMnb38YbeEj30Tzd3scTSAbXmxSV188lCn85OIudmZVuBpWbdWwOJQ8I+iGR8Lag==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr19187808edc.344.1642675247236; 
 Thu, 20 Jan 2022 02:40:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z8sm836027ejc.151.2022.01.20.02.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:40:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Simon Glass <sjg@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: google,
 cros-ec: drop Enric Balletbo i Serra from maintainers
Date: Thu, 20 Jan 2022 11:40:09 +0100
Message-Id: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enric Balletbo i Serra emails bounce:

  <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table

so drop him from the maintainers, similarly to commit 3119c28634dd
("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
 .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
 .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
 Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
index 20e1ccfc8630..2d82b44268db 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS EC USB Type-C cable and accessories detection
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
index b386e4128a79..6e1c70e9275e 100644
--- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
+++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
@@ -10,7 +10,6 @@ title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
 maintainers:
   - Doug Anderson <dianders@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On some ChromeOS board designs we've got a connection to the EC
diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
index 099b4be927d4..00e3b59641d2 100644
--- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC MKBP Proximity Sensor
 maintainers:
   - Stephen Boyd <swboyd@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC sometimes has the ability to detect user proximity.
diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 5377b232fa10..e8f137abb03c 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC Keyboard
 maintainers:
   - Simon Glass <sjg@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC Keyboard is a simple matrix keyboard
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index e9c46430fd8a..66a995bbbbe9 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS Embedded Controller
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
   - Guenter Roeck <groeck@chromium.org>
 
 description:
-- 
2.32.0

