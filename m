Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF28C095A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 03:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479510E2F3;
	Thu,  9 May 2024 01:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="VM3vAxg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256B10E2F3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 01:53:18 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1eecc71311eso2587125ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 18:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715219598; x=1715824398; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHqHiQyAVeHyVJ0K9DBhYgyNwQ4VRoYKxLN88oizGgE=;
 b=VM3vAxg8JL9FFwEiL8TIGjGZrPOJtk9YerHA8xh2EZWpCQBAldLdM7lbR/j8SlYCjC
 bWwBUOrAhfEime0uCwKIN5tk5qBk5BhkeRW58lV3j+l5G2khttbwxZSmxv1ccHkzNoCa
 /XWJrsaaOVrtegbzCPxBXj3Xeow4tbyTaoxKeJYot27/phxZGzulElIRZ/wpkpsGHUFG
 O94M+w+yWm2k5tYndz2tLHnU4ufkICWnAWt66zdRN7xTA+uazL84l9UtQq7BB+4tjVRJ
 z4F0VAlRxKO001RTVqIchiOAZ9UpI4VAAxTnN/u2aryvxBit55ySxjaHQKVW3WrXQGTM
 rTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715219598; x=1715824398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHqHiQyAVeHyVJ0K9DBhYgyNwQ4VRoYKxLN88oizGgE=;
 b=YDCY1c5Ip5sNH6hU8HuacFPmf25RilQw/dUS36mDcFa2j7wY0TbsUUyj/fJvTYg2Ph
 9ln5MtcdLu3YRSeax0qSGmI8mjBBRT0xeDPxXmZNvJ9nThte+UWlU31N4SgFb6kvSI05
 4YMsMEteGI7cAEM+W2S9ntvguWM7p8BBsQfy9nxn1+NdwY8oO9XpxmfdIBy6lkxfnou5
 DMg/2ih0/Cxo+yEla7whDP9zIELAy5PwZXjkv5w3eP7I9tEb6EMkF60vTXkIM7bFuznE
 WZEM9GdG4kDCi/S09jkwyPoBKjdS5w42/l9Q8mf4jhgvQNLfq9ZFV85HseYxR2YkmV+6
 KEhQ==
X-Gm-Message-State: AOJu0YwKkdADi0Qjlvys5qQOjm/xeEq8iwqkDYuMoQ9H4kVmj3Tjxwhy
 Q4zh/R7RbnVT/wJNwNuS0d49v1qF1qEU15pp27HdhNyFtj5RR+R5g/GQFY0XluU=
X-Google-Smtp-Source: AGHT+IEhZ2pJBCfl1DKT6ud+R8/fivFjIpNW18fFmRukQkFcf5Rle+Flry48GAdfWk+93kBhW++3Ng==
X-Received: by 2002:a17:902:ce8b:b0:1e6:7732:a180 with SMTP id
 d9443c01a7336-1eeb078ffb8mr55322735ad.50.1715219597814; 
 Wed, 08 May 2024 18:53:17 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d15dfsm2117465ad.62.2024.05.08.18.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 18:53:17 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Thu,  9 May 2024 09:52:06 +0800
Message-Id: <20240509015207.3271370-7-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Chage since V5:

- No change.

V4: https://lore.kernel.org/all/20240507135234.1356855-7-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- No change.

V3: https://lore.kernel.org/all/20240424023010.2099949-7-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-7-yangcong5@huaqin.corp-partner.google.com/

---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index baf8b053e375..c649fb085833 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -18,6 +18,8 @@ properties:
       - enum:
           # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
           - boe,nv110wum-l60
+          # IVO t109nw41 11.0" WUXGA TFT LCD panel
+          - ivo,t109nw41
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.25.1

