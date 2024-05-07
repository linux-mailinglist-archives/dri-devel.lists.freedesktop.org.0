Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AB8BE4C3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130010FAA2;
	Tue,  7 May 2024 13:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="i80ks9bg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AEC1127BA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:53:10 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5ac61cf3fffso1630174eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715089990; x=1715694790; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2z1QkSBs0nA42hb74SyIgvtKZtxxal/ZiPAbUcGcnI=;
 b=i80ks9bg3iG04y8ORP3iARv0J88lVWKA3ujxlhqxmxqCez5URHwwLniKNDQT2rCJmP
 xI+H7brDxnsmqKgRudmlE3lnEM8YN6TVpJ+PEH0B+GivW95m4tYNf8n35R6wbS3YDa8n
 ITGtDvSyD7H1y36ww90btCkKnmArBw83Sfht5JL+U86mti7EGjz1bPg8rDpU+5ud4NKo
 Z2FWMR2SG8OiuSAWGk5+DBjVItxBdOTA0p7g+yUe1wANMj2f3Cv7XgK2GnHTKJ6Ra914
 IDXCvyiVJzbYr/bW5fmljybtcNLTfjituHjIaThEHFB7vUfI/lN0/P7O8e4R+KCJOQ4y
 k/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089990; x=1715694790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2z1QkSBs0nA42hb74SyIgvtKZtxxal/ZiPAbUcGcnI=;
 b=YmUqsZUe3rxu2cQBPzSZGIHpm1f7f7aMFF9evWZDI5uXqiMLnHlw2FdKhM0mhW+eo5
 +oRRLMBncsYUhPp9tDf+7yrdjRqoqY5jBK3PgOyfZFxX5Ff5FoE/+3//mFJX/64BAaku
 q2N6dynYS80DdSceP1qSjXF3JmgtfJvazGOlJeh7Lzlfini4eGyviZRvx2c1G8m7mqNt
 36bo7ocQMLBV2luRacNVhQKjfBtIx1AC6GXAGdoq+Fo5W3C720Ri24upCJJWOAzxUIWV
 ndSHtAaM9QC41QnKhL1TrNMxMisYbJklzaEuqUp0ylcbwHzpoBQUOW3uIMGCHKVTN+S1
 9bbw==
X-Gm-Message-State: AOJu0Yy0EP6GgqIVG0arY7oDiL2QswiTuUJPfPyHDbcspwc22thooXty
 l20CSqFcsMrAF92UQediFnK9vJjyTrCv9Q3AcOtIc5piWl5dZyJ24tvSN7ERjxg=
X-Google-Smtp-Source: AGHT+IFXxq05MR6gPOSKc/twlPaMrS5Vu0444OOxUsgUZHAMSCm2oDtimDy7edXRikytf3AAui17FQ==
X-Received: by 2002:a05:6359:a381:b0:183:f62e:5d21 with SMTP id
 ky1-20020a056359a38100b00183f62e5d21mr15961201rwc.7.1715089989991; 
 Tue, 07 May 2024 06:53:09 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a63e007000000b005dc8702f0a9sm9850542pgh.1.2024.05.07.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:53:09 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v4 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Tue,  7 May 2024 21:52:31 +0800
Message-Id: <20240507135234.1356855-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
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
---
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
index 7cd720eb4981..53a6ace75ada 100644
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

