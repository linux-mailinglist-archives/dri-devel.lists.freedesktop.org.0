Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5668AFE6F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD71810FD71;
	Wed, 24 Apr 2024 02:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="I8eCb/mW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B954B10FD71
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:30:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6eb797e10ceso3730629a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925845; x=1714530645; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXmJm2NMpNKGR8PSeY0Ah/qGmxvBFTcFz2XA2cO9qmI=;
 b=I8eCb/mWt2WR3k+H0olx3T//U1LdvNtwtF8FqRsfBWQ2r2f6TRnHI1F/B8hSjrJomN
 wvdaqQc31pYZ2Gz/YuWsJfUCYhcF3u3LkaYj8KHFHxo6cv5OOv2h3pk/aJUcJ1ZBsHp8
 Pjc6Vge8/v1ewD2w97Ju92A6xWf7IOrMB7dQ4LrS7Kw0Jzp1fseKb8Hy93UYV2pDq49u
 O2EBM0D6DX6UfxpfiPVXtzlFXh1c1u3lH6vXbcFi2BWqQfmLluI6xXgPw3rLGBNcxWvF
 PISUn7v3E9T/AStg3uxbZSQ+2qAxfsV6XPwl9no7YH1RmG+otIW5tjmenwLzehw0xhaO
 VNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925845; x=1714530645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXmJm2NMpNKGR8PSeY0Ah/qGmxvBFTcFz2XA2cO9qmI=;
 b=N6ycviw+cXDSUxOVbwtwPXBkOB5TcChf/i82qKTVyRSxxtVjWstVfy89T+71w2hc/6
 yS8oCmBWObR5nVi+BSDR5eYo2Jn2XfpU2S5gzXjQFGpYCaw+SJSvq3AYWRZ5dTq/tEnE
 w0P/ZHFEUjWsgzUvINdspKQD7QVf5c9nFLaBmZu1D7ERnRgqIlArGvw+TQRQyr+WYErp
 nvDFHIl4ukWgW7BFoaT3izL9zBRXreCBCKL1lzkA8g6yIwQJKH8rniNxeOs+1a+a1Xzw
 tYuw4d1dD8FEmPcowYHzLkJdPgUdJ7oKqeUnBnXfOP4evL8VBCNiiFCCfk7OHKenhnHB
 zTjg==
X-Gm-Message-State: AOJu0YxgpMtUU/8yx2CSR1ikBpxJw/YX1wOmqoEFs2d3hdbWxryAb1ki
 WxpdfzmZUCr3WybgtKMq4XW/G01rVDZo4vL0XrQg5JzKEPdX+YEPjyZz3cpu/C0=
X-Google-Smtp-Source: AGHT+IEW6VXq5gavNys3PRgDLFnQS4DFaEAkzMskWMoOdL1EwONALpRuNCnWCo0K36xClb94MH+pUA==
X-Received: by 2002:a05:6830:1499:b0:6eb:6046:ff17 with SMTP id
 s25-20020a056830149900b006eb6046ff17mr1582208otq.36.1713925844933; 
 Tue, 23 Apr 2024 19:30:44 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:44 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Wed, 24 Apr 2024 10:30:07 +0800
Message-Id: <20240424023010.2099949-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
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
Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com

---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 2e0cd6998ba8..86c349bbbb7b 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+        # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
+      - boe,nv110wum-l60
         # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
       - starry,himax83102-j02
 
-- 
2.25.1

