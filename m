Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01D9B2CCA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75810E136;
	Mon, 28 Oct 2024 10:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j3MwMwmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C1210E460
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so6472036a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111181; x=1730715981;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ub+YOxTaEj8h3/OEhQEBYuD58+vmy3bTawAxFBvQf9I=;
 b=j3MwMwmzZXI/N8orcxQYcoMGfQpXvRe6hlCAYq92mNT8bZaV/CNHfKLi+T4vJtP5m0
 6jWYhxgHDMvYJnkzIJbiP1/X0XEbCh9bM2dO1ExsT8s36JHM4buTU0FrT8pGGpul0zag
 JsIqwk5oIEJMfu9FtOK0L5O5uzNbng+PwkP5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111181; x=1730715981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ub+YOxTaEj8h3/OEhQEBYuD58+vmy3bTawAxFBvQf9I=;
 b=Q0MEnnOR79neE1P0AwRLXtDDixcmJAP32PUrfcHD0P2Z+q7XqEJqb0L//jiXaWC/jK
 iQJLdSQqaN73kp2n6M3jV/3vAJevkkyiXLqc59HuydxZBVnzjWhSGJu2HRFZ9gnmJtyV
 HvjIeYYe47DOxP1heHj7AAA002Fm+ovOSd81/WpnUzAX/oe1PSUap+ucleRW+sH/xNT2
 0ne9harOjFi1qNbZQQkA1CwMveyncQnhO94TYu3XyOHd/u88QzGCgA4vDLpsT2TLvdS1
 L/OsVnYiEw7eNiqVP1tqYG7iqXG+Vu1myThOU8sgRPH0CTBLsk3+xRIYuINcQfzENcFV
 GAKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKuYyKlL5JjeV3/QKGKDuKVXgKKQqqOGpZqxU0MhNxKzgYrK7C1IW19rPukhbGWK8jsUBfuaD2NzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmbDAjJeZb1sCiByCdELgfSn1V1V7uCWtQNloPXhaQZU5sTsjr
 bZzo5iTDy0dhCWB6R900rFiIs48Jqtu2JBtU2yJ27JsMcNE/x5tiLCEeJnrt/+s=
X-Google-Smtp-Source: AGHT+IFjWfGueG7DeWkg63IGIF3kssQUY3V3Yt1YYtp6Z+uW3KJqsSXoNAzX7zrD1vHGbOebgF05zQ==
X-Received: by 2002:a17:907:3f9d:b0:a9a:1160:993 with SMTP id
 a640c23a62f3a-a9de5c91c9dmr860387966b.8.1730111180788; 
 Mon, 28 Oct 2024 03:26:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 07/10] dt-bindings: bridge: samsung-dsim: add 'samsung,
 boot-on' property
Date: Mon, 28 Oct 2024 11:25:30 +0100
Message-ID: <20241028102559.1451383-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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

The property states that the bridge controller has been initialized and
left on by the bootloader. This information becomes relevant in the case
of supporting the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/display/bridge/samsung,mipi-dsim.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 4ed7a799ba26..34cd93bc41f9 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -132,6 +132,11 @@ properties:
             dependencies:
               lane-polarities: [data-lanes]
 
+  samsung,boot-on:
+    description:
+      The bridge has been initialized and left on by the bootloader/firmware.
+    type: boolean
+
 required:
   - clock-names
   - clocks
-- 
2.43.0

