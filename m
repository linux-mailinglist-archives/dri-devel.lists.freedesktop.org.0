Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF6F94C4C5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65A10E7DB;
	Thu,  8 Aug 2024 18:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Gcgwq5Ym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EB910E7DB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:44:47 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-710d1de6e79so442329b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723142687; x=1723747487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+FZjS9lLhm8Ss5ACYK4UD0eLeWkBZ4V5hozi46AMmMQ=;
 b=Gcgwq5Ym4K0fbvGfeBGGoF7KAiygiEIo0ZbUZcyRz2iVihHZl3VD4XRYMFpaSkG0rJ
 MmOMeHy47R8g2fzEPZPxQsdvctFcQN/QaODcqgS14QN6r35+3lHslNj1KKnIzbTVbDSa
 D0c+vcdRkOayPF1MhCYF90Rt28vvYl/Izp4vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723142687; x=1723747487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+FZjS9lLhm8Ss5ACYK4UD0eLeWkBZ4V5hozi46AMmMQ=;
 b=pvln28tI6hQpEPlsMWkZbDz01aaMu4GPAH/O7hsNHhCHU1BjwZTtf0m4APmMxr2/8M
 TP7RKq1o89axjEkft6ToOKFVVc3+miLfoiBVSpixi5ej6hRHuuSageqqKjtQE95tWFIp
 7b93+Es4X0jGI77vAxTz1XaKIQkewcN1652OVWTGSm9s1HOKkmKvoD+/AicNGcr+oFCl
 zYaocToXsWWWbkdNJ47hiZ8JsHngYFVVw9widKpmx+VIYCnYJi6WEXbXLF4jMQjcXdEo
 N3zg3wW+8tUuQo7Oz+TRzjoT9kMHpxshEv3dgkWt2ROpSqFdrINx7b2gbo6WzRpTIzxf
 tlgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9EoV+esoMp8xg08tBJUXkTfLkZj+yOZF3q7/nII6RQlz+BPvB5FSbVwJR0zBaCtC9PGXOwRjcTxYy86yKDL5K3Fpx0vFmr9Ci+uzmyuBU
X-Gm-Message-State: AOJu0YyzgYkbi5A6tMyqsvQ0ZMw87y5kTzkk435105tT+6DWqwcQSqoS
 DyBW+BSUXzNb888dmpkXW26Uw9D6rYWjmW+z0gCHXa57VLQjzm7BVcFVEiHccQ==
X-Google-Smtp-Source: AGHT+IHmMuhdk1NaYfmjsh5fG9/wnslwqUeMbA6OPtLJlYkM8QY7GVj2DKaKMTuWDb1cv34MVl+iAA==
X-Received: by 2002:a05:6a20:3509:b0:1c8:92ed:7c5e with SMTP id
 adf61e73a8af0-1c892ed7db8mr748828637.23.1723142686764; 
 Thu, 08 Aug 2024 11:44:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:66d6:d51f:d7f1:36c4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2d50cesm1416640b3a.109.2024.08.08.11.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 11:44:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel: samsung,
 atna45dc02: Fix indentation
Date: Thu,  8 Aug 2024 11:44:07 -0700
Message-ID: <20240808114407.1.I099e8e9e36407a0785d846b953031d40ea71e559@changeid>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
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

The yaml had indentation errors:
  ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:21:9:
  [warning] wrong indentation: expected 10 but found 8 (indentation)
  ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:23:11:
  [warning] wrong indentation: expected 12 but found 10 (indentation)

Fix them.

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/r/CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com
Fixes: 1c4a057d01f4 ("dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/display/panel/samsung,atna33xc20.yaml   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 87c601bcf20a..032f783eefc4 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -18,12 +18,12 @@ properties:
       # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
       - const: samsung,atna33xc20
       - items:
-        - enum:
-          # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
-          - samsung,atna45af01
-          # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
-          - samsung,atna45dc02
-        - const: samsung,atna33xc20
+          - enum:
+              # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna45af01
+              # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+              - samsung,atna45dc02
+          - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true
-- 
2.46.0.76.ge559c4bf1a-goog

