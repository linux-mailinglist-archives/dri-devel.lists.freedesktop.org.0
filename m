Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70EF8C5EE5
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 03:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C5810E6B3;
	Wed, 15 May 2024 01:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="TLzZ1vKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072E610E320
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 01:47:07 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1eecc71311eso52589795ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715737627; x=1716342427; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HY2J/IHNT9VBahxPZDvJ2CAQ+h9iFMMF2YRGy2pIyWc=;
 b=TLzZ1vKXf0OotPXKJOLckOf2S+voIkcT6jYyvJuPTFpVn8mV+MyMcA9GD+ryMuw6vG
 ih2nU/42Bs4GOZZ6j34cAsP871pNfUAm2XijKiLGNaL7jlFM4G6tIcg34z0j0wqWPM/0
 F1jJhjfadqItyaKZrGam9lLAN6E21YIhx/YbjMygB5VnbfcEfuJhggq4u8RQ0JjpZ6RP
 BFu1ErdKaNXKtWdl6x5PZiiDZyMwje75SNx1n6yI87kX1y/Zd7pEVkrLB0gzk40WzXxj
 tGhPxDznkmikqhtWzlcaXQ61LQ45e8DR3M+cZgLvrWXiDgtMazb9YHHYsjgxl0GyP2se
 Z14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715737627; x=1716342427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HY2J/IHNT9VBahxPZDvJ2CAQ+h9iFMMF2YRGy2pIyWc=;
 b=NgadBdgKa68Aje/SMHdmHCTY9K2SgwlXCHkJLzzqMQFPhaBFIUv4mIrO+dFJdznffh
 sgNag/rEBmJdRIaWuEWlJj3fvxp1fXoVBNn4fqBM5MYipJSjD8l/S+OwWZ5WfG2Fx+Jh
 ZwshPEDJcQuZyqWwabkUkJVweaa0kGQFqR82JJJz6MwY+BIDeYLjkcp46pko2/fLxKJ7
 LPdVO7uW8dmFj2kodnQBfAPoDgCNWMEyrsQj9hKjbOxdt0Uh6oHm5LSnUGk6jJLv13UO
 msvxa033QJ/uwP8KE/7xE0HlliK3PKB22pCmRjCA4ep0eGpfDIuHVed56GJHroEoSqO8
 7mWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiIJu/kBA6Qw+3qHVRTaby0s1AkOA9GqQ+crWKJ+VifC46ZnckXlSQOnFmhi9xLB1EQhq/aHHbDDKyIpRDtbypgcHMUK4HQERtdmvCOwuI
X-Gm-Message-State: AOJu0YwHOuGpVyYYH/kdAumX2e6mJBK35Ds/qJ1JmGl0oxi5JE6kKcGH
 MxC7p6U2486MrOOBelbIGwd7k2ylrY90th5Uv1oK1jnJagqF40oYrpJ9WXayezg=
X-Google-Smtp-Source: AGHT+IHJXcRyQL6x73F2cBO7BZMI3F1AWn3WWlR71b6YQqfpI0410xlRBcxMXjI21oAZuo2Mb4BDQA==
X-Received: by 2002:a17:902:e843:b0:1f0:82b7:71a7 with SMTP id
 d9443c01a7336-1f082b772camr65259705ad.22.1715737627355; 
 Tue, 14 May 2024 18:47:07 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c1368desm105582145ad.233.2024.05.14.18.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 18:47:07 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [v7 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Wed, 15 May 2024 09:46:40 +0800
Message-Id: <20240515014643.2715010-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
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

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Chage since V7:

- No change.

V6: https://lore.kernel.org/all/20240511021326.288728-5-yangcong5@huaqin.corp-partner.google.com

Chage since V6:

- No change.

V5: https://lore.kernel.org/all/20240509015207.3271370-5-yangcong5@huaqin.corp-partner.google.com

Chage since V5:

- No change.

V4: https://lore.kernel.org/all/20240507135234.1356855-5-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- No change.

V3: https://lore.kernel.org/all/20240424023010.2099949-5-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com

---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index fc584b5088ff..baf8b053e375 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -16,6 +16,8 @@ properties:
   compatible:
     items:
       - enum:
+          # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
+          - boe,nv110wum-l60
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.25.1

