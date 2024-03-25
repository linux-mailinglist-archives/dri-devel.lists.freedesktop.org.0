Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E8688A2F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E7710E46F;
	Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Din6kfJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319A10E160
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:08 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5a46abf093cso2767758eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374608; x=1711979408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbJkqNdY66C3ZGpPlypuMpUlQgBvGG9nwBs5AHhdlTI=;
 b=Din6kfJgzlNxTrUg/qT69UNCOp5W/Ox/BOtgslNWhXR2+kXh8djWsMmzUTnBAXuO67
 v8jLIC8u++kx20knNYO1uRlvS+J9t3OtealFzaLUyqzGABCZziolzkJKORRDSujdH/kv
 0nsS5IfHuPOWKdAv+NELJnuhbYRRsCT8mN8IClmKnGuuI9J78rxMh0U7HppuScmFa/k9
 O6y0xZubRUcnDBHd7b6/2KhLSUg+3y3paUl5NK4tiE5npiscgNbFFUz8rGT1TYWt1m+g
 m8yuDV6AH7v685zccJGhJC3vTBgYTjEUPaCoykVrSkneNlHzXQolnPVLw0G86Ios18tq
 Hdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374608; x=1711979408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbJkqNdY66C3ZGpPlypuMpUlQgBvGG9nwBs5AHhdlTI=;
 b=MjQEo3ZnTTEYtFVcvhl5aqLX3fwux6JTtO6p/Urc0HWRbd39oUwSvn4auCCIf81v7s
 YiusW/q05I7PM08tXxJiBhoFB6DbAqKAUg6WIL+gSzEYntnw0uooqZBDyqvnR60EBdiD
 oTSs4OX5uBenbOCrtT8pW9sBcaG1mLWfxcWwatQBnjIh14v4+UgT/ZrPv5Q2lmi8D6a4
 A6zqF0RprEEPS0u+7P8aZa99MEHA9CORZHZgyVrgwl0KU1k+sl/CXvbmYBrqI6/xllaw
 pTtreZdK2zCJpPLgET/vom8wY0LHhdDLziA4fJ8jrKSXWVYPsnS35dvMHeBxLtkVXG+A
 hIVA==
X-Gm-Message-State: AOJu0Yxw0bLDk1NGWT3IjJdEEpgwKg9tZRXsLLeqJDLqTGV1c+w2rQ5N
 Y6lMO6HtSGcWelJCpaRMTqfOk3PbM7LypN5s+EmpBkeScghyTWnJ
X-Google-Smtp-Source: AGHT+IFn8uSOzi00+o3avwWfZrNmEtyROyQtLHm+wDAbt7YI8gO+mya+YXn8B4WCU3TqBLHIJUo6xg==
X-Received: by 2002:a05:6870:3041:b0:221:bf34:b15f with SMTP id
 u1-20020a056870304100b00221bf34b15fmr8485533oau.25.1711374607986; 
 Mon, 25 Mar 2024 06:50:07 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/5] dt-bindings: vendor-prefix: Add prefix for GameForce
Date: Mon, 25 Mar 2024 08:49:55 -0500
Message-Id: <20240325134959.11807-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

GameForce is a company that produces handheld game consoles.

https://gameforce.fun/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b97d298b3eb6..3def72060414 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -529,6 +529,8 @@ patternProperties:
     description: FX Technology Ltd.
   "^galaxycore,.*":
     description: GalaxyCore Inc.
+  "^gameforce,.*":
+    description: GameForce
   "^gardena,.*":
     description: GARDENA GmbH
   "^gateway,.*":
-- 
2.34.1

