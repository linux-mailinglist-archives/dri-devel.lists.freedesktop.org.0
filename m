Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F120937CB8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 20:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3D110E055;
	Fri, 19 Jul 2024 18:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b329oRgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83710E055
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 18:52:59 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-781f5007950so1684000a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721415179; x=1722019979; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dj3Ki2W2OtNa0imFslO05z8HqONyNDJOqw2DrKzHWQg=;
 b=b329oRgoSL8YSPNwRoahU4avsoe3MLIzBc7Qn0AhaRM/U8qNiqjGiMGQVw2A0t7dO2
 6fM7zuvQll5UZvbhoeidyhGuHNk6WD42bUjJrJsvOmG1qYH2zgwiddNvLNZfP883armU
 aVwN6JyCtPAQaIT90/qu13tB7dZyt0Ox0J583d8VkXcZCYzwG+o19+BFYVDp5LgJH+fs
 vEpbZjUy36r1kzR+4S677O9Vd0mtZRucmGC2mV26LBXGihhSxfvZEyljXW1z+mhlSoL/
 AcsgcmLuwKV2nVS5Toan7XPPg4Pd2200cAKTQRPdbENKw3WvLQPse2dwBvdcSuiUqMyp
 +AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721415179; x=1722019979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dj3Ki2W2OtNa0imFslO05z8HqONyNDJOqw2DrKzHWQg=;
 b=Yy3O55xDMHizH5843kDIpNwajiPzE/y4d00YgxIoB2SBXA7PD2n0ItiALqRtvRBIEN
 yx6BFL0JMR8wHAt4mGhQRxG02JigMtc4vN2JVVq2p6nJL1o6pZkb1q82Cm5Uwzy5fWPD
 mEO/TerFuvSxX+GP0Z5ytih1AAbA0dgIeSy6B+l05cmOjgTyQDbihspT5D5y5+YCeXZs
 I2uh4LDphf8u5HwoDJrnbVR8tL6dnf1otd3b7fNwEx4KPUwiTqgRB4Z3SZfUP/IUjgnE
 uXLuTl/Zv2OwDUvoeE7h1911s5nwOcuRgrKRfJmRCo6uTH4PvjCGkr4tOv6lkg6ts4/V
 CkqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLE6XRItOzPDx9UQiUvUUzDWoIUS5BXKdJBCL6D83fiFzaMlkb2OTKvRVC9sVNHSTYTRImG8YKqJFyC+6t8fMDajaCzgtQH86l5MMyyJyM
X-Gm-Message-State: AOJu0YwvEHvmdSTb/2BLjFcklsFuK3m/9Cu7rUIU1lF4ubwxFnPZC8hC
 sYkxpa+rgiSpjNcoLUNwpFsUyZfGA37r7i941KlZzuyFjvWnCfjO
X-Google-Smtp-Source: AGHT+IG5pZnGFRXks8I592vO7nXbmZsKzukEcxgXihuHqf8RLj8pK+ihV/nLswlewmDJIZL/45jZLg==
X-Received: by 2002:a05:6a20:2452:b0:1c2:88eb:1d2c with SMTP id
 adf61e73a8af0-1c422999c0fmr1274962637.47.1721415179052; 
 Fri, 19 Jul 2024 11:52:59 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf7c77486sm2035424a91.34.2024.07.19.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 11:52:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: display: panel: samsung,
 atna45dc02: Document ATNA45DC02
Date: Fri, 19 Jul 2024 11:52:49 -0700
Message-ID: <20240719185250.4877-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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

From: Rob Clark <robdclark@chromium.org>

The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5192c93fbd67..3ec9b8c79b5f 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,10 @@ properties:
       - items:
           - const: samsung,atna45af01
           - const: samsung,atna33xc20
+      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+      - items:
+          - const: samsung,atna45dc02
+          - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true
-- 
2.45.2

