Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DC938A0F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC3A10E3A4;
	Mon, 22 Jul 2024 07:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="dPfHoeDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25FE10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:31:58 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-70d25b5b6b0so386898b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721633518; x=1722238318; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xrIqnBMgcc4mGKUscqbrmcY1TR9qTmMNkJAbmzQyPX8=;
 b=dPfHoeDPEbUW+qQNVO0t7kqBV5kFjqeaQ6le0G8kc/OSRJBodDFNoSQmvY2tiwgJ+1
 Ub+PI3KyVAGU1r6eZoaqfWxm/IaAsvuFcSunl3pBIPcY8bG/g3ggAgcS+v8QkvEieKPV
 Di2J0Z8voZcqw9WSQ58+JGnUa0RcZQWbwFFd4Gn3jPE/ZJt7Q5xEwj8MCpQ7HN8Tf14z
 NRDL0ALOo/kItG0Om+QOEcLjNtF/bhSdH2cJDtwQ9xfw9CYFyr/doha5Px6UCkOz/SJ1
 rk6uYH6KvvNWLNr4DPl0A6IgtcH1LQApxZNWMB4fRSUkpy7ezGZsBV0vqbalJM352MH+
 jK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721633518; x=1722238318;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrIqnBMgcc4mGKUscqbrmcY1TR9qTmMNkJAbmzQyPX8=;
 b=KL71llMvGXltyRSAsYTjfTXpRUxAltwGnGdOJcrC0GAnyJxOcPt6T5/P2HqIN05Drw
 ypLFjgvHpCZbsBoRfgmJS0jYphSHZVikDd9dPyN8ZCBVthPxzWfSwZ5cL75bjI0qsN9y
 Mj0tz+tgdwMja02BZfDVXkdbFIM1W4b/1Zu0NGzkziAuHP2hKRF5zRJrOC6iqlZtUi73
 3ivPOVy5lvlECTd3AbMP7joOfvieLSJWa8RfKej9SlpIilZYQ5+pQgBGKTZGLh7ekiDG
 5q5y9xtCd0T39jLuLx03ltuP1YDkCrLDhwwAxL3X/4MGQ7O0zHw5APbux+2b1/Tp9lOl
 CQ3w==
X-Gm-Message-State: AOJu0YyX6dHANHYziG0ixOo+3yHCudcHRI6MLSJXVs9Rj8ivq1+l23Uh
 R8qcjxKPFmSqRW1624EUgwb4ViTyZpWrqlOZElAVci51qPHWATe0hJS/pVYbIt8=
X-Google-Smtp-Source: AGHT+IGHzuEbmhlre23pfm+UORHBTK0Szzk/9tinz/m/bcaMfKygO0+QpUCmfNaQz1HzDVAUKcSFzg==
X-Received: by 2002:a05:6a00:2e86:b0:70d:2497:383 with SMTP id
 d2e1a72fcca58-70d24970528mr1843574b3a.18.1721633518289; 
 Mon, 22 Jul 2024 00:31:58 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-79f0e6c9461sm4081162a12.61.2024.07.22.00.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 00:31:57 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Date: Mon, 22 Jul 2024 15:31:35 +0800
Message-Id: <20240722073136.8123-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V4 and V3:
-  1.  Combine the 2 const into an enum.
v3: https://lore.kernel.org/all/20240716082851.18173-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1.  "ekth6915" isn't a fallback, modify it.
v2: https://lore.kernel.org/all/20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1.  Respin the series on top of v6.10.
v1: https://lore.kernel.org/all/20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index a62916d07a08..cb3e1801b0d3 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -23,7 +23,9 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
-      - const: elan,ekth6915
+      - enum:
+          - elan,ekth6915
+          - elan,ekth6a12nay
 
   reg:
     const: 0x10
-- 
2.17.1

