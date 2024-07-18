Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D569351D7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DAA10EAB0;
	Thu, 18 Jul 2024 18:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bDubHJje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7659710EAB0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:44:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fbc09ef46aso10722035ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721328285; x=1721933085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C5Xir0kH2JjHhRYu7hQDjOGhA/R02SRiM/dfrZJX4tw=;
 b=bDubHJje16espINT4O2PRziulSxkTspQm/1pTAcyksmR+dH8qL8dBaRkvPmcS8GvHr
 A89o8YVfPg+Wp9pq3RwfVdY7YZzmuJidftJdIyMQ11JCrlXqsvj/xB49Wi2AZofrI/LG
 Xneajz+H8E6S3YLR9uNOjLWObcBA0RyB1XFc4i91hnCwyeO+6S75N1psE+EG2wtlc+U2
 rUWC98q5b72+n4u960V8v2e0ajWeN08brhZ+L5V46EsBAySTWyfdP9wzCRUuSTKiYwDV
 7T24gYxNZHo8EizCjUnwP3HbUIYBVJHO/pMYk/7v8cM2Y5BhMdFcIkQ7hC/r0rbcolb3
 Dptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721328285; x=1721933085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5Xir0kH2JjHhRYu7hQDjOGhA/R02SRiM/dfrZJX4tw=;
 b=Eln+Hua74i/4rCs6dbmmmA+g4xJz1vUzLo8UqIGUwp2KDXUxY8fXuWOe0u3AmN76id
 cJFuM2qtTjGwH1QBrOjJEPZK7Evh3eGZx5HQqJ1u0FLMgKpjzhNTUMFp20UGbfC0TV+w
 6QMQ9rFeDfd0MsWdalG+/UQqUogCpID6Q3DECody/DUmuyHNxTva+CwU2FWJuIHvGKzc
 jXixzPMnn8A6QriI4nAAl8R2dg22T8wNp7y+YxeUPObTzgv+nfwFzqN3+ZKv4YhK11F4
 OR1wg6aY/nqaufeqWOk9uuONwSAaGNgXPAPoxEsOQZuoj2Tdn/sGdxJIq0TK2u0UcEug
 OphQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvwjjEvXNy2okjKe003PSVcLWNVnSaYwjfZ+ODjzMcow3sM9erC8Tg/o6WEEG0HJ642enGtV6EOV0u/XsYzBx8ZXFHWCcgLkYE+4p+zsek
X-Gm-Message-State: AOJu0YykRF8L2IJf69YB1qeNa6ZAFP3PlLJvs8rKuZcSU3eqUN3nv5A2
 VamUaEfBVHsoCTljFi3djEPl6eAF8uY2mSTrgyGPQptI1b/CjKDC
X-Google-Smtp-Source: AGHT+IHGChTs8X3tqnORG7L3i64G79rLMi0c0cdzHOqrs0XdmhGbNEKKyA2Tqb9BQKUtqRCD17YRFg==
X-Received: by 2002:a05:6a21:9ccb:b0:1c0:d9c9:64f9 with SMTP id
 adf61e73a8af0-1c3fdd998e6mr7280403637.36.1721328284730; 
 Thu, 18 Jul 2024 11:44:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bba4506sm96459175ad.85.2024.07.18.11.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 11:44:44 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: display: panel: samsung,
 atna45dc02: Document ATNA45DC02
Date: Thu, 18 Jul 2024 11:44:32 -0700
Message-ID: <20240718184434.6307-1-robdclark@gmail.com>
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
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index d668e8d0d296..284a4ee79bbf 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -19,6 +19,8 @@ properties:
       - samsung,atna33xc20
       # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
       - samsung,atna45af01
+      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+      - samsung,atna45dc02
 
   enable-gpios: true
   port: true
-- 
2.45.2

