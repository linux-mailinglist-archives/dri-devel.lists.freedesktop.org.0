Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD9090FE3A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952010E84C;
	Thu, 20 Jun 2024 08:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="nEGOZi78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132B010E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:05:36 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-70635466708so587117b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718870736; x=1719475536; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/Y8D7obmprqKPMpE+xyGcQQXo6scFeZnMh+CrPUj1ro=;
 b=nEGOZi7864jXhW/D0WGTvWXymGXSgEWs05h9FJlIjzHFxF4jSituiVtXQYGDonwxBp
 vljAdwqZSWOidrGleNKrvtMmqkfORrAJTe+cDtjEEylp9yJiINr4nCLYtzCo0VSEAj00
 nLef87/71W9pw6YR51nGGvMRmDnIad5/SgbHNNKxZrhOH/Pkjlj4UOeYzPEJlropqrv8
 QGcC8p+oSniS6DSm2JVpZD2rPOGuu80+A5fC5BnCRL1MTtev7r+fapfVBlRXN/NqGqni
 IPHBq4Kl45VZGpexmjDkFWWlwFb54SL7RcXFv6C89fYbdinuMZeVGzI+RaCMLdKV8arB
 y+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718870736; x=1719475536;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Y8D7obmprqKPMpE+xyGcQQXo6scFeZnMh+CrPUj1ro=;
 b=i2R0skQ0ooBYeo+yGvz9XN2hI58KbY/nbqMrbhrUbkzsIZjIAhxXmlUA9uR2mg3kWr
 gY0wBfU/1q492sQuJq8KTYFrmQ9RxJnqHJzLecoDu2m85/Q5lY1uDRFny71nEXSVTPhr
 /eRyX1u1NvJIr6tc6HQOf/GYRPlcEbM9hBxW0s2VgFc6h92bxzeoPFbROioBqgVx8XJ+
 dzwki+6miAEYkPk1L/UfS/gpZrpz+QYayvOO9UlTxtgwZppP3kEUybb6bZ9UQ0aRNXuF
 WiqJtUfsqP51OchEAoIxruOVkEmFEclmmAHxo0J5ogWbm0lFrQIG3nMZ5hRJC3H5tUo6
 a7aA==
X-Gm-Message-State: AOJu0Yz30TBf+9bCNJw96EImQZjC4PAjajP7cF62WmoIOuwjWTQyJ3N0
 pIWazzLlrWAoJFnI6N5+lq5dKcQG63x7CxbHBguxCQUMwJurRyOm5AuSoSn6YEU=
X-Google-Smtp-Source: AGHT+IEWX7tMPhLCy+EIc3J3GNxEI9rtrbsuhv+fhFcIU85LqU78MlejcJmdCThiVyNmkHK565rXEg==
X-Received: by 2002:aa7:9e8f:0:b0:706:3405:fef7 with SMTP id
 d2e1a72fcca58-7063406032fmr4114904b3a.24.1718870736448; 
 Thu, 20 Jun 2024 01:05:36 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96c8c5sm11805889b3a.58.2024.06.20.01.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:05:36 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 2/4] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Date: Thu, 20 Jun 2024 16:05:07 +0800
Message-Id: <20240620080509.18504-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The kingdisplay-kd101ne3 is a 10.1" WXGA TFT-LCD panel with
jadard-jd9365da controller. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---

Changes between V4 and V3:
- 1. Move positions to keep the list sorted.

V2:https://lore.kernel.org/all/20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- 1. Abandon the V2 patch and add kingdisplay kd101ne3-40ti binding to 
-    jadard,jd9365da-h3.yaml again.

V2:https://lore.kernel.org/all/20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  Drop some properties that have already been defined in panel-common.
-  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it

V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/

---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 41eb7fbf7715..2b977292dc48 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - chongzhou,cz101b4001
+          - kingdisplay,kd101ne3-40ti
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
-- 
2.17.1

