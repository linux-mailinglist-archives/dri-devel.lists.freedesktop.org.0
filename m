Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E189C8C0957
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 03:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154BC10E2EA;
	Thu,  9 May 2024 01:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1eRHUKRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650C10E347
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 01:53:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ee5235f5c9so2576745ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 18:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715219592; x=1715824392; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lx35MtfPKU1z5v4/AzGpN1bIj57li6ybeEXD3S52BqY=;
 b=1eRHUKRpIfiqGRvnoG6JJE5GG5mm3/TkbiVkbkEpix+vF7l5XuDBNSTD8P/mVzEZmy
 4V258ZHcrX1POWAyUZ4Az4BO7uHzbLjB5Wnf7e6gUGpewk305TQxZzStS9pdL/MRqsbK
 UbmBXXbhthg9EEr09L8s5aT9+FckkqqrPPf75JLLZJLfaPJZwoKnfi7TObTZaiWjicgH
 tjkMDejNpMd84dzzjbdb0XyRxXXucs76DWqUvWwVaZqjZjoFiL2ffzywCOvbIEJVhek/
 N96viPK0I17ZH4qBgzewGuMnwqr198NscCUhiONDj31EACzyUXwWbDjd5OvNoub26ijp
 Dz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715219592; x=1715824392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lx35MtfPKU1z5v4/AzGpN1bIj57li6ybeEXD3S52BqY=;
 b=HPelnXvEmoqERkwTAG+pkmdsdVJOM17g3tfNF5fyC9blYd/02lKYR/qW7peZ7oFPor
 v5N9rJ6wQHHv5Oz3Eln7WSkinCvq5GwzrcD0uxC3lMx4gxtXC9TScLkfNHc/+QFliRiY
 Cl+ptyk8IVrhR81l8wS7FF2CNmH0ZKmvuNy4F//kauCUzWK98LFZGZBRqZXbrjpMgc3b
 4AID/GZXmKk44edFBrqH76oGRFRKOOFdR8DA7uJfiWwUwi/o0v14v36URiypzzpGBEmg
 VRczk58diAjGj4YWtSoS9ry4cV6dwWaN7mhq2Iu3b4BracYKVfQyRALRgI/z7PleZOQ5
 AByA==
X-Gm-Message-State: AOJu0YxK0wiVPotQoQQaM0OmL3NavCCzkR8R8a+lplAyhTEQyVwZizmT
 RIq0nPEcrzeJzdH+/lHgMhtQKy6O/6dAG7bDHaUILlkp4eI11R0EeR/3wyhPWMk=
X-Google-Smtp-Source: AGHT+IHJSZFIfS5xEh0VYynEI+hNT8DbM98p64k5a8t/tHhPiGVa1E/Bp9MzbasyxjF78NI1dQYQSQ==
X-Received: by 2002:a17:903:1212:b0:1eb:5344:6a01 with SMTP id
 d9443c01a7336-1eeb09ae715mr55580745ad.44.1715219591726; 
 Wed, 08 May 2024 18:53:11 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d15dfsm2117465ad.62.2024.05.08.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 18:53:11 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Thu,  9 May 2024 09:52:04 +0800
Message-Id: <20240509015207.3271370-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
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

