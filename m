Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B099AD161
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077910E830;
	Wed, 23 Oct 2024 16:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="O0ZMN9MC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C6310E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso60309215e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702217; x=1730307017;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CAjOVOm4fq5ab1k5/gNzUlva5QRzYnK+y6SB2b/LE7w=;
 b=O0ZMN9MCxOigx6KtuoD80cB3TZ6/j1e/ud14FHOs5SlXqN6+qesyjtx23lUIYn/8gy
 3QoNBnH7ew/ZubD1GNAJ4iBGgwqh9sQH617fElKplgn507pdvkvsWTP7g3irp4o0GR3H
 7Sj6w6jCU71ylFRUV4MwZzGJGz9dgwFK1dLk6imXsjyUUn3UU015Dk+ghwsONY24pHwo
 Lu1EYwUdFmCRq+6gwXN1LhjWUmnjduGUTl85DNgWMphhV0xmiJC1KI4lgGHstFpntph3
 hmMeastoNqy2r9J71ezsrfPOC01ZnUOrCOA1QBWE9m4+LeY6Mq0aEch/eBI2YbTGppdr
 XI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702217; x=1730307017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAjOVOm4fq5ab1k5/gNzUlva5QRzYnK+y6SB2b/LE7w=;
 b=W8I+EW4+8Pqimoa/oaTRD9+OfbO5fSAfRCcIsznRFH5z0V8tFoo9Nu8MDPBSVvUaXQ
 eAnkbJFBgsegJcwZM7YH7hxjjq0j/UEDek/Ep03dyHLa8aGGGgcMjMsx5T8Re8CBi03Z
 f7j4aYbeMMEqiFfoOxxolpODZOE/SdllNn9t4Xu43i1Yyp5QwIfvtSDEHr2cFaUSCEig
 Eqoq1s9yGQ3PGoHB/mIygCV977WkKNlVf2YjRJdWGpKFn87KBg8VJos0G4jHTc2KfveG
 iFIenejYlBH6b9ljiczUO1eRxhlXPrPnHs0JER39krWaMZI5mcZV/mvI7fuPOlEMG530
 JFpw==
X-Gm-Message-State: AOJu0YxwnSZCZNMYnc+PDnkpx3O2gTxP0A11V/Da6JGH3QzQLNM4fTQy
 bt2EeO7z1ASYc0X90lHMLnmxnh1Fx2lZT95F/B26UxwFr1SXmLfXsWtOLiMwKKU=
X-Google-Smtp-Source: AGHT+IHVp9QeS4FFrjIcAc7te/fMFNp+o2nMTjsFY0IqZ4kCDK5fJrYCjN0EL5R16sqRCOtTkRC5yw==
X-Received: by 2002:a05:600c:6b06:b0:431:557e:b40c with SMTP id
 5b1f17b1804b1-43184241fa3mr29032185e9.27.1729702216599; 
 Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:06 +0100
Subject: [PATCH 09/37] dt-bindings: display: Add BCM2712 KMS driver
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-9-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 SoC comes with a new variation of the videocore display
pipeline. Let's create a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..2aa9d5d2afff 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-vc5
+      - brcm,bcm2712-vc6
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 

-- 
2.34.1

