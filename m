Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621E914FBF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081D10E460;
	Mon, 24 Jun 2024 14:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="rsfljHDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9045B10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:20:47 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so34182685ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719238847; x=1719843647; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M3QDpDGSiXVB6sCJx/S75ptPOlykstEPjTXSR09Xt04=;
 b=rsfljHDYMx6k9eZGrCtcJvgE7KPmOEsNxNzkSykknE8k4KzN0TdsLC0zBGRoh4xDDF
 dgHiMoDGE6fOXfR3aMNcTOV11D6YAGKfzhpGjZnvrjk4ZnAl/RZp+3NfoEgLL8VF9Bc2
 MiJv4+jKQb+o8iWcbZVFdZOfK+idiuBK6Spi8afRqMdOh2CVYhjl+GXp2/AglREuxIbs
 Nn2512EYL6P6q4HygtXgK9DdgA1IyzprMv9X4yReqOyWF0QmcneOzRkPJIfFMfcuezMe
 EoEyKfadjH63uw8Wzgswk0athBJ9D35TPhQwJmahgFSk0FowfqzVCfd7W3Gx2SkIyIPN
 KDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719238847; x=1719843647;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3QDpDGSiXVB6sCJx/S75ptPOlykstEPjTXSR09Xt04=;
 b=i25v57M9aF3UpFDG2M+LHupjuFrU/DMvPBhALFvLUKCIYHjj7oiRC+TAy7uqpqobY+
 ZKkw8uK5fqInOpRA0U9LMpG6SVPdN/z8XWMKnkHM5aWhMXYJUqnfcL2U67TafEaBnRDQ
 a8s6Lt00yfuUMiJqim8IiCtBMMugHDvMgsPh13oqUD5XE24u3hPqKrt/37TcSzgQlpqG
 nxDY6YVVhohE12By+DYUiNvh/fxMbhVlcfRwoefyC/Ct4asnlAueAfGZKeaPi6T/vYLm
 WkJ0in113zMrKdzcHfp0iYUUz7abmPjTUpCLaBjtMVZLX1XOOWpLorDWgoUs3sk3ljhb
 VDbQ==
X-Gm-Message-State: AOJu0YwZIlM2ykywgNDyUUKkraEOMWf9UYM+LyfG3uBIZ6jbK8KjHpGe
 1D1VJdFJYgEF8+6a56cBBN8Trqxp4zOqevHp+wNlLIffTF2ukY44WudWVwa5PtY=
X-Google-Smtp-Source: AGHT+IHz4Xp/LpklfhUfQXhOMNMuea5mCAmDWme6R/bx8xDnAu6GJ4Ix+irnGQPPp/6YUn4bmuc0BQ==
X-Received: by 2002:a17:902:c086:b0:1f8:393e:8b88 with SMTP id
 d9443c01a7336-1fa1d6acb3fmr49875875ad.67.1719238846980; 
 Mon, 24 Jun 2024 07:20:46 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d5fa9sm63243855ad.206.2024.06.24.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:20:46 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 2/5] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Date: Mon, 24 Jun 2024 22:19:23 +0800
Message-Id: <20240624141926.5250-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes between V5 and V4:
- 1. No changes.
V4:https://lore.kernel.org/all/20240620080509.18504-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- 1. Move positions to keep the list sorted.

V3:https://lore.kernel.org/all/20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com/

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

