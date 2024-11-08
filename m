Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E49C3094
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247D10E122;
	Sun, 10 Nov 2024 02:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpoyxu7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988C110EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7240d93fffdso1740381b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096316; x=1731701116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9B9/uFLOOn4ZbNcTo/txJrGhuvZT2A1CoYSagunaXMA=;
 b=hpoyxu7htF7KKLhpkEH6SRzgbYBOsQ6GWVjM+U8kREZ9jA7BzsfWf5Zn8wE/GcZasR
 1yImo76UQsonAcqqUOhIV+e+k2EcajNyQeksojweVy5kdmIaYpgDHaDSGSkPRPHBs2fM
 rT9acmtwKqeehUVZv/dx2yKZf/Ycew8WzU0IUpVa1RNQJfkkGkGb5znYI81A62EWBizD
 LaD/YJaLK6dyn0Vza5Vj0TW1O3H2ChlqCVdUdmiM3mzDs8NVDaQ6d9AmCStyz0lhnUJK
 Ku4D5/HbzVtG6p/NvjlgPO1sKKGKIh3WtPU4+HOZ7A70K7o32DhSLMX6V0LtNDw1BrIe
 br1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096316; x=1731701116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9B9/uFLOOn4ZbNcTo/txJrGhuvZT2A1CoYSagunaXMA=;
 b=iBpZ97wgh8kAkbvaHCD/JAf/v66lkS96x+pMWR5YoDi+95QcRaccmNEoe8CWRA9Z+E
 y6CaHZVEWhLoOKRg/bwRFmzyi3txtNFPRLu+T2sZStmCD4f6CF5rVt7n1mUPEGCL7roi
 rD25ka5fsoXQzd9kdJS1KnfwHFhtPxpt+GD10hABiSwUxpi8Ly/kG9DAOngsMEpCaXby
 uKhIbNfkFgj2crjVpIITHwQZ+YYdI5cVucQQ+PWb7PgjCdZOcNRXlpOsQF7ey89yI3yy
 tD3Jgi7Xn+2cZxq0hKtT0sj19rCa9fH9+vXl23gqqBP9uUFOWn4aVgo7rs/51AXN2ZPU
 egew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt/E1GbKmKfklAFNd7jgJR6kPFcX5D7YJ3s9J9Y+R4P6zwFTtRtdVms3jP6ofgq2zrCxHjjCGDJrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf/pbsZWFQE9TL8sWzXpA+HO3F4p64vfH21WvgpBsP4oQSIaIF
 prx5tRneSD/QFMdN7RjfAsQTJgWI/v6BU4yJotrJ1QF8RSYuHE1d
X-Google-Smtp-Source: AGHT+IE2Lablg6vylck0Olus5bD9lVpuXjOXJcDcWvk1Zob64wzNSD+el3H/ILETLAkH9z2RBYMEqw==
X-Received: by 2002:a05:6a00:4f93:b0:71e:6c65:e7c4 with SMTP id
 d2e1a72fcca58-7241339e122mr4768961b3a.26.1731096316086; 
 Fri, 08 Nov 2024 12:05:16 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:15 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: display: bridge: lvds-codec: add
 doestek, dtc34lm85am
Date: Fri,  8 Nov 2024 20:04:32 +0000
Message-ID: <20241108200440.7562-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e..a8df7e919 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

